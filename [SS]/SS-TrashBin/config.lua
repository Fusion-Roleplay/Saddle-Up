-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
    
Dev = true,
    
NXTInventory = false,
NXTMaxWeight = 50000,
NXTSlots = 30,
    
SearchTime = 10000, -- TIME OF ANIMATION WHEN SEARCH
TrashbinBlip =  1109348405, -- TRASH BIN BLIP PUT false TO HIDE THEM
TimeToRefill = {14400, 28800},-- REFILL TIMER, AFTER HOW MUCH TIME PLAYERS CAN SEARCH ( WILL BE RANDOM BETWEEN THIS TIMES )
TrashSlots = 10, -- STASH TRASH SLOTS
    
SearchKey = 0x41AC83D1, -- SEARCH KEY
LookKey = 0xFF8109D8, -- LOOK KEY
    
TrashBins = {
[1] = {-- Valentines
Pos = {-300.932373046875, 783.7180786132812, 117.75621795654297, true},
Items = {
	["glassbottle"] = { -- Item name in database !
	Label = "Sticla Goala", -- Label of item !
	Amount = {1, 3}, -- Amount to give !
	Chance = 65, -- Chance to give this item !
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},
[2] = {-- VALENTINES STATION
Pos = {-179.72445678710938, 616.8157348632812, 113.03475189208984, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},
[3] = {-- ANNESBURG
Pos = {2930.205810546875, 1267.233642578125, 43.60715103149414, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},
[4] = {-- saint denis
Pos = {2696.00830078125, -1449.4022216796875, 45.23892974853515, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},  
[5] = {-- Saint Denis 2
Pos = {2520.29248046875, -1306.4046630859375, 48.01086044311523, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
}, 
[6] = {-- rhodes
Pos = {1244.0439453125, -1289.8416748046875, 74.95966339111328, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
}, 
[7] = {-- flatneck station
Pos = {-334.8014221191406, -357.54302978515625, 87.00071716308594, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},
[8] = {-- oil field
Pos = {459.11810302734375, 671.229248046875, 115.70621490478516, true},
Items = {
	["glassbottle"] = {
	Label = "Sticla Goala",
	Amount = {1, 3},
	Chance = 65,
	},
	["ironhorseshoe"] = {
	Label = "Potcoava Fier",
	Amount = {1, 2},
	Chance = 30,
	},
	["bread"] = {
	Label = "Paine",
	Amount = {1, 3},
	Chance = 80,
	},
	["Apple_Seed"] = {
	Label = "Mar",
	Amount = {1, 4},
	Chance = 80,
	},
	["ironbar"] = {
	Label = "Bara De Fier",
	Amount = {1, 2},
	Chance = 20,
	},
	["goldring"] = {
	Label = "Inel De Aur",
	Amount = {1, 2},
	Chance = 30,
	},
	["goldtooth"] = {
	Label = "Dinte De Aur",
	Amount = {1, 3},
	Chance = 25,
	},
	["salt"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 40,
	},
	["alcohol"] = {
		Label = "Sare",
		Amount = {1, 3},
		Chance = 30,
	},
	["boiledegg"] = {
		Label = "Sare",
		Amount = {1, 4},
		Chance = 70,
	},
},
},
[9] = {-- Strawberry
Pos = {-1770.1522216796875, -383.18438720703125, 156.6904754638672, true},
	Items = {
    	["glassbottle"] = {
		Label = "Sticla Goala",
		Amount = {1, 3},
		Chance = 65,
		},
    	["ironhorseshoe"] = {
		Label = "Potcoava Fier",
		Amount = {1, 2},
		Chance = 30,
		},
    	["bread"] = {
		Label = "Paine",
		Amount = {1, 3},
		Chance = 80,
		},
    	["Apple_Seed"] = {
		Label = "Mar",
		Amount = {1, 4},
		Chance = 80,
		},
    	["ironbar"] = {
		Label = "Bara De Fier",
		Amount = {1, 2},
		Chance = 20,
		},
    	["goldring"] = {
		Label = "Inel De Aur",
		Amount = {1, 2},
		Chance = 30,
		},
    	["goldtooth"] = {
		Label = "Dinte De Aur",
		Amount = {1, 3},
		Chance = 25,
		},
    	["salt"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 40,
		},
    	["alcohol"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 30,
		},
    	["boiledegg"] = {
			Label = "Sare",
			Amount = {1, 4},
			Chance = 70,
		},
	}, 
},
[10] = {-- Wallace Station
Pos = {-1307.9842529296875, 396.01580810546875, 94.3646240234375, true},
	Items = {
    	["glassbottle"] = {
		Label = "Sticla Goala",
		Amount = {1, 3},
		Chance = 65,
		},
    	["ironhorseshoe"] = {
		Label = "Potcoava Fier",
		Amount = {1, 2},
		Chance = 30,
		},
    	["bread"] = {
		Label = "Paine",
		Amount = {1, 3},
		Chance = 80,
		},
    	["Apple_Seed"] = {
		Label = "Mar",
		Amount = {1, 4},
		Chance = 80,
		},
    	["ironbar"] = {
		Label = "Bara De Fier",
		Amount = {1, 2},
		Chance = 20,
		},
    	["goldring"] = {
		Label = "Inel De Aur",
		Amount = {1, 2},
		Chance = 30,
		},
    	["goldtooth"] = {
		Label = "Dinte De Aur",
		Amount = {1, 3},
		Chance = 25,
		},
    	["salt"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 40,
		},
    	["alcohol"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 30,
		},
    	["boiledegg"] = {
			Label = "Sare",
			Amount = {1, 4},
			Chance = 70,
		},
	},
	[11] = {-- blackwater
	Pos = {-775.6368408203125, -1260.4776611328125, 42.60700988769531, true},
	Items = {
		["glassbottle"] = {
		Label = "Sticla Goala",
		Amount = {1, 3},
		Chance = 65,
		},
		["ironhorseshoe"] = {
		Label = "Potcoava Fier",
		Amount = {1, 2},
		Chance = 30,
		},
		["bread"] = {
		Label = "Paine",
		Amount = {1, 3},
		Chance = 80,
		},
		["Apple_Seed"] = {
		Label = "Mar",
		Amount = {1, 4},
		Chance = 80,
		},
		["ironbar"] = {
		Label = "Bara De Fier",
		Amount = {1, 2},
		Chance = 20,
		},
		["goldring"] = {
		Label = "Inel De Aur",
		Amount = {1, 2},
		Chance = 30,
		},
		["goldtooth"] = {
		Label = "Dinte De Aur",
		Amount = {1, 3},
		Chance = 25,
		},
		["salt"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 40,
		},
		["alcohol"] = {
			Label = "Sare",
			Amount = {1, 3},
			Chance = 30,
		},
		["boiledegg"] = {
			Label = "Sare",
			Amount = {1, 4},
			Chance = 70,
		},
	},
	},
}
},
    
Texts = {
["blips_trashbin"] = "TrashBin",
["you_find"] = "You're lucky, you find something good in this trash !",
["you_notfind"] = "Bad day... there is nothing usefully !",
["tryagainlater"] = "Hmmm, seems somebody else already searched here !",
["search_trashbin"] = "Search Trash",
["look_inside"] = "Look Inside",
["trash_menu"] = "Trash Bin...",
["trash_stashlabel"] = "Trash Stash",
}
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)    
end 