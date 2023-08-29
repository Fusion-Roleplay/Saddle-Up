
Config = {}
-- Object buttons (when you are close to the object)
-- DO NOT TRANSLATE the second parameter.
Config.groups = {
	{
		name = "Animals",
		actions = {
			{"Cows", "1"},
			{"Chickens", "2"},
			{"Sheeps", "3"},
			--{"Close", "4"}
		}
	},
    {
        name = "Cows",
        actions = {
            {"Brown and White", "cows1"},
			{"White and Black", "cows2"},
			{"Light Brown", "cows3"},
			{"Dark Brown", "cows4"},
        }
    },
	{
		name = "Chickens",
		actions = {
			{"Chicken", "chicken1"},
			{"Rooster", "chicken2"},
			{"White", "chicken3"},
		}
	},
	{
		name = "Sheep",
		actions = {
			{"White", "sheep1"},
			{"Black (pink)", "sheep2"},
			{"White (black)", "sheep3"},
			{"Grey", "sheep4"},
		}
	},
	{
		name = "Interactions",
		actions = {
			{"Collect", "care1"},
			{"Follow", "care2"},
			{"Stop", "care3"},
			{"Next", "care4"},
		}
	},
	{
		name = "Interactions",
		actions = {
			{"Breeding", "care5"},
			{"Sell", "care6"},
			{"Stats", "care7"},
			{"Back", "care8"},
		}
	},
	{
		name = "Ranch Menu", -- 7
		actions = {
			{"Hire", "rm1"},
			{"Fire", "rm2"},
			{"Verify", "rm3"},
			{"Next", "rm4"},
		}
	},
	{
		name = "Ranch Menu", -- 8
		actions = {
			{"Transfer", "rm5"},
			{"Sell", "rm6"},
			{"Fire All", "care7"},
			{"Back", "rm8"},
		}
	},
	{
		name = "Water", -- 9
		actions = {
			{"Chickens", "wt1"},
			{"Cows", "wt2"},
			{"Sheep", "wt3"},
		}
	},
	{
		name = "Hay Bales", -- 10
		actions = {
			{"Fill", "hb1"},
			{"Check", "hb2"},
			{"Distribute", "hb3"},
		}
	},
	{
		name = "Clean", -- 11
		actions = {
			{"Chickens", "cl1"},
			{"Cows", "cl2"},
			{"Sheep", "cl3"},
			{"Ranch", "cl4"},
		}
	},
	{
		name = "Food", -- 12
		actions = {
			{"Chickens", "fd1"},
			{"Cows", "fd2"},
			{"Sheep", "fd3"},
		}
	},
	{
		name = "Tasks", -- 13
		actions = {
			{"Water", "task1"},
			{"Hay Bales", "task2"},
			{"Clean", "task3"},
			{"Food", "task4"},
		}
	},

}

-- Controls order for the menu.
Config.controlsorder = {
    0x05CA7C52,
    0x6319DB71,
    0xA65EBAB4,
    0xDEB34313,
}

Config.EnableBlips = true

Config.Blips = {
	{ coords = {x = -270.2708, y = 660.2669, z = 113.4008}, h = 0.0, name = "Animal Store"},
	{ coords = { x= -249.25149536133, y = 686.17114257813, z = 113.32793426514}, h = 0.0, name = "Ranch Boss Menu"},
	{ coords = {x = -235.24984741211, y = 658.04577636719, z = 113.31753540039}, h = 0.0, name = "Cows Care"},
	{ coords = {x = -249.01866149902, y = 671.41131591797, z = 113.32555389404}, h = 0.0, name = "Chickens Care"},
	{ coords = {x = -224.56852722168, y = 659.59460449219, z = 113.32586669922}, h = 0.0, name = "Sheep Care"},
	{ coords = {x = -230.30833435059, y = 655.42449951172, z = 113.30979919434}, h = 0.0, name = "Hay Bales"},
	{ coords = {x = -234.13989257813, y = 653.50927734375, z = 113.2840423584}, h = 0.0, name = "Clean Ranch"},
}


Config.Stores = {
	{ coords = {x = -270.2708, y = 660.2669, z = 113.4008}, h = 0.0, name = "Animal Store"},
}

Config.Ranches = {
	{
		coords = {x = -249.25149536133, y = 686.17114257813, z = 113.32793426514}, h = 0.0, ranchid = 1,
		name = "Ranch", ranchtype = "ranch", price = 10000,
		zones = { 
			{	name = "cows",
				coords = {xmin = -245.23, xmax = -227.62, ymin = 663.50, ymax = 675.166},
				animalLimit = 31,
				care = {
					coords = { x = -235.24984741211, y = 658.04577636719, z = 113.31753540039 }, h = 0.0, name = "Take Care",
					depositmax = 10, depositprice = 100, depositmodel = "prop_watercooler",
					depositmodelanim = "pickup_object",
					depositmodelanimdict = "pickup_object", depositmodelanimtime = 1000,
				},
			},
			{   name = "chickens",
				coords = {xmin = -260.57, xmax = -237.20, ymin = 673.00, ymax = 675.16},
				animalLimit = 31,
				care = {
					coords = { x = -249.01866149902, y = 671.41131591797, z = 113.32555389404 }, h = 0.0, name = "Take Care",
					depositmax = 10, depositmodel = "prop_watercooler",
					depositmodelanim = "pickup_object",
					depositmodelanimdict = "pickup_object", depositmodelanimtime = 1000,
				},
			},
			{   name = "sheep",
				coords = {xmin = -234.50, xmax = -215.67, ymin = 652.59, ymax = 658.14},
				animalLimit = 31,
				care = {
					coords = { x = -224.56852722168, y = 659.59460449219, z = 113.32586669922 }, h = 0.0, name = "Take Care",
					depositmax = 10, depositmodel = "prop_watercooler",
					depositmodelanim = "pickup_object", 
					depositmodelanimdict = "pickup_object", depositmodelanimtime = 1000,
				},
			},	
		},
		stats = {
			{   name = "Hay Bales",
				coords = { x = -230.30833435059, y = 655.42449951172, z = 113.30979919434 }, h = 0.0, task = "Hay Bales",
				depositmax = 1000, depositmodel = "prop_bales_02",
				itemrequiered = "haybales", itemrequieredamount = 1,
				itemreward = "", itemrewardamount = 0,
				depositmodelanim = "pickup_object", 
				depositmodelanimdict = "pickup_object", depositmodelanimtime = 1000,
			},
			{	name = "Clean",
				coords = {  x = -234.13989257813, y = 653.50927734375, z = 113.2840423584 }, h = 0.0, task = "Clean",
				depositmax = 1000, depositmodel = "prop_cs_burger_01",
				itemrequiered = "tool", itemrequieredamount = 1,
				itemreward = "shitToFertilizer", itemrewardamount = 1,
				depositmodelanim = "pickup_object", 
				depositmodelanimdict = "pickup_object", depositmodelanimtime = 1000,
			},
		}
	},
		
}

Config.AnimalTypes = {
	Cows = {
		{
			animalType = "cows", animalName = "White and Brown", animalModel = "a_c_cow", animalColor = 3, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
		{
			animalType = "cows", animalName = "White and Black", animalModel = "a_c_cow", animalColor = 7, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
		{
			animalType = "cows", animalName = "Light Brown", animalModel = "a_c_cow", animalColor = 14, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
		{
			animalType = "cows", animalName = "Dark Brown", animalModel = "a_c_cow", animalColor = 4, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
		{
			animalType = "cows", animalName = "White", animalModel = "a_c_cow", animalColor = 15, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
		{
			animalType = "cows", animalName = "Brown with bell", animalModel = "a_c_cow", animalColor = 20, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 4, outputLabel = "Milk", outputtype = "item",

		},
	},

	Chicken = {
		{
			animalType = "chickens", animalName = "Golden ", animalModel = "a_c_chicken_01", animalColor = 1, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10, 
			outputamount = 1, outputLabel = "Egg", outputtype = "item",

		},
		{
			animalType = "chickens", animalName = "Jeva", animalModel = "a_c_chicken_01", animalColor = 2, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 1, outputLabel = "Egg", outputtype = "item",

		},
		{
			animalType = "chickens", animalName = "White", animalModel = "a_c_chicken_01", animalColor = 3, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 1, outputLabel = "Egg", outputtype = "item",

		},
	},

	Sheep = {
		{
			animalType = "sheep", animalName = "White", animalModel = "a_c_sheep_01", animalColor = 3, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 1, outputLabel = "Wool", outputtype = "item",

		},
		{
			animalType = "sheep", animalName = "Black(pink)", animalModel = "a_c_sheep_01", animalColor = 6, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10, 
			outputamount = 1, outputLabel = "Wool", outputtype = "item",

		},
		{
			animalType = "sheep", animalName = "White and Black", animalModel = "a_c_sheep_01", animalColor = 5, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 1, processLimit = 10,
			outputamount = 1, outputLabel = "Wool", outputtype = "item",

		},
		{
			animalType = "sheep", animalName = "Grey Sheep", animalModel = "a_c_sheep_01", animalColor = 1, animalPrice = 100,
			animalHealth = 100, animalhunger = 100, animalthirst = 100,	processtime = 10, processLimit = 10, 
			outputamount = 1, outputLabel = "Wool", outputtype = "item",

		},
	},
}

Config.AttackAnimals = {
	{
		model = "a_c_boarlegendary_01",
		color = 1,
		label = "Legendary Boar"
	},
	{
		model = "a_c_alligator_02",
		color = 1,
		label = "Aligator"
	},
	{
		model = "a_c_cougar_01",
		color = 1,
		label = "Cougar"
	},
	{
		model = "a_c_snake_01",
		color = 1,
		label = "Snake"
	},
	{
		model = "a_c_wolf",
		color = 1,
		label = "Wolf"
	},
}