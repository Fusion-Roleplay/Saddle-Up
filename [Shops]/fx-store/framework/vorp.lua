if IsDuplicityVersion() then
    --[[
        Server Side
    ]]
    VorpCore = {}

    TriggerEvent("getCore", function(core)
        VorpCore = core
    end)

    VorpInv = {}
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()
    
    function FXRegisterUsableItem(itemname,callBack)
        VorpInv.RegisterUsableItem(itemname, function(data)
            local array = {
                source = data.source,
                item = data.item
            }
            callBack(array)
        end)
    end
    
    function FXRegisterCallback(eventName, callBack)
        VorpCore.addRpcCallback(eventName, function(source, cb, ...)
            callBack(source,cb,...)
        end)
    end
    
    function FXCloseInventory(src)
        VorpInv.CloseInv(src)
    end
    
    function FXRemoveItem(src,itemName,itemCount,Metadata)
        VorpInv.subItem(src, itemName, itemCount, Metadata)
    end
    function FXCanCarry(src,item,count)
        return VorpInv.canCarryItem(src, item, count)
    end
    
    function FXAddItem(src,itemName,itemCount,Metadata)
        VorpInv.addItem(src, itemName, itemCount, Metadata)
    end
    
    function FXGetItem(src,ItemName)
        return VorpInv.getItem(src, ItemName)
    end
    function FXRemoveMoney(src,count)
        local User = VorpCore.getUser(src)
        local Character = User.getUsedCharacter
        Character.removeCurrency(0, count)
    end
    function FXAddMoney(src,count)
        local User = VorpCore.getUser(src)
        local Character = User.getUsedCharacter
        Character.addCurrency(0,count)
    end
    function FXGetItemCount(src,ItemName)
        local retval = VorpInv.getItem(src, ItemName)
        return retval and retval.count or 0
    end
    function FXGetPlayerMoney(src)
        local User = VorpCore.getUser(src)
        local Character = User.getUsedCharacter
        return Character.money
    end
    function FXGetPlayerData(src)
        local User = VorpCore.getUser(src)
        local Character = User.getUsedCharacter
        local array = {
            firstname = Character.firstname,
            lastname = Character.lastname,
            job = Character.job,
            grade = Character.jobGrade,
        }
        return array
    end

else
--[[
    Client Side
]]    

    VorpCore = {}
    TriggerEvent("getCore", function(core)
        VorpCore = core
    end)

    function FXTriggerServerCallback(eventName,callBack,...)
        VorpCore.RpcCall(eventName,function(...)
            callBack(...)
        end,...)
    end
end