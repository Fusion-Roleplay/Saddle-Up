-- To write your own adapter for your framework follow the guidelines in 
-- https://docs.megaworks.dev/en/MegaDoctorjob/Adapters

-- RedEM:RP PRE 2023 Adapter --

if Config.framework == 'redemrp2022' then
    print('>> RedEM:RP v2022 Adapter Enabled')
    Inventory = {}

    function RetrievePlayer (targetID)
        local Player = {}
        TriggerEvent("redemrp:getPlayerFromId", targetID, function(player)
            print("Job: ", player.getJob())
            Player = player
        end)
        return Player
    end
    
    function ResurrectPlayer(targetID) 
        TriggerEvent("redemrp_respawn:RevivePlayer" , targetID)
    end
    
    function GetCharJob(targetID)
        return RetrievePlayer(targetID).getJob()
    end
    
    function GetCharIdentifier(targetID)
        return RetrievePlayer(targetID).getIdentifier()
    end
    
    function GetCharFirstname(targetID)
        return RetrievePlayer(targetID).getFirstname()
    end
    
    function GetCharLastname(targetID)
        return RetrievePlayer(targetID).getLastname()
    end
    
    function GetCharMoney(targetID)
        return RetrievePlayer(targetID).get("money")
    end
    
    function RemoveCurrency(targetID, currency, amount)
        local Player = RetrievePlayer(targetID)

        if currency == 0 then
            Player.removeMoney(amount)
        elseif currency == 1 then
            Player.removeGold(amount)
        end
    end
    
    function GetCharGroup(targetID)
        return RetrievePlayer(targetID).getGroup()
    end

    function GetPatientNotes(charid)
        local notes = exports.oxmysql:query_async([[
            SELECT hospital.hospital, 
            hospital_notes.note_id,
            hospital_notes.written_by,
            hospital_notes.date,
            hospital_notes.note,
            hospital_notes.patient,
            characters.firstname,
            characters.lastname
            FROM hospital 
            LEFT JOIN hospital_notes ON hospital.hospital = hospital_notes.hospital
            LEFT JOIN characters ON characters.charidentifier = hospital_notes.written_by
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
            RegisterNetEvent("RegisterUsableItem:".. itemName, function (source)
                local itemConfig = MedicineItems[itemName]
                if itemConfig.allowedJobs then
                    local job = GetCharJob(source)
                    if not contains(itemConfig.allowedJobs, job) then
                        TriggerClientEvent('mega_notify:notifyRight', source, Config.language.notificationTitle, Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end
                TriggerClientEvent('mega_doctorjob:healItemUsed', source, itemName)
                TriggerClientEvent("redemrp_inventory:closeinv", source)
                Inventory.getItem(source, itemName).RemoveItem(1)
            end)
        end
        for itemName, item in pairs(ReviveItems) do
            if Config.printLogs then
                print('>> registered revive item: ' .. itemName)
            end
            
            RegisterNetEvent("RegisterUsableItem:" .. itemName, function (source)
                local itemConfig = ReviveItems[itemName]
                if itemConfig.allowedJobs then
                    local job = GetCharJob(source)
                    if not contains(itemConfig.allowedJobs, job) then
                        TriggerClientEvent('mega_notify:notifyRight', source, Config.language.notificationTitle, Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end
                TriggerClientEvent('mega_doctorjob:reviveItemUsed', source, itemName)
                TriggerClientEvent("redemrp_inventory:closeinv", source)
                Inventory.getItem(source, itemName).RemoveItem(1)
            end)
        end
    end
end

-- END RedEM:RP PRE 2023 Adapter --