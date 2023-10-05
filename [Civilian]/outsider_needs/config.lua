Config                    = {
    -- in vorp core config disable health and stamina UI cores
    --=================================== HUNGER AND THIRST ======================================--
    Devmode                  = true,  -- set to true if you testing things
    -- MAX THIRST AND HUNGER IS 100
    saveNeedsTick            = 60000, -- save player data on server every 1 minute
    removehunger             = 0.1,   -- how much to remove at every tick
    removethirst             = 0.2,   -- how much to remove at every thick
    RemoveThirstTick         = 10000, -- thick every 10 seconds removes 0.1 of thirst from out of 100
    RemoveHungerTick         = 10000, -- thick every 10 seconds removes 0.2 of hunger
    removeWhenInSprintHunger = 0.5,   -- leave 0 if hunger is not removed when sprinintg, if more than 0 then at every `remove thirst tick` will be removed this amount
    removeWhenInSprintThirst = 0.5,   --  if more than 0 then at every `remove hunger thick` will be removed this amount, at every 10 seonds 0.5 will be removed if player is sprining
    removeHealthHunger       = 1,     -- once hunger is 0 remove this much -- NEW
    removeHealthThirst       = 1,     -- once  thirst is 0 remove this much -- NEW
    NotifyThirst             = 15000, -- time for each notification to draw when Thirst is low
    NotifyHunger             = 15000, -- dont make it too long or players prob wont see them changing
    disableAudioPain         = false,  -- if true will disable audio pain when hunger or thirst is lower -- >>>>>>>>>>>> NEW FEATURE <<<<<<<<<<<< --
    --=================================== TEMPERATURE ============================================--
    Colors                   = {
        one = "img/rpg_verycold.png",                    -- very cold
        two = "img/rpg_cold1.png",                       -- cold
        three = "img/rpg_cold.png",                      -- normal
        four = "img/rpg_cold.png",                       -- normal
        five = " img/rpg_hot1.png",                      -- hot
        six = "img/rpg_veryhot.png",                     -- very hot
        seven = "img/rpg_cold.png",                      -- normal
    },
    border                   = " 5px ",                  -- for the UI body temp border to make it ticker or slimer
    localTempCelsius         = false,                     -- if false will use fahrenheit
    whenTooHotRemoveThirst   = 0.5,                      -- amount to remove thirst when too hot  [startRemoveThirst = 30,] define here when should be too hot this will also effect clothing
    whenTooColdRemoveHunger  = 0.5,                      -- amount to remove hunger when too cold [startRemoveHunger = -5,] define bellow when should be too cold this will also effect clothing
    TickTemperature          = 6000,                     -- at every 6 seconds if too cold or too hot  remove hunger or thirst? increase or decrease use in miliseconds
    -- translate this if you dont use fahrenheit --
    startRemoveHunger        = -10,                      -- at -14 degrees celcius 23
    startRemoveThirst        = 34,                       -- at 33 degrees celcius  will start removing thirst and temp will be darkred
    MaxTemperature           = 26,                       -- if past this clothing used o will start the system ListHash below
    MinTemperature           = 5,                        -- if bellow this Clothing used will start system bellow  ListHash
    ---- for the UI  and colors translate to fahrenheit ----
    LightBlue                = 5,                        -- light blue starts at 5 degrees celcius
    White                    = 15,                       -- white starts at 15 degrees celcius
    White1                   = 20,                       -- white starts at 20 degrees celcius
    LightRed                 = 25,                       -- light red starts at 25 degrees celcius
    -------------------------------
    RemoveWheninwater        = 10,                       -- when inside water cool player the amount remove is this
    --* Permissions
    commandHeal              = "healneeds",              -- command to heal hunger and thirst
    EditCommand              = "editneeds",              -- command to edit UI
    commandHideNeeds         = "hideneeds",              -- command to hide the UI
    groups                   = { "admin", "moderator" }, -- group to use command heal
    UIdefault                = "showalways",             -- on default to show always the UI if not then add "normal"
    ------------------------
    ---- * UI VOICE * ------
    useUiVoice               = true,
    UseSaltyChat             = false,       -- if you use salty chat set this to true
    PressTalking             = 0x4BC9DABB, --N key only works for pma oice
    voice                    = {
        whisper = {
            distance = 3.0,                    -- distance for whisper
            img = "voiceyellow.png",           -- color for whisper
            name = "Whisper",                  -- name for whisper
            colorMarker = { 255, 255, 0, 255 } -- rgba
        },
        normal  = {
            distance = 10.0,                 -- distance for normal
            img = "voicegreen.png",          -- color for normal
            name = "Normal",                 -- name for normal
            colorMarker = { 0, 255, 0, 255 } -- rgba
        },
        shout   = {
            distance = 20.0,                 -- distance for shout
            img = "voiceblue.png",           -- color for shout
            name = "Shout",                  -- name for shout
            colorMarker = { 0, 0, 255, 255 } -- rgba
        },
        trail   = {
            distance = 30.0,                 -- distance
            img = "voicered.png",            -- color
            name = "Trail",                  -- name
            colorMarker = { 255, 0, 0, 255 } -- rgba
        }
    },
    --------------------------
    -- * GOLD CORES COLOR * --
    useHealthStaminaSystem   = true, -- if true will use health and stamina UI
    goldcorescolorStamina    = "rgba(253, 216, 53, 255)",
    goldcorecolorHealth      = "rgba(253, 216, 53, 255)",
    -------------------------
    -- * DIRTY SYSTEM UI * --
    UseDirtySystem           = true,   -- if true will use the bathtub ui
    ItemCure                 = "coal", -- item to cure sickness
    SickRemoveStamina        = 100,    -- remove stamina while sick
    SickRemoveHunger         = 3,      -- remove hunger while sick
    Difficulty               = 100,    -- minimum is 1  if 100 then its 1 out of 100 chance to get sick
    UnluckyNumber            = 80,     -- if above 80 then player will get sick
    BellowThisValueCanCure   = 20,     -- can only cure if dirtiness is bellow 20
    ActvateSickness          = 70,     -- if above 70 dirtiness then player will go to the change of getting sick, if they go bellow it stops untill it goes up again
    -------------------------------------------------------------
    ------------- * ADDICTION & STRESS SYSTEM * -----------------
    Stress                   = {
        usestress = false,            -- if true will use stress
        WaterFoodLevel = 1,          --  at every one second it will add this value if food or water is below 0
        --* NEW *--
        ShootingLevel = 1,           -- at every one second it will add this value if player is shooting  <<<<<<NEW FEATURE >>>>>>>
        MeleeCombatLevel = 1,        -- at every one second it will add this value if player is  fighting <<<<<<NEW FEATURE >>>>>>>
        SprintingOnFootLevel = 1,    -- at every one second it will add this value if player is sprinting on foot or on horse or on vehicle
        SpritingOnHorseLevel = 1,    -- at every one second it will add this value if player is sprinting on horse
        SprintingInVehicleLevel = 1, -- at every one second it will add this value if player is sprinting on wagon

        Scenarios = {
            -1551600085, -- sitting
            254049387,   -- resting
            -- add more scenarios here where Stress can be removed when a player is using these scenarios
        },
        ScenarioLevel = 1,  -- at every one second it will remove this value of stress if player is using the scenarios above
        CrouchingLevel = 1, -- at every one second it will add this value if player is crouching
        -- stress levels for efects and animatios
        Level1 = {
            StressRemoveStamina = 0, -- remove stamina while stressed every 1 second
            CanHoldWeapons = false,  -- if true player cant hold weapons
            Blurriness = 0.0,        -- blurriness while stressed
        },
        Level2 = {
            CanHoldWeapons = false,    -- if true player cant hold weapons
            StressRemoveStamina = 0.1, -- remove stamina while stressed every 1 second
            Blurriness = 2.5,          -- blurriness while stressed
            AnimPostfx = '',           --l_0026a09djq
        },
        Level3 = {
            CanHoldWeapons = true,     -- if true player cant hold weapons
            StressRemoveStamina = 0.2, -- remove stamina while stressed every 1 second
            Blurriness = 3.5,          -- blurriness while stressed
            --* NEW* --
            removeHud = true,          -- if true will remove all HUDS playercant access no prompts no weapons or receive any notifications
            AnimPostfx = 'MP_VibrationAlt',
        },
    },

    Addiction                = {
        useaddiction = false,                  -- if true will use addiction
        Level1 = {
            AddictionRemoveHungerLevel = 0.5, -- remove hunger while addicted,
            AddictionRemoveThirstLevel = 0.5, -- remove thirst while addicted
            Tick = 60000 * 5,                 -- every 5 minutes will remove the above play animations and efects
            Blurriness = 2.0,                 -- blurriness while addicted
            FX = "l_006d48b6ph"
        },
        Level2 = {
            AddictionRemoveHungerLevel = 0.5, -- remove hunger while addicted,
            AddictionRemoveThirstLevel = 0.5, -- remove thirst while addicted
            Tick = 60000 * 3,                 -- every 3 minutes will remove the above play animations and efects
            Blurriness = 3.0,                 -- blurriness while addicted
        },
        Level3 = {
            AddictionRemoveHungerLevel = 0.5, -- remove hunger while addicted,
            AddictionRemoveThirstLevel = 0.5, -- remove thirst while addicted
            Tick = 60000,                     -- every 10 seconds will remove the above play animations and efects
            Blurriness = 4.0,                 -- blurriness while addicted
            FX = "l_006d48b6ph",
            FX2 = "l_0009ec35bj"
        }
    },


    -------------------------------------------------------------
    ------------- * DRUNK SYSTEM * ------------------------------
    Random                 = math.random(1, 2), -- min and max chance to get up when pressing to get up when drunk
    TimeDrunk              = 90,                -- seconds time to stay seriously drunk  dont add more than 120 or players will relog to get rid of it.
    RemoveThirstAfterDrunk = 10,                -- after player is wakeus up from being drunk remove thirst
    RemoveHungerAfterDrunk = 10,                -- after player is wakeus up from being drunk remove hunger
    -------------------------------------------------------------
}

Config.CommandGetScenario =
"getscenario" -- if dev mode is true you can use this command to get scenario hash for stress list

--* CLOTHING SYSTEM * --

Config.ListHash           = {
    -- * dont touch hash
    -- * this edit makes players wear coats in too cold weathers and remove coats in too hot weathers
    -- * with this sytem players will be obligated to dress weather appropriate
    Shirt   = {
        hash = 0x2026C46D,
        amountAddHeatWhenCold = 2, -- add heat if wearing in low temperatures | makes ped warm
        amountAddHeatWhenHot = 2,  -- add heat if in high temperatures and is wearing this clothing | makes ped hot
    },
    Coats   = {
        hash = 0xE06D30CE,
        amountAddHeatWhenCold = 6,
        amountAddHeatWhenHot = 6,
    },
    Pants   = {
        hash = 0x1D4C528A,
        amountAddHeatWhenCold = 2,
        amountAddHeatWhenHot = 0,
    },
    Boots   = {
        hash = 0x777EC6EF,
        amountAddHeatWhenCold = 2,
        amountAddHeatWhenHot = 0,
    },
    Ccoats  = {
        hash = 0x662AC34,
        amountAddHeatWhenCold = 7,
        amountAddHeatWhenHot = 7,
    },
    Vest    = {
        hash = 0x485EE834,
        amountAddHeatWhenCold = 2,
        amountAddHeatWhenHot = 0,
    },
    Poncho1 = {
        hash = 0xAF14310B,
        amountAddHeatWhenCold = 3,
        amountAddHeatWhenHot = 0,
    },
    Poncho2 = {
        hash = 0x3C1A74CD,
        amountAddHeatWhenCold = 3,
        amountAddHeatWhenHot = 0,
    },
}

-- * TRANSALATION * --

Config.Translation        = {
    text1 = "show or hide needs HUD.",
    text2 = "heal hunger and thirst.",
    text3 = "no need for ID if for your self, or add id if for player or all to heal everyone",
    text4 = "you are very cold",
    text5 = "you are very hot",
    text6 = "you are starting to lose health, drink water",
    text7 = "you are dehydrated",
    text8 = "you are starting to be dehydrated",
    text9 = "you are starting to loose health, eat something",
    text10 = "you are starting to feel weak.",
    text11 = "you are hungry",
    text12 = "times left to use",
    text13 = "you need another item ",
    text14 = "Remove your mask ",
    text15 = "you are drunk",
    text16 = "you are too drunk to get up",
    text17 = "you are Now very drunk",
    text18 = "you are getting drunk",
    text19 = "you are getting Tipsy",
    text20 = "Drunk",
    text21 = "the patient needs a bath",
    text22 = "you need a bath you can catch diseases if you stay too long dirty",
    text23 = "you have caugh a disease seek for a doctor you have catched the pig disease",
    text24 = "you have been cured ",
    text25 = " you are dirty",
    text26 = "Once you have finished Press ESC to close and save",
    text27 = "You are not sick to use this medicine",
    prompt1 = "Put Away",
    prompt2 = "Inhale",
    prompt3 = "stance",
    PromptLabel = "Change Stance", -- NEW
    PromptLabel2 = " Smoking ",    -- NEW
}

-- * NOTIFICATIONS
-- Add your own notifications here
function ClientNotify(type, text, VORP)
    if type == 1 then                    --  cant do
        VORP.NotifyObjective(text, 5000) -- change here to the notify you want
    else                                 -- sucess
        VORP.NotifyRightTip(text, 5000)  -- change here to the notify you want
    end
end

function ServerNotify(type, text, VORP, source)
    if type == 1 then                                -- cant do
        if source then                               -- no touch
            VORP.NotifyObjective(source, text, 5000) -- change here to the notify you want
        end
    else                                             --  sucess
        if source then                               -- no touch
            VORP.NotifyRightTip(source, text, 5000)  -- change here to the notify you want
        end
    end
end
