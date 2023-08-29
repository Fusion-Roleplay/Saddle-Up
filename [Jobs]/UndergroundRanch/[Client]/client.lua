--[[
function DrawTextureonHead(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
       RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
        DrawTextureonHead("overhead", "overhead_generic_arrow", 0.5, 0.5, 0.251, 0.251, 0.0, 0, 0, 0, 240, false);
	end
end)
]]
function TxtAtWorldCoord(x, y, z, txt, size, font)
    local s, sx, sy = GetScreenCoordFromWorldCoord(x, y ,z)
    if (sx > 0 and sx < 1) or (sy > 0 and sy < 1) then
        local s, sx, sy = GetHudScreenPositionFromWorldPosition(x, y, z)
        DrawTxt(txt, sx, sy, size, true, 255, 255, 255, 255, true, font) -- Font 2 has some symbol conversions ex. @ becomes the rockstar logo
    end
end

function DrawTxt(str, x, y, size, enableShadow, r, g, b, a, centre, font)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(1, size)
    SetTextColor(math.floor(r), math.floor(g), math.floor(b), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    SetTextFontForCurrentCommand(font)
    DisplayText(str, x, y)
end

function RemoveEntity(entity)
    Citizen.CreateThread(function()
        SetEntityAsMissionEntity(entity, true, true)
        DeletePed(entity)
        DeleteEntity(entity)
    end)
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y = GetHudScreenPositionFromWorldPosition(x, y, z)
    local size = 0.3

    SetTextScale(size, size)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str, _x, _y)

    local w, h = GetScreenResolution()

    DrawSprite("generic_textures", "hud_menu_4a", _x, _y + 0.0125, string.len(text) * (20 * size) / w, 60 * size / h, 0.1, 100, 1, 1, 190, 0)
end

-- 0x94B745CE41DB58A1 0x195CBF86
-- CREATE_SCENARIO_POINT
-- local retval --[[ Any ]] =
-- CreateScenarioPoint(
--     scenario --[[ scenarioHash ]], 
--     x --[[ number ]], 
--     y --[[ number ]], 
--     z --[[ number ]], 
--     heading --[[ number ]], 
--     p5 --[[ Any ]], 
--     p6 --[[ Any ]], 
--     p7 --[[ Any ]]
-- )

--- 0xEA31F199A73801D3 Scenario is Occupied
--- 0x81948DFE4F5A0283 Delete Scenario
--- 0x5A59271FFADD33C1 DoesScenarioExistInArea()

local scenarioId = 0
local scenarioDatas = {}

Citizen.CreateThread(function()
    if Config.Debug == 1 then
        while true do
            Citizen.Wait(10)
            for id, scenarioData in pairs(scenarioDatas) do
                local test = '[ ' .. tostring(id) .. ' ]' ..
                        '\nstart: ' .. tostring(scenarioData._start) .. ' | ' .. tostring(N_0xea31f199a73801d3(scenarioData._start)) ..
                        '\nend: ' .. tostring(scenarioData._end) .. ' | ' .. tostring(N_0xea31f199a73801d3(scenarioData._end)) ..
                        '\nentity: ' .. tostring(scenarioData.entity) .. ' | ' .. tostring(GetEntityAttachedTo(scenarioData.entity)) .. 
                        '\n' .. scenarioData.name ..
                        '\n' .. scenarioData.description
                TxtAtWorldCoord(scenarioData.coord.x, scenarioData.coord.y, scenarioData.coord.z + 1.0, test, 0.2, 1)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        for id, scenarioData in pairs(scenarioDatas) do
            if N_0xea31f199a73801d3(scenarioData._start) == 0 and N_0xea31f199a73801d3(scenarioData._end) == 0 then
                if not scenarioData.started then
                    scenarioData.started = true
                    TriggerEvent('immersion:job_started:' .. id, scenarioData)
                end
            end
            if (GetEntityAttachedTo(scenarioData.entity) == 0 or not (N_0xea31f199a73801d3(scenarioData._end) == 0)) and N_0xea31f199a73801d3(scenarioData._start) == 0 then
                if not (N_0xea31f199a73801d3(scenarioData._end) == 0) then
                    scenarioData.item_returned = true
                else
                    scenarioData.item_returned = false
                end
                scenarioData.started = false
                TriggerEvent('immersion:job_ended:' .. id, scenarioData)
                Citizen.Wait(500)
                local coord = scenarioData.coord
                N_0x81948dfe4f5a0283(scenarioData._start) -- DELETE_SCENARIO_POINT
                print('Spawning new feed')
                print('New Scenario Start:', scenarioData._start)
                scenarioData._start = N_0x94b745ce41db58a1(scenarioData._start_hash, coord.x, coord.y, coord.z, scenarioData.coord.h) -- CREATE_SCENARIO_POINT
                Citizen.Wait(50)

                RemoveEntity(scenarioData.entity)

                Citizen.Wait(50)

                scenarioData.entity = DetectEntityAtCoords(coord.x, coord.y, coord.z, scenarioData.detectionSize, scenarioData.entity)
            end
        end
    end
end)

function CreateStartEndScenarion(name, description, startScenario, endScenario, x, y, z, h, detectionSize)
    scenarioId = scenarioId + 1
    local id = scenarioId
    Citizen.CreateThread(function()
        local scenarioData = {}
        scenarioData.name = name
        scenarioData.description = description
        scenarioData.started = false
        scenarioData.coord = {}
        scenarioData.coord.x = x
        scenarioData.coord.y = y
        scenarioData.coord.z = z
        scenarioData.coord.h = h
        scenarioData._start = N_0x94b745ce41db58a1(startScenario, x, y, z, h) -- CREATE_SCENARIO_POINT
        scenarioData._start_hash = startScenario
        scenarioData._end = N_0x94b745ce41db58a1(endScenario, x, y, z, h) -- CREATE_SCENARIO_POINT
        scenarioData._end_hash = endScenario
        scenarioData.detectionSize = detectionSize

        scenarioData.entity = DetectEntityAtCoords(x, y, z, detectionSize)

        print('Scenario Start: ', scenarioData._start)
        print('Scenario End: ', scenarioData._end)
        print('Scenario Entity: ', scenarioData.entity)

        scenarioDatas[id] = scenarioData
    end)
    return id
end

function DetectEntityAtCoords(x, y, z, size, exclude)
    local shapeTest = StartShapeTestBox(x, y, z, size, size, size, 0.0, 0.0, 0.0, true, 16, exclude)
    local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
    local attempts = 0
    while entityHit == 0 and attempts < 1000 do
        Citizen.Wait(1)
        attempts = attempts + 1
        shapeTest = StartShapeTestBox(x, y, z, size, size, size, 0.0, 0.0, 0.0, true, 16, exclude)
        rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
    end
    return entityHit
end

-- START Feed Job
local feedJobActive = false
local feedJobData = false
local feedJobScenario = false
local feedJobScenarioCoords = { x=0, y=0, z=0 }
local feedJobActivityCount = 0
local feedJobNextDistance = 0.5
local feedJobRecentlyActive = false
-- END Feed Job

Citizen.CreateThread(function()
    Citizen.Wait(30000)

    -- START Feed Job
    local feedJob = CreateStartEndScenarion('Feed Chickens', 'Find some chickens to feed.', GetHashKey('WORLD_PLAYER_CHORES_FEEDBAG_PICKUP'), GetHashKey('WORLD_PLAYER_CHORES_FEEDBAG_PUTDOWN'), -249.39, 685.53, 112.33, 332.19, 1.0)

    print('FeedJob:', feedJob)
    

    RegisterNetEvent('immersion:job_started:' .. feedJob)
    AddEventHandler('immersion:job_started:' .. feedJob, function(_scenario)
        print('Job Started: ' .. _scenario.name)
        feedJobActive = true
        feedJobData = _scenario
        feedJobActivityCount = 0
    end)

    RegisterNetEvent('immersion:job_ended:' .. feedJob)
    AddEventHandler('immersion:job_ended:' .. feedJob, function(_scenario)
        print('Job Ended: ' .. _scenario.name)
        print('Tasks Completed: ' .. tostring(feedJobActivityCount))
        print('Item Returned: ' .. tostring(_scenario.item_returned))
        if feedJobScenario then
            N_0x81948dfe4f5a0283(feedJobScenario) -- DELETE_SCENARIO_POINT
        end
        feedJobActive = false
        feedJobScenario = false
    end)
    -- END Feed Job

    -- START Feed Job 2
    local feedJob2 = CreateStartEndScenarion(
        'Feed Chickens 2', 'Drop some feed in th chicken coop.',
        GetHashKey('WORLD_PLAYER_CHORES_FEEDBAG_PICKUP'), GetHashKey('WORLD_PLAYER_CHORES_FEEDBAG_PUTDOWN'),
        -246.88, 679.08, 112.32, 137.36,
        1.0
    )

    print('FeedJob2:', feedJob2)

    local feedJob2Data = false
    local feedJob2Scenario = false
    local feedJob2Completed = false
    local feedJob2Coord = randomizeScenario2Coord()

    RegisterNetEvent('immersion:job_started:' .. feedJob2)
    AddEventHandler('immersion:job_started:' .. feedJob2, function(_scenario)
        print('Job Started: ' .. _scenario.name)
        feedJob2Data = _scenario
        feedJob2Coord = randomizeScenario2Coord()
        feedJob2Scenario = N_0x94b745ce41db58a1(GetHashKey('WORLD_PLAYER_CHORES_FEED_CHICKENS'), feedJob2Coord.x, feedJob2Coord.y, feedJob2Coord.z, feedJob2Coord.h) -- CREATE_SCENARIO_POINT
        feedJob2Completed = false
        print('Feed Location: ' .. tostring(feedJob2Scenario))
    end)

    RegisterNetEvent('immersion:job_ended:' .. feedJob2)
    AddEventHandler('immersion:job_ended:' .. feedJob2, function(_scenario)
        print('Job Ended:' .. _scenario.name)
        print('Job Complete: ' .. tostring(feedJob2Completed))
        print('Item Returned: ' .. tostring(_scenario.item_returned))
        N_0x81948dfe4f5a0283(feedJob2Scenario) -- DELETE_SCENARIO_POINT
        feedJob2Scenario = false
    end)

    while true do
        Citizen.Wait(10)
        if feedJob2Scenario then
            local player = PlayerPedId()
            if Config.Debug == 1 then
                local str = 'Completed: ' .. tostring(feedJob2Completed) ..
                            '\nPedInScen: ' .. tostring(IsPedActiveInScenario(player)) ..
                            '\nScenExists: ' .. DoesScenarioExistInArea(feedJob2Coord.x, feedJob2Coord.y, feedJob2Coord.z, 1.0) ..
                            '\nScenOccupied: ' .. tostring(IsScenarioOccupied(feedJob2Scenario))
                TxtAtWorldCoord(feedJob2Data.coord.x, feedJob2Data.coord.y, feedJob2Data.coord.z + 1.0, str, 0.3, 1)
            end
            if not feedJob2Completed and DoesScenarioExistInArea(feedJob2Coord.x, feedJob2Coord.y, feedJob2Coord.z, 1.0) == 1 then
                DrawText3D(feedJob2Coord.x, feedJob2Coord.y, feedJob2Coord.z, 'Feed Chicken Coop')
            end
            if not feedJob2Completed and (DoesScenarioExistInArea(feedJob2Coord.x, feedJob2Coord.y, feedJob2Coord.z, 1.0) == 0 or IsPedActiveInScenario(player) == 1) then
                feedJob2Completed = true
            elseif feedJob2Completed then
                DrawText3D(feedJob2Data.coord.x, feedJob2Data.coord.y, feedJob2Data.coord.z, 'Return Feed')
            end
        end
    end
    -- END Feed Job 2
end)
-- START Feed Job 2
function randomizeScenario2Coord()
    local coord = {}
    coord.x = GetRandomFloatInRange(-246.75, -247.75)
    coord.y = GetRandomFloatInRange(673.0, 676.0)
    coord.z = 113.5
    coord.h = GetRandomFloatInRange(0.0, 360.0)
    return coord
end
-- END Feed Job 2

-- START Feed Job
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if feedJobActive then
            DrawText3D(feedJobData.coord.x, feedJobData.coord.y, feedJobData.coord.z, 'Return Feed')
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)

            if Config.Debug == 1 then
                local str = 'Completed Tasks: ' .. tostring(feedJobActivityCount) .. tostring(feedJobActivityCount < 4) ..
                            '\nPedInScen: ' .. tostring(IsPedActiveInScenario(player)) ..
                            '\nRecently Active: ' .. tostring(feedJobRecentlyActive) ..
                            '\nNext Distance: ' .. tostring(feedJobNextDistance) ..
                            '\nDistance From Last: ' .. tostring(GetDistanceBetweenCoords(feedJobScenarioCoords.x, feedJobScenarioCoords.y, feedJobScenarioCoords.z, coords.x, coords.y, coords.z)) .. tostring(GetDistanceBetweenCoords(feedJobScenarioCoords.x, feedJobScenarioCoords.y, feedJobScenarioCoords.z, coords.x, coords.y, coords.z) > feedJobNextDistance)
                TxtAtWorldCoord(feedJobData.coord.x, feedJobData.coord.y, feedJobData.coord.z + 1.0, str, 0.3, 1)
            end

            if not feedJobRecentlyActive and IsPedActiveInScenario(player) and GetDistanceBetweenCoords(coords.x, coords.y, coords.z, feedJobScenarioCoords.x, feedJobScenarioCoords.y, feedJobScenarioCoords.z) < 2.0 then
                feedJobRecentlyActive = true
                feedJobActivityCount = feedJobActivityCount + 1
                feedJobNextDistance = 5.0
            elseif not IsPedActiveInScenario(player) or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, feedJobScenarioCoords.x, feedJobScenarioCoords.y, feedJobScenarioCoords.z) > 2.0 then
                feedJobRecentlyActive = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        if feedJobActive and feedJobActivityCount < 4 and GetDistanceBetweenCoords(feedJobScenarioCoords.x, feedJobScenarioCoords.y, feedJobScenarioCoords.z, coords.x, coords.y, coords.z) > feedJobNextDistance then
            local shapeTest = StartShapeTestBox(coords.x, coords.y, coords.z - 1.0, 6.5, 6.5, 0.5, 0.0, 0.0, 0.0, true, 4, player)
            local rtnVal, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
            if hit > 0 then
                local pHeading = GetEntityHeading(player)
                if GetEntityModel(entityHit) == GetHashKey('A_C_CHICKEN_01') then
                    if feedJobScenario then
                        N_0x81948dfe4f5a0283(feedJobScenario) -- DELETE_SCENARIO_POINT
                    end
                    feedJobScenario = N_0x94b745ce41db58a1(GetHashKey('WORLD_PLAYER_CHORES_FEED_CHICKENS'), coords.x, coords.y, coords.z, pHeading) -- CREATE_SCENARIO_POINT
                    feedJobNextDistance = 0.5
                    feedJobScenarioCoords = coords
                end
            end
        end
    end
end)
-- END Feed Job
