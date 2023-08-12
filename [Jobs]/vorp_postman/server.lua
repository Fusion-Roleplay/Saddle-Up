local VorpCore
local VORPinv
local _Vehicles = {}
local _Packages = {}

Inventory = exports.vorp_inventory:vorp_inventoryApi()

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('vorp_postman:GetReward')
AddEventHandler("vorp_postman:GetReward", function(postOffice, deliverLocation)
    math.randomseed(os.time())
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local moneyReward = (math.random(deliverLocation.Money[1], deliverLocation.Money[2])) / 100
    Character.addCurrency(0, moneyReward)
    VorpCore.NotifyLeft(_source, _U("JobTip"), _U("MoneyReward")..moneyReward.._U("MoneyReward2"), "BLIPS", "blip_shop_doctor", 6000, "COLOR_GREEN")
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source 
    if _Packages[source] then
        for i, k in pairs(_Packages[source]) do
            deleteEnt(k)
        end
    end
    if _Vehicles[source] then
        deleteEnt(_Vehicles[source])
    end
end)

RegisterServerEvent('vorp_postman:GiveCartPackage')
AddEventHandler("vorp_postman:GiveCartPackage", function(cacheVehicle, PackageList)
    local _source = source
    _Packages[_source] = PackageList
    _Vehicles[_source] = cacheVehicle
end)

function deleteEnt(entity)
    if DoesEntityExist(entity) then
        while not NetworkHasControlOfEntity(entity) do
            Citizen.Wait(0)
            NetworkRequestControlOfEntity(entity)
        end
        Citizen.Wait(100)
        DeleteEntity(entity)
    end
end