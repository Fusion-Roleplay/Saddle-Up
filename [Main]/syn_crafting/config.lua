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
        ['Text'] = "Boiled Egg - 1xEgg, 1xWater",
        ['SubText'] = "",
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
        ['Text'] = "Dried Salmon - 1xSockeye Salmon, 1xSalt", -- name of item to craft on list
        ['SubText'] = "",
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
        ['Text'] = "Cooked Bluegil with Veggies - 1xSmall Bluegil, 1xCarrot, 1xCorn",
        ['SubText'] = "",
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
        ['Text'] = "ChocolateBar - 2xCocoa, 3xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Fruit Salad - 2xBlack Berry, 1xBlack Currant, 1xCreekplum",
        ['SubText'] = "",
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
        ['Text'] = "Jerkied Meat - 2xMeat, 2xSalt",
        ['SubText'] = "",
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
        ['Text'] = "Dried Bluegil - 2xSalt, 1xMedium Bluegil",
        ['SubText'] = "",
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
        ['Text'] = "Cooked Trout - 1xRainbow Trout, 1xCrows_Garlic, 1xOleander Sage",
        ['SubText'] = "",
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
        ['Text'] = "Jerkied GameMeat - 1xGamey Meat, 2xSalt",
        ['SubText'] = "",
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
        ['Text'] = "Raspberry Water - 1xSugar, 1xWater, 1xRedRaspberry",
        ['SubText'] = "",
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
        ['Text'] = "Cigarette - 1xIndian Tobbaco, 1xRolling paper",
        ['SubText'] = "",
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
        ['Text'] = "Cigar - 2xIndian Tobbaco, 1xRolling paper",
        ['SubText'] = "",
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
        ['Text'] = "Caramel - 2xSugar, 2xMilk",
        ['SubText'] = "",
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
        ['Text'] = "Heroin - 2xMorphine 2xAcid, 2xBlood Flower",
        ['SubText'] = "",
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
        ['Text'] = "GoldBar - 15xGold Nugget",
        ['SubText'] = "",
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
        ['Text'] = "Pipe - 2xWood, 1xIron, 2xCopper",
        ['SubText'] = "",
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
        ['Text'] = "Beer - 2xBitterWeed, 1xAlcohol",
        ['SubText'] = "",
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
        ['Text'] = "Wine - 2xBlackberry, 1xAlcohol",
        ['SubText'] = "",
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
        ['Text'] = "Blackberry Water - 1xSugar, 1xWater, 1xBlackBerry",
        ['SubText'] = "",
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
        ['Text'] = "Snake Oil - 1xSnakeSkin, 1xAcid, 2xBitter Weed",
        ['SubText'] = "",
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
        ['Text'] = "Herbal Med - 2xParasolMushroom, 2xEnglishMace, 2xCreepingThyme",
        ['SubText'] = "",
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
        ['Text'] = "BlackBerry Ale - 1xBitterWeed, 2xBlackBerry 1xAlcohol",
        ['SubText'] = "",
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
        ['Text'] = "Raspberry Ale - 1xBitterWeed, 2xRedRaspberry 1xAlcohol",
        ['SubText'] = "",
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
        ['Text'] = "Syn - 1xSynpackage",
        ['SubText'] = "",
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
        ['Text'] = "Breakfast - 2xEgg, 2xmeat, 1xsalt",
        ['SubText'] = "",
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
        ['Text'] = "Edible Veggies - 1xCrowsGarlic, 1xParasolMushroom, 1xWildCarrot",
        ['SubText'] = "",
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
        ['Text'] = "Bottled Water - 1xGlass Bottle, 1xFull Water Bucket",
        ['SubText'] = "",
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
        ['Text'] = "Black Coffee - 1xCoffee, 1xWater, 1xSugar",
        ['SubText'] = "",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "coffee",
            ['Item2'] = "water",
            ['Item3'] = "sugar_item",
            ['Count'] = 1,
            ['Count2'] = 1,
            ['Count3'] = 1,
            ['Reward'] ={{ name = "blackcoffee", count = 1}},
            ['Job'] = 0, -- the job required
            ['prop'] = 0, -- 0 means any
            ['location'] = 0, 

        }
    },

    [29] = {
        ['Text'] = "Ginseng Tea - 1xWater, 1xSugar, 1xAmericanGinseng",
        ['SubText'] = "",
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
        ['Text'] = "Apple Pie - 1xPieCrust, 3xApple, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Banana Bread - 3xBanana, 1xFlour, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Blueberry Muffin - 3xblueberry, 1xflour, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Chocolate Cake - 1xFlour, 1xEgg, 1xCocoa",
        ['SubText'] = "",
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
        ['Text'] = "Chocolate Chunk Cookie - 1xFlour, 1xEgg, 1xCocoa",
        ['SubText'] = "",
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
        ['Text'] = "Cinnamon Roll - 1xflour, 1xEgg, 1xSugar, 1xCinnamon",
        ['SubText'] = "",
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
        ['Text'] = "Coffee with Cream - 1xCoffee, 1xMilk, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Donut - 1xFlour, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Fruit Punch - 1xWater, 1xSugar, 1xFruitCocktail",
        ['SubText'] = "",
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
        ['Text'] = "Fruit Cocktail - 1xBlackberry, 1xStrawberry, 1xGrapes",
        ['SubText'] = "",
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
        ['Text'] = "Pink Glazed Donut - 1xDonut, 1xStrawberry, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Peach Iced Tea - 1xWater, 1xPeach, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Peppermint Mocha - 1xPeppermint, 1xCoffee, 1xCocoa",
        ['SubText'] = "",
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
        ['Text'] = "Peach Tarte - 1xPeach, 1xFlour, 1xSugar",
        ['SubText'] = "",
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
        ['Text'] = "Strawberry Cheesecake - 1xStrawberry, 1xEgg, 1xFlour, 1xCreamCheese",
        ['SubText'] = "",
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
        ['Text'] = "Strawberry Shortcake - 1xStrawberry, 1xFlour, 1xSugar",
        ['SubText'] = "",
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

    [46] = {
        ['Text'] = "Cream of Sum Yung Guy - 1xToad, 1xTurtle, 1,Skunk, 1xSalt, 1xMilk", -- name of item to craft on list
        ['SubText'] = "",
        ['Desc'] = "",
        ['Param'] = {
            ['Item'] = "toad_c", 
            ['Item2'] = "turtle_meat", 
            ['Item3'] = "skunk_meat",
            ['Item4'] = "salt",
            ['Item5'] = "milk",
            ['Count'] = 1, 
            ['Count2'] = 1, 
            ['Count3'] = 1,
            ['Count4'] = 1,
            ['Count5'] = 1,
            ['Reward'] ={{ name = "cream_of_syg", count = 1}},
            ['Job'] = 0, 
            ['prop'] = {"p_campfire02x","p_campfirecombined02x","p_campfirecombined03x","p_kettle03x"}, -- will only show in those 2 props 
            ['location'] = {"location1","location2"}, -- this item can only be crafted in location 1 and 2 

        }
    },

    

    
    

}