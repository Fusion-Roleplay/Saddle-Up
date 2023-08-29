local AnimalsOnRanch, AnimalsFollowingAfterBuy, attackAnimals, animalsFollowing, spawnedAnimals = {}, {}, {}, {}, {}
local GeneralRanchId = 1
local breedingAnimals = {}
local ranchesData, animalsData = {}, {}
local Busy = false
local activeGroupIndex, prompts = 0, {}
local PropmtXPTO = 1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
        if AnimalsOnRanch ~= nil then
            print("not nil")
            for k,v in pairs(AnimalsOnRanch) do
                print(v)
                if v.type == "cows" then
                    print("go cow")
                    local coords = GetEntityCoords(v.animal)
                    for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                        if v.type == b.name then
                            if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                                TaskGoStraightToCoord(v.animal, b.coords.x, b.coords.y, b.coords.z, 1.0, -1, 0.0, 0.0)
                            end
                        end
                    end
                elseif v.type == "chickens" then
                    local coords = GetEntityCoords(v.animal)
                    for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                        if v.type == b.name then
                            if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                                TaskGoStraightToCoord(v.animal, b.coords.x, b.coords.y, b.coords.z, 1.0, -1, 0.0, 0.0)
                            end
                        end
                    end
                elseif v.type == "sheep" then
                    local coords = GetEntityCoords(v.animal)
                    for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                        if v.type == b.name then
                            if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                                TaskGoStraightToCoord(v.animal, b.coords.x, b.coords.y, b.coords.z, 1.0, -1, 0.0, 0.0)
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("Underground:Ranch:DepositAnimals")
AddEventHandler("Underground:Ranch:DepositAnimals", function()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(animalsFollowing) do
        TaskGoToCoordAnyMeans(v.animal, coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
    end
    if animalsFollowing ~= nil then
        for k,v in pairs(animalsFollowing) do
            for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                local dist = #(GetEntityCoords(v.animal) - vector3(b.coords.x, b.coords.y, b.coords.z))
                if dist < 10.0 then
                    if v.type == b.name then
                        if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                            print("at ranch")
                            TriggerServerEvent("Underground:Ranch:StoreAnimal", v.animalId)
                            table.insert(AnimalsOnRanch, v)
                            table.remove(animalsFollowing, k)
                        end
                    end
                end
            end
            --TaskGoToCoordAnyMeans(v.animal, coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
        end
    end
    if AnimalsFollowingAfterBuy ~= nil then
        for k,v in pairs(AnimalsFollowingAfterBuy) do
            for a, b in pairs(Config.Ranches[GeneralRanchId].zones) do
                local animal = GetEntityCoords(v.animal)
                --local dist = #((animal.x, animal.y, animal.z) - (b.coords.x, b.coords.y, b.coords.z))
                print(b.coords.xmax, b.coords.xmin, b.coords.ymax, b.coords.ymin, v.animal, animal.x)
                if v.type == b.name then
                    if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                        print("at ranch")
                        TriggerServerEvent("Underground:Ranch:StoreAnimal", v.animalId)
                        table.insert(AnimalsOnRanch, v)
                        table.remove(AnimalsFollowingAfterBuy,v)
                    end
                end
            -- missing check for animal type, 
            -- wrong dist but why ??? maybe cause no coords for b?
               --[[ local dist = GetDistanceBetweenCoords(animal.x, animal.y, animal.z, b.coords.x, b.coords.y, b.coords.z, false)
                print(dist.. " dist")
                if dist < 10.0 then
                    if v.type == b.name then
                        if coords.x < b.coords.xmin or coords.x > b.coords.xmax or coords.y < b.coords.ymin and coords.y > b.coords.ymax then
                            print("at ranch")
                            TriggerServerEvent("Underground:Ranch:StoreAnimal", v.animalId)
                            table.insert(AnimalsOnRanch, v)
                            table.remove(AnimalsFollowingAfterBuy,v)
                        end
                    end
                end]]
            end
            --TaskGoToCoordAnyMeans(v.animal, coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
        end
    end
end)

RegisterNetEvent("Underground:Ranch:AnimalFollowAnimal")
AddEventHandler("Underground:Ranch:SendAttackAnimal", function(pedone, pedtwo)
    table.insert(breedingAnimals, {pedone, pedtwo})
    TaskGoToEntity(pedone, pedtwo, -1, 1.0, 1.0, 1.0, 0)
end)

RegisterNetEvent("Underground:Ranch:SendAttackAnimal")
AddEventHandler("Underground:Ranch:SendAttackAnimal", function(animalmodel, animalcolor)
    local wolf
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 10.5, 10.5, 1.15))
    wolf = GetHashKey(animalmodel)
    RequestModel(wolf)
    while not HasModelLoaded(wolf) do
        Wait(10)
    end
    wolf = CreatePed(animalmodel, x, y, z, true, true, true)
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, wolf, animalcolor, 0)
    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wolf)
    table.insert(attackAnimals, wolf)

end)

RegisterNetEvent("Underground:Ranch:SpawnAnimalAfterBuy")
AddEventHandler("Underground:Ranch:SpawnAnimalAfterBuy", function(animalmodel, animalcolor, animalid, ranchid, type)
    local pcoords = GetEntityCoords(PlayerPedId())
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, 3.0, 0.0)
    RequestModel(animalmodel)
    while not HasModelLoaded(animalmodel) do
        Wait(100)
    end
    local animalspawn = CreatePed(animalmodel, coords.x, coords.y, coords.z, 128.7692, true, true, true, true)
    RequestPedVisibilityTracking(animalspawn)
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, animalspawn, animalcolor, 0)
    SetEntityAsMissionEntity(animalspawn, true, true)
    SetEntityInvincible(animalspawn, true)
    TaskFollowToOffsetOfEntity(animalspawn, PlayerPedId(), 0.0, 0.0, 0.0, 1.0, -1, 0.0, 1)
    local limonada = {animal = animalspawn, animalmodel = animalmodel, animalcolor = animalcolor, animalid = animalid, ranchid = ranchid, type = type, owner = GetPlayerServerId(PlayerId())}
    table.insert(AnimalsFollowingAfterBuy, limonada)
    table.insert(spawnedAnimals, limonada)
end)

RegisterNetEvent("Underground:Ranch:DeleteAllAnimals")
AddEventHandler("Underground:Ranch:DeleteAllAnimals", function()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(AnimalsFollowingAfterBuy) do
        AddExplosion(GetEntityCoords(v.animal), 27, 1.0, true, false, 1.0)
        DeleteEntity(v.animal)
    end
end)

RegisterNetEvent("Underground:Ranch:StopAnimalsFromFollowing")
AddEventHandler("Underground:Ranch:StopAnimalsFromFollowing", function()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(AnimalsFollowingAfterBuy) do
        TaskGoToCoordAnyMeans(v.animal, coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
    end
end)

RegisterNetEvent("Underground:Ranch:FollowAnimals")
AddEventHandler("Underground:Ranch:FollowAnimals", function()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(AnimalsFollowingAfterBuy) do
        TaskFollowToOffsetOfEntity(v.animal, PlayerPedId(), 0.0, 0.0, 0.0, 1.0, -1, 0.0, 1)
    end
end)

RegisterNetEvent("Underground:Ranch:CollectFromAnimal")
AddEventHandler("Underground:Ranch:CollectFromAnimal", function()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(spawnedAnimals) do
        local animalcoords = GetEntityCoords(v.animal)
        if #(coords - animalcoords) < 2.0 then
            if v.type == "cow" then
                TriggerServerEvent("Underground:Ranch:CollectFromAnimal", "cow")
                DeleteEntity(v.animal)
                --table.remove(spawnedAnimals, k)
            elseif v.type == "chicken" then
                TriggerServerEvent("Underground:Ranch:CollectFromAnimal", "chicken")
                DeleteEntity(v.animal)
                --table.remove(spawnedAnimals, k)
            elseif v.type == "sheep" then
                TriggerServerEvent("Underground:Ranch:CollectFromAnimal", "sheep")
                DeleteEntity(v.animal)
                --table.remove(spawnedAnimals, k)
            end
        end
    end
end)

RegisterNetEvent("Underground:Ranch:SetToBreeding")
AddEventHandler("Underground:Ranch:SetToBreeding", function()
    -- to do
end)

RegisterNetEvent("Underground:Ranch:SellToClosestPlayer")
AddEventHandler("Underground:Ranch:SellToClosestPlayer", function()
    local coords = GetEntityCoords(PlayerPedId())
    local closestPlayer = GetClosestPlayer()
    local closestDistance = GetDistanceBetweenCoords(coords, GetEntityCoords(GetPlayerPed(closestPlayer)), true)
    if closestPlayer ~= -1 and closestDistance <= 1.5 then
        TriggerServerEvent("Underground:Ranch:SellToClosestPlayer", GetPlayerServerId(closestPlayer))
    else
        print("No players nearby")
    end
end)

RegisterNetEvent("Underground:Ranch:PrintAnimalStats")
AddEventHandler("Underground:Ranch:PrintAnimalStats", function(animal)
    print(animal)
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(spawnedAnimals) do
        local animalcoords = GetEntityCoords(v.animal)
        if #(coords - animalcoords) < 1.5 then    
            print("PrintAnimalStats", v)
            return v
        else
            print("No animals nearby")
        end
    end
end)

RegisterNetEvent("Undeground:Ranch:AnimalSelector")
AddEventHandler("Undeground:Ranch:AnimalSelector", function(object, ProcessType, finalprod)
    local pcoords = GetEntityCoords(PlayerPedId())
    local coords = {x = (pcoords.x + 1), y = (pcoords.y + 1), z = (pcoords.z - 0.2)}

    if ProcessType == "care1" then
        -- Busy = true
        print("collect")
        TriggerEvent("Underground:Ranch:CollectFromAnimal")
        PropmtXPTO = 5
    
    elseif ProcessType == "care2" then
        -- Busy = true
        TriggerEvent("Underground:Ranch:FollowAnimals")
        PropmtXPTO = 5
    
    elseif ProcessType == "care3" then
        -- Busy = true
        TriggerEvent("Underground:Ranch:StopAnimalsFromFollowing")
        PropmtXPTO = 5
    
    --next page
    elseif ProcessType == "care4" then
        PropmtXPTO = 6
    
    elseif ProcessType == "care5" then
        -- Busy = true
        print("set to breeding")
        TriggerEvent("Underground:Ranch:SetToBreeding")
        PropmtXPTO = 6
    
    elseif ProcessType == "care6" then
        -- Busy = true
        print("sell to closest player")
        TriggerEvent("Underground:Ranch:SellToClosestPlayer")
        PropmtXPTO = 6
    
    elseif ProcessType == "care7" then
        -- Busy = true
        print("animal stats")
        TriggerEvent("Underground:Ranch:PrintAnimalStats")
        PropmtXPTO = 6
    
    elseif ProcessType == "care8" then
        PropmtXPTO = 5

    end
end)

Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do
    Wait(1000)
        for _, item in pairs(spawnedAnimals) do
            local playerloc = GetEntityCoords(player, true, true)
            local coords = GetEntityCoords(item.animal)
            if (GetDistanceBetweenCoords(coords.x, coords.y, coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) > 50) and not Busy then
                Wait(5000)
            end
            while not Busy do
                Citizen.Wait(1)
                local playerloc = GetEntityCoords(player, true, true)
                for _, item in pairs(spawnedAnimals) do
                    local coords = GetEntityCoords(item.animal)
                    if (GetDistanceBetweenCoords(coords.x, coords.y, coords.z, playerloc['x'], playerloc['y'], playerloc['z'], true) < 1.5) then
                        activeGroupIndex = 5
                        DrawCircle(coords.x, coords.y, coords.z, 217, 17, 17, 50)
                    else
                        activeGroupIndex = 0
                    end
                end
            end
        end
    end
end)

function initC()
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
        initC()
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
                            TriggerEvent("Undeground:Ranch:AnimalSelector", object, ProcessType, finalprod)
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
        for _, animal in pairs(AnimalsFollowingAfterBuy) do
            DeleteEntity(animal.animal)
        end
        for _, animal in pairs(AnimalsOnRanch) do
            DeleteEntity(animal.animal)
        end
        for _, animal in pairs(attackAnimals) do
            DeleteEntity(animal.animal)
        end
        for _, prompt in pairs(prompts) do
            PromptDelete(prompt)
        end
    end
end)


