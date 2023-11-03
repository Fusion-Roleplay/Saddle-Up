local statusPLayer = {}
local statusPLayer1 = {}
local firstspawn = false

AddEventHandler('aggiungiStatus')
RegisterNetEvent('aggiungiStatus', function(tabSP)
    statusPLayer = tabSP
end)

AddEventHandler('aggiungiStatus1')
RegisterNetEvent('aggiungiStatus1', function(tabSP)
    statusPLayer1 = tabSP
    print('ciao', json.encode(statusPlayer1))
end)

Citizen.CreateThread(function()
    -- local ped = PlayerPedId()

    while true do
        for index, value in ipairs(statusPLayer) do
            local pedCoords = GetEntityCoords(PlayerPedId())
            local plyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(value.id)))
            local dist = GetDistanceBetweenCoords(pedCoords, plyCoords, false)
            if dist < 10 then
                DrawText3D(plyCoords['x'], plyCoords['y'], plyCoords['z'], value.text, false, dist)
            end
        end

        for index, value in ipairs(statusPLayer1) do
            local pedCoords = GetEntityCoords(PlayerPedId())
            local plyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(value.id)))
            local dist = GetDistanceBetweenCoords(pedCoords, plyCoords, false)
            if dist < 40 then
                DrawText3D(plyCoords['x'], plyCoords['y'], plyCoords['z'], '* STAFF *', true, dist)
            end
        end
     Wait(0)
    end
end)

function DrawText3D(x, y, z, text, staff, dist)
    local onScreen,_x,_y
    if staff then 
        onScreen,_x,_y = GetScreenCoordFromWorldCoord(x, y, z + 1.5)
    else
        onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    end

    local px,py,pz=table.unpack(GetGameplayCamCoord())  
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
        if staff then
            local scala = 0.50 - 0.009 * dist
            SetTextScale(scala, scala)
            SetTextFontForCurrentCommand(1)
            SetTextColor(255, 255, 0, 215)
            SetTextCentre(1)
            DisplayText(str,_x,_y)
            local factor = (string.len(text)) / 225
            DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 0, 0)
        else
            local scala = 0.30 - 0.009 * dist
            local scala2 = 0.002 - 0.0013 * dist
            local scala3 = 0.03 - 0.0002 * dist
            SetTextScale(scala, scala)
            SetTextFontForCurrentCommand(1)
            SetTextColor(255, 0, 0, 215)
            SetTextCentre(1)
            DisplayText(str,_x,_y)
            local factor = (string.len(text)) / 225
            DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 0, 0)
            DrawSprite("feeds", "toast_bg", _x, _y+0.0125,scala2+ factor, scala3, 0.1, 1, 1, 1, 160, 0)
        end
    end
end


AddEventHandler("playerSpawned", function()
    if not firstspawn then
        firstspawn = true
        TriggerServerEvent('datiStatusPlayer')
        TriggerServerEvent('datiStatusPlayer1')
    end
end)