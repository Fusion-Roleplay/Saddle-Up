RegisterNetEvent('mega_notify:notifyRight')
AddEventHandler('mega_notify:notifyRight', function (title, text, duration, image)
  SendNUIMessage({
    type = "ui",
    title = title,
    text = text,
    duration = duration,
    image = image,
    position = 'right-center'
  })
end)

RegisterNetEvent('mega_notify:notifyTop')
AddEventHandler('mega_notify:notifyTop', function (title, text, duration, image)
  SendNUIMessage({
    type = "ui",
    title = title,
    text = text,
    duration = duration,
    image = image,
    position = 'center-top'
  })
end)

-- RegisterCommand('testnotif', function (source, args)
  
--   local duration = args[1]
--   local position = args[2]
--   local image = args[3]
--   local title = args[4]
--   local text = table.unpack(args, 4, #args)
--   print(position)
--   if position == 'right' then
--     TriggerEvent('mega_notify:notifyRight', title, text, duration, image)
--   elseif position == 'center' then
--     TriggerEvent('mega_notify:notifyTop', title, text, duration, image)
--   end



-- end)