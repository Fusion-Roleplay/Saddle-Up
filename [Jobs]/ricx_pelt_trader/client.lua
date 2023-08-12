----------------------------REDEMRP_MENU----------------------------
MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)
----------------------------END REDEMRP_MENU----------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local menuOpen = false 
local atShop = false 

local pcoords = nil 
local isdead = nil

local BlipEntities = {}

local PromptKey = {}
local PromptGroup

local PromptSell
local PromptShop
local PromptGroup2 = GetRandomIntInRange(0, 0xffffff)

local prompts = {}
--------------------------------------------------------------------------------------------------------------------------------------------
local function GetFirstEntityPedIsCarrying(ped)
    return Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function PlaceEntityOnGroundProperly(ent, id)
    Citizen.InvokeNative(0x9587913B9E772D29, ent, id)
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function IsCreated(entity)
    return Citizen.InvokeNative(0x347469FBDD1589A9, PromptKey[entity])
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function TableNum(tbl) 
    local c = 0
    for i,v in pairs(tbl) do 
        c = c + 1
    end
    return c
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function NilDelete(entity)
    if entity ~= nil then 
        DeleteEntity(entity)
        SetEntityAsNoLongerNeeded(entity)
        entity = nil
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function MakePrompt(text, prompt, group, enabled)
    local a
    local str = text
    local enable = 1 
    if enabled ~= nil then 
        enable = 0
    end
    a = PromptRegisterBegin()
    PromptSetControlAction(a, prompt)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(a, str)
    PromptSetEnabled(a, enable)
    PromptSetVisible(a, enable)
	PromptSetStandardMode(a, 1)
	PromptSetGroup(a, group)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,a,true)
	PromptRegisterEnd(a)
    prompts[a] = a
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
local function LoadPrompts()
    PromptSell = MakePrompt(TEXTS.Sell, Config.Prompts.Sell, PromptGroup2)
    PromptShop = MakePrompt(TEXTS.Shop, Config.Prompts.Shop, PromptGroup2)
end
--------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    for i, v in pairs(Config.PeltTraders) do
        if v.blip.enable == true then
            local sprite = v.blip.sprite
            BlipEntities[i] = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(BlipEntities[i], sprite, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, BlipEntities[i], v.name)
        end
    end  
    LoadPrompts()
    while true do 
        Citizen.Wait(500)
        pcoords = GetEntityCoords(PlayerPedId())
        isdead = IsEntityDead(PlayerPedId())
    end
end)

local function GetPPed()
    return PlayerPedId()
end

local function GetFirstEntityPedIsCarrying2(ped)
    return GetFirstEntityPedIsCarrying(ped)
end

local function GetHolding(entity)
    return Citizen.InvokeNative(0x31FEF6A20F00B963, entity)
end

local function MarkerCreate(coords, r,g,b,a)
    Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, coords.x, coords.y, coords.z-1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, r,g,b,a, 0, 0, 2, 0, 0, 0, 0)
end

local function PromptActivate(group, label)
    PromptSetActiveGroupThisFrame(group, label)
end

local function PromptPressed(prompt)
    return Citizen.InvokeNative(0xC92AC953F0A982AE, prompt)
end
--------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local t = 5
        if pcoords ~= nil and (isdead ~= nil and isdead == false) and menuOpen == false and not atShop then 
            if TableNum(PromptKey) > 0 then 
                local entity = GetFirstEntityPedIsCarrying2(GetPPed())
                if entity then 
                    local holding = GetHolding(entity)
                    if holding then 
                        for i,v in pairs(PromptKey) do 
                            if PromptPressed(v) then
                                local remove = nil
                                local peltInfo = nil 
                                for c,k in pairs(Config.Pelts) do 
                                    if holding == c then 
                                        peltInfo = k
                                        break
                                    end
                                end
                                if peltInfo then
                                    PromptSetEnabled(v, 0)
                                    DeleteEntity(entity)
                                    SetEntityAsNoLongerNeeded(entity)
                                    Citizen.Wait(500)
                                    PromptDelete(v)
                                    remove = i
                                    TriggerServerEvent("ricx_pelt_trader:add_item", holding)
                                    Citizen.Wait(2000)
                                    break
                                else
                                    TriggerEvent("Notification:left_pelt_trader", TEXTS.Pelt, TEXTS.NoEntry, TEXTURES.alert[1], TEXTURES.alert[2], 2000)
                                end
                            end
                        end
                        if remove ~= nil then 
                            table.remove(PromptKey, remove)
                        end
                    else
                        t = 1500
                    end
                else
                    t = 1500
                end
            else
                t = 1500
            end
        else
            t = 1500
        end
        Citizen.Wait(t)
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local t = 200
        if pcoords ~= nil and (isdead ~= nil and isdead == false) and menuOpen == false then 
            local entity = GetFirstEntityPedIsCarrying2(GetPPed())
            if entity then 
                local holding = GetHolding(entity)
                if holding then 
                    local peltInfo 
                    for c,k in pairs(Config.Pelts) do 
                        if holding == c then 
                            peltInfo = k
                            break
                        end
                    end
                    local peltInfo2
                    for c,k in pairs(Config.ItemHash) do 
                        if holding == k.hash then 
                            peltInfo2 = k
                            break
                        end
                    end
                    if peltInfo and peltInfo2 then
                        local at = false 
                        for i,v in pairs(Config.PeltTraders) do 
                            local dist = #(pcoords-v.coords)
                            if dist < 10.0 then
                                t = 7
                                MarkerCreate(v.coords, 126, 0, 0, 255)
                                if dist < 1.2 then 
                                    at = true
                                    local label  = CreateVarString(10, 'LITERAL_STRING', v.name.." | ~COLOR_GOLD~"..peltInfo[1].." $"..(peltInfo2.price * v.multiplier))
                                    PromptActivate(PromptGroup2, label)
                                    if PromptIsEnabled(PromptSell) == 0 then 
                                        PromptSetEnabled(PromptSell, 1)
                                    end
                                    if PromptIsEnabled(PromptShop) == 1 then 
                                        PromptSetEnabled(PromptShop, 0)
                                    end
                                    if PromptPressed(PromptSell) then
                                        
                                        TriggerServerEvent("ricx_pelt_trader:sell_item", i, holding, entity)
                                        t = 2000
                                    end
                                end
                            end
                        end
                        if not atShop and at then 
                            atShop = true 
                        elseif not at then 
                            atShop = false
                        end
                    else
                        t = 1500
                    end
                else
                    t = 1500
                end 
            else
                for i,v in pairs(Config.PeltTraders) do 
                    local dist = #(pcoords-v.coords)
                    if dist < 10.0 then
                        t = 7
                        MarkerCreate(v.coords, 126, 0, 0, 255)
                        if dist < 1.2 then 
                            at = true
                            local label  = CreateVarString(10, 'LITERAL_STRING', v.name)
                            PromptActivate(PromptGroup2, label)
                            if PromptIsEnabled(PromptSell) == 1 then 
                                PromptSetEnabled(PromptSell, 0)
                            end
                            if PromptIsEnabled(PromptShop) == 0 then 
                                PromptSetEnabled(PromptShop, 1)
                            end
                            if PromptPressed(PromptShop) then
                                TriggerServerEvent("ricx_pelt_trader:check_shop", i)
                            end
                        end
                    end
                end
            end
        else
            t = 1500
        end
        Citizen.Wait(t)
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local t = 1000
        local pped = GetPPed()
        local entity = GetFirstEntityPedIsCarrying2(pped)
        if pcoords ~= nil and (isdead ~= nil and isdead == false) and menuOpen == false and (entity and not IsCreated(entity)) then 
            local holding = GetHolding(entity)
            if holding then 
                local have = false
                for i,v in pairs(Config.Pelts) do 
                    if holding == i then 
                        have = true
                    end
                end
                if have then 
                    PromptGroup = PromptGetGroupIdForTargetEntity(entity)
                    PromptKey[entity] = MakePrompt(TEXTS.Prompt1, Config.Prompts.Prompt1, PromptGroup)
                    Citizen.InvokeNative(0x18FF3110CF47115D,entity, 14, false)
                end
            end
        else
            t = 2000
        end
        if TableNum(PromptKey) > 0 then 
            local remove = {}
            for i,v in pairs(PromptKey) do 
                if not DoesEntityExist(i) then 
                    remove[#remove + 1] = i
                end
            end
            if #remove > 0 then 
                for i,v in pairs(remove) do 
                    if PromptKey[v] then 
                        PromptKey[v] = nil
                    end
                end
            end
        end
        Citizen.Wait(t)
    end
end)

RegisterNetEvent("ricx_pelt_trader:remove_ent")
AddEventHandler("ricx_pelt_trader:remove_ent", function(entity)
    if PromptKey[entity] then 
        PromptKey[entity] = nil
    end
    Citizen.Wait(50)
    PromptSetEnabled(entity, 0)
    PromptDelete(entity)
    DeleteEntity(entity)
    SetEntityAsNoLongerNeeded(entity)
    Citizen.Wait(500)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_pelt_trader:create_pelt")
AddEventHandler("ricx_pelt_trader:create_pelt", function(datas)
    local model, fur, carry = datas.model, datas.hash, datas.type 
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(0) end
    local ent = CreateObject(model, GetEntityCoords(PlayerPedId())+vector3(0.1, 0.2, -0.7), 1, 1, 1)
    Citizen.InvokeNative(0xF0B4F759F35CC7F5, ent, carry, 0, 0, 0)
    Citizen.InvokeNative(0x399657ED871B3A6C, ent, fur)
    Citizen.InvokeNative(0x18FF3110CF47115D,ent, 3, false)
    Citizen.InvokeNative(0x18FF3110CF47115D,ent, 14, false)
    Citizen.InvokeNative(0x18FF3110CF47115D,ent, 32, true)
    PlaceEntityOnGroundProperly(ent, 1)
    SetEntityAsMissionEntity(ent, 1, 1)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_pelt_trader:open_shop")
AddEventHandler("ricx_pelt_trader:open_shop", function(id, el)
    MenuData.CloseAll()
    menuOpen = true
    local elements = {}
    local shop = Config.PeltTraders[id]
    for i,v in pairs(el) do 
        local p = tonumber(string.format("%.3f", v.price))
        elements[i] = {label = v.label.." $"..p.." ("..v.amount..")", value = i, desc = TEXTS.SellDesc, data = v}
    end 

    MenuData.Open('default', GetCurrentResourceName(), 'trader_shop'..id,{
         title    = shop.name,
         subtext    = TEXTS.Products,
         align    = "top-right",
         elements = elements,
     },
     function(data, menu)
        if data.current.value then
            TriggerServerEvent("ricx_pelt_trader:sell_item_shop", id, data.current.data)
            menuOpen = false
            menu.close()
        end
     end,
     function(data, menu)
        menuOpen = false
        menu.close()
     end)
end)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_pelt_trader:")
AddEventHandler("ricx_pelt_trader:", function()

end)
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    for i,v in pairs(prompts) do 
        PromptDelete(v)
    end
    if menuOpen then 
        MenuData.CloseAll()
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------
----------------------------Basic Notification----------------------------
RegisterNetEvent('Notification:left_pelt_trader')
AddEventHandler('Notification:left_pelt_trader', function(t1, t2, dict, txtr, timer)
    TriggerEvent("vorp:TipBottom", t1.."\n"..t2, timer) 
end)
--------------------------------------------------------------------------------------------------------------------------------------------