DiseasesManager = {}

DiseasesManager.diseases = {}

function DiseasesManager:loadDisease(disease) 
    if Config.printLogs then
        print('Loaded module: ' .. disease.name)
    end
    self.diseases[disease.name] = disease
end

function DiseasesManager:init()
    Citizen.CreateThread(function ()
        for k,disease in pairs(self.diseases) do
            disease:init()
            if disease.data.active then
                disease:startEffect()
            end
        end
    end)
end

function DiseasesManager:getDisease(disease)
    return self.diseases[disease]
end

function DiseasesManager:getDiseases()
    return self.diseases
end