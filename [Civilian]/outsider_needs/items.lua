Items = {}


--############ THESE ARE JUST EXAMPLES MAKE YOUR OWN AND ADD THEM TO THE DATABSE ###############

-- * EXAMPLES *--
-------- give item back after use --------
-- add this to each item if you want an item to give back another item after use like eating an apple can get appleseeds

--[[
    giveItemBack          = true, -- should it give the item back after use ?
    itemsToGive           = {
        appleseeds = 1,            -- item name and ammount
    }

]]

------ custom items ------
-- add this to any item, if this is enabled then it wont do any animations or effects or add any value to needs, you must do that your self.
-- this is for developers only

--[[
    -- this is server side only
    customFunction        = function(source, value)
       -- value is the values you set for the item like addhealth = 10  etc
       -- source is the player source
       CustomFunction(source, value) -- to a server side file
       or
       TriggerClientEvent("CustomFunction", source, value) -- to a client side file
    end

    -- example in server file
    function CustomFunction(source, value)
       -- do your stuff here and trigger to client for animations and effects
    end
 ]]



Items.Consumables = {
    Types = {
        ---------------------------------------------------------------------------------------
        ----------------------------------- * FOOD ITEMS *-------------------------------------
        -- types of animation  for  * eat * >>>  [ "hand" "sandwich" "bowl" "canned" "berry" ] each type has its own anmimation
        --  if you add gold core  they already have sounds and effects, same for health remove and stamina.
        -- gold options are in duration


        Food = {
            mashapple = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 10,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,                       -- duration
                addgooldstaminaOutter = 0,                       -- duration
                addgoldhealthInner    = 0,                       -- duration
                addgoldhealthOutter   = 0,                       -- duration
                Type                  = "eat",
                animationtype         = "sandwich",              -- check the top to see more animations
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_bit_bread06",         -- not all models will be positioned correctly
                Drunk                 = false,                   -- if you want to get drunk from this item
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,                   -- if you want to use the drunk effect or set false
                Drunkness             = 0.0,                     -- drunkness starting level  0.20 is light drunk the more they drink the more drunk they get or set to 1.0 max drunk effect
                DrunkDuration         = 0,                       -- in seconds -- how long the drunk effect will last
                TimesUsed             = 1,                       -- how many times can this item be used
                amountToCool          = 0,                       -- a number to cool the player down
                cooldown              = 0,                       -- duration it should last to cool down in seconds
                amountToWarm          = 0,                       -- a number to warm the player up for cold weathers  or hot food
                warmup                = 0,                       -- duration it should last to warm up in seconds
                requiredItem          = false,                   -- does it require an extra item to use this ? like a spoon ? its a table {"itemname", "itemname2"}
                removeRequiredItem    = false,                   -- should it remove the required item after use ?
                addStress             = 0,                       -- should this item add stress to player ? max is 100
                addAddiction          = 0,                       --  should this item add addiction to player ? max is 100
                removeAddiction       = 0,                       -- should this item remove addiction to player ? max is 100
                removeStress          = 0,                       -- should this item remove stress to player ? max is 100
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
            },
            apple = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 8,
                addthirst             = 8,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_bit_apple01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = true, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            banana = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 11,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_banana_day_01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                },
            beefjerky = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_jerky01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            blueberry = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 8,
                addstamina            = 0,
                addhunger             = 8,
                addthirst             = 8,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_inv_raspberry01bx",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            boiledegg = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_egg01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            consumable_chocolatecake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            consumable_oatcake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            consumable_blueberrypie = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            consumable_bluegil = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_jerky01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }
            },
            consumable_breakfast = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 25,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_stewplate01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_caramel = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 5,
                addstamina            = 0,
                addhunger             = 5,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_inv_raspberry01bx",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_chickenpie = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 20,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_bowl04x_stew",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_coffeecake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_crumbcake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_barbecue_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_cheddar_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_spicy_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_sourcream&onion_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_gold_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bambam_chips = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_cupcake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_donut = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 9,
                addstamina            = 0,
                addhunger             = 9,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_game = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 14,
                addstamina            = 0,
                addhunger             = 14,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_jerky01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_fruitsalad = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 30,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_canpineapple01x",     -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_grapejelly = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 7,
                addstamina            = 0,
                addhunger             = 7,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_kidneybeans_can = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 13,
                addstamina            = 0,
                addhunger             = 13,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_lemoncake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_meat_greavy = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 18,
                addstamina            = 0,
                addhunger             = 18,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_peachcobbler = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 13,
                addstamina            = 0,
                addhunger             = 13,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_peach = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 8,
                addthirst             = 8,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_bit_peach01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_pear = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 8,
                addthirst             = 8,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_pear_01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_peppermint = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 5,
                addstamina            = 0,
                addhunger             = 5,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_inv_raspberry01bx",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_peachjelly = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 7,
                addstamina            = 0,
                addhunger             = 7,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_poundcake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_pretzel = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 9,
                addstamina            = 0,
                addhunger             = 9,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_raspberryjelly = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 7,
                addstamina            = 0,
                addhunger             = 7,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_salmon = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_jerky01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_salmon_can = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 15,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cuptin01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_spongecake = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 12,
                addstamina            = 0,
                addhunger             = 12,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_steak = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 50,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_bowl04x_stew",        -- bowl do not need object
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 10,    -- can be used as spicy food
                warmup                = 0,     -- how long should the hot last
                requiredItem          = false, -- you can require a spoon in order to eat from a bowl leave false if you dont want
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_steakpie = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 50,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "bowl",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_bowl04x_stew",        -- bowl do not need object
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 10,    -- can be used as spicy food
                warmup                = 0,     -- how long should the hot last
                requiredItem          = false, -- you can require a spoon in order to eat from a bowl leave false if you dont want
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_trout = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 35,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "bowl",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_trout02x",         -- bowl do not need object
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 10,    -- can be used as spicy food
                warmup                = 0,     -- how long should the hot last
                requiredItem          = false, -- you can require a spoon in order to eat from a bowl leave false if you dont want
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_veggies = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 15,
                addstamina            = 0,
                addhunger             = 22,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "bowl",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_carrot01x",           -- bowl do not need object
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 10,    -- can be used as spicy food
                warmup                = 0,     -- how long should the hot last
                requiredItem          = false, -- you can require a spoon in order to eat from a bowl leave false if you dont want
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_herb_chanterelles = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 4,
                addstamina            = 0,
                addhunger             = 4,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_herbsdry04x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_herb_evergreen_huckleberry = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 4,
                addstamina            = 0,
                addhunger             = 4,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_herbsdry04x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_herb_oregano = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 4,
                addstamina            = 0,
                addhunger             = 4,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_herbsdry04x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_herb_vanilla_flower = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 4,
                addstamina            = 0,
                addhunger             = 4,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_herbsdry04x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_herb_wintergreen_berry = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 4,
                addstamina            = 0,
                addhunger             = 4,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "canned",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_herbsdry04x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            consumable_shepardspie = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 20,
                addstamina            = 0,
                addhunger             = 50,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "bowl",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "",                      -- bowl do not need object
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 10,    -- can be used as spicy food
                warmup                = 0,     -- how long should the hot last
                requiredItem          = false, -- you can require a spoon in order to eat from a bowl leave false if you dont want
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            consumable_chocolate = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 10,
                addstamina            = 0,
                addhunger             = 8,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "berry",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_inv_raspberry01bx",   -- berries no need for model
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            bwb_bb = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_ap = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_bm = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_cc = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_ccc = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_cr = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_pgd = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_pt = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_sc = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
            bwb_ss = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 25,
                addstamina            = 0,
                addhunger             = 40,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "eat",
                animationtype         = "hand",                  -- types for eat [ hand sandwich bowl canned berry ]
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "p_oatcake01x",        -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 20,
                warmup                = 10,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                },
                -- give item back NEW FEATURE
                giveItemBack          = false, -- should it give the item back after use ? like a bowl or spoon
                itemsToGive           = {
                    apple = 2,                -- item name and ammount
                }

            },
        },
        ----------------------------------------------------------------------------------------
        ----------------------------------- * DRINK ITEMS *-------------------------------------
        -- types of animation for  * drink * >> [  "mug" "flask" "bottle" "potion" "fastdrink" ] -- each type has its own anmimation
        Drinks = {
            --ITEM NAME--
            consumable_coffee = {
                -- item name like in your database
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 10,
                addhunger             = 0,
                addthirst             = 10,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "mug",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_mugCoffee01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            water = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 50,
                addhunger             = 0,
                addthirst             = 20,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Jack Jill", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            consumable_raspberrywater = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 50,
                addhunger             = 0,
                addthirst             = 20,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Jack Jill", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            antipoison = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 50, -- heal this will add to outter or inner depending of players health
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 5,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 50,
                Type                  = "drink",
                animationtype         = "potion",                -- this type usefull for healing  or gold cores
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_rc_poisonedwater01x", -- not all models will be positioned correctly
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = false,
                Drunkness             = 0.0,
                DrunkDuration         = 0,
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 0,
                warmup                = 0,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false,
                    effectName = "PlayerOverpower", -- effect name example this one will do goldcore effect you can find more in rdr3 discoveries github
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up", --  you can find more in rdr3 discoveries github
                    soundRef = "Consumption_Sounds"
                }
            },
            unique_ayahuasca_diablo = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 40,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 50,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "bottle",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_bottlebeer01a",
                Drunk                 = true,
                DrunkEffect           = "MP_Downed", -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = true,
                Drunkness             = 0.30,
                DrunkDuration         = 60, -- seconds
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 3,
                warmup                = 60,    -- seconds
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
            vodka = {
                removethirst          = 0,
                removehunger          = 5, -- remove hunger when drinking alcohol?
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 20,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "flask",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "",                      -- flask no need model already has builtin animation
                Drunk                 = true,
                DrunkEffect           = "MP_Downed",             -- play a light effect only when you too drunk it will increase
                UseDrunkEffect        = true,
                Drunkness             = 0.60,                    -- 0,20 slight drunk 0.50 medium 1.0 very drunk
                DrunkDuration         = 20,                      --miliseconds
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
            bwb_cwc = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 150,
                addhunger             = 0,
                addthirst             = 40,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            bwb_fp = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 150,
                addhunger             = 0,
                addthirst             = 40,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            bwb_pit = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 150,
                addhunger             = 0,
                addthirst             = 40,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            bwb_pm = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 150,
                addhunger             = 0,
                addthirst             = 40,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                Type                  = "drink",
                animationtype         = "fastdrink",
                description           = "Provided by Black Water Bakery", -- provide a custom description for this item
                model                 = "s_inv_moonshine01x",
                Drunk                 = false,
                DrunkEffect           = "MP_Downed",
                UseDrunkEffect        = false,
                DrunkDuration         = 0,
                TimesUsed             = 3,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                addStress             = 0,
                addAddiction          = 0,     -- max is 100
                removeAddiction       = 0,
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
        },
        ---------------------------------------------------------------------------------------
        ----------------------------------- * MEDICAL ITEMS *----------------------------------
        -- types of animation for  * meds * >> [ "syringe" "pill" "potion", "bandage" ] -- each type has its own anmimation

        Meds = {
            syringe = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "syringe",                 -- with different animation
                description           = "Provided by Jack&Jill",   -- provide a custom description for this item
                model                 = "mp007_p_mp_syringe01x_1", -- model name
                --  make player dizzy when using this item
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                removeStress          = 0,
                removeAddiction       = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
            bandage = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "bandage",               -- with different animation
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "p_cs_bandage01x",       -- model name
                --  make player dizzy when using this item
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                removeStress          = 0,
                removeAddiction       = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
            herbalremedy = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "potion",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_rc_poisonedwater01x", -- model name
                --  make player dizzy when using this item
                TimesUsed             = 1,
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                removeStress          = 0,
                removeAddiction       = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
            antibiotics = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "pill",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                model                 = "s_rc_poisonedwater01x", -- model name
                --  make player dizzy when using this item
                TimesUsed             = 10,                      -- this counts as if it s a box of 10 pills
                amountToCool          = 0,
                cooldown              = 0,
                amountToWarm          = 5,
                warmup                = 30,
                requiredItem          = false,
                removeRequiredItem    = false, -- should it remove the required item after use ?
                removeStress          = 0,
                removeAddiction       = 0,
                effects               = {
                    addEffect = false,
                    effectName = "",
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
        },
        ----------------------------------------------------------------------------------------
        ----------------------------------- * HORSE ITEMS *-------------------------------------
        -- animationtype >> [ "food" , "stimulant",  "brush" ] -- each type has its own anmimation
        Horse = {
            consumable_haycube = {
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 50,
                addstamina            = 50,
                addgooldstaminaInner  = 100,
                addgooldstaminaOutter = 100,
                addgoldhealthInner    = 100,
                addgoldhealthOutter   = 100,
                animationtype         = "food",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 1,                       -- this item can have many uses for example a brush
                effects               = {
                    addEffect = false,                           -- effect name
                    effectName = "",                             -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                },
                addexp                = 7,     -- syn horse experience
                WaitTime              = 60000, -- 1 minute untill it can be add xp again so folks dont spam this
            },
            -- brush will clean the horse coat
            horsebrush = {
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 10,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 0,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "brush",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 3,                       -- this item can have many uses for example a brush
                effects               = {
                    addEffect = false,                           -- effect name
                    effectName = "",                             -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                },
                addexp                = 7,     -- syn horse experience
                WaitTime              = 60000, -- 1 minute untill it can be add xp again so folks dont spam this
            },
            stim = {
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addgooldstaminaInner  = 100,
                addgooldstaminaOutter = 100,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "stimulant",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 1,                       -- this item can have many uses for example a brush
                effects               = {
                    addEffect = false,                           -- effect name
                    effectName = "",                             -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                },
                addexp                = 7,     -- syn horse experience
                WaitTime              = 60000, -- 1 minute untill it can be add xp again so folks dont spam this
            },

        },

        -----------------------------------------------------------------------------------------
        ----------------------------------- * SMOKES ITEMS *-------------------------------------
        -- animationtype >> [ "cigarette" , "cigar", "pipe" ] -- each type has its own anmimation

        Smokes = {
            cigarette = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "cigarette",
                description           = "Jack&Jill Cigarette pack", -- provide a custom description for this item
                TimesUsed             = 10,
                requiredItem          = false,                      -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                      -- should it remove the required item after use ?
                addAddiction          = 100,                        -- max is 100
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            cigar = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "cigar",
                description           = "Jack&Jill Cigarette pack", -- provide a custom description for this item
                TimesUsed             = 10,
                requiredItem          = false,                      -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                      -- should it remove the required item after use ?
                addAddiction          = 2,                          -- max is 100
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }

            },
            pipe = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "pipe",
                description           = "Jack&Jill Cigarette pack", -- provide a custom description for this item
                TimesUsed             = 1,
                requiredItem          = false,                      -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                      -- should it remove the required item after use ?
                addAddiction          = 100,                        -- max is 100
                removeStress          = 0,
                effects               = {
                    addEffect = false, -- effect name
                    effectName = "",   -- effect name
                },
                sounds                = {
                    addSound = false,
                    soundName = "Core_Fill_Up",
                    soundRef = "Consumption_Sounds"
                }
            },
        },

        ----------------------------------------------------------------------------------------
        ----------------------------------- * DRUGS ITEMS *-------------------------------------
        -- animationtype >> [ "inject" , "peyote", "smoke" ] -- each type has its own anmimation
        -- effects are already set for each aniamtion
        Drugs = {
            opium = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "inject",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 1,
                requiredItem          = false,                   -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                   -- should it remove the required item after use ?
                addAddiction          = 0,                       -- max is 100
                removeStress          = 0,

            },

            peyote = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "peyote",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 1,
                requiredItem          = false,                   -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                   -- should it remove the required item after use ?
                addAddiction          = 100,                     -- max is 100
                removeStress          = 0,

            },

            hemp = {
                removethirst          = 0,
                removehunger          = 0,
                removestamina         = 0,
                removehealth          = 0,
                addhealth             = 0,
                addstamina            = 0,
                addhunger             = 0,
                addthirst             = 0,
                addgooldstaminaInner  = 0,
                addgooldstaminaOutter = 20,
                addgoldhealthInner    = 0,
                addgoldhealthOutter   = 0,
                animationtype         = "smoke",
                description           = "Provided by Jack&Jill", -- provide a custom description for this item
                TimesUsed             = 1,
                requiredItem          = false,                   -- like matches or a lighter {"itemname",add more}
                removeRequiredItem    = false,                   -- should it remove the required item after use ?
                addAddiction          = 100,                     -- max is 100
                removeStress          = 0,

            },
        },
    },
}
