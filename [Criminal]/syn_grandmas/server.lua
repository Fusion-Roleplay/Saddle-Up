TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("syn_grandma:revive")
AddEventHandler("syn_grandma:revive", function(price,gold)
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local playercash = Character.money
    local gold2 = Character.gold
    if gold then 
        if gold2 >= price then 
            Character.removeCurrency(1, price)
            TriggerClientEvent('vorp:resurrectPlayer', _source)
            TriggerClientEvent("vorp:TipRight", _source, Config.Language.healed..price..Config.Language.gold, 5000)
        else
            TriggerClientEvent("vorp:TipRight", _source, Config.Language.nocash, 5000)
        end
    else
        if playercash >= price then 
            Character.removeCurrency(0, price)
            TriggerClientEvent('vorp:resurrectPlayer', _source)
            TriggerClientEvent("vorp:TipRight", _source, Config.Language.healed..price..Config.Language.cash, 5000)
        else
            TriggerClientEvent("vorp:TipRight", _source, Config.Language.nocash, 5000)
        end
    end
end)

--## TENT AND CAMPFIRE ##--

IsTownBanned = function (town)
	for k,v in pairs(Config.BannedTowns) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    VorpInv.RegisterUsableItem("campfire", function(data)
        VorpInv.subItem(data.source, "campfire", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a campfire", 5000)
        TriggerClientEvent("syn:campfire", data.source)
    end)

    VorpInv.RegisterUsableItem("tent", function(data)
        TriggerClientEvent("syn_changingroom:canplace",data.source)
    end)
end)

RegisterNetEvent("syn:puttent")
AddEventHandler("syn:puttent", function()
    local _source = source
    VorpInv.subItem(_source, "tent", 1)
    TriggerClientEvent("vorp:TipRight", _source, "You're placing a tent", 5000)
    TriggerClientEvent("syn:tent", _source)
end)


RegisterNetEvent("syn:additem")
AddEventHandler("syn:additem", function(item)
    local _source = source
    VorpInv.addItem(source, item, 1)
end)
