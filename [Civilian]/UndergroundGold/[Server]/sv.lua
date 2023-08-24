VorpCore = {}
local VorpInv

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

-- Register Usable Items, for other frames you should have something similar.
-- You only need to trigger one event in order to the player use each item.
VorpInv.RegisterUsableItem(Config.Gold.itemname, function(data)
    local source = data.source
    VorpInv.subItem(source, Config.Gold.itemname, 1)
    -- This is the event that will place the destillary
    TriggerClientEvent("UndergroundGold:PlaceProp", source, Config.Gold.object)
end)

VorpInv.RegisterUsableItem(Config.Gold.bucketitemname, function(data)
    local source = data.source
    VorpInv.subItem(source, Config.Gold.bucketitemname, 1)
    -- This is the event that will place the destillary
    TriggerClientEvent("UndergroundGold:GetWater", source)
end)

VorpInv.RegisterUsableItem(Config.Gold.pantitemname, function(data)
    local source = data.source
    VorpInv.subItem(source, Config.Gold.pantitemname, 1)
    -- This is the event that will place the destillary
    TriggerClientEvent('UndergroundGold:StartPanning', source)
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
    TriggerClientEvent('UndergroundGold:GetProps', -1, Props)
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

RegisterServerEvent("UndergroundGold:SaveProp")
AddEventHandler("UndergroundGold:SaveProp", function(prophash, x, y, z, heading)
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
        waterremaining = 0,
        waterdebris = 0,
        lastupdate = 0,
        waterlastupdate = 0,
        readytocollect = {},
        health = Config.Gold.maxhealth,
        speed = 0,
        state = false
    }
    table.insert(Props, newprop)
    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
    TriggerClientEvent('UndergroundGold:GetProps', -1, Props)
end)

RegisterServerEvent("UndergroundGold:PropRequest")
AddEventHandler("UndergroundGold:PropRequest", function()
    local _source = source
    TriggerClientEvent('UndergroundGold:GetProps', -1, Props)
end)

RegisterServerEvent("UndergroundGold:DeleteProp")
AddEventHandler("UndergroundGold:DeleteProp", function(id)
    local _source = source
    Props[id] = nil
    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
    TriggerClientEvent('UndergroundGold:GetProps', -1, Props)
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
    local amount = SendItemCount(src, item)
    local ndata = {
        item = item,
        amount = amount
    }
    VorpInv.subItem(src, item, amount)
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

-- Collect the remaining water from the Gold
RegisterServerEvent('UndergroundGold:CollectWater')
AddEventHandler("UndergroundGold:CollectWater", function(coords)
    if CheckState(coords, 0) then
        TriggerClientEvent('UndergroundGold:Notify', source, "Gold", "Turn off the table first", 2000)
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            local coalamount = v.waterdebris
            v.waterdebris = 0
            local coalitem = Config.Gold.waterdebisitemname
            if coalamount > 0 then
                TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                    "You got " .. coalamount .. " " .. coalitem, 2000)
            end
            TriggerEvent('UndergroundGold:GiveAnyItem', source, Config.Gold.waterdebisitemlabel, coalamount)
            for a, b in pairs(v.readytocollect) do
                if a == 0 then
                    TriggerClientEvent('UndergroundGold:Notify', source, "Gold", "Nothing to collect", 2000)
                    return
                end
                TriggerEvent('UndergroundGold:GiveAnyItem', source, b.item, b.amount)
                for y, z in pairs(Config.Items) do
                    if b.item == z.itemname then
                        TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                            "You got " .. b.amount .. " " .. z.itemlabel, 2000)
                    end
                end
                table.remove(v.readytocollect, a)
            end
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

-- Collect the cooked items from the Gold
RegisterServerEvent('UndergroundGold:CollectMinerals')
AddEventHandler("UndergroundGold:CollectMinerals", function(coords)
    if CheckState(coords, 0) then
        TriggerClientEvent('UndergroundGold:Notify', source, "Gold", "Turn off the Gold first", 2000)
        return
    end
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(v.readytocollect) do
                if a == 0 then
                    TriggerClientEvent('UndergroundGold:Notify', source, "Gold", "Nothing to collect", 2000)
                    return
                end
                TriggerEvent('UndergroundGold:GiveAnyItem', source, b.item, b.amount)
                for y, z in pairs(Config.Items) do
                    if b.item == z.itemname then
                        TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                            "You got " .. b.amount .. " " .. z.outputitemlabel, 2000)
                    end
                end
                table.remove(v.readytocollect, a)
            end
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
end)

RegisterServerEvent("UndergroundGold:Inspect")
AddEventHandler("UndergroundGold:Inspect", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            if v.health > 8000 then
                TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                    "This Gold is in excelent condition and will last for a couple days.", 2000)
            elseif v.health < 2000 then
                TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                    "This Gold will last less than a day." .. math.floor(minutes) .. " minutes", 2000)
            else
                TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                    "This Gold could get some repairs." .. math.floor(seconds) .. " seconds", 2000)
            end
        end
    end
end)

RegisterServerEvent("UndergroundGold:Repair")
AddEventHandler("UndergroundGold:Repair", function(coords, alldata)
    local propid = getPropId(coords)
    local count = false
    for k, v in pairs(Props) do
        if v.propid == propid then
            for a, b in pairs(alldata) do
                local amount = getItems(source, b.item)
                if amount.amount < b.amount then
                    for y, w in pairs(Config.Gold.healthitems) do
                        if b.item == w.itemname then
                            TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                                "You dont have enough " .. w.itemlabel, 2000)
                            TriggerEvent('UndergroundGold:GiveAnyItem', source, b.item, amount.amount)
                            return
                        end
                    end
                else
                    TriggerEvent('UndergroundGold:GiveAnyItem', source, b.item, (amount.amount - b.amount))
                    for c, d in pairs(Config.Gold.healthitems) do
                        if b.item == d.itemname then
                            count = true
                            TriggerClientEvent('UndergroundGold:Notify', source, "Gold",
                                "Added " .. d.itemlabel .. " " .. b.amount, 1000)

                            v.health = v.health + (b.amount * d.health)
                            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                        end
                    end
                end
                if count then
                    TriggerClientEvent("UndergroundGold:animmartelo", source)
                    TriggerClientEvent("UndergroundGold:ConfirmRepair", source)
                end
            end
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
            if v.lastupdate + Config.Gold.consumptiontimer < os.time() then
                local newvalue = v.health - Config.Gold.consumptionamount
                if newvalue <= 0 then
                    v.health = 0
                else
                    v.health = newvalue
                    v.lastupdate = os.time()
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

Citizen.CreateThread(function()
    while true do
        Wait(6000)
        for k, v in pairs(Props) do
            local check = false
            if v.state then
                if v.waterremaining <= 0 then
                    v.state = false
                    TriggerClientEvent("UndergroundFurnace:StopWaterOnTable", -1, v.propid)
                    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                else
                    if v.waterlastupdate == 0 then
                        v.waterlastupdate = os.time()
                    end
                    if (v.waterlastupdate + Config.Gold.processtime) < os.time() then
                        local waterdata = {
                            id = v.propid,
                            level = v.waterremaining
                        }
                        print(v.waterremaining)
                        TriggerClientEvent('UndergroundGold:LevelWater', -1, waterdata)
                        local newvalue = v.waterremaining - Config.Gold.waterconsume
                        if newvalue <= 0 then
                            v.waterremaining = 0
                        else
                            local debris = v.waterdebris + Config.Gold.waterdebisitemamount
                            v.waterremaining = newvalue
                            v.waterdebris = debris
                            v.waterlastupdate = os.time()
                            print("TETSAA")
                            local newready = GenerateReward()
                            for y, z in pairs(newready) do
                                print(z.item)
                                -- for x, c in pairs(v.readytocollect) do
                                -- print(c.item)
                                -- if c.item == z.item then
                                -- c.amount = c.amount + z.amount
                                -- else
                                local ndata = {
                                    item = z.item,
                                    amount = z.amount
                                }
                                for x, d in pairs(v.readytocollect) do
                                    if d.item == ndata.item then
                                        d.amount = d.amount + ndata.amount
                                        check = true
                                    end
                                end
                                if not check then
                                table.insert(v.readytocollect, ndata)
                                check = false
                                -- end
                                -- end
                                end
                            end
                        end
                        SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                    end
                end
            end
        end
    end
end)

function GenerateReward()
    local reward = {}
    for k, v in pairs(Config.Items) do
        local chance = math.random(1, 100)
        --print("CHANCE", chance, v.chance)
        if chance <= v.chance then
            local rewardz = {
                item = v.itemname,
                amount = math.random(v.minoutput, v.maxoutput)
            }
            --print(rewardz.item, rewardz.amount)
            table.insert(reward, rewardz)
        end
    end
    return reward
end

RegisterServerEvent('UndergroundGold:GiveAnyItem')
AddEventHandler('UndergroundGold:GiveAnyItem', function(src, item, count)
    if src == 0 then
        src = source
    end
    VorpInv.addItem(src, item, count)
end)

RegisterServerEvent("UndergroundGold:StartProcess")
AddEventHandler("UndergroundGold:StartProcess", function(coords, result)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            if v.waterremaining <= 0 then
                TriggerClientEvent('UndergroundGold:Notify', source, "Table", "There is no water in the table.", 2000)
                return
            else
                v.state = true
                TriggerClientEvent("UndergroundFurnace:WaterOnTable1", -1, v.coords, v.propid)
                TriggerClientEvent("UndergroundFurnace:WaterOnTable2", -1, v.coords, v.propid)
                SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
                TriggerClientEvent("UndergroundGold:ConfirmStartProcess", -1, coords, propid)
            end
        end
    end
end)

RegisterServerEvent("UndergroundGold:StopProcess")
AddEventHandler("UndergroundGold:StopProcess", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            v.state = false
            TriggerClientEvent("UndergroundFurnace:StopWaterOnTable", -1, v.propid)
            SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
        end
    end
    TriggerClientEvent("UndergroundGold:ConfirmStopProcess", -1, propid)
    TriggerClientEvent('UndergroundGold:Notify', source, "Table", "Fire stopped.", 2000)
end)

RegisterServerEvent("UndergroundGold:Deposit")
AddEventHandler("UndergroundGold:Deposit", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            if v.waterremaining + Config.Gold.bucketvalue > Config.Gold.maxwater then
                TriggerClientEvent('UndergroundGold:Notify', source, "Table", "Bucket is full.", 2000)
                return
            end
            v.waterremaining = v.waterremaining + Config.Gold.bucketvalue
        end
    end

    SaveResourceFile(GetCurrentResourceName(), "Props.json", json.encode(Props), -1)
    TriggerClientEvent("UndergroundGold:ConfirmDeposit", source, propid)
end)

RegisterServerEvent("UndergroundGold:StartWaterLevel")
AddEventHandler("UndergroundGold:StartWaterLevel", function(coords)
    local propid = getPropId(coords)
    for k, v in pairs(Props) do
        if v.propid == propid then
            local waterdata = {
                id = v.propid,
                level = v.waterremaining
            }
            print(v.waterremaining)
            TriggerClientEvent('UndergroundGold:LevelWater', -1, waterdata)
        end
    end
end)