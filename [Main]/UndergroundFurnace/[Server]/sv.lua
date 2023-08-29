--[[VorpCore = {}
local VorpInv

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

-- Register Usable Items, for other frames you should have something similar.
-- You only need to trigger one event in order to the player use each item.
VorpInv.RegisterUsableItem(Config.ItemNameDestilary, function(data)
    local source = data.source
    VorpInv.subItem(source, Config.ItemNameDestilary, 1)
    --This is the event that will place the destillary
    TriggerClientEvent("TheoUgMoonshiners:PlaceProp", source, Config.ObjectDestilary)
end)

]] local Props = {}
local Cooking = false

function loadProps()
    prop = LoadResourceFile(GetCurrentResourceName(), "Props.json") or ""
    if prop ~= "" then
        Props = json.decode(prop)
    else
        Props = {}
    end
    print("loaded " .. #Props .. " props")
end

CreateThread(function()
    Wait(1000)
    loadProps()
end)

function idGeneration()
    local random = math.random(1, 999999)
    for k, v in pairs(Props) do
        if random == v.propid then
            idGeneration()
        end
    end
    return random
end

RegisterServerEvent("UndergroundFurnace:SaveProp")
AddEventHandler("UndergroundFurnace:SaveProp", function(prophash, x, y, z, heading, owner, charid)
    local _source = source
    local newprop = {
        propid = idGeneration(),
        prophash = prophash,
        obj = 0,
        coords = {
            x = x,
            y = y,
            z = z
        },
        heading = heading,
        fuelremaining = 0,
        fueldebris = 0,
        lastfuelupdated = os.time(),
        inputeditems = {},
        onprosscessitems = {},
        readytocollect = {},
        health = Config.Furnace.maxhealth,
        lastupdated = os.time(),
        owner = 1, -- owner,
        charid = 1, -- charid,
        temperature = 0
    }
    table.insert(Props, newprop)
    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
    TriggerClientEvent('UndergroundFurnace:GetProps', -1, Props)
end)

RegisterServerEvent("UndergroundFurnace:PropRequest")
AddEventHandler("UndergroundFurnace:PropRequest", function()
    local _source = source
    TriggerClientEvent('UndergroundFurnace:GetProps', -1, Props)
end)

RegisterServerEvent("UndergroundFurnace:DeleteProp")
AddEventHandler("UndergroundFurnace:DeleteProp", function(id)
    local _source = source
    Props[id] = nil
    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
    TriggerClientEvent('UndergroundFurnace:GetProps', -1, Props)
end)

------------------------------------------------------------------------------------------
------------------------------------ Cooking Stuff ---------------------------------------
------------------------------------------------------------------------------------------

-- This function is used to check the amount of items that the player has.
function SendItemCount(src, item)
    local _source = source
    local ItemCount = 10 -- VorpInv.getItemCount(_source, item)
    return ItemCount
end

-- Take items from player
function getItems(src, item)
    -- local data = {}
    -- check item amount
    local amount = SendItemCount()
    print("wtf " .. src, item, amount) -- VorpInv.subItem(_source, item, count) 
    -- add amount to the table
    local ndata = {
        item = item,
        amount = amount
    }
    -- table.insert(data, ndata)
    -- take stuff
    return ndata
end

-- Get the prop id
function getPropId(coords)
    print("getPropId")
    for k, v in pairs(Props) do
        local ncoords = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        }
        print(v.coords.x, v.coords.y, v.coords.z)
        local distancex = (ncoords.x - v.coords.x)
        local distancey = (ncoords.y - v.coords.y)
        local dist = math.sqrt(distancex * distancex + distancey * distancey)
        print(dist)
        if dist <= 1 then
            print("propid " .. v.propid)
            return v.propid
        end
    end
end

-- Add fuel to the furnace
RegisterServerEvent('UndergroundFurnace:AddFuel')
AddEventHandler("UndergroundFurnace:AddFuel", function(coords)
    local propid = getPropId(coords)
    local amount = getItems(source, Config.Fuel.itemname)
    for k, v in pairs(Props) do
        print("prop " .. v.propid .. " fuel " .. propid)
        if v.propid == propid then
            v.fuelremaining = v.fuelremaining + amount.amount
            print("new amount: " .. v.fuelremaining)
            -- save to file
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

-- Add minerals to the furnace
RegisterServerEvent('UndergroundFurnace:AddMineralsv2')
AddEventHandler("UndergroundFurnace:AddMineralsv2", function(coords, alldata)
    local propid = getPropId(coords)
    local newbatch = {}
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(alldata) do
                local amount = getItems(source, b.item)
                if amount.amount < b.amount then
                    print("not enough items")
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, amount.amount)
                    return
                else
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, (amount.amount - b.amount))
                    newbatch = {}
                    newbatch = {
                        item = b.item,
                        amount = b.amount,
                        time = 0
                    }
                    table.insert(v.inputeditems, newbatch)
                    print("deposit: " .. b.item .. " " .. amount.amount)
                    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                end
            end
        end
    end
end)

-- Add minerals to the furnace
RegisterServerEvent('UndergroundFurnace:AddMinerals')
AddEventHandler("UndergroundFurnace:AddMinerals", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            for c, d in pairs(Config.Items) do
                local amount = getItems(source, d.itemname)
                -- for a, b in pairs(v.inputeditems) do
                local newbatch = {
                    item = d.itemname,
                    amount = amount.amount,
                    time = 0
                }
                table.insert(v.inputeditems, newbatch)
                print("deposit: " .. d.itemname .. " " .. amount.amount)
                SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
            end
            -- end
        end
    end
end)

-- Collect the remaining fuel from the furnace
RegisterServerEvent('UndergroundFurnace:CollectFuel')
AddEventHandler("UndergroundFurnace:CollectFuel", function(coords)
    if Cooking then
        print("go fuck yourself")
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            -- This need to give wood and coal
            local woodamount = v.fuelremaining
            v.fuelremaining = 0
            local coalamount = v.fueldebris
            v.fueldebris = 0
            local wooditem = Config.Fuel.itemname
            local coalitem = Config.Fuel.outputitemname
            local data = {{
                item = wooditem,
                amount = woodamount
            }, {
                item = coalitem,
                amount = coalamount
            }}
            for a, b in pairs(data) do
                TriggerClientEvent('UndergroundFurnace:Notify', "Furnace", "You got "..b.amount.." "..b.item ,2000)
                TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, b.amount)
            end
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

-- Collect the cooked items from the furnace
RegisterServerEvent('UndergroundFurnace:CollectMinerals')
AddEventHandler("UndergroundFurnace:CollectMinerals", function(coords)
    if Cooking then
        print("go fuck yourself")
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(v.readytocollect) do
                TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b[1], b[2])
                TriggerClientEvent('UndergroundFurnace:Notify', "Furnace", "You got "..b[2].." "..b[1] ,2000)
                print("Collect: " .. b[1], b[2])
                table.remove(v.readytocollect, a)
            end
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:Inspect")
AddEventHandler("UndergroundFurnace:Inspect", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            print("inspect: "..v.health)
            if v.health > 8000  then
                TriggerClientEvent('UndergroundFurnace:Notify', "Furnace", "This furnace is in excelent condition and will last for a couple days." ,2000)
            elseif v.health < 2000 then
                TriggerClientEvent('UndergroundFurnace:Notify', "Furnace", "This furnace will last less than a day."..math.floor(minutes).." minutes" ,2000)
            else
                TriggerClientEvent('UndergroundFurnace:Notify', "Furnace", "This furnace could get some repairs."..math.floor(seconds).." seconds" ,2000)
            end
            -- check how many seconds are left if bigger than 60 show minutes
            -- same for minutes and hours
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:Collect")
AddEventHandler("UndergroundFurnace:Collect", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            -- disassemble if owner? or wtf is this idk
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:Repair")
AddEventHandler("UndergroundFurnace:Repair", function(coords, alldata)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(alldata) do
                local amount = getItems(source, b.item)
                if amount.amount < b.amount then
                    print("not enough items")
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, amount.amount)
                    return
                else
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, (amount.amount - b.amount))
                    for c, d in pairs(Config.Furnace.healthitems) do
                        if b.item == d.itemname then
                            v.health = v.health + (b.amount * d.health)
                        print("deposit: " .. d.itemname .. " " .. amount.amount)
                        SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                        end
                    end
                end
            end
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:Destroy")
AddEventHandler("UndergroundFurnace:Destroy", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            -- redmove prop if owner or if user job or if user group
            -- add webhook?
        end
    end
end)

-------------------------------------------------------------------------------------------
------------------------------------- Timers ----------------------------------------------
-------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Wait(10000)
        for k, v in pairs(Props) do
            if v.lastupdated + Config.Furnace.consumptiontimer < os.time() then
                local newvalue = v.health - Config.Furnace.consumptionamount
                if newvalue <= 0 then
                    print("destroy")
                    v.health = 0
                else
                    v.health = newvalue
                    v.lastupdated = os.time()
                    print("health update: " .. v.health .. " " .. v.lastupdated)
                end
                SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
            end
        end
    end
end)


--[[RegisterCommand("testfuel", function(source, args, rawCommand)
    if Cooking then
        CookingBool(false)
    else
        CookingBool(true)
    end
end)
]]
function CookingBool(bool)
    if bool then
        Cooking = true
    else
        Cooking = false
    end
end

RegisterServerEvent("UndergroundFurnace:ActiveCooking")
AddEventHandler("UndergroundFurnace:ActiveCooking", function(coords, result)
    CookingBool(true)
end)

Citizen.CreateThread(function()
    while true do
        Wait(6000)
        local aftercook = false
        while Cooking do
            Wait(10)
            if Props.inputeditems ~= nil then
                for k, v in pairs(Props.inputeditems) do
                    v.time = os.time()
                end
            end
            for k, v in pairs(Props) do
                if v.fuelremaining <= 0 then
                    -- Cooking = false
                    -- print("cococ")
                    -- return
                else
                    if (v.lastfuelupdated + Config.Fuel.consumptiontimer) < os.time() then
                        local newvalue = v.fuelremaining - Config.Fuel.inputamount
                        if newvalue <= 0 then
                            v.fuelremaining = 0
                        else
                            local debris = v.fueldebris + Config.Fuel.outputamount
                            v.fuelremaining = newvalue
                            v.fueldebris = debris
                            v.lastfuelupdated = os.time()
                            print("Fuel update: " .. v.fuelremaining .. " " .. v.lastfuelupdated)
                        end
                        if v.inputeditems ~= nil then
                            for a, b in pairs(v.inputeditems) do
                                print("ola2")
                                for c, d in pairs(Config.Items) do
                                    print("ola3", d.itemname, b.item)
                                    if d.itemname == b.item then
                                        print("ola4")
                                        if d.temp + d.tempfail >= v.temperature and d.temp - d.tempfail <= v.temperature then
                                            if (b.time + (d.timetoprocess * b.amount)) < os.time() then
                                                local newready = {b.item, b.amount}
                                                table.insert(v.readytocollect, newready)
                                                table.remove(v.inputeditems, a)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                    end
                end
            end
            aftercook = true
        end
        if aftercook and Props.inputeditems ~= nil then
            for k, v in pairs(Props.inputeditems) do
                v.time = 0
            end
        end
    end
end)

-- This event is used to take items from players.
RegisterServerEvent('UndergroundFurnace:GiveAnyItem')
AddEventHandler('UndergroundFurnace:GiveAnyItem', function(src, item, count)
    print(src, item, count)
    -- VorpInv.addItem(src, item, count)
end)

function jobCheck(src)
    local bool = false
    local charJob = "unemployed" -- VorpCore.getUser(_source).getUsedCharacter
    for _, job in pairs(Config.Jobs) do
        if charJob == job.job then
            bool = true
        end
    end
    return bool
end
-- You can change this event to your own way to get the job of the player.
RegisterServerEvent('UndergroundFurnace:CheckJobAndDestroyProp')
AddEventHandler("UndergroundFurnace:CheckJobAndDestroyProp", function(coords)
    local coords = coords
    local _source = source
    -- The next two lines are the ones that need to change in order to get the job of the player.
    -- This one gets the character of the player
    -- local Character = VorpCore.getUser(_source).getUsedCharacter
    -- This one gets the job of the character
    -- local charJob = Character.job
    -- for _, job in ipairs(Config.Jobs) do
    -- if charJob == job then
    -- This fucntion is used to destroy the destillary if the job is the same as one of the config.
    keepGoingDestroy(_source, coords)
    --  break
    -- end
    -- end
end)

RegisterServerEvent("UndergroundFurnace:StartFire")
AddEventHandler("UndergroundFurnace:StartFire", function(coords, result)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            v.temperature = result.realtemp
        end
    end
    TriggerClientEvent("UndergroundFurnace:ConfirmFire", -1, coords)
end)

RegisterServerEvent("UndergroundFurnace:StopFire")
AddEventHandler("UndergroundFurnace:StopFire", function(coords)
    local propid = getPropId(coords)
    CookingBool(false)
    for k, v in pairs(Props) do
        if v.propid == propid then
            v.temperature = 0
        end
    end
    TriggerClientEvent("UndergroundFurnace:ConfirmStopFire", -1, coords)
end)