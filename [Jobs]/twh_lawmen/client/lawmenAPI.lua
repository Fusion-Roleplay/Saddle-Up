exports('lawmenAPI', function ()
    local self = {}

    self.getPlayerData = function ()
        return GetPlayerData()
        --returns Object Player with Attributes:
        -- .handcuffed (returns true if player is handcuffed)
        -- .IsDragged   (returns true if player is dragged)
        -- .draggedBy (returns player id who drags the player)
        -- .boating (returns true when player is in cinemtic in boat)
        -- .inWagon (returns true when player is in prisoners wagon)
        -- .prisonerClothing (returns true if player should wear prisoner clothing)
        -- .playerJob (returns player Job)
    end
    self.getPrisonData = function ()
        return GetPrisonData()
        --returns Object PrisonData with Attributes:
        -- .imprisoned (returns true if player should be imprisoned)
        -- .time  (returns remaining arrest time)
        -- .canEscape (returns true if alert is disabled for player)
    end

    self.increaseArrestTimer = function (time)
        TriggerServerEvent("twh_prison:increaseTimer",time)
    end
    self.decreaseArrestTimer = function (time)
        TriggerServerEvent("twh_prison:reduceTimer",time)
    end

    self.triggerAlert = function (state) --true: start alert, false: end alert
        TriggerServerEvent("twh_prison:triggerAlert",state)
    end

    self.setClothing = function () --put on prisoners clothing
        SetPrisonersClothing()
    end

    self.resetClothing = function () --remove prisoners clothing
        TriggerServerEvent("twh_prison:unCloth")
    end


    return self
end)