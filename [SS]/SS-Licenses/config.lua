-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
    
Align = "right", -- ALIGN MENU
PriceCopy = 5, -- PRICE FOR ASKING A LICENSE COPY
UseAnimProp = true, -- USE ANIMATION AND PROP WHEN SHOW IT ?
SignText = "SERVER NAME", -- SIGNATURE ON LICENSES
ServerYear = 1899, -- IN WHAT YEAR YOUR SERVER PLAY ?
--NEW 1.4
MaxDays = 10 , -- MAX DAY BUY LICENSE
--NEW 1.4
Licenses = {
["mining"] = { -- IMAGE NAME
    Name = "Mining License", -- LICENSE NAME
	Price = 8, -- PRICE FOR THIS LICENSE EVERY DAY
    Item = "mininglicense", -- ITEM TO OPEN THAT LICENSE
    Jobs = {"police"}, -- BLOCKED FOR JOBS ? 
},
        
["lumberjack"] = {
    Name = "Forest License",
	Price = 5,
    Item = "forestlicense",
    Jobs = {},
},
        
["hunter"] = {
	Name = "Hunter License",
	Price = 10,
    Item = "hunterlicense",
    Jobs = {},
},
        
["horsetrainer"] = {
	Name = "Horse Trainer",
	Price = 50,
    Item = "horsetrainerlicense",
    Jobs = {},
},
        
["bountyhunter"] = {
	Name = "Bountyhunter License",
	Price = 50,
    Item = "bountylicense",
    Jobs = {},
},
        
["gunsmith"] = {
	Name = "GunSmith License",
	Price = 25,
    Item = "gunsmithlicense",
    Jobs = {},
},

},
    
Texts = {
["reg_license"] = "Register New License",
["desc_reg_license"] = "Register New License",
["renewlicense"] = "Renew Licenses",
["desc_renewlicense"] = "Renew Licenses",
["ask_licensecopy"] = "Request New Copy",
["desc_ask_licensecopy"] = "Ask copy",
        
["license_info"] = "info",
["buy_days"] = "How many days",
["wrong_input"] = "You insert invalid information, please try again !",
        
["license_updated"] = "You renew a license for",
["license_registered"] = "You registered a license for ",
["for"] = "for",
["days"] = "days",
["and_payed"] = "and payed",
["not_allowed"] = "You are not allowed to get this type of license !",
["not_have"] = "You don't have this type of license registered to ask a copy !",
["get_copy"] = "You get a new copy for this license ! ",
["nobody_around"] = "There are nobody around !",
["no_money"] = "You don't have enought money !",
["manage_menu"] = "MANAGE LICENSES",
["manage_menu_desc"] = "Manage Licenses",
["buy_menu"] = "BUY LICENSES",
["buy_menu_desc"] = "Buy Licenses",
["copy_menu"] = "COPY LICENSES",
["copy_menu_desc"] = "Copy Licenses",
["buylicenses_tittle"] = "BUY LICENSE",
        
--NEW 1.4
["no_job"] = "You are not allowed to use this type of license !",
["no_license"] = "You don't have this type of license registered !",
["max_days"] = "The valid days must be under",
--NEW 1.4
},
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)       
end  