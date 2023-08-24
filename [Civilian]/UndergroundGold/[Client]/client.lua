local entity
local activewater = {}
local Panning = false
local task1 = false
local EasyBaby = false

RegisterNetEvent('UndergroundGold:StartPanning')
AddEventHandler('UndergroundGold:StartPanning', function()
    local ok = false
    if not Panning then
        Panning = true
        local PedID = PlayerPedId()
        local coords = GetEntityCoords(PedID)
        local InWater = IsEntityInWater(PedID)
        local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x, coords.y, coords.z)
        local OnMount, InVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID, true)

        for k, v in pairs(Config.WaterTypes) do
            if ((Water == Config.WaterTypes[k]["waterhash"]) and (InWater)) then
                local InWater = IsEntityInWater(PedID)
                ok = true
                if ((not OnMount) and (not (InVeh))) then
                    CrouchAnimAndAttach()
                    Wait(4000)
                    GoldShake()
                    Time = math.random(15, 30)
                    print('Gold Panning', 'Searching for Gold...', 'Gold', ((Time * 1000) - 500))
                    ClearPedTasks(PedID)
                    Wait(1000)
                    DeleteObject(entity)
                    DeleteEntity(entity)

                    local Chance = math.random(Config.chance.min, Config.chance.min)
                    if (Chance == Config.number) then
                        for a, s in pairs(Config.panitems) do
                            local newnumber = math.random(s.chance.min, s.chance.max)
                            if (s.number ~= newnumber) then
                                TriggerEvent('UndergroundGold:Notify', "Gold", "You've found nothing", 2000)
                                Panning = false
                                return
                            else
                                local amount = math.random(s.amount.min, s.amount.max)
                                TriggerServerEvent('UndergroundGold:GiveAnyItem', 0, s.name, amount)
                                TriggerEvent('UndergroundGold:Notify', "Gold",
                                    "You've found " .. amount .. " " .. s.label .. "!", 2000)
                            end
                        end
                        Panning = false
                        return
                    else
                        TriggerEvent('UndergroundGold:Notify', "Gold", "You've found nothing", 2000)
                        Panning = false
                        return
                    end
                    Panning = false
                end
            end
        end
        if not ok then
            TriggerEvent('UndergroundGold:Notify', "Gold", "You need to be on water!", 2000)
            Panning = false
        end
    end
end)
local watereffects = {}

RegisterNetEvent('UndergroundGold:LevelWater')
AddEventHandler('UndergroundGold:LevelWater', function(data)
    if not watereffects == nil then
        table.insert(watereffects, data)
    end
    for k, v in pairs(watereffects) do
        if v.id == data.id then
            v.level = data.level
        end
    end
    EasyBaby = false
    EasyBaby = true
    while EasyBaby do
        Wait(10)
        print(data.level)
        print("1111", tonumber(data.level))
        local t2 = data.level / 10000
        DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.02, 0.11, 0.8, 0, 0, 0, 190, 0)
        DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.01, t2, 0.2, 0, 102, 255, 190, 0)
    end
end)

function CrouchAnimAndAttach()
    local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local PedID = PlayerPedId()
    local coords = GetEntityCoords(PedID)
    TaskPlayAnim(PedID, dict, "inspectfloor_player", 1.0, 8.0, -1, 1, 0, false, false, false)
    Wait(1000)
    local boneIndex = GetEntityBoneIndexByName(PedID, "SKEL_R_HAND")
    local modelHash = GetHashKey("P_CS_MININGPAN01X")
    LoadModel(modelHash)
    entity = CreateObject(modelHash, coords.x + 0.3, coords.y, coords.z, true, false, false)
    SetEntityVisible(entity, true)
    SetEntityAlpha(entity, 255, false)
    Citizen.InvokeNative(0x283978A15512B2FE, entity, true)
    SetModelAsNoLongerNeeded(modelHash)
    AttachEntityToEntity(entity, PedID, boneIndex, 0.2, 0.0, -0.2, -100.0, -50.0, 0.0, false, false, false, true, 2,
        true)
end

function GoldShake()
    local dict = "script_re@gold_panner@gold_success"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, "SEARCH02", 1.0, 8000, -1, 1, 0, false, false, false)
    Wait(8000)
end

function LoadModel(model)
    local attempts = 0
    while attempts < 100 and not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
        attempts = attempts + 1
    end
    return IsModelValid(model)
end

function ActPrompts()
    ResetPrompts()
    CreateThread(function()
        local str = 'Gold Panning'
        Prompt_Panning = PromptRegisterBegin()
        PromptSetControlAction(Prompt_Panning, _Keys.E)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Prompt_Panning, str)
        PromptSetEnabled(Prompt_Panning, true)
        PromptSetVisible(Prompt_Panning, true)
        PromptSetHoldMode(Prompt_Panning, true)
        PromptSetGroup(Prompt_Panning, Group)
        PromptRegisterEnd(Prompt_Panning)
    end)
end

function ResetPrompts()
    Prompt_Panning = nil
    Group = GetRandomIntInRange(0, 0xffffff)
end

function Cinema(Bool)
    return Citizen.InvokeNative(0xCE7A90B160F75046, Bool)
end

----------------------------------------------------------------------------------
local ActiveSmokes = {}
local objectmodel2 = Config.Gold.object
local prompts = {}
local activeGroupIndex = 0
local newindex = 1
local inUse = false

function ObjBusy(bool)
    if bool then
        inUse = true
    else
        inUse = false
    end
end

RegisterNetEvent('UndergroundGold:Cook')
AddEventHandler('UndergroundGold:Cook', function(item, amount)
    local result = HateOrLoveIt()
    local hot = result.hot
    local cold = result.cold
    local good = result.good
    local average = (hot + cold + good) / 3

    for k, v in pairs(Config.Items) do
        if v.name == item then
            local accuracy = math.abs(v.temp - average)
            local accuracyPercent = 100 - (accuracy / v.temp * 100)
            if accuracyPercent < 75 then
                print("You failed to cook the item")
                return
            else
                print("You cooked the item")
                TriggerServerEvent("UndergroundGold:GiveItem", v.outputitemname, v.outputamount)
                return
            end
        end
    end

end)

----------------------------------------------------------------------------------
------------------------ Main Threads Go Here ------------------------------------
----------------------------------------------------------------------------------

function init()
    for groupIndex, v in pairs(Config.groups) do
        local actions = v.actions
        local prompt_group = GetRandomIntInRange(0, 0xffffff)
        Config.groups[groupIndex].prompt_group = prompt_group
        for index, av in pairs(actions) do
            local actionName = av[1]
            local controlAtIndex = Config.controlsorder[index]
            prompt = PromptRegisterBegin()
            PromptSetControlAction(prompt, controlAtIndex)
            PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", actionName))
            PromptSetEnabled(prompt, 1)
            PromptSetVisible(prompt, 1)
            PromptSetStandardMode(prompt, 1)
            PromptSetGroup(prompt, prompt_group)
            PromptRegisterEnd(prompt)
            table.insert(prompts, prompt)
            Citizen.Wait(50)
        end
    end
end

Citizen.CreateThread(function()
    init()
    while true do
        Citizen.Wait(0)
        if not inUse then
            if activeGroupIndex == 0 then
                if EasyBaby then
                    EasyBaby = false
                end
                Wait(1000)
            else
                if not EasyBaby then
                    local coords = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent("UndergroundGold:StartWaterLevel", coords)
                    EasyBaby = true
                end
                PromptSetActiveGroupThisFrame(Config.groups[activeGroupIndex].prompt_group, CreateVarString(10,
                    "LITERAL_STRING", "Gold" .. Config.groups[activeGroupIndex].name))
                disablecontrols()
                if IsControlJustPressed(0, 0x07CE1E61) then
                    if NativeUipromptIsControlActionActive(0x07CE1E61) then -- check this control key
                        if activeGroupIndex > 1 then
                            activeGroupIndex = activeGroupIndex - 1
                        else
                            activeGroupIndex = 0
                        end
                    end
                end
                if IsControlJustPressed(0, 0xF84FA74F) then
                    if NativeUipromptIsControlActionActive(0xF84FA74F) then -- check this control key
                        -- if activeGroupIndex < #Config.groups then
                        activeGroupIndex = activeGroupIndex + 1
                        -- else
                        --     activeGroupIndex = 1
                        -- end
                    end
                end

                for index, control in pairs(Config.controlsorder) do
                    if IsControlJustPressed(0, control) then
                        if NativeUipromptIsControlActionActive(control) then
                            local object = Config.groups[activeGroupIndex].name
                            local ProcessType = Config.groups[activeGroupIndex].actions[index][2]
                            local finalprod = Config.groups[activeGroupIndex].actions[index][1]
                            TriggerEvent("UndergroundGold:process", object, ProcessType, finalprod)
                            activeGroupIndex = 0
                        end
                    end
                end
            end
        end
    end
end)

function disablecontrols()
    DisableControlAction(0, 0xF8982F00, true)
end

function NativeUipromptIsControlActionActive(control)
    return Citizen.InvokeNative(0x1BE19185B8AFE299, control)
end

RegisterNetEvent("UndergroundGold:process")
AddEventHandler("UndergroundGold:process", function(object, ProcessType, finalprod)
    local finalprod = finalprod
    local ProcessType = ProcessType
    local object = object
    local pcoords = GetEntityCoords(PlayerPedId())
    local checkifobjexists = GetClosestObjectOfType(pcoords, 1.0, GetHashKey(objectmodel2), false, false, false)
    local coords = GetEntityCoords(checkifobjexists)

    if ProcessType == "p1" then
        newindex = 2

    elseif ProcessType == "p2" then
        TriggerServerEvent("UndergroundGold:Inspect", coords) --
        newindex = 1

    elseif ProcessType == "p3" then
        ObjBusy(true)
        TriggerEvent('UndergroundGold:Notify', "Gold", "Repairing the Gold.", 2000)
        local alldata = {}
        for k, v in pairs(Config.Gold.healthitems) do
            -- print("Adding " .. v.itemname)
            local amountz = 0
            amountz = SetAmount(v.itemlabel)
            -- print("Value: " .. amountz)
            amountz = tonumber(amountz)
            if amountz == nil then
                amountz = 0
                -- print("nil")
            end
            if not (amountz > 0 and amountz < 500) then
                amountz = 0
                -- print("not")
            else
                local itemz = v.itemname
                local dataz = {
                    item = itemz,
                    amount = amountz
                }
                table.insert(alldata, dataz)
            end
        end
        TriggerServerEvent("UndergroundGold:Repair", coords, alldata) --
        newindex = 1
        Wait(1000)
        ObjBusy(false)

    elseif ProcessType == "f1" then
        ObjBusy(true)
        if task1 then
            TriggerEvent("UndergroundGold:animbalde")
            TriggerServerEvent("UndergroundGold:Deposit", coords)
            task1 = false
        else
            TriggerEvent('UndergroundGold:Notify', "Gold", "You need to get water first", 2000)
        end
        newindex = 1
        Wait(1000)
        ObjBusy(false)

    elseif ProcessType == "f2" then
        TriggerEvent("UndergroundGold:animrecolher")
        TriggerServerEvent("UndergroundGold:CollectWater", coords) --
        newindex = 1

    elseif ProcessType == "f3" then
        TriggerServerEvent("UndergroundGold:StartProcess", coords) --
        newindex = 1

    end
end)

Citizen.CreateThread(function()
    Wait(5000)
    while true do
        Citizen.Wait(4000)
        while inUse ~= true do
            Citizen.Wait(2000)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local GoldExists = DoesObjectOfTypeExistAtCoords(playerCoords.x, playerCoords.y, playerCoords.z, 9.9,
                GetHashKey(objectmodel2), true)
            if GoldExists then
                local closestGold = GetClosestObjectOfType(playerCoords, 4.0, GetHashKey(objectmodel2), true)
                local distanceGold = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z,
                    GetEntityCoords(closestGold).x, GetEntityCoords(closestGold).y, GetEntityCoords(closestGold).z, true)
                newindex = 1
                while distanceGold < 2.5 and not inUse do
                    Citizen.Wait(2)
                    activeGroupIndex = newindex
                    playerCoords = GetEntityCoords(playerPed)
                    distanceGold = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z,
                        GetEntityCoords(closestGold).x, GetEntityCoords(closestGold).y, GetEntityCoords(closestGold).z,
                        true)
                end
                activeGroupIndex = 0
            end
            activeGroupIndex = 0
        end
        activeGroupIndex = 0
    end
end)

RegisterNetEvent('UndergroundGold:Notify', function(Title, Text, Time)
    exports.UndergroundGold:UndergroundGoldLeftNote(Title, Text, 'generic_textures', 'temp_pedshot', Time)
end)

RegisterNetEvent("UndergroundGold:animbalde")
AddEventHandler("UndergroundGold:animbalde", function()
    model = GetEntityModel(PlayerPedId())
    if model == -1481695040 then -- ffelame
        baldefemale()
        print("!Tem couna!")
    else
        print("!Tem gaita!")
        baldemale()
    end
end)

local martelar = {
    [1] = {"mini_games@story@beechers@build_floor@john", "hammer_on_beat_mid", 1, 9000},
    [2] = {"mini_games@story@beechers@build_floor@john", "hammer_exit_mid", 0, 1500}
}

RegisterNetEvent("UndergroundGold:animmartelo")
AddEventHandler("UndergroundGold:animmartelo", function()
    local pipeobj = "p_woodstove01x"
    local closestPipe = GetClosestObjectOfType(playerCoords, 4.0, GetHashKey(pipeobj), true)
    local coords = GetEntityCoords(closestPipe)
    TaskTurnPedToFaceCoord(PlayerPedId(), coords.x, coords.y, coords.z, 1000)
    SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), true)
    local pedUsableObj = "p_sledgehammer03x"
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local prop = GetHashKey(pedUsableObj)
    local tempObj2 = CreateObject(prop, pos.x, pos.y, pos.z, true, true, false)
    local pedObjBone = "SKEL_R_HAND"
    local boneIndex = GetEntityBoneIndexByName(playerPed, pedObjBone)
    AttachEntityToEntity(tempObj2, playerPed, boneIndex, 0.08, -0.03, -0.01, -90.0, 45.0, 0.0, true, true, false, true,
        1, true)
    local pedObjAnimName = "hammer_loop_good"
    for i, anim in ipairs(martelar) do
        RequestAnimDict(anim[1])
        while not HasAnimDictLoaded(anim[1]) do
            Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), anim[1], anim[2], 1.0, 0.5, anim[4], tonumber(anim[3]), 0.0, 0, 0, 0)
        Wait(anim[4])
    end
    ClearPedTasks(PlayerPedId())
    DeleteObject(tempObj2)
    SetModelAsNoLongerNeeded(prop)
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNetEvent("UndergroundGold:animrecolher")
AddEventHandler("UndergroundGold:animrecolher", function()
    SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), true)
    RequestAnimDict("amb_work@world_human_clean_table@male_a@idle_b")
    while not HasAnimDictLoaded("amb_work@world_human_clean_table@male_a@idle_b") do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_clean_table@male_a@idle_b", "idle_f", 1.0, 0.5, 4500, tonumber(0),
        0.0, 0, 0, 0)
    Wait(4500)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNetEvent("UndergroundGold:GetWater")
AddEventHandler("UndergroundGold:GetWater", function()
    local ok = false
    local ok2 = false
    local PedID = PlayerPedId()
    local coords = GetEntityCoords(PedID)
    local InWater = IsEntityInWater(PedID)
    local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x, coords.y, coords.z)
    local OnMount, InVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID, true)
    for k, v in pairs(Config.WaterTypes) do
        if ((Water == Config.WaterTypes[k]["waterhash"]) and (InWater)) then
            ok = true
            local InWater = IsEntityInWater(PedID)
            if ((not OnMount) and (not (InVeh))) then
                print(task1)
                ok2 = true
                -- if task1 then
                -- TriggerEvent('UndergroundGold:Notify', "Gold", "You already have water, go deposit first", 2000)
                -- else
                -- end
            end
        end
    end
    if not ok then
        TriggerEvent('UndergroundGold:Notify', "Gold", "You need to be on water!", 2000)
        task1 = false
    end
    if ok2 then
        TriggerEvent("UndergroundGold:animgetwater")
        task1 = true
    end
end)

RegisterNetEvent("UndergroundGold:animgetwater")
AddEventHandler("UndergroundGold:animgetwater", function() -- Funciona para male e female
    print("traske true")
    ClearPedTasks(ped)
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey("WORLD_HUMAN_BUCKET_FILL"), 15000, true, false, false, false)
    Wait(100)
    ClearPedTasks(ped)
end)

function baldemale() -- Apenas Male
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 5000, true, false,
        false, false)
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 0, 1, false, false,
        false)
    Citizen.InvokeNative(0x524B54361229154F, PlayerPedId(), GetHashKey("WORLD_CAMP_JACK_ES_BUCKET_POUR"), 0, 1,
        GetHashKey("WORLD_CAMP_JACK_ES_BUCKET_POUR_MALE_A"), -1.0, 0)
    Wait(5000)
    ClearPedTasks(ped)
    Wait(2000)
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true)
end

local animfemale = {
    [1] = {"amb_work@world_human_bucket_pour@low@female_a@stand_exit_withprop", "exit_front", 1, 1500}
}

function baldefemale() -- Apenas Female
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true)
    SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), true)
    local pedUsableObj = "p_bucket03x"
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local prop = GetHashKey(pedUsableObj)
    local tempObj2 = CreateObject(prop, pos.x, pos.y, pos.z, true, true, false)
    local pedObjBone = "SKEL_R_HAND"
    local boneIndex = GetEntityBoneIndexByName(playerPed, pedObjBone)
    AttachEntityToEntity(tempObj2, playerPed, boneIndex, 0.05, -0.0, 0.0, -90.0, -45.0, -40.0, true, true, false, true,
        1, true)
    local pedObjAnimName = "hammer_loop_good"
    for i, anim in ipairs(animfemale) do
        RequestAnimDict(anim[1])
        while not HasAnimDictLoaded(anim[1]) do
            Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), anim[1], anim[2], 1.0, 0.5, anim[4], tonumber(anim[3]), 0.0, 0, 0, 0)
        Wait(anim[4])
    end
    ClearPedTasks(PlayerPedId())
    Wait(1000)
    DeleteObject(tempObj2)
    SetModelAsNoLongerNeeded(prop)
    FreezeEntityPosition(PlayerPedId(), false)
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true)
end

RegisterCommand("delwater", function(source, args, rawCommand)
    for k, v in pairs(activewater) do
        Citizen.InvokeNative(0x459598F579C98929, v.water, false)
    end
end)

RegisterNetEvent("UndergroundFurnace:StopWaterOnTable", function(id)
    for k, v in pairs(activewater) do
        if v.id == id then
            Citizen.InvokeNative(0x459598F579C98929, v.water, false)
            table.remove(activewater, k)
        end
    end
end)

RegisterNetEvent("UndergroundFurnace:WaterOnTable1", function(coords, id)
    local new_ptfx_dictionary = "anm_water"
    local new_ptfx_name = "ent_anim_water_bucket_fill"
    local current_ptfx_dictionary = new_ptfx_dictionary
    local current_ptfx_name = new_ptfx_name
    local ptfx_offcet_x = 0.0
    local ptfx_offcet_y = -0.1
    local ptfx_offcet_z = 0.90
    local ptfx_rot_x = -90.0
    local ptfx_rot_y = 0.0
    local ptfx_rot_z = 0.0
    local ptfx_scale = 1.0
    local ptfx_axis_x = 0
    local ptfx_axis_y = 0
    local ptfx_axis_z = 0
    local ptfx_offcet_x1 = 0.2
    local ptfx_offcet_x2 = -0.2

    if DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 2.0, GetHashKey(objectmodel2), true) then
        local closestGold = GetClosestObjectOfType(coords.x, coords.y, coords.z, 2.0, GetHashKey(objectmodel2), true)
        current_ptfx_dictionary = new_ptfx_dictionary
        current_ptfx_name = new_ptfx_name
        if not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then -- HasNamedPtfxAssetLoaded
            Citizen.InvokeNative(0xF2B2353BBC0D4E8F, GetHashKey(current_ptfx_dictionary)) -- RequestNamedPtfxAsset
            local counter = 0
            while not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) and counter <= 300 do -- while not HasNamedPtfxAssetLoaded
                Citizen.Wait(0)
            end
        end
        if Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then -- HasNamedPtfxAssetLoaded
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id1 = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x1, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id2 = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x2, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            local ndata1 = {
                water = current_ptfx_handle_id1,
                id = 1
            }
            table.insert(activewater, ndata1)
            local ndata2 = {
                water = current_ptfx_handle_id2,
                id = 1
            }
            table.insert(activewater, ndata2)
            local ndata = {
                water = current_ptfx_handle_id,
                id = id
            }
            table.insert(activewater, ndata)
        end
    end
end)

RegisterNetEvent("UndergroundFurnace:WaterOnTable2", function(coords, id)
    local new_ptfx_dictionary = "anm_water"
    local new_ptfx_name = "ent_anim_water_bucket_fill"
    local current_ptfx_dictionary = new_ptfx_dictionary
    local current_ptfx_name = new_ptfx_name
    local ptfx_offcet_x = 0.0
    local ptfx_offcet_y = -0.1
    local ptfx_offcet_z = 0.90
    local ptfx_rot_x = -90.0
    local ptfx_rot_y = 0.0
    local ptfx_rot_z = 0.0
    local ptfx_scale = 1.0
    local ptfx_axis_x = 0
    local ptfx_axis_y = 0
    local ptfx_axis_z = 0
    local ptfx_offcet_x1 = 0.2
    local ptfx_offcet_x2 = -0.2

    if DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 2.0, GetHashKey(objectmodel2), true) then
        local closestGold = GetClosestObjectOfType(coords.x, coords.y, coords.z, 2.0, GetHashKey(objectmodel2), true)
        current_ptfx_dictionary = new_ptfx_dictionary
        current_ptfx_name = new_ptfx_name
        if not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then -- HasNamedPtfxAssetLoaded
            Citizen.InvokeNative(0xF2B2353BBC0D4E8F, GetHashKey(current_ptfx_dictionary)) -- RequestNamedPtfxAsset
            local counter = 0
            while not Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) and counter <= 300 do -- while not HasNamedPtfxAssetLoaded
                Citizen.Wait(0)
            end
        end
        if Citizen.InvokeNative(0x65BB72F29138F5D6, GetHashKey(current_ptfx_dictionary)) then -- HasNamedPtfxAssetLoaded
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id1 = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x1, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            Citizen.InvokeNative(0xA10DB07FC234DD12, current_ptfx_dictionary) -- UseParticleFxAsset
            local current_ptfx_handle_id2 = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestGold,
                ptfx_offcet_x2, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            local ndata1 = {
                water = current_ptfx_handle_id1,
                id = 1
            }
            table.insert(activewater, ndata1)
            local ndata2 = {
                water = current_ptfx_handle_id2,
                id = 1
            }
            table.insert(activewater, ndata2)
            local ndata = {
                water = current_ptfx_handle_id,
                id = id
            }
            table.insert(activewater, ndata)
        end
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    for k, v in pairs(activewater) do
        Citizen.InvokeNative(0x459598F579C98929, v.water, false)
    end
end)
