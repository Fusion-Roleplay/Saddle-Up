math.randomseed(GetGameTimer())
local CancelPrompt
local SetPrompt
local RotateLeftPrompt
local RotateRightPrompt
local active = false
local Props = {}
local PropsData = {}
local PromptDeployCancel = Config.PromptDeplayCancel
local PromptDeploySet = Config.PromptDeplaySet
local PromptDeployRotL = Config.PromptDeplayRotL
local PromptDeployRotR = Config.PromptDeplayRotR
local DialogTitle = Config.DialogTitle
local PromptPlacerGroup = GetRandomIntInRange(0, 0xffffff)

Citizen.CreateThread(function()
    Set()
    Del()
    RotateLeft()
    RotateRight()
    TriggerServerEvent("UndergroundFurnace:PropRequest")
end)

function Del()
    Citizen.CreateThread(function()
        local str = PromptDeployCancel
        CancelPrompt = PromptRegisterBegin()
        PromptSetControlAction(CancelPrompt, 0xF84FA74F)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(CancelPrompt, str)
        PromptSetEnabled(CancelPrompt, true)
        PromptSetVisible(CancelPrompt, true)
        PromptSetHoldMode(CancelPrompt, true)
        PromptSetGroup(CancelPrompt, PromptPlacerGroup)
        PromptRegisterEnd(CancelPrompt)

    end)
end

function Set()
    Citizen.CreateThread(function()
        local str = PromptDeploySet
        SetPrompt = PromptRegisterBegin()
        PromptSetControlAction(SetPrompt, 0x07CE1E61)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SetPrompt, str)
        PromptSetEnabled(SetPrompt, true)
        PromptSetVisible(SetPrompt, true)
        PromptSetHoldMode(SetPrompt, true)
        PromptSetGroup(SetPrompt, PromptPlacerGroup)
        PromptRegisterEnd(SetPrompt)

    end)
end

function RotateLeft()
    Citizen.CreateThread(function()
        local str = PromptDeployRotL
        RotateLeftPrompt = PromptRegisterBegin()
        PromptSetControlAction(RotateLeftPrompt, 0xA65EBAB4)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(RotateLeftPrompt, str)
        PromptSetEnabled(RotateLeftPrompt, true)
        PromptSetVisible(RotateLeftPrompt, true)
        PromptSetStandardMode(RotateLeftPrompt, true)
        PromptSetGroup(RotateLeftPrompt, PromptPlacerGroup)
        PromptRegisterEnd(RotateLeftPrompt)

    end)
end

function RotateRight()
    Citizen.CreateThread(function()
        local str = PromptDeployRotR
        RotateRightPrompt = PromptRegisterBegin()
        PromptSetControlAction(RotateRightPrompt, 0xDEB34313)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(RotateRightPrompt, str)
        PromptSetEnabled(RotateRightPrompt, true)
        PromptSetVisible(RotateRightPrompt, true)
        PromptSetStandardMode(RotateRightPrompt, true)
        PromptSetGroup(RotateRightPrompt, PromptPlacerGroup)
        PromptRegisterEnd(RotateRightPrompt)

    end)
end

function modelrequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end

function PropPlacer(ObjectModel)
    local myPed = PlayerPedId()
    local pHead = GetEntityHeading(myPed)
    local pos = GetEntityCoords(myPed)
    local PropHash = GetHashKey(ObjectModel)
    local coords = GetEntityCoords(myPed)
    local _x, _y, _z = table.unpack(coords)
    local forward = GetEntityForwardVector(myPed)
    local x, y, z = table.unpack(pos - forward * -1.0)
    local ox = x - _x
    local oy = y - _y
    local oz = z - _z
    local heading = 0.0
    local object
    SetCurrentPedWeapon(myPed, -1569615261, true)
    while not HasModelLoaded(PropHash) do
        Wait(500)
        modelrequest(PropHash)
    end
    local tempObj = CreateObject(PropHash, pos.x, pos.y, pos.z, true, false, false)
    local tempObj2 = CreateObject(PropHash, pos.x, pos.y, pos.z, true, false, false)
    AttachEntityToEntity(tempObj2, myPed, 0, ox, oy, 0.5, 0.0, 0.0, 0, true, false, false, false, false)
    SetEntityAlpha(tempObj, 60)
    SetEntityAlpha(tempObj2, 0)
    while true do
        Wait(5)
        local PropPlacerGroupName = CreateVarString(10, 'LITERAL_STRING', DialogTitle)
        PromptSetActiveGroupThisFrame(PromptPlacerGroup, PropPlacerGroupName)

        AttachEntityToEntity(tempObj, myPed, 0, ox, oy, -0.8, 0.0, 0.0, heading, true, false, false, false, false)
        if IsControlPressed(1, 0xA65EBAB4) then
            heading = heading - 1
        end
        if IsControlPressed(1, 0xDEB34313) then
            heading = heading + 1
        end
        local pPos = GetEntityCoords(tempObj2)
        if PromptHasHoldModeCompleted(SetPrompt) then
                FreezeEntityPosition(PlayerPedId(), true)
                TriggerServerEvent("UndergroundFurnace:SaveProp", PropHash, pPos.x, pPos.y, pPos.z,
                    heading)
                DeleteEntity(tempObj2)
                DeleteEntity(tempObj)
                FreezeEntityPosition(PlayerPedId(), false)
                ObjBusy(false)
                break
        end

        if PromptHasHoldModeCompleted(CancelPrompt) then
            DeleteEntity(tempObj2)
            DeleteEntity(tempObj)
            SetModelAsNoLongerNeeded(PropHash)
            if PropHash == GetHashKey(Config.ObjectDestilary) then
            TriggerServerEvent('UndergroundFurnace:GiveAnyItem', Config.ItemNameDestilary, 1)
            end
            ObjBusy(false)
            break
        end
    end
end

local inAreaWi = false

function CheckLocation()
    inAreaWi = false
    local coords = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Config.BlacklistedLocations) do
        local distance = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
        if distance < v.radious then
            inAreaWi = true
            return
        end
    end
end

function CheckTemperature()
    local coords = GetEntityCoords(PlayerPedId())
    local temp = GetTemperatureAtCoords(coords)
    if Config.TempBuildMin < 0.0 then
        return false
    elseif temp > Config.TempBuildMax then
        return false
    else
        return true
    end
end

RegisterNetEvent("UndergroundFurnace:PlaceProp")
AddEventHandler("UndergroundFurnace:PlaceProp", function(object)
    print(object)
    local tempOk = CheckTemperature()
    local locNotOk = CheckLocation()
    if tempOk ~= true then
        TheoUgNotify(Config.DialogTitle, Config.BadTemp, true, 2000)
        TriggerServerEvent('UndergroundFurnace:GiveAnyItem', Config.Furnace.itemname, 1)
    elseif inAreaWi == true then
        TheoUgNotify(Config.DialogTitle, Config.BadZone, true, 2000)
        TriggerServerEvent('UndergroundFurnace:GiveAnyItem', Config.Furnace.itemname, 1)
    else
        ObjBusy(true)
        PropPlacer(object)
    end
end)

RegisterNetEvent("UndergroundFurnace:RemoveProp")
AddEventHandler("UndergroundFurnace:RemoveProp", function()
    StopPlace = true
    for k, v in pairs(Props) do
        local coords = GetEntityCoords(PlayerPedId())
        local distance = Vdist(v.x, v.y, v.z, coords)
        if distance < 2 and v.obj ~= nil and DoesEntityExist(v.obj) then
            DeleteEntity(v.obj)
            TriggerServerEvent("UndergroundFurnace:DeleteProp", k)
            Props[k] = nil
        end
    end
end)

RegisterNetEvent("UndergroundFurnace:RemoveDestillaryAndBucket")
AddEventHandler("UndergroundFurnace:RemoveDestillaryAndBucket", function(coords)
    local destillary = GetClosestObjectOfType(coords, 6.0, GetHashKey(Config.ObjectDestilary), true)
    local destilarycoords = GetEntityCoords(destillary)
    local destroyedCoords = destilarycoords
    for k, v in pairs(Props) do
        local distance = Vdist(v.x, v.y, v.z, destilarycoords)
        if distance < 6 and v.obj ~= nil and DoesEntityExist(v.obj) then
            DeleteEntity(v.obj)
            TriggerServerEvent("UndergroundFurnace:DeleteProp", k)
            Props[k] = nil
        end
    end
    if DoesEntityExist(destillary) then
        DeleteEntity(destillary)
    end
    if DoesEntityExist(bucket) then
        DeleteEntity(bucket)
    end
    local DestroyedObject = GetHashKey(Config.ObjectDestroyedDestilary)
    TriggerEvent("StartCooldown", true)
    TriggerServerEvent("UndergroundFurnace:SaveProp", DestroyedObject, destroyedCoords.x, destroyedCoords.y, destroyedCoords.z, 0)
    StartFxSmoke(DestroyedObject, destroyedCoords)
    local WaitTime = (Config.SmokeTimeDestroyed * 1000)
    Wait(WaitTime)
    TriggerServerEvent('UndergroundFurnace:SmokeManage', "stop", destroyedCoords, WaitTime)
end)

local StopPlace = false

Citizen.CreateThread(function()
    while true do
        Wait(100)
        if not StopPlace then
            for k, v in pairs(Props) do
                local coords = GetEntityCoords(PlayerPedId())
                local distance = Vdist(v.coords.x, v.coords.y, v.coords.z, coords)
                if distance > 60 and v.obj ~= nil and DoesEntityExist(v.obj) then
                    DeleteEntity(v.obj)
                elseif distance < 40 and (v.obj == nil or not DoesEntityExist(v.obj)) then
                    while not HasModelLoaded(v.prophash) do
                        Wait(100)
                        modelrequest(v.prophash)
                    end
                    v.obj = CreateObject(v.prophash, v.coords.x, v.coords.y, v.coords.z, false, false, false)
                    SetEntityLodDist(v.obj, 40)
                    SetEntityHeading(v.obj, v.heading)
                    PlaceObjectOnGroundProperly(v.obj)
                    SetEntityAsMissionEntity(v.obj, true, true)
                    FreezeEntityPosition(v.obj, true)
                    SetModelAsNoLongerNeeded(v.prophash)
                end
            end
        end
    end
end)

RegisterNetEvent("UndergroundFurnace:GetProps")
AddEventHandler("UndergroundFurnace:GetProps", function(data)
    Props = data
end)

RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('UndergroundFurnace:PropRequest')
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k, v in pairs(Props) do
            DeleteEntity(v.obj)
        end
    end
end)

RegisterCommand("testdelobj", function()
    for k, v in pairs(Props) do
        table.remove(Props, k)
        TriggerServerEvent("UndergroundFurnace:DeleteProp", k)
        Wait(1000)
        DeleteEntity(v.obj)
    end
end)