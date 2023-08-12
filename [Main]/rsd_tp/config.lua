--DO NOT RENAME RESSOURCE !!

Config = {}

Config.rsdNUI = true -- If you use our RSD_NUI

--RANGE
Config.RangeTP = 1.5 -- Range to get trigger

--KEY
Config.KeyTP = 0x760A9C6F --G

Config.Currency = 0 --0 for dollar, 1 for Gold, 2 for Rol

Config.Language = {
    [2] = "$", --Modify it according to your currency
    [3] = "~t~Not enough ~q~money",
    [4] = "~not enough ~q~Gold",
    [5] = "~not enough ~q~of Rol",
    [6] = "~t~Not ~q~allowed",
    [7] = "G",
    [8] = "TELEPORT",
}

--LOGS
Config.Logs = false --To have logs in webhook
Config.webhook = "" --Link for TP logs
Config.webhookColor = 902912 --hexcolor
Config.name         = "TELEPORT" 
Config.logo         = "https://via.placeholder.com/30x30" -- Header
Config.footerLogo   = "https://via.placeholder.com/30x30" -- Footer
Config.Avatar       = "https://via.placeholder.com/30x30" -- Avatar

Config.Locations = {
    --CAVE
    {
        coordsIn = vector4(1325.92, -1325.27, 77.92, 348.53), --the entry point  
        TextIn = {"Entrer", "Cave", "Entrer dans la cave"}, --Text for entry Prompt and rsd_nui
        TextCloseIn = "", --Text when close for entry
        jobIn = {"all"}, --job to entry // set all for all players
        coordsOut = vector4(1323.43, -1324.93, 74.94, 4.12), --the exit point
        TextOut = {"Sortir", "Cave", "Sortir dans la cave"}, --Text for exit Prompt and rsd_nui
        TextCloseOut = "", --Text when close for exit
        jobOut ={"all"},--job to exit // set all for all players
        Price = 0, --price // 0 to disable
        Fade = false, --If you want a loading screen
        FadeTitleIn = "", --Title loading screen entry
        FadeSubtitleIn = "", --Subtitle loading screen entry
        FadeTitleOut = "", --Title loading screen exit
        FadeSubtitleOut = "",--Subitle loading screen exit
        TimeFade = 1000,--Time loadingscreen
        blipIn = false, --If you want blip for the entry
        blipOut = false, --If you want blip for the exit
        bliphashIn = 0, --hash blip for the entry
        bliphashOut = 0, --hash blip for the exit
        blipnameIn = "", --blip name for the entry
        blipnameOut = "", --blip name for the exit
        HoursAllowed = false, --If you want hours to set the location closed
        HourOpen = 8, --Open hour
        HourClose = 20, --Close hour
    },
}
--For Hash blip > https://cloudy-docs.bubbleapps.io/rdr2_blips
