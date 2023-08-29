local ranchData = {}
local Busy = false
local activeGroupIndex, prompts = 0, {}
local PropmtXPTO = 13
local GeneralRanchId = 1

RegisterNetEvent("Undeground:Ranch:WaterChickens")
AddEventHandler("Undeground:Ranch:WaterChickens", function()
    animWater()
end)

RegisterNetEvent("Undeground:Ranch:WaterCows")
AddEventHandler("Undeground:Ranch:WaterCows", function()
    animWater()
end)

RegisterNetEvent("Undeground:Ranch:WaterSheep")
AddEventHandler("Undeground:Ranch:WaterSheep", function()
    animWater()
end)

RegisterNetEvent("Undeground:Ranch:FillHayBales")
AddEventHandler("Undeground:Ranch:FillHayBales", function()

end)

RegisterNetEvent("Undeground:Ranch:CheckHayBales")
AddEventHandler("Undeground:Ranch:CheckHayBales", function()

end)

RegisterNetEvent("Undeground:Ranch:DistributeHayBales")
AddEventHandler("Undeground:Ranch:DistributeHayBales", function()

end)

RegisterNetEvent("Undeground:Ranch:CleanChickens")
AddEventHandler("Undeground:Ranch:CleanChickens", function()
    animClean()
end)

RegisterNetEvent("Undeground:Ranch:CleanCows")
AddEventHandler("Undeground:Ranch:CleanCows", function()
    animClean()
end)

RegisterNetEvent("Undeground:Ranch:CleanSheep")
AddEventHandler("Undeground:Ranch:CleanSheep", function()
    animClean()
end)

RegisterNetEvent("Undeground:Ranch:CleanRanch")
AddEventHandler("Undeground:Ranch:CleanRanch", function()
    animClean()
end)

RegisterNetEvent("Undeground:Ranch:FeedChickens")
AddEventHandler("Undeground:Ranch:FeedChickens", function()
    animFeedChicken()
end)

RegisterNetEvent("Undeground:Ranch:FeedCows")
AddEventHandler("Undeground:Ranch:FeedCows", function()
    animFeedChicken()
end)

RegisterNetEvent("Undeground:Ranch:FeedSheep")
AddEventHandler("Undeground:Ranch:FeedSheep", function()
    animFeedChicken()
end)

RegisterNetEvent("Undeground:Ranch:RanchTasksSelector")
AddEventHandler("Undeground:Ranch:RanchTasksSelector", function(object, ProcessType, finalprod)
    local pcoords = GetEntityCoords(PlayerPedId())
    local coords = {x = (pcoords.x + 1), y = (pcoords.y + 1), z = (pcoords.z - 0.2)}
    if ProcessType == "task1" then
        PropmtXPTO = 9

    elseif ProcessType == "task2" then
        PropmtXPTO = 10
        
    elseif ProcessType == "task3" then
        PropmtXPTO = 11

    elseif ProcessType == "task4" then
        PropmtXPTO = 12

    elseif ProcessType == "wt1" then        
        print("Chickens")
        TriggerEvent("Undeground:Ranch:WaterChickens")
        PropmtXPTO = 13
    
    elseif ProcessType == "wt2" then        
        print("Cows")
        TriggerEvent("Undeground:Ranch:WaterCows")
        PropmtXPTO = 13
    
    elseif ProcessType == "wt3" then        
        print("Sheep")
        TriggerEvent("Undeground:Ranch:WaterSheep")
        PropmtXPTO = 13
    
    elseif ProcessType == "hb1" then        
        print("Fill")
        TriggerEvent("Undeground:Ranch:FillHayBales")
        PropmtXPTO = 13
    
    elseif ProcessType == "hb2" then        
        print("Check")
        TriggerEvent("Undeground:Ranch:CheckHayBales")
        PropmtXPTO = 13
    
    elseif ProcessType == "hb3" then        
        print("Distribute")
        TriggerEvent("Undeground:Ranch:DistributeHayBales")
        PropmtXPTO = 13
    
    elseif ProcessType == "cl1" then
        TriggerEvent("Undeground:Ranch:CleanChickens")
        PropmtXPTO = 13
        print("Chickens")

    elseif ProcessType == "cl2" then
        print("Cows")
        TriggerEvent("Undeground:Ranch:CleanCows")
        PropmtXPTO = 13

    elseif ProcessType == "cl3" then
        print("Sheep")
        TriggerEvent("Undeground:Ranch:CleanSheep")
        PropmtXPTO = 13

    elseif ProcessType == "cl4" then
        print("Ranch")
        TriggerEvent("Undeground:Ranch:CleanRanch")
        PropmtXPTO = 13

    elseif ProcessType == "fd1" then
        print("Chickens")
        TriggerEvent("Undeground:Ranch:FeedChickens")
        PropmtXPTO = 13

    elseif ProcessType == "fd2" then
        print("Cows")
        TriggerEvent("Undeground:Ranch:FeedCows")
        PropmtXPTO = 13

    elseif ProcessType == "fd3" then
        print("Sheep")
        TriggerEvent("Undeground:Ranch:FeedSheep")
        PropmtXPTO = 13

    end
end)

Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do
    Wait(1000)
    print("hello")
        --[[for k, v in pairs(Config.Ranches[GeneralRanchId].zones) do
            local playerloc = GetEntityCoords(player, true, true)
            print("playerloc: "..v.care.coords.x)
            print("playerloc: "..v.care.coords.y)
            print("playerloc: "..v.care.coords.z)
            while (GetDistanceBetweenCoords(v.care.coords.x, v.care.coords.y, v.care.coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) > 50) and not Busy do
                print("waiting")
                Wait(5000)
            end]]
            while not Busy do
                Citizen.Wait(1)
                local playerloc = GetEntityCoords(player, true, true)
                for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                    if (GetDistanceBetweenCoords(b.care.coords.x, b.care.coords.y, b.care.coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) < 2.5) then
                        --Citizen.Wait(1)
                        activeGroupIndex = PropmtXPTO
                        DrawCircle(b.care.coords.x, b.care.coords.y, b.care.coords.z, 217, 17, 17, 50)
                    else
                        activeGroupIndex = 0
                        
                    end
                end
            end
        --end
    end
end)
function initA()
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
        initA()
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
                            TriggerEvent("Undeground:Ranch:RanchTasksSelector", object, ProcessType, finalprod)
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
