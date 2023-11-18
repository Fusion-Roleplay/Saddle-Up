-- To write your own adapter for your framework follow the guidelines in
-- https://docs.megaworks.dev/en/MegaDoctorjob/Adapters

-- QBR-CORE Adapter --

if Config.framework == 'qbr-core' then
    print('>> QBR-Core Adapter Enabled')

    function ResurrectPlayer(targetID)
        targetID = tonumber(targetID)
        TriggerServerEvent('hospital:client:Revive', targetID)
    end

    function GetCharJob(targetID)
        targetID = tonumber(targetID)
        if not exports['qbr-core']:GetPlayer(targetID).PlayerData.job.onduty then
            return ''
        end
        return exports['qbr-core']:GetPlayer(targetID).PlayerData.job.name
    end

    function GetCharIdentifier(targetID)
        targetID = tonumber(targetID)
        return exports['qbr-core']:GetPlayer(targetID).PlayerData.citizenid
    end

    function GetCharFirstname(targetID)
        targetID = tonumber(targetID)
        return exports['qbr-core']:GetPlayer(targetID).PlayerData.charinfo.firstname
    end

    function GetCharLastname(targetID)
        targetID = tonumber(targetID)
        return exports['qbr-core']:GetPlayer(targetID).PlayerData.charinfo.lastname
    end

    function GetCharMoney(targetID)
        targetID = tonumber(targetID)
        return exports['qbr-core']:GetPlayer(targetID).PlayerData.money["cash"]
    end

    function RemoveCurrency(targetID, currency, amount)
        targetID = tonumber(targetID)
        local Player = exports['qbr-core']:GetPlayer(src)

        if currency == 0 then
            Player.Functions.RemoveMoney("cash", amount)
        elseif currency == 1 then
            Player.Functions.RemoveMoney("bank", amount)
        end
    end

    function GetCharGroup(targetID)
        targetID = tonumber(targetID)
        local permissions = QBCore.Functions.GetPermissions(targetID)
        for k, v in pairs(permissions) do
            return k
        end
    end

    function GetPatientNotes(charid)
        local notes = exports.oxmysql:query_async([[
            SELECT hospital.hospital,
            hospital_notes.note_id,
            hospital_notes.written_by,
            hospital_notes.date,
            hospital_notes.note,
            hospital_notes.patient,
            players.name
            FROM hospital
            LEFT JOIN hospital_notes ON hospital.hospital = hospital_notes.hospital
            LEFT JOIN players ON players.citizenid = hospital_notes.written_by
            WHERE hospital_notes.patient = ?
        ]], { charid })
        for k, v in pairs(notes) do
            HospitalsManager.hospitals[v.hospital]:addNote(
                Note:new(v.note_id, v.written_by, v.patient, v.firstname, v.lastname,
                    os.date('%d %b', v.date), v.note)
            )
        end
    end

    -- This registers all the usable items that are used by the script,
    -- You have to adjust all the code to fit your framework properly
    function RegisterUsableItems()
        for itemName, item in pairs(MedicineItems) do
            if Config.printLogs then
                print('>> registered item: ' .. itemName)
            end
            QBCore.Functions.CreateUseableItem(itemName, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                if not Player.Functions.GetItemByName(item.name) then return end
                -- Trigger code here for what item should do

                local itemConfig = MedicineItems[itemName]
                if itemConfig.allowedJobs then
                    local job = Player.PlayerData.job.name
                    if not contains(itemConfig.allowedJobs, job) then
                        TriggerClientEvent('mega_notify:notifyRight', source, Config.language.notificationTitle,
                            Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end

                TriggerClientEvent('mega_doctorjob:healItemUsed', source, itemName)
                Player.Functions.RemoveItem(item.name, 1, item.slot)
            end)
        end
        for itemName, item in pairs(ReviveItems) do
            if Config.printLogs then
                print('>> registered revive item: ' .. itemName)
            end

            QBCore.Functions.CreateUseableItem(itemName, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                if not Player.Functions.GetItemByName(item.name) then return end
                -- Trigger code here for what item should do

                local itemConfig = ReviveItems[itemName]
                if itemConfig.allowedJobs then
                    local job = Player.PlayerData.job.name
                    if not contains(itemConfig.allowedJobs, job) then
                        TriggerClientEvent('mega_notify:notifyRight', source, Config.language.notificationTitle,
                            Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end
                TriggerClientEvent('mega_doctorjob:reviveItemUsed', source, itemName)
                Player.Functions.RemoveItem(item.name, 1, item.slot)
            end)
        end
    end
end

-- END QBR-CORE Adapter --
