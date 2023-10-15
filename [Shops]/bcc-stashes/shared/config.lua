Config = {}

Config.defaultlang = 'en'

Config.keys = {
    g = 0x760A9C6F, --[G] Open Chest prompt

}

Config.Spots = {
    bwb = {
        Pos = {x = -783.76, y = -1290.87, z = 43.76}, -- Coords in X,Y,Z
        containerid = "bwb",                      --Unique Container ID
        ContainerName = "Bwb Stash",                       --Name shown in inventory UI
        limit = 250,                                   --Limit of storage
        JobOnly = true,                                --Only job can access
        JobName = { 'bwb', 'offpolice' },       --Job names must go inside {} ie {'unemployed'} or {'police','sheriff'}
        JobGrades = 1,                                 -- If using Job Only, Job grade must be this rank or higher to access
        Shared = true,                                 -- Shared Storage
        NotAllowedItems = false,                        --Blacklist below items, Not in use yet
        Items = { 'canteen' }                          --Blacklisted Items

    },
    teststorage2 = {
        Pos = { x = -326.89, y = 775.05, z = 121.64 }, -- Coords in X,Y,Z
        containerid = "TestStorage2-2",                --Unique Container ID
        ContainerName = "test Storage",                --Name shown in inventory UI
        limit = 250,                                   --Limit of storage
        JobOnly = true,                                --Only job can access
        JobName = { 'sheriff', 'police' },             --Job names must go inside {} ie {'unemployed'} or {'police','sheriff'}
        JobGrades = 3,                                 -- If using Job Only, Job grade must be this rank or higher to access
        Shared = true,                                 -- Shared Storage
        NotAllowedItems = false,                       --Blacklist below items,Not in use yet
        Items = {}                                     --Blacklisted Items
    },
}


Config.Props = {
    p_chest01x =                                 -- hash of prop
    {
        dbname = 'chest1',                        ---Name of db item
        hash = 'p_chest01x',                     -- hash of prop
        containerid = "Stash2-1",                --Unique Container ID
        ContainerName = "Stash1",                --Name shown in inventory UI
        limit = 250,                             --Limit of storage
        JobOnly = false,                         --Only job can access
        JobName = { 'unemployed', 'offpolice' }, --Job names must go inside {} ie {'unemployed'} or {'police','sheriff'}
        JobGrades = 3,                           -- If using Job Only, Job grade must be this rank or higher to access
        Shared = true,                           -- Shared Storage
        NotAllowedItems = true,                  --Blacklist below items, Not in use yet
        Items = { 'canteen' }
    },

    p_chest02x = -- hash of prop

    {
        dbname = 'chest2',                         ---Name of db item
        hash = 'p_chest02x',                     -- hash of prop
        containerid = "Stash2-2",                --Unique Container ID
        ContainerName = "Stash2",                --Name shown in inventory UI
        limit = 250,                             --Limit of storage
        JobOnly = false,                         --Only job can access
        JobName = { 'unemployed', 'offpolice' }, --Job names must go inside {} ie {'unemployed'} or {'police','sheriff'}
        JobGrades = 3,                           -- If using Job Only, Job grade must be this rank or higher to access
        Shared = true,                           -- Shared Storage
        NotAllowedItems = true,                  --Blacklist below items, Not in use yet
        Items = { 'canteen' }
    },
}

Config.WebhookInfo = {
    Title = 'Saddle Up Stashes',
    Webhook =
    'https://discord.com/api/webhooks/1163182581127327854/B8fr7pB79J9N9-l8NKv70qH3KH8T44dloFSqgCh1fSCTAYC6uJ_h7spnb4TX0eHunosv',
    Color = 'F9EC1809',
     Name = 'Saddle Up',
     Logo = 'https://media.discordapp.net/attachments/1017811858578735228/1103467116486721586/Logo-Grey-256x256.png?ex=6539a855&is=65273355&hm=5565d56ed7d97ffded3c75f84146ccf3020441445617fe1f0b18872b4ccef4da&=',
     FooterLogo = '',
     Avatar = 'https://media.discordapp.net/attachments/1017811858578735228/1103467116486721586/Logo-Grey-256x256.png?ex=6539a855&is=65273355&hm=5565d56ed7d97ffded3c75f84146ccf3020441445617fe1f0b18872b4ccef4da&=',
}
