-- To write your own adapter for your framework follow the guidelines in 
-- https://docs.megaworks.dev/en/MegaDoctorjob/Adapters

-- VORPCore Adapter --

if Config.framework == 'vorp' then
    print('>> VORP Adapter Enabled')
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()
    
    local VorpCore = {}
    
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)
    
    function ResurrectPlayer(targetID) 
        TriggerClientEvent('vorp:resurrectPlayer', targetID)
    end
    
    function GetCharJob(targetID) 
        return VorpCore.getUser(targetID).getUsedCharacter.job
    end
    
    function GetCharIdentifier(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.charIdentifier
    end
    
    function GetCharFirstname(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.firstname
    end
    
    function GetCharLastname(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.lastname
    end
    
    function GetCharMoney(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.money
    end
    
    function RemoveCurrency(targetID, currency, amount)
        VorpCore.getUser(targetID).getUsedCharacter.removeCurrency(currency, amount)
    end
    
    function GetCharGroup(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.group
    end
    
    -- This registers all the usable items that are used by the script, 
    -- You have to adjust all the code to fit your framework properly
    function RegisterUsableItems()
        for itemName, item in pairs(MedicineItems) do
            if Config.printLogs then
                print('>> registered item: ' .. itemName)
            end
            VorpInv.RegisterUsableItem(itemName, function (data)
                local itemConfig = MedicineItems[itemName]
                if itemConfig.allowedJobs then
                    local char = VorpCore.getUser(data.source).getUsedCharacter
                    if not contains(itemConfig.allowedJobs, char.job) then
                        TriggerClientEvent('mega_notify:notifyRight', data.source, Config.language.notificationTitle, Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end
                TriggerClientEvent('mega_doctorjob:healItemUsed', data.source, itemName)
                VorpInv.CloseInv(data.source)
                VorpInv.subItem(data.source, itemName, 1)
            end)
        end
        for itemName, item in pairs(ReviveItems) do
            if Config.printLogs then
                print('>> registered revive item: ' .. itemName)
            end
            VorpInv.RegisterUsableItem(itemName, function (data)
                local itemConfig = ReviveItems[itemName]
                if itemConfig.allowedJobs then
                    local char = VorpCore.getUser(data.source).getUsedCharacter
                    if not contains(itemConfig.allowedJobs, char.job) then
                        TriggerClientEvent('mega_notify:notifyRight', data.source, Config.language.notificationTitle, Config.language.unableToUseItem, 5000, 'health')
                        return
                    end
                end
                TriggerClientEvent('mega_doctorjob:reviveItemUsed', data.source, itemName)
                VorpInv.CloseInv(data.source)
                VorpInv.subItem(data.source, itemName, 1)
            end)
        end
    end
end

-- END VorpCore Adapter --