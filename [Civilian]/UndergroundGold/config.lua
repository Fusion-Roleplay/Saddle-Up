Config = {}

-- Theese are the Label for the keys that the player can press to interact
Config.PromptDeployLabel = "Deploy Table"
Config.PromptDeplayCancel = 'Cancel'
Config.PromptDeplaySet = 'Set'
Config.PromptDeplayRotL = 'Rotate Left'
Config.PromptDeplayRotR = 'Rotate Right'
Config.groups = {{
    name = "Panning Table",
    actions = { -- don't change the second value!
    {"Use", "p1"}, {"Inspect", "p2"}, {"Repair", "p3"}},
    id = 1
}, {
    name = "Use",
    actions = { -- don't change the second value!
    {"Refill", "f1"}, {"Collect", "f2"}, {"Start", "f3"}},
    id = 2
}}

-- Theese are the keys that the player can press to interact
Config.controlsorder = {0x05CA7C52, 0x6319DB71, 0xA65EBAB4, 0xDEB34313}

-- right now it's like 83.3 hours for the object to break if not repaired
-- 600 seconds of consumptiontimer means 5 minutes.
-- 10 of consumptionamount means that max health will be empty in 1000 actions (maxhealth/consumptionamount)
-- 1000 actions X 5 minutes = 5000 minutes for the object to break
-- in hours it's 5000/60 = 83.3 hours
Config.Gold = {
    bucketitemname = "GoldBucket_item",
    pantitemname = "GoldPan_item",
    object = "p_goldcradlestand01x",
    itemname = "GoldStand_item",
    consumptiontimer = 6,
    consumptionamount = 1,
    bucketvalue = 200,
    waterconsume = 40,
    processtime = 5,
    waterdebisitemname = "salt",
    waterdebisitemlabel = "Salt",
    waterdebisitemamount = 1,
    -- You can define the max water level using bucket value.
    maxwater = 1000, -- Don't change this value! It will fuck level! 
    maxhealth = 10000,
    healthitems = {{
        itemname = "wood_item",
        itemlabel = "Wood",
        health = 100
    }, {
        itemname = "iron_item",
        itemlabel = "Iron",
        health = 200
    }}
}

Config.Items = {{
    itemlabel = "Diamond",
    itemname = "diamond",
    chance = 10,
    minoutput = 1,
    maxoutput = 2
}, {
    itemlabel = "Gold Nugget",
    itemname = "gold_nugget",
    chance = 50,
    minoutput = 1,
    maxoutput = 3
}, {
    itemlabel = "Gold Flake",
    itemname = "goldflake_item",
    chance = 70,
    minoutput = 1,
    maxoutput = 6
}}

-- Blacklisted locations for builiding a Gold, and the radious around it.
Config.BlacklistedLocations = {{
    x = -268.53,
    y = 785.28,
    z = 118.49,
    radious = 20
}, {
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
-- this number defines if you get the reward
Config.number = 1
Config.chance = {
    min = 1,
    max = 1
}

Config.panitems = {{
    name = "hwood",
    label = "Gold Nugget",
    amount = {
        min = 1,
        max = 3
    },
    chance = {
        min = 1,
        max = 1
    },
    number = 1
}, {
    name = "hwood",
    label = "Gold Flake",
    amount = {
        min = 1,
        max = 6
    },
    chance = {
        min = 1,
        max = 1
    },
    number = 1

}, {
    name = "diamond_item",
    label = "Diamond",
    amount = {
        min = 1,
        max = 2
    },
    chance = {
        min = 0,
        max = 20
    },
    number = 10
}}

Config.WaterTypes = {
    [1] = {
        ["name"] = "Sea of Coronado",
        ["waterhash"] = -247856387,
        ["watertype"] = "lake"
    },
    [2] = {
        ["name"] = "San Luis River",
        ["waterhash"] = -1504425495,
        ["watertype"] = "river"
    },
    [3] = {
        ["name"] = "Lake Don Julio",
        ["waterhash"] = -1369817450,
        ["watertype"] = "lake"
    },
    [4] = {
        ["name"] = "Flat Iron Lake",
        ["waterhash"] = -1356490953,
        ["watertype"] = "lake"
    },
    [5] = {
        ["name"] = "Upper Montana River",
        ["waterhash"] = -1781130443,
        ["watertype"] = "river"
    },
    [6] = {
        ["name"] = "Owanjila",
        ["waterhash"] = -1300497193,
        ["watertype"] = "river"
    },
    [7] = {
        ["name"] = "HawkEye Creek",
        ["waterhash"] = -1276586360,
        ["watertype"] = "river"
    },
    [8] = {
        ["name"] = "Little Creek River",
        ["waterhash"] = -1410384421,
        ["watertype"] = "river"
    },
    [9] = {
        ["name"] = "Dakota River",
        ["waterhash"] = 370072007,
        ["watertype"] = "river"
    },
    [10] = {
        ["name"] = "Beartooth Beck",
        ["waterhash"] = 650214731,
        ["watertype"] = "river"
    },
    [11] = {
        ["name"] = "Lake Isabella",
        ["waterhash"] = 592454541,
        ["watertype"] = "lake"
    },
    [12] = {
        ["name"] = "Cattail Pond",
        ["waterhash"] = -804804953,
        ["watertype"] = "lake"
    },
    [13] = {
        ["name"] = "Deadboot Creek",
        ["waterhash"] = 1245451421,
        ["watertype"] = "river"
    },
    [14] = {
        ["name"] = "Spider Gorge",
        ["waterhash"] = -218679770,
        ["watertype"] = "river"
    },
    [15] = {
        ["name"] = "O'Creagh's Run",
        ["waterhash"] = -1817904483,
        ["watertype"] = "lake"
    },
    [16] = {
        ["name"] = "Moonstone Pond",
        ["waterhash"] = -811730579,
        ["watertype"] = "lake"
    },
    [17] = {
        ["name"] = "Roanoke Valley",
        ["waterhash"] = -1229593481,
        ["watertype"] = "river"
    },
    [18] = {
        ["name"] = "Elysian Pool",
        ["waterhash"] = -105598602,
        ["watertype"] = "lake"
    },
    [19] = {
        ["name"] = "Heartland Overflow",
        ["waterhash"] = 1755369577,
        ["watertype"] = "swamp"
    },
    [20] = {
        ["name"] = "Lagras",
        ["waterhash"] = -557290573,
        ["watertype"] = "swamp"
    },
    [21] = {
        ["name"] = "Lannahechee River",
        ["waterhash"] = -2040708515,
        ["watertype"] = "river"
    },
    [22] = {
        ["name"] = "Dakota River",
        ["waterhash"] = 370072007,
        ["watertype"] = "river"
    },
    [23] = {
        ["name"] = "Random1",
        ["waterhash"] = 231313522,
        ["watertype"] = "river"
    },
    [24] = {
        ["name"] = "Random2",
        ["waterhash"] = 2005774838,
        ["watertype"] = "river"
    },
    [25] = {
        ["name"] = "Random3",
        ["waterhash"] = -1287619521,
        ["watertype"] = "river"
    },
    [26] = {
        ["name"] = "Random4",
        ["waterhash"] = -1308233316,
        ["watertype"] = "river"
    },
    [27] = {
        ["name"] = "Random5",
        ["waterhash"] = -196675805,
        ["watertype"] = "river"
    }
}
