Config = {}


Config.interactiondist = 2.5 -- distance to interact with location

Config.locations = { -- list of all crafting locations
    ["location1"] = {x = -1136.9,y = 270.47,z =42.9},
    ["location2"] = {x = 0,y = 0,z =0},
    ["bwb"] = {x = -782.07, y = -1289.4, z = 43.76},
}

Config.craftingprops = {"p_campfire02x","p_campfirecombined02x","p_campfirecombined03x","p_kettle03x","p_campfirecombined04x"}

Config.crafting = {
    [1] = {
        ['Text'] = "Boiled Egg",
        ['SubText'] = "1xEgg, 1xWater",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "eggs",
            ['Item2'] = "water",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "boiledegg", count = 1}},
            ['Job'] = {"cook"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"location1"}, -- keep 0 to allow crafting from any marked location

        }
    }, 
     [2] = {
        ['Text'] = "Dried Salmon", -- name of item to craft on list
        ['SubText'] = "1xSockeye Salmon, 1xSalt",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "a_c_fishsalmonsockeye_01_ms", 
            ['Item2'] = "salt", 
            ['Item3'] = "",
            ['Count'] = 1, 
            ['Count2'] = 1, 
            ['Count3'] = 0,
            ['Reward'] ={{ name = "consumable_salmon", count = 1}},
            ['Job'] = 0, 
            ['prop'] = {"p_campfire02x","p_campfirecombined02x","p_campfirecombined03x","p_kettle03x"}, -- will only show in those 2 props 
            ['location'] = {"location1","location2"}, -- this item can only be crafted in location 1 and 2 

        }
    },
    [3] = {
        ['Text'] = "Cooked Bluegil with Veggies",
        ['SubText'] = "1xSmall Bluegil, 1xCarrot, 1xCorn",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "a_c_fishbluegil_01_sm",
            ['Item2'] = "carrots",
            ['Item3'] = "consumable_corn",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "cookedbluegil", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [4] = {
        ['Text'] = "ChocolateBar",
        ['SubText'] = "2xCocoa, 3xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "cocoa",
            ['Item2'] = "sugar",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 3,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "consumable_chocolate_bar", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [5] = {
        ['Text'] = "Fruit Salad",
        ['SubText'] = "2xBlack Berry, 1xBlack Currant, 1xCreekplum",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Black_Berry",
            ['Item2'] = "Black_Currant",
            ['Item3'] = "Creekplum",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_fruitsalad", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        } 
    },
    [6] = {
        ['Text'] = "Jerkied Meat",
        ['SubText'] = "2xMeat, 2xSalt",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "meat",
            ['Item2'] = "salt",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 2,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "beefjerky", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [7] = {
        ['Text'] = "Dried Bluegil",
        ['SubText'] = "2xSalt, 1xMedium Bluegil",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "salt",
            ['Item2'] = "meat",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "consumable_bluegil", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [8] = {
        ['Text'] = "Cooked Trout",
        ['SubText'] = "1xRainbow Trout, 1xCrows_Garlic, 1xOleander Sage",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "a_c_fishrainbowtrout_01_ms",
            ['Item2'] = "Crows_Garlic",
            ['Item3'] = "Oleander_Sage",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_trout", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [9] = {
        ['Text'] = "Jerkied GameMeat",
        ['SubText'] = "1xGamey Meat, 2xSalt",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Gamey_Meat",
            ['Item2'] = "salt",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 2,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "consumable_game", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [10] = {
        ['Text'] = "Raspberry Water",
        ['SubText'] = "1xSugar, 1xWater, 1xRedRaspberry",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "sugar",
            ['Item2'] = "water",
            ['Item3'] = "Red_Raspberry",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_raspberrywater", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
     [11] = {
        ['Text'] = "Cigarette",
        ['SubText'] = "1xIndian Tobbaco, 1xRolling paper",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Indian_Tobbaco",
            ['Item2'] = "rollingpaper",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "cigarette", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [12] = {
        ['Text'] = "Cigar",
        ['SubText'] = "2xIndian Tobbaco, 1xRolling paper",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Indian_Tobbaco",
            ['Item2'] = "rollingpaper",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "cigar", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [13] = {
        ['Text'] = "Caramel",
        ['SubText'] = "2xSugar, 2xMilk",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "sugar",
            ['Item2'] = "milk",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 2,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "Caramel", count = 5}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [14] = {
        ['Text'] = "Heroin",
        ['SubText'] = "2xMorphine 2xAcid, 2xBlood Flower",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "morphine",
            ['Item2'] = "acid",
            ['Item3'] = "Blood_Flower",
            ['Count'] = 2,
            ['Count2'] = 2,
            ['Count3'] = 2,
            ['Reward'] ={{ name = "heroin", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [15] = {
        ['Text'] = "GoldBar",
        ['SubText'] = "15xGold Nugget",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "goldnugget",
            ['Item2'] = "",
            ['Item3'] = "",
            ['Count'] = 15,
            ['Count2'] = 0,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "goldbar", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [16] = {
        ['Text'] = "Pipe",
        ['SubText'] = "2xWood, 1xIron, 2xCopper",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "wood",
            ['Item2'] = "clay",
            ['Item3'] = "copper",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 2,
            ['Reward'] ={{ name = "pipe", count = 1}},

            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [17] = {
        ['Text'] = "Beer",
        ['SubText'] = "2xBitterWeed, 1xAlcohol",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Bitter_Weed",
            ['Item2'] = "alcohol",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "beer", count = 1}},
            ['Job'] = {"saloon","bastille"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [18] = {
        ['Text'] = "Wine",
        ['SubText'] = "2xBlackberry, 1xAlcohol",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Black_Berry",
            ['Item2'] = "alcohol",
            ['Item3'] = "",
            ['Count'] = 2,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "wine", count = 1}},
            ['Job'] = {"saloon","bastille"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [19] = {
        ['Text'] = "Blackberry Water",
        ['SubText'] = "1xSugar, 1xWater, 1xBlackBerry",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "sugar",
            ['Item2'] = "water",
            ['Item3'] = "Black_Berry",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_raspberrywater", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [20] = {
        ['Text'] = "Snake Oil",
        ['SubText'] = "1xSnakeSkin, 1xAcid, 2xBitter Weed",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "SnakeSkin",
            ['Item2'] = "acid",
            ['Item3'] = "Bitter_Weed",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 2,
            ['Reward'] ={{ name = "Snake_Poison", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [21] = {
        ['Text'] = "Herbal Med",
        ['SubText'] = "2xParasolMushroom, 2xEnglishMace, 2xCreepingThyme",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Parasol_Mushroom",
            ['Item2'] = "English_Mace",
            ['Item3'] = "Creeking_Thyme",
            ['Count'] = 2,
            ['Count2'] = 2,
            ['Count3'] = 2,
            ['Reward'] ={{ name = "herbmed", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [22] = {
        ['Text'] = "BlackBerry Ale",
        ['SubText'] = "1xBitterWeed, 2xBlackBerry 1xAlcohol",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Bitter_Weed",
            ['Item2'] = "Black_Berry",
            ['Item3'] = "alcohol",
            ['Count'] = 1,
            ['Count2'] = 2,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "blackberryale", count = 1}},
            ['Job'] = {"saloon","bastille"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [23] = {
        ['Text'] = "Raspberry Ale",
        ['SubText'] = "1xBitterWeed, 2xRedRaspberry 1xAlcohol",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Bitter_Weed",
            ['Item2'] = "Red_Raspberry",
            ['Item3'] = "alcohol",
            ['Count'] = 1,
            ['Count2'] = 2,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "raspberryale", count = 1}},
            ['Job'] = {"saloon","bastille"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [24] = {
        ['Text'] = "Syn",
        ['SubText'] = "1xSynpackage",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "synpackage",
            ['Item2'] = "",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 0,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "syn", count = 5}},
            ['Job'] = {"saloon","bastille"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    
    [25] = {
        ['Text'] = "Breakfast",
        ['SubText'] = "2xEgg, 2xmeat, 1xsalt",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "eggs",
            ['Item2'] = "meat",
            ['Item3'] = "salt",
            ['Count'] = 2,
            ['Count2'] = 2,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_breakfast", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },
    [26] = {
        ['Text'] = "Edible Veggies",
        ['SubText'] = " - 1xCrowsGarlic, 1xParasolMushroom, 1xWildCarrot",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Crows_Garlic",
            ['Item2'] = "Parasol_Mushroom",
            ['Item3'] = "Wild_Carrot",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "consumable_veggies", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [27] = {
        ['Text'] = "Bottled Water",
        ['SubText'] = "1xGlass Bottle, 1xFull Water Bucket",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "glassbottle",
            ['Item2'] = "wateringcan",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "water", count = 1},{ name = "wateringcan_empty", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [28] = {
        ['Text'] = "Black Coffee",
        ['SubText'] = "1xCoffee, 1xWater",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "coffee",
            ['Item2'] = "water",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "blackcoffee", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [29] = {
        ['Text'] = "Ginseng Tea",
        ['SubText'] = "1xWater, 1xSugar, 1xAmericanGinseng",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "water",
            ['Item2'] = "sugar",
            ['Item3'] = "American_Ginseng",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "ginsengtea", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [30] = {
        ['Text'] = "Apple Pie",
        ['SubText'] = "1xPieCrust, 3xApple, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "piecrust",
            ['Item2'] = "apple",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_ap", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [31] = {
        ['Text'] = "Banana Bread",
        ['SubText'] = "3xBanana, 1xFlour, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "Banana",
            ['Item2'] = "Flour",
            ['Item3'] = "sugar_item",
            ['Count'] = 3,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_bb", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [32] = {
        ['Text'] = "Blueberry Muffin",
        ['SubText'] = "3xblueberry, 1xflour, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "blueberry",
            ['Item2'] = "flour",
            ['Item3'] = "sugar_item",
            ['Count'] = 3,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_bm", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [33] = {
        ['Text'] = "Chocolate Cake",
        ['SubText'] = "1xFlour, 1xEgg, 1xCocoa",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "flour",
            ['Item2'] = "egg",
            ['Item3'] = "cocoa",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_cc", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [34] = {
        ['Text'] = "Chocolate Chunk Cookie",
        ['SubText'] = "1xFlour, 1xEgg, 1xCocoa",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "flour",
            ['Item2'] = "egg",
            ['Item3'] = "cocoa",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_ccc", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [35] = {
        ['Text'] = "Cinnamon Roll",
        ['SubText'] = "1xflour, 1xEgg, 1xSugar, 1xCinnamon",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "flour",
            ['Item2'] = "egg",
            ['Item3'] = "sugar_item",
            ['Item4'] = "cinnamon",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Count4'] = 1,
            ['Reward'] ={{ name = "bwb_cr", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [36] = {
        ['Text'] = "Coffee with Cream",
        ['SubText'] = "1xCoffee, 1xMilk, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "coffee_item",
            ['Item2'] = "milk",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_cwc", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [37] = {
        ['Text'] = "Donut",
        ['SubText'] = "1xFlour, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "flour",
            ['Item2'] = "sugar_item",
            ['Item3'] = "",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 0,
            ['Reward'] ={{ name = "bwb_d", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [38] = {
        ['Text'] = "Fruit Punch",
        ['SubText'] = "1xWater, 1xSugar, 1xFruitCocktail",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "water",
            ['Item2'] = "sugar_item",
            ['Item3'] = "fruitcocktail",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_fp", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [39] = {
        ['Text'] = "Fruit Cocktail",
        ['SubText'] = "1xBlackberry, 1xStrawberry, 1xGrapes",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "black_berry",
            ['Item2'] = "strawberry",
            ['Item3'] = "grapes",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "fruitcocktail", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [40] = {
        ['Text'] = "Pink Glazed Donut",
        ['SubText'] = "1xDonut, 1xStrawberry, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "bwb_d",
            ['Item2'] = "strawberry",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_pgd", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [41] = {
        ['Text'] = "Peach Iced Tea ",
        ['SubText'] = "1xWater, 1xPeach, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "water",
            ['Item2'] = "peach",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_pit", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [42] = {
        ['Text'] = "Peppermint Mocha",
        ['SubText'] = "1xPeppermint, 1xCoffee, 1xCocoa",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "peppermint",
            ['Item2'] = "coffee",
            ['Item3'] = "cocoa",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_pm", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [43] = {
        ['Text'] = "Peach Tarte",
        ['SubText'] = "1xPeach, 1xFlour, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "peach",
            ['Item2'] = "flour",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_pt", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [44] = {
        ['Text'] = "Strawberry Cheesecake",
        ['SubText'] = "1xStrawberry, 1xEgg, 1xFlour, 1xCreamCheese",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "strawberry",
            ['Item2'] = "egg",
            ['Item3'] = "flour",
            ['Item4'] = "creamcheese",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Count4'] = 1,
            ['Reward'] ={{ name = "bwb_sc", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    [45] = {
        ['Text'] = "Strawberry Shortcake",
        ['SubText'] = "1xStrawberry, 1xFlour, 1xSugar",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "strawberry",
            ['Item2'] = "flour",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "bwb_ss", count = 1}},
            ['Job'] = {"bwb"}, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = {"bwb"}, 

        }
    },

    

    
    

}