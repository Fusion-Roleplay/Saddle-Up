EscapeDefense = {
    cooldown = 1000 * 60, 
    deleteNPcsAfterPlayerDied = 1000 * 60,
	maxDefense = 25, -- how many can be spawned max
	minAlive = 15, -- when this or less amount of police alive spawn new ones
	initialPedSpawn = 15, -- initial Spawn
	spawnLocations = {
		{ x = 3368.6076660156 , y = -726.34222412109 , z = 50.852916717529 }, -- locations to spawn (randomly selected)
		{ x = 3329.8996582031 , y = -704.00421142578 , z = 50.851261138916},
		{ x = 3316.2219238281 , y = -655.97650146484 , z = 50.852867126465 },
		{ x = 3390.4438476563 , y = -709.59851074219 , z = 44.154258728027 },
		{ x = 3398.14453125 , y = -707.05322265625 , z = 44.257694244385 },
		{ x = 3405.0903320313 , y = -646.85980224609 , z = 43.551605224609},
        {x = 3293.0522460938 , y = -713.60284423828 , z = 42.422389984131},
	},
	policeModels = {
		{ hash = "S_M_M_SkpGuard_01" }, -- add more models if you want
	},
	arrestTimeIncreaseAtFailure = true,
	arrestTimeIncrease = 30

}

EscapeRiddles = {
	talkChance = 0.5, --chance that prisoner npc will even talk to you 1.0 is 100%

	talkChanceGuards = 0.1, --chance that guard npc will even talk to you 1.0 is 100%

	arrestTimeIncreaseAtFailure = true, --when failed to talk to a guard, then arrest time increases
	arrestTimeIncrease = 5, --how many minutes it increases 
	arrestTimeDecreaseAtSuccess = true, --when success to talk to a guard, then arrest time decreases
	arrestTimeDecrease = 5, --how many minutes it decreases on success 

	twh_social = true, --if you use twh social and want to increase talk chance by social level
	talkChanceIncrease = 0.01, --how much to increase per level if twh_social is true

	--Hint mechanic:
	-- guards can give full code to a random codelock and prisoners one number of a random codelock if success
	-- prisoners can also give hint about smuggler location if enabled
	locationHintChance = 0.5,
	locationHint = "I've heard there's a smuggler in the basement of the prison!",
	codeLockHintChance = 0.15,
	codeLockHintChanceGuards = 0.01,
	hintDuration = 7000,



	tradeItems = true, --if NPCs additionaly can give items when you talk to them
	getItemChance = 0.5, --50%
	itemsToGet = { --get one of items in list
		{item = "apple",amount = 1}, 
		{item = "catering_voucher",amount = 1}, 
		{item = "bread_fish",amount = 1},

	},



}

EscapeRiddles.enableEasyWay = true --easy way out (give lots of money to secret npc, then he disable alarm for you or if teleport is on tp player out)
EscapeRiddles.easyWay = {
	basement = {
		name = "Smuggler",
    	coords = {x = 3374.642578125 , y = -690.40191650391 , z = 41.679397583008,h = 311.11},
    	distance = 2,
    	npcModel ="RE_RATINFESTATION_MALES_01",
    	canTalk = true,
		useGold = false, --if you enable you use Gold currency instead of Dollar
		moneyNeeded = 500,

		justTeleport = false, --if you just want to tp player out of prison after payment
    	teleportTo = {x = 3266.384765625 , y = -716.12829589844 , z = 41.035675048828,h =280.92},

		--if you use twh_social
		twh_social = false,
		levelNeeded = 0
	}


}


EscapeRiddles.codelocks = {  --codelock system to escape
	electric = {
		name = "Electrical box",
		coords = {x = 3390.6459960938 , y = -709.23193359375 , z = 45.149490356445},
		distance = 1,
    	dials = 4,
		fixedCode = '2207', --if you want to random generate code every restart just make fixedCode = 0
		increaseTimeOnFailure = 5, -- set to 0 if you sont want to increase time on failure
		--ACTIONS
		--1: Disable alert trigger for player so he can escape
		--2: Get specific Item
		--3: Can call for help/ spawning boat at the coast
		action = 1,
		hasCooldown = true, --if it should only can be used once a server restart

		--if action = 2
		item = "lockpick", --also possible with weapons
		itemamount = 1,

		--if action = 3
		alertDisabled = false, --is also alert disabled to escape
		boatModel = "",
		boatSpawn = {}
	},
	boathouse = {
		name = "Boathouse",
		coords = {x = 3293.2702636719 , y = -713.58056640625 , z = 43.43034362793},
		distance = 1,
    	dials = 4,
		fixedCode = '1997', --if you want to random generate code every restart just make fixedCode = 0
		increaseTimeOnFailure = 5, -- set to 0 if you sont want to increase time on failure
		--ACTIONS
		--1: Disable alert trigger for player so he can escape
		--2: Get specific Item
		--3: Can call for help/ spawning boat at the coast
		action = 3,
		hasCooldown = true, --if it should only can be used once a server restart

		--if action = 2
		item = "lockpick",
		itemamount = 1,

		--if action = 3
		alertDisabled = false, --is also alert disabled to escape
		boatModel = "rowboat",
		boatSpawn = {x= 3392.649169921875, y= -827.8689575195312, z= 40.57630157470703, h=146.57}
	},
	chest = {
		name = "Chest",
		coords = {x = 3339.6320800781 , y = -653.94494628906 , z = 45.581733703613},
		distance = 1,
    	dials = 4,
		fixedCode = '7239', --if you want to random generate code every restart just make fixedCode = 0
		increaseTimeOnFailure = 5, -- set to 0 if you sont want to increase time on failure
		--ACTIONS
		--1: Disable alert trigger for player so he can escape
		--2: Get specific Item
		--3: Can call for help/ spawning boat at the coast
		action = 2,
		hasCooldown = true, --if it should only can be used once a server restart

		--if action = 2
		item = "WEAPON_MELEE_KNIFE",
		itemamount = 1,

		--if action = 3
		alertDisabled = false, --is also alert disabled to escape
		boatModel = "rowboat",
		boatSpawn = {x= 3392.649169921875, y= -827.8689575195312, z= 40.57630157470703, h=146.57}
	}


}