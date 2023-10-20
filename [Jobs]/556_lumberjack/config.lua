Config = {}

--Webhook
Config.Logs                         =       false 
Config.Discord                      =       false  --if you use discord whitelist
Config.webhook                      =       ""
Config.name                         =       "🪓Lumberjack" 
Config.logo                         =       "https://via.placeholder.com/30x30" -- Header
Config.footerLogo                   =       "https://via.placeholder.com/30x30" -- Footer
Config.Avatar                       =       "https://via.placeholder.com/30x30" -- Avatar

--Basics
Config.LumberJob                    =       {"lumberjack","lumberjack2"} 

-- enable, durability text, max durability, loss each time, text if breaks, enable broken hatchet item, broken hatchet item
Config.Metadata                     =       {true, "Durability", 100, 1, "Your axe broke!", true, "brokenhatchet"}
-- time in seconds, +durability each time, use new status texts, metadata status texts, status values (e.g. sharp starts at 60 and up, dull at 20 and less, damaged is inbetween)
Config.AxeSharpen                   =       {30, 10, true, "Dull", "Damaged", "Sharp", 20, 60} -- prop to sharpen = p_grindingwheel01x
-- enable, range, blip, blipname, joblock
Config.TreeBlips                    =       {enable = true, range = 50, blip = 1904459580, name = "Tree", needsjob = true}

Config.NeedsJobToSharpenAxe         =       true
Config.SharpenAxeJobs               =       {"blacksmith","blacksmith2"}

Config.StaminaDepletion             =       {false, 15.0, 5} -- if enabled depletes 15 stamina every 5 seconds when working

Config.EnableJobMenu                =       true -- if turned false this will start delivery. to change texts head to prompts.job and jobtitle
Config.EnableShops                  =       true
Config.EnableTreeCutting            =       true
Config.LogChopLocation1             =       true
Config.PlaneLocation1               =       true
Config.SawLocation1                 =       true
Config.SecondSawLocation1           =       true
Config.TeleportToAnnesburgLumber    =       true
Config.EnableMarkers                =       {false, 0x07DCE236, 128, 128, 128, 0} -- enable, type, r, g, b, rotate(0,1) 
Config.EnableDeliveryMarkers        =       true
Config.EnableProgressBars           =       true
Config.EnableToolprice              =       true
Config.DoubleAxe                    =       false

--Digits
Config.CompanyPrice                 =       4000    -- buy price if there is no owner yet, if owner sells the company he will get back the sell price
Config.PermitPrice                  =       1000    -- initial amount if not set by lumberjack (licence)
Config.ToolCostMoney                =       2       -- initial amount if not set by lumberjack (processing)
Config.WorkTimeTools                =       22      -- seconds
Config.Distance                     =       3       -- distance to show permit to other player
Config.LumberJobInventoryLimit      =       1000
Config.TreeCooldown                 =       120       -- in minutes

Config.NeedsJobToUseTools           =       true
Config.NeedsPermitToUseTools        =       true

Config.NeedsJobToDeliver            =       true
Config.NeedsPermitToDeliver         =       true

Config.NeedsJobToChopTrees          =       false
Config.NeedsPermitToChopTrees       =       true

Config.NeedsJobToEquipAxe           =       false
Config.NeedsPermitToEquipAxe        =       true

Config.NeedsJobToShowPermit         =       false
Config.NeedsJobToOpenInv            =       true
Config.NeedsJobToOpenJobMenu        =       true

Config.NeedsJobToOpenShop           =       false
Config.CanBuyLicenceFromShop        =       true
Config.NpcTalk                      =       true

--Database items
Config.PermitItem                   =       "lumberjackpermit"
Config.AxeItem                      =       "hatchet"


Config.Processing = {
    ChopTree    = {title = "Tree", reward = {item = "woodlog", label = "Woodlog", amount = 1}},
    SawLog      = {title = "Woodlog to Small Woodlog",input = {item = "woodlog", label = "Woodlog", amount = 5}, reward = {item = "small_woodlog", label = "Small Woodlog", amount = 10}, error = "You need 5 woodlogs"},
    ChopLog     = {title = "Small Woodlog to Firewood",input = {item = "small_woodlog", label = "Small Woodlog", amount = 5}, reward = {item = "firewood", label = "Firewood", amount = 10}, error = "You need 5 small woodlogs"},
    PlanePlank  = {title = "Small Woodlog to Plank",input = {item = "small_woodlog", label = "Small Woodlog", amount = 5}, reward = {item = "wood_plank", label = "Planks", amount = 10}, error = "You need 5 small woodlogs"},
    SawPlank    = {title = "Plank to Small Plank",input = {item = "wood_plank", label = "Small Woodlog", amount = 5}, reward = {item = "small_woodplank", label = "Small Planks", amount = 10}, error = "You need 5 planks"},
}

--Dont change
Config.image                        =       "permit"
Config.WoodLogModel                 =       "p_cs_cedarlog02x"
Config.PlaneModel                   =       "p_hand_plane_001"
Config.SawModel                     =       "p_sawhand01x"


--Delivery
Config.DeliveryTimer                =       1200 --in seconds
Config.Vehicle                      =       'CART06'
Config.DeliveryMoney = {
                                            ['min'] = 5,
                                            ['max'] = 9
}
Config.Zones = {
                                            ['WoodSpot'] = { x = -1408.38, y = -182.08, z = 100.69 },
                                            ['Vehicle'] = { x = -1390.068359375, y = -199.25709533691406, z = 102.08682250976562, heading = 347 },
}
Config.DeliveryZones = {
                                            {x = -282.08, y = 697.83, z= 113.58},-- Valentine
                                            {x = -852.37, y = -1373.27, z= 43.59}, -- BW
                                            {x = 1420.49, y = -1316.59, z= 77.79}, --RHO
                                            {x = 2841.72, y = -1359.91, z= 44.6}, --SD
}
Config.AnnesburgZones = {
                                            ['WoodSpot'] = { x = 2872.38, y = 1453.78, z = 68.19 },
                                            ['Vehicle'] = { x = 2873.052246093, y = 1472.156982421, z = 67.93216705, heading = 125.0 },
}
Config.DeliveryZonesAnnesburg = {
                                            {x = -282.08, y = 697.83, z= 113.58},-- Valentine
                                            {x = 2601.4479, y = -994.5844, z= 44.0729}, -- SD
                                            {x = 1420.49, y = -1316.59, z= 77.79}, --RHO
                                            {x = 2841.72, y = -1359.91, z= 44.6}, --SD
}

--NPC SHOP
Config.LumberMan = {
    [1] = { -- Montos Rest
        model                       =       "u_m_m_sdtrapper_01",
        coords                      =       { x = -1401.16, y = -205.28, z = 101.95, h = 206.34 },
        name                        =       "Jack Lumber",
        scene                       =       false,
        EnableBlip                  =       true,
        BlipSprite                  =       1480984695,
    },
    [2] = { -- Annesburg
        model                       =       "S_M_M_StrLumberjack_01",
        coords                      =       { x = 2868.54, y = 1465.08, z =68.73, h = 237.83 },
        name                        =       "Chuck Wood",
        scene                       =       "WORLD_HUMAN_SMOKE",
        EnableBlip                  =       true,
        BlipSprite                  =       1480984695,
    },
}

Config.LumberShop = {
    Title                           =       "Lumber Shop",
    SubText                         =       "Buy and Sell",
    Options = {
        [1] = {
            Id                      =       "buygear",
            Title                   =       "Gear",
            SubText                 =       "items",
            Desc                    =       "Buy items",
            Items = { -- stuff the npc sells (name label cash)
                                            { "hatchet", "Axe", 5 },
            }
        },
        [2] = {     
            Id                      =       "sellcategory",
            Title                   =       "Sell products",
            SubText                 =       "Products",
            Desc                    =       "Sell products",
            Categories = {
                ["idk"]             =       "Various",
            },
            Items = {
                ["idk"] = { -- stuff the npc buys (name label cash)
                                            { "bark", "Treeapple", 2 },
                },
            },
        },
        [3] = {
            Id                      =       "buylicence",
            Title                   =       "Licence",
            SubText                 =       "Licence to use the equipment",
            Desc                    =       "Buy Licence",
            Items = { -- buy the licence (name label cash)
                                            { Config.PermitItem, "Licence", Config.PermitPrice },
            }
        },
    },
}


--COORDS
Config.AnnesburgHouse = {
    ["1"] ={
                                            {x = 2860.07, y = 1447.82, z = 69.42}, -- tp inside
    } ,     
    ["2"] ={
                                            {x = 2861.1, y = 1449.67, z = 69.19}, -- tp outside
} ,  
}

Config.JobMenu = {
    ["Monto's Rest"] ={
                                            {x = -1401.74, y = -208.67, z = 102.85},
    } ,     
    ["Annesburg"] ={
                                            {x = 2859.72, y = 1452.51, z = 69.19},
} ,  
}

Config.LogChopPoints = { -- leave prop on true here
    ["Monto's Rest"] ={
                                            {x = -1395.03, y = -245.89, z = 98.93, h = 324.05, luck = 10, prop = true, items = {"bark"},},
                                            {x = -1395.19, y = -250.59, z = 98.90, h = 324.05, luck = 10, prop = true, items = {"bark"},},
    } ,

    ["Annesburg"] ={
                                            {x = 2855.12, y = 1418.18, z = 68.64, h = 324.05, luck = 10, prop = true, items = {"bark"},},
                                            {x = 2858.670, y = 1420.311, z = 68.61, h = 324.05, luck = 10, prop = true, items = {"bark"},},
} ,
}

Config.PlanePoints = {
    ["Monto's Rest"] ={
                                            {x = -1403.39, y = -250.6, z = 99.46, h = 157.48, luck = 10, prop = true, items = {"bark"},},
    } ,
    ["Annesburg"] ={
                                            {x = 2858.15, y = 1435.62, z = 68.53, h = 221.99, luck = 10, prop = true, items = {"bark"},},
                                            {x = 2860.0, y = 1437.35, z = 68.46, h = 113.81, luck = 10, prop = true, items = {"bark"},},
    } ,
}

Config.SawPlankPoints = {
    ["Monto's Rest"] ={
                                            {x = -1408.00, y = -249.66, z = 99.61, h = 92.316, luck = 10, prop = true, items = {"bark"},},
    } ,
    ["Annesburg"] ={
                                            {x = 2852.52, y = 1426.61, z = 68.74, h = 124.02, luck = 10, prop = true, items = {"bark"},},
                                            {x = 2857.3, y = 1425.02, z = 68.68, h = 286.77, luck = 10, prop = true, items = {"bark"},},
    } ,
}

Config.SawLogPoints = {
    ["Monto's Rest"] ={
                                            {x = -1407.59, y = -245.30, z = 99.65, h = 100.0, luck = 10, prop = true, items = {"bark"},},
    } ,
    ["Annesburg"] ={
                                            {x = 2853.02, y = 1438.66, z = 69.16, h = 241.41, luck = 10, prop = false, items = {"bark"},},
                                            {x = 2856.02, y = 1443.23, z = 69.16, h = 236.89, luck = 10, prop = false, items = {"bark"},},
    } ,
}

Config.TreePoints = {
    ["Monto's Rest"] ={ -- dont change h value
                                            {x = -1437.98, y = -215.71, z = 102.78, h = 232.001, luck = 10, items = {"bark"},}, -- "bark","sap"
                                            {x = -1407.92, y = -294.8, z = 103.16, h = 1.0, luck = 10, items = {"bark"},},
                                            {x = -1411.14, y = -310.29, z = 106.53, h = 2.0, luck = 10, items = {"bark"},},
                                            {x = -1446.25, y = -249.47, z = 102.85, h = 3.0, luck = 10, items = {"bark"},},
                                            {x = -1454.31, y = -226.81, z = 104.01, h = 3.0, luck = 10, items = {"bark"},},
                                            {x = -1413.45, y = -292.41, z = 103.01, h = 1.0, luck = 10, items = {"bark"},},
                                            {x = -1422.18, y = -190.65, z = 101.09, h = 1.0, luck = 10, items = {"bark"},},
                                            {x = -1402.92, y = -270.85, z = 99.98, h = 4.0, luck = 10, items = {"bark"},},
                                            {x = -1429.18, y = -195.93, z = 101.74, h = 1.0, luck = 10, items = {"bark"},},
                                            {x = -1426.51, y = -271.85, z = 103.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1426.83, y = -267.97, z = 102.61, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1413.13, y = -273.87, z = 101.51, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1431.28, y = -261.05, z = 101.45, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1446.14, y = -254.42, z = 103.34, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1441.14, y = -254.62, z = 102.19, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1468.42, y = -258.34, z = 109.61, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1483.28, y = -261.93, z = 114.41, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1491.78, y = -252.16, z = 114.65, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1498.23, y = -226.36, z = 112.45, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1478.43, y = -234.46, z = 109.99, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1447.92, y = -233.42, z = 102.45, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1421.69, y = -259.78, z = 100.59, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1392.45, y = -265.69, z = 99.29, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1369.94, y = -242.49, z = 101.49, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1371.8, y = -277.68, z = 100.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1370.4, y = -309.09, z = 101.22, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1351.9, y = -292.68, z = 102.65, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1356.48, y = -240.23, z = 103.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1370.55, y = -229.15, z = 101.75, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1356.36, y = -250.82, z = 101.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1365.17, y = -249.8, z = 100.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1347.67, y = -261.17, z = 102.27, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1342.14, y = -275.20, z = 103.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1398.22, y = -285.84, z = 102.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1410.28, y = -285.79, z = 102.15, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1398.4, y = -260.99, z = 99.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1433.98, y = -279.51, z = 106.57, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1443.88, y = -269.17, z = 104.77, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1468.73, y = -296.74, z = 117.44, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1467.63, y = -281.52, z = 115.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1473.92, y = -249.01, z = 110.0, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1455.07, y = -239.02, z = 103.94, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1445.52, y = -212.82, z = 104.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1438.01, y = -205.77, z = 103.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1442.87, y = -200.75, z = 103.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1436.89, y = -194.93, z = 102.33, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1411.04, y = -193.03, z = 100.59, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1382.14, y = -195.32, z = 101.99, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1380.76, y = -210.58, z = 100.74, h = 232.001, luck = 10, items = {"bark"},},
        },

        ["Monto's Rest 2"] ={ -- dont change h value
                                            {x = -1438.43, y = -263.843, z = 103.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1445.75, y = -273.552, z = 106.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1429.15, y = -289.056, z = 106.30, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1431.67, y = -297.502, z = 107.60, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1441.11, y = -298.671, z = 110.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1452.01, y = -307.442, z = 113.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1458.01, y = -305.121, z = 113.90, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1463.40, y = -313.191, z = 116.30, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1481.25, y = -287.102, z = 118.30, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1492.41, y = -276.202, z = 119.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1490.72, y = -267.240, z = 117.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1498.62, y = -262.842, z = 119.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1500.13, y = -269.016, z = 121.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1509.24, y = -268.740, z = 123.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1498.93, y = -250.659, z = 117.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1494.28, y = -233.870, z = 113.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1504.53, y = -229.613, z = 114.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1506.41, y = -236.880, z = 116.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1511.36, y = -243.384, z = 119.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1477.83, y = -227.818, z = 109.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1485.97, y = -222.119, z = 110.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1478.86, y = -212.201, z = 108.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1482.31, y = -203.707, z = 109.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1467.94, y = -202.798, z = 106.60, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1463.29, y = -206.863, z = 106.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1458.21, y = -208.661, z = 106.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1450.40, y = -205.847, z = 106.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1440.72, y = -192.584, z = 102.80, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1447.98, y = -193.365, z = 104.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1457.88, y = -197.467, z = 105.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1467.49, y = -185.913, z = 105.65, h = 1.0, luck = 10, items = {"bark"},},
                                            {x = -1474.35, y = -178.355, z = 107.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1488.68, y = -178.666, z = 109.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1499.82, y = -173.022, z = 109.60, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1446.79, y = -178.242, z = 103.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1441.51, y = -183.125, z = 102.50, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1435.08, y = -188.495, z = 102.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1427.90, y = -186.529, z = 101.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1430.50, y = -181.707, z = 101.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1420.74, y = -179.337, z = 101.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1407.51, y = -175.240, z = 101.30, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1403.93, y = -179.720, z = 101.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1399.26, y = -184.782, z = 101.10, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1397.51, y = -201.754, z = 102.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1389.86, y = -184.604, z = 101.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1393.80, y = -174.491, z = 100.70, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1393.81, y = -167.009, z = 100.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1395.38, y = -156.091, z = 98.600, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = -1401.58, y = -152.601, z = 100.00, h = 232.001, luck = 10, items = {"bark"},},
        },

        ["Annesburg"] ={ -- dont change h value
                                            {x = 2872.83, y = 1478.75, z = 67.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2877.13, y = 1482.07, z = 65.25, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2850.38, y = 1472.95, z = 70.02, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2845.49, y = 1494.23, z = 82.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2842.06, y = 1507.89, z = 88.56, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2837.44, y = 1502.43, z = 86.53, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2831.00, y = 1499.16, z = 88.84, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2834.94, y = 1505.73, z = 88.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2829.28, y = 1508.85, z = 92.56, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2825.16, y = 1501.87, z = 92.09, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2822.29, y = 1505.69, z = 93.71, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2824.97, y = 1510.83, z = 95.13, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2824.52, y = 1515.63, z = 96.87, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2832.00, y = 1515.04, z = 93.23, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2829.15, y = 1517.92, z = 95.53, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2827.61, y = 1525.01, z = 99.39, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2815.61, y = 1529.08, z = 105.81, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2814.65, y = 1524.94, z = 104.01, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2810.71, y = 1522.14, z = 104.05, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2805.87, y = 1529.83, z = 107.86, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2809.28, y = 1515.18, z = 99.82, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2818.21, y = 1510.36, z = 96.00, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2899.29, y = 1489.69, z = 61.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2895.11, y = 1466.91, z = 58.46, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2907.41, y = 1457.13, z = 58.35, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 2826.16, y = 1426.08, z = 75.55, h = 232.001, luck = 10, items = {"bark"},},
        },

        ["Wapiti"] ={ -- dont change h value
                                            {x = 449.1554, y = 2221.255, z = 246.79, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 448.3429, y = 2226.168, z = 248.39, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 476.3182, y = 2237.884, z = 248.19, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 506.5254, y = 2241.555, z = 247.09, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 509.6801, y = 2244.223, z = 247.09, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 507.8298, y = 2237.568, z = 246.49, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 509.5342, y = 2237.635, z = 246.49, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 509.4932, y = 2233.681, z = 246.49, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 518.4896, y = 2233.112, z = 245.99, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 527.0449, y = 2240.512, z = 246.59, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 523.4684, y = 2236.052, z = 246.16, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 528.2792, y = 2234.547, z = 246.16, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 532.0910, y = 2226.915, z = 244.46, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 539.5165, y = 2230.484, z = 244.86, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 542.6017, y = 2227.937, z = 243.66, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 546.5104, y = 2229.711, z = 243.16, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 549.5465, y = 2225.494, z = 240.56, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 552.0395, y = 2235.445, z = 242.76, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 558.0547, y = 2236.736, z = 239.46, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 565.0415, y = 2230.080, z = 233.86, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 568.4934, y = 2232.553, z = 232.56, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 552.8743, y = 2255.007, z = 244.68, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 548.7174, y = 2260.852, z = 245.28, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 522.1888, y = 2257.167, z = 248.66, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 526.6380, y = 2261.306, z = 249.26, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 527.4854, y = 2256.239, z = 249.26, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 532.1851, y = 2256.117, z = 248.73, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 536.1376, y = 2265.012, z = 248.53, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 536.9132, y = 2273.739, z = 247.03, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 529.8918, y = 2283.908, z = 249.20, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 525.0548, y = 2280.010, z = 248.60, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 515.5441, y = 2283.180, z = 251.40, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 505.8033, y = 2283.575, z = 251.60, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 499.3783, y = 2277.616, z = 249.04, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 495.9925, y = 2270.393, z = 248.74, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 500.5658, y = 2266.985, z = 247.24, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 488.7825, y = 2269.179, z = 251.24, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 478.2642, y = 2261.023, z = 248.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 463.4872, y = 2268.615, z = 249.44, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 459.0854, y = 2267.410, z = 249.44, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 456.7870, y = 2264.001, z = 249.34, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 449.3085, y = 2261.068, z = 250.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 443.8244, y = 2268.199, z = 251.34, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 445.4863, y = 2275.138, z = 251.74, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 462.2172, y = 2275.358, z = 250.12, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 458.2773, y = 2274.528, z = 250.62, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 453.5711, y = 2268.895, z = 250.62, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 451.6298, y = 2271.047, z = 250.62, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 439.0962, y = 2272.036, z = 252.22, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 439.2079, y = 2278.951, z = 253.32, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 426.2128, y = 2269.400, z = 255.12, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 428.0033, y = 2259.579, z = 254.12, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 428.2846, y = 2254.395, z = 253.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 408.4359, y = 2245.567, z = 253.52, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 401.7635, y = 2244.434, z = 255.52, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 397.4095, y = 2239.396, z = 257.22, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 402.4959, y = 2235.192, z = 254.82, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 395.9540, y = 2231.662, z = 257.32, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 396.1659, y = 2217.444, z = 256.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 393.6681, y = 2212.199, z = 255.42, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 397.5616, y = 2214.407, z = 256.72, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 406.1213, y = 2214.097, z = 253.62, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 415.8730, y = 2219.719, z = 253.12, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 434.9655, y = 2181.528, z = 246.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 431.2422, y = 2179.321, z = 246.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 423.6634, y = 2183.005, z = 247.24, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 418.9438, y = 2175.360, z = 246.64, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 424.1569, y = 2172.724, z = 245.94, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 429.3723, y = 2165.046, z = 245.64, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 433.3937, y = 2163.437, z = 245.04, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 464.7027, y = 2166.892, z = 243.74, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 472.1856, y = 2161.098, z = 243.14, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 472.5780, y = 2153.572, z = 242.74, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 473.3409, y = 2141.081, z = 241.74, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 468.3754, y = 2118.693, z = 238.94, h = 232.001, luck = 10, items = {"bark"},},
                                            {x = 480.3894, y = 2116.611, z = 238.94, h = 232.001, luck = 10, items = {"bark"},},
        },
}

--PROMPTS
Config.Prompts = {
    JobTitle                        =       "Lumberjack Notes",
    Job                             =       {0x5966D52A, "Open"},
    Stop                            =       {0x5966D52A, "Put Away"},
    Work                            =       {0x39336A4F, "Process"},
    Chop                            =       {0x39336A4F, "Chop"},
    LogChop                         =       {0xC7B5340A, "Chop"},
    Plane                           =       {0xC7B5340A, "Plane"},
    Saw                             =       {0xC7B5340A, "Saw"},
    SecondSaw                       =       {0xC7B5340A, "Saw"},
    ShopPrompt                      =       {0xC7B5340A, "Talk"}, --ENTER
    BuyCompanyPrompt                =       {0x8CC9CD42, "Buy business"}, --X
    Grind                           =       {0xA1ABB953, "Sharpen"}, --G
}

--LANGUAGE
Config.Texts = {
    WebhookTitle                    =       "Lumberjack Notebook",
    CantUse                         =       "You have something else in your hand!",
    Collected                       =       "Collected:",
    And                             =       "and",
    NoItemSell                      =       "You dont have this product:",
    ItemSold                        =       "You sell the product for $",
    NoMoneyBuy                      =       "You dont have enough cash! You need $",
    LimitBuy                        =       "You cant buy more of that!",
    HaveAlready                     =       "You already have that..",
    Bought                          =       "Successfully bought!",
    NoMoneyTools                    =       "Not enough cash",
    HasNoToolsPermit                =       "You dont have the licence",
    DoesNotHaveRightJob             =       "You dont have the permission",
    NoSpace                         =       "Your bags are full!",
    NoAxe                           =       "You dont have an axe!",
    NoAxeInHand                     =       "You dont have an axe in your hand!",
    NoAxeEquipped                   =       "You dont have an axe equipped!",
    AlreadyCut                      =       "This tree has already been cut!",
    NobodyAround                    =       "There is nobody around",
    Chopping                        =       "Chopping",
    Working                         =       "Working",
    InvalidInput                    =       "Invalid",
    NotTheOwner                     =       "You dont own this business",
    NoOwner                         =       "This business is not owned yet",
    AlreadyOwned                    =       "The business is already owned",
    OutofStock                      =       "Ask the Lumberjack for a Licence",
    PlayerHasAnotherJob             =       "Player already has another job",
    SuccessfullyHired               =       "You successfully hired a player!",
    SuccessfullyFired               =       "You successfully fired a player!",
    YouWereHired                    =       "You were hired as a lumberjack!",
    YouWereFired                    =       "You were fired as a lumberjack!",
    PressEnter                      =       "Press Enter",
    Delivery1                       =       "Go to your woodstash behind the house!",
    Delivery2                       =       "Load 5 more logs into your wagon!",
    Delivery3                       =       "4 more!",
    Delivery4                       =       "3 more!",
    Delivery5                       =       "2 more!",
    Delivery6                       =       "1 more!",
    LoadintoVehicle                 =       "Load the log into your vehicle",
    DeliverStart                    =       "Deliver the wood in time! Safe driving!",
    TimeRemaining                   =       "Time remaining",
    Seconds                         =       "Seconds",
    TimeRanOut                      =       "You took too long, the guy is gone..",
    NoVehicle                       =       "Did you loose your vehicle?!",
    JobCompleted                    =       "Job completed, you got",
    AlreadyDelivered                =       "You already did a delivery not too long ago!",
    DeliveryNotPossible             =       "No deliveries needed from this position at the moment!",
    BuyCompanyInput                 =       "type yes or no",
    BuyCompanyInputResult           =       "yes", -- input needed to buy and sell company!
    GrindWheel                      =       "Grindwheel",
    NoHatchet                       =       "You dont have anything to sharpen",
    NoStamina                       =       "You are too tired..",
}

