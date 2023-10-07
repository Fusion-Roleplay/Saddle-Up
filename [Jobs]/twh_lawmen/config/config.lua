Config = {}

Config.debug = false
Config.fetchTimer = 1
Config.adminGroups = {"admin"}

--Webhook
Config.Logs         = true 
Config.Discord      = true  --if you use discord whitelist
Config.webhook      = ""
Config.webhookColor = 16711680 
Config.name         = "Saddle Up Lawmen Logs" 
Config.logo         = "https://media.discordapp.net/attachments/1017811858578735228/1103467115996004422/Logo-Grey.png?ex=65306dd5&is=651df8d5&hm=e191bc3eaf5421c9f45425667da72cc23a2ac9c1a08d31ba4efd3564d78461ae&=" -- Header
Config.footerLogo   = "https://media.discordapp.net/attachments/1017811858578735228/1103467115996004422/Logo-Grey.png?ex=65306dd5&is=651df8d5&hm=e191bc3eaf5421c9f45425667da72cc23a2ac9c1a08d31ba4efd3564d78461ae&=" -- Footer
Config.Avatar       = "https://media.discordapp.net/attachments/1017811858578735228/1103467115996004422/Logo-Grey.png?ex=65306dd5&is=651df8d5&hm=e191bc3eaf5421c9f45425667da72cc23a2ac9c1a08d31ba4efd3564d78461ae&=" -- Avatar


Config.playerselector = false --set to true if you want to use mega_playerselector for selecting players

Config.language = {
    transportPrompt = "Transport",
    playerNotFound = "Player not found",
    ownIdSelected = "You can't choose yourself!",
    playerNotNear = "No players nearby",
    arrestOver = "Your prison term is over, you can now leave the island",
    arrestNotOver = "You haven't served your time here yet! Remaining: ",
    minutes = " Minutes",
    warnOutsideArea = "Return to avoid setting off the alarm!",
    alarmNotification = "You set off the alarm!",
	alarmNotificationTitle = "~e~Alarm",
    alarmPoliceMessage= "Someone is trying to break out of the prison island!",
    wrongJob = "You are not authorized to do so",
    badge = "Brand",

    --catering
    catering = "Catering",
    iNeed = "I need",
    noItemCatering ="You don't have a token to trade",
    rightkey = "farther",
    leftkey = "back",
    get = "Exchange",
    gotItem = "Brand successfully exchanged",


    --minijobs
    reducedTime = "You've shortened your prison term",
    collectPrompt = "Collect",
    rakePrompt = "Rake",
    cotton = "Cotton",
    notNearPlant = "There is no full-grown plant nearby",
    broom = "Broom",
    broomPrompt = "Clean",
    repair = "Wall",
    repairPrompt = "Repair",


    --riddles
    increasedTime = "Your prison term has been extended",
    askNpc = "Ask for a hint",
    tooFar = "Too far away",
    smugglerPrompt = "Pay",
    notEnoughMoney = "You don't have enough money with you!",
    hint = "Hint",
    codeHintGuard = "The code for",
    codeHintPrisoner = "A number of the code for",
    is = " is ",
    noHint = "Sorry, I don't have any information for you!",
    speakFail = "Attempt Failed",
    leaveNow = "You can leave now! The alarm has been turned off for you.",
    lockPrompt = "Open",
    boatSpawned = "You've asked for help. A boat has been provided for you somewhere!",
    gotLockItem ="You have received an item:",
    item = "Object",
    cantCarryWeapon = "You can't take this weapon",
    gotWeapon = "You've found a weapon",
    onCooldown = "This lock has already been opened!",


    --hanging
    hangingPrompts = "Gallows",
    pullLever = "Operate",
    chardeathKickReason = "Character has been deleted",
    chardeathTitle = "You died!",
    chardeathMessage = "Your trip ends here",

    --police wagon
    policeWagon="Police car",
    wagonInPrompt = "Sit in",
    wagonOutPrompt = "Get Out",
    garagePrompt = "Get the car out",
    lockpickWagon = "Pick the lock",

    --duty system
    offduty = "You're off duty now",
    induty = "You are now in service",
    duty ="Status",
    changeStatus = "Changing Service Status",
    device = "Time clock",
    noJob ="You can't clock out",

    --handcuff
    handcuff = "Handcuffs",
    drag = "Drag",

    --check
    check = "Inspect",
    checkStatus = "Status: ",
    statusNoPrisoner = "Free",
    statusPrisoner = "Jailed",


    --lockpick
    lockpick = "Pick lock",
    notHandcuffed = "Player has no handcuffs on",
    lockpickBroke = "The lockpick is broken off",
    noLockpick = "You don't have a lockpick at hand",

    --input field for Arrest Time
    placeholderArrest= "Enter detention time (in minutes)", -- placeholdername
    buttonArrest ="Confirm", -- button name
    inputHeaderArrest = "Time", -- header
    titleArrest = "Misentry", -- if input doesnt match show this message

    --input field for player IDs
    placeholder= "Enter Player ID", -- placeholdername
    button ="Confirm", -- button name
    inputHeader = "ID", -- header
    title = "Misentry", -- if input doesnt match show this message
}

Config.keys = {
    transport = 0x760A9C6F, --G
    collect = 0x760A9C6F, --G
    broom = 0x760A9C6F, --G
    repair = 0x760A9C6F, --G
    rake = 0xCEFD9220, --E
    talkTo = 0x760A9C6F, --G
    hangLever = 0x760A9C6F, --G
    putInWagon = 0x760A9C6F, --G
    getOutWagon = 0xDEB34313, -- ARROW RIGHT
    lockpickWagon = 0x760A9C6F, --G
    handcuff = 0x760A9C6F, --G
    drag = 0xDEB34313, -- ARROW RIGHT
    changeDuty = 0x760A9C6F, --G
    garage = 0x760A9C6F, --G

    --catering
    left = 0x20190AB4 ,
    right= 0x65F9EC5B, 
    get= 0x2CD5343E,

    --escaperiddles
    smuggler = 0x760A9C6F, --G
    openLock = 0x760A9C6F, --G
}

Config.enableCinematicSound = true --if music should be playing while transport
Config.cinematicSoundVolume = 0.1 
Config.transportLocations = {
    ferryman = {
        name = "ferryman",
        coords = {x = 2949.52734375 , y = -1233.1939697266 , z = 41.414791107178,h = 117.26},
        distance = 2,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the ferryman

        justTeleport = false,
        teleportTo = {x = 3266.384765625 , y = -716.12829589844 , z = 41.035675048828,h =280.92},

        --if justTeleport == false
        boatModel = "rowboat",
        boatSpawn = {x=2959.556640625 ,y= -1232.3571777344 ,z= 39.922477722168,h= 315.99},
        boatNpcModel = "RE_RATINFESTATION_MALES_01",
        boatCanTalk = true

    }
}

Config.transportWaypoints = { --Waypoints boat is taking
    pos_finish = {x = 3112.2133789063 , y = -731.76416015625 , z = 39.1875},
    pos_finish2 = {x = 3170.4389648438 , y = -705.15747070313 , z = 39.187576293945},
    pos_finish3 = {x = 3237.2775878906 , y = -707.20440673828 , z = 39.18285369873}
}

Config.transportBackLocations = {
    ferryman = {
        name = "ferryman",
        coords = {x = 3277.8425292969 , y = -709.38018798828 , z = 42.345924377441,h = 225.59},
        distance = 2,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the ferryman

        justTeleport = false,
        teleportTo = {x = 2946.9719238281 , y = -1234.7701416016 , z = 41.425624847412,h =94.92},

        --if justTeleport == false
        boatModel = "rowboat",
        boatSpawn = {x = 3237.2775878906 , y = -707.20440673828 , z = 39.18285369873,h= 88.89},
        boatNpcModel = "RE_RATINFESTATION_MALES_01",
        boatCanTalk = true

    }
}
Config.transportBackWaypoints = {
    pos_finish = {x = 3203.7119140625 , y = -705.19702148438 , z = 39.186569213867},
    pos_finish2 = {x = 3128.0869140625 , y = -726.28723144531 , z = 39.186931610107},    
    pos_finish3 = {x = 2958.7971191406 , y = -1232.01953125 , z = 39.191619873047},
}

Config.cateringItemNeeded = true --if you need item to trade for catering
Config.cateringNPCsTalking = true --if npcs should talk when get somethin
Config.catering = {
    location1 = { 
        spawnPed = true,
		npcmodel = 'A_M_M_NbxUpperClass_01',
		coords = {x = 3364.4997558594 , y = -701.85852050781 , z = 44.533397674561,h =66.16},
        blips = false,
        blip = 675509286,
        blipname = "Food and Drinks",
        itemNeeded = "catering_voucher", --item needed to trade for food and water if Config.cateringItemNeeded = true
		need_1 = "Wasser",
        item_1= {item= "water", amount = 1},
		need_2 = "Eat",
        item_2= {item= "bread", amount = 1},
	}
}

Config.disabledKeys = {`INPUT_VEH_EXIT`,`INPUT_CINEMATIC_CAM`,0x8CC9CD42} --when in cinematic transports or in police wagon, disable these keys
Config.disabledKeysPrison = {0x24978A28,0xF3830D8E} --when in prison, disable these keys

Config.enableAlert = true --if you want to use the Alarm Sound
Config.alertVolume = 99 --max is 99
Config.alertcooldown = 10 --10 minutes until another alert can be triggered and the old one will be set off automatically (per client)
Config.enableDefense = true --if you want to spawn Defense if no riddle is solved -> escape.lua EscapeDefense
Config.textAlertJobs = true --alert jobs with popup aswell
Config.alertJobs = {"police","sheriff"}
Config.textAlertTime = 10000



Config.enableShowReducedTime = true --if you want to tell the player that he reduced time with work
Config.enableShowIncreasedTime = true --if you want to tell the player if his time increased



Config.center = {x = 3295.2895507813 , y = -599.99554443359 , z = 42.166893005371} --do not touch
Config.centerRadius = 170.0 --do not touch

--if you want the player to respawn on island aslong as he should be imprisoned
-- otherwise just set the spawnpoint in core 
Config.prisonRespwan = true
Config.respawnCoords = {x = 3376.2014160156 , y = -662.37066650391 , z = 45.266902923584, h = 125.02}


Config.enableBasement = true --opens up the invicible wall and trapdoor in basement
