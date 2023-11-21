
```lua
local Needs = {}

TriggerEvent("Outsider_Needs", function(cb) -- to use in server only for security
    Needs = cb
end)

     -- store it in a table add only what you want the script will look for nil values. no need to have 0 
    local data = {
        food = 0,
        water = 0,
        stamina = 0,
        health = 0,
        goldHealthInner = 0,
        goldHealthOutter = 0,
        goldStaminaInner = 0,
        goldStaminaOutter = 0,
        addHot = 0,
        addCool = 0,
        addHotDuration = 0,
        addCoolDuration = 0,
        addStress = 0,
        addAddiction = 0,
    }

Needs.addStats(_source, data) -- send as a table


local Removestats = { -- remove what you dont want no need to leave  0
    removefood = 10, -- 100 removes all
    removewater = 0, -- 100 removes all
    removestamina = 10, -- 100 will deplete all stamina 50 will be only the outter core no point in getting the outter core as it will just go up again, dont use decimals
    removehealth = 0, -- 300 will deplete all health 250 will be just outter core   but that depends of the health the char have ,dont use decimals
    removeAddiction = 0, -- 100 removes all
    removeStress = 0, -- 100 removes all
}

Needs.RemoveStats(_source, Removestats)

local stats = true
Needs.StopStats(_source, stats) -- stop from consuming for example if player in a clothing store 


local stats = false
Needs.StartStats(_source, stats) -- start again the stats 


local stats = "visible", "whenactive", "hidden"
Needs.HideStats(_source, stats) -- hide or show HUD 


local stats = "thirst" or "hunger" or "all" -- choose one
Needs.HealStats(_source, stats) -- heal each or all needs

 TriggerEvent("Outsider_needs:Client:ClearDirt") -- clean player dirt

 -- get all player data
 local playerdata = Needs.GetAllData(source) -- table
 
 print(playerdata.stress,playerdata.addiction,playerdata.thirst,playerdata.hunger,playerdata.bodytemp,playerdata.dirtiness)
 -- have in mind the values will constantlychange , so make sure you dont store them  just use when you need.
 
```