--[[
    local VORPcore = {}
    TriggerEvent("getCore", function(core)
        VORPcore = core
    end)
]]-- 

RegisterNetEvent('utils:Notification', function(pos, text, desc, type, icon, iconcolor)
    --TriggerEvent('redem_roleplay:Tip', text, 4000)
    --VORPcore.NotifyTip(text,4000)
end)

