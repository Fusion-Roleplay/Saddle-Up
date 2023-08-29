RegisterCommand("buyranch", function()
    local ranchid = 1
    local charid = 1
    TriggerServerEvent("Underground:Ranch:BuyRanch", ranchid, charid)
end)

RegisterCommand("getranches", function()
    TriggerServerEvent('Underground:Ranch:DBGetRanches', 1)
end)

RegisterCommand("textentry", function(source, args, rawCommand)
    SetAnimalName()
end)

RegisterCommand("lobo", function()
    for k,v in pairs(Config.AttackAnimals) do
        TriggerEvent("Underground:Ranch:SendAttackAnimal", v.model, v.color)
    end
end)

RegisterCommand("spawnanimal", function(source, args, rawCommand)
    local model = args[1]
    local skin = args[2]
    local coords = GetEntityCoords(PlayerPedId())
    local ncords = {x = coords.x, y = coords.y, z = coords.z}
    TriggerEvent("SpawnAnimalAfterBuy", model, skin, ncords)
end)


RegisterCommand("followme", function()
    TriggerEvent("Underground:Ranch:FollowAnimals")
end)

RegisterCommand("stopfollow", function()
    TriggerEvent("Underground:Ranch:StopAnimalsFromFollowing")
end)

RegisterCommand("deleteallanimals", function()
    TriggerEvent("Underground:Ranch:DeleteAllAnimals")
end)

RegisterCommand("deposit", function()
    TriggerEvent("Underground:Ranch:DepositAnimals")
end)

RegisterCommand("clearanim", function()
    CleanPedAfterAnim()
end)  

--Tirar leite
RegisterCommand("anim1", function()
    CrouchAnim()
end)

--Tirar ovos
RegisterCommand("anim2", function()
    egganim()
end)

--Escavar
RegisterCommand("anim3", function()
    shovelanim()
end)

--Limpar
RegisterCommand("anim4", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 32000, true, false, false, false)
end)

--Dar comida ás galinhas
RegisterCommand("anim5", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FEED_CHICKEN"), 32000, true, false, false, false)
end)

--Meter água
RegisterCommand("anim6", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SPREAD"), 32000, true, false, false, false)
end)

--Meter água
RegisterCommand("anim7", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 15000, true, false, false, false)
end)

RegisterCommand("boom", function()
    local i = 0
    local player = PlayerPedId()
    SetEntityVisible(player, true, true)
    local playerloc = GetEntityCoords(player, true, true)
    while i < 20 do
        -- spawn explosion
        AddExplosion(playerloc.x + i, playerloc.y + i, playerloc.z, 27, 1.0, true, false, 1.0)
        i = i + 1
    end
    AddExplosion(playerloc.x, playerloc.y, playerloc.z, 27, 1.0, true, false, 1.0)
end)
--SetBlockingOfNonTemporaryEvents(farm2, true)
--Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)


RegisterCommand("timecycle", function(source, args, rawCommand)
	local timecycle_modifier = args[1]
	local timecycle_strength = args[2]
	if timecycle_modifier == nil then
		Citizen.InvokeNative(0x0E3F4AF2D63491FB)
	else
		Citizen.InvokeNative(0xFA08722A5EA82DA7,timecycle_modifier)
		Citizen.InvokeNative(0xFDB74C9CC54C3F37,timecycle_strength)
	end
end)

RegisterCommand("tp", function(source, args, rawCommand)
    local x = args[1]
    local y = args[2]
    local z = args[3]
    local coords = {x = x, y = y, z = z}
    Citizen.InvokeNative(0x239A3351AC1DA385,PlayerPedId(),coords.x, coords.y, coords.z,true,true,true)
end)