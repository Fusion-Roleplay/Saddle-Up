
function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(4) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

function IsPlayerNearCoords(x, y, z, dst)
    local playerPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)

    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, x, y, z, true)

    if distance < dst then
        return true
    end
    return false
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

function Contains(table, value)
    for k, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

function IsinArea(currentarea,area)
	if currentarea == GetHashKey(area) then
		return true
	end
	return false
end
function Tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

function Switch(c)
    local swtbl = {
      casevar = c,
      caseof = function (self, code)
        local f
        if (self.casevar) then
          f = code[self.casevar] or code.default
        else
          f = code.missing or code.default
        end
        if f then
          if type(f)=="function" then
            return f(self.casevar,self)
          else
            error("case "..tostring(self.casevar).." not a function")
          end
        end
      end
    }
    return swtbl
end


function PlayHtmlSound(sound,volume)
    SendNUIMessage({
        playsound = sound,
        soundvolume  = volume
    })
end

function StopHtmlSound()
    SendNUIMessage({
        stop = true
    })
end