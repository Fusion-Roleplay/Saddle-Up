local statusPLayer = {}
 


RegisterCommand('status', function(source, args)
    local text = ''
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ' '
        
    for index, value in ipairs(statusPLayer) do
        if value.id == source then
            table.remove(statusPLayer, index)
        end
    end

    local vuoto = string.len(text)
    if vuoto ~= 1  then
        table.insert(statusPLayer, {id = source, text = text})
    end

    TriggerClientEvent('aggiungiStatus', -1, statusPLayer)
end, false)


RegisterServerEvent('datiStatusPlayer')
AddEventHandler('datiStatusPlayer', function()
    TriggerClientEvent('aggiungiStatus', source, statusPLayer)
end)

local statusPLayer1 = {}

RegisterCommand('st', function(source, args)
    local isadmin = false
    local _source = source
    TriggerEvent("vorp:getCharacter", _source, function(user)
        local group = user.group
        if group == Config.staffgroup.owner then
            isadmin = true
        elseif group == Config.staffgroup.hadmin then
            isadmin = true
        elseif group == Config.staffgroup.admin then
            isadmin = true
        elseif group == Config.staffgroup.mod then
            isadmin = true
        end
    end)


    if isadmin then
        for index, value in ipairs(statusPLayer1) do
            if value.id == source then
                table.remove(statusPLayer1, index)
                TriggerClientEvent('aggiungiStatus1', -1, statusPLayer1)
                return
            end
        end

        table.insert(statusPLayer1, {id = source})
        TriggerClientEvent('aggiungiStatus1', -1, statusPLayer1)
    end
end, false)


--[[
RegisterServerEvent("minz")
AddEventHandler("minz", function()
    RegisterCommand('n', function()
        local _source = source
        TriggerEvent("vorp:getCharacter", _source, function(user)
            local group = user.group
            local hex = user.identifier
            local job = user.job
            if group == 'admin' then
                ExecuteCommand('st')
            
            end
        end)
    end)
end)
]]


RegisterServerEvent('datiStatusPlayer1')
AddEventHandler('datiStatusPlayer1', function()
    TriggerClientEvent('aggiungiStatus1', source, statusPLayer1)
end)