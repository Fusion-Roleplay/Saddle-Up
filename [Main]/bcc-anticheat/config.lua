Config = {}

Config.Discord = {
    active = false,
    webhookavatar = "https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png",
    webhookname = "Anti Cheat",
    webhook = "",
    lang = {
        kick = "Kicked for: "
    }
}


-- This is a Role DB check. Alerts if a role has changed. (This is VORP specific, disable if you are not using VORP)
Config.DB = {
    active = true,
    adminpingrate = 50000,
    rolechecks = {
        "admin", "mod"
    },
    lang = {
        discord = {
            title = "DB Group Change",
            description = "Players group has been changed to admin!",
            playername = "Player name",
            steam = "Steam identifier",
            character = "Character identifier"
        }
    }
}

Config.XSS = {
    active = true,
    lang = {
        reason = "XSS Injection Attempt Detected",
        update = "Validating Steam Username",
        kick = "You cant join due to your username"
    }
}

Config.Speed = {
    active = true,
    lang = {
        reason = "Speed Hacking"
    }
}

Config.ResourceInject = {
    active = true,
    lang = {
        reason = "Cheat Menu Detected"
    }
}

Config.Net = {
    active = false,
    allowedoffenses = 2,
    checkinrate = 5000, -- Milisecond
    kickrate = 20000,
    lang = {
        kickreason = "You must be connected to the internet."
    }
}

Config.AFK = {
    active = true,
    kicktime = 1800, -- Seconds
    warntime = 1500, -- Seconds
    lang = {
        kick = "You will be kicked in ",
        kick2 = " for AFK",
        hours = " hours",
        minutes = " minutes",
        seconds = " seconds",
        kickreason = "AFK",
        whitelist = {
            id = "You must include a user id",
            wladded = "User Added to Whitelist",
            wlremoved = "User Removed from Whitelist",
            err = "An Error has Occurred"
        }
    }
}

Config.SpamClick = {
    active = false,
    infractions = 0,
    maxspaminfractions = 5,
    spamsensitivity = 250, -- Higher is less sensitive
    lang = {
        kickreason = "Spam Clicking",
        warning = "You are spam clicking! This will lead to being kicked."
    }
}

Config.KickOnResourceStop = {
    active = true,
    lang = {
        kickreason = "Stop Resource Detected",
        warning = "Stoping resources is not allowed"
    }
}

Config.Objects = { -- Anti Spawn Object
    active = false,

    --- Add more objects
    --- Example: [GetHashKey("p_benchnbx02x")],
    --- You can view the objects here https://redlookup.com/objects
	blacklist = {}
}

-- A check to ensure no one is using Infinite ammo
Config.InfiniteAmmo = {
    active = true
}

Config.Weapons = { -- Blacklist Weapon and Anti Infinte Ammo
    active = false,

--- Add more weapons
--- Example: [GetHashKey("weapon_revolver_navy")],
--- You can view the weapons here https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
    blacklistlist = {}
}

Config.PlayerStatus = { -- Anti Change Health
    active = false,
    health = 600, -- Default Value (2088 = Golden Core Health)
    lang = {
        kickreason = "Player health hack detected"
    }
}


