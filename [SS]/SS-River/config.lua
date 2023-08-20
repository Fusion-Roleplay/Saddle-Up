-- Author '🅱🅻🆄🅴🆈🅴🆂#1364' by Sirec Studio -- 
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

local VorpCore = {}
TriggerEvent("getCore",function(core)
    VorpCore = core
end)

Config = {

NxtMetabolism = false, -- if you have NxtMetabolism
progressBars = true, -- if you have progressBars
FredMetabolism = false, -- if you have Fred Metabolism
TpRealistic = false, -- if you tp_realistic_flieswamping
GoldPanning = true, -- if you have SS-GoldPanning
    
PressKey = 0x760A9C6F, -- (G) Key to press when you are near Water
WashKey = 0x07CE1E61, -- (MOUSE1) to wash yourself
DrinkKey = 0xF84FA74F, -- (MOUSE2) Key to drink water
FillKey = 0xCEFD9220, -- (E) Key to fill the canteen
FillBotKey = 0xE30CD707, -- (R) to fill the bottle
SearchGold = 0xD9D0E1C0, -- (SPACE) to search gold
FillBucket = 0xCEE12B50, -- (MOUSE 3) to fill the bucket
    
WashDict = "amb_misc@world_human_wash_face_bucket@ground@male_a@idle_d",
WashAnim = "idle_l",
DrinkCanDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
DrinkCanAnim = "idle_a",
DrinkScene = "WORLD_HUMAN_BUCKET_DRINK_GROUND",
DrinkSceneFem = "WORLD_HUMAN_CROUCH_INSPECT",
DrinkTime = 17, -- 17 seconds
FillScene = "WORLD_HUMAN_CROUCH_INSPECT",
FillTime = 5, -- 5 seconds
DrinkThirst = 50, -- refill 50% thirst metabolism !    
-------------------------------------------
Can100 = "can_100",
Can75 = "can_75",
Can50 = "can_50",
Can25 = "can_25",
EmptyCan = "empty_can",
EmptyBottle = "glassbottle",
FullBottle = "water",
--------------------------------------------    
Text = {
["tittle_notification"] = "RIVER ACTION",
["riv_txt"] = "INTERACT",
["riv_wash"] = "WASH",
["riv_drink"] = "DRINK",
["riv_fill"] = "FILL CANTEEN",
["riv_fillbot"] = "FILL BOTTLE",
["riv_fillbucket"] = "FILL BUCKET",
["riv_drinkwater"] = "You drinked water from",
["riv_washface"] = "You are clean now !",
["riv_fillcanteen"] = "You just filled your canteen !",
["riv_fillbottle"] = "You just filled your bottle !",
["riv_noempcan"] = "You don't have an empty can to fill !",
["riv_noempbot"] = "You don't have an empty bottle to fill !",
["riv_fillc"] = "Fill Canteen...",
["riv_fillb"] = "Fill GlassBottle...",
["riv_searchgold"] = "SEARCH GOLD",
	},
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
VorpCore.NotifyLeft(Config.Text["tittle_notification"], text, "generic_textures", "tick", 7000, "COLOR_WHITE")
end