--[[
-- Author: Tim Plate
-- Project: visn_telegram
-- Copyright (c) 2023 Tim Plate Solutions
--]]

Config = {}

Config.Language = "en"
Config.CharNamesAllowedAsReciever = true -- If true, char names can also be receiver instead of the post office number only (Char Name will be resolved to the post office number)
Config.Year = 1899 -- Year of the telegram (used for the letter)
Config.EnableReceiveNotification = true -- Enable or disable the notification when you receive a telegram
Config.OpenMenuKey = "INPUT_DYNAMIC_SCENARIO" -- "E" | https://github.com/femga/rdr3_discoveries/blob/master/Controls/README.md
Config.PostOffices = {
    {
        coords = vector3(2749.57, -1399.69, 46.19), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Saint Denis Post Office", -- Name of the blip
        },
        location = "Saint Denis", -- Location of the post office (used for the letter)
        area = "Lemoyne", -- Area of the post office (used for the letter)
        idCode = "SD", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },

    {
        coords = vector3(1225.53, -1293.97, 76.91), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Rhodes Post Office", -- Name of the blip
        },
        location = "Rhodes", -- Location of the post office (used for the letter)
        area = "Lemoyne", -- Area of the post office (used for the letter)
        idCode = "RH", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },

    {
        coords = vector3(2939.34, 1288.61, 44.65), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Annesburg Post Office", -- Name of the blip
        },
        location = "Annesburg", -- Location of the post office (used for the letter)
        area = "Roanoke Ridge", -- Area of the post office (used for the letter)
        idCode = "AN", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },

    {
        coords = vector3(-178.95, 626.69, 114.09), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Valentine Post Office", -- Name of the blip
        },
        location = "Valentine", -- Location of the post office (used for the letter)
        area = "New Hanover", -- Area of the post office (used for the letter)
        idCode = "VA", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },

    {
        coords = vector3(-875.14, -1328.73, 43.96), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Blackwater Post Office", -- Name of the blip
        },
        location = "Blackwater", -- Location of the post office (used for the letter)
        area = "Great Plains", -- Area of the post office (used for the letter)
        idCode = "BW", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },

    {
        coords = vector3(-5227.27, -3470.56, -20.57), -- Location of the post office (blip and marker)
        blip = {
            enabled = true, -- Enable or disable the blip
            sprite = 1861010125,
            name = "Benedict Point Post Office", -- Name of the blip
        },
        location = "Benedict Point", -- Location of the post office (used for the letter)
        area = "Río Bravo", -- Area of the post office (used for the letter)
        idCode = "BP", -- Used for telegram id creation
        price = 5.0, -- Price of a telegram to send (in dollars)
        object = {
            enabled = false, -- Enable or disable the object
            model = "mp005_p_mp_bountyboard02x", -- Model of the object | https://rdr2.mooshe.tv/
            coords = vector3(0.0, 0.0, 0.0), -- Location of the object
            rotation = vector3(0.0, 0.0, 0.0), -- Rotation of the object
        }
    },
}