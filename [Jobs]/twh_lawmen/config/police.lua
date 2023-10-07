PoliceConfig = {}

PoliceConfig.jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"} --jobs which are allowed to use the mechanisms



PoliceConfig.hangLocations = {
	sd =  { -- Saint Denis 
		coordsLever = {2690.7033691406 , -1112.8962402344 , 51.836906433105, 176.36},   --cords where to stand for animation near lever
        leverYaw = -180.0,      --initial lever Yaw for animation
		coordsHang = {2688.51, -1114.14, 52.32, 175.42},    --where player who gets hanged is set to
	},
	val =  { --Valentine
		coordsLever = {-314.49, 730.69, 119.67, 15.68},
        leverYaw = -169.99998474121094,
		coordsHang = {-315.43001220703125, 734.8400268554688, 120.80999755859375, 105.15},
	},
}


--hanging mechanism
PoliceConfig.hangChardeath = true --should character die permanently (throw player back into char creation and delete char)
PoliceConfig.hangTimer = 60 --how long hanging until death in seconds

--is imprisoned check
PoliceConfig.ckeckCommand = "policeCheck" --check if nearest Player should be imprisoned
--badge
PoliceConfig.badgeCommand = "policeBadge" --comand to put badge on or off
--turn prison alert off
PoliceConfig.alertCommand = "policeAlert" --comand to put alert off

--set Player prisoners Outfit
PoliceConfig.clothingCommand = "policeClothing"

--alternative handcuffing
PoliceConfig.handcuffCommand = "handcuff" --command to handcuff player by id or by playerselector

--prisoners wagons
PoliceConfig.wagonOffset = {x=3.0,y=3.0,z=0.5} --on which offset from character prompt is shown

PoliceConfig.enableWagonSpawn = true --let police spawn wagon at garages
PoliceConfig.garageCooldown = 5 -- 5 minutes until next vehicle can taken out of garage per player
PoliceConfig.officeGarages = {
	sd = {
        name = "Saint Denis Garage",
        coords = {x = 2476.8142089844 , y = -1312.8405761719 , z = 47.865749359131,h = 190.80},
        distance = 2,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the Garage

		wagonModel = "wagonPrison01x",
		wagonCoords = {x = 2480.10009765625, y = -1319.1300048828125, z = 48.60271453857422, h = -90.67845916748047}

    },
    bw = {
        name = "Blackwater Garage",
        coords = {x = -762.28527832031 , y = -1261.2875976563 , z = 42.519062042236,h = 356.80},
        distance = 2,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the Garage

		wagonModel = "wagonPrison01x",
		wagonCoords = {x = -761.556640625, y = -1248.4427490234375, z = 43.21572494506836, h = 90.0}

    },
    rd = {
        name = "Rhodes Garage",
        coords = {x = 1363.4008789063 , y = -1296.9742431641 , z = 75.800506591797,h = 338.417},
        distance = 2,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the Garage

		wagonModel = "wagonPrison01x",
		wagonCoords = {x=1377.846435546875, y=-1269.804443359375, z=77.62787628173828, h = -113.0}

    },
    val = {
        name = "Valentine Garage",
        coords = {x = -273.47424316406 , y = 813.21197509766 , z = 118.35562133789,h = 13.46},
        distance = 1.5,
        enableBlip = false,
        blipSprite = 1475879922,
        enableNpc = true,
        npcModel ="RE_RATINFESTATION_MALES_01",
        canTalk = true,

        jobs = {"police","sheriff","sheriff_val","sheriff_bw","sheriff_sb","sheriff_tw","sheriff_rd","sheriff_an","sheriff_ad"}, --jobs that can use the Garage

		wagonModel = "wagonPrison01x",
		wagonCoords = {x=-283.8277587890625, y=828.32373046875, z=119.46578216552734, h = -82.59500122070312}

    }

}

--lockpick
PoliceConfig.lockpickItem = "lockpick"
PoliceConfig.lockpickChance = 0.7 --0.7 = 70% to succeed
PoliceConfig.lockpickBreak = false --should lockpick break on every usage
PoliceConfig.lockpickBreakOnFailure = true --should lockpick break on failure



--duty system
PoliceConfig.enableDuty = true --if you want to enable goin in and off duty
PoliceConfig.DutyCoords = {
    ["Sheriff Valentine"] = {x = -276.11868286133 , y = 805.21697998047 , z = 118.38006591797, distance =1.5, jobs = PoliceConfig.jobs}, --job in here must be in PoliceConfig.jobs
    ["Sheriff Blackwater"] ={x = -762.07666015625 , y = -1268.2001953125 , z = 43.041381835938, distance =1.5, jobs = PoliceConfig.jobs},
    ["Sheriff Saint Denis"] ={x = 2506.6689453125 , y = -1308.7524414063 , z = 48.953678131104, distance =1.5,jobs = PoliceConfig.jobs},
    ["Sheriff Rhodes"] ={x = 1362.0283203125 , y = -1302.0721435547 , z = 76.767959594727, distance =1.5,jobs = PoliceConfig.jobs},
    ["Sheriff Annesburg"] ={x = 2909.6311035156 , y = 1309.0179443359 , z = 44.938407897949, distance =1.5,jobs = PoliceConfig.jobs},
    ["Sheriff Strawberry"] ={x = -1807.8977050781 , y = -349.83367919922 , z = 164.65737915039, distance =1.5,jobs = PoliceConfig.jobs},
    ["Sheriff Tumbleweed"] ={x = -5529.2509765625 , y = -2929.9738769531 , z = -1.3609260320663, distance =1.5, jobs = PoliceConfig.jobs},

    
}

