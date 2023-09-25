Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if IsControlJustPressed(0, 0x3C0A40F2 ) then
            AxRadialMenu.Menus[3].submenu = true
            for k,v in pairs(AxRadialMenu.WorkMenu) do
                -- if (framework).PlayerData.job.name == k then
                    AxRadialMenu.Menus[3].submenu = v
                -- end
            end
            SendNUIMessage({
                action = 'open',
                menus = AxRadialMenu.Menus
            })
            if not AxRadialMenu.KeepInput then
                SetNuiFocus(true, true)
            else
                SetNuiFocus(true, true)
                SetNuiFocusKeepInput(true)
            end
        end
    end
end)
RegisterCommand('closemenu', function()
    SendNUIMessage({
        action = 'forceclose'
    })
end)
RegisterNUICallback('CloseMenu', function()
    if not AxRadialMenu.KeepInput then
        SetNuiFocus(false, false)
    else
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
    end
end)
RegisterNUICallback('Event', function(data)
    if data.type == 'server' then
        TriggerServerEvent(data.event,data.parameter)
    else
        TriggerEvent(data.event, data.parameter)
    end
end)
