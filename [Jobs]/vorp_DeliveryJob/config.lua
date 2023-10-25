Config = { }

-- Language
Config.Locale = "en"

-- Blips
Config.MainSprite = 486881925 -- Job Blip sprite
Config.DeliverySprite = -570710357 -- Point Sprite
Config.ShowBlips = true -- Show Point blips

-- Timer and zone size
Config.ZoneSize = 2.0 -- Sizes of the zones
Config.TimeLimit = 800000

Config.Jobs = {
	-- Valentine to MacFarland Ranch
	{
		stationName = "Valentine Station.",
		destination = "MacFarland Ranch Station.",
		startPoint = vector3(-179.51,627.02,114.09),
		endPoint = vector3(-2333.03,-2418.96,62.00),
		cartSpawn = vector4(-179.88,653.84,113.67,69.1),
		payout =
		{
			cash = 24.75,
			gold = 0,
			experience = 100
		}
	},
	-- MacFarland Ranch to Armadillo
	{
		stationName = "MacFarland Ranch Station.",
		destination = "Armadillo Station.",
		startPoint = vector3(-2324.89,-2406.17,63.85),
		endPoint = vector3(-3686.81,-2627.33,-13.43),
		cartSpawn = vector4(-2342.75,-2396.24,62.37,140.24),
		payout =
		{
			cash = 6.0,
			gold = 0,
			experience = 100
		}
	},
	-- Armadillo to Blackwater
	{
		stationName = "Armadillo Station.",
		destination = "Blackwater Station.",
		startPoint = vector3(-3672.91,-2600.51,-13.27),
		endPoint = vector3(-799.72,-1323.52,43.69),
		cartSpawn = vector4(-3673.27,-2611.24,-14.03,265.96),
		payout =
		{
			cash = 18.25,
			gold = 0,
			experience = 100
		}
	},
	-- Blackwater to Strawberry
	{
		stationName = "Blackwater Station.",
		destination = "Strawberry Station.",
		startPoint = vector3(-778.33,-1323.44,43.88),
		endPoint = vector3(-1789.4,-376.68,159.1),
		cartSpawn = vector4(-772.71,-1331.18,46.64,92.45),
		timeLimit = 180000,
		payout =
		{
			cash = 5.5,
			gold = 0,
			experience = 100
		}
	},
	-- Strawberry to Saint Denis
	{
		stationName = "Strawberry Station.",
		destination = "St. Denis Station.",
		startPoint = vector3(-1775.49,-437.34,155.08),
		endPoint = vector3(2496.60,-1233.28,49.23),
		cartSpawn = vector4(-1778.50,-428.69,154.86,17.51),
		payout =
		{
			cash = 21.25,
			gold = 0,
			experience = 100
		}
	},
	-- Saint Denis to Annesburg
	{
		stationName = "St. Denis Station.",
		destination = "Annesburg Station.",
		startPoint = vector3(2530.21,-1202.29,53.73),
		endPoint = vector3(2928.04,1303.65,44.48),
		cartSpawn = vector4(2496.87,-1208.966,49.23,2.03),
		payout =
		{
			cash = 17.5,
			gold = 0,
			experience = 100
		}
	},
	-- Annesburg to Emerald Ranch
	{
		stationName = "Annesburg Station.",
		destination = "Emerald Ranch Station.",
		startPoint = vector3(2939.25,1288.65,44.65),
		endPoint = vector3(1420.15,383.93,90.33),
		cartSpawn = vector4(2923.16,1291.9,44.39,154.38),
		payout =
		{
			cash = 9.5,
			gold = 0,
			experience = 100
		}
	},
	-- Emerald Ranch to Wapiti Indian reservation
	{
		stationName = "Emerald Ranch Station.",
		destination = "Wapiti Station.",
		startPoint = vector3(1458.86,320.30,90.60),
		endPoint = vector3(451.65,2234.67,247.61),
		cartSpawn = vector4(1418.35,317.60,88.53,100.03),
		payout =
		{
			cash = 15.0,
			gold = 0,
			experience = 100
		}
	},
	-- Wapiti Indian Reservation to Valentine
	{
		stationName = "Wapiti Station.",
		destination = "Valentine Station.",
		startPoint = vector3(454.34,2213.01,246.18),
		endPoint = vector3(-232.15,598.90,112.24),
		cartSpawn = vector4(462.66,2213.19,246.31,200.28),
		payout =
		{
			cash = 12.5,
			gold = 0,
			experience = 100
		}
	},
}
