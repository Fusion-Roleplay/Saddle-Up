if IsDuplicityVersion() then
    --[[
        Server Side
    ]]
    RedEM = exports["redem_roleplay"]:RedEM()
    
    data = {}
    TriggerEvent("redemrp_inventory:getData",function(call)
		data = call
    end)
    
    function FXRegisterCallback(eventName, callBack)
        RedEM.RegisterCallback(eventName, function(source, cb, ...)
            callBack(source,cb,...)
        end)
    end
    
    function FXCloseInventory(src)
        TriggerClientEvent("redemrp_inventory:closeinv", src)
    end
    
    function FXRemoveItem(src,itemName,itemCount,Metadata)
        local ItemData = data.getItem(src, itemName) 
        ItemData.RemoveItem(itemCount, Metadata)
    end
    
    function FXCanCarry(src,item,count)
        return true
    end
    
    function FXAddItem(src,itemName,itemCount,Metadata)
        local ItemData = data.getItem(src, itemName) 
        ItemData.AddItem(itemCount, Metadata)
    end
    
    function FXGetItemCount(src,ItemName)
        local ItemData = data.getItem(src, ItemName) 
        local count = ItemData.ItemAmount
        return count
    end
    function FXRemoveMoney(src,count)
        local Player = RedEM.GetPlayer(src)
        Player.RemoveMoney(count)
    end
    function FXAddMoney(src,count)
        local Player = RedEM.GetPlayer(src)
        Player.AddMoney(count)
    end

    function FXGetPlayerMoney(src)
        local Player = RedEM.GetPlayer(src)
        return Player.money
    end
    function FXGetPlayerData(src)
        local Character = RedEM.GetPlayer(src)
        local array = {
            firstname = Character.firstname,
            lastname = Character.lastname,
            job = Character.job,
            grade = Character.jobgrade,
        }
        return array
    end

else
--[[
    Client Side
]]    

    RedEM = exports["redem_roleplay"]:RedEM()

    function FXTriggerServerCallback(eventName,callBack,...)
        RedEM.TriggerCallback(eventName,function(...)
            callBack(...)
        end,...)
    end
end