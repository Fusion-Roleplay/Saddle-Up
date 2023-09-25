local open = false
local playerjob
local playerjobgrade
local poutifts = 0
local playerskin = 0
local online = {}
local cash
local show = false
local show2 = false
local bills = 0
local playerbills = 0
local invslotsx 
local checkingforinfo = false 
TriggerEvent("menuapi:getData",function(call)
  MenuData = call
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    for k, v in pairs(Config.Locations) do
      if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2 then
        if Config.normaldrawtext then
          drawtext(Config.Language.drawtextjobcenter, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
        elseif Config.drawtext3d then
          DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.drawtextjobcenter)
        end
        if IsControlJustReleased(0, Config.OpenMenu) then
          if open then
            closeGui()
          else
            openGui()
          end
        end
      end
    end
  end
end)



RegisterNUICallback("close", function(data)
  closeGui()
end)

RegisterNUICallback("selectJob", function(data)
  if data.group ~= nil then
    TriggerServerEvent("syn_society:selectJob", data.group)
    playerjob = data.group
  end
end)

RegisterNetEvent("syn_society:notification")
AddEventHandler("syn_society:notification", function(message)
  nuiNotification(message)
end)

function openGui()
  open = true
  SetNuiFocus(true, true)
  SendNUIMessage({ open = true })
end

function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({ open = false })
  open = false
end

function nuiNotification(message)
  SendNUIMessage({
    notification = true,
    notification_msg = message
  })
end

AddEventHandler("onResourceStop", function(resource)
  if resource == GetCurrentResourceName() then
    if open then
      closeGui()
    end
  end
end)

RegisterCommand("refreshjob", function()
  TriggerServerEvent("syn_society:checkjob")
end)

RegisterNetEvent("syn_society:findnewhired")
AddEventHandler("syn_society:findnewhired", function()
  TriggerServerEvent("syn_society:checkjob")
end)


RegisterNetEvent("syn_society:menuclosed")
AddEventHandler("syn_society:menuclosed", function()
  ClearPedTasks(PlayerPedId())
  FreezeEntityPosition(PlayerPedId(),false)
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    for k, v in pairs(Config.jobs) do
      for x, c in pairs(v.jobmenu) do
        local jobmenuplace = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, c.x, c.y, c.z, true)
        if IsPedOnFoot(player) then
          if playerjob == k then
            if jobmenuplace < 2 then
              if Config.normaldrawtext then
                drawtext(Config.Language.drawtextjobmenu, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
              elseif Config.drawtext3d then
                DrawText3D(c.x, c.y, c.z, Config.Language.drawtextjobmenu)
              end
              if IsControlJustReleased(0, Config.OpenMenu) then
                TriggerServerEvent("syn_society:checkjob")
                TriggerServerEvent("syn_society:getbills")
                TriggerServerEvent("syn_society:getoutfits")
                TriggerServerEvent("syn_society:getinvslots")
                if Config.vorp then
                  TriggerServerEvent("syn_society:getskin")
                end
                TriggerServerEvent("syn_society:getledger", playerjob)
                if Config.vorp then
                  checkingforinfo = true 
                  TriggerServerEvent("syn_society:getplayerswithjob", k)
                  while checkingforinfo do 
                    Wait(100)
                  end
                else
                  TriggerServerEvent("syn_society:players", GetPlayers(), k)
                end
                Citizen.Wait(700)
                if playerjob == k then
                  WarMenu.OpenMenu('jobmenu')
                  TaskStandStill(PlayerPedId(), -1)
                  FreezeEntityPosition(PlayerPedId(),true)
                end
              end
            else
              show2 = false
            end
          end
        end
      end
    end

  end
end)



RegisterNetEvent("syn_society:listoutfits")
AddEventHandler("syn_society:listoutfits", function(playeroutfits)
  poutifts = playeroutfits
end)
RegisterNetEvent("syn_society:getskins")
AddEventHandler("syn_society:getskins", function(skin)
  playerskin = skin
end)
function contains(table, element)
  if table ~= 0 then 
      for k, v in pairs(table) do
          if v == element then
              return true
          end
      end
  end
return false
end

RegisterNetEvent("syn_society:findjob")
AddEventHandler("syn_society:findjob", function(job, jobgrade)
  playerjob = job
  playerjobgrade = tonumber(jobgrade)
  
end)

RegisterNetEvent("syn_society:findslots")
AddEventHandler("syn_society:findslots", function(inv)
  invslotsx = inv
end)

RegisterNetEvent("syn_society:paylerlist")
AddEventHandler("syn_society:paylerlist", function(players)
  online = players
  checkingforinfo = false 
end)

RegisterNetEvent("syn_society:cash")
AddEventHandler("syn_society:cash", function(ledger)
  cash = ledger
end)

--[[ RegisterNetEvent('syn_society:showjob')
AddEventHandler('syn_society:showjob', function(job, jobgrade)
  if Config.vorp then
    TriggerEvent("vorp:TipBottom", Config.Language.yourjobis..job.." "..jobgrade, 4000)
  elseif Config.redem then
    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.yourjobis..job.." "..jobgrade, 4000)
  end
end) ]]

RegisterCommand("showjob", function(source, args)
  TriggerServerEvent("syn_society:checkjob")
  Wait(1000)
  if Config.vorp then
    TriggerEvent("vorp:TipBottom", Config.Language.yourjobis .. playerjob .. " " .. playerjobgrade, 4000)
  elseif Config.redem then
    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.yourjobis .. playerjob .. " " .. playerjobgrade, 4000)
  end
end)

Citizen.CreateThread(function()
  WarMenu.CreateMenu('jobmenu', Config.Language.jobmenu)
  WarMenu.CreateMenu('fines', Config.Language.bills)
  WarMenu.CreateSubMenu('outfitsmenu', 'jobmenu', Config.Language.changingroom)
  WarMenu.CreateSubMenu('manageemployees', 'jobmenu', Config.Language.manageemployees)
  WarMenu.CreateSubMenu('hire', 'jobmenu', Config.Language.hire)
  WarMenu.CreateSubMenu('fire', 'jobmenu', Config.Language.fire)
  WarMenu.CreateSubMenu('setsalary', 'jobmenu', Config.Language.setsalary)
  WarMenu.CreateSubMenu('setrank', 'jobmenu', Config.Language.setrank)
  WarMenu.CreateSubMenu('ledger', 'jobmenu', Config.Language.ledger)
  WarMenu.CreateSubMenu('viewbills', 'jobmenu', Config.Language.billss)

  while true do
    if WarMenu.IsMenuOpened('jobmenu') then
      if WarMenu.Button(Config.Language.inventory) then
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 2.0 then
          WarMenu.CloseMenu()
          TriggerEvent("syn_society:warndistance")
        else
          WarMenu.CloseMenu()
          for k, v in pairs(Config.jobs) do
            if k == playerjob then
              local name = v.containername
              local id = v.containerid
              if Config.vorp then
                TriggerServerEvent("syn_Container:reloadContainerInventory", id)
                if invslotsx ~= nil and invslotsx ~= 0 then 
                  TriggerEvent("vorp_inventory:OpenContainerInventory", name, id,invslotsx)
                else
                  TriggerEvent("vorp_inventory:OpenContainerInventory", name, id)
                end
              elseif Config.redem then
                TriggerServerEvent("syn_locker:isCreated", name, id)
                Citizen.Wait(500)
                TriggerEvent("redemrp_inventory:OpenLocker", name .. "_" .. id)
              end
            end
          end
        end
      end
      if WarMenu.MenuButton(Config.Language.changingroom, 'outfitsmenu') then end
      if WarMenu.MenuButton(Config.Language.viewbills, 'viewbills') then end
      for k, v in pairs(Config.jobs) do
        if k == playerjob then
          local BossRank = tonumber(v.bossrank)
          local RecruitmentRank = tonumber(v.recruitmentrank)
          if (playerjobgrade == BossRank or (playerjobgrade >= RecruitmentRank)) then WarMenu.MenuButton(Config.Language.manageemployees, 'manageemployees') end
          if playerjobgrade == BossRank then WarMenu.MenuButton(Config.Language.ledger, 'ledger') end
        end
      end
    elseif WarMenu.IsMenuOpened('fines') then
      if bills ~= 0 then
        for i = 1, #bills do
          if WarMenu.Button(bills[i].job .. " / " .. bills[i].amount) then
            TriggerServerEvent("syn_society:paymybill", bills[i].id, bills[i].amount, bills[i].job)
            WarMenu.CloseMenu()
          end
        end
      end
    elseif WarMenu.IsMenuOpened('viewbills') then
      if playerbills ~= 0 then
        for i = 1, #playerbills do
          if WarMenu.Button(playerbills[i].playername .. " / " .. playerbills[i].amount) then end
        end
      end
    elseif WarMenu.IsMenuOpened('outfitsmenu') then
      if poutifts == 0 then
        WarMenu.Button(Config.Language.nooutfits)
      else
        if Config.vorp then
          for i = 1, #poutifts do
            if WarMenu.Button(poutifts[i].title) then
              local jsonCloths = poutifts[i].comps
              changeclothinganim()
              SetPlayerComponent(json.decode(jsonCloths),json.decode(playerskin))
              TriggerEvent("vorpcharacter:savenew", jsonCloths)
              --TriggerEvent("vorpcharacter:loadPlayerSkin", playerskin, jsonCloths)
              TriggerServerEvent("syn_society:setoutfit", jsonCloths)
              WarMenu.CloseMenu()
            end
          end
        elseif Config.redem then
          if WarMenu.Button(Config.Language.outfits) then
            TriggerServerEvent('redemrp_clothing:getOutfits')
            WarMenu.CloseMenu()
          end
        end
      end
    elseif WarMenu.IsMenuOpened('manageemployees') then
      if WarMenu.MenuButton(Config.Language.hire, 'hire') then end
      if WarMenu.MenuButton(Config.Language.fire, 'fire') then end
      if WarMenu.MenuButton(Config.Language.setrank, 'setrank') then end
      for k, v in pairs(Config.jobs) do
        if k == playerjob then
          if v.salary then WarMenu.MenuButton(Config.Language.setsalary, 'setsalary') end
        end
      end

    elseif WarMenu.IsMenuOpened('fire') then
      for i = 1, #online do
        if WarMenu.Button("ID: " .. online[i].no .. "//  " .. online[i].name) then
          if Config.vorp then
            TriggerServerEvent("syn_society:fire", online[i].charid)
          else
            TriggerServerEvent("syn_society:fire", online[i].no)
          end
          WarMenu.CloseMenu()
        end
      end
    elseif WarMenu.IsMenuOpened('hire') then
      WarMenu.CloseMenu()
      if Config.vorp then
        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.playerid, function(cb)
          local playerid = tonumber(cb)
          TriggerServerEvent("syn_society:hire", playerid, playerjob)
        end)
      elseif Config.redem then
        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.playerid, function(cb)
          local playerid = tonumber(cb)
          TriggerServerEvent("syn_society:hire", playerid, playerjob)
        end)
      end
    elseif WarMenu.IsMenuOpened('setrank') then
      for i = 1, #online do
        if online[i].jobgrade ~= nil then 
          if WarMenu.Button("ID: " .. online[i].no .. "//  " .. online[i].name .. Config.Language.listrank .. online[i].jobgrade) then
            if Config.vorp then
              TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.rank, function(cb)
                local rank = tonumber(cb)
                TriggerServerEvent("syn_society:setrank", online[i].charid, rank)              
              end)
            elseif Config.redem then
              TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.rank, function(cb)
                local rank = tonumber(cb)
                TriggerServerEvent("syn_society:setrank", online[i].no, rank)
              end)
            end
            WarMenu.CloseMenu()
          end
        else
          if WarMenu.Button("ID: " .. online[i].no .. "//  " .. online[i].name .. Config.Language.listrank) then
            if Config.vorp then
              TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.rank, function(cb)
                local rank = tonumber(cb)
                TriggerServerEvent("syn_society:setrank", online[i].charid, rank)              
              end)
            elseif Config.redem then
              TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.rank, function(cb)
                local rank = tonumber(cb)
                TriggerServerEvent("syn_society:setrank", online[i].no, rank)
              end)
            end
            WarMenu.CloseMenu()
          end
        end
      end
    elseif WarMenu.IsMenuOpened('setsalary') then
      for k, v in pairs(Config.jobs) do
        if k == playerjob then
          for i = 0, v.bossrank do
            if WarMenu.Button("" .. i) then
              WarMenu.CloseMenu()
              if Config.vorp then
                TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.salarys, function(cb)
                  local salary = tonumber(cb)
                  TriggerServerEvent("syn_society:setsalary", i, salary)
                end)
              elseif Config.redem then
                TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.salarys, function(cb)
                  local salary = tonumber(cb)
                  TriggerServerEvent("syn_society:setsalary", i, salary)
                end)
              end
            end
          end
        end
      end
    elseif WarMenu.IsMenuOpened('ledger') then
      if WarMenu.Button(Config.Language.ledgercash .. cash .. ' $') then
      end
      if WarMenu.Button(Config.Language.depositcash) then
        WarMenu.CloseMenu()
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 2.0 then
          TriggerEvent("syn_society:warndistance")
        else
          if Config.vorp then
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.depositcash, function(cb)
              local depo = tonumber(cb)
              if depo ~= nil then 
                TriggerServerEvent("syn_society:depositcash", depo, cash, playerjob)
              end
            end)
          elseif Config.redem then
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.depositcash, function(cb)
              local depo = tonumber(cb)
              if depo ~= nil then 
                TriggerServerEvent("syn_society:depositcash", depo, cash, playerjob)
              end
            end)
          end
        end
      end
      if WarMenu.Button(Config.Language.withdrawcash) then
        WarMenu.CloseMenu()
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 2.0 then
          TriggerEvent("syn_society:warndistance")
        else
          if Config.vorp then
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.withdrawcash, function(cb)
              local with = tonumber(cb)
              if with ~= nil then 
                TriggerServerEvent("syn_society:withdrawcash", with, cash, playerjob)
              end
            end)
          elseif Config.redem then
            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.withdrawcash, function(cb)
              local with = tonumber(cb)
              if with ~= nil then 
                TriggerServerEvent("syn_society:withdrawcash", with, cash, playerjob)
              end
            end)
          end
        end
      end

    end -- end of menu
    WarMenu.Display()
    Citizen.Wait(0)
  end
end)

function GetPlayers()
  local players = {}

  for i = 0, 256 do
    if NetworkIsPlayerActive(i) then
      table.insert(players, GetPlayerServerId(i))
    end
  end

  return players
end

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
  TriggerServerEvent("syn_alert:registerplayer")
  TriggerServerEvent("syn_society:checkjob")
  TriggerEvent('syn_society:blip')
  Wait(1000)
  if contains(Config.dutystationjobs, playerjob) then
    loaddutystationblips()
  end
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(Config.salarytime * 60000)
      TriggerServerEvent('syn_society:salary')
    end
  end)
end)

RegisterNetEvent("redem:HasLoaded")
AddEventHandler("redem:HasLoaded", function(bool)
  TriggerServerEvent("syn_society:checkjob")
  TriggerEvent('syn_society:blip')
  if bool then
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(Config.salarytime * 60000)
        TriggerServerEvent('syn_society:salary')
      end
    end)
  end
end)


RegisterNetEvent("syn_society:blip")
AddEventHandler("syn_society:blip", function()
  for k, v in pairs(Config.jobs) do
    if v.showblip then
      for x, c in pairs(v.Pos) do
        local blip = N_0x554d9d53f696d002(1664425300, c.x, c.y, c.z)
        SetBlipSprite(blip, v.blipsprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
      end
    end
  end
  for k, v in pairs(Config.Locations) do
    local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    SetBlipSprite(blip, v.blipsprite, 1)
    SetBlipScale(blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
  end
end)

RegisterNetEvent("syn_Container:openinventory")
AddEventHandler("syn_Container:openinventory", function(name, id,slots)
  TriggerServerEvent("syn_Container:reloadContainerInventory", id)
  TriggerEvent("vorp_inventory:OpenContainerInventory", name, id,slots)
end)

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

  for i = 1, #players, 1 do
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
  return closestPlayer, closestDistance, playerid, tgt1
end

RegisterNetEvent("syn_society:warndistance")
AddEventHandler("syn_society:warndistance", function()
  local _source = source
  if Config.vorp then
    TriggerEvent("vorp:TipBottom", Config.Language.someoneisclose, 4000)
  elseif Config.redem then
    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.someoneisclose, 4000)
  end

end)

RegisterCommand('bill', function(source, args, rawCommand)
  for k, v in pairs(Config.jobs) do
    if k == playerjob then
      if v.billing then
        if args[2] == nil then
          local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
          if closestPlayer ~= -1 and closestDistance <= 2.0 then
            local amount = tonumber(args[1])
            if 'number' == type(amount) and amount ~= nil and amount ~= 0 and amount > 0 then
              TriggerServerEvent("syn_society:bill", amount, playerid) -- playerid
            else
              if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
              elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
              end
            end
          else
            if Config.vorp then
              TriggerEvent("vorp:TipBottom", Config.Language.noplayer, 4000)
            elseif Config.redem then
              TriggerEvent("redem_roleplay:ShowObjective", Config.Language.noplayer, 4000)
            end
          end
        else
          local playerid = tonumber(args[2])
          local amount = tonumber(args[1])
          if 'number' == type(amount) and amount ~= nil and amount ~= 0 and amount > 0 then
            TriggerServerEvent("syn_society:bill", amount, playerid) -- playerid
          else
            if Config.vorp then
              TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
            elseif Config.redem then
              TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
            end
          end
        end
      end
    end
  end
end, false)


RegisterCommand("paybills", function()
  TriggerServerEvent("syn_society:paybill")
end)

RegisterNetEvent("syn_society:showfines")
AddEventHandler("syn_society:showfines", function(fines)
  bills = fines
  WarMenu.OpenMenu('fines')
end)

RegisterNetEvent("syn_society:viewbills")
AddEventHandler("syn_society:viewbills", function(fines)
  playerbills = fines
end)


function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
  local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
  SetTextScale(w, h)
  SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
  SetTextCentre(centre)
  if enableShadow then
    SetTextDropshadow(1, 0, 0, 0, 255)
  end
  Citizen.InvokeNative(0xADA9255D, 10);
  DisplayText(str, x, y)
end

function DrawText3D(x, y, z, text)
  local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
  local px, py, pz = table.unpack(GetGameplayCamCoord())
  local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
  local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
  if onScreen then
    SetTextScale(0.30, 0.30)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    SetTextCentre(1)
    DisplayText(str, _x, _y)
    local factor = (string.len(text)) / 225
    DrawSprite("feeds", "hud_menu_4a", _x, _y + 0.0125, 0.015 + factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    --DrawSprite("feeds", "toast_bg", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
  end
end

-----------------

local cooldown = false 
local timer = Config.alertcooldown
local blips = {}
local isalerted = false 
local doctor = false 
local isalerted2 = false 
local serverid
local isalerted3 = false 
local cantspam = false 

Citizen.CreateThread(function()
  if Config.vorp and Config.alertsfunction then 
    for k,v in pairs(Config.alerts) do 
        RegisterCommand(v.command, function(source, args, rawCommand)
            if not cooldown then 
              v.blip.coords = GetEntityCoords(PlayerPedId())
              TriggerServerEvent("syn_alert:sendalert",v.jobs,v.msg,v.blip,v.isdoctor)
              TriggerEvent("vorp:TipBottom", Config.Language.alertsent, 4000)

              cooldown = true
            else
              cantspam = true 
              TriggerEvent("vorp:TipBottom", Config.Language.waitafew, 4000)

            end
        end, false)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(10)
    if timer >= 0 and cooldown then
      Citizen.Wait(1000)
      if timer > 0 then
        timer = timer - 1
      end
          if 0 >= timer and cooldown then 
              cooldown = false 
              timer = Config.alertcooldown
          end
    end
  end
end)
local dutystatus = false 
local lastafkcoords 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if isalerted and dutystatus then 
      lastafkcoords = GetEntityCoords(PlayerPedId())
      Wait(60000*Config.afkoffdutytimer)
      if GetEntityCoords(PlayerPedId()) == lastafkcoords then 
        TriggerServerEvent("syn_society:gooffduty")
        dutystatus = false
        TriggerEvent("vorp:TipBottom", Config.Language.afkoffduty, 4000)
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(1)
      if cantspam then 
        drawtext(Config.Language.dothis..Config.cancelblipcommand..Config.Language.toremovenoti, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        drawtext(Config.Language.waitafew, 0.15, 0.13, 0.5, 0.5, true, 255, 255, 255, 255, true, 10000)
      end
      if isalerted then 
          drawtext(Config.Language.dothis..Config.cancelblipcommand..Config.Language.toremovenoti, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
          if doctor then 
              drawtext(Config.Language.needsyourhelp..Config.medicresponse..Config.Language.torespond, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
          else
              drawtext(Config.Language.needsyourhelp2, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
          end
      end
      if isalerted2 then 
          drawtext(Config.Language.dothis..Config.cancelblipcommand..Config.Language.toremovenoti, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
          drawtext(Config.Language.docontheway, 0.15, 0.13, 0.5, 0.5, true, 255, 255, 255, 255, true, 10000)
      end
      if isalerted3 then 
          drawtext(Config.Language.dothis..Config.cancelblipcommand..Config.Language.toremovenoti, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
          drawtext(Config.Language.nodoc, 0.15, 0.13, 0.5, 0.5, true, 255, 255, 255, 255, true, 10000)
      end
  end
end)

RegisterNetEvent("syn_alert:createblip")
AddEventHandler("syn_alert:createblip", function(blip,dx,id)
    isalerted = true 
    doctor = dx
    serverid = id
    local blipx =  N_0x554d9d53f696d002(1664425300, blip.coords.x, blip.coords.y, blip.coords.z)
    SetBlipScale(blipx, 0.2)
    SetBlipSprite(blipx, blip.blipsprite, 1) 
    Citizen.InvokeNative(0x9CB1A1623062F402, blipx, blip.Name)
    Citizen.InvokeNative(0x662D364ABF16DE2F,blipx,0x6F85C3CE)
    table.insert(blips, {
      blipz = blipx
    })
end)

RegisterNetEvent("syn_alert:findclosedoctor")
AddEventHandler("syn_alert:findclosedoctor", function(data,alert,blip,doctor)
    local closest = 99999999999999999999999999999999999999999999999999999999999999
    local docid = 0 
    local coordsx = GetEntityCoords(PlayerPedId())
    for k,v in pairs(data) do 
        local dist = GetDistanceBetweenCoords(v.coords.x,v.coords.y,v.coords.z, coordsx.x,coordsx.y,coordsx.z, false)
        if dist < closest then 
          closest = dist 
          docid = k
        end
    end
    if docid == 0 then 
      print("there is an error, report this and attach f8")
      print(closest,"closest")
      print(docid,"docid")
    else
      print(docid,"ID of closest doctor near you")
    end
    if docid ~= nil then 
      TriggerServerEvent("syn_alert:sendtodoctor",docid,alert,blip,doctor)
    else
      cooldown = false
      cantspam = false 
      print("Failed To Alert, Re-send Alert")
    end
end)

RegisterNetEvent("syn_alert:recresp")
AddEventHandler("syn_alert:recresp", function()
   if isalerted then 
        isalerted = false 
   end
   isalerted2 = true 
end)

local toldnodoctors = false 

RegisterNetEvent("syn_alert:respawned")
AddEventHandler("syn_alert:respawned", function()
  toldnodoctors = false 
end)

RegisterNetEvent("syn_alert:istoldnodoctors")
AddEventHandler("syn_alert:istoldnodoctors", function()
  TriggerEvent("syn_death:toldnodoctors",toldnodoctors)
end)

RegisterNetEvent("syn_alert:cantalert")
AddEventHandler("syn_alert:cantalert", function()
   if isalerted then 
        isalerted = false 
   end
   if isalerted2 then 
        isalerted2 = false 
   end
   isalerted3 = true 
   toldnodoctors = true 
end)
if Config.vorp then 
  RegisterCommand(Config.medicresponse, function(source, args, rawCommand)
      if doctor then 
          doctor = false 
          TriggerServerEvent("syn_alert:inform",serverid)
      end
  end, false)

  RegisterCommand(Config.cancelblipcommand, function(source, args, rawCommand)
      cantspam = false 
      isalerted = false 
      isalerted2 = false 
      isalerted3 = false 
      for k,v in pairs(blips) do 
          RemoveBlip(v.blipz)
      end
      blips = {}
  end, false)
  RegisterCommand(Config.offdutycommad, function(source, args, rawCommand)
    if Config.dutystationsenabled then 
      if locationalduty ~= nil then 
        TriggerServerEvent("syn_society:gooffduty")
        TriggerEvent("syn_medic:onduty",false)
      else
        TriggerServerEvent("syn_society:gooffduty",locationalduty)
        TriggerEvent("syn_medic:onduty",false)
      end
    else
      TriggerServerEvent("syn_society:gooffduty")
      TriggerEvent("syn_medic:onduty",false)
    end
    dutystatus = false 
    TriggerEvent("lawman:takeoffbadge")
  end, false)

  RegisterCommand(Config.ondutycommand, function(source, args, rawCommand)
    if not dutystatus then 
      local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
      local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId())
      local isDead = IsEntityDead(PlayerPedId())
      if not hogtied and not handcuffed and not isDead then
        if Config.menuoption then 
          if contains(Config.dutystationjobs,playerjob) then 
            openregionalselectmenu()
            return 
          end
        end
        dutystatus = true 
        if not Config.ondutyinstant then 
          Wait(60000*Config.ondutytime)
        end
        TriggerServerEvent("syn_society:goonduty")
        TriggerEvent("syn_medic:onduty",true)
      else
        TriggerEvent("vorp:TipBottom", Config.Language.cantgoonduty, 4000)
      end
    end
  end, false)
end

function openregionalselectmenu()
  MenuData.CloseAll()
	local elements = {  
    }
    for k,v in pairs(Config.dutystationlocations) do 
      if contains(v.job,playerjob) then 
        table.insert( elements,{label = k, value = k , desc = ""})
      end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = playerjob..Config.Language.dutyregions,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
    if data.current then 
      dutystatus = true 
      if not Config.ondutyinstant then 
        Wait(60000*Config.ondutytime)
      end
      TriggerServerEvent("syn_society:goonduty",data.current.value)
      TriggerEvent("syn_medic:onduty",true)
      MenuData.CloseAll()
    end
	end,
	function(data, menu)
		menu.close()
	end)
end

function loaddutystationblips()
  if Config.dutystationsenabled then 
    for k, v in pairs(Config.dutystationlocations) do
      if v.showblip then
        if contains(v.job,playerjob) then 
          local blipabc = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
          SetBlipSprite(blipabc, v.blipsprite, 1)
          SetBlipScale(blipabc, 0.8)
          Citizen.InvokeNative(0x9CB1A1623062F402, blipabc, v.blipname)
        end
      end
    end
  end
end

local locationalduty 

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local sleep = true 
    if Config.dutystationsenabled then 
      for k, v in pairs(Config.dutystationlocations) do
        if playerjob ~= nil and not dutystatus then 
          if contains(v.job,playerjob) then 
            local coords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < 2 then
              sleep = false 
              if Config.normaldrawtext then
                drawtext(Config.Language.goonduty..k, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
              elseif Config.drawtext3d then
                DrawText3D(v.coords.x, v.coords.y, v.coords.z, Config.Language.goonduty..k)
              end
              if IsControlJustReleased(0, Config.OpenMenu) then
                TriggerServerEvent("syn_society:goonduty",k)
                TriggerEvent("syn_medic:onduty",true)
                dutystatus = true 
                locationalduty = k
              end
            end
          end
        end
      end
    end
    if sleep then 
      Wait(500)
    end
  end
end)

RegisterNetEvent("syn_alert:reconduty")
AddEventHandler("syn_alert:reconduty", function(ondutyplayers,job)
   openondutymenu(ondutyplayers,job)
end)

function openondutymenu(ondutyplayers,job)
	local elements = {  
    }
    for k,v in pairs(ondutyplayers) do 
        table.insert( elements,{label = v, value = "" , desc = Config.Language.serverid..k})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = job..Config.Language.duty,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
		
	end,
	function(data, menu)
		menu.close()
	end)
end

function changeclothinganim()
  RequestAnimDict('mech_inventory@clothing@outfit_change')
  while not HasAnimDictLoaded('mech_inventory@clothing@outfit_change') do
      Citizen.Wait(100)
  end
  TaskPlayAnim(PlayerPedId(), "mech_inventory@clothing@outfit_change", "outfit_change_unarmed", 5.0, 5.0, -1, 0, 0)
end


----------------------------------------------

local clothinghash = {
  Hat = 0x9925C067,
  EyeWear = 0x5E47CA6,
  Mask = 0x7505EF42,
  NeckWear = 0x5FC29285,
  NeckTies = 0x7A96FACA,
  Shirt = 0x2026C46D,
  Suspender = 0x877A2CF7,
  Vest = 0x485EE834,
  Coat = 0xE06D30CE,
  CoatClosed = 0x0662AC34,
  Poncho = 0xAF14310B,
  Cloak = 0x3C1A74CD,
  Glove = 0xEABE0032,
  RingRh = 0x7A6BBD0B,
  RingLh = 0xF16A1D23,
  Bracelet = 0x7BC10759,
  Gunbelt = 0x9B2C8B89,
  Belt = 0xA6D134C6,
  Buckle = 0xFAE9107F,
  Holster = 0xB6B6122D,
  Skirt = 0x8E84A2AA,
  bow = 0x9925C067,
  armor = 0x72E6EF74,
  teeth = 0x72E6EF74,
  Chap = 0x3107499B,
  Boots = 0x777EC6EF,
  Spurs = 0x18729F39,
  Spats = 0x514ADCEA,
  Gauntlets = 0x91CE9B20,
  Loadouts = 0x83887E88,
  Accessories = 0x79D7DF96,
  Satchels = 0x94504D26,
  GunbeltAccs = 0xF1542D11,
  Pant = 0x1D4C528A,

}

function SetPlayerComponent(clothing,oldclothing)
  local ped = PlayerPedId()
  for k,v in pairs(oldclothing) do 
      local comp = v
      if comp ~= -1 then 
          local cata = clothinghash[k]
          if Citizen.InvokeNative(0xFB4891BD7578CDC1,ped,cata) then 
              Citizen.InvokeNative(0xD710A5007C2AC539,ped,cata,0)
          end
      end
  end
  for k,v in pairs(clothing) do 
      local comp = v
      if comp ~= -1 then 
          local cata = clothinghash[k]
          if IsPedMale(PlayerPedId()) then
              Citizen.InvokeNative(0x59BD177A1A48600A,ped,cata)
              Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,false,false)
              Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,true,false)

          else
            Citizen.InvokeNative(0x59BD177A1A48600A,ped,cata)
            Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,false,true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,true,true)
          end
      end
  end
  if clothing["Skirt"] ~= -1 then
      Citizen.InvokeNative(0xD710A5007C2AC539,ped,clothinghash["Pant"],0)
  end
  Citizen.InvokeNative(0xCC8CA3E88256E58F,ped,0,1,1,1,false)
end

