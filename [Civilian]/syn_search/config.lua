Config = { }

Config.metadata = true -- set to true when using meta data inventory update 


Config.webhook = true -- turn on webhook 
Config.adminwebhooklink = ""
Config.webhookavater = "https://media.discordapp.net/attachments/805495169901789194/911350679447150603/unknown.png"

Config.handcuff = true ---- show search if player is handcuffed
Config.hogtie = true    ---- show search if player is hogtied 
Config.isDead = false    ---- show search if player is dead

Config.jobs = {"police","marshal"} -- jobs 
Config.jobonly = false -- only people with listen jobs will get prompt to search
Config.jobonlytake = false -- only people with listen jobs will be able to take stuff 


Config.stealcash = true  -- allow taking money 
Config.stealgold = false  -- allow taking money 
Config.stealitems = true  -- allow taking items 
Config.stealguns = false  -- allow taking guns


-- bypass configs above for players with the jobs listed
Config.bypasscash = false 
Config.bypassgold = false 
Config.bypassitems = false 
Config.bypassguns = true 

Config.newcharactersafetimer = 180-- 3 hrs cant be robbed or rob people. 

Config.norobjob = {} -- jobs that cant be robbed keep as {} to disable 
Config.dutycheck = false -- use this so that the the jobs marked as norob must be on duty not to get robbed (syn society only)
Config.keys = {
    ["G"] = 0x760A9C6F,
    ["F"] = 0xB2F377E8,
	["BACKSPACE"] = 0x156F7119,
    ["ENTER"] = 0xC7B5340A,

}

Config.blacklistedweapons = {
    "WEAPON_MELEE_HAMMER",
}

Config.blacklisteditems= {
    "bountylicns",
    
}

Config.language = {
    search = "Search",
    taken = "Lost ",
    cantcarry = "Cant Carry Any More Items",
    takecash = "Take Cash",
    takegold = "Take Gold",
    cash = "Cash: $",
    gold = "Gold: ",
    beingsearched = "Being Searched By Someone",
    cantsearchjob = "Cant Search This Job",
    inventory = "Inventory",
    searchinv = "Search Inventory",
    searchmenu = "Search Menu",
    searchmenusub = "Search Person",
    confirm = "Confirm",
    amount = "Amount",
    tookcash = "You Got $",
    tookgold = "You Got ",
    takencash = "You Lost $",
    takengold = "You Lost ",
    goldd = " Gold",
    qt = "Invalid quantity",
    carry = "You cant carry more items",
    limit = "You reached the limit for this item",
    maxslots = "your Hideout cant store more items, slot limit is ",	
    tookwep = "You got a weapon",
    weptaken = "Weapon was taken from you",
    tookitem = "You got an Item",
    itemtaken = "Item was taken from you",
    onlyview = "You can only View items",
    cantitems = "You cant steal items",
    cantweapons = "You cant steal weapons",
    searchlogs = "Search Logs",
    searched = " Searched ",
    cashtaken = " Cash Was Taken ",
    dollar = "$",
    cash2 = "Cash",
    goldtaken = "Gold was taken",
    gold2 = "Gold",
    weptaken = "Weapon Was Taken",
    itemtaken = "an item was taken",
    footer = "syn search",
    blacklisted = "You Cant Take This Item",
    cantrobnew = "You Cant Rob New Players, You Cant Rob As a New player, make sure you read the rules!",
}