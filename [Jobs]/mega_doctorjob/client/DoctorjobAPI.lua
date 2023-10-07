exports('ClientAPI', function ()
    local self = {}

    self.getBodyExternalTemperature = function (ped, localTemperature)
        return GetBodyExternalTemperature(ped, localTemperature)
    end
    
    self.getDiseases = function ()
        return DiseasesManager:getDiseases()
    end

    self.getDisease = function (disease)
        return DiseasesManager:getDisease(disease)
    end

    self.healDisease = function (diseaseID)
        local disease = DiseasesManager:getDisease(diseaseID)
        disease:setActive(false)
        disease:stopEffect()
    end

    self.giveDisease = function (diseaseID)
        local disease = DiseasesManager:getDisease(diseaseID)
        disease:setActive(true)
        disease:startEffect()
    end

    return self
end)