local playerjob
local playerrank
local blips = {}
local wepobject
local createdobject = false
local incustom = false 
local weaponid
local globalhash
local added = {}
local prompts = GetRandomIntInRange(0, 0xffffff)
local prompts2 = GetRandomIntInRange(0, 0xffffff)
local prompts3 = GetRandomIntInRange(0, 0xffffff)
local prompts4 = GetRandomIntInRange(0, 0xffffff)
local customizebutton
local buybutton
local craftbutton
local rotate1
local rotate2
local rotate3
local rotate4
local sumcash = 0
local sumgold = 0
local roll 
local h
local playerweps
local positiontemp
local crafting = false 
local shop = {}
local gunsmithexp = 0
local inshop = false 
local currentshop
local locationx
local currentplayers
local rotate = false 
WeaponComponentz = {}
cos = {}

--[[ RegisterCommand("removeammoc", function() -- test command 
	TriggerEvent("syn_weapons:removeallammo")
end) ]]
RegisterNetEvent("syn_weapons:removeallammo") -- new event 
AddEventHandler("syn_weapons:removeallammo", function()
	TriggerServerEvent("syn_weapons:removeallammoserver")
	Citizen.InvokeNative(0xF25DF915FA38C5F3,PlayerPedId(),1,1)
	Citizen.InvokeNative(0x1B83C0DEEBCBB214,PlayerPedId())
end)


TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	TriggerServerEvent("syn_weapons:removeused")
	Citizen.Wait(1000)
	RemoveAllPedWeapons(PlayerPedId(),true,true)
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
	if Config.weaponshops then
    	Citizen.Wait(1000)
		for k,v in pairs(Config5.weaponshops) do 
			if v.showblip then
				local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        		SetBlipSprite(blip, v.blipsprite, 1)
        		SetBlipScale(blip, 0.2)
        		Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
				table.insert( blips, blip )
			end
		end
	end
	local str = Config2.Language.presstoshop
	buybutton = PromptRegisterBegin()
	PromptSetControlAction(buybutton, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(buybutton, str)
	PromptSetEnabled(buybutton, 1)
	PromptSetVisible(buybutton, 1)
	PromptSetStandardMode(buybutton,1)
	PromptSetGroup(buybutton, prompts4)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,buybutton,true)
	PromptRegisterEnd(buybutton)

	local str = Config2.Language.presstocraft
	craftbutton = PromptRegisterBegin()
	PromptSetControlAction(craftbutton, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(craftbutton, str)
	PromptSetEnabled(craftbutton, 1)
	PromptSetVisible(craftbutton, 1)
	PromptSetStandardMode(craftbutton,1)
	PromptSetGroup(craftbutton, prompts3)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,craftbutton,true)
	PromptRegisterEnd(craftbutton)

    local str = Config2.Language.presstobuy
	customizebutton = PromptRegisterBegin()
	PromptSetControlAction(customizebutton, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(customizebutton, str)
	PromptSetEnabled(customizebutton, 1)
	PromptSetVisible(customizebutton, 1)
	PromptSetStandardMode(customizebutton,1)
	PromptSetGroup(customizebutton, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,customizebutton,true)
	PromptRegisterEnd(customizebutton)

    local str = Config2.Language.rotateitem1
	rotate1 = PromptRegisterBegin()
	PromptSetControlAction(rotate1, Config.keys["1"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(rotate1, str)
	PromptSetEnabled(rotate1, 1)
	PromptSetVisible(rotate1, 1)
	PromptSetStandardMode(rotate1,1)
	PromptSetGroup(rotate1, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,rotate1,true)
	PromptRegisterEnd(rotate1)

    local str = Config2.Language.rotateitem2
	rotate2 = PromptRegisterBegin()
	PromptSetControlAction(rotate2, Config.keys["2"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(rotate2, str)
	PromptSetEnabled(rotate2, 1)
	PromptSetVisible(rotate2, 1)
	PromptSetStandardMode(rotate2,1)
	PromptSetGroup(rotate2, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,rotate2,true)
	PromptRegisterEnd(rotate2)

    local str = Config2.Language.rotateitem3
	rotate3 = PromptRegisterBegin()
	PromptSetControlAction(rotate3, Config.keys["3"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(rotate3, str)
	PromptSetEnabled(rotate3, 1)
	PromptSetVisible(rotate3, 1)
	PromptSetStandardMode(rotate3,1)
	PromptSetGroup(rotate3, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,rotate3,true)
	PromptRegisterEnd(rotate3)

    local str = Config2.Language.rotateitem4
	rotate4 = PromptRegisterBegin()
	PromptSetControlAction(rotate4, Config.keys["4"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(rotate4, str)
	PromptSetEnabled(rotate4, 1)
	PromptSetVisible(rotate4, 1)
	PromptSetStandardMode(rotate4,1)
	PromptSetGroup(rotate4, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,rotate4,true)
	PromptRegisterEnd(rotate4)
end)

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(1)
        local sleep = true
		if createdobject then
			sleep = false 
			DrawLightWithRange(positiontemp.x , positiontemp.y , positiontemp.z + 1, 255, 255, 255, 2.5 ,10.0)
            local label  = CreateVarString(10, 'LITERAL_STRING', Config2.Language.totalg..sumgold..Config2.Language.dollario..sumcash)
            PromptSetActiveGroupThisFrame(prompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE,rotate1) then
				h = h + 10
				SetEntityRotation(wepobject,roll % 360,0,h % 360,1,true)
				TriggerServerEvent("syn_weapons:rotate",currentplayers,roll % 360,h % 360)
			end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,rotate2) then
				h = h - 10
				SetEntityRotation(wepobject,roll % 360,0,h % 360,1,true)
				TriggerServerEvent("syn_weapons:rotate",currentplayers,roll % 360,h % 360)

			end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,rotate3) then
				roll = roll - 20
				SetEntityRotation(wepobject,roll % 360,0,h % 360,1,true)
				TriggerServerEvent("syn_weapons:rotate",currentplayers,roll % 360,h % 360)

			end
            if Citizen.InvokeNative(0xC92AC953F0A982AE,rotate4) then
				roll = roll + 20
				SetEntityRotation(wepobject,roll % 360,0,h % 360,1,true)
				TriggerServerEvent("syn_weapons:rotate",currentplayers,roll % 360,h % 360)

			end
		end
		if sleep then 
			Wait(500)
		end
	end
end)
RegisterNetEvent("syn_weapons:reotateme")
AddEventHandler("syn_weapons:reotateme", function(x,y)
	SetEntityRotation(wepobject,x,0,y,1,true)
end)

function RemoveWeaponComponentFromPed(ped, componentHash, weaponHash)
	return Citizen.InvokeNative(0x19F70C4D80494FF8, ped, componentHash, weaponHash)
end

function GiveWeaponComponentToEntity(entity, componentHash, weaponHash, p3)
	return Citizen.InvokeNative(0x74C9090FDD1BB48E, entity, componentHash, weaponHash, p3)
end

function LoadModel(model)
	if not IsModelInCdimage(model) then
		return false
	end

	RequestModel(model)

	while not HasModelLoaded(model) do
		Wait(0)
	end

	return true
end

Citizen.CreateThread(function()
	if Config.weaponshops then
    	while true do
		  Citizen.Wait(1)
			if not inshop then 
				local coords, letSleep = GetEntityCoords(PlayerPedId()), true
				for k, v in pairs(Config5.weaponshops) do
					if 1 > GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z, 1) then 
						letSleep = false
						local label  = CreateVarString(10, 'LITERAL_STRING', Config2.Language.presstoshop)
						PromptSetActiveGroupThisFrame(prompts4, label)
						if Citizen.InvokeNative(0xC92AC953F0A982AE,buybutton) then
							inshop = true 
							currentshop = k
							FreezeEntityPosition(PlayerPedId(),true)
							opengunshop()
						end
					end
				end
			end
			if letSleep then 
				Wait(500)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	  Citizen.Wait(1)
        if not crafting then 
            local coords, letSleep = GetEntityCoords(PlayerPedId()), true
            for k, v in pairs(Config.craftinglocation) do
                if 1 > GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z, 1) then 
                    letSleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config2.Language.presstocraft)
                    PromptSetActiveGroupThisFrame(prompts3, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,craftbutton) then
						if Config.jobonly then
							TriggerServerEvent("syn_weapons:getjob")
							Citizen.Wait(400)
							if checkvalue(v.job, playerjob) and tonumber(playerrank) >= tonumber(Config.jobrankcrafting) then
								crafting = true
								FreezeEntityPosition(PlayerPedId(),true)
								craftingmenu()
							else
								TriggerEvent("vorp:TipBottom", Config2.Language.wrongjobcrafting, 4000)
							end
						else
							TriggerServerEvent("syn_weapons:getjob")
							Citizen.Wait(400)
							crafting = true
							FreezeEntityPosition(PlayerPedId(),true)
							craftingmenu()
						end	
					end
				end
			end
			if letSleep then
				Citizen.Wait(500)
			end
		end
	end
end)
Citizen.CreateThread(function()
    while true do
	  Citizen.Wait(1)
        if not incustom then 
            local coords, letSleep = GetEntityCoords(PlayerPedId()), true
            for k, v in pairs(Config.customizationLocations) do
                if 1 > GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z, 1) then 
                    letSleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', Config2.Language.presstobuy)
                    PromptSetActiveGroupThisFrame(prompts2, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,customizebutton) then
						locationx = k
                        if Config.jobonly then
                            TriggerServerEvent("syn_weapons:getjob")
                            Citizen.Wait(400)
                            if checkvalue(v.job, playerjob)  then
								if tonumber(playerrank) >= tonumber(Config.jobrankcustomization) then 
									incustom = true 
									TriggerServerEvent("syn_weapons:getplayerweapons")
									Wait(500)
                                	wepsmen()
                                	FreezeEntityPosition(PlayerPedId(),true)
								end
                            else
                                TriggerEvent("vorp:TipBottom", Config2.Language.wrongjobcuztom, 4000)
                            end
						else
							incustom = true 
							TriggerServerEvent("syn_weapons:getjob")
							TriggerServerEvent("syn_weapons:getplayerweapons")
							Wait(500)
                            wepsmen()
                            FreezeEntityPosition(PlayerPedId(),true)
                        end
                    end
                end
            end
			if letSleep then
				Citizen.Wait(500)
			end
        end
    end
end)

AddEventHandler('menuapi:closemenu', function() -- close menu
    if incustom then 
        endprocess()
    end
	if crafting then 
		crafting = false 
		FreezeEntityPosition(PlayerPedId(),false)
	end
	if inshop then 
		inshop = false 
		FreezeEntityPosition(PlayerPedId(),false)
	end
end)

Citizen.CreateThread(function() -- findme
	while true do
	  Citizen.Wait(0)
	  local sleep = true 
	  if incustom or crafting or inshop then 
		sleep = false 
		DisableControlAction(0, 0xC1989F95, true)
	  end
	  if sleep then 
		Wait(500)
	  end
	end
  end)


function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end

function getcurrent(key,type)
    for k,v in pairs(type) do 
		for x,y in pairs(v) do 
			if added[key] ~= nil then 
				if added[key] == y.item then 
					return tonumber(x)
				end
			else
				return 0
			end
		end
	end
end
function opengunshop3(x,y) 
	MenuData.CloseAll()
	local elements = {
	}
	for k,v in pairs(y) do 
		table.insert( elements, {label = k, value = v, desc = Config2.Language.dollar..v.price})
	end
	
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.shop,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
		lastmenu = "opengunshop2",

	},
	function(data, menu)
		if(data.current == "backup") then
			_G[data.trigger](x)
		else
			MenuData.CloseAll()
			FreezeEntityPosition(PlayerPedId(),false)
			if x == "ammo" then 
				TriggerEvent("syn_inputs:sendinputs",Config2.Language.confirm,Config2.Language.amount, function(cb)
					local amount = tonumber(cb)
					if amount ~= nil and amount > 0 then 
						TriggerServerEvent("syn_weapons:buythings",x,data.current.value,amount,data.current.label) 
					end
				end)
				inshop = false 
			elseif x == "weapons" then 
				local amount = 1 
				inshop = false 
				TriggerServerEvent("syn_weapons:buythings",x,data.current.value,amount,data.current.label) 
			end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end
function opengunshop2(x) 
	MenuData.CloseAll()
	local elements = {
	}
	for k,v in pairs(Config5.weaponshops[currentshop][x]) do 
		table.insert( elements, {label = k, value = v, desc = ""})
	end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.shop,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
		lastmenu = "opengunshop",

	},
	function(data, menu)
		if(data.current == "backup") then
			_G[data.trigger]()
		else
			opengunshop3(x,data.current.value) 
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function opengunshop() 
	MenuData.CloseAll()
	local elements = {
		{label = Config2.Language.buyweapons, value = "weapons", desc = ""},
		{label = Config2.Language.buyammo, value = "ammo", desc = ""}
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.shop,
		subtext    = '',
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
		if(data.current.value == "weapons") then
			opengunshop2("weapons")
		end
		if(data.current.value == "ammo") then
			opengunshop2("ammo")		
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

local custominfo = {customserial = "",customlabel = "",customdesc = ""}
function craftingmenu4(x,y,z) 
	MenuData.CloseAll()
	local elements = {
	}
		if x == "weapons" then 
			if not checkvalue(Config.noserialweapons, z.hashname) then 
				if Config.allowcustomserial then 
					table.insert( elements, {label = Config2.Language.customserial, value = "customserial", desc = custominfo.customserial})
				end
			end
			if Config.allowcustomlabel then 
				table.insert( elements, {label = Config2.Language.customlabel, value = "customlabel", desc = custominfo.customlabel})
			end
			if Config.allowcustomdesc then 
				table.insert( elements, {label = Config2.Language.customdesc, value = "customdesc", desc = custominfo.customdesc})
			end
			
		end
		for k,v in pairs(z.materials) do 
			table.insert( elements, {label = v.amount.." "..v.label, value = v, desc = ""})
		end
		table.insert( elements, {label = Config2.Language.confirm, value = "confirm",desc = ""})
	
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.crafting,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
		lastmenu = "craftingmenu3",

	},
	function(data, menu)
		if(data.current == "backup") then
			_G[data.trigger](x,y)
		elseif data.current.value == "customserial" then 
			TriggerEvent("syn_inputs:sendinputs", Config2.Language.confirm, Config2.Language.customserial, function(cb)
                local name = cb
                if name ~= nil and name ~= "" then 
					custominfo.customserial = name
					craftingmenu4(x,y,z)
				else
					TriggerEvent("vorp:TipRight", Config2.Language.invalidname, 6000)
				end
			end)
		elseif data.current.value == "customlabel" then 
			TriggerEvent("syn_inputs:sendinputs", Config2.Language.confirm, Config2.Language.customlabel, function(cb)
				local name = cb
				if name ~= nil and name ~= "" then 
					custominfo.customlabel = name
					craftingmenu4(x,y,z)
				else
					TriggerEvent("vorp:TipRight", Config2.Language.invalidname, 6000)
				end
			end)
		elseif data.current.value == "customdesc" then
			TriggerEvent("syn_inputs:sendinputs", Config2.Language.confirm, Config2.Language.customdesc, function(cb)
				local name = cb
				if name ~= nil and name ~= "" then 
					custominfo.customdesc = name
					craftingmenu4(x,y,z)
				else
					TriggerEvent("vorp:TipRight", Config2.Language.invalidname, 6000)
				end
			end)
		elseif data.current.value == "confirm" then 
			if x == "ammo" then
				MenuData.CloseAll() 
				FreezeEntityPosition(PlayerPedId(),false)
				TriggerEvent("syn_inputs:sendinputs",Config2.Language.confirm,Config2.Language.amount, function(cb)
					local amount = tonumber(cb)
					if amount ~= nil and amount > 0 then 
						TriggerServerEvent("syn_weapons:itemscheck",amount,z,x) 
						FreezeEntityPosition(PlayerPedId(),false)
					end
				end)
				crafting = false 
			elseif  x == "weapons" then 
				MenuData.CloseAll()
				local amount = 1 
				TriggerServerEvent("syn_weapons:itemscheck",amount,z,x,custominfo) 
				crafting = false 
				FreezeEntityPosition(PlayerPedId(),false)
			end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function craftingmenu3(x,y) 
	MenuData.CloseAll()
	local elements = {
	}
	for k,v in pairs(y) do
		if v.letcraft then  
			if v.jobonly then
				if checkvalue(v.jobs, playerjob) then 
					if gunsmithexp >= v.expreq then 
						table.insert( elements, {label = k, value = v, desc = ""})
					end
				end
			else
				if gunsmithexp >= v.expreq then 
					table.insert( elements, {label = k, value = v, desc = ""})
				end
			end
		end
	end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.crafting,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
		lastmenu = "craftingmenu2",

	},
	function(data, menu)
		if(data.current == "backup") then
			_G[data.trigger](x)
		else
			craftingmenu4(x,y,data.current.value) 
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function craftingmenu2(x) 
	MenuData.CloseAll()
	local elements = {
	}
	if x == "ammo" then 
		for k,v in pairs(Config3.ammo) do 
			table.insert( elements, {label = k, value = v, desc = ""})
		end
	end
	if x == "weapons" then 
		for k,v in pairs(Config4.weapons) do 
			table.insert( elements, {label = k, value = v, desc = ""})
		end
	end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.crafting,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
		lastmenu = "craftingmenu",

	},
	function(data, menu)
		if(data.current == "backup") then
			_G[data.trigger]()
		else
			craftingmenu3(x,data.current.value) 
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function craftingmenu() 
	MenuData.CloseAll()
	local elements = {
		{label = Config2.Language.gunsmithexp..gunsmithexp, value = "", desc = ""},
		{label = Config2.Language.weaponcrafting, value = "weapons", desc = ""},
		{label = Config2.Language.ammocrafting, value = "ammo", desc = ""}
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.crafting,
		subtext    = '',
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
		if(data.current.value == "weapons") then
			craftingmenu2("weapons")
		end
		if(data.current.value == "ammo") then
			craftingmenu2("ammo")		
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function wepsmen() 
	MenuData.CloseAll()
	local elements = {
	}
	while playerweps == nil do 
		Wait(500)
	end
	for k,v in pairs(playerweps) do 
		local name = v.name
		if Config2.Language[name] ~= nil then 
			name = Config2.Language[name]
		end
		table.insert( elements, {label = name, value = v, desc = Config2.Language.presstobuy})
	end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config2.Language.presstobuy,
		subtext    = '',
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
		if(data.current ~= "backup") then
			globalhash = GetHashKey(data.current.value.name)
			weaponid = data.current.value.id
			added = data.current.value.comps
			TriggerEvent("syn_weapons:wepcomp",1)
            Citizen.Wait(500) 
			positiontemp = Config.customizationLocations[locationx].Pos2
            createobject(Config.customizationLocations[locationx].Pos2.x, Config.customizationLocations[locationx].Pos2.y, Config.customizationLocations[locationx].Pos2.z,globalhash)
			compmenu()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function compmenu()
	MenuData.CloseAll()
	local elements = {
		{label = "Buy",value = "buy",desc = Config2.Language.confirmbuy}
	}
    for k,v in pairs(WeaponComponentz) do 
        table.insert( elements, 
		{label = Config2.Language[k],catax = k,main = WeaponComponentz,tag = v, value = getcurrent(k,WeaponComponentz),desc = "" , type = "slider" , min =0 , max =keysx(v), hop= 1}
		)
    end
	for k,v in pairs(cos) do 
        table.insert( elements, 
		{label = Config2.Language[k],catax = k,main = cos,tag = v, value = getcurrent(k,cos),desc = "" , type = "slider" , min =0 , max =keysx(v), hop= 1}
		)
		
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Customize",
		subtext    = "Set Up",
		align    = 'top-left',
		elements = elements,
		lastmenu = "wepsmen",

	},
	function(data, menu)
		if data.current == "backup" then 
			createdobject = false 
			TriggerServerEvent("syn_weapons:deleteobjectserver",currentplayers)
			shop = {}
			added = {}
			sum = 0
			globalhash = nil
			weaponid = nil
			wephash = nil
			sumcash = 0 
			sumgold = 0
			cos = {}
			WeaponComponentz = {}
            _G[data.trigger]()
		elseif(data.current.value == "buy" ) then -- buy function
			TriggerServerEvent("syn_weapons:checkmoney",sumcash,sumgold)
			MenuData.CloseAll()
		else
			if data.current.value == 0 and data.current.catax ~= "GRIP" then 
				RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(added[data.current.catax]))
				TriggerServerEvent("syn_weapons:removemod",currentplayers,added[data.current.catax])
				added[data.current.catax] = nil 
				if shop[data.current.catax] ~= nil then 
					for k,v in pairs(data.current.main) do 
						if k == data.current.catax then 
							for x,y in pairs(v) do 	
								if y.item == shop[data.current.catax] then 
									sumcash = sumcash - y.cash
									sumgold = sumgold - y.gold
								end
							end
						end
					end
				end
				shop[data.current.catax] = nil

			elseif data.current.value ~= 0 then 
				local table = data.current.main[data.current.catax][data.current.value]
				for k,v in pairs(data.current.main[data.current.catax]) do
					RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(v.item))
				end

				if shop[data.current.catax] ~= nil then 
					for k,v in pairs(data.current.main) do 
						if k == data.current.catax then 
							for x,y in pairs(v) do 	
								if y.item == shop[data.current.catax] then 
									sumcash = sumcash - y.cash
									sumgold = sumgold - y.gold
								end
							end
						end
					end
				end
					sumcash = sumcash + table.cash
					sumgold = sumgold + table.gold
				added[data.current.catax] = table.item
				shop[data.current.catax] = table.item
				
				local model = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(table.item))
				if model ~= false then
					LoadModel(model)
				end
				GiveWeaponComponentToEntity(wepobject, GetHashKey(table.item), -1, true)
				if model ~= false then
					SetModelAsNoLongerNeeded(model)
				end
				TriggerServerEvent("syn_weapons:applymoddglobal",currentplayers,table,data.current.main[data.current.catax])
			end
		end
		
	end,
	function(data, menu)
		menu.close()
	end)
end
RegisterNetEvent("syn_weapons:removemod") 
AddEventHandler("syn_weapons:removemod", function(mod)
	if tonumber(wepobject) ~= nil then 
		RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(mod))
	end
end)
RegisterNetEvent("syn_weapons:applyyynow") 
AddEventHandler("syn_weapons:applyyynow", function(table,mods)
	if tonumber(wepobject) ~= nil then 
		for k,v in pairs(mods) do
			RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(v.item))
		end
		local model = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(table.item))
		if model ~= false then
			LoadModel(model)
		end
		GiveWeaponComponentToEntity(wepobject, GetHashKey(table.item), -1, true)
		if model ~= false then
			SetModelAsNoLongerNeeded(model)
		end
	end
end)

function playanim(anim,msg)
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, GetHashKey(anim), 20000, true, false, false, false)
	exports['progressBars']:startUI(20000, msg)
	Citizen.Wait(20000)
	ClearPedTasksImmediately(PlayerPedId())
end
function endprocess()
	shop = {}
	added = {}
	sum = 0
	globalhash = nil
	weaponid = nil
	wephash = nil
	sumcash = 0 
	sumgold = 0
	cos = {}
	WeaponComponentz = {}
	createdobject = false
	incustom = false 
	TriggerServerEvent("syn_weapons:deleteobjectserver",currentplayers)
	FreezeEntityPosition(PlayerPedId(),false)
end

RegisterNetEvent("syn_weapons:applymods")
AddEventHandler("syn_weapons:applymods", function()
	makeEntityFaceEntity(wepobject)
	playanim(Config.customizationanimation,Config2.Language.customloading)
	TriggerServerEvent("syn_weapons:addcomp",weaponid,added)
	for x,y in pairs(WeaponComponentz) do 
		for k,v in pairs(added) do 
			if x == k then 
				for g,m in pairs(y) do
					RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(m.item), globalhash)
				end
			end
		end
	end
	for x,y in pairs(cos) do 
		for k,v in pairs(added) do 
			if x == k then 
				for g,m in pairs(y) do
					RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(m.item), globalhash)
				end
			end
		end
	end
	for k,v in pairs(added) do 
		if k ~= "WRAP_TINT" then 
			local model = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(v))
			if model ~= false then
				LoadModel(model)
			end
			GiveWeaponComponentToEntity(PlayerPedId(), GetHashKey(v), hash, true)
			if model ~= false then
				SetModelAsNoLongerNeeded(model)
			end
		end
	end
	GiveWeaponComponentToEntity(PlayerPedId(), GetHashKey(added["WRAP_TINT"]), hash, true)
	endprocess()
end)

RegisterNetEvent("syn_weapons:nomods")
AddEventHandler("syn_weapons:nomods", function()
	endprocess()
end)

RegisterNetEvent("syn_weapons:minigamecheck")
AddEventHandler("syn_weapons:minigamecheck", function(type,table,amount,custominfox)
	TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(Config.craftinganimations), 15000, true, false, false, false)
	TriggerEvent("vorp_inventory:CloseInv")
    local testplayer = exports["syn_minigame"]:taskBar(table.diff,7)
	TriggerServerEvent("syn_weapons:minigamecheck2",testplayer,type,table,amount,custominfox)
	ClearPedTasks(PlayerPedId())
	crafting = false 
end)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
		if GetCurrentResourceName() == resourceName then
			FreezeEntityPosition(PlayerPedId(),false)
            for k,v in pairs(blips) do 
			    RemoveBlip(v)
            end
			if wepobject ~= nil and wepobject ~= false then 
				DeleteEntity(wepobject)
			end

        end
    end
)

function makeEntityFaceEntity(entity)
	local p2 = GetEntityCoords(entity, true)
	local p1 = GetEntityCoords(PlayerPedId(), true)
	local dx = p2.x - p1.x
	local dy = p2.y - p1.y
	local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( PlayerPedId(), heading )
end
function playanim(anim,msg)
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, GetHashKey(anim), 20000, true, false, false, false)
	exports['progressBars']:startUI(20000, msg)
	Citizen.Wait(20000)
	ClearPedTasksImmediately(PlayerPedId())
end

RegisterNetEvent("syn_weapons:recplayerweps")
AddEventHandler("syn_weapons:recplayerweps", function(x)
	playerweps = x
end)

RegisterNetEvent("syn_weapons:findjob")
AddEventHandler("syn_weapons:findjob", function(job,rank,gunsmith)
	playerjob = job
	playerrank = rank
	gunsmithexp = gunsmith
end)

function contains(table, element,element2)
	for k, v in pairs(table) do

        if v.comp == element and v.type == element2 then
        	return true
		end
    end
return false
end
function contains2(table, element)
	for k, v in pairs(table) do

        if v.comp == element then
        	return true
		end
    end
return false
end
function checkvalue(table, element)
	for k, v in pairs(table) do
        if v == element then
        	return true
		end
    end
return false
end

function GetPlayers()
	local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
			local tgt = GetPlayerPed(i)
			local targetCoords = GetEntityCoords(tgt)
			local coords = GetEntityCoords(PlayerPedId())
			local dist =  GetDistanceBetweenCoords(coords, targetCoords, false)
			if dist < 5 then
				if 6 > keysx(players) then 
            		table.insert(players, GetPlayerServerId(i))
				end
			end
        end
    end
    return players
end

function createobject(x, y, z, objecthash)
	currentplayers = GetPlayers()
	createdobject = true
	TriggerServerEvent("syn_weapons:weaponobjectserver",currentplayers,x,y,z,objecthash,added,positiontemp)
end  
RegisterNetEvent("syn_weapons:deleteobject")
AddEventHandler("syn_weapons:deleteobject", function()
	if wepobject ~= nil and wepobject ~= false  then 
		DeleteEntity(wepobject)
		wepobject = nil 
		createdobject = false 
	end
end)
RegisterNetEvent("syn_weapons:weaponobjectclient")
AddEventHandler("syn_weapons:weaponobjectclient", function(x,y,z,objecthash,added,poss)
		positiontemp = poss
		Citizen.InvokeNative(0x72D4CB5DB927009C,objecthash,1,true)
        while not Citizen.InvokeNative(0xFF07CF465F48B830,objecthash) do
            Wait(100)
        end
		wepobject = Citizen.InvokeNative(0x9888652B8BA77F73 , objecthash, 0,x,y,z,true,1.0)
		h = GetEntityHeading(wepobject)
		local tabley = GetEntityRotation(wepobject,1)
		local x,y,z = table.unpack(tabley)
		roll = x
		for x,y in pairs(WeaponComponentz) do 
			for k,v in pairs(added) do 
				if x == k then 
					for g,m in pairs(y) do
						RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(m.item))
					end
				end
			end
		end
		for x,y in pairs(cos) do 
			for k,v in pairs(added) do 
				if x == k then 
					for g,m in pairs(y) do
						RemoveWeaponComponentFromWeaponObject(wepobject, GetHashKey(m.item))
					end
				end
			end
		end
		for k,v in pairs(added) do 
			if k ~= "WRAP_TINT" then 
				local model = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(v))
				if model ~= false then
					LoadModel(model)
				end
				GiveWeaponComponentToEntity(wepobject, GetHashKey(v), -1, true)
				if model ~= false then
					SetModelAsNoLongerNeeded(model)
				end
			end
		end
		GiveWeaponComponentToEntity(wepobject, GetHashKey(added["WRAP_TINT"]), -1, true)
	--end
end)



function GetWeaponType(hash)
    if Citizen.InvokeNative(0x959383DCD42040DA, hash)  or Citizen.InvokeNative(0x792E3EF76C911959 , hash)   then
        return "MELEE_BLADE"
    elseif Citizen.InvokeNative(0x6AD66548840472E5, hash) or Citizen.InvokeNative(0x0A82317B7EBFC420, hash) or Citizen.InvokeNative(0xDDB2578E95EF7138, hash) then
        return "LONGARM"
	elseif  Citizen.InvokeNative(0xC75386174ECE95D5, hash) then
        return "SHOTGUN"
    elseif  Citizen.InvokeNative(0xDDC64F5E31EEDAB6, hash) or Citizen.InvokeNative(0xC212F1D05A8232BB , hash) then
        return "SHORTARM"
	end
	return false
end

function FindWeaponComponents(x)
	local _,wepHash
	if x == 2 then 
    	local ped = PlayerPedId()
    	local wep = GetCurrentPedWeaponEntityIndex(ped, 0)
    	_, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
	elseif x == 1 then 
		wepHash = globalhash
	end
	if model_specific_components ~= nil then 
    	for index, components in pairs(model_specific_components) do
    	    if GetHashKey(index) == wepHash then
    	        return components , index
    	    end
    	end
	end
    return {} , wepHash
end

RegisterNetEvent("syn_weapons:wepcomp") -- findme
AddEventHandler("syn_weapons:wepcomp", function(x)
	local WeaponHash
	local WeaponComponents , WeaponName = FindWeaponComponents(x)
	WeaponComponentz = WeaponComponents
	if tonumber(WeaponName) == nil then
        WeaponHash = GetHashKey(WeaponName)
    else
        WeaponHash = WeaponName
    end
	local WeaponType = GetWeaponType(WeaponHash)
	if shared_components ~= nil then 
		if shared_components[WeaponType] ~= nil then 
			cos = shared_components[WeaponType]
		else
			cos = {}
		end
	else
		cos = {}
	end
end)


RegisterNetEvent("syn_weapons:getgun")
AddEventHandler("syn_weapons:getgun", function(key,guncheck,qt,item,guncheck2,playeritem)
    local wephash = Citizen.InvokeNative(0x8425C5F057012DAB,PlayerPedId())
	local weaponName = tostring(Citizen.InvokeNative(0x89CF5FF3D363311E,wephash))
	local currentammo = GetPedAmmoByType(PlayerPedId(), GetHashKey(key))
	if (guncheck2 ~= 0 and Citizen.InvokeNative(guncheck2, wephash)) or Citizen.InvokeNative(guncheck,wephash) or guncheck == 0 then
        TriggerServerEvent("syn_weapons:addammo",wephash,qt,key,playeritem,item)
	else
		TriggerEvent("vorp:TipBottom", Config2.Language.wrongwptype, 4000)
		TriggerServerEvent("syn_weapons:givebackbox",item)
    end
end)

RegisterNetEvent("syn_weapons:givebackbox")
AddEventHandler("syn_weapons:givebackbox", function(item)
	TriggerServerEvent("syn_weapons:givebackbox",item)
end)


RegisterCommand(Config.checkguncommand, function()
	checkgun()
end)

function checkgun()
	local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
	local interaction = "LONGARM_HOLD_ENTER"
	local act = GetHashKey("LONGARM_CLEAN_ENTER")
    local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(),0))
	local cleaning = false 
	Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), "GENERIC_WEAPON_CLEAN_PROMPT_AVAILABLE", true, -1)
	if Citizen.InvokeNative(0xD955FEE4B87AFA07,weaponHash) then
		interaction = "SHORTARM_HOLD_ENTER"
		act = GetHashKey("SHORTARM_CLEAN_ENTER")
	end
	if weaponHash ~= -1569615261 then
		TaskItemInteraction(PlayerPedId(), weaponHash, GetHashKey(interaction), 0,0,0) 
		showstats()
		while not Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
			Wait(300)
		end		  
		while Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
			Wait(1) 
			if IsDisabledControlJustReleased(0,3002300392) then
				ClearPedTasks(PlayerPedId(),1,1)
				Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)			
			end
			if IsDisabledControlJustReleased(0,3820983707) and not cleaning then
				cleaning = true 
				local Cloth= CreateObject(GetHashKey('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
				local PropId = GetHashKey("CLOTH")
				Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, Cloth, PropId, act, 1, 0, -1.0)  
				Wait(9500) 
				ClearPedTasks(PlayerPedId(),1,1)
				Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)
				Citizen.InvokeNative(0xA7A57E89E965D839,object,0.0,0)
				Citizen.InvokeNative(0x812CE61DEBCAB948,object,0.0,0)
				break
			end
		end
		Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)	
	end
end

function showstats()
	local _, weapon = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
	if weapon then	
        local uiFlowBlock = RequestFlowBlock(GetHashKey("PM_FLOW_WEAPON_INSPECT"))
        local uiContainer = DatabindingAddDataContainerFromPath("" , "ItemInspection")
        Citizen.InvokeNative(0x46DB71883EE9D5AF, uiContainer, "stats", getWeaponStats(weapon), PlayerPedId())
        DatabindingAddDataString(uiContainer, "tipText", Config2.Language.wepinfo)
        DatabindingAddDataHash(uiContainer, "itemLabel", weapon)
        DatabindingAddDataBool(uiContainer, "Visible", true)

        Citizen.InvokeNative(0x10A93C057B6BD944, uiFlowBlock)
        Citizen.InvokeNative(0x3B7519720C9DCB45, uiFlowBlock, 0)
        Citizen.InvokeNative(0x4C6F2C4B7A03A266, -813354801, uiFlowBlock)
    end
end

function getWeaponStats(weaponHash) 
    local emptyStruct = DataView.ArrayBuffer(256)
    local charStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, emptyStruct:Buffer(), GetHashKey("CHARACTER"), -1591664384, charStruct:Buffer())
        
    local unkStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, charStruct:Buffer(), 923904168, -740156546, unkStruct:Buffer())

    local weaponStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, unkStruct:Buffer(), weaponHash, -1591664384, weaponStruct:Buffer())
    return weaponStruct:Buffer()
end

 