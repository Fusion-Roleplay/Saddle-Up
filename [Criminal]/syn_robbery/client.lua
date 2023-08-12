local yyy1 = 0.4
local yyy2 = 0.4
local yyy3 = 0.4
local yyy4 = 0.4

local rrr1 = 152
local ggg1 = 212
local bbb1 = 224

local rrr2 = 152
local ggg2 = 212
local bbb2 = 224

local rrr3 = 152
local ggg3 = 212
local bbb3 = 224

local rrr4 = 152
local ggg4 = 212
local bbb4 = 224

local otwiera = false
local pin1 = false
local pin2 = false
local pin3 = false
local pin4 = false

igrekPin1 = (math.random(3650, 3950) * 0.0001)
igrekPin2 = (math.random(3650, 3950) * 0.0001)
igrekPin3 = (math.random(3650, 3950) * 0.0001)
igrekPin4 = (math.random(3650, 3950) * 0.0001)

local robberystarted = false 
local bandana = false
local activerobbery 
local checking = false 
local regionalpolice = {}
local isactive = false 
local playerjob
local robberytimer = 0
local allowloot = false 
local boxblips = {}
local robberyblips = {}
local loottable = {}
local lockpickcount 
local pendinglockpick = false 
local openedboxes = {}
local boxkey
local isalerted = false 
local robberyinprogress
local spawnedai = {}
local safetype = false 
local recentlyrobbed = false 
RegisterNetEvent('syn_robbery:alert')
AddEventHandler('syn_robbery:alert', function(x)
	isalerted = true 
	robberyinprogress = x
end)

RegisterCommand(Config.alertcancel, function(source, args, rawCommand)
	if isalerted then 
		isalerted = false 
		robberyinprogress = nil 
	end
end, false)

RegisterNetEvent('syn_robbery:bandana')
AddEventHandler('syn_robbery:bandana', function(x)
	bandana = x
end)


RegisterNetEvent('syn_robbery:open')
AddEventHandler('syn_robbery:open', function()
	local valid = true
	if valid then
		FreezeEntityPosition(PlayerPedId(),true)
		otwiera = true
		yyy1 = 0.4
		yyy2 = 0.4
		yyy3 = 0.4
		yyy4 = 0.4

		rrr1 = 152
		ggg1 = 212
		bbb1 = 224

		rrr2 = 152
		ggg2 = 212
		bbb2 = 224

		rrr3 = 152
		ggg3 = 212
		bbb3 = 224

		rrr4 = 152
		ggg4 = 212
		bbb4 = 224

		pin1 = false
		pin2 = false
		pin3 = false
		pin4 = false

		igrekPin1 = (math.random(3650, 3950) * 0.0001)
		igrekPin2 = (math.random(3650, 3950) * 0.0001)
		igrekPin3 = (math.random(3650, 3950) * 0.0001)
		igrekPin4 = (math.random(3650, 3950) * 0.0001)
		

	end
end)
local function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
	if not HasStreamedTextureDictLoaded(textureStreamed) then
	   RequestStreamedTextureDict(textureStreamed, false);
	else
		DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if otwiera then
			DrawRect(0.9325, 0.3725, 0.113, 0.1915, 0, 255, 0, 0)
			DrawSprite('', '', 0.9325, 0.3725, 0.113, 0.1915, 0.0, 0, 0, 0, 180, true)
			DrawTexture("inventory_items", "consumable_lock_breaker", 0.9325, 0.3725, 0.113, 0.1915, 0.0, 255, 0, 0, 180, true)

			DrawRect(0.952, yyy1, 0.004, 0.04, rrr1, ggg1, bbb1, 180)

			DrawRect(0.939, yyy2, 0.004, 0.04, rrr2, ggg2, bbb2, 180)

			DrawRect(0.9255, yyy3, 0.004, 0.04, rrr3, ggg3, bbb3, 180)

			DrawRect(0.912, yyy4, 0.004, 0.04, rrr4, ggg4, bbb4, 180)

			
			local coords = GetEntityCoords(PlayerPedId())

			DisableControlAction(0, 0x80F28E95, true)

			if IsDisabledControlJustPressed(0, 0x80F28E95) and IsInputDisabled(0) then
				otwiera = false
				pin1 = false
				pin2 = false
				pin3 = false
				pin4 = false
				rrr1 = 152
				ggg1 = 212
				bbb1 = 224
				rrr2 = 152
				ggg2 = 212
				bbb2 = 224
				rrr3 = 152
				ggg3 = 212
				bbb3 = 224
				rrr4 = 152
				ggg4 = 212
				bbb4 = 224
				yyy1 = 0.4
				yyy2 = 0.4
				yyy3 = 0.4
				yyy4 = 0.4
				DisableControlAction(0, 0x8CC9CD42, false)
				igrekPin1 = (math.random(3650, 3950) * 0.0001)
				igrekPin2 = (math.random(3650, 3950) * 0.0001)
				igrekPin3 = (math.random(3650, 3950) * 0.0001)
				igrekPin4 = (math.random(3650, 3950) * 0.0001)
				
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if otwiera then
			if not pin1 and not pin2 and not pin3 and not pin4 then
				if (yyy1 <= igrekPin1) and (igrekPin1 - 0.004 <= yyy1) then
					rrr1 = 76
					ggg1 = 175
					bbb1 = 0
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
						pin1 = true
						yyy1 = 0.37
						rrr1 = 14
						ggg1 = 113
						bbb1 = 139
					end
				else
					rrr1 = 152
					ggg1 = 212
					bbb1 = 224
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
						TriggerEvent('syn_robbery:fail')
						rrr1 = 175
						ggg1 = 0
						bbb1 = 0
						Citizen.Wait(50)
						rrr1 = 152
						ggg1 = 212
						bbb1 = 224
						Citizen.Wait(50)
						rrr1 = 175
						ggg1 = 0
						bbb1 = 0
						Citizen.Wait(50)
						rrr3 = 152
						ggg3 = 212
						bbb3 = 224
					end
				end
			elseif pin1 and not pin2 and not pin3 and not pin4 then
				if (yyy2 <= igrekPin2) and (igrekPin2 - 0.004 <= yyy2) then
					rrr2 = 76
					ggg2 = 175
					bbb2 = 0
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
						pin2 = true
						yyy2 = 0.37
						rrr2 = 14
						ggg2 = 113
						bbb2 = 139
					end
				else
					rrr2 = 152
					ggg2 = 212
					bbb2 = 224
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
						TriggerEvent('syn_robbery:fail')
						rrr2 = 175
						ggg2 = 0
						bbb2 = 0
						Citizen.Wait(50)
						rrr2 = 152
						ggg2 = 212
						bbb2 = 224
						Citizen.Wait(50)
						rrr2 = 175
						ggg2 = 0
						bbb2 = 0
						Citizen.Wait(50)
						rrr2 = 152
						ggg2 = 212
						bbb2 = 224
						pin1 = false
					end
				end
			elseif pin1 and pin2 and not pin3 and not pin4 then
				if (yyy3 <= igrekPin3) and (igrekPin3 - 0.004 <= yyy3) then
					rrr3 = 76
					ggg3 = 175
					bbb3 = 0
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
						pin3 = true
						yyy3 = 0.37
						rrr3 = 14
						ggg3 = 113
						bbb3 = 139
					end
				else
					rrr3 = 152
					ggg3 = 212
					bbb3 = 224
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
						TriggerEvent('syn_robbery:fail')
						rrr3 = 175
						ggg3 = 0
						bbb3 = 0
						Citizen.Wait(50)
						rrr3 = 152
						ggg3 = 212
						bbb3 = 224
						Citizen.Wait(50)
						rrr3 = 175
						ggg3 = 0
						bbb3 = 0
						Citizen.Wait(50)
						rrr3 = 152
						ggg3 = 212
						bbb3 = 224
						pin2 = false
					end
				end
			elseif pin1 and pin2 and pin3 and not pin4 then
				if (yyy4 <= igrekPin4) and (igrekPin4 - 0.004 <= yyy4) then
					rrr4 = 76
					ggg4 = 175
					bbb4 = 0
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
						pin4 = true
						yyy4 = 0.37
						rrr4 = 14
						ggg4 = 113
						bbb4 = 139
					end
				else
					rrr4 = 152
					ggg4 = 212
					bbb4 = 224
					if IsControlJustPressed(0, Config.lockpin) and IsInputDisabled(0) then
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
						TriggerEvent('syn_robbery:fail')
						rrr4 = 175
						ggg4 = 0
						bbb4 = 0
						Citizen.Wait(50)
						rrr4 = 152
						ggg4 = 212
						bbb4 = 224
						Citizen.Wait(50)
						rrr4 = 175
						ggg4 = 0
						bbb4 = 0
						Citizen.Wait(50)
						rrr4 = 152
						ggg4 = 212
						bbb4 = 224
						pin3 = false
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if otwiera then
			if not pin1 and not pin2 and not pin3 and not pin4 then
				if IsControlJustPressed(0, Config.movepin) and IsInputDisabled(0) then
					if (yyy1 - 0.003) >= (0.4 - 0.04) then
						yyy1 = yyy1 - 0.003
						Citizen.Wait(10)
						if (yyy1 - 0.003) >= (0.4 - 0.04) then
							yyy1 = yyy1 - 0.003
							Citizen.Wait(10)
							if (yyy1 - 0.003) >= (0.4 - 0.04) then
								yyy1 = yyy1 - 0.003
								Citizen.Wait(10)
								if (yyy1 - 0.003) >= (0.4 - 0.04) then
									yyy1 = yyy1 - 0.003
									Citizen.Wait(10)
									if (yyy1 - 0.003) >= (0.4 - 0.04) then
										yyy1 = yyy1 - 0.003
										Citizen.Wait(10)
									end
								end
							end
						end
					end
				end
			elseif pin1 and not pin2 and not pin3 and not pin4 then
				if IsControlJustPressed(0, Config.movepin) and IsInputDisabled(0) then
					if (yyy2 - 0.003) >= (0.4 - 0.04) then
						yyy2 = yyy2 - 0.003
						Citizen.Wait(10)
						if (yyy2 - 0.003) >= (0.4 - 0.04) then
							yyy2 = yyy2 - 0.003
							Citizen.Wait(10)
							if (yyy2 - 0.003) >= (0.4 - 0.04) then
								yyy2 = yyy2 - 0.003
								Citizen.Wait(10)
								if (yyy2 - 0.003) >= (0.4 - 0.04) then
									yyy2 = yyy2 - 0.003
									Citizen.Wait(10)
									if (yyy2 - 0.003) >= (0.4 - 0.04) then
										yyy2 = yyy2 - 0.003
										Citizen.Wait(10)
									end
								end
							end
						end
					end
				end
			elseif pin1 and pin2 and not pin3 and not pin4 then
				if IsControlJustPressed(0, Config.movepin) and IsInputDisabled(0) then
					if (yyy3 - 0.003) >= (0.4 - 0.04) then
						yyy3 = yyy3 - 0.003
						Citizen.Wait(10)
						if (yyy3 - 0.003) >= (0.4 - 0.04) then
							yyy3 = yyy3 - 0.003
							Citizen.Wait(10)
							if (yyy3 - 0.003) >= (0.4 - 0.04) then
								yyy3 = yyy3 - 0.003
								Citizen.Wait(10)
								if (yyy3 - 0.003) >= (0.4 - 0.04) then
									yyy3 = yyy3 - 0.003
									Citizen.Wait(10)
									if (yyy3 - 0.003) >= (0.4 - 0.04) then
										yyy3 = yyy3 - 0.003
										Citizen.Wait(10)
									end
								end
							end
						end
					end
				end
			elseif pin1 and pin2 and pin3 and not pin4 then
				if IsControlJustPressed(0, Config.movepin) and IsInputDisabled(0) then
					if (yyy4 - 0.003) >= (0.4 - 0.04) then
						yyy4 = yyy4 - 0.003
						Citizen.Wait(10)
						if (yyy4 - 0.003) >= (0.4 - 0.04) then
							yyy4 = yyy4 - 0.003
							Citizen.Wait(10)
							if (yyy4 - 0.003) >= (0.4 - 0.04) then
								yyy4 = yyy4 - 0.003
								Citizen.Wait(10)
								if (yyy4 - 0.003) >= (0.4 - 0.04) then
									yyy4 = yyy4 - 0.003
									Citizen.Wait(10)
									if (yyy4 - 0.003) >= (0.4 - 0.04) then
										yyy4 = yyy4 - 0.003
										Citizen.Wait(10)
									end
								end
							end
						end
					end
				end
			elseif pin1 and pin2 and pin3 and pin4 then
				TriggerEvent("syn_robbery:win")
				otwiera = false
				pin1 = false
				pin2 = false
				pin3 = false
				pin4 = false
				rrr1 = 152
				ggg1 = 212
				bbb1 = 224
				rrr2 = 152
				ggg2 = 212
				bbb2 = 224
				rrr3 = 152
				ggg3 = 212
				bbb3 = 224
				rrr4 = 152
				ggg4 = 212
				bbb4 = 224
				yyy1 = 0.4
				yyy2 = 0.4
				yyy3 = 0.4
				yyy4 = 0.4
				DisableControlAction(0, 0x8CC9CD42, false)
				igrekPin1 = (math.random(3650, 3950) * 0.0001)
				igrekPin2 = (math.random(3650, 3950) * 0.0001)
				igrekPin3 = (math.random(3650, 3950) * 0.0001)
				igrekPin4 = (math.random(3650, 3950) * 0.0001)
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if otwiera then
			if not pin1 then
				if yyy1 < 0.4 then
					yyy1 = yyy1 + 0.0002
				end
			end
			if not pin2 then
				if yyy2 < 0.4 then
					yyy2 = yyy2 + 0.0002
				end
			end
			if not pin3 then
				if yyy3 < 0.4 then
					yyy3 = yyy3 + 0.0002
				end
			end
			if not pin4 then
				if yyy4 < 0.4 then
					yyy4 = yyy4 + 0.0002
				end
			end
		end
	end
end)
RegisterNetEvent('syn_robbery:fail')
AddEventHandler('syn_robbery:fail', function()
	local fail = math.random(0, 10)
	if Config.diff >= fail then -- 3 out of 10 times you will fail
		TriggerServerEvent('syn_robbery:removeitem',loottable[boxkey].lockpickitem.name)
		TriggerEvent("vorp:TipBottom", Config.Language.brokenlockpick..loottable[boxkey].lockpickitem.label, 2000)
		pendinglockpick = false 
		ClearPedSecondaryTask(PlayerPedId())
		RemoveAnimDict("script_proc@rustling@olar@player_picklock")
		FreezeEntityPosition(PlayerPedId(),false)
		otwiera = false
		pin1 = false
		pin2 = false
		pin3 = false
		pin4 = false
		rrr1 = 152
		ggg1 = 212
		bbb1 = 224
		rrr2 = 152
		ggg2 = 212
		bbb2 = 224
		rrr3 = 152
		ggg3 = 212
		bbb3 = 224
		rrr4 = 152
		ggg4 = 212
		bbb4 = 224
		yyy1 = 0.4
		yyy2 = 0.4
		yyy3 = 0.4
		yyy4 = 0.4
		DisableControlAction(0, 0x8CC9CD42, false)
		igrekPin1 = (math.random(3650, 3950) * 0.0001)
		igrekPin2 = (math.random(3650, 3950) * 0.0001)
		igrekPin3 = (math.random(3650, 3950) * 0.0001)
		igrekPin4 = (math.random(3650, 3950) * 0.0001)
	end
end)



RegisterNetEvent('syn_robbery:win')
AddEventHandler('syn_robbery:win', function()
	ClearPedSecondaryTask(PlayerPedId())
	RemoveAnimDict("script_proc@rustling@olar@player_picklock")
	FreezeEntityPosition(PlayerPedId(),false)
	pendinglockpick = false 
	table.insert(openedboxes,boxkey)
	if Config.robbery[activerobbery].showlockboxblip then 
		RemoveBlip(boxblips[boxkey])
		boxblips[boxkey] = nil 
	end
	TriggerEvent("vorp:TipBottom", Config.Language.lockpicked, 2000)
	TriggerServerEvent("syn_robbery:getreward",loottable[boxkey])
end)
function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
	local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
	SetTextScale(w, h)
	SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
	if enableShadow then 
		SetTextDropshadow(1, 0, 0, 0, 255)
	end
	Citizen.InvokeNative(0xADA9255D, 10);
	DisplayText(str, x, y)
end
  
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
------------------------------------------------------------
function contains(item, element)
	for k,v in pairs(item) do 
		if v == element then 
			return true 
		end
	end
	return false 
end
function keysx(item)
    local keys = 0
    for k,v in pairs(item) do
       keys = keys + 1
    end
    return keys
end

RegisterNetEvent('syn_robbery:lockpickitemcount')
AddEventHandler('syn_robbery:lockpickitemcount', function(x)
	lockpickcount = x 
	checking = false 
end)
RegisterNetEvent('syn_robbery:recpolice')
AddEventHandler('syn_robbery:recpolice', function(police)
	regionalpolice = police 
	checking = false 
end)
RegisterNetEvent('syn_robbery:recactive')
AddEventHandler('syn_robbery:recactive', function(x,y)
	isactive = x 
	recentlyrobbed = y
	checking = false 
end)

RegisterNetEvent('syn_robbery:recjob')
AddEventHandler('syn_robbery:recjob', function(x)
	playerjob = x 
	checking = false 
end)

RegisterNetEvent('syn_robbery:allowrob')
AddEventHandler('syn_robbery:allowrob', function(k,v)
	activerobbery = k
	--TriggerServerEvent("syn_robbery:activerobbery",k,regionalpolice)
	loottable = v.points
	TriggerEvent("vorp:TipBottom", Config.Language.startlooking, 4000)
	TriggerEvent("inv:dropstatus",false)
	TriggerEvent("inv:givestatus",false)
	if v.showlockboxblip then 
		createboxblips(loottable)
	end
	if v.timeuntilallowrobbery ~= 0 then 
		robberytimer = v.timeuntilallowrobbery * 60
	else
		allowloot = true 
	end
	if next(v.npcinfo) ~= nil then 
		spawnai(v.npcinfo)
	else
		robberystarted = true 
	end
end)

Citizen.CreateThread(function()
	while true do
	  	Citizen.Wait(0)
	  	local sleep = true
		local hasbandana = true 
		local triggered = false  
		if Config.bandanarequired then 
			hasbandana = bandana
		end
		if not robberystarted and hasbandana then 
	  		local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.robbery) do 
				local distance = GetDistanceBetweenCoords(coords, v.pos.x, v.pos.y, v.pos.z, true)
				if v.distancetostart > distance then 
					sleep = false 
					if v.shoottostart then 
						drawtext(Config.Language.startrobbery, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
						if IsPedShooting(PlayerPedId()) then
							local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
							if not  Citizen.InvokeNative(0x6E4E1A82081EABED, weaponHash) and not Citizen.InvokeNative(0x959383DCD42040DA, weaponHash) then 
								triggered = true 
							end
						end
					else 
						drawtext(Config.Language.startrobbery2, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
						if IsControlJustReleased(0, Config.engage) then 
							triggered = true 
						end
					end
					if triggered then
						checking = true 
						TriggerServerEvent("syn_robbery:checkjob")
						while checking do 
							Wait(100)
						end	
						if not contains(Config.norobjob,playerjob) then 
							checking = true 
							TriggerServerEvent("syn_alert:getregional",v.copsdutyregion)
							while checking do 
								Wait(100)
							end
							local policenum = keysx(regionalpolice)
							if policenum >= v.requiredpolice then 
								checking = true 
								TriggerServerEvent("syn_robbery:isrobberyactive",k,regionalpolice,v)
								regionalpolice = {}
								Wait(500)
							else
								TriggerEvent("vorp:TipBottom", Config.Language.nopolice..v.requiredpolice, 4000)
								Wait(2000)
								TriggerEvent("vorp:TipBottom", Config.Language.thereareonly..policenum, 4000)
								Wait(5000)
							end
						else
							TriggerEvent("vorp:TipBottom", Config.Language.cantrobjob, 4000)
							Wait(1000)
						end
						
					end
				end
			end
		end
		if robberystarted and robberytimer > 0 then 
			sleep = false 
			drawtext(Config.Language.robberytimer.."~e~"..robberytimer, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
		end
		if robberystarted then 
			sleep = false
			local coords = GetEntityCoords(PlayerPedId())
			local startlocation = Config.robbery[activerobbery].pos
			if not pendinglockpick then 
				for k,v in pairs(loottable) do 
					if not contains(openedboxes,k) then 
						local distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
						if 3 > distance then 
							if not allowloot then 
								DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, "~e~"..Config.Language.lootbox)
							else
								DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.lockpick)
								if IsControlJustReleased(0, Config.engage) then
									checking = true 
									TriggerServerEvent("syn_robbery:checklockpick",v.lockpickitem.name)
									while checking do 
										Wait(100)
									end
									if lockpickcount > 0 then 
										pendinglockpick = true 
										boxkey = k
										if v.type == "safe" then 
											safetype = "safe"
											TaskStandStill(PlayerPedId(), 1)  
											FreezeEntityPosition(PlayerPedId(),true)
											local diff = v.combination
											local res = exports["qadr_safe"]:createSafe(diff)
											if res then 
												ClearPedSecondaryTask(PlayerPedId())
												RemoveAnimDict("script_proc@rustling@olar@player_picklock")
												FreezeEntityPosition(PlayerPedId(),false)
												pendinglockpick = false 
												table.insert(openedboxes,boxkey)
												if Config.robbery[activerobbery].showlockboxblip then 
													RemoveBlip(boxblips[boxkey])
													boxblips[boxkey] = nil 
												end
												TriggerEvent("vorp:TipBottom", Config.Language.lockpicked, 2000)
												TriggerServerEvent("syn_robbery:getreward",loottable[boxkey])
											else
												TriggerServerEvent('syn_robbery:removeitem',loottable[boxkey].lockpickitem.name)
												TriggerEvent("vorp:TipBottom", Config.Language.brokenlockpick..loottable[boxkey].lockpickitem.label, 2000)
												pendinglockpick = false 
												ClearPedSecondaryTask(PlayerPedId())
												RemoveAnimDict("script_proc@rustling@olar@player_picklock")
												FreezeEntityPosition(PlayerPedId(),false)										
											end
											print(res)
										elseif v.type == nil or v.type == "normal" then 
											safetype = "normal"
											TriggerEvent('syn_robbery:open')
										elseif v.type == "lockpick" then 
											safetype = "lockpick"
											TaskStandStill(PlayerPedId(), 1)  
											FreezeEntityPosition(PlayerPedId(),true)
											local res = exports["lockpick"]:lockpick()
											if res then 
												ClearPedSecondaryTask(PlayerPedId())
												RemoveAnimDict("script_proc@rustling@olar@player_picklock")
												FreezeEntityPosition(PlayerPedId(),false)
												pendinglockpick = false 
												table.insert(openedboxes,boxkey)
												if Config.robbery[activerobbery].showlockboxblip then 
													RemoveBlip(boxblips[boxkey])
													boxblips[boxkey] = nil 
												end
												TriggerEvent("vorp:TipBottom", Config.Language.lockpicked, 2000)
												TriggerServerEvent("syn_robbery:getreward",loottable[boxkey])
											else
												TriggerServerEvent('syn_robbery:removeitem',loottable[boxkey].lockpickitem.name)
												TriggerEvent("vorp:TipBottom", Config.Language.brokenlockpick..loottable[boxkey].lockpickitem.label, 2000)
												pendinglockpick = false 
												ClearPedSecondaryTask(PlayerPedId())
												RemoveAnimDict("script_proc@rustling@olar@player_picklock")
												FreezeEntityPosition(PlayerPedId(),false)										
											end
										end
									else
										TriggerEvent("vorp:TipBottom", Config.Language.itemissing..v.lockpickitem.label, 4000)
										Wait(2000)
									end
								end
							end
						end
					end
				end
			end
			
		end
		if isalerted then 
			sleep = false 
			drawtext(Config.Language.inprogressat..robberyinprogress, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
			drawtext(Config.Language.removenot..Config.alertcancel..Config.Language.removenot2, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
		end
		if sleep then 
			Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	  	Citizen.Wait(0)
		local sleep = true 
		if pendinglockpick then
			sleep = false 
			if safetype == "safe" then 
				drawtext(Config.Language.guide2, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
				
			else 
				if safetype == "normal" then
					drawtext(Config.Language.guide, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
				end
				if not IsEntityPlayingAnim(PlayerPedId(), "script_proc@rustling@olar@player_picklock", "base", 3) then
					local waiting = 0
					RequestAnimDict("script_proc@rustling@olar@player_picklock")
					while not HasAnimDictLoaded("script_proc@rustling@olar@player_picklock") do
						waiting = waiting + 100
						Citizen.Wait(100)
						if waiting > 5000 then
							break
						end
					end
					Wait(100)
					TaskPlayAnim(PlayerPedId(), 'script_proc@rustling@olar@player_picklock', 'base', 8.0, 8.0, 120000, 31, 0, true, 0, false, 0, false)
				end 
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
	  	Citizen.Wait(0)
		local sleep = true 
		if robberystarted then
			sleep = false 
			local coords = GetEntityCoords(PlayerPedId())
			local startlocation = Config.robbery[activerobbery].pos
			local disttocore = GetDistanceBetweenCoords(coords, startlocation.x, startlocation.y, startlocation.z, true)
			local maxdist = Config.robbery[activerobbery].distancecheck
			if IsEntityDead(PlayerPedId()) or disttocore > maxdist then 
				endrobbery()
			end
		end
		if sleep then 
			Wait(500)
		end
	end
end)
Citizen.CreateThread(function() -- timer logic to start looking for boxes 
	while true do
	  	Citizen.Wait(0)
		local sleep = true 
		if robberystarted and robberytimer > 0 then
			sleep = false 
			Wait(1000)
			robberytimer = robberytimer - 1 
			if 0 == robberytimer then 
				allowloot = true 
			end
		end
		if sleep then 
			Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	Wait(1000)
	for k,v in pairs(Config.robbery) do 
		if v.showblip then 
			local blip = N_0x554d9d53f696d002(1664425300, v.pos.x, v.pos.y, v.pos.z)
			SetBlipSprite(blip, Config.robberyblipsprite, 1)
			SetBlipScale(blip, 0.8)
			Citizen.InvokeNative(0x9CB1A1623062F402, blip, k)
			robberyblips[k] = blip
		end
	end
end)

function createboxblips(lootboxes)
	for k,v in pairs(lootboxes) do 
		local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
		SetBlipSprite(blip, Config.lootboxsprite, 1)
		SetBlipScale(blip, 0.8)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.lootbox)
		boxblips[k] = blip
	end
end

AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
		for k,v in pairs(boxblips) do 
			RemoveBlip(v)
		end
		for k,v in pairs(robberyblips) do 
			RemoveBlip(v)
		end
		for k,v in pairs(spawnedai) do 
			DeleteEntity(v)
		end
    end
end)

function spawnai(npcinfo)
	for k,v in pairs(npcinfo) do 
		local model = GetHashKey(v.model)
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(50)
		end
		local createdped = 0
		while createdped == 0 do
			local heading = 0
			createdped = CreatePed(model,  v.x, v.y , v.z, heading, true, true, false, 0, 0)
			Wait(500)
		end
		Citizen.InvokeNative(0x283978A15512B2FE, createdped, true) 
		if Config.blipai then  
			Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped) 
		end
		SetPedCombatMovement(createdped,3)
		SetModelAsNoLongerNeeded(model)
		GiveWeaponToPed_2(createdped, v.weapon, 1000, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
		SetCurrentPedWeapon(createdped, v.weapon, true)
		SetPedCombatAttributes(createdped,46,true)
		TaskCombatPed(createdped, PlayerPedId())
		table.insert(spawnedai,createdped)
	end
	robberystarted = true 
end

function endrobbery()
	TriggerEvent("inv:dropstatus",true)
	TriggerEvent("inv:givestatus",true)
	for k,v in pairs(spawnedai) do 
		DeleteEntity(v)
		spawnedai[k] = nil 
	end
	for k,v in pairs(boxblips) do 
		RemoveBlip(v)
		boxblips[k] = nil
	end
	robberystarted = false 
	activerobbery = nil
	regionalpolice = {}
	isactive = false 
	robberytimer = 0
	allowloot = false 
	boxblips = {}
	loottable = {}
	lockpickcount = nil 
	pendinglockpick = false 
	openedboxes = {}
	boxkey = nil 
	spawnedai = {}
	safetype = false 
end