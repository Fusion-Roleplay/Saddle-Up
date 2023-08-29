RegisterCommand("testsmoke", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    TriggerEvent("UndergroundFurnace:Smoke", x, y, z, 10000)
end)

RegisterCommand("testminigame", function()
    local result = HateOrLoveIt()
    print(result)
    local hot = result.hot
    local cold = result.cold
    local good = result.good
    local real = result.realtemp
    print(real)
    print("Result is: " .. "Hot: " .. hot .. " Cold: " .. cold .. " Good: " .. good)
end)

RegisterCommand("testfurnace", function()
    TriggerEvent("UndergroundFurnace:PlaceProp", Config.Furnace.object)
end)
