Config = {}

Config.debug = false -- use only in dev
Config.printLogs = true
Config.adminGroups = { 'admin', 'moderator' }

Config.framework = 'vorp'

Config.language = {
    notificationTitle = "Medical",
    medicalBed = "Medical Bed",
    layDown = "Lay Down",
    getUp = "Get Up",
    visit = "Visit",
    inspect = "Inspect",
    unableToUseItem = "You're unable to use this item",
    doctorsOnline = "There's a doctor around, go ask him help.",
    notEnoughMoney = "You don't have enough money.",
    healed = "You have been healed by the doctor.",
    noDiseases = "You don't have any disease.",
    revived = "You have been revived by the doctor.",
    notDead = "Cannot revive alive players.",
    cannotReviveHeadshot = "The player was shot in the head, it cannot be revived.",
    healMe = "Heal Me",
    npcDoctor = "Doctor",
    revive = "Revive",
    noDoctorsOnline = "There are no doctors online",
    helpRequest = "You hear some people calling for help, there's an unconscious person in danger. Look at the map.",
    helpRequested = "You sent someone to look for help. Doctors are on the way.",
    helpBlipText = "Help Requested #%d | %s",
    helpResponse = "A doctor is on the way to your location, please don't move.",
    -- webhooks
    embedName = "Mega Doctorjob",
    newDiseaseTitle = "Player has contracted a disease",
    newDiseaseText = "**Player ID**: %s (%s)\n**Disease:** %s\n**Bone:** %s\n**Damage Type:** %s",
    autoHealedDiseaseTitle = "Player disease has auto-healed",
    autoHealedDiseaseText = "**Disease:** %s\n**Player ID:** %s (%s)",
    healItemUsedTitle = "Player used heal item",
    healItemUsedText = "**Item:** %s\n**Player:** %s (%s)\n**Diseases Healed:** %s",
    doctorHealedDiseaseTitle = "Doctor has healed a disease",
    doctorHealedDiseaseText = "**Disease:** %s\n**Damage Type:** %s\n**Doctor Player ID:** %s (%s)\n**Target Player ID:** %s (%s)",
    npcDoctorHealedTitle = "NPC Doctor Healed Player",
    npcDoctorHealedText = "**Player ID:** %s (%s)\n**Hospital:** %s",
    npcDoctorRevivedTitle = "NPC Doctor Revived Player",
    npcDoctorRevivedText = "**Player ID:** %s (%s)\n**Hospital:** %s",
    resurrectedPlayerTitle = "Player was resurrected",
    resurrectedPlayerText = "**Player ID:** %s (%s)\n**Target Player ID:** %s (%s)",
    playerAlertTitle = "Player asked for help",
    playerAlertText = "**Player ID:** %s (%s)\n**Player Coords:** `%s %s %s`"
}

-- uncomment to enable webhook options
Config.webhookOptions = {
    webhook = "https://discord.com/api/webhooks/1160098216084242462/d__S_DxsqaswanRb_9RHzM5hoHKHsLaW7qm-d9NyKgzQmTwrC-rQofQsbOw5miK-aiBn",
    color = 3447003
}

-- If you have syn_society it will use it's API export to calculate only "in duty" workers.
Config.syn_society = true
Config.mega_companies = false
-- !!!Only works if you have syn_society or mega_companies!!!
-- Tax that gets deducted from the doctor npc revenue. 
-- Example: doctor npc heal costs 30$
-- Tax: 0.10 (10%)
-- Society receives: 27$
Config.ledgerTax = 0.10
-- the id of the society (syn_society) or company (mega_companies) where taxes will be sent
-- set this to nil if you don't need it
Config.taxJobId = 'state'

Config.enableAlert = true
Config.enableAlertResponse = true
Config.allowDeadPlayers = false
Config.alertCommand = 'alertdoctor'
Config.respondCommand = 'respond'
Config.clearAlertCommand = 'clearAlerts'
-- put 0 if you don't want to show anything
Config.alertBlipSprite = -924021303	
Config.showRadiusAroundBlip = true
Config.blipRadius = 20.0
Config.radiusStyle = 1673015813
-- seconds to wait before the alert blip will be removed from the map
Config.alertTimeout = 300

Config.medicalBeds = { 'p_medbed01x' }
Config.jobs = { 'doctor' }
Config.allowPlayerTargeting = true
Config.playerTargetRange = 1.5

-- jobs that can inspect a dead body
Config.inspectCommand = 'inspect'
Config.inspectJobs = { 'doctor', 'police' } 
Config.allowPlayerInspecting = true
Config.playerInspectRange = 2.0

-- NPC Revive System
Config.noHeadshotRevive = false

-- If you already have a bandana script, you can link it by adding an event when the bandana is up or down
-- doctorjob script will listen for this event, data must be a boolean (true/false) for (up/down)
-- It's used to prevent getting diseases such cholera or malaria
Config.bandanaEvent = 'syn_robbery:bandana'

-- Whether to remove or not diseases on revive/respawn
Config.removeDiseaseOnRevive = true

-- Hospitals are just used for patient notes.
-- When a doctor saves a note for a patient it will be shared within the hospital structure.
Config.hospitals = {
    ['Saint Denis Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(2725.86, -1227.72, 50.36),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(2721.34, -1231.71, 49.36),
            heading = 90.0,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Rhodes Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(1368.96, -1311.13, 77.99),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(1368.96, -1311.13, 77.99),
            heading = 150.64,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Valentine Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(-288.03, 804.57, 119.44),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(-288.03, 804.57, 119.44),
            heading = 277.11,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Strawberry Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(-1778.23, -374.99, 159.96),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(-1778.23, -374.99, 159.96),
            heading = 135.07,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Blackwater Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(-810.46, -1264.14, 43.74),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(-810.46, -1264.14, 43.74),
            heading = 314.36,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
    ['Armadillo Hospital'] = {
        showBlip = true,
        blipSprite = -1739686743,
        coords = vector3(-3661.07, -2600.27, -13.24),
        radius = 20.0,
        npc = {
            enabled = true,
            -- the jobs to check the players count
            -- if a player with one of these jobs is online
            -- the function will be disabled
            jobs = { 'doctor' },
            healCost = 30.0,
            reviveCost = 80.0,
            reviveTime = 60,,
            npcModel = 'CS_DrMalcolmMacIntosh',
            coords = vector3(-3661.07, -2600.27, -13.24),
            heading = 184.13,
            range = 2.0
        },
        jobId = 'doctor' -- the id of the society (syn_society) or company (mega_companies) set to nil if you don't need it
    },
}

-- This is for calculaing body temperature including types of clothes that the player has

Config.ClothesTemperatures = {
    -- Hat
    [0x9925C067] = {
        temperature = 1.0 -- How many degrees add to the local temperature if wearing this
    }, 
    -- Shirts
    [0x2026C46D] = {
        temperature = 1.0
    },
    -- Pants
    [0x1D4C528A] = {
        temperature = 1.0
    },
    -- Boots
    [0x777EC6EF] = {
        temperature = 1.0
    },
    -- Coats
    [0xE06D30CE] = {
        temperature = 2.0
    },
    -- Coats Closed
    [0x662AC34] = {
        temperature = 3.0
    },
    -- Gloves 
    [0xEABE0032] = {
        temperature = 0.5
    },
    -- Vest
    [0x485EE834] = {
        temperature = 1.0
    },
    -- Ponchos
    [0xAF14310B] = {
        temperature = 1.0
    },
    -- Cloaks
    [0x3C1A74CD] = {
        temperature = 1.0
    },
    -- Skirts
    [0xA0E3AB7F] = {
        temperature = 1.0
    }
}

-- Don't touch unless you know what you're doing

-- Those are damage states for diseases, you can add your own if you need to
-- also, take a look in config.js for the translation in the UI, names must match.

-- They are used to add some steps to heal wounds, originally only for bleeding
-- and for customising healing animations and progress.

-- It is declared inside disease data
-- example: self._data.damageType = 'projectile'
Config.damageTypes = {
    ['projectile'] = {
        next = 'cut',
        lang = 'Removing projectile...',
        animationDict = 'amb_work@world_human_repair@med@oilcan@male_a@idle_b',
        animation = 'idle_d',
        duration = 5000
    },
    ['cut'] = {
        next = nil,
        lang = 'Applying stitches...',
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    },
    ['broken'] = {
        next = nil,
        lang = 'Applying splint...',
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    },
    ['bandaged'] = {
        next = 'cut',
        lang = 'Removing bandage...',
        animationDict = 'amb_work@world_human_repair@med@oilcan@male_a@idle_b',
        animation = 'idle_d',
        duration = 5000
    },
    -- default fallback state if none of those is set
    ['default'] = {
        next = nil,
        lang = 'Healing...',
        animationDict = 'script_re@injured_rider@dr_office',
        animation = 'surgery_exit_doc',
        duration = 20000
    }
}

-- Don't touch unless you know what you're doing
-- Still unused, waiting for RedM to work with some walkstyles on MP_Ped
Config.boneIDsToAnimation = {
    female = {
        ['injured_right_arm'] = {
            54802, 
            16827, 
            16828, 
            16829, 
            16747, 
            16748, 
            16749, 
            16750, 
            16731, 
            16732, 
            16733, 
            16734, 
            16779, 
            16780, 
            16781,
            16782,
            16763,
            16764,
            16765,
            16766,
            54187,
            46065
        },
        ['injured_left_arm'] = {
            30226,
	        41403,
	        41404,
	        41405,
	        41323,
	        41324,
	        41325,
	        41326,
	        41307,
	        41308,
	        41309,
	        41310,
	        41355,
	        41356,
	        41357,
	        41358,
	        41339,
	        41340,
	        41341,
	        41342,
            45454,
	        53675,
	        34606,
	        37873,
        },
        ['injured_right_leg'] = {
            43312,
            33646,
            6884,
            41273,
            18013,
            18029
        },
        ['injured_left_leg'] = {
            55120,
            45454,
            53081,
            11440,
            11456,
            65478
        },
        ['default'] = { 'injured_general' }
    },
    male = {
        ['injured_right_arm'] = {
            54802,
            16827,
            16828,
            16829,
            16747,
            16748,
            16749,
            16750,
            16731,
            16732,
            16733,
            16734,
            16779,
            16780,
            16781,
            16782,
            16763,
            16764,
            16765,
            16766,
            54187,
            22798,
            46065,
        },
        ['injured_left_arm'] = {
            30226,
            41403,
            41404,
            41405,
            41323,
            41324,
            41325,
            41326,
            41307,
            41308,
            41309,
            41310,
            41355,
            41356,
            41357,
            41358,
            41339,
            41340,
            41341,
            41342,
            53675,
	        34606,
            37873
        },
        ['injured_right_leg'] = {
            43312,
            55120,
            65478,
            53081,
            11440,
            11456
        },
        ['injured_left_leg'] = {
            43312,
            33646,
            6884,
            41273,
            18013,
            18029
        },
        ['default'] = { 'injured_general' }
    }
}