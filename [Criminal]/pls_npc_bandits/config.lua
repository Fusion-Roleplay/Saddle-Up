Config = {}

Config.BanditsChance = 100 -- %  
Config.nonRobTime = 60 -- Min
Config.runAwayDis = 150.0

Config.Weapons = {
    0x772C8DD6, 0x169F59F7, 0xDB21AC8C, 0x6DFA071B,
    0xF5175BA1, 0xD2718D48, 0x797FBF5, 0x772C8DD6,
    0x7BBD1FF6, 0x63F46DE6, 0xA84762EC, 0xDDF7BC1E,
    0x20D13FF, 0x1765A8F8, 0x657065D6, 0x8580C63E,
    0x95B24592, 0x31B7B9FE, 0x88A855C, 0x1C02870C,
    0x28950C71, 0x6DFA071B
}

Config.HorseModels = {"a_c_horse_andalusian_darkbay","a_c_horse_arabian_grey","a_c_horse_belgian_blondchestnut","a_c_horse_breton_sealbrown"}
Config.BanditsModels = {"G_M_M_UniBanditos_01","A_M_M_GRIFANCYDRIVERS_01","A_M_M_NEAROUGHTRAVELLERS_01","A_M_M_RANCHERTRAVELERS_COOL_01","A_M_M_RANCHERTRAVELERS_WARM_01"}


Config.HandsUpAnim = {
    dict="script_proc@robberies@homestead@lonnies_shack@deception",
    anim="hands_up_loop",
}

Config.Bandits = {
    {
        startPos=vector3(-4732.75, -3444.01, 11.41),
        bandits={
            vector3(-4786.2, -3448.84, 18.31),
            vector3(-4788.21, -3433.12, 16.23),
            vector3(-4778.61, -3425.19, 14.95),
        }
    },
    {
        startPos=vector3(-3021.2, -2639.19, 78.14),
        bandits={
            vector3(-2963.15, -2685.32, 86.19),
            vector3(-2971.26, -2687.47, 86.44),
            vector3(-2982.3, -2689.29, 86.08),
        }
    },
    {
        startPos=vector3(-2657.9, 92.97, 163.06),
        bandits={
            vector3(-2692.55, 126.2, 166.4),
            vector3(-2687.21, 133.83, 166.17),
            vector3(-2678.52, 150.0, 163.42),
        }
    }
    
}

Config.LootText = "Press J"
Config.KeyForLoot = 0xF3830D8E
Config.LootItems = {
    "bread",
    "carrot",
    "beer", 
}


Config.NotifyTexts = {
    title = "Bandits",
    ambushed = "You were ambushed.",
    robbed = "You've been robbed.",
    escaped = "You managed to escape.",
    allbandits_down = "They're all dead.",
    robbing = "Robbing..",
    takeLoot = "Take loot",
    somethingFound = "You found something.",
    /*Partners*/
    youBeenPartOfRobbery = "You were part of a bandit ambush.",
}

function bandits_notify(title,message)
    exports["pls_notify"]:CustomNotification({title=title,text=message,timeout=5000, type="info",class = "redmstyle3", showicon = true,})
end

