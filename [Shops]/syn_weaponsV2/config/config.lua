Config = {}
Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["G"] = 0x760A9C6F,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}
Config.updatedinventoryammo = true -- set to false if ur using an out of date inventory NEW LINE

Config.removescope = true -- set to true if you want scoped rifles to come with no scopes and players need to add the scope


Config.craftingtakeitems = true -- if mini game fails take items from player
Config.adminwebhook = ""
Config.jobonly = true -- only players with mentioned jobs below can access crafting/customization station
Config.jobrankcustomization = 1
Config.jobrankcrafting = 1

Config.checkguncommand = "checkgun"

Config.weaponshops = true -- endable or disable weapon shops

Config.craftinganimations = "WORLD_HUMAN_CROUCH_INSPECT" -- animation for crafting
Config.customizationanimation = "WORLD_HUMAN_WRITE_NOTEBOOK" -- animations for customizations

Config.customizationLocations = { 
    Valentine = {	   
        Pos = {x= -277.22, y=778.922, z=119.50}, -- location weapon customization station
        Pos2 = {x= -276.47, y=778.922, z=119.80}, -- location spawned weapon 3d model
        job = {"gunsmith"},
    },
    lympanyguns = {	   
        Pos = {x= -346.0, y=-157.09, z=50.7}, -- location weapon customization station
        Pos2 = {x= -346.3, y=-157.5, z=51.21}, -- location spawned weapon 3d model
        job = {"lympanyguns"},
    },
    Rhodes = {	   
        Pos = {x= 1327.05, y=-1322.05, z=78.05}, -- location weapon customization station
        Pos2 = {x= 1326.35, y=-1322.05, z=78.08}, -- location spawned weapon 3d model
        job = {"rguns"},

    },
    SaintDenis = {	   
        Pos = {x= 2712.148, y=-1283.020, z=49.636}, -- location weapon customization station
        Pos2 = {x= 2712.649, y=-1282.320, z=49.86}, -- location spawned weapon 3d model
        job = {"sdgunsmith"},

    },
    Annesburg = {	   
        Pos = {x= 2950.90, y=1316.09, z=44.82}, -- location weapon customization station
        Pos2 = {x= 2949.80, y=1316.81, z=45.01}, -- location spawned weapon 3d model
        job = {"annesburggunsmith"},

    },
    Blackwater = {	   
        Pos = {x=-878.58,y=-1388.98,z=44.81}, -- location weapon customization station
        Pos2 = {x=-878.58,y=-1388.5,z=45.21}, -- location spawned weapon 3d model
        job = {"bwgunsmith"},

    },
    Tumbleweed = {	   
        Pos = {x= -5507.00, y=-2963.76, z=-0.63}, -- location weapon customization station
        Pos2 = {x= -5507.40, y=-2963.46, z=-0.30}, -- location spawned weapon 3d model
        job = {"twgunsmith"},
    },
    Armadillo = {	   
        Pos = {x= -3676.70, y=-2605.13, z=-13.72}, -- location weapon customization station
        Pos2 = {x= -3676.70, y=-2604.63, z=-13.50}, -- location spawned weapon 3d model
        job = {"frontierarms"},
    },
    Strawberry = {	   
        Pos = {x= -1766.17, y=-380.322, z=157.73}, -- location weapon customization station
        Pos2 = {x= -1767.07, y=-380.52, z=158.33}, -- location spawned weapon 3d model
        job = {"strwgunsmith"},

    },
}

Config.craftinglocation = { 
    Valentine = {	   
        Pos = {x= -277.0, y=780.689, z=119.68}, -- location weapon crafting station
        job = {"gunsmith"},
    },
    lympanyguns = {	   
        Pos = {x= -343.0, y=-157.6, z=51.1}, -- location weapon crafting station
        job = {"lympanyguns"},
    },
    Bounty = {	   
        Pos = {x= 2956.87, y=1377.67, z=56.30}, -- location weapon crafting station
        job = {"bountyhunter","regulators"},

    },
    Shaman = {	   
        Pos = {x= 898.06, y=268.31, z=116.18}, -- location weapon crafting station
        job = {"shaman"},
    },
    Roanokeshaman = {	   
        Pos = {x= 2336.55, y=1443.74, z=90.73}, -- location weapon crafting station
        job = {"roanokeshaman"},
    },    
    Wapiti = {	   
        Pos = {x= 445.90, y=2245.26, z=248.80}, -- location weapon crafting station
        job = {"wapitishaman"},
    },
    Rhodes = {	   
        Pos = {x= 1330.15, y=-1321.06, z=77.88}, -- location weapon crafting station
        job = {"rguns"},

    },
    SaintDenis = {	   
        Pos = {x= 2708.766, y=-1284.148, z=49.63}, -- location weapon crafting station
        job = {"sdgunsmith"},

    },
    annesblacksmith = {	   
        Pos = {x= 2886.75, y=1361.51, z=63.1}, -- location weapon crafting station
        job = {"annesblacksmith"},

    },
    Annesburg = {	   
        Pos = {x= 2951.28, y=1314.52, z=44.82}, -- location weapon crafting station
        job = {"annesburggunsmith"},

    },
    cumberlandguild = {	   
        Pos = {x= -30.09, y=1234.70, z=172.95}, -- location weapon crafting station
        job = {"cumberlandguild"},

    },
    omenbounty = {	   
        Pos = {x= -2185.77, y=723.40, z=122.44}, -- location weapon crafting station
        job = {"omenbounty"},

    },
    grimfellows = {	   
        Pos = {x=1795.92,y=-827.96,z=42.51,}, -- location weapon crafting station
        job = {"grimfellows"},

    },
    highland = {	   
        Pos = {x=-397.35,y=-1104.76,z=42.14,}, -- location weapon crafting station
        job = {"highland"},

    },
    Blackwater = {	   
        Pos = {x=-876.09,y=-1389.2,z=44.81}, -- location weapon crafting station
        job = {"bwgunsmith"},

    },
    Tumbleweed = {	   
        Pos = {x= -5508.79, y=-2968.97, z=-0.63}, -- location weapon crafting station
        job = {"twgunsmith"},

    },
    Armadillo = {	   
        Pos = {x= -3676.43, y=-2601.06, z=-13.32}, -- location weapon crafting station
        job = {"frontierarms"},

    },
    Strawberry = {	   
        Pos = {x= -1761.88, y=-382.47, z=157.74}, -- location weapon crafting station
        job = {"strwgunsmith"},

    },
    bigvalleynative = {	   
        Pos = {x= -1842.61, y=426.53, z=114.68}, -- location weapon crafting station
        job = {"blackhawkshaman"},

    },
    blacksmith = {	   
        Pos = {x= -1828.47, y=-568.41, z=156.00}, -- location weapon crafting station
        job = {"blacksmith"},

    },
    armablacksmith = {	   
        Pos = {x= -3693.01, y=-2565.36, z=-13.61}, -- location weapon crafting station
        job = {"armablacksmith"},

    },
    macfarlansmith = {	   
        Pos = {x= -2401.61, y=-2381.74, z=61.19}, -- location weapon crafting station
        job = {"macfarlansmith"},

    },
    blacksmokeshaman = {	   
        Pos = {x= -2604.66, y=-29.90, z=160.62}, -- location weapon crafting station
        job = {"blacksmokeshaman"},

    },
    bubbablacksmith = {	   
        Pos = {x= -4828.58, y=-2675.14, z=-12.57}, -- location weapon crafting station
        job = {"bubbablacksmith"},

    },
    sdblacksmith = {	   
        Pos = {x= 2500.40, y=-1447.87, z=46.31}, -- location weapon crafting station
        job = {"sdblacksmith"},

    },
    bwblacksmith = {	   
        Pos = {x= -870.12, y=-1393.34, z=43.51}, -- location weapon crafting station
        job = {"bwblacksmith"},
    },
    valwahyashaman = {	   
        Pos = {x= -2389.05, y=-1165.1, z=158.2}, -- location weapon crafting station
        job = {"valwahyashaman"},

    },
    bloodcherokeetribe = {	   
        Pos = {x= -152.2 , y=1588.7, z=176.74}, -- location weapon crafting station
        job = {"bloodcherokeetribe"},

    },
    choctawshaman = {	   
        Pos = {x= 458.4 , y=1584.1, z= 201.05}, -- location weapon crafting station
        job = {"choctawshaman"},

    },
    --[[ regulators = {	   
        Pos = {x= -861.12, y=-733.33, z=59.71}, -- location weapon crafting station
        job = {"regulators"},

    }, ]]
    beanbounty = {	   
        Pos = {x= 1763.27, y=-466.42, z=45.73}, -- location weapon crafting station
        job = {"beanbounty"},

    },
    rhodesblacksmith = {	   
        Pos = {x= 1306.51, y=-1358.78, z=77.87}, -- location weapon crafting station
        job = {"rhodesblacksmith"},

    },
    pinkerton = {	   
        Pos = {x= 2700.36, y=-1196.93, z=60.28}, -- location weapon crafting station
        job = {"pinkerton"},

    },
}


