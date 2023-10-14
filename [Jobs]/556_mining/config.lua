Config = {}

Config.Pickaxe                      =               "pickaxe"
Config.BasicLoot                    =               {"rock"} -- for multiple baseloots use something like {"rock", "clay"} it will choose one randomly
Config.ShinyOreItem                 =               "shinyore"
Config.WhetstoneItem                =               "whetstone"
Config.PickaxeModel                 =               "p_pickaxe01x"
Config.WhetstoneModel               =               "p_sharpeningstone01x"
Config.WorkTime                     =               9 -- mining work time in seconds
Config.WorkTimeCutGem               =               15 -- cutting gem work time in seconds
Config.MiningRewardAmount           =               {1, 4} -- random choosing amount inbetween that value example: {1, 3}
Config.ShinyOreLuck                 =               2 -- percentage to get shiny ore from every mine
Config.Minigame                     =               {false, 5000, 7} -- speed and scale of syn minigame
Config.StaminaDepletion             =               {false, 15.0, 10} -- if enabled depletes 15 stamina every 10 seconds when working

--ENABLES/DISABLES  
Config.EnableMines                  =               true
Config.EnableStonecutting           =               true
Config.EnableBasicLoot              =               false
Config.EnableOpenTimes              =               true
Config.EnableMarkers                =               false
Config.MarkerDistance               =               15
Config.EnableProgressBars           =               true
Config.NeedsWhetstoneToCutStone     =               true
Config.NpcShops                     =               true
Config.customInjector               =               false -- turn true if you want to use a custom api when you get mining reward (injectors.lua)

--JOB STUFF
Config.NeedsJobToUseMine            =               false
Config.NeedsJobToOpenShop           =               false
Config.NeedsJobToWashShinyOre       =               false
Config.NeedsJobToCutStones          =               false
Config.MiningJob                    =               {"miningcompany"}
Config.StonecuttingJob              =               {"yourblacksmith"}

--PERMIT/LICENCE
Config.NeedsPermitToUseMine         =               false
Config.NeedsPermitToCutStones       =               false
Config.NeedsJobToShowPermit         =               false
Config.PermitItem                   =               "miningpermit"
Config.image                        =               "permit" -- dont change
Config.Distance                     =               3 -- distance to show permit to other player

--METADATA/DURABILITY
-- enable, durability text, max durability, loss each time, text if breaks, enable broken pickaxe item, broken pickaxe item
Config.Metadata                     =               {true, "Durability", 100, 1, "Your pickaxe broke!", true, "brokenpickaxe"}
-- time in seconds, +durability each time, use new status texts, metadata status texts, status values (e.g. sharp starts at 60 and up, dull at 20 and less, damaged is inbetween), repair item
Config.PickaxeSharpen               =               {22, 10, true, "Dull", "Damaged", "Sharp", 20, 60, "whetstone"}
Config.LessRewardIfNotSharp         =               true -- only gives half of the rewards if pickaxe isnt sharp. sharp = value above (more than 60)

Config.NeedsJobToSharpenPickaxe     =               false
Config.SharpenPickaxeJobs           =               {"blacksmith"}

--ORE WASHING LUCK AT WATERS
Config.WashOreLuck                  =               4 -- choose number between 1 and 10, lower number is less luck to get a gem out of the ore
Config.WashOreExtraLuck             =               10 -- choose number between 1 - 100, higher = more luck to get higher level gem
Config.WashOreInsaneLuck            =               2 -- choose number between 1 - 100, higher = more luck to get higher level gem

--OPEN TIMES
Config.MineOpen                     =               6 --am
Config.MineClose                    =               22 -- pm
Config.StonecuttingOpen             =               6 --am
Config.StonecuttingClose            =               22 -- pm

--WEBHOOK
Config.Logs                         =               true 
Config.Discord                      =               true  --if you use discord whitelist
Config.webhook                      =               ""
Config.name                         =               "💎 Mining & Stonecutting" 
Config.logo                         =               "https://via.placeholder.com/30x30" -- Header
Config.footerLogo                   =               "https://via.placeholder.com/30x30" -- Footer
Config.Avatar                       =               "https://via.placeholder.com/30x30" -- Avatar


--NPC SHOPS - item, label, money
Config.NpcTalk = true

Config.StoneShop = {
    Title                           =               "Shop",
    SubText                         =               "Buy and Sell",
    Options = {
        [1] = {
            Id                      =               "buygear",
            Title                   =               "Gear",
            SubText                 =               "items",
            Desc                    =               "Buy gear",
            Items = {               -- stuff the npc sells (name label cash)
                                                    { "pickaxe", "Pickaxe", 4 },
                                                    { "whetstone", "Whetstone", 1 },
            }                                   
        },
        [2] = {
            Id                      =               "sellcategory",
            Title                   =               "Sell gems",
            SubText                 =               "Gems",
            Desc                    =               "Sell gems",
            Categories = {
                ["b"]               =               "Basic",
                ["f"]               =               "Flawed",
                ["p"]               =               "Pristine",
            },
            Items = {
                ["b"] = {           -- stuff the npc buys (name label cash)
                                                    { "rock", "Rock", 0.1 },
                                                    { "goldnugget", "Gold Nugget", 0.5 },
                                                    { "copper", "Copper", 0.05 },
                                                    { "silverore", "Silver Ore", 0.10 },
                },
                ["f"] = {
                                                    { "frockcrystal", "Flawed Rock Crystal", 1 },
                                                    { "famber", "Flawed Amber", 1 },
                                                    { "fmoonstone", "Flawed Moonstone", 1 },
                                                    { "fcarnelian", "Flawed Carnelian", 2 },
                                                    { "fmalachite", "Flawed Malachite", 2 },
                                                    { "faquamarine", "Flawed Aquamarine", 3 },
                                                    { "fopal", "Flawed Opal", 4 },
                                                    { "ftopaz", "Flawed Topaz", 4 },
                                                    { "femerald", "Flawed Emerald", 6 },
                                                    { "fruby", "Flawed Ruby", 6 },
                                                    { "famethyst", "Flawed Amethyst", 8 },
                                                    { "fonyx", "Flawed Onyx", 8 },
                                                    { "fsapphire", "Flawed Sapphire", 10 },
                                                    { "fdiamond", "Flawed Diamond", 12 },
                },
                ["p"] = {
                                                    { "prockcrystal", "Pristine Rock Crystal", 2 },
                                                    { "pamber", "Pristine Amber", 2 },
                                                    { "pmoonstone", "Pristine Moonstone", 3 },
                                                    { "pcarnelian", "Pristine Carnelian", 5 },
                                                    { "pmalachite", "Pristine Malachite", 5 },
                                                    { "paquamarine", "Pristine Aquamarine", 6 },
                                                    { "popal", "Pristine Opal", 10 },
                                                    { "ptopaz", "Pristine Topaz", 12 },
                                                    { "pemerald", "Pristine Emerald", 14 },
                                                    { "pruby", "Pristine Ruby", 14 },
                                                    { "pamethyst", "Pristine Amethyst", 16 },
                                                    { "ponyx", "Pristine Onyx", 17 },
                                                    { "psapphire", "Pristine Sapphire", 18 },
                                                    { "pdiamond", "Pristine Diamond", 20 },
                },
            },
        }, 
    },
}

-- NPC Shops
Config.Nomads = {
    [1] = {
        model                       =               "MP_ASN_BENEDICTPOINT_FEMALES_01",
        locations                   =               { -- multiple locations = random choosing
                                                    {x = -1821.8302001953125,y = -1758.3232421875,z = 106.55302429199219, h= 75.00},
                                                    {x = -1866.732421875,y = -1719.48095703125,z = 109.26354217529297, h= -3.58},
                                                    {x = -1996.251708984375,y = -1619.0438232421875,z = 118.26082611083984, h= 105.71},
        },
        name                        =               "Vette",
        scene                       =               "WORLD_HUMAN_SMOKE",
        EnableBlip                  =               false,
        FreezePed                   =               false, -- ped gets freezed and wont attack if true
        BlipSprite                  =               1095891419,
    },
    [2] = {
        model                       =               "G_M_M_UniDuster_03",
        locations                   =               { -- multiple locations = random choosing
                                                    {x = 2461.728, y = 289.8640, z = 70.887, h= 86.58},
                                                    {x = -1332.05, y = 2396.82, z = 306.46, h= 240.68},
                                                    {x = -1320.50, y = 2435.22, z = 309.64, h= 336.28},
        },
        name                        =               "Lance",
        scene                       =               "WORLD_HUMAN_LEAN_BACK_WALL_DRINKING_MOONSHINE",
        EnableBlip                  =               false,
        FreezePed                   =               true, -- ped gets freezed and wont attack if true
        BlipSprite                  =               1095891419,
    },
}

Config.MinePoints = {
    ["Annesburg"] ={
                                                    {x = 2756.177, y = 1302.029, z = 70.007, h = 95.39, luck = 70, items = {"coal_ore"},},
                                                    {x = 2756.127, y = 1303.844, z = 70.008, h = 85.48, luck = 70, items = {"coal_ore"},},
                                                    {x = 2756.445, y = 1305.820, z = 69.998, h = 85.11, luck = 70, items = {"coal_ore"},},
                                                    {x = 2760.057, y = 1302.411, z = 70.013, h = 268.03, luck = 70, items = {"coal_ore"},},
                                                    {x = 2759.812, y = 1304.380, z = 70.002, h = 279.59, luck = 70, items = {"coal_ore"},},
                                                    {x = 2760.525, y = 1309.756, z = 70.018, h = 252.29, luck = 70, items = {"coal_ore"},},
                                                    {x = 2760.603, y = 1311.327, z = 70.024, h = 289.43, luck = 70, items = {"coal_ore"},},
                                                    {x = 2714.269, y = 1308.012, z = 69.817, h = 186.64, luck = 70, items = {"coal_ore"},},
                                                    {x = 2713.663, y = 1313.537, z = 69.787, h = 0.79, luck = 70, items = {"coal_ore"},},
                                                    {x = 2715.471, y = 1313.483, z = 69.775, h = 2.84, luck = 70, items = {"coal_ore"},},
                                                    {x = 2717.666, y = 1313.986, z = 69.786, h = 351.58, luck = 70, items = {"coal_ore"},},
                                                    {x = 2731.414, y = 1329.381, z = 69.667, h = 165.45, luck = 70, items = {"coal_ore"},},
                                                    {x = 2728.172, y = 1329.764, z = 69.665, h = 155.33, luck = 70, items = {"coal_ore"},},
                                                    {x = 2728.438, y = 1332.413, z = 69.690, h = 351.13, luck = 70, items = {"coal_ore"},},
                                                    {x = 2731.772, y = 1332.246, z = 69.693, h = 350.34, luck = 100, items = {"coal_ore", "iron", "copper"},},
    },   

["Gaptooth Ridge"] ={
                                                    {x = -5984.61, y = -3165.70, z = -26.54, h = 122.75, luck = 80, items = {"nitrite"},},
                                                    {x = -5981.17, y = -3161.44, z = -26.50, h = 11.95, luck = 80, items = {"nitrite"},},
                                                    {x = -5974.12, y = -3165.60, z = -25.63, h = 323.33, luck = 80, items = {"nitrite"},},
                                                    {x = -5975.12, y = -3167.79, z = -25.49, h = 148.87, luck = 80, items = {"nitrite"},},
                                                    {x = -5970.40, y = -3167.47, z = -25.18, h = 333.22, luck = 80, items = {"nitrite"},},
                                                    {x = -5958.90, y = -3189.60, z = -21.63, h = 244.61, luck = 80, items = {"nitrite"},},
                                                    {x = -5961.55, y = -3187.96, z = -21.57, h = 77.67, luck = 80, items = {"nitrite"},},
                                                    {x = -5960.62, y = -3191.80, z = -21.51, h = 234.97, luck = 80, items = {"nitrite"},},
                                                    {x = -5963.30, y = -3191.37, z = -21.55, h = 446.79, luck = 80, items = {"nitrite"},},
},
["Diablo Cave"] ={
                                                    {x = -2716.91, y = 683.8833, z = 175.80, h = 266.35, luck = 80, items = {"sulfur"},},
                                                    {x = -2720.07, y = 685.7006, z = 175.79, h = 79.6, luck = 80, items = {"sulfur"},},
                                                    {x = -2720.22, y = 688.5078, z = 175.57, h = 73.22, luck = 80, items = {"sulfur"},},
                                                    {x = -2719.00, y = 691.9522, z = 175.50, h = 175.50, luck = 80, items = {"sulfur"},},
                                                    {x = -2721.75, y = 732.4404, z = 172.26, h = 330.26, luck = 80, items = {"sulfur"},},
                                                    {x = -2723.85, y = 731.7985, z = 172.00, h = 32.96, luck = 80, items = {"sulfur"},},
                                                    {x = -2726.17, y = 730.1632, z = 171.67, h = 40.07, luck = 80, items = {"sulfur"},},
                                                    {x = -2719.20, y = 720.1865, z = 170.99, h = 337.66, luck = 80, items = {"sulfur"},},
                                                    {x = -2717.45, y = 719.3857, z = 170.86, h = 304.11, luck = 80, items = {"sulfur"},},
                                                    {x = -2713.20, y = 718.2130, z = 171.35, h = 299.9, luck = 80, items = {"sulfur"},},
},  
["Beavers Mine"] ={
                                                    {x = 2342.456, y = 1437.400, z = 96.294, h = 297.18, luck = 90, items = {"iron"},},
                                                    {x = 2342.789, y = 1435.732, z = 96.755, h = 282.07, luck = 90, items = {"iron"},},
                                                    {x = 2343.279, y = 1431.479, z = 96.577, h = 96.577, luck = 90, items = {"iron"},},
                                                    {x = 2335.417, y = 1429.727, z = 92.134, h = 258.52, luck = 90, items = {"iron"},},
                                                    {x = 2336.473, y = 1432.507, z = 91.796, h = 241.27, luck = 90, items = {"iron"},},
                                                    {x = 2276.190, y = 1490.053, z = 83.072, h = 16.88, luck = 90, items = {"iron"},},
                                                    {x = 2273.913, y = 1489.216, z = 83.043, h = 21.69, luck = 90, items = {"iron"},},
                                                    {x = 2272.051, y = 1487.929, z = 83.059, h = 32.63, luck = 90, items = {"iron"},},
},
["Elysian Cave"] ={
                                                    {x = 2305.582, y = 1131.099, z = 96.460, h = 267.3, luck = 10, items = {"goldnugget"},},
                                                    {x = 2304.649, y = 1129.247, z = 96.546, h = 219.01, luck = 10, items = {"goldnugget"},},
                                                    {x = 2303.035, y = 1127.635, z = 96.541, h = 96.541, luck = 10, items = {"goldnugget"},},
                                                    {x = 2301.372, y = 1133.378, z = 96.388, h = 38.05, luck = 10, items = {"goldnugget"},},
                                                    {x = 2302.922, y = 1135.339, z = 96.400, h = 40.19, luck = 10, items = {"goldnugget"},},
                                                    {x = 2292.885, y = 1122.914, z = 96.449, h = 203.33, luck = 10, items = {"goldnugget"},},
                                                    {x = 2292.885, y = 1122.914, z = 96.449, h = 203.33, luck = 10, items = {"goldnugget"},},
                                                    {x = 2290.033, y = 1121.079, z = 96.516, h = 186.63, luck = 10, items = {"goldnugget"},},
},
["Big Valley Cave"] ={
                                                    {x = -2118.72, y = 126.3737, z = 236.05, h = 335.64, luck = 90, items = {"silverore"},},
                                                    {x = -2115.32, y = 124.6814, z = 236.63, h = 325.52, luck = 90, items = {"silverore"},},
                                                    {x = -2110.73, y = 122.9926, z = 237.34, h = 336.54, luck = 90, items = {"silverore"},},
                                                    {x = -2107.60, y = 121.4312, z = 237.77, h = 327.62, luck = 90, items = {"silverore"},},
                                                    {x = -2127.42, y = 127.5288, z = 237.04, h = 34.68, luck = 90, items = {"silverore"},},
                                                    {x = -2130.49, y = 126.5972, z = 237.00, h = 36.25, luck = 90, items = {"silverore"},},
                                                    {x = -2133.25, y = 125.2374, z = 237.20, h = 32.82, luck = 90, items = {"silverore"},},

                                                    {x = -2368.19, y = 123.6851, z = 216.89, h = 62.12, luck = 90, items = {"copper"},},
                                                    {x = -2366.86, y = 124.8132, z = 216.94, h = 333.39, luck = 90, items = {"copper"},},
                                                    {x = -2366.67, y = 122.2273, z = 216.84, h = 136.95, luck = 90, items = {"copper"},},
                                                    {x = -2364.98, y = 123.1393, z = 216.85, h = 313.02, luck = 90, items = {"copper"},},
                                                    {x = -2363.10, y = 120.8217, z = 216.83, h = 256.94, luck = 90, items = {"copper"},},
                                                    {x = -2363.61, y = 118.4302, z = 216.83, h = 202.2, luck = 90, items = {"copper"},},
                                                    {x = -2369.08, y = 116.8300, z = 216.83, h = 348.92, luck = 90, items = {"copper"},},
                                                    {x = -2371.14, y = 116.7033, z = 216.81, h = 53.69, luck = 90, items = {"copper"},},
},
["Mount Hagen Cave"] ={
                                                    {x = -1391.43, y = 1172.488, z = 222.18, h = 263.71, luck = 50, items = {"copper"},},
                                                    {x = -1392.08, y = 1170.969, z = 222.29, h = 226.8, luck = 50, items = {"copper"},},
                                                    {x = -1396.17, y = 1169.689, z = 222.20, h = 157.62, luck = 50, items = {"copper"},},
                                                    {x = -1389.20, y = 1178.004, z = 221.94, h = 103.6, luck = 50, items = {"copper"},},
                                                    {x = -1386.66, y = 1184.158, z = 222.11, h = 337.09, luck = 50, items = {"copper"},},

                                                    {x = -1426.27, y = 1216.204, z = 223.46, h = 48.8, luck = 50, items = {"copper"},},
                                                    {x = -1424.68, y = 1217.388, z = 222.99, h = 36.99, luck = 50, items = {"copper"},},
                                                    {x = -1421.86, y = 1218.806, z = 222.59, h = 322.46, luck = 50, items = {"copper"},},

                                                    {x = -1446.26, y = 1195.385, z = 226.40, h = 130.18, luck = 50, items = {"copper"},},
                                                    {x = -1447.56, y = 1196.547, z = 226.42, h = 93.78, luck = 50, items = {"copper"},},
                                                    {x = -1441.73, y = 1194.018, z = 226.43, h = 323.65, luck = 50, items = {"copper"},},
                                                    {x = -1443.02, y = 1195.678, z = 226.48, h = 323.16, luck = 50, items = {"copper"},},
                                                    {x = -1444.43, y = 1198.012, z = 226.47, h = 226.47, luck = 50, items = {"copper"},},
},
["Guarma"] ={
                                                    {x = 1501.715, y = -7164.81, z = 67.075, h = 354.78, luck = 90, items = {"salt"},},
                                                    {x = 1498.890, y = -7165.54, z = 67.692, h = 20.21, luck = 90, items = {"salt",},},
                                                    {x = 1495.513, y = -7166.82, z = 67.489, h = 9.51, luck = 90, items = {"salt"},},
},

["Mexico"] ={
                                                    {x = -5253.02, y = -4875.49, z = -23.08, h = 151.90, luck = 30, items = {"goldnugget"},},
                                                    {x = -5234.87, y = -4887.09, z = -22.49, h = 298.44, luck = 10, items = {"diamond",},},
                                                    {x = -5223.54, y = -4926.57, z = -21.76, h = 132.49, luck = 30, items = {"goldnugget"},},
                                                    {x = -5179.72, y = -4942.64, z = -18.05, h = 245.49, luck = 25, items = {"emerald"},},
                                                    {x = -5193.36, y = -4904.49, z = -21.23, h = 93.26, luck = 20, items = {"goldnugget"},},
                                                    {x = -5206.39, y = -4853.99, z = -20.11, h = 321.54, luck = 25, items = {"emerald"},},
                                                    {x = -5161.0, y = -4883.28, z = -18.26, h = 75.54, luck = 10, items = {"diamond"},},
                                                    {x = -5141.75, y = -4874.87, z = -20.86, h = 281.54, luck = 20, items = {"emerald"},},
                                                    {x = -5184.23, y = -4833.67, z = -21.73, h = 115.22, luck = 30, items = {"goldnugget"},},
                                                    {x = -5146.99, y = -4826.65, z = -21.27, h = 129.44, luck = 30, items = {"emerald"},},
                                                    {x = -5104.28, y = -4812.47, z = -21.8, h = 304.44, luck = 30, items = {"goldnugget"},},
                                                    {x = -5144.18, y = -4775.67, z = -21.03, h = 115.44, luck = 30, items = {"emerald"},},
},
}


--STONECUTTING 
Config.StonecuttingTable = {
    ["StonecuttingStart"] ={
                                                    {x = -1344.24, y = 2406.97, z = 307.19}, -- colter
                                                    --{x = 1892.33, y = -1350.56, z = 42.45}, -- caliga hall
    } ,     
}

--BLIPS
Config.Blip = {                                     -- can add blips here
                                                    {x = -1344.24, y = 2406.97, z = 307.19, sprite = -813538438, name = "Stonemason", enabled = true},-- Colter
                                                    --{x = 1892.33, y = -1350.56, z = 42.45, sprite = -813538438, name = "Stonemason", enabled = true}, -- Caliga Hall
}


Config.Stonecutting = {
                                                    -- FLAWED - LABEL - PRISTINE - LEVEL - WHETSTONECOST
    [1]                             =               {flawed = "frockcrystal", label = "Rock Crystal", pristine = "prockcrystal", level = "1", whetstonecost = "1"},
    [2]                             =               {flawed = "famber", label = "Amber", pristine = "pamber", level = "1", whetstonecost = "1"},  
    [3]                             =               {flawed = "fmoonstone", label = "Moonstone", pristine = "pmoonstone", level = "1", whetstonecost = "1"},   
    --------------------------------
    [4]                             =               {flawed = "fcarnelian", label = "Carnelian", pristine = "pcarnelian", level = "2", whetstonecost = "1"},
    [5]                             =               {flawed = "fmalachite", label = "Malachite", pristine = "pmalachite", level = "2", whetstonecost = "1"},
    [6]                             =               {flawed = "faquamarine", label = "Aquamarine", pristine = "paquamarine", level = "2", whetstonecost = "1"},
    --------------------------------
    [7]                             =               {flawed = "fopal", label = "Opal", pristine = "popal", level = "3", whetstonecost = "1"},
    [8]                             =               {flawed = "ftopaz", label = "Topaz", pristine = "ptopaz", level = "3", whetstonecost = "1"},
    --------------------------------
    [9]                             =               {flawed = "femerald", label = "Emerald", pristine = "pemerald", level = "4", whetstonecost = "1"},
    [10]                            =               {flawed = "fruby", label = "Ruby", pristine = "pruby", level = "4", whetstonecost = "1"},
    --------------------------------
    [11]                            =               {flawed = "famethyst", label = "Amethyst", pristine = "pamethyst", level = "5", whetstonecost = "1"},
    [12]                            =               {flawed = "fonyx", label = "Onyx", pristine = "ponyx", level = "5", whetstonecost = "1"},
    --------------------------------
    [13]                            =               {flawed = "fsapphire", label = "Sapphire", pristine = "psapphire", level = "6", whetstonecost = "1"},
    [14]                            =               {flawed = "fdiamond", label = "Diamond", pristine = "pdiamond", level = "6", whetstonecost = "1"},
}


Config.GemsNormalLuck = { -- if you roll normal luck when washing the ore select reward from these stones
                                                    "frockcrystal",
                                                    "famber",
                                                    "fmoonstone",
}
Config.GemsExtraLuck = { -- if you roll extra luck when washing the ore select reward from these stones
                                                    "frockcrystal",
                                                    "famber",
                                                    "fmoonstone",
                                                    "fcarnelian",
                                                    "fmalachite",
                                                    "faquamarine",
}
Config.GemsInsaneLuck = { -- if you roll insane luck when washing the ore select reward from these stones
                                                    "frockcrystal",
                                                    "famber",
                                                    "fmoonstone",
                                                    "fcarnelian",
                                                    "fmalachite",
                                                    "faquamarine",
                                                    "fopal",
                                                    "ftopaz",
                                                    "femerald",
                                                    "fruby",
                                                    "famethyst",
                                                    "fonyx",
                                                    "fsapphire",
                                                    "fdiamond",
}

Config.Prompts = {
    Title                           =               "Mining",
    TitleWashing                    =               "Washing Ore",
    StonecuttingTitle               =               "Stonecutting",
    Stop                            =               {0x5966D52A, "Put Away"},
    Work                            =               {0x39336A4F, "Work"},
    Shop                            =               {0x39336A4F, "Shop"},
    Stonecutting                    =               {0x39336A4F, "Cut gems"},
}

Config.Texts = {
    WebhookTitle                    =               "Mining & Stonecutting Corp.",
    WebhookTitleWashingOre          =               "Washing Shiny Ore",
    YouGotNothing                   =               "You found nothing inside the ore",
    NotAtWater                      =               "You should go to the water to wash the ore",
    DontHaveRightLevel              =               "Your stonecutting experience isnt high enough!",
    MineIsClosed                    =               "The mine is currently closed!",
    Mining                          =               "Mining",
    WashingOre                      =               "Washing",
    CuttingGem                      =               "Cutting",
    StonecuttingIsClosed            =               "The stonecutter is currently closed!",
    Open                            =               "Open:",
    MiningAt                        =               "Mining at",
    CantUse                         =               "You have something else in your hand!",
    YouGot                          =               "You mined: ",
    YouGotWashing                   =               "You found: ",
    YouGotCutting                   =               "You received from cutting: ",
    And                             =               "and",
    NoItemSell                      =               "You dont have this product:",
    ItemSold                        =               "You sell the product for $",
    NoMoneyBuy                      =               "You dont have enough cash! You need $",
    LimitBuy                        =               "You cant buy more of that!",
    HaveAlready                     =               "You already have that..",
    Bought                          =               "Successfully bought!",
    HasNoPermit                     =               "You dont have the licence",
    DoesNotHaveRightJob             =               "You dont have the permission",
    NoSpace                         =               "Your bags are full!",
    NobodyAround                    =               "There is nobody around",
    Working                         =               "Working",
    PutDownWeapon                   =               "Put down your weapon!",
    NoGem                           =               "You dont have that gem!",
    DoesNotHaveWhetstone            =               "You dont have a whetstone!",
    CutLvl1                         =               "Cut level 1 gems",
    CutLvl2                         =               "Cut level 2 gems",
    CutLvl3                         =               "Cut level 3 gems",
    CutLvl4                         =               "Cut level 4 gems",
    CutLvl5                         =               "Cut level 5 gems",
    CutLvl6                         =               "Cut level 6 gems",
    NoPickaxe                       =               "You have nothing to use this on",
    Sharpening                      =               "Sharpening",
    NoStamina                       =               "You are too tired..",
}

--XP SYSTEM

Config.MiningBoost1                 =               800 -- 800 hits to get a boost = + 5% chance on every boost 
Config.MiningBoost2                 =               1600
Config.MiningBoost3                 =               3000
Config.MiningBoost4                 =               4500

Config.StonecuttingLVL2             =               200 -- 200 times gemcutting to reach lvl 2
Config.StonecuttingLVL3             =               400
Config.StonecuttingLVL4             =               600
Config.StonecuttingLVL5             =               800
Config.StonecuttingLVL6             =               1000