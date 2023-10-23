Config = {}
Config.Language = "en"

Config.Locale = {
    ["en"] = {
        ["nomoney"] = "You have no money!",
        ["carryitem"] = "You can't carry more than this item!",
        ["noitemcount"] = "You don't have this many items on you!",
        ["additems"] = "You bought ${count}x ${item}!",
        ["yousell"] = "You sell ${count}x ${item} and won $${price}!",
        ["promptstore"] = "Store",
        ["dontaccess"] = "You don't acces here!",
        ["invalidCount"] = "Invalid Count!",
        ------ NEW --------
        ["shopisclose"] = "Shop is closed!",
    }
}



Config.Stores = {
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        coords = vector4(-755.36, -1361.10, 43.77, -92.84),
        promptitle = "Fishing Store",
        image = "https://cdn.discordapp.com/attachments/1106260289067950111/1158807947367956480/fishingstore.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Fishing Store",
        blipcoord = vector3(-755.36, -1361.10, 43.77),
        blipsprite = 3442726182,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = true,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = {["sheriff"] = "0"}, -- or false
        SellItems = { 
            {itemName = "a_c_fishbluegil_01_sm",itemLabel = "Small Bluegil",price = 9},
            {itemName = "a_c_fishbluegil_01_ms",itemLabel = "Medium Bluegil",price = 13},
            {itemName = "a_c_fishchannelcatfish_01_xl",itemLabel = "Channel Catfish (Extra Large)",price = 12},
            {itemName = "a_c_fishbullheadcat_01_sm",itemLabel = "Small Bullhead",price = 10},
            {itemName = "a_c_fishbullheadcat_01_ms",itemLabel = "Medium Bullhead",price = 12},
            {itemName = "a_c_fishchainpickerel_01_sm",itemLabel = "Small Pickerel",price = 12},
            {itemName = "a_c_fishchainpickerel_01_ms",itemLabel = "Medium Pickerel",price = 14},
            {itemName = "a_c_fishlargemouthbass_01_lg",itemLabel = "Large Mouth Bass (Large)",price = 17},
            {itemName = "a_c_fishlakesturgeon_01_lg",itemLabel = "Lake Sturgeon (Large)",price = 19},
            {itemName = "a_c_fishlargemouthbass_01_ms",itemLabel = "Lardgemouth Bass",price = 20},
            {itemName = "a_c_fishlongnosegar_01_lg",itemLabel = "Long Nose Gar (Large)",price = 24},
            {itemName = "a_c_fishnorthernpike_01_lg",itemLabel = "Northern Pike (Large)",price = 22},
            {itemName = "a_c_fishperch_01_sm",itemLabel = "Small Perch",price = 12},
            {itemName = "a_c_fishperch_01_ms",itemLabel = "Medium Perch",price = 15},
            {itemName = "a_c_fishredfinpickerel_01_sm",itemLabel = "Small Redfin Pickerel",price = 16},
            {itemName = "a_c_fishredfinpickerel_01_ms",itemLabel = "Medium Redfin Pickerel",price = 19},
            {itemName = "a_c_fishrockbass_01_sm",itemLabel = "Small Rockbass",price = 15},
            {itemName = "a_c_fishrockbass_01_ms",itemLabel = "Medium Rockbass",price = 17},
            {itemName = "a_c_fishsalmonsockeye_01_lg",itemLabel = "Salmon Sockeye (Large)",price = 19},
            {itemName = "a_c_fishsalmonsockeye_01_ml",itemLabel = "Salmon Sockeye (Medium-Large)",price = 17},
            {itemName = "a_c_fishsalmonsockeye_01_ms",itemLabel = "Sockeye Salmon",price = 19},
            {itemName = "a_c_fishsmallmouthbass_01_lg",itemLabel = "Small Mouth Bass (Large)",price = 22},
            {itemName = "a_c_fishsmallmouthbass_01_ms",itemLabel = "Smallmouth Bass",price = 24},
        },
        BuyItems = {
            {itemName = "fishingrod",itemLabel = "Fishing Rod",price = 50},
            {itemName = "fishbait",itemLabel = "Yem",price = 2},
            {itemName = "efsun",itemLabel = "Efsun",price = 1000},
            {itemName = "blessing_paper",itemLabel = "Blessing Paper",price = 150},
            {itemName = "rituel10",itemLabel = "Rituel 10",price = 300},
            {itemName = "rituel20",itemLabel = "Rituel 20",price = 350},
            {itemName = "rituel30",itemLabel = "Rituel 30",price = 400},
            {itemName = "rituel50",itemLabel = "Rituel 50",price = 450},
        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        coords = vector4(2824.37, -1319.28, 46.81, 320.08),
        promptitle = "Saint Denis General Store",
        image = "https://cdn.discordapp.com/attachments/983538631127998464/1158843125180141688/75.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Saint Denis General Store",
        blipcoord = vector3(2825.71, -1318.27, 46.81),
        blipsprite = 1475879922,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = true,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false,
        SellItems = {},                                               -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "canteen",itemLabel = "Canteen",price = 40},
            {itemName = "apple",itemLabel = "Apple",price = 3.95},
            {itemName = "consumable_pretzel",itemLabel = "Pretzel",price = 4.35},
            {itemName = "water",itemLabel = "water",price = 1.99}
        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        coords = vector4(1329.77, -1294.48, 77.07, 60.17),
        promptitle = "Rhodes General Store",
        image = "https://cdn.discordapp.com/attachments/983538631127998464/1158843125180141688/75.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Rhodes General Store",
        blipcoord = vector3(1328.28, -1293.19, 77.07),
        blipsprite = 1475879922,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = true,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false,
        SellItems = {},                                               -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "canteen",itemLabel = "Canteen",price = 40},
            {itemName = "apple",itemLabel = "Apple",price = 3.95},
            {itemName = "consumable_pretzel",itemLabel = "Pretzel",price = 4.35},
            {itemName = "water",itemLabel = "water",price = 1.99}
        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        coords = vector4(-323.97, 803.41, 117.93, 228.64),
        promptitle = "Valentine General Store",
        image = "https://cdn.discordapp.com/attachments/983538631127998464/1158843125180141688/75.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Valentine General Store",
        blipcoord = vector3(-322.25, 803.58, 117.93),
        blipsprite = 1475879922,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "mech_inspection@store_shelf@top3",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = true,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false,
        SellItems = {},                                               -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "canteen",itemLabel = "Canteen",price = 40},
            {itemName = "apple",itemLabel = "Apple",price = 3.95},
            {itemName = "consumable_pretzel",itemLabel = "Pretzel",price = 4.35},
            {itemName = "water",itemLabel = "water",price = 1.99}
        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        coords = vector4(-784.98, -1322.11, 43.93, 186.78),
        promptitle = "Blackwater General Store",
        image = "https://cdn.discordapp.com/attachments/983538631127998464/1158843125180141688/75.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Blackwater General Store",
        blipcoord = vector3(-784.98, -1322.11, 43.93,),
        blipsprite = 1475879922,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SELL_PAPER_MALE_A",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = true,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false,
        SellItems = {},                                               -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "canteen",itemLabel = "Canteen",price = 40},
            {itemName = "apple",itemLabel = "Apple",price = 3.95},
            {itemName = "consumable_pretzel",itemLabel = "Pretzel",price = 4.35},
            {itemName = "water",itemLabel = "water",price = 1.99}
        }
        
    }
}



-- You can customize it here
local isServer = IsDuplicityVersion()
function Notify(data)
    local text = data.text
    local time = data.time
    local type = data.type
    if isServer then
        local src = data.source
        -- Serverside
        TriggerClientEvent("vorp:TipBottom",src, text, time, type)
    else
        -- Clientside
        TriggerEvent("vorp:TipBottom", text, time, type)
    end
end

function Locale(key,subs)
    local translate = Config.Locale[Config.Language][key] and Config.Locale[Config.Language][key] or "Config.Locale["..Config.Language.."]["..key.."] doesn't exits"
    subs = subs and subs or {}
    for k, v in pairs(subs) do
        local templateToFind = '%${' .. k .. '}'
        translate = translate:gsub(templateToFind, tostring(v))
    end
    return tostring(translate)
end