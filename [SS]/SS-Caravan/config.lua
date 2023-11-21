-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
CaravanDistance = 3.0, -- DISTANCE TO SHOW THE PROMPT
ButtonKey = 0x760A9C6F, -- BUTTON KEY
MenuAlign = "right", -- MENU API ALIGN
Blips = 784218150, -- BLIP FOR CARAVAN, FALSE IF DON'T WANT
Prop = "p_sca_sign", -- PROP TO SET WHERE IS THE CARAVAN POINT
Caravan = "stagecoach001x", -- CARAVAN TYPE
CaravanColor = 2, -- CARAVAN COLOR
CaravanLivery = 2, -- CARAVAN LIVERY
CaravanProp = "pg_veh_stagecoach001x_2", -- CARAVAN PROPS
CaravanLight = 1, -- CARAVAN LIGHT
Use3DCam = false, -- USE 3D CAM (TRUE OR FALSE)
DistanceDestination = 10.0, -- STOP WHEN THIS DISTANCE REACHED AT DESTINATION
Driver = "cs_bivcoachdriver", -- CHANGE NPC TYPE
GuardCaravan = false, -- SET NPC TYPE OR FALSE 
GuardWeapon = "WEAPON_RIFLE_BOLTACTION", -- GUARD WEAPON
DriveStyle = 786603, -- Don't change if you don't know what you're doing ! > https://vespura.com/fivem/drivingstyle/
CaravanSpeed = 15.0,
    
StopCaravan = "cancelcaravan", -- CANCEL AND DELETE CURRENT CARAVAN (IF BROKE, STUCK, etc etc)
    
Locations = {
[1] = {
Name = "Valentine Caravan", -- NAME OF THIS PLACE
Position = {-186.9733123779297, 643.8097534179688, 112.3997802734375, 145.216}, -- POSITION MENU & NPC
WagonSpawn = {-191.092529296875, 639.1046142578125, 112.95175170898438, 145.216}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A small town where need a visit!",
},
[2] = {
Name = "BlackWater Caravan", -- NAME OF THIS PLACE
Position = {-886.2470703125, -1242.76611328125, 43.36553192138672, -2.557}, -- POSITION MENU & NPC
WagonSpawn = {-870.7986450195312, -1241.309326171875, 43.33686065673828, -2.557}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A new town where need a visit!",
},
[3] = {
Name = "Rhodes Caravan", -- NAME OF THIS PLACE
Position = {1245.669921875, -1290.7127685546875, 74.82366943359375, 47.218}, -- POSITION MENU & NPC
WagonSpawn = {1236.9051513671875, -1267.71484375, 75.16978454589844, -35.216}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A new town where need a visit!",
},
[4] = {
Name = "Strawberry Caravan", -- NAME OF THIS PLACE
Position = {-1752.435302734375, -405.5144348144531, 154.42361450195312, -30.108}, -- POSITION MENU & NPC
WagonSpawn = {-1750.9742431640625, -401.6171569824219, 155.50173950195312, -120.316}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A new town where need a visit!",
},
[5] = {
Name = "Annesburg Caravan", -- NAME OF THIS PLACE
Position = {2923.36669921875, 1283.4749755859375, 43.42635345458984, 162.351}, -- POSITION MENU & NPC
WagonSpawn = {2927.951416015625, 1295.222412109375, 44.4082145690918, 161.64}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A worked town where need a visit!",
},
[6] = {
Name = "Saint Denis Caravan", -- NAME OF THIS PLACE
Position = {2691.623046875, -1436.6051025390625, 45.01542663574219, 114.67}, -- POSITION MENU & NPC
WagonSpawn = {2681.19189453125, -1440.2666015625, 46.06610488891601, -66.23}, -- POSITION SPAWN CARAVAN
InPrice = 0.8, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "A worked town where need a visit!",
} 
},
    
Texts = {
["button_name"] = "Caravan",
["accept_ride"] = "Accept",
["refuse_ride"] = "Refuse",
["not_money"] = "You don't have enought money for this ride !",
["has_money"] = "Perfect, when you ready just get in the caravan and we will start this ride !",
["arrived"] = "Ok dude, we have just arrived to your destination, hope you enjoy it !",
}
    
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000) 
end 