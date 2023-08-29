VorpCore = {}
local VorpInv

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

-- Register Usable Items, for other frames you should have something similar.
-- You only need to trigger one event in order to the player use each item.
VorpInv.RegisterUsableItem(Config.Furnace.itemname, function(data)
    local source = data.source
    VorpInv.subItem(source, Config.Furnace.itemname, 1)
    -- This is the event that will place the destillary
    TriggerClientEvent("UndergroundFurnace:PlaceProp", source, Config.Furnace.object)
end)
local Props = {}
local Cooking = false

function loadProps()
    prop = LoadResourceFile(GetCurrentResourceName(), "Props.json") or ""
    if prop ~= "" then
        Props = json.decode(prop)
    else
        Props = {}
    end
end

CreateThread(function()
    Wait(1000)
    loadProps()
    Wait(1000)
    TriggerClientEvent('UndergroundFurnace:GetProps', -1, Props)
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
        temperature = 0,
        state = false
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
    local _source = src
    local ItemCount = VorpInv.getItemCount(_source, item)
    return ItemCount
end

-- Take items from player
function getItems(src, item)
    --print(src, item)
    -- local data = {}
    -- check item amount
    local amount = SendItemCount(src, item)
    --print(amount, "QUAL GAY")
    -- add amount to the table
    local ndata = {
        item = item,
        amount = amount
    }
    VorpInv.subItem(src, item, amount)
    -- table.insert(data, ndata)
    -- take stuff
    return ndata
end

-- Get the prop id
function getPropId(coords)
    for k, v in pairs(Props) do
        local ncoords = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        }
        local distancex = (ncoords.x - v.coords.x)
        local distancey = (ncoords.y - v.coords.y)
        local dist = math.sqrt(distancex * distancex + distancey * distancey)
        if dist <= 1 then
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
        if v.propid == propid then
            v.fuelremaining = v.fuelremaining + amount.amount
            -- save to file
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
            TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                Config.Added .. amount.amount .. " " .. Config.Fuel.itemlabel, 2000)
        end
    end
end)

-- Add minerals to the furnace
RegisterServerEvent('UndergroundFurnace:AddMineralsv2')
AddEventHandler("UndergroundFurnace:AddMineralsv2", function(coords, alldata)
    if CheckState(coords, 0) then
        return
    end
    local propid = getPropId(coords)
    local newbatch = {}
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(alldata) do
                local amount = getItems(source, b.item)
                if amount.amount < b.amount then
                    TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.NotEnough, 2000)
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, amount.amount)
                    return
                else
                    for z, w in pairs(Config.Items) do
                        if b.item == w.itemname then
                            TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName,
                            Config.Added .. b.amount .. " " .. w.itemlabel, 2000)
                            TriggerEvent('UndergroundFurnace:GiveAnyItem', source, w.outputitemname, (amount.amount - b.amount))
                        end
                    end
                    newbatch = {}
                    newbatch = {
                        item = b.item,
                        amount = b.amount,
                        time = 0
                    }
                    table.insert(v.inputeditems, newbatch)
                    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                end
            end
        end
    end
end)

-- Collect the remaining fuel from the furnace
RegisterServerEvent('UndergroundFurnace:CollectFuel')
AddEventHandler("UndergroundFurnace:CollectFuel", function(coords)
    if CheckState(coords, 0) then
        TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.TurnOffFirst, 2000)
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            -- This need to give wood and coal
            -- local woodamount = v.fuelremaining
            -- v.fuelremaining = 0
            local coalamount = v.fueldebris
            v.fueldebris = 0
            -- local wooditem = Config.Fuel.itemname
            local coalitem = Config.Fuel.outputitemname
            --[[ local data = {{
                item = wooditem,
                amount = woodamount
            }, {
                item = coalitem,
                amount = coalamount
            }}
            for a, b in pairs(data) do]]
            TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                Config.YouGot .. coalamount .. " " .. Config.Fuel.outputitemlabel, 2000)
            TriggerEvent('UndergroundFurnace:GiveAnyItem', source, coalitem, coalamount)
            -- end
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

-- Collect the cooked items from the furnace
RegisterServerEvent('UndergroundFurnace:CollectMinerals')
AddEventHandler("UndergroundFurnace:CollectMinerals", function(coords)
    --print("Collecting")
    if CheckState(coords, 0) then
        --print("Furnace is on")
        TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.TurnOffFirst, 2000)
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        --print("Propid: " .. v.propid, "Propid2: " .. propid)
        if v.propid == propid then
            if v.readytocollect == nil then
                --print(1)
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.Nothing, 2000)
                return
            end
            for y, z in pairs(Config.Items) do
                for a, b in pairs(v.readytocollect) do
                
                --print(2)
                    --print(b.item, z.itemname, " wewaea")
                    if b.item == z.itemname then
                        --print(b.item, z.outputitemname, " hello")
                        TriggerEvent('UndergroundFurnace:GiveAnyItem', source, z.outputitemname, b.amount)
                        TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                            Config.YouGot .. b.amount .. " " .. z.outputitemlabel, 2000)
                        table.remove(v.readytocollect, a)
                    end
                end
                
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
            --print("inspect: " .. v.health)
            if v.health > 8000 then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                    Config.Good, 2000)
            elseif v.health < 2000 then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                    Config.Mid .. math.floor(minutes) .. " minutes", 2000)
            else
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                    Config.Low .. math.floor(seconds) .. " seconds", 2000)
            end
            -- check how many seconds are left if bigger than 60 show minutes
            -- same for minutes and hours
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:Repair")
AddEventHandler("UndergroundFurnace:Repair", function(coords, alldata)
    local propid = getPropId(coords)
    local count = false
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(alldata) do
                local amount = getItems(source, b.item)
                if amount.amount < b.amount then
                    for y, w in pairs(Config.Furnace.healthitems) do
                        if b.item == w.itemname then
                            TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                                "You dont have enough " .. w.itemlabel, 2000)
                            TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, amount.amount)
                            return
                        end
                    end
                else
                    TriggerEvent('UndergroundFurnace:GiveAnyItem', source, b.item, (amount.amount - b.amount))
                    for c, d in pairs(Config.Furnace.healthitems) do
                        if b.item == d.itemname then
                            count = true
                            TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName,
                                "Added " .. d.itemlabel .. " " .. b.amount, 1000)

                            v.health = v.health + (b.amount * d.health)
                            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                        end
                    end
                end
                if count then
                    TriggerClientEvent("UndergroundFurnace:ConfirmRepair", source)
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
    while Config.Degradation do
        Wait(10000)
        for k, v in pairs(Props) do
            if v.lastupdated + Config.Furnace.consumptiontimer < os.time() then
                local newvalue = v.health - Config.Furnace.consumptionamount
                if newvalue <= 0 then
                    -- --print("destroy")
                    v.health = 0
                else
                    v.health = newvalue
                    v.lastupdated = os.time()
                    -- --print("health update: " .. v.health .. " " .. v.lastupdated)
                end
                SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
            end
        end
    end
end)

function CheckState(coords, id)
    if id == 0 then
        for k, v in pairs(Props) do
            if v.id == id then
                return v.state
            end
        end
    end
end

function CookingBool(bool, id)
    --print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW")
    for k, v in pairs(Props) do
        --print("2222WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW")
        if v.propid == id then
            --print(3)
            --print(v.state)
            --print("Sou o qual", bool)
            v.state = bool
            --print(v.state)
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end
RegisterServerEvent("Teste")
AddEventHandler("Teste", function(coords)
    local id = getPropId(coords)
    for k, v in pairs(Props) do
        --print(1)
        --print(v.propid, id)
        if v.propid == id then
            if v.fuelremaining <= 5 then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.NoWood, 2000)
                TriggerClientEvent('CancelTeste', source)
                return
            end
        end
    end

    for z, w in pairs(Props) do
        --print(2)
        --print(w.propid, id)
        if w.propid == id then
            if w.state then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.AlreadyCooking, 2000)
                TriggerClientEvent('CancelTeste', source)
                return
            end
        end
    end
    --print("coco")
    TriggerClientEvent("UndergroundFurnace:ConfirmStartCo", source, coords)
end)

RegisterServerEvent("UndergroundFurnace:ActiveCooking")
AddEventHandler("UndergroundFurnace:ActiveCooking", function(coords, result)
    local id = getPropId(coords)
    for k, v in pairs(Props) do
        --print(v.propid, id)
        if v.propid == id then
            if v.state then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName ,
                    Config.AlreadyCooking, 2000)
                TriggerClientEvent('CancelTeste', source)
                return
            end
        end
    end
    CookingBool(true, id)
end)

Citizen.CreateThread(function()
    while true do
        Wait(6000)
        -- local aftercook = false
        -- while CheckState() do
        -- Wait(10)
        --[[if Props.inputeditems ~= nil then
                for k, v in pairs(Props.inputeditems) do
                    v.time = os.time()
                end
            end]]
        for k, v in pairs(Props) do
            --print(v.state)
            if v.state then
                if v.fuelremaining <= 0 then
                    CookingBool(false, v.propid)
                    TriggerClientEvent("UndergroundFurnace:ConfirmStopFire", -1, v.propid)
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
                        end
                        if v.inputeditems ~= nil then
                            for a, b in pairs(v.inputeditems) do
                                for c, d in pairs(Config.Items) do
                                    if d.itemname == b.item then
                                        --print("yes")
                                        if d.temp + d.tempfail >= v.temperature and d.temp - d.tempfail <= v.temperature then
                                            --print("no")
                                            if (b.time + (d.timetoprocess * b.amount)) < os.time() then
                                                local ok = false
                                                --print("ok")
                                                local newready = {
                                                    item = b.item,
                                                    amount = b.amount
                                                }
                                                print(9)
                                                for t, u in pairs(v.readytocollect) do
                                                    print(10)
                                                    if u.item == newready.item then
                                                        print(11)
                                                        u.amount = u.amount + newready.amount
                                                        ok = true
                                                    end
                                                end
                                                if not ok then
                                                    print(12)
                                                    table.insert(v.readytocollect, newready)
                                                end
                                                print(13)
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
        end
        --[[       aftercook = true
       -- end
        if aftercook and Props.inputeditems ~= nil then
            for k, v in pairs(Props.inputeditems) do
                v.time = 0
            end
        end]]
    end
end)

-- This event is used to take items from players.
RegisterServerEvent('UndergroundFurnace:GiveAnyItem')
AddEventHandler('UndergroundFurnace:GiveAnyItem', function(src, item, count)
    if src == 0 then
        src = source
    end
    --print("GiveAnyItem", src, item, count)
    VorpInv.addItem(src, item, count)
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
            if v.fuelremaining <= 0 then
                TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.NoWood,
                    2000)
                return
            else
                v.temperature = result.realtemp
                TriggerClientEvent("UndergroundFurnace:ConfirmFire", -1, coords, propid)
            end
        end
    end
end)

RegisterServerEvent("UndergroundFurnace:StopFire")
AddEventHandler("UndergroundFurnace:StopFire", function(coords)
    local propid = getPropId(coords)
    CookingBool(false, propid)
    for k, v in pairs(Props) do
        if v.propid == propid then
            v.temperature = 0
        end
    end
    TriggerClientEvent("UndergroundFurnace:ConfirmStopFire", -1, propid)
    TriggerClientEvent('UndergroundFurnace:Notify', source, Config.NotName , Config.NoFire, 2000)
end)
