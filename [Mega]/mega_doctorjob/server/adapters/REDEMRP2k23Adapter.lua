-- To write your own adapter for your framework follow the guidelines in 
-- https://docs.megaworks.dev/en/MegaDoctorjob/Adapters

-- RedEM:RP 2023 Adapter --

if Config.framework == 'redemrp2k23' then
    print('>> RedEM:RP v2023 Adapter Enabled')
    Inventory = {}

    TriggerEvent("redemrp_inventory:getData", function (data)
        Inventory = data
    end)

    local RedEM = exports["redem_roleplay"]:RedEM()
    
    function ResurrectPlayer(targetID) 
        TriggerEvent("redemrp_respawn:client:Revived", targetID)
    end
    
    function GetCharJob(targetID) 
        return RedEM.GetPlayer(targetID).job
    end
    
    function GetCharIdentifier(targetID)
        return RedEM.GetPlayer(targetID).identifier
    end
    
    function GetCharFirstname(targetID)
        return RedEM.GetPlayer(targetID).firstname
    end
    
    function GetCharLastname(targetID)
        return RedEM.GetPlayer(targetID).lastname
    end
    
    function GetCharMoney(targetID)
        return RedEM.GetPlayer(targetID).money
    end
    
    function RemoveCurrency(targetID, currency, amount)
        RedEM.GetPlayer(targetID).RemoveMoney(tonumber(amount))
    end
    
    function GetCharGroup(targetID)
        return RedEM.GetPlayer(targetID).group
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
                    local job = RedEM.GetPlayer(source).job
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
                    local job = RedEM.GetPlayer(source).job
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

-- END RedEM:RP 2023 Adapter --