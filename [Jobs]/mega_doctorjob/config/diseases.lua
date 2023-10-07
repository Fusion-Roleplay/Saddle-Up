DiseasesConfig = {
   ['cold'] = {
      name = 'cold',
      displayName = 'Common Cold',
      healthLossPerTick = 50,
      tickRate = 250,
      effectRate = 60000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = 1800000,
      -- The coldness level system works that way:
      -- it starts from zero and it gets increased every tick based on cold factors (tick rate affects the whole thing, for example increasing it will considerably make it harder to get sick)
      -- every factor sums up to a value, when it reaches the maxColdnessLevel the player will get sick
      -- for each tick the player is not inside the cold factors it will lose a coldness point
      maxColdnessLevel = 1200,
      -- temperature which is considered to be cold
      coldTemperature = 10.0,
      -- how much the factors affect the coldness level (0 (nothing) to n)
      -- staying in cold temperatures
      temperatureRate = 1,
      -- staying in water
      waterRate = 1,
      language = {
         started = "You feel weak and have difficulty breathing.",
         autoHealed = "You're starting to breathe better.",
      },
      -- Animations
      coughAnimationDict = 'mech_loco_m@character@arthur@fidgets@injured@action@unarmed',
      coughAnimation = 'cough',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Fast',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 37.8, 38.5 }
      }
   },
   ['brokenBone'] = {
      name = 'brokenBone',
      displayName = 'Broken Bone',
      healthLossPerTick = 0,
      tickRate = 250,
      effectRate = 120000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      -- minimum damage to take in order to get a broken bone (0.0 -> 600.0)
      minDamageActivation = 70.0,
      -- broken bone probability when you get to the minDamageActivation (0.0 -> 1.0)
      brokenBoneProbability = 1.0,
      enableRagdoll = true,
      -- damage for running while having a broken bone
      damageRunning = 100,
      language = {
         started = "You hear your bone cracking and it hurts.",
         autoHealed = "The bone fused back, you feel better.",
      },
   },
   ['bleeding'] = {
      name = 'bleeding',
      displayName = "Bleeding",
      healthLossPerTick = 25,
      tickRate = 250,
      effectRate = 5000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = 300000,
      enableRagdoll = true,
      language = {
         started = "You started bleeding, put on a bandage and visit a doctor.",
         autoHealed = "The bleeding stopped on its own.",
      },
      -- Firearms that can affect bleeding
      -- [weaponHash] = bleedProbability (0.0 -> 1.0) }
      -- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
      firearmsBleedProbability = {
         ['weapon_revolver_doubleaction'] = 0.1,
         ['weapon_revolver_cattleman'] = 0.1,
         ['weapon_revolver_lemat'] = 0.1,
         ['weapon_revolver_schofield'] = 0.1,
         ['weapon_pistol_mauser'] = 0.1,
         ['weapon_pistol_semiauto'] = 0.1,
         ['weapon_pistol_m1899'] = 0.1,
         ['weapon_pistol_volcanic'] = 0.1,
         ['weapon_rifle_springfield'] = 0.1,
         ['weapon_rifle_boltaction'] = 0.1,
         ['weapon_rifle_varmint'] = 0.1,
         ['weapon_shotgun_sawedoff'] = 0.1,
         ['weapon_shotgun_doublebarrel_exotic'] = 0.1,
         ['weapon_shotgun_pump'] = 0.1,
         ['weapon_shotgun_repeating'] = 0.1,
         ['weapon_shotgun_semiauto'] = 0.1,
         ['weapon_shotgun_doublebarrel'] = 0.1,
         ['weapon_sniperrifle_carcano'] = 0.1,
         ['weapon_sniperrifle_rollingblock'] = 0.1,
         ['weapon_rifle_elephant'] = 0.1,
         ['weapon_revolver_navy'] = 0.1,
         ['weapon_bow'] = 0.1,
         ['weapon_bow_improved'] = 0.1,
         ['weapon_repeater_henry'] = 0.1,
         ['weapon_repeater_winchester'] = 0.1,
         ['weapon_repeater_carbine'] = 0.1,
         ['weapon_repeater_evans'] = 0.1,
      },
      meleeBleedProbability = {
         ['weapon_melee_knife_jawbone'] = 0.1,
         ['weapon_melee_machete'] = 0.1,
         ['weapon_melee_knife'] = 0.1,
         ['weapon_melee_hatchet'] = 0.1,
         ['weapon_melee_hatchet_hunter'] = 0.1,
         ['weapon_thrown_tomahawk'] = 0.1,
         ['weapon_melee_cleaver'] = 0.1,
         ['weapon_melee_hatchet_double_bit'] = 0.1,
         ['weapon_melee_knife_trader'] = 0.1,
         ['weapon_thrown_throwing_knives'] = 0.1,
      }
   },
   ['malaria'] = {
      name = 'malaria',
      displayName = 'Malaria',
      healthLossPerTick = 50,
      tickRate = 1000,
      effectRate = 60000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      -- The infection level system works like coldness level:
      -- it starts from zero and it gets increased every tick if you're in an infected area
      -- when it reaches the maxInfectionLevel the player will get sick
      -- for each tick the player is not inside the infected area, it will lose a infection point
      -- small formula to get how much time it needs to be infected (you can use that for balancing)
      -- timeNeeded(seconds) = (tickRate/1000) * maxInfectionLevel
      -- to get the right maxInfectionLevel knowing the timeNeeded
      -- maxInfectionLevel = timeNeeded(seconds) / (tickRate/1000)
      maxInfectionLevel = 600,
      -- take a look at https://github.com/femga/rdr3_discoveries/tree/master/zones
      -- probability is calculated every tick (tickRate)
      -- higher tickrates and/or probability can make it easier to contract
      -- adjust those settings as you prefer
      infectionZonesProbability = {
         { 
            coords = vector3(1915.09, -943.33, 43.29), 
            radius = 100.0,
            infectionPoints = 1
         }
      },
      language = {
         started = "You feel weak and your stomach hurts, you also have a little nausea.",
         autoHealed = "You're starting to feel better.",
      },
      -- Animations
      vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
      vomitAnimation = 'idle_e',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Fast',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 38.5, 40.0 }
      }
   },
   ['cholera'] = {
      name = 'cholera',
      displayName = 'Cholera',
      healthLossPerTick = 60,
      tickRate = 1000,
      effectRate = 60000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      -- The infection level system works like coldness level:
      -- it starts from zero and it gets increased every tick if you're in an infected area
      -- when it reaches the maxInfectionLevel the player will get sick
      -- for each tick the player is not inside the infected area, it will lose a infection point
      -- small formula to get how much time it needs to be infected (you can use that for balancing)
      -- timeNeeded(seconds) = (tickRate/1000) * maxInfectionLevel
      -- to get the right maxInfectionLevel knowing the timeNeeded
      -- maxInfectionLevel = timeNeeded(seconds) / (tickRate/1000)
      maxInfectionLevel = 600,
      -- probability is calculated every tick (tickRate)
      -- higher tickrates and/or probability can make it easier to contract
      -- adjust those settings as you prefer
      infectionZonesProbability = {
         { 
            coords = vector3(-3663.84, -2611.92, -14.08), 
            radius = 80.0,
            infectionPoints = 1
         }
      },
      language = {
         started = "You feel weak and your stomach hurts a lot, you have a lot of nausea.",
         autoHealed = "You're starting to feel better.",
      },
      -- Animations
      vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
      vomitAnimation = 'idle_e',
      stomachAnimationDict = 'mech_loco_m@character@arthur@fidgets@injured@action@unarmed',
      stomachAnimation = 'pain_stomach',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Fast',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 39.0, 41.0 }
      }
   },
   ['snakeBite'] = {
      name = 'snakeBite',
      displayName = "Snake Bite",
      healthLossPerTick = 25,
      tickRate = 250,
      effectRate = 30000,
      -- milliseconds, time it will take to apply the cure item
      applyDuration = 10000,
      -- time in milliseconds in which the disease will automatically stop, use -1 to make it last forever (until the player gets cured or bandaged)
      autoHealTime = -1,
      enableRagdoll = true,
      language = {
         started = "The snake's bite hurts and your skin is irritating.",
         autoHealed = "The effects from the venom went completely away.",
      },
      -- Probability of getting poisoned after being bitten (0.0 - 1.0)
      poisonousBiteProbability = 1.0,
      -- Animations
      vomitAnimationDict = 'amb_misc@world_human_vomit@male_a@idle_b',
      vomitAnimation = 'idle_e',
      -- Mandatory symptoms for the dashboard.
      -- Those are basically hints for the doctor to understand which cure has do be administered to the patient.
      symptoms = {
         heartRate = 'Extreme',
         -- min and max values, body temps will be randomized between those values
         bodyTemperatureRange = { 40.0, 41.0 }
      }
   },
}
