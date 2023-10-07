
Player = {}
PrisonData = {}



RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    Citizen.Wait(10000)
    SetupTransportPrompts()
    SetupLockPrompts()
    SetupHangingPrompts()
    SetupMinijobPrompts()
    TriggerServerEvent("twh_prison:fetchData")
    InitTransportLocations()
    StartCatering()
    StartAlarmLoop()
    Citizen.Wait(1000)
    StartTimer()
    StartMinijobs()
    StartNpcInteraction()
    StartPoliceFunctions()
end)
Citizen.CreateThread(function()
  if Config.debug then
      SetupTransportPrompts()
      SetupLockPrompts()
      SetupHangingPrompts()
      SetupMinijobPrompts()
      TriggerServerEvent("twh_prison:fetchData")
      InitTransportLocations()
      StartCatering()
      StartAlarmLoop()
      Citizen.Wait(1000)
      StartTimer()
      StartMinijobs()
      StartNpcInteraction()
      StartPoliceFunctions()
      Citizen.Wait(1000)
  end
end)


RegisterNetEvent("twh_prison:setData") 
AddEventHandler("twh_prison:setData", function(job,data,alertTriggered)
  Player.playerJob = job
  PrisonData = data
  if next(PrisonData) then
    Player.handcuffed = PrisonData.handcuffed
    if Player.handcuffed then
      SetEnableHandcuffs(PlayerPedId(), true)
    end
    if PrisonData.onTransport then --disconnect safe when cinematic travel is enabled
      print(PrisonData.onTransport)
      Switch(PrisonData.onTransport) : caseof {
        [1]   = 
        function()
          Teleport(Config.transportLocations.ferryman.teleportTo)
          TriggerServerEvent("twh_prison:setTransport",0)
             
        end,
        [2]   = 
        function()
          Teleport(Config.transportBackLocations.ferryman.teleportTo)
          TriggerServerEvent("twh_prison:setTransport",0)
        end,
    }    
      
    end
  end
  Citizen.Wait(1000)
  if alertTriggered then
    StartSound()
  end
end)

RegisterNetEvent("twh_prison:setPrisonData") 
AddEventHandler("twh_prison:setPrisonData", function(data)
  PrisonData = data
end)



AddEventHandler("onResourceStop",function(resourceName)
  if resourceName == GetCurrentResourceName() then
      DeleteLocations()
  end
end)

function StartTimer()
  Citizen.CreateThread(function()
    while true do
      local sleep = true
        Citizen.Wait(100)
        if next(PrisonData) then
          CheckStillImprisoned() 
        else
          Citizen.Wait(Config.fetchTimer*60000)
        end
    end  
  end) 
end



