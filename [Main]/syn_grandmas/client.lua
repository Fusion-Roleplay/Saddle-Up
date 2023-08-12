local jobpeds = {}
local blips = {}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
	for k,v in pairs(Config.npcdoctor) do 
        if v.showblip then 
		    local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    	    SetBlipSprite(blip, v.blipsprite, 1)
    	    SetBlipScale(blip, 0.2)
    	    Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
            table.insert(blips, blip)
        end
        -----
        local hashModel = GetHashKey(v.npcmodel) 
        if IsModelValid(hashModel) then 
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do                
                Wait(100)
            end
        end
        local npc = CreatePed(hashModel, v.Pos.x, v.Pos.y, v.Pos.z - 1.0,v.Pos.h, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) -- NPC can't escape
        SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        table.insert(jobpeds, npc)
	end
end)

RegisterCommand("rev",function()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local isDead = IsEntityDead(player)
    for k, v in pairs(Config.npcdoctor) do
        if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5 then 
            if isDead then 
                TriggerServerEvent("syn_grandma:revive",v.price,v.gold)
            else
                TriggerEvent("vorp:TipBottom", Config.Language.notdead, 4000)
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true 
        for k, v in pairs(Config.npcdoctor) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 1.5 and not inmenu then
                sleep = false
                DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.type)
            end
        end
        if sleep then 
            Citizen.Wait(500)
        end
    end
end)

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end



AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k,v in pairs(blips) do 
            RemoveBlip(v)
        end
        for k,v in pairs(jobpeds) do 
            DeletePed(v)   
        end
    end
end)

Citizen.CreateThread( function()
    local resetcounter = 0
    local jumpDisabled = false
    while true do
        Citizen.Wait(100)
        if jumpDisabled and IsPedJumping(PlayerPedId()) then
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
            resetcounter = 0
        end
        if not jumpDisabled and IsPedJumping(PlayerPedId()) then
            jumpDisabled = true
            resetcounter = 5
            Citizen.Wait(1000)
        end
        if resetcounter > 0 then
            resetcounter = resetcounter - 1
        else
            if jumpDisabled then
                resetcounter = 0
                jumpDisabled = false
            end
        end
    end
end)

--## TENT AND CAMPFIRE ##--

RegisterNetEvent("syn_changingroom:canplace")
AddEventHandler("syn_changingroom:canplace", function()
    local pedCoords = GetEntityCoords(PlayerPedId())
    local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
    if IsTownBanned(town_hash) then
        TriggerEvent("vorp:TipBottom", "too close to town", 4000)
    else
        TriggerServerEvent("syn:puttent")
    end
end)

IsTownBanned = function (town)
	for k,v in pairs(Config.BannedTowns) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end

local status = false
local tent = 0
local campfire = 0 

RegisterNetEvent('syn:tent')
AddEventHandler('syn:tent', function()
    if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "You're placing a tent...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("mp005_s_posse_tent_bountyhunter07x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop
end)

RegisterNetEvent('syn:campfire')
AddEventHandler('syn:campfire', function()

    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "You're placing a campfire...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire02x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

end)

RegisterCommand('dtent', function(source, args, rawCommand)
    if tent == 0 then
     --   print("No hay tienda.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
		TriggerServerEvent('syn:additem', "tent")
    end
end, false)




RegisterCommand('dcampfire', function(source, args, rawCommand)
    if campfire == 0 then
        print("There is no campfire.")
    else
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
		TriggerServerEvent('syn:additem', "campfire")
    end
end, false)