-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                           ║
-- ║                             GLOBAL CONFIGURATION                          ║
-- ║                                                                           ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝

-- Global Configuration Table
CONFIG = {}

-- Debug Mode
CONFIG.DEBUG = false

-- Electric chair version
CONFIG.USE_ELECTRIC_CHAIR = true

CONFIG.PROPS_ELECTRIC_CHAIR = {
    {"p_cs_electricchair01x", 'PROP_HUMAN_SEAT_CHAIR'} -- [1] = props, [2] = "scenario"
}

CONFIG.DISTANCE_SEATCHAIR = 5.0
CONFIG.SOUND_ELECTRIC_CHAIR = 'Electric_Chair.mp3'
CONFIG.VOLUME_ELECTRIC_CHAIR = 0.1
CONFIG.CONTROL_SEAT_CHAIR = 0x6319DB71
CONFIG.CONTROL_START_ELECTRIC_CHAIR = 0x05CA7C52
CONFIG.CONTROL_STOP_ELECTRIC_CHAIR = 0x156F7119
CONFIG.DISTANCE_SEAT_CHAIR = 5.0
CONFIG.REMOVE_HEALTH = 80
CONFIG.VIEW_PROMPT_SEAT_CHAIR = 5000
CONFIG.PROMPT_SEAT_CHAIR = {
    [1] = {text = "Sit"},
    [2] = {text = "Electric Chair"},
    [3] = {text = "Electrocute"},
    [4] = {text = "Stop"},
}

-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                                                                         ║
-- ║                          UTILS CONFIGURATION                            ║
-- ║                                                                         ║
-- ╚═════════════════════════════════════════════════════════════════════════╝

-- UTILS Configuration
CONFIG.UTILS = {
    USE_FADE = true, -- If you don't want the black screen during loading otherwise pass USE_FADE = true

    -- Text on loading screen upon entry
    TEXT_ENTER = "Jarome Basement",
    DESC_ENTER = "You enter", 
    MSG_ENTER = "Please wait",
    -- Text on loading screen upon exit
    TEXT_EXIT = "Jarome Basement",
    DESC_EXIT = "You go out", 
    MSG_EXIT = "Please wait",
 
    TIMER_TO_TELEPORT = 8000,        -- Loading screen time 8000 seconds so that the client loads the mapping before teleporting it
    NAME_SOUND = 'door.mp3',         -- Sound file name
    VOLUME = 0.5,                    -- Sound volume
    MAX_DISTANCE_DELOAD_MAP = 300,   -- Maximum map unload distance
    FRAMEWORK = "vorp"                -- Framework name ("gum" or "vorp" or "redem" or "rsg" or "rpx" or "oldredem") or STANDALONE > FRAMEWORK = false
}

-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                                                                         ║
-- ║                      STANDALONE CONFIGURATION                           ║
-- ║                                                                         ║
-- ╚═════════════════════════════════════════════════════════════════════════╝

-- STANDALONE Configuration (Using ox_lib framework)
-- If you want to use our notifications go to [younra_bastille_under/scripts/notification.lua] to add yours
CONFIG.OX_LIB = false

-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                                                                         ║
-- ║                      NOTIFICATION CONFIGURATION                         ║
-- ║                                                                         ║
-- ╚═════════════════════════════════════════════════════════════════════════╝

-- Notification Configuration
CONFIG.NOTIFICATION = {
    ICON = 'ban',                    -- Notification icon (Only ox_lib)
    ICONCOLOR = '#C53030',           -- Icon color (Only ox_lib)
    POSITION = "top",                -- Notification position (top, bottom, etc.) (Only ox_lib)
    TEXT = "Teleportation",          -- Notification text
    DESC = "You don't have the right job", -- Notification description (Only ox_lib)
    TYPE = "error"                   -- Notification type (error, warning, etc.) (Only ox_lib)
}

-- ╔═════════════════════════════════════════════════════════════════════════╗
-- ║                                                                         ║
-- ║                     TELEPORTATION CONFIGURATION                         ║
-- ║                                                                         ║
-- ╚═════════════════════════════════════════════════════════════════════════╝
-- If you want teleportation to have no restrictions based on a player's job or permissions, you should leave both USEJOBS and USEPERMS set to false in the configuration. Here's an explanation:

-- Teleportation Configuration
CONFIG.TELEPORT = {
    PROMPT = true,                   -- Show a prompt message for teleportation
    PROMPT_TEXT = "Door",            -- Prompt message text
    TEXT = 'For open the door',      -- Text to open the door
    COORDS = {
        {  
            TELEPORT = {
                ENTER = vec3(2840.667, -1193.53, 47.652),
                EXIT = vec3(2834.232, -1196.84, 22.989)
            },
            DISTANCE = 2.0,
        },
    },   
    USEJOBS = false,                  -- Use jobs for teleportation
    JOBS = {
        '',                           -- Job name (e.g., 'police')
    },
    USEPERMS = false,                 -- Use permissions for teleportation
    PERMS = {
        '',                           -- Discord permission ID (e.g., 'discord:334771532406456330')
    }         
}
