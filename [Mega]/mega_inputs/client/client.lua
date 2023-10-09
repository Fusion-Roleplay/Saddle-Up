local callback = nil

RegisterNUICallback('submit', function (data, cb)
    callback(data, cb)
    callback = nil
    SetNuiFocus(false, false)
end)

RegisterCommand('testinput', function ()
    TriggerEvent('mega_inputs:openInput', 'Test', function (data)
        print(data)
    end)
end)

RegisterCommand('closeinput', function ()
    SetNuiFocus(false, false)
    SendNUIMessage({
        show = false
    })
    callback = nil
end)

RegisterNetEvent('mega_inputs:openInput')
AddEventHandler('mega_inputs:openInput', function (title, cb)
    SetNuiFocus(true, true)
    SendNUIMessage({
        show = true,
        title = title
    })
    callback = cb
end)

RegisterNetEvent('mega_inputs:closeInput')
AddEventHandler('mega_inputs:closeInput', function ()
    SetNuiFocus(false, false)
    SendNUIMessage({
        show = false
    })
    callback = nil
end)
