
--------------------------------------------------------------------------------------------------------------
--------------------------- Underground Ranching Framework Manager -------------------------------------------
--------------------------------------------------------------------------------------------------------------
------------- This file only contains events to make the script compatible with any framework. ---------------
--------------------------------------------------------------------------------------------------------------
-------------------------------------- MANAGE ITEMS ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- This event is used to give items to players.
RegisterServerEvent('Underground:Ranch:GiveAnyItem')
AddEventHandler('Underground:Ranch:GiveAnyItem', function(src, item, count)
    print("GiveAnyItem", src, item, count)
end)

-- This event is used to take items from players.
RegisterServerEvent('Underground:Ranch:TakeAnyItem')
AddEventHandler('Underground:Ranch:TakeAnyItem', function(src, item, count)
    print("TakeAnyItem", src, item, count)
end)

-- check amount of items in inventory
function CheckAmount(src, item, count)
    local itemcount = 10
    if itemcount >= count then
        return true
    else
        return false
    end
end

--------------------------------------------------------------------------------------------------------------
-------------------------------------- MANAGE MONEY ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- This event is used to give money to players.
RegisterServerEvent('Underground:Ranch:GiveMoney')
AddEventHandler('Underground:Ranch:GiveMoney', function(src, money)
    print("GiveMoney", src, money)
end)

-- This event is used to take money from players.
RegisterServerEvent('Underground:Ranch:TakeMoney')
AddEventHandler('Underground:Ranch:TakeMoney', function(src, money)
    print("TakeMoney", src, money)
end)

-- check amount of money in wallet
function CheckMoney(src)
    local wallet = 100000
    return wallet
end
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
