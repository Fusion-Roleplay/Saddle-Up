if GetCurrentResourceName() == 'redemrp_inventory' then
    local eventsToSuppress = {
        'weapons:server:ApplyDamage',
        'weapons:ApplyDamage'
    }

    local IsEventSuppressed = function(eventName)
        for _, eventNameToSuppress in ipairs(eventsToSuppress) do
            if eventNameToSuppress == eventName then
                return true
            end
        end

        return false
    end

    if RegisterServerEvent then
        local orgRegisterServerEvent = RegisterServerEvent

        RegisterServerEvent = function(...)
            local eventName = table.pack(...)[1]
            if IsEventSuppressed(eventName) then
                return print('[RedM Weapon Maintenance] RegisterServerEvent, suppressed ' .. eventName .. ' server event!')
            end

            orgRegisterServerEvent(...)
        end
    end

    if RegisterNetEvent then
        local orgRegisterNetEvent = RegisterNetEvent

        RegisterNetEvent = function(...)
            local eventName = table.pack(...)[1]
            if IsEventSuppressed(eventName) then
                return print('[RedM Weapon Maintenance] RegisterNetEvent, suppressed ' .. eventName .. ' net event!')
            end

            orgRegisterNetEvent(...)
        end
    end
    
    if AddEventHandler then
        local orgAddEventHandler = AddEventHandler
        
        AddEventHandler = function(...)
            local eventName = table.pack(...)[1]
            if IsEventSuppressed(eventName) then
                return print('[RedM Weapon Maintenance] AddEventHandler, suppressed ' .. eventName .. ' event handler!')
            end

            orgAddEventHandler(...)
        end
    end
end