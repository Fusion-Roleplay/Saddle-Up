Config = {}
language = {}
Config.keys = {
    ["F"] = 0xB2F377E8,
	["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["SHIFT"] = 0x8FFC75D6,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    ["BACKSPACE"] = 0x156F7119,
    ["ALT"] = 0x8AAA0AD4,
    ["CTRL"] = 0xDB096B85,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
    ["I"] = 0xC1989F95,
    ["X"] = 0x8CC9CD42,

}
Config.debug = false -- set to false on live server

-----------------
------ IMPORTANT 
-- IF YOU ARE UPDATING FROM OLD SYN STORES AND USING SYN SOCIETY MAKE SURE YOU READ updater.lua !!!!!!!!!!!!!!
Config.synsociety = true -- set to true if you own syn society ! 
Config.societystoreblip = 249721687 -- blips for society shops 
Config.maxsocietyshops = 1 -- max shops owned by 1 society
Config.societytoken = "societytoken" -- item used to create society shop. can only be used by boss of society

-----------------

Config.moveshopcommand = "adminmoveshop" -- move shop to a new location admin command /moveshop shopid x y z
Config.unreposhopcommand = "unreposhop" -- admin command to unrepo a shop 
Config.adminrepocommand = "reposhop" -- sets the shop as repo this doesnt delete the shop just simply hides it from the players
Config.admindeleteshopcommand = "delshop" -- admin command to delete shops  example /delshop shopid
Config.maxshops = 3 -- max shops owned by 1 player 
Config.adminbypassmax = true -- admins can bypass the max shops count
Config.shopcreationitem = "shoptoken" -- item that is used to create a shop
Config.interactiondistance = 1.5 -- distance which shop interaction prompt is shown
Config.adminwebhook = "https://discord.com/api/webhooks/1012436122342785129/fALit0G4sIjmRFuSsta0FweTUUyWoECUdyvIHrz3meFbhc6c8TkusU0TRYym_ikpogdF"
Config.webhookavatar = "http://icons.iconarchive.com/icons/custom-icon-design/flatastic-11/512/Shop-icon.png"
Config.playershopsprite = -242384756  -- blips for player owned shops 
Config.initalstorage = 100 -- newly created stores will have this much capacity
Config.allowuserwebhooks = true 
Config.shopspacing = 5 -- shops cant be too close to each other.
Config.moveshopcost = 100 -- how much it costs to move a shop
Config.relocatecommand = "moveshop" -- command to move a shop by player 

Config.playerstoretax = 100 -- how much is the tax for player owned stores

Config.upgradecost = 10 -- price per slot

Config.monthlyrepo = true
Config.repotime ={ -- day, hour, and minute of monthly repo of clans. when the server time matches these values. camps that dont have money in their ledger = or more than the tax rate of the camp will 
-- be put in a disabled state, and marked as repo 1 in the database. u can switch them back to active state via clan admin menu or by changing databse from 1 to 0 when the script is disabled
    day = 16,
    hour = 13,
    minute = 13
} 
Config.weeklyrepo = false -- same as above but weekly instead of monthly, only of of the 2 active. 
Config.repotime2 ={ 
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
} 


Config.blacklisteditems = { -- items that cannot be sold or placed at stores
    "bountylicns",
    "orden_presidente",
    "medcert",
}

--------------------------------
