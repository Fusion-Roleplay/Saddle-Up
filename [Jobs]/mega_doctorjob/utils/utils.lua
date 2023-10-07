function GetAnimationFromHitBoneId(isMale, hitBoneId) 
    local type = 'male'
    if not isMale then type = 'female' end
    local resultAnim = nil
    for anim, boneIDs in pairs(Config.boneIDsToAnimation[type]) do 
        for k,boneID in pairs(boneIDs) do 
            if hitBoneId == boneID then
                resultAnim = anim
            end
        end
    end
    if resultAnim == nil then
        resultAnim = Config.boneIDsToAnimation[type]['default'][1]
    end
    return resultAnim
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(4) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function PlayAnimation(ped, dict, anim, duration, flag) 
    RequestAnimDict(dict)
    duration = duration or -1
    flag = flag or 1
    local timeout = 5
    while (not HasAnimDictLoaded(dict) and timeout>0) do
        timeout = timeout-1
        if timeout == 0 then 
            print("Animation Failed to Load")
        end
        Citizen.Wait(300)
    end
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, duration, flag)
end

function contains(table, value)
    for k, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

function LayOnBed(ped)
    local coords = GetEntityCoords(ped)
    local object
    for k,v in pairs(Config.medicalBeds) do       
        local temp = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.0, GetHashKey(v), 0)
        if temp ~= 0 then
            object = temp
            break
        end
    end
    if not object then
        return
    end
    local objectCoords = GetEntityCoords(object)
    local objectHeading = GetEntityHeading(object)
    local bedx = 0.1
    local bedy = 0.0
    local bedz = 0.85
    local heading = 270.0

    local r = math.rad(objectHeading)
	local cosr = math.cos(r)
	local sinr = math.sin(r)
    local x = bedx * cosr - bedy * sinr + objectCoords.x
	local y = bedy * cosr + bedx * sinr + objectCoords.y
	local z = bedz + objectCoords.z
	local h = heading + objectHeading

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, GetHashKey('PROP_HUMAN_SLEEP_BED_PILLOW'), x, y, z, h, -1, false, true)
end

function GetNearestHospital(coords) 
    for k,v in pairs(Config.hospitals) do
        if #(v.coords - coords) <= v.radius then
            return k
        end
    end
    return nil
end

function GetBodyExternalTemperature(ped, localTemperature) 
    local finalTemperature = localTemperature
    for k,v in pairs(Config.ClothesTemperatures) do
        if Citizen.InvokeNative(0xFB4891BD7578CDC1, ped, k) then
            finalTemperature = finalTemperature + v.temperature
        end
    end
    return finalTemperature
end