local prompts = {}
local mapblip = {}
local activeGroupIndex = 0
local PropmtXPTO = 1
local Busy = false
local ranchData = {ranchid = 1}
local GeneralRanchId = 1

function DrawCircle(x, y, z)
    if z == nil then
        local pcoords = GetEntityCoords(PlayerPedId())
        z = pcoords.z
    end
    Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, x, y, z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.25, 217, 17, 17, 50, 0, 0, 2, 0, 0, 0, 0)
end

Citizen.CreateThread(function()
    local player = PlayerPedId()
    if Config.EnableBlips then
        for _, v in pairs(Config.Blips) do
            local blipn =  Citizen.InvokeNative(0x554D9D53F696D002,1664425300, v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blipn, v.hash, 1)
            SetBlipScale(blipn, v.scale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blipn, v.name)
            local gelado = { id = v.id, name = v.name, state = v.state, blip = blipn}
            table.insert(mapblip, gelado)
        end
    end
    while true do
    Wait(1000)
        for _, item in pairs(Config.Stores) do
            local playerloc = GetEntityCoords(player, true, true)
            if (GetDistanceBetweenCoords(item.coords.x, item.coords.y, item.coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) > 50) and not Busy then
                Wait(5000)
            end
            while not Busy do
                Citizen.Wait(1)
                local playerloc = GetEntityCoords(player, true, true)
                for _, item in pairs(Config.Stores) do
                    if (GetDistanceBetweenCoords(item.coords.x, item.coords.y, item.coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) < 1.5) then
                        activeGroupIndex = PropmtXPTO
                        DrawCircle(item.coords.x, item.coords.y, item.coords.z, 217, 17, 17, 50)
                    else
                        activeGroupIndex = 0
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("Undeground:Ranch:Process")
AddEventHandler("Undeground:Ranch:Process", function(object, ProcessType, finalprod)
    local pcoords = GetEntityCoords(PlayerPedId())
    local coords = {x = (pcoords.x + 1), y = (pcoords.y + 1), z = (pcoords.z - 0.2)}
    if ProcessType == "1" then
        Busy = true
        PropmtXPTO = 2
    elseif ProcessType == "2" then
        Busy = true
        PropmtXPTO = 3
    elseif ProcessType == "3" then
        Busy = true
        PropmtXPTO = 4
    elseif ProcessType == "4" then
        Busy = false
        PropmtXPTO = 0
    elseif ProcessType == "cows1" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Cows[1].animalType
        local animalcolor = Config.AnimalTypes.Cows[1].animalColor
        local animalmodel = Config.AnimalTypes.Cows[1].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Cows[1].animalPrice
        local name = tostring(SetAnimalName())
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "cows2" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Cows[2].animalType
        local animalcolor = Config.AnimalTypes.Cows[2].animalColor
        local animalmodel = Config.AnimalTypes.Cows[2].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Cows[2].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "cows3" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Cows[3].animalType
        local animalcolor = Config.AnimalTypes.Cows[3].animalColor
        local animalmodel = Config.AnimalTypes.Cows[3].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Cows[3].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "cows4" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Cows[4].animalType
        local animalcolor = Config.AnimalTypes.Cows[4].animalColor
        local animalmodel = Config.AnimalTypes.Cows[4].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Cows[4].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "chicken1" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Chicken[1].animalType
        local animalcolor = Config.AnimalTypes.Chicken[1].animalColor
        local animalmodel = Config.AnimalTypes.Chicken[1].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Chicken[1].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "chicken2" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Chicken[2].animalType
        local animalcolor = Config.AnimalTypes.Chicken[2].animalColor
        local animalmodel = Config.AnimalTypes.Chicken[2].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Chicken[2].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "chicken3" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Chicken[3].animalType
        local animalcolor = Config.AnimalTypes.Chicken[3].animalColor
        local animalmodel = Config.AnimalTypes.Chicken[3].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Chicken[3].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "sheep1" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Sheep[1].animalType
        local animalcolor = Config.AnimalTypes.Sheep[1].animalColor
        local animalmodel = Config.AnimalTypes.Sheep[1].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Sheep[1].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "sheep2" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Sheep[2].animalType
        local animalcolor = Config.AnimalTypes.Sheep[2].animalColor
        local animalmodel = Config.AnimalTypes.Sheep[2].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Sheep[2].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "sheep3" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Sheep[3].animalType
        local animalcolor = Config.AnimalTypes.Sheep[3].animalColor
        local animalmodel = Config.AnimalTypes.Sheep[3].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Sheep[3].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    elseif ProcessType == "sheep4" then
        PropmtXPTO = 1
        local animaltype = Config.AnimalTypes.Sheep[4].animalType
        local animalcolor = Config.AnimalTypes.Sheep[4].animalColor
        local animalmodel = Config.AnimalTypes.Sheep[4].animalModel
        local ranchid = ranchData.ranchid
        local price = Config.AnimalTypes.Sheep[4].animalPrice
        local name = SetAnimalName()
        TriggerServerEvent('Underground:Ranch:BuyAnimal', ranchid, animaltype, animalmodel, animalcolor, price, name)
        Busy = false
    end
end)

function SetAnimalName()
    local AnimalName = ""
	--Citizen.CreateThread(function()
		AddTextEntry('FMMC_MPM_NA', "Name your animal:")
		DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0);
			Citizen.Wait(0);
		end
		if (GetOnscreenKeyboardResult()) then
            AnimalName = GetOnscreenKeyboardResult()
            print(1)
            print(AnimalName)
            return AnimalName
		end	
    --end)
    print(2)
    print(AnimalName)
    return AnimalName
end

function init()
    for groupIndex, v in pairs(Config.groups) do
        local actions = v.actions
        local prompt_group = GetRandomIntInRange(0, 0xffffff)
        Config.groups[groupIndex].prompt_group = prompt_group
        for index, av in pairs(actions) do
            local actionName = av[1]
            local controlAtIndex = Config.controlsorder[index]
            prompt = PromptRegisterBegin()
            PromptSetControlAction(prompt, controlAtIndex)
            PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", actionName))
            PromptSetEnabled(prompt, 1)
            PromptSetVisible(prompt, 1)
            PromptSetStandardMode(prompt, 1)
            PromptSetGroup(prompt, prompt_group)
            PromptRegisterEnd(prompt)
            table.insert(prompts, prompt)
            Citizen.Wait(50)
        end
    end
end

Citizen.CreateThread(
    function()
        init()
        while true do
            Citizen.Wait(0)
            if true then
            
            if activeGroupIndex == 0 then
                Wait(1000)
            else
                PromptSetActiveGroupThisFrame(Config.groups[activeGroupIndex].prompt_group, CreateVarString(10, "LITERAL_STRING", "Ranching "..Config.groups[activeGroupIndex].name))
                disablecontrols()
                if IsControlJustPressed(0, 0x07CE1E61) then
                    if NativeUipromptIsControlActionActive(0x07CE1E61) then -- check this control key
                        if activeGroupIndex > 1 then
                            activeGroupIndex = activeGroupIndex - 1
                        else
                            activeGroupIndex = 0
                        end
                    end
                end
                if IsControlJustPressed(0, 0xF84FA74F) then
                    if NativeUipromptIsControlActionActive(0xF84FA74F) then -- check this control key
                        -- if activeGroupIndex < #Config.groups then
                        activeGroupIndex = activeGroupIndex + 1
                    -- else
                    --     activeGroupIndex = 1
                    -- end
                    end
                end

                for index, control in pairs(Config.controlsorder) do
                    if IsControlJustPressed(0, control) then
                        if NativeUipromptIsControlActionActive(control) then
                            local object = Config.groups[activeGroupIndex].name
                            local ProcessType = Config.groups[activeGroupIndex].actions[index][2]
                            local finalprod = Config.groups[activeGroupIndex].actions[index][1]
                            TriggerEvent("Undeground:Ranch:Process", object, ProcessType, finalprod)
                            activeGroupIndex = 0
                        end
                    end
                end
            end
        end
    end
end)

function disablecontrols()
    DisableControlAction(0, 0xF8982F00, true)
end

function NativeUipromptIsControlActionActive(control)
    return Citizen.InvokeNative(0x1BE19185B8AFE299, control)
end

-- on resource stop remove all prompts
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        -- remove prompts
        for _, prompt in pairs(prompts) do
            PromptDelete(prompt)
        end
        -- remove blips
        for _, blip in pairs(mapblip) do
            RemoveBlip(blip.blip)
        end
    end
end)