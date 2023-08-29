Config = {}

-- Theese are the Label for the keys that the player can press to interact
Config.PromptDeployLabel = "Deploy Furnace"
Config.PromptDeplayCancel = 'Cancel'
Config.PromptDeplaySet = 'Set'
Config.PromptDeplayRotL = 'Rotate Left'
Config.PromptDeplayRotR = 'Rotate Right'
Config.groups = {{
    name = "Furance",
    actions = { -- don't change the second value!
    {"Fuel", "p1"}, {"Minerals", "p2"}, {"On/Off", "p3"}, {"Manage", "p4"}},
    id = 1
}, {
    name = "Fuel",
    actions = { -- don't change the second value!
    {"Add", "f1"}, {"Collect", "f2"}, {"Back", "f3"}},
    id = 2
}, {
    name = "Minerals",
    actions = { -- don't change the second value!
    {"Add", "m1"}, {"Collect", "m2"}, {"Back", "m3"}},
    id = 3
}, {
    name = "Fire",
    actions = { -- don't change the second value!
    {"Start", "s1"}, {"Stop", "s2"}, {"Back", "s3"}},
    id = 3
}, {
    name = "Manage",
    actions = { -- don't change the second value!
    {"Inspect", "e1"}, {"Reapair", "e2"}, {"Back", "e3"}},
    id = 3
}}

-- Theese are the keys that the player can press to interact
Config.controlsorder = {0x05CA7C52, 0x6319DB71, 0xA65EBAB4, 0xDEB34313}

-- How long it will take for the minigame to end
-- 3000 = 1 minute aproximatly
-- it changes based on player's fps
-- i have 12 fps and it takes a loooot of time
Config.MinigameTimer = 300

-- right now it's like 83.3 hours for the object to break if not repaired
-- 600 seconds of consumptiontimer means 5 minutes.
-- 10 of consumptionamount means that max health will be empty in 1000 actions (maxhealth/consumptionamount)
-- 1000 actions X 5 minutes = 5000 minutes for the object to break
-- in hours it's 5000/60 = 83.3 hours
Config.Furnace = {
    object = "p_forge01x",
    itemname = "furnace_item",
    consumptiontimer = 6,
    consumptionamount = 1,
    maxhealth = 10000,
    healthitems = {{
        itemname = "stone_item",
        itemlabel = "Stone",
        health = 100
    }, {
        itemname = "iron_item",
        itemlabel = "Iron",
        health = 200
    }}
}

Config.Fuel = {
    itemname = "wood_item",
    itemlabel = "Coal",
    outputitemname = "coal_item",
    outputitemlabel = "Coal",
    inputamount = 1,
    outputamount = 1,
    consumptiontimer = 6
}

Config.Items = {{
    name = "Copper",
    fuelrequired = 1,
    itemname = "copper_item",
    itemlabel = "Copper",
    temp = 850,
    tempfail = 50,
    outputitemname = "copperbar_item",
    outputitemlabel = "Copper Bar",
    inputamount = 5,
    outputamount = 2,
    inputreward = 1,
    timetoprocess = 8
}, {
    name = "Metal",
    fuelrequired = 1,
    itemname = "metal_item",
    itemlabel = "Metal",
    temp = 850,
    tempfail = 50,
    outputitemname = "metalbar_item",
    outputitemlabel = "Metal Bar",
    inputamount = 5,
    outputamount = 2,
    inputreward = 1,
    timetoprocess = 4
}, {
    name = "Silver",
    fuelrequired = 1,
    itemname = "silver_item",
    itemlabel = "Silver",
    temp = 850,
    tempfail = 50,
    outputitemname = "silverbar_item",
    outputitemlabel = "Silver Bar",
    inputamount = 5,
    outputamount = 2,
    inputreward = 1,
    timetoprocess = 2
}, {
    name = "Gold",
    fuelrequired = 1,
    itemname = "gold_item",
    itemlabel = "Gold",
    temp = 850,
    tempfail = 50,
    outputitemname = "goldbar_item",
    outputitemlabel = "Gold Bar",
    inputamount = 5,
    outputamount = 2,
    inputreward = 1,
    timetoprocess = 1
}}

-- Blacklisted locations for builiding a furnace, and the radious around it.
Config.BlacklistedLocations = {{
    x = -268.53,
    y = 785.28,
    z = 118.49,
    radious = 20
},
{
    x = 1.3,
    y = 2.2,
    z = 3.1,
    radious = 10
}}

-- Config the temperature of envoirnment for building a destillary.
-- Max temp:
Config.TempBuildMax = 100
-- Min temp:
Config.TempBuildMin = 0
