if DiseasesConfig['snakeBite'] then
    local SnakeBite = Disease:new(DiseasesConfig['snakeBite'])

    function SnakeBite:init()
        Citizen.CreateThread(function()
            EventManager:on(GetHashKey('EVENT_NETWORK_DAMAGE_ENTITY'), function(data)
                local entityDamaged = data:GetInt32(0)
                local weaponUsed = data:GetInt32(8 * 5)
                local ammoUsed = data:GetInt32(8 * 6)
                local isMelee = data:GetInt32(8 * 12)
                if entityDamaged == PlayerPedId() then
                    if weaponUsed == -655377385 then
                        local random = math.random()
                        if random <= self.config.poisonousBiteProbability then
                            self:setPaused(false)
                            self:setActive(true)
                            self:startEffect()
                        end
                    end
                end
            end)
            local sleep = false
            while true do
                if sleep then
                    Citizen.Wait(1000)
                else
                    Citizen.Wait(self.config.tickRate)
                end
                if self._data.active then
                    sleep = false
                    Citizen.InvokeNative(0xDE1B1907A83A1550, PlayerPedId(), 0.0)
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
                    if self.config.enableRagdoll then
                        if (IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId())) and IsPedOnFoot(PlayerPedId()) then
                            Wait(1000)
                            Citizen.InvokeNative(0xD9B31B4650520529, 'MEDIUM_EXPLOSION_SHAKE', 0.5)
                            SetPedToRagdoll(PlayerPedId(), 2000, 5000, 0, true, true, true)
                        end
                    end
                else
                    sleep = true
                end
            end
        end)
    end

    function SnakeBite:startEffect()
        self._data.paused = false
        TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, self.config.language.started, 5000,
            'health')
        -- SetStaminaDepletionMultiplier
        Citizen.InvokeNative(0xEF5A3D2285D8924B, PlayerPedId(), 3.0)
        -- SetStaminaRechargeMultiplier
        Citizen.InvokeNative(0x345C9F993A8AB4A4, PlayerPedId(), 0.2)
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
        TriggerServerEvent('mega_doctorjob:newDiseaseWebhook', self.config.displayName, self.data)
        while self._data.active do
            Wait(self.config.effectRate)
            if self._data.active and not self._data.paused then
                PlayAnimation(PlayerPedId(), self.config.vomitAnimationDict, self.config.vomitAnimation, -1, 28)
                local health = GetEntityHealth(PlayerPedId()) - self.config.healthLossPerTick
                SetEntityHealth(PlayerPedId(), health)
                if health <= 0 then
                    SetEntityHealth(PlayerPedId(), 0)
                end
            end
        end
    end

    function SnakeBite:stopEffect()
        -- SetStaminaDepletionMultiplier
        Citizen.InvokeNative(0xEF5A3D2285D8924B, PlayerPedId(), 1.0)
        -- SetStaminaRechargeMultiplier
        Citizen.InvokeNative(0x345C9F993A8AB4A4, PlayerPedId(), 1.0)
    end

    function SnakeBite:setPaused(paused)
        self._data.paused = paused
    end

    DiseasesManager:loadDisease(SnakeBite)
end
