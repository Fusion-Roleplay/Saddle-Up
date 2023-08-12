local TbacGroupName = Config.language.search
local TbacGroup
local created = false 
local Wprompt
local inmenu = false
local playerjob
local robedjob
local robedcharid
local robedmoney
local robedgold
local robbedserverid 
local robbedidentifer
local prompts = GetRandomIntInRange(0, 0xffffff)
local searchbutton

TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)
RegisterNetEvent("syn:closeinv")
AddEventHandler("syn:closeinv", function()
    if inmenu then 
	    inmenu = false 
        ClearPedSecondaryTask(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
        RemoveAnimDict("amb_work@world_human_crouch_inspect@male_c@idle_a")
        TriggerServerEvent("syn_search:endsearch",robedcharid)
    end
end)
AddEventHandler('menuapi:closemenu', function()
    if inmenu then 
	    inmenu = false 
        ClearPedSecondaryTask(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
        RemoveAnimDict("amb_work@world_human_crouch_inspect@male_c@idle_a")
        TriggerServerEvent("syn_search:endsearch",robedcharid)
    end
end)
RegisterNetEvent('syn_search:recjob')
AddEventHandler('syn_search:recjob', function(x,y)
	playerjob = x 
end)

RegisterNetEvent('syn_search:recinfo')
AddEventHandler('syn_search:recinfo', function(a,b,c,d,e,f)
	robedjob = a
	robedcharid = b
	robedmoney = c
	robedgold = d
    robbedserverid = e
    robbedidentifer = f
    FreezeEntityPosition(PlayerPedId(), true)
    searchmenu()
    
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    
    local str = Config.language.search
    searchbutton = PromptRegisterBegin()
    PromptSetControlAction(searchbutton, Config.keys["G"])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(searchbutton, str)
    PromptSetEnabled(searchbutton, 1)
    PromptSetVisible(searchbutton, 1)
    PromptSetStandardMode(searchbutton,1)
    PromptSetGroup(searchbutton, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,searchbutton,true)
    PromptRegisterEnd(searchbutton)
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(y)
	TriggerServerEvent('syn_search:getjob')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if inmenu then 
            sleep = false 
            if not IsEntityPlayingAnim(PlayerPedId(), "amb_work@world_human_crouch_inspect@male_c@idle_a", "idle_c", 3) then
                local waiting = 0
                RequestAnimDict("amb_work@world_human_crouch_inspect@male_c@idle_a")
                while not HasAnimDictLoaded("amb_work@world_human_crouch_inspect@male_c@idle_a") do
                    waiting = waiting + 100
                    Citizen.Wait(100)
                    if waiting > 5000 then
                        break
                    end
                end
                Citizen.Wait(100)
                TaskPlayAnim(PlayerPedId(), 'amb_work@world_human_crouch_inspect@male_c@idle_a', 'idle_c', 8.0, 8.0, 120000, 31, 0, true, 0, false, 0, false)
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
        local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId())
        local isDead = IsEntityDead(PlayerPedId())

        if hogtied or handcuffed or isDead then
            sleep = false  
            DisableControlAction(0, 0xC1989F95, true)
            if not close then 
                close = true 
                closeinv()
            end
        else 
            if close then 
                close = false 
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

function closeinv()
    TriggerEvent("vorp_inventory:CloseInv")
    inmenu = false 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        local coords = GetEntityCoords(PlayerPedId())
        local coords2 = GetEntityCoords(tgt1)
        if inmenu then 
            if GetDistanceBetweenCoords(coords,coords2 , true) > 1.5 then
                MenuData.CloseAll()
                closeinv()
                ClearPedSecondaryTask(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(), false)
                RemoveAnimDict("amb_work@world_human_crouch_inspect@male_c@idle_a")
                TriggerServerEvent("syn_search:endsearch",robedcharid)
            end
        end
        if IsPedOnFoot(PlayerPedId()) and Citizen.InvokeNative(0xD806CD2A4F2C2996,PlayerPedId()) == false and not IsEntityDead(PlayerPedId())   then 
            if closestPlayer ~= -1 and 1.0 >= closestDistance and not inmenu  then
                TbacGroup = Citizen.InvokeNative(0xB796970BD125FCE8,tgt1) 
                local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, tgt1)
                local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, tgt1)
                local isDead = IsEntityDead(tgt1)
                local allowsearch = true 
                if Config.jobonly then 
                    if not  contains(Config.jobs,playerjob) then 
                        allowsearch = false 
                    end
                end
                if allowsearch then 
                    if hogtied and Config.hogtie then 
                        if not IsEntityDead(tgt1) then
                            if not created then
                                Citizen.Wait(500)
                                if Citizen.InvokeNative(0x3AA24CCC0D451379, tgt1) then 
                                    Wprompt = SetupPrompt(1, Config.keys["G"], TbacGroup, TbacGroupName)
                                    created = true
                                end
                            end
                            if IsDisabledControlJustReleased(0,Config.keys["G"]) then 
                                local let = false 
                                inmenu = true 
                                TriggerServerEvent("syn_search:getinfo",playerid,false)
                            end
                        else
                            hogtied = false 
                            if created then 
                                PromptDelete(Wprompt)
                                created = false
                            end
                        end
                    elseif handcuffed and Config.handcuff then
                        if not Citizen.InvokeNative(0x3AA24CCC0D451379, tgt1) then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.language.search)
                            PromptSetActiveGroupThisFrame(prompts, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,searchbutton) then
                                if not IsEntityDead(tgt1) then 
                                    local let = false 
                                    inmenu = true 
                                    TriggerServerEvent("syn_search:getinfo",playerid,false)
                                end
                            end
                        end
                    elseif isDead and Config.isDead then 
                        if not created then
                            Wprompt = SetupPrompt(1, Config.keys["G"], TbacGroup, TbacGroupName)
                            created = true
                        end
                        if IsDisabledControlJustReleased(0,Config.keys["G"]) then 
                            local let = false 
                            inmenu = true 
                            TriggerServerEvent("syn_search:getinfo",playerid,false)
                        end
                    end
                end
            else
                if created then 
                    PromptDelete(Wprompt)
                    created = false
                end
            end
        else
            if created then 
                PromptDelete(Wprompt)
                created = false
            end
        end

    end
end)

function searchmenu()
    MenuData.CloseAll()
    local elements = {
	}
    if Config.stealcash then 
        table.insert( elements, {label = Config.language.cash..robedmoney, value = 'cash' , desc = Config.language.takecash})
    else
        if Config.bypasscash then 
            if contains(Config.jobs,playerjob) then 
                table.insert( elements, {label = Config.language.cash..robedmoney, value = 'cash' , desc = Config.language.takecash})
            end
        end
    end

    if Config.stealgold then 
        table.insert( elements, {label = Config.language.gold..robedgold, value = 'gold' , desc = Config.language.takegold})
    else
        if Config.bypassgold then 
            if contains(Config.jobs,playerjob) then 
                table.insert( elements, {label = Config.language.gold..robedgold, value = 'gold' , desc = Config.language.takegold})
            end
        end
    end

    if Config.stealitems or Config.stealguns then 
        table.insert( elements, {label = Config.language.inventory, value = 'inv' , desc = Config.language.searchinv})
    else
        if Config.bypassitems or Config.bypassguns then 
            if contains(Config.jobs,playerjob) then 
                table.insert( elements, {label = Config.language.inventory, value = 'inv' , desc = Config.language.searchinv})
            end
        end
    end

   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.language.searchmenu,
		subtext    = Config.language.searchmenusub,
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
		if(data.current.value == "cash") then
            if not Config.jobonlytake or (Config.jobonlytake and contains(Config.jobs,playerjob)) then  
                TriggerEvent("syn_inputs:sendinputs", Config.language.confirm, Config.language.amount, function(cb)
			    	local amount =     tonumber(cb)
			    	if amount ~= nil and amount > 0 then
                        TriggerServerEvent("syn_search:takecash",amount,robbedserverid)
                        MenuData.CloseAll()
                        local let = true 
                        TriggerServerEvent("syn_search:getinfo",robbedserverid,let)
                    else
                        MenuData.CloseAll()
                        local let = true 
                        TriggerServerEvent("syn_search:getinfo",robbedserverid,let)
			    	end
			    end)
            end
		end
        if(data.current.value == "gold") then 
            if not Config.jobonlytake or (Config.jobonlytake and contains(Config.jobs,playerjob)) then
                TriggerEvent("syn_inputs:sendinputs", Config.language.confirm, Config.language.amount, function(cb)
			    	local amount =     tonumber(cb)
			    	if amount ~= nil and amount > 0 then
                        TriggerServerEvent("syn_search:takegold",amount,robbedserverid)
                        MenuData.CloseAll()
                        local let = true 
                        TriggerServerEvent("syn_search:getinfo",robbedserverid,let)
                    else
                        MenuData.CloseAll()
                        local let = true 
                        TriggerServerEvent("syn_search:getinfo",robbedserverid,let)
			    	end
			    end)
            end
		end
        if(data.current.value == "inv") then 
            MenuData.CloseAll()
            TriggerServerEvent("syn_search:ReloadstealInventory", robedcharid,robbedidentifer,robbedserverid)
            Citizen.Wait(500)
            TriggerEvent("vorp_inventory:OpenstealInventory", Config.language.search,robbedserverid)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end
AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        PromptDelete(Wprompt) 
    end
end)


