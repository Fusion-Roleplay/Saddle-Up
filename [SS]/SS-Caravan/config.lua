-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
CaravanDistance = 3.0,
ButtonKey = 0x4BC9DABB,
MenuAlign = "right",
Blips = 784218150,
Prop = "p_sca_sign",
Caravan = "stagecoach001x",
CaravanColor = 2,
CaravanLivery = 2,
CaravanProp = "pg_veh_stagecoach001x_2",
CaravanLight = 1,
Use3DCam = true,
DistanceDestination = 10.0, -- STOP WHEN THIS DISTANCE REACHED AT DESTINATION
Driver = "cs_bivcoachdriver",
GuardCaravan = false,
GuardWeapon = "WEAPON_RIFLE_BOLTACTION",
    
StopCaravan = "cancelcaravan", -- CANCEL AND DELETE CURRENT CARAVAN (IF BROKE, STUCK, etc etc)
    
Locations = {
[1] = {
Name = "Valentine Caravan", -- NAME OF THIS PLACE
Position = {-186.9733123779297, 643.8097534179688, 112.3997802734375, 145.216}, -- POSITION MENU & NPC
WagonSpawn = {-187.81439208984375, 651.537841796875, 113.32127380371094, 78.828}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Un oras mic si foarte pupulat !",
},
[2] = {
Name = "BlackWater Naveta", -- NAME OF THIS PLACE
Position = {-864.5530395507812, -1198.263427734375, 42.25176620483398, -176.645}, -- POSITION MENU & NPC
WagonSpawn = {-869.2306518554688, -1194.68310546875, 43.23857879638672, -178.583}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Un oras modern in dezvoltare !",
},
[3] = {
Name = "Rhodes Caravan", -- NAME OF THIS PLACE
Position = {1245.669921875, -1290.7127685546875, 74.82366943359375, 47.218}, -- POSITION MENU & NPC
WagonSpawn = {1233.948486328125, -1269.465576171875, 75.3037338256836, -43.953}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Un oras la periferia Capitalei !",
},
[4] = {
Name = "Strawberry Caravan", -- NAME OF THIS PLACE
Position = {-1786.2547607421875, -431.8554992675781, 154.30487060546875, 156.108}, -- POSITION MENU & NPC
WagonSpawn = {-1782.96630859375, -441.52685546875, 155.22024536132812, 71.316}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Un oras in mijlocul padurii !",
},
[5] = {
Name = "Annesburg Caravan", -- NAME OF THIS PLACE
Position = {2923.36669921875, 1283.4749755859375, 43.42635345458984, 162.351}, -- POSITION MENU & NPC
WagonSpawn = {2927.951416015625, 1295.222412109375, 44.4082145690918, 161.64}, -- POSITION SPAWN CARAVAN
InPrice = 0.5, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Un oras industrial !",
},
[6] = {
Name = "Saint Denis Caravan", -- NAME OF THIS PLACE
Position = {2691.623046875, -1436.6051025390625, 45.01542663574219, 114.67}, -- POSITION MENU & NPC
WagonSpawn = {2681.19189453125, -1440.2666015625, 46.06610488891601, -66.23}, -- POSITION SPAWN CARAVAN
InPrice = 0.8, -- PRICE PER KM TO ARRIVE IN THIS CITY FROM OTHERS
Desc = "Capitala Frontierei !",
} 
},
    
Texts = {
["button_name"] = "Naveta",
["accept_ride"] = "Accepta",
["refuse_ride"] = "Refuza",
["not_money"] = "Din pacate nu ai bani indeajuns pentru aceasta cursa !",
["has_money"] = "Perfect, cand esti gata urca in caravana si vom porni spre destinatie !",
["arrived"] = "Ok, se pare ca am ajuns la destinatie, iti urez o vizita placuta !",
}
    
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000) 
end 