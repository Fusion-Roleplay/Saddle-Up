if IsDuplicityVersion() then
    --[[
        Server Side
    ]]
    RSGCore = exports['rsg-core']:GetCoreObject()
    function FXRegisterUsableItem(itemname,callBack)
        RSGCore.Functions.CreateUseableItem(itemname, function(source,item)
            local array = {
                source = source,
                item = item
            }
            array.item.metadata = item.info
            callBack(array)
        end)
    end
    
    function FXRegisterCallback(eventName, callBack,...)
        RSGCore.Functions.CreateCallback(eventName, function(source, cb, ...)
            callBack(source,cb,...)
        end)
    end

    function FXCanCarry(src,item,count)
        local Player = RSGCore.Functions.GetPlayer(src)
        local retval = false
        if Player.Functions.AddItem(item, count) then
            retval = true
            Player.Functions.RemoveItem(item, count)
        end
        return retval

    end

    function FXCloseInventory(src)
        TriggerClientEvent("rsg-inventory:client:closeinv", src)
    end
    
    function FXRemoveItem(src,itemName,itemCount,Metadata)
        local Player = RSGCore.Functions.GetPlayer(src)
        local foundslot = false
        for slot,item in pairs(Player.PlayerData.items) do
            if item.name:lower() == itemName:lower() then
                if Metadata then
                    if item.info.privateID == Metadata.privateID then
                        foundslot = slot
                        break
                    end
                else
                    foundslot = slot
                    break
                end
            end
        end
        if not foundslot then return false end
        Player.Functions.RemoveItem(itemName, itemCount,foundslot)
    end
    
    function FXAddItem(src,itemName,itemCount,Metadata)
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(itemName, itemCount,Metadata)
    end
    
    function FXGetItem(src,ItemName)
        local Player = RSGCore.Functions.GetPlayer(src)
        local founditem = false
        for slot,item in pairs(Player.PlayerData.items) do
            if item.name:lower() == ItemName:lower() then
                founditem = item
                break
            end
        end
        return founditem
    end
    function FXRemoveMoney(src,count)
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney('cash',count,"fx-store")
    end
    function FXAddMoney(src,count)
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash',count,"fx-store")
    end
    function FXGetItemCount(src,ItemName)
        local Player = RSGCore.Functions.GetPlayer(src)
        local founditem = 0
        for slot,item in pairs(Player.PlayerData.items) do
            if item.name:lower() == ItemName:lower() then
                founditem = item.count
                break
            end
        end
        return founditem
    end

    function FXGetPlayerMoney(src)
        local Player = RSGCore.Functions.GetPlayer(src)
        return Player.PlayerData.money['cash']
    end
    
  function FXGetPlayerData(src)
        local Player = RSGCore.Functions.GetPlayer(src)
        local array = {
            firstname = Player.PlayerData.charinfo.firstname,
            lastname = Player.PlayerData.charinfo.firstname,
            job = Player.PlayerData.job.name,
            grade = Player.PlayerData.job.grade.level,
        }
        return array
    end

else
--[[
    Client Side
]]    
    RSGCore = exports['rsg-core']:GetCoreObject()   

    function FXTriggerServerCallback(eventName,callBack,...)
        VorpCore.RpcCall(eventName,function(...)
            callBack(...)
        end,...)
    end
end
