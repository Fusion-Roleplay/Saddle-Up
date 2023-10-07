if DiseasesConfig['cold'] then
    local Cold = Disease:new(DiseasesConfig['cold'])

    local coldness = 0

    function Cold:init()
        Citizen.CreateThread(function()
            local sleep = false
            while true do
                if coldness >= self.config.maxColdnessLevel and not self._data.active then
                    self:setActive(true)
                    self:startEffect()
                else
                    local coords = GetEntityCoords(PlayerPedId())
                    ShouldUseMetricTemperature()
                    local localTemperature = GetTemperatureAtCoords(coords.x, coords.y, coords.z)
                    local temperature = GetBodyExternalTemperature(PlayerPedId(), localTemperature)
                    if IsPedSwimming(PlayerPedId()) or IsPedSwimmingUnderWater(PlayerPedId()) then
                        sleep = false
                        coldness = math.min((coldness + 1) * self.config.waterRate, self.config.maxColdnessLevel)
                    else
                        sleep = true
                    end
                    if temperature <= self.config.coldTemperature then
                        sleep = false
                        coldness = math.min((coldness + 1) * self.config.temperatureRate, self.config.maxColdnessLevel)
                    else
                        sleep = true
                    end
                end
                if self._data.active then
                    if IsPedDeadOrDying(PlayerPedId()) and not self._data.paused then
                        self:setPaused(true)
                    end
                    if Config.removeDiseaseOnRevive then
                        if IsPedDeadOrDying(PlayerPedId()) then
                            self:stopEffect()
                            self:setActive(false)
                            self:setPaused(false)
                        end
                    end
                end
                if sleep then
                    Citizen.Wait(1000)
                else
                    Citizen.Wait(self.config.tickRate)
                end
            end
        end)
    end

    function Cold:startEffect()
        self._data.paused = false
        TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, self.config.language.started, 5000,
            'health')
        -- SetStaminaDepletionMultiplier
        Citizen.InvokeNative(0xEF5A3D2285D8924B, PlayerPedId(), 3.0)
        -- SetStaminaRechargeMultiplier
        Citizen.InvokeNative(0x345C9F993A8AB4A4, PlayerPedId(), 0.2)
        TriggerServerEvent('mega_doctorjob:newDiseaseWebhook', self.config.displayName, self.data)
        -- Start timer
        if self.config.autoHealTime ~= -1 then
            Citizen.CreateThread(function()
                Citizen.Wait(self.config.autoHealTime)
                if self._data.active then
                    TriggerServerEvent('mega_doctorjob:autoHealDiseaseWebhook', self.config.displayName)
                    TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle,
                        self.config.language.autoHealed, 5000, 'health')
                    self:stopEffect()
                    self:setActive(false)
                end
            end)
        end
        while self._data.active do
            Wait(self.config.effectRate)
            if self._data.active and not self._data.paused then
                PlayAnimation(PlayerPedId(), self.config.coughAnimationDict, self.config.coughAnimation, -1, 28)
                Citizen.InvokeNative(0xD9B31B4650520529, 'MEDIUM_EXPLOSION_SHAKE', 0.1)
                local health = GetEntityHealth(PlayerPedId()) - self.config.healthLossPerTick
                Citizen.InvokeNative(0xA9A41C1E940FB0E8, PlayerPedId(), true)
                SetEntityHealth(PlayerPedId(), health)
                if health <= 0 then
                    SetEntityHealth(PlayerPedId(), 0)
                end
                Citizen.InvokeNative(0xA9A41C1E940FB0E8, PlayerPedId(), false)
            end
        end
    end

    function Cold:stopEffect()
        -- SetStaminaDepletionMultiplier
        Citizen.InvokeNative(0xEF5A3D2285D8924B, PlayerPedId(), 1.0)
        -- SetStaminaRechargeMultiplier
        Citizen.InvokeNative(0x345C9F993A8AB4A4, PlayerPedId(), 1.0)
        coldness = 0
    end

    function Cold:setPaused(paused)
        self._data.paused = paused
    end

    DiseasesManager:loadDisease(Cold)
end
