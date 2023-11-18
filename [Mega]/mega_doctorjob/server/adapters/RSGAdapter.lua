-- To write your own adapter for your framework follow the guidelines in
-- https://docs.megaworks.dev/en/MegaDoctorjob/Adapters

-- RSG-CORE Adapter --

if Config.framework == 'rsg-core' then
    print('>> RSG-Core Adapter Enabled')
    local CORE = exports['rsg-core']:GetCoreObject()

    function ResurrectPlayer(targetID)
        targetID = tonumber(targetID)
        TriggerClientEvent('rsg-medic:client:playerRevive', targetID)
    end

    function GetCharJob(targetID)
        targetID = tonumber(targetID)
        if not CORE.Functions.GetPlayer(targetID).PlayerData.job.onduty then
            return ''
        end
        return CORE.Functions.GetPlayer(targetID).PlayerData.job.name
    end

    function GetCharIdentifier(targetID)
        targetID = tonumber(targetID)
        return CORE.Functions.GetPlayer(targetID).PlayerData.citizenid
    end

    function GetCharFirstname(targetID)
        targetID = tonumber(targetID)
        return CORE.Functions.GetPlayer(targetID).PlayerData.charinfo.firstname
    end

    function GetCharLastname(targetID)
        targetID = tonumber(targetID)
        return CORE.Functions.GetPlayer(targetID).PlayerData.charinfo.lastname
    end

    function GetCharMoney(targetID)
        targetID = tonumber(targetID)
        return CORE.Functions.GetPlayer(targetID).PlayerData.money["cash"]
    end

    function RemoveCurrency(targetID, currency, amount)
        targetID = tonumber(targetID)
        local Player = CORE.Functions.GetPlayer(targetID)

        if currency == 0 then
            Player.Functions.RemoveMoney("cash", amount)
        elseif currency == 1 then
            Player.Functions.RemoveMoney("bank", amount)
        end
    end

    function GetCharGroup(targetID)
        targetID = tonumber(targetID)
        local permissions = CORE.Functions.GetPermission(targetID)
        for k, v in pairs(permissions) do
            return k
        end
    end

    -- This registers all the usable items that are used by the script,
    -- You have to adjust all the code to fit your framework properly
    function RegisterUsableItems()
        for itemName, item in pairs(MedicineItems) do
            if Config.printLogs then
                print('>> registered item: ' .. itemName)
            end
            CORE.Functions.CreateUseableItem(itemName, function(source, item)
                local Player = CORE.Functions.GetPlayer(source)
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

            CORE.Functions.CreateUseableItem(itemName, function(source, item)
                local Player = CORE.Functions.GetPlayer(source)
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

-- END RSG-CORE Adapter --