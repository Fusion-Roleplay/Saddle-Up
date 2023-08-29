local ActiveSmokes, activefires = {}, {}
local objectmodel2 = Config.Furnace.object
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

RegisterNetEvent('UndergroundFurnace:Cook')
AddEventHandler('UndergroundFurnace:Cook', function(item, amount)
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
                TriggerServerEvent("UndergroundFurnace:GiveItem", v.outputitemname, v.outputamount)
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
        Citizen.Wait(10)
        if not inUse then
            if activeGroupIndex == 0 then
                Wait(2000)
            else
                PromptSetActiveGroupThisFrame(Config.groups[activeGroupIndex].prompt_group, CreateVarString(10,
                    "LITERAL_STRING", Config.groups[activeGroupIndex].name))
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
                            TriggerEvent("UndergroundFurnace:process", object, ProcessType, finalprod)
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

RegisterNetEvent("UndergroundFurnace:process")
AddEventHandler("UndergroundFurnace:process", function(object, ProcessType, finalprod)
    local finalprod = finalprod
    local ProcessType = ProcessType
    local object = object
    local pcoords = GetEntityCoords(PlayerPedId())
    local checkifobjexists = GetClosestObjectOfType(pcoords, 1.0, GetHashKey(objectmodel2), false, false, false)
    local coords = GetEntityCoords(checkifobjexists)
    local alldata = {}
    if ProcessType == "p1" then
        newindex = 2
        Wait(200)

    elseif ProcessType == "p2" then
        newindex = 3
        Wait(200)

    elseif ProcessType == "p3" then
        newindex = 4
        Wait(200)

    elseif ProcessType == "p4" then
        newindex = 5
        Wait(200)

    elseif ProcessType == "f1" then
        ObjBusy(true)
        local amount = SetAmount(Config.Fuel.itemlabel)
        TriggerEvent('UndergroundFurnace:Notify', "Furnace", "You added " .. amount .. " " .. Config.Fuel.itemlabel .. " to the furnace", 2000)
        TriggerServerEvent("UndergroundFurnace:AddFuel", coords, amount)
        newindex = 1
        Wait(1000)
        ObjBusy(false)

    elseif ProcessType == "f2" then
        ObjBusy(true)
        TriggerServerEvent("UndergroundFurnace:CollectFuel", coords)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(5)

    elseif ProcessType == "f3" then
        newindex = 1
        print(6)

    elseif ProcessType == "m1" then
        ObjBusy(true)
        for k, v in pairs(Config.Items) do
            print("Adding " .. v.name)
            local amountz = 0
            amountz = SetAmount(v.name)
            print("Value: "..amountz)
            amountz = tonumber(amountz)
            if amountz == nil then
                amountz = 0
                print("nil")
            end
            if not (amountz > 0 and amountz < 500) then
                amountz = 0
                print("not")
            else
                local itemz = v.itemname
                local dataz = {
                    item = itemz,
                    amount = amountz
                }
                table.insert(alldata, dataz)
                TriggerEvent('UndergroundFurnace:Notify', "Furnace", "You added " .. amountz .. " " .. v.name .. " to the furnace", 2000)
                print("Added " .. dataz.item .. " " .. dataz.amount)
            end
        end
        TriggerServerEvent("UndergroundFurnace:AddMineralsv2", coords, alldata)
        newindex = 1
        Wait(500)
        ObjBusy(false)
        print(4)

    elseif ProcessType == "m2" then
        ObjBusy(true)
        TriggerServerEvent("UndergroundFurnace:CollectMinerals", coords)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(5)

    elseif ProcessType == "m3" then
        newindex = 1
        print(6)

    elseif ProcessType == "s1" then
        ObjBusy(true)
        TriggerEvent('UndergroundFurnace:Notify', "Furnace", "Set the fire to the right temperature.", 2000)
        -- local result = HateOrLoveIt()
        local result = {
            good = 1000,
            cold = 1000,
            hot = 1000,
            realtemp = 850
        }
        TriggerServerEvent("UndergroundFurnace:StartFire", coords, result)
        TriggerServerEvent("UndergroundFurnace:ActiveCooking", coords, result)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(6)

    elseif ProcessType == "s2" then
        ObjBusy(true)
        TriggerEvent('UndergroundFurnace:Notify', "Furnace", "Fire stopped.", 2000)
        for k, v in pairs(activefires) do
            Citizen.InvokeNative(0x459598F579C98929, v, false) -- RemoveFire
        end
        TriggerServerEvent("UndergroundFurnace:StopFire", coords)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(6)

    elseif ProcessType == "s3" then
        newindex = 1
        print(6)

    elseif ProcessType == "e1" then
        ObjBusy(true)
        TriggerServerEvent("UndergroundFurnace:Inspect", coords)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(6)

    elseif ProcessType == "e2" then
        ObjBusy(true)
        TriggerEvent('UndergroundFurnace:Notify', "Furnace", "Repairing the furnace.", 2000)
        local alldata = {}
        for k, v in pairs(Config.Furnace.healthitems) do
            print("Adding " .. v.itemname)
            local amountz = 0
            amountz = SetAmount(v.itemlabel)
            print("Value: "..amountz)
            amountz = tonumber(amountz)
            if amountz == nil then
                amountz = 0
                print("nil")
            end
            if not (amountz > 0 and amountz < 500) then
                amountz = 0
                print("not")
            else
                local itemz = v.itemname
                local dataz = {
                    item = itemz,
                    amount = amountz
                }
                table.insert(alldata, dataz)
                TriggerEvent('UndergroundFurnace:Notify', "Furnace", "Added "..dataz.item.." "..dataz.amount, 1000)
            end
        end
        TriggerServerEvent("UndergroundFurnace:Repair", coords, alldata)
        newindex = 1
        Wait(1000)
        ObjBusy(false)
        print(6)

    elseif ProcessType == "e3" then
        newindex = 1
        print(6)
    end
end)

Citizen.CreateThread(function()
    while true do
        --TriggerServerEvent('UndergroundFurnace:PropRequest')
        Citizen.Wait(4000)
        while inUse ~= true do
            Citizen.Wait(5000)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local FurnaceExists = DoesObjectOfTypeExistAtCoords(playerCoords.x, playerCoords.y, playerCoords.z, 9.9,
                GetHashKey(objectmodel2), true)
            if FurnaceExists then
                local closestFurnace = GetClosestObjectOfType(playerCoords, 4.0, GetHashKey(objectmodel2), true)
                local distanceFurnace = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z,
                    GetEntityCoords(closestFurnace).x, GetEntityCoords(closestFurnace).y,
                    GetEntityCoords(closestFurnace).z, true)
                newindex = 1
                while distanceFurnace < 2.5 and not inUse do
                    Citizen.Wait(100)
                    activeGroupIndex = newindex
                    playerCoords = GetEntityCoords(playerPed)
                    distanceFurnace = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z,
                        GetEntityCoords(closestFurnace).x, GetEntityCoords(closestFurnace).y,
                        GetEntityCoords(closestFurnace).z, true)
                end
                activeGroupIndex = 0
            end
            activeGroupIndex = 0
        end
        activeGroupIndex = 0
    end
end)
--TriggerEvent('UndergroundFurnace:Notify', Title, Text, 2000)
RegisterNetEvent('UndergroundFurnace:Notify', function(Title, Text, Time)
    exports.UndergroundFurnace:UndergroundFurnaceLeftNote(Title, Text, 'generic_textures', 'temp_pedshot', Time)
end)


RegisterNetEvent("UndergroundFurnace:ConfirmFire", function(coords)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local new_ptfx_dictionary = "anm_core"
    local new_ptfx_name = "ent_anim_campfire_stomp"
    local current_ptfx_dictionary = new_ptfx_dictionary
    local current_ptfx_name = new_ptfx_name
    local ptfx_offcet_x = 0.0
    local ptfx_offcet_y = -0.4
    local ptfx_offcet_z = 0.9
    local ptfx_rot_x = 0.0
    local ptfx_rot_y = 0.0
    local ptfx_rot_z = 0.0
    local ptfx_scale = 1.0
    local ptfx_axis_x = 0
    local ptfx_axis_y = 0
    local ptfx_axis_z = 0

    if DoesObjectOfTypeExistAtCoords(playerCoords.x, playerCoords.y, playerCoords.z, 25.0, GetHashKey(objectmodel2),
        true) then
        local closestFurnace = GetClosestObjectOfType(playerCoords, 4.0, GetHashKey(objectmodel2), true)
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
            local current_ptfx_handle_id = Citizen.InvokeNative(0x8F90AB32E1944BDE, current_ptfx_name, closestFurnace,
                ptfx_offcet_x, ptfx_offcet_y, ptfx_offcet_z, ptfx_rot_x, ptfx_rot_y, ptfx_rot_z, ptfx_scale,
                ptfx_axis_x, ptfx_axis_y, ptfx_axis_z)
            table.insert(activefires, current_ptfx_handle_id)
        end
    end
end)

RegisterCommand("delfire", function()
    for k, v in pairs(activefires) do
        Citizen.InvokeNative(0x459598F579C98929, v, false) -- RemoveFire
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, prompt in pairs(prompts) do
            PromptDelete(prompt)
        end
        for k, v in pairs(activefires) do
            Citizen.InvokeNative(0x459598F579C98929, v, false) -- RemoveFire
        end
    end
end)

