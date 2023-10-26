Config = {}

-- BLIPS --
Config.Blip 							= true 			-- Show blips on map
Config.BlipColor 						= true 			-- Show colored blips on map

-- BOAT --
Config.MapBoat_StDenis_Boats 			= true 			-- Show 3 boats on Port
Config.MapBoat_StDenis_Korrigan 		= true 			-- Show GrandKorrigan on Port
Config.MapBoat_VanHorn					= true			-- Show 1 boat on VanHorn
Config.MapBoat_ThievesLanding 			= true 			-- Show 1 boat on Thieves Landing
Config.MapBoat_HouseBoat 				= true 			-- Show 1 house boat on Bluewater Marsh

-- MAP --
Config.MapFog							= false 		-- Show fog on map

Config.MapColor							= true 			-- Show colored zones on map
Config.MapColor_Dark					= true			-- Active Dark Mode
Config.MapColor_Zones = {

-- Color list : red - Red - RED - green - Green - GREEN - blue - Blue - BLUE - pink - Pink - PINK - grey - Grey - GREY - cyan - yellow - orange - brown - purple - black - white

	-- NEW HANOVER --
	{ zone = 0x41332496, 			color = 'black'},	-- New Hanover Full int
	{ zone = 0x5CD2A36F, 			color = 'black'},	-- New Hanover Full ext	
	{ zone = 0x724E7654, 			color = 'green'},	-- The Heartlands    (West)
	{ zone = 0x30FAE29B, 			color = 'green'},	-- Roanoke Ridge  	 (East)	
	{ zone = 0x717F4A96, 			color = 'green'},  	-- Cumberland Forest (North)
	{ zone = 0x0079B7EE, 			color = 'black'}, 	-- Valentine Int
	{ zone = 0x2A24C8D9, 			color = 'black'}, 	-- Valentine Ext
	{ zone = 0x0A8B2CBE, 			color = 'black'}, 	-- Annesburg Int
	{ zone = 0x9CC09C3D, 			color = 'black'}, 	-- Annesburg Ext
	{ zone = 0x507B5360, 			color = 'black'}, 	-- Van Horn	Int
	{ zone = 0x194E52AF, 			color = 'black'}, 	-- Van Horn Ext
	{ zone = 0x6E7BDAC4, 			color = 'black'}, 	-- Emerald Ranch Int
	{ zone = 0x13A98173, 			color = 'black'},  	-- Emerald Ranch Ext
	{ zone = 0xA053D058, 			color = 'black'},	-- Hunter Butcher Camp	Int
	{ zone = 0xB6831F62, 			color = 'black'}, 	-- Hunter Butcher Camp	Ext
	{ zone = 0x7B23B4C7, 			color = 'black'}, 	-- Cornwall Kerosene Int
	{ zone = 0x150D72E9, 			color = 'black'}, 	-- Cornwall Kerosene Ext
	{ zone = 0x1BDD5A12, 			color = 'black'},	-- Fort Wallace Int
	{ zone = 0x2FE84F0E, 			color = 'black'}, 	-- Fort Wallace Ext
	
	-- AMBARINO --
	{ zone = 0x3B8DD21A, 			color = 'white'},	-- Ambarino Full Int
	{ zone = 0x3BBA228A, 			color = 'black'},	-- Ambarino Full Ext
	{ zone = 0xD41D039A, 			color = 'white'},   -- Grizzlies West Int
	{ zone = 0x943198D3, 			color = 'yellow'},	-- Grizzlies East Int
	{ zone = 0xBB785C8A, 			color = 'black'},	-- Wapiti Camp Int
	{ zone = 0x4F45BE43, 			color = 'black'}, 	-- Wapiti Camp Ext	

	-- WEST ELIZABETH --
	{ zone = 0xD69B5B49, 			color = 'Grey'},	-- West Elizabeth Full Int
	{ zone = 0xF030C0B2, 			color = 'black'},	-- West Elizabeth Full Ext
	{ zone = 0x763A8A87, 			color = 'white'},   -- Tall Tree	
	{ zone = 0x8DCC574F, 			color = 'white'}, 	-- Big Valley
	{ zone = 0x0E95FF51, 			color = 'white'},	-- Great Plains
	{ zone = 0x5647E155, 			color = 'black'},	-- Blackwater Int
	{ zone = 0x129E1411, 			color = 'black'}, 	-- Blackwater Ext	
	{ zone = 0x4663EEB9, 			color = 'black'}, 	-- Strawberry Int
	{ zone = 0x3B4A5D5B, 			color = 'black'}, 	-- Strawberry Ext	

	-- LEMOYNE --
	{ zone = 0x945395DF, 			color = 'black'}, 	-- Lemoyne Full Int
	{ zone = 0x0F32B44D, 			color = 'black'},	-- Lemoyne Full Ext	
	{ zone = 0x0BB92EEF, 			color = 'BLUE'}, 	-- Scarlett Meadows
	{ zone = 0x024C01CA, 			color = 'white'}, 	-- BlueWater Marsh East
	{ zone = 0x2843E325, 			color = 'white'}, 	-- Bayou
	{ zone = 0x9652B96E, 			color = 'black'}, 	-- Bayou Lagras Int
	{ zone = 0x049BBBD4, 			color = 'black'},  	-- Bayou Lagras Ext		
	{ zone = 0x2A6CBBA2, 			color = 'RED'}, 	-- Saint Denis Int
	{ zone = 0xC354EAC2, 			color = 'black'}, 	-- Saint Denis Ext	
	{ zone = 0xD3F2B8A7, 			color = 'black'}, 	-- Rhodes Int
	{ zone = 0x09FAE063, 			color = 'black'}, 	-- Rhodes Ext	
	{ zone = 0xD218D90D, 			color = 'black'},   -- Caliga Hall Int
	{ zone = 0xE074391B, 			color = 'black'},	-- Caliga Hall Ext
	{ zone = 0xFC531E7A, 			color = 'black'},	-- Braith Waite Manor Int
	{ zone = 0x5E68036B, 			color = 'black'}, 	-- Braith Waite Manor Ext
	{ zone = 0x2D1A7AF2, 			color = 'RED'},		-- Sisika Penitenciary

	-- NEW AUSTIN --
	{ zone = 0x41759831, 			color = 'grey'},    -- New Austin Full Int
	{ zone = 0xD339F6AB, 			color = 'black'},	-- New Austin Full Ext	
	{ zone = 0x3AC128F9, 			color = 'GREEN'},	-- TumbleWeed Gaptooth Ridge	
	{ zone = 0xD428627B, 			color = 'white'}, 	-- Rio Bravo
	{ zone = 0x99B6A1E6, 			color = 'white'}, 	-- Cholla Springs
	{ zone = 0x33D88587, 			color = 'RED'}, 	-- Hennigan's Stead

	-- GUARMA --
	{ zone = 0x9307FD41, 			color = 'Green'},   -- Guarma Full Int
	{ zone = 0x6009F334, 			color = 'black'}, 	-- Guarma Full Ext
	{ zone = 0x95B1E77A, 			color = 'black'}, 	-- Aguasdulces Int	
	{ zone = 0x90CA4AF8, 			color = 'white'}, 	-- Aguasdulces Ext	
	{ zone = 0x6E10D212, 			color = 'black'}, 	-- Village 1 Int
	{ zone = 0x21FE6ED8, 			color = 'white'}, 	-- Village 1 Ext
	{ zone = 0xBBB91AAD, 			color = 'black'}, 	-- Village 2 Int
	{ zone = 0x46837F42, 			color = 'white'}, 	-- Village 2 Ext
	{ zone = 0xC1C68746, 			color = 'black'}, 	-- Guarma Port Int
	{ zone = 0x703A27B1, 			color = 'white'} 	-- Guarma Port Ext

}

Config.Blips = {

	-- VALENTINE --
	{ txt = 'Church',  			sprite = 350569997,  	x = -226.00, 	y = 805.70, 	z = 124.00, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Cemetery', 		sprite = -1918326968,  	x = -236.662, 	y = 820.920, 	z = 123.13, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Sheriff',  		sprite = 1047294027,  	x = -276.212, 	y = 808.154, 	z = 118.38, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Doctor',  			sprite = -1739686743, 	x = -285.976, 	y = 814.638, 	z = 119.385, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Pharmacy',  		sprite = -695368421, 	x = -284.796, 	y = 806.558, 	z = 119.385, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_19'},
	{ txt = 'Gunshop',  		sprite = -145868367,   	x = -279.56,	y = 780.82, 	z = 119.38, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_2'},
	{ txt = 'Barber', 			sprite = -2090472724, 	x = -307.439, 	y = 813.439, 	z = 119.458, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	
	{ txt = 'Saloon',   		sprite = 1879260108,  	x = -308.760, 	y = 807.683, 	z = 118.98, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Bar',   			sprite = 1242464081,  	x = -240.794, 	y = 769.973, 	z = 118.085, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Hotel',   			sprite = -211556852, 	x = -322.151, 	y = 768.093, 	z = 117.45, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_29'},
	{ txt = 'Bank',   			sprite = 249721687, 	x = -306.18, 	y = 771.49, 	z = 118.70, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_11'},
	{ txt = 'Shop',    	    	sprite = 1475879922,  	x = -323.54,	y = 801.65, 	z = 117.88, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Stable',   		sprite = -1327110633, 	x = -369.153, 	y = 787.014, 	z = 116.17, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Forge', 			sprite = -758970771, 	x = -367.605,	y = 797.048, 	z = 115.20, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = -338.311,	y = 766.779, 	z = 115.54, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},
	{ txt = 'Cinema', 			sprite = 1364029453, 	x = -348.001,	y = 698.1026, 	z = 117.680, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_14'},
	{ txt = 'Post Office', 		sprite = 1861010125, 	x = -179.170, 	y = 626.322, 	z = 114.089, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},	
	{ txt = 'Farm', 			sprite = 552659337, 	x = -251.239,	y = 662.900, 	z = 112.38, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_19'},
	{ txt = 'Kerosen', 			sprite = 1242464081, 	x = 481.5174, 	y = 678.936, 	z = 117.307,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_PLAYER_COOP'},

	-- BLACKWATER --
	{ txt = 'Church', 			sprite = 350569997,  	x = -974.50, 	y = -1190.67, 	z = 63.00, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Cemetery', 	    sprite = -1918326968,  	x = -1003.020, 	y = -1191.523, 	z = 57.88, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Sheriff',  		sprite = 1047294027,  	x = -762.481, 	y = -1269.212, 	z = 44.00, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Saloon',  			sprite = 1879260108,  	x = -817.69, 	y = -1318.75, 	z = 44.00, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Office', 			sprite = 587827268, 	x = -875.04, 	y = -1332.64, 	z = 43.96, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Bank', 			sprite = 249721687, 	x = -816.09, 	y = -1273.27, 	z = 43.64, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_11'},
	{ txt = 'Shop', 			sprite = 1475879922, 	x = -783.237, 	y = -1324.441, 	z = 43.88, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Clothe',  			sprite = 1496995379,  	x = -761.187,	y = -1292.893, 	z = 44.050, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_6'},	
	{ txt = 'Stable',   		sprite = -1327110633, 	x = -868.446, 	y = -1366.557, 	z = 42.53, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = -751.03,	y = -1284.66, 	z = 43.00, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},
	{ txt = 'Barber', 			sprite = -2090472724, 	x = -815.85, 	y = -1364.77, 	z = 43.75, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Photographer', 	sprite = -1747825963, 	x = -813.74, 	y = -1373.95, 	z = 44.23, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},
	{ txt = 'Cinema', 			sprite = 1364029453, 	x = -782.302, 	y = -1362.656, 	z = 44.425, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_14'},
	{ txt = 'Port', 			sprite = 1106719664, 	x = -684.330, 	y = -1242.858, 	z = 42.11, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Port', 			sprite = 1106719664, 	x = -1175.410, 	y = -1970.239, 	z = 42.354, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},	

	-- STRAWBERRY --
	{ txt = 'Sheriff', 			sprite = 1047294027, 	x = -1811.456, 	y = -350.824, 	z = 163.66, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Doctor',  			sprite = -1739686743, 	x = -1805.795, 	y = -432.155, 	z = 157.83, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},	
	{ txt = 'Shop', 			sprite = 1475879922, 	x = -1791.972, 	y = -386.178, 	z = 160.33, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Hotel',   			sprite = -211556852, 	x = -1815.092, 	y = -370.767, 	z = 163.103, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_29'},
	{ txt = 'Stable',   		sprite = -1327110633, 	x = -1820.031, 	y = -561.573, 	z = 156.056, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Forge', 			sprite = -758970771, 	x = -1818.547,	y = -568.046, 	z = 155.975, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = -1753.14, 	y = -392.830,  	z = 156.24, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},
	{ txt = 'Post Office', 		sprite = 1861010125, 	x = -1764.46, 	y = -382.137, 	z = 156.74, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},		

	-- SAINT DENIS --	
	{ txt = 'Church',  			sprite = 350569997,  	x = 2751.879, 	y = -1271.527, 	z = 50.00, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Church',  			sprite = 350569997,  	x = 2829.886, 	y = -1107.761, 	z = 46.965, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_27'},	
	{ txt = 'Cemetery', 		sprite = -1918326968,  	x = 2725.274, 	y = -1067.401, 	z = 47.40, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Theater', 			sprite = -417940443,  	x = 2537.859, 	y = -1278.266, 	z = 49.21, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_14'},
	{ txt = 'Museum', 			sprite = -1747825963,   x = 2698.727, 	y = -1203.338, 	z = 56.469, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_14'},
	{ txt = 'Gunshop', 			sprite = -145868367, 	x = 2714.364, 	y = -1285.758, 	z = 49.630, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_2'},
	{ txt = 'Police', 			sprite = 1047294027, 	x = 2504.103, 	y = -1308.902, 	z = 48.953, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Doctor',  			sprite = -1739686743, 	x = 2731.634, 	y = -1231.251, 	z = 50.370, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Pharmacy',  		sprite = -695368421, 	x = 2719.931, 	y = -1229.883, 	z = 49.39, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_19'},
	{ txt = 'Post Office',		sprite = 1861010125, 	x = 2739.582, 	y = -1399.161, 	z = 49.281, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Saloon',			sprite = 1879260108,  	x = 2634.110, 	y = -1226.460, 	z = 53.380, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Bar',				sprite = 1242464081,  	x = 2795.697, 	y = -1167.255, 	z = 47.928, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Bar',				sprite = 1242464081,  	x = 2714.483, 	y = -1292.425, 	z = 47.928, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'}, 	-- Hide
	{ txt = 'Shop',				sprite = 1475879922,  	x = 2825.51, 	y = -1318.120, 	z = 46.75, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = 2817.849,	y = -1327.252, 	z = 46.554, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},	
	{ txt = 'Barber',			sprite = -2090472724, 	x = 2655.345, 	y = -1179.893, 	z = 53.278, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Bank', 			sprite = 249721687,  	x = 2644.65,	y = -1293.390, 	z = 52.50, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_11'},
	{ txt = 'Clothe',  			sprite = 1496995379,  	x = 2553.159,	y = -1164.131, 	z = 53.683, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Manor',  			sprite = -2024635066,  	x = 2401.438,	y = -1080.646, 	z = 49.424, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Manor',  			sprite = -2024635066,  	x = 2374.742,	y = -1216.324, 	z = 47.176, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Photographer', 	sprite = -1747825963, 	x = 2734.055, 	y = -1119.399, 	z = 49.101, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},
	{ txt = 'Stable',   		sprite = -1327110633, 	x = 2503.309, 	y = -1449.276, 	z = 46.312, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Forge', 			sprite = -758970771, 	x = 2514.022,	y = -1456.335, 	z = 46.312, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Dealer',			sprite = -426139257,  	x = 2857.589, 	y = -1199.023, 	z = 49.402, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Market',			sprite = 819673798,  	x = 2832.794, 	y = -1228.747, 	z = 47.658, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Paper', 			sprite = 587827268, 	x = 2674.918, 	y = -1403.515, 	z = 46.367, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Port', 			sprite = 1106719664, 	x = 2814.157, 	y = -1429.482, 	z = 44.470, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	
	-- RHODES --
	{ txt = 'Sheriff', 			sprite = 1047294027, 	x = 1360.531, 	y = -1301.544, 	z = 77.760, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Doctor',  			sprite = -1739686743, 	x = 1370.770, 	y = -1308.155, 	z = 77.970, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_21'},	
 	{ txt = 'Shop',				sprite =  1475879922,  	x = 1328.635, 	y = -1291.759, 	z = 77.024, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},   
	{ txt = 'Gunshop', 			sprite = -145868367, 	x = 1325.218, 	y = -1322.524, 	z = 77.890, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_2'},
	{ txt = 'Bank',   			sprite = 249721687, 	x = 1288.806, 	y = -1306.206, 	z = 77.040, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_11'},
	{ txt = 'Post Office', 		sprite = 1861010125, 	x = 1225.301, 	y = -1293.396, 	z = 76.908, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Saloon',  			sprite = 1879260108,  	x = 1341.903, 	y = -1375.073, 	z = 80.480, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Church',  			sprite = 350569997,  	x = 1289.135, 	y = -1224.367, 	z = 81.665, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Cemetery', 		sprite = -1918326968,  	x = 1272.953, 	y = -1227.298, 	z = 80.67, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Stable',   		sprite = -1327110633, 	x = 1435.694, 	y = -1293.921, 	z = 77.821, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Manor',  			sprite = -2024635066,  	x = 1011.135,	y = -1770.407, 	z = 47.581, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Manor',  			sprite = -2024635066,  	x = 1897.848,	y = -1863.580, 	z = 43.148, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = 1297.426,	y = -1277.641, 	z = 75.877, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},

	-- ANNESBURG --	
	{ txt = 'Sheriff',  		sprite = 1047294027,  	x = 2906.844, 	y = 1311.977, 	z = 44.938, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Gunshop',  		sprite = -145868367,   	x = 2946.857,	y = 1319.255, 	z = 45.865, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_2'},	
	{ txt = 'Hotel',   			sprite = -211556852, 	x = 2948.909, 	y = 1332.297, 	z = 44.444, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_29'},
	{ txt = 'Post Office', 		sprite = 1861010125, 	x = 2939.462, 	y = 1290.162, 	z = 44.652, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},	
	{ txt = 'Port', 			sprite = 1106719664, 	x = 3017.445, 	y = 1350.183, 	z = 43.664, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},

	-- VAN HORN --	
	{ txt = 'Port', 			sprite = 1106719664, 	x = 3008.922, 	y = 477.003, 	z = 41.858, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},
	{ txt = 'Saloon',   		sprite = 1879260108,  	x = 2945.408, 	y = 523.367, 	z = 45.000, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Hotel',   			sprite = -211556852, 	x = 2982.229, 	y = 572.869, 	z = 44.613, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_29'},
	{ txt = 'Post Office',		sprite = 1861010125, 	x = 2985.729, 	y = 567.280, 	z = 44.627, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Shop',				sprite =  1475879922,  	x = 3025.495, 	y = 562.751, 	z = 44.721, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Coach',   			sprite = -361388975, 	x = 2933.099, 	y = 560.809, 	z = 44.952, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Stable',   		sprite = -1327110633, 	x = 2964.204, 	y = 796.223, 	z = 51.402, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},

	-- ARMADILLO --	
	{ txt = 'Sheriff',  		sprite = 1047294027,  	x = -3620.955, 	y = -2603.387, 	z = -13.341, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_6'},	
	{ txt = 'Saloon',   		sprite = 1879260108,  	x = -3705.136, 	y = -2595.335, 	z = -13.319, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Bank',  			sprite = 249721687,  	x = -3665.027,	y = -2629.892, 	z = -13.587, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_11'},
	{ txt = 'Shop', 			sprite =  1475879922,  	x = -3684.308, 	y = -2625.664, 	z = -13.431, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Stable',   		sprite = -1327110633,  	x = -3703.060, 	y = -2559.904, 	z = -13.607, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Chicken',   		sprite = -1852063472,  	x = -3674.971, 	y = -2544.974, 	z = -13.710, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Church',  			sprite = 350569997,  	x = -3604.592, 	y = -2648.311, 	z = -10.665, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Cemetery', 		sprite = -1918326968,  	x = -3614.189, 	y = -2661.027, 	z = -12.020, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},

	-- TUMBLEWEED --
	{ txt = 'Saloon',   		sprite = 1879260108,  	x = -5514.201, 	y = -2910.505, 	z = -1.731, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_4'},
	{ txt = 'Sheriff',  		sprite = 1047294027,  	x = -5531.167, 	y = -2924.470, 	z = -1.360, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_6'},
	{ txt = 'Hotel',   			sprite = -211556852, 	x = -5514.896, 	y = -2970.028, 	z = 2.224, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_29'},
	{ txt = 'Gunshop', 			sprite = -145868367, 	x = -5507.782, 	y = -2965.712, 	z = -0.631, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_2'},
	{ txt = 'Shop', 			sprite =  1475879922,  	x = -5487.094, 	y = -2937.206, 	z = 0.632, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Butcher', 			sprite = 1369919445, 	x = -5511.025,	y = -2947.074, 	z = -1.891, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_30'},	
	{ txt = 'Stable',   		sprite = -1327110633, 	x = -5518.739, 	y = -3044.859, 	z = -2.387, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Farm',   			sprite = 552659337,  	x = -5199.053, 	y = -2154.471, 	z = 12.067, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_19'},
	{ txt = 'Church',  			sprite = 350569997,  	x = -5433.918, 	y = -2919.660, 	z = 0.940, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_27'},
	{ txt = 'Cemetery', 		sprite = -1918326968,  	x = -5452.058, 	y = -2915.486, 	z = 0.797, 		scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Ranch', 			sprite = 564457427, 	x = -4814.966, 	y = -2712.106, 	z = -13.530,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'},

	-- THIEVES LANDING --
	{ txt = 'Port', 			sprite = 1106719664, 	x = -1373.057, 	y = -2313.572, 	z = 42.152, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_21'},

	--  EMERALD RANCH --
	{ txt = 'Post Office', 		sprite = 1861010125, 	x = 1522.006, 	y = 442.694, 	z = 90.678, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},
	{ txt = 'Farm', 			sprite = 552659337, 	x = 1422.276,	y = 314.865, 	z = 87.500, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_19'},
	{ txt = 'Field', 			sprite = 669307703, 	x = 1127.643, 	y = 458.269, 	z = 96.638,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	

	--  RANCH MACFARLEN'S  --
	{ txt = "Forge", 			sprite = -758970771, 	x = -2397.781,	y = -2380.204, 	z = 61.193, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = "Chicken", 			sprite = -1852063472, 	x = -2420.277,	y = -2432.151, 	z = 60.253, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = "Station", 			sprite = -250506368, 	x = -2505.809,	y = -2413.721, 	z = 60.209, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- MacFarlen's

	-- STATION --
	{ txt = 'Station', 			sprite = -250506368, 	x = -3748.703, 	y = -2565.422, 	z = -13.640, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Armadillo	
	{ txt = 'Station', 			sprite = -250506368, 	x = -5234.758, 	y = -3475.831, 	z = -21.205, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Tumbleweed Benedict Point
	{ txt = 'Station', 			sprite = -250506368, 	x = 1221.000, 	y = -1305.423, 	z = 76.441, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Rhodes Station		
	{ txt = 'Station', 			sprite = -250506368, 	x = -163.848,	y = 627.471, 	z = 113.515, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Valentine	
	{ txt = 'Station', 			sprite = -250506368, 	x = 2963.096, 	y = 1293.882, 	z = 43.906, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Annesburg	
	{ txt = 'Station', 			sprite = -250506368, 	x = 2890.854, 	y = 627.367, 	z = 56.175, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},   -- Van Horn	
	{ txt = 'Station',			sprite = -250506368,  	x = 2729.046, 	y = -1460.327, 	z = 45.900, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},   -- Saint Denis Station	
	{ txt = 'Station', 			sprite = -250506368, 	x = 1529.935,	y = 439.838, 	z = 90.680, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Emerald Station
	{ txt = 'Station', 			sprite = -250506368, 	x = 487.386,	y = 655.151, 	z = 115.673, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Kerosen Station	
	{ txt = 'Station', 			sprite = -250506368, 	x = -1302.674,	y = 416.705, 	z = 94.805, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Wallace Station
	{ txt = 'Station', 			sprite = -250506368, 	x = -337.817,	y = -348.331, 	z = 87.706, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Flatneck Station
	{ txt = 'Station', 			sprite = -250506368, 	x = 591.535,	y = 1695.074, 	z = 187.579, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Bacchus Station
	{ txt = 'Station', 			sprite = -250506368, 	x = -1099.866,	y = -581.011, 	z = 81.819, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Riggs Station

	--  FORT  --
	{ txt = 'Fort', 			sprite = 2113496404, 	x = 347.894, 	y = 1491.018, 	z = 179.557, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},  	-- Fort Wallace
	{ txt = 'Fort', 			sprite = 2113496404, 	x = -4211.138, 	y = -3446.471, 	z = 37.08, 		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_26'},	-- Fort Mercer

	--  CAMP  --
	{ txt = 'Camp ', 			sprite = -132369645, 	x = 447.57, 	y = 2241.65, 	z = 248.52, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_19'}, 	-- Wapiti
	{ txt = 'Camp ', 			sprite = 423351566, 	x = 2550.869, 	y = 787.289, 	z = 76.376, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_19'},	-- Hunter Butcher
	{ txt = 'Camp ', 			sprite = 1904459580, 	x = -1412.629, 	y = -248.144, 	z = 99.905, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_19'},	-- Lumberjack

	--  MINE  --
	{ txt = 'Mine', 			sprite = -243818172, 	x = 2748.418, 	y = 1321.270, 	z = 69.5,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Annesburg
	{ txt = 'Mine', 			sprite = -243818172, 	x = -5964.052, 	y = -3210.251, 	z = -21.499,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Tumbleweed
	{ txt = 'Mine', 			sprite = -243818172, 	x = -1404.359, 	y = 1156.740, 	z = 226.081,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Strawberry

	--  CAVE  --
	{ txt = 'Cave',				sprite = 1735233562, 	x = -2322.686, 	y = 89.170, 	z = 221.270,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Cave', 			sprite = 1735233562, 	x = -1517.349, 	y = 723.020, 	z = 126.755,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Cave', 			sprite = 1735233562, 	x = -2656.078, 	y = 698.284, 	z = 181.469,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},
	{ txt = 'Cave', 			sprite = 1735233562, 	x = 2321.126, 	y = 1439.655, 	z = 85.863,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Dutch Plank
	{ txt = 'Cave', 			sprite = 1735233562, 	x = 2352.966, 	y = 1001.072, 	z = 73.184,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Elysian Pool	
	{ txt = 'Cave', 			sprite = 1735233562, 	x = 803.782, 	y = 1921.919, 	z = 256.163,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Grizzlies East
	{ txt = 'Cave', 			sprite = 1735233562, 	x = 1701.353, 	y = 2177.038, 	z = 323.576,	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'}, 	-- Grizzlies East Giant
	{ txt = 'Ruin',				sprite = 1735233562, 	x = 2388.291, 	y = 1690.029, 	z = 96.600,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},	-- Ruin Viking

	--  BRIDGE  --
	{ txt = 'Bridge',  			sprite = 1258184551,  	x = -700.759, 	y = -532.800, 	z = 75.893, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},	
	{ txt = 'Bridge',  			sprite = 1258184551,  	x = -319.216, 	y = 1521.965, 	z = 162.84, 	scale = 0.1, 	 		color = 'BLIP_MODIFIER_MP_COLOR_32'},
	{ txt = 'Bridge',  			sprite = 1258184551,  	x = 516.922, 	y = 1757.459, 	z = 187.63,  	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'},

	--  TOWER  --
	{ txt = 'Tower', 			sprite = -1018697504, 	x = 2520.876, 	y = 2301.450, 	z = 176.0,		scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'},   -- Tesla Tower
	{ txt = 'Tower', 			sprite = -2018361632, 	x = 3035.500, 	y = 432.000, 	z = 67.500, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_17'},   -- Van Horn	Beacon

	-- BOAT --
	{ txt = 'Boat', 			sprite = -1018164873, 	x = 2872.3581, 	y = -1404.876, 	z = 62.319, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'}, 	-- GrandKerrigan	
	{ txt = 'Boat', 			sprite = -1018164873, 	x = -1353.432, 	y = -2297.478, 	z = 43.407, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'}, 	-- Thieves Landing
	{ txt = 'Boat', 			sprite = -1018164873, 	x = 2308.535, 	y = -331.168, 	z = 41.898, 	scale = 0.1, 			color = 'BLIP_MODIFIER_MP_COLOR_32'}, 	-- HouseBoat
}