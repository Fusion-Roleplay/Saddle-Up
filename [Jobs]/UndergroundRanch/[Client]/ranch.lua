local ranchData = {}
local Busy = false
local activeGroupIndex, prompts = 0, {}
local PropmtXPTO = 7
local GeneralRanchId = 1

RegisterNetEvent("Undeground:Ranch:Hire")
AddEventHandler("Undeground:Ranch:Hire", function()
    ServerEvent('Underground:Ranch:AddEmployee', ranchid, steamid, charid)
end)

RegisterNetEvent("Undeground:Ranch:Fire")
AddEventHandler("Undeground:Ranch:Fire", function()
    TriggerServerEvent('Underground:Ranch:RemoveEmployee', ranchid, steamid, charid)
end)

RegisterNetEvent("Undeground:Ranch:Verify")
AddEventHandler("Undeground:Ranch:Verify", function()
    print("Verify (to do)")
end)

RegisterNetEvent("Undeground:Ranch:Transfer")
AddEventHandler("Undeground:Ranch:Transfer", function()
    TriggerServerEvent('Underground:Ranch:Transfer', ranchid, steamid, charid)
end)

RegisterNetEvent("Undeground:Ranch:Sell")
AddEventHandler("Undeground:Ranch:Sell", function()
    TriggerServerEvent('Underground:Ranch:Sell', ranchid)
end)

RegisterNetEvent("Undeground:Ranch:FireAll")
AddEventHandler("Undeground:Ranch:FireAll", function()

end)

RegisterNetEvent("Undeground:Ranch:BossMenuSelector")
AddEventHandler("Undeground:Ranch:BossMenuSelector", function(object, ProcessType, finalprod)
    local pcoords = GetEntityCoords(PlayerPedId())
    local coords = {x = (pcoords.x + 1), y = (pcoords.y + 1), z = (pcoords.z - 0.2)}

    if ProcessType == "rm1" then
        print("Hire")
        TriggerEvent("Undeground:Ranch:Hire")
        PropmtXPTO = 7
    
    elseif ProcessType == "rm2" then
        print("Fire")
        TriggerEvent("Undeground:Ranch:Fire")
        PropmtXPTO = 7
    
    elseif ProcessType == "rm3" then
        print("Verify")
        TriggerEvent("Undeground:Ranch:Verify")
        PropmtXPTO = 7
    
    --next page
    elseif ProcessType == "rm4" then
        PropmtXPTO = 8
    
    elseif ProcessType == "rm5" then
        print("Transfer")
        TriggerEvent("Undeground:Ranch:Transfer")
        PropmtXPTO = 8
    
    elseif ProcessType == "rm6" then
        print("Sell")
        TriggerEvent("Undeground:Ranch:Sell")
        PropmtXPTO = 8
    
    elseif ProcessType == "rm7" then
        print("Fire All")
        TriggerEvent("Undeground:Ranch:FireAll")
        PropmtXPTO = 8
    
        -- page before
    elseif ProcessType == "rm8" then
        PropmtXPTO = 7

    end
end)

Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do
    Wait(1000)
            local playerloc = GetEntityCoords(player, true, true)
            if (GetDistanceBetweenCoords(Config.Ranches[GeneralRanchId].coords.x, Config.Ranches[GeneralRanchId].coords.y, Config.Ranches[GeneralRanchId].coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) > 50) and not Busy then
                Wait(5000)
            end
            while not Busy do
                Citizen.Wait(1)
                local playerloc = GetEntityCoords(player, true, true)
                    if (GetDistanceBetweenCoords(Config.Ranches[GeneralRanchId].coords.x, Config.Ranches[GeneralRanchId].coords.y, Config.Ranches[GeneralRanchId].coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) < 1.5) then
                        --Citizen.Wait(1)
                        activeGroupIndex = PropmtXPTO
                        DrawCircle(Config.Ranches[GeneralRanchId].coords.x, Config.Ranches[GeneralRanchId].coords.y, Config.Ranches[GeneralRanchId].coords.z, 217, 17, 17, 50)
                    else
                    
                    activeGroupIndex = 0
                    end
            end
    end
end)

function initB()
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
        initB()
        while true do
            Citizen.Wait(0)
            if not Busy then
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
                            TriggerEvent("Undeground:Ranch:BossMenuSelector", object, ProcessType, finalprod)
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

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, prompt in pairs(prompts) do
            PromptDelete(prompt)
        end
    end
end)