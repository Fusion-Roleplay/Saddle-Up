
Config = {}

Config.defaultlang = "en" -- Default language

Config.Key = 0x760A9C6F --{g}
Config.Menu = 0xC7B5340A --{Enter}
Config.KeyLeft = 0xA65EBAB4 --{a}
Config.KeyRight = 0xDEB34313 --{d}

Config.StartKey = 0x760A9C6F --{g}
Config.PaketButton = 0xC7B5340A --{Enter}

Config.NotifyDict = "BLIPS"
Config.NotifyTexture = "blip_chest"
Config.NotifyColor = "COLOR_ORANGEDARK"
Config.NotifyTime = 5000

Config.AfkTimer = 3  --min
Config.VehicleTimer = 30 --min
Config.disableRunning = true
Config.EnableMaxVehSpeed = true
Config.MaxVehicleSpeed = 20

Config.DisableCinematicMode = true
Config.EnableVehicleBlip = true
Config.Vehicleplipsprite = 1612913921

Config.PostOffices = {
    [1] = {
      Name = "Valentine's Postoffice",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { -174.41, 633.3, 114.09, 1.0 },
      NPC = true,
      NPCOffice = { -175.44, 631.87, 113.09, 322.36 },
      VehicleSpawn = { -195.84, 639.74, 113.22, 328.75 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "House of Dr. Emmett Brown",
          Pos = { -263.39, 762.31, 118.15 },
          Money = { 40, 100 },
        },
        {
          Name = "Sheriff's office",
          Pos = { -279.7, 802.49, 119.39 },
          Money = { 40, 100 },
        },
        {
          Name = "Bank",
          Pos = { -308.41, 775.95, 118.7 },
          Money = { 40, 100 }, 
        },
        {
          Name = "Stall",
          Pos = { -365.9, 793.11, 116.17 },
          Money = { 40, 100 },   
        },
        {
          Name = "Clothing Store",
          Pos = { -323.65, 773.27, 117.44 },
          Money = { 40, 100 }, 
        },
        {
          Name = "General Store",
          Pos = { -323.18, 801.71, 117.88 },
          Money = { 40, 100 },   
        },
        {
          Name = "Doctor's Office",
          Pos = { -286.23, 804.69, 119.39 },
          Money = { 40, 100 },
        },
        {
          Name = "Saloon",
          Pos = { -311.56, 805.84, 118.98 },
          Money = { 40, 100 },  
        },
        {
          Name = "Church",
          Pos = { -232.36, 797.26, 124.63 },
          Money = { 40, 100 },  
        },
        {
          Name = "House of Jesse Boone",
          Pos = { -285.32, 869.18, 121.14 },
          Money = { 40, 100 },
            
        },
        {
          Name = "Tailor",
          Pos = { -335.72, 798.97, 117.15 },
          Money = { 40, 100 },
            
        },
      }
    },
    [2] = {
      Name = "Saint Denis Postoffice",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { 2749.67, -1399.63, 46.19, 1.0 },
      NPC = false,
      NPCOffice = { 2748.83, -1398.31, 45.18, 207.64 },
      VehicleSpawn = { 2748.8, -1406.3, 46.1, 120.21 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Gun Store",
          Pos = { 2715.26, -1285.99, 49.63 },
          Money = { 40, 100 },  
        },
        {
          Name = "barbershop",
          Pos = { 2651.82, -1180.36, 53.28 },
          Money = { 40, 100 },
        },
        {
          Name = "Clothing Store",
          Pos = { 2552.43, -1166.51, 53.68 },
          Money = { 40, 100 },
        },
        {
          Name = "Stall",
          Pos = { 2511.41, -1459.2, 46.31 },
          Money = { 40, 100 },
        },
        {
          Name = "General Store",
          Pos = { 2822.78, -1317.21, 46.76 },
          Money = { 40, 100 },
        },
        {
          Name = "Doctor's Office",
          Pos = { 2719.57, -1231.86, 50.37 },
          Money = { 40, 100 },
        },
        {
          Name = "Butcher",
          Pos = { 2813.01, -1329.18, 46.44 },
          Money = { 40, 100 }, 
        },
        {
          Name = "Saloon",
          Pos = { 2637.98, -1228.0, 53.38 },
          Money = { 40, 100 },
        },
        {
          Name = "Government",
          Pos = { 2401.32, -1096.19, 47.42 },
          Money = { 40, 100 },
        },
        {
          Name = "Theater",
          Pos = { 2549.84, -1286.31, 49.22 },
          Money = { 40, 100 },
        },
        {
          Name = "Sheriff´s Office",
          Pos = { 2511.93, -1308.83, 48.95 },
          Money = { 40, 100 },
        },
        {
          Name = "Bank",
          Pos = { 2642.71, -1296.8, 52.25 },
          Money = { 40, 100 },
        }
      }
    },
    [3] = {
      Name = "Strawberry's Postoffice",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { -1781.05, -359.93, 161.24, 1.0 },
      NPC = false,
      NPCOffice = { -1781.05, -359.93, 161.24, 1.0 },
      VehicleSpawn = { -1790.01, -366.54, 160.96, 52.14 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Sheriff´s Office",
          Pos = { -1804.97, -349.93, 164.15 },
          Money = { 40, 100 },
        },
        {
          Name = "Registry Office",
          Pos = { -1817.22, -370.81, 163.3 },
          Money = { 40, 100 },
        },
        {
          Name = "Hunting Company",
          Pos = { -1774.8, -437.98, 155.03 },
          Money = { 40, 100 },
        },
        {
          Name = "Stall",
          Pos = { -1811.99, -559.47, 155.99 },
          Money = { 40, 100 },
        },
        {
          Name = "Generalstore",
          Pos = { -1791.06, -385.63, 160.33 },
          Money = { 40, 100 },
        },
        {
          Name = "Doctor's Office",
          Pos = { -1804.2, -429.37, 158.83 },
          Money = { 40, 100 },
        },
        {
          Name = "Butcher",
          Pos = { -1752.05, -387.01, 156.5 },
          Money = { 40, 100 },
        },
        {
          Name = "Tool maker",
          Pos = { -1820.03, -421.72, 159.99 },
          Money = { 40, 100 },
        },
        {
          Name = "Colorful House",
          Pos = { -1682.79, -341.51, 173.92 },
          Money = { 40, 100 },
        }
      }
    },
    [4] = {
      Name = "Annesburg's Postoffice",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { 2931.35, 1365.75, 45.19, 1.0 },
      NPC = false,
      NPCOffice = { 2931.35, 1365.75, 45.19, 1.0 },
      VehicleSpawn = { 2936.53, 1362.01, 43.99, 160.96 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Sheriff's Office",
          Pos = { 2913.09, 1311.3, 44.59 },
          Money = { 40, 100 },
        },
        {
          Name = "Workers' House",
          Pos = { 2906.77, 1341.64, 48.15 },
          Money = { 40, 100 },
        },
        {
          Name = "Mining Office",
          Pos = { 2920.32, 1378.81, 56.26 },
          Money = { 40, 100 },
        },
        {
          Name = "Armourer",
          Pos = { 2946.66, 1320.02, 44.82 },
          Money = { 40, 100 },
        },
        {
          Name = "Butcher",
          Pos = { 2937.75, 1306.24, 44.48 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Blacksmith",
          Pos = { 2877.66, 1368.75, 62.92 },
          Money = { 40, 100 },
        },
        {
          Name = "Workers' House",
          Pos = { 2856.91, 1364.73, 65.71 },
          Money = { 40, 100 },
        },
        {
          Name = "Wood processors",
          Pos = { 2866.62, 1448.52, 69.12 },
          Money = { 40, 100 }, 
        },
        {
          Name = "Mine storage",
          Pos = { 2799.82, 1350.15, 73.13 },
          Money = { 40, 100 }, 
        },
        {
          Name = "Mines Entrance",
          Pos = { 2762.01, 1336.28, 70.1 },
          Money = { 40, 100 }, 
        }
      }
    },
    [5] = {
      Name = "Blackwater's Office",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { -877.45, -1343.69, 43.29, 1.5 },
      NPC = true,
      NPCOffice = { -877.1, -1341.76, 42.29, 189.25 },
      VehicleSpawn = { -875.34, -1348.72, 43.31, 270.54 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Pier",
          Pos = { -736.93, -1253.96, 44.73 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Barbershop",
          Pos = { -814.22, -1365.03, 43.75 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Clothing Store",
          Pos = { -765.01, -1291.15, 43.83 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Stall",
          Pos = { -855.84, -1370.49, 43.6 },
          Money = { 40, 100 },
          
        },
        {
          Name = "General Store",
          Pos = { -787.62, -1322.04, 43.88 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Church",
          Pos = { -974.49, -1180.36, 58.63 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Dona Singular's House",
          Pos = { -1022.46, -1625.01, 79.02 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Camp",
          Pos = { -935.1, -1396.88, 50.63 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Prof. Dr. Picock's House",
          Pos = { -805.54, -1501.48, 63.5 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Mister Bruton's House",
          Pos = { -877.82, -1643.38, 69.18 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Government",
          Pos = { -798.65, -1202.58, 44.19 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Bank",
          Pos = { -816.18, -1277.43, 43.64 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Saloon",
          Pos = { -819.03, -1316.2, 43.68 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Imperial Theater",
          Pos = { -788.55, -1363.29, 43.82 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Mister Delaqua",
          Pos = { -877.42, -1417.95, 45.14 },
          Money = { 40, 100 },
          
        },
        {
          Name = "carpenter",
          Pos = { -868.83, -1294.56, 43.56 },
          Money = { 40, 100 },
        }
      }
    },
    [6] = {
      Name = "Rhodes Postoffice",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { 1231.41, -1299.7, 76.9, 1.5 },
      NPC = false,
      NPCOffice = { 1230.21, -1298.55, 76.9, 222.91 },
      VehicleSpawn = { 1266.47, -1295.88, 75.67, 325.11 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Mister Gongdungs House",
          Pos = { 1394.69, -1135.11, 76.55 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Hinterwäldler House",
          Pos = { 1297.02, -1144.56, 82.18 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Church",
          Pos = { 1284.24, -1223.88, 82.56 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Sheriff's Office",
          Pos = { 1357.94, -1306.09, 77.72 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Bank",
          Pos = { 1286.19, -1303.01, 77.04 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Toolmaker",
          Pos = { 1339.33, -1263.18, 77.87 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Armourer",
          Pos = { 1322.65, -1319.56, 77.89 },
          Money = { 40, 100 },
          
        },
        {
          Name = "General store",
          Pos = { 1330.13, -1291.63, 77.02 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Doctor's Office",
          Pos = { 1370.64, -1306.87, 77.97 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Stall",
          Pos = { 1429.35, -1299.81, 77.82 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Salt refinery",
          Pos = { 1399.51, -1286.49, 78.18 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Parlour House",
          Pos = { 1431.67, -1371.01, 81.75 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Saloon",
          Pos = { 1341.97, -1374.63, 80.48 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Braithwaite Manor",
          Pos = { 1010.24, -1760.51, 47.61 },
          Money = { 80, 200 },
          
        }
      }
    },
    [8] = {
      Name = "Armadillo's Office",
      Blip = true,
      BlipIcon = 1861010125,
      EnterOffice = { -3729.01, -2603.13, -13.92, 2.0 },
      NPC = true,
      NPCOffice = { -3729.10, -2601.12, -12.94, 177.52 },
      VehicleSpawn = { -3721.3, -2617.73, -14.39, 274.50 },
      NPCModel = "A_M_M_MIDDLESDTOWNFOLK_01",
      JobZones = {
        {
          Name = "Kayla singular's house",
          Pos = { -3621.53, -2612.85, -14.6 },
          Money = { 40, 100 },
          
        },
        {
          Name = "Sheriff's office",
          Pos = { -3622.66, -2600.87, -14.35 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The bank",
          Pos = { -3662.62, -2623.25, -14.56 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The Cemetery",
          Pos = { -3309.67, -2854.24, -7.08 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The Church",
          Pos = { -3610.45, -2643.2, -11.65 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The general store",
          Pos = { -3689.43, -2629.58, -14.39 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The Blacksmith",
          Pos = { -3683.82, -2564.53, -14.55 },
          Money = { 40, 100 },
          
        },
        {
          Name = "The saloon",
          Pos = { -3707.57, -2592.56, -14.3 },
          Money = { 40, 100 },
          
        }
      }
    },
}
