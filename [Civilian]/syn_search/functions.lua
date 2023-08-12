function SetupPrompt(name, key, group, text)
    if not PromptIsValid(name) then
        name = PromptRegisterBegin()
        PromptSetControlAction(name, key)
        local str = CreateVarString(10, 'LITERAL_STRING', text)
        PromptSetText(name, str)
        PromptSetEnabled(name, 1)
        PromptSetVisible(name, 1)
        Citizen.InvokeNative(0xCC6656799977741B,name, 1) --stand mode
        PromptSetGroup(name, group)
        PromptRegisterEnd(name)
    end
    return name
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
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end

function contains(table, element)
    for k, v in pairs(table) do
        if v == element then
            return true
        end
    end
return false
end

function contains2(table, element)
    for k, v in pairs(table) do
        if v.searchedid == element then
            return true
        end
    end
return false
end

function AnIndexOf(t,val)
    for k,v in ipairs(t) do 
        if v == val then return k end
    end
end

function ToInteger(number)
  _source = source
  number = tonumber(number)
  if number ~= nil then 
      if 0 >  number then 
          number = number * -1
      elseif number == 0 then 
          return nil
      end
      return math.floor(number or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  else
      return nil
  end
end