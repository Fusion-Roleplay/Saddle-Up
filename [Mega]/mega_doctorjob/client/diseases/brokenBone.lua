if DiseasesConfig['brokenBone'] then
    local BrokenBone = Disease:new(DiseasesConfig['brokenBone'])

    function BrokenBone:init()
        Citizen.CreateThread(function()
            EventManager:on(GetHashKey('EVENT_NETWORK_DAMAGE_ENTITY'), function(data)
                local entityDamaged = data:GetInt32(0)
                local weaponUsed = data:GetInt32(8 * 5)
                local damage = data:GetFloat32(8 * 2)
                local hit, bone = GetPedLastDamageBone(PlayerPedId())
                if bone == 0 or entityDamaged ~= PlayerPedId() or weaponUsed ~= -842959696 or damage <= self.config.minDamageActivation then
                    return
                end
                local random = math.random()
                if random <= self.config.brokenBoneProbability and not self._data.active then
                    self._data.bone = bone
                    self._data.damageType = 'broken'
                    self:setActive(true)
                    self:startEffect()
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
                        if (IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId()))
                            and not self._data.paused
                            and IsPedOnFoot(PlayerPedId()) then
                            Wait(500)
                            Citizen.InvokeNative(0xD9B31B4650520529, 'MEDIUM_EXPLOSION_SHAKE', 0.5)
                            SetPedToRagdoll(PlayerPedId(), 2000, 5000, 0, true, true, true)
                            local health = GetEntityHealth(PlayerPedId()) - self.config.damageRunning
                            SetEntityHealth(PlayerPedId(), health)
                            if health <= 0 then
                                SetEntityHealth(PlayerPedId(), 0)
                            end
                        end
                    end
                else
                    sleep = true
                end
            end
        end)
    end

    function BrokenBone:startEffect()
        self._data.paused = false
        TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, self.config.language.started, 5000,
            'health')
        if not self._data.bone then
            local hit, bone = GetPedLastDamageBone(PlayerPedId())
            self._data.bone = bone
        end
        if not self._data.damageType then
            self._data.damageType = 'broken'
        end
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
        Citizen.InvokeNative(0x923583741DC87BCE, PlayerPedId(), 'default')
        Citizen.InvokeNative(0x89F5E7ADECCCB49C, PlayerPedId(), 'injured_general')
    end

    function BrokenBone:stopEffect()
        Citizen.InvokeNative(0x923583741DC87BCE, PlayerPedId(), 'arthur_healthy') -- SetPedDesiredLocoForModel
        Citizen.InvokeNative(0x89F5E7ADECCCB49C, PlayerPedId(), 'default')    -- SetPedDesiredLocoMotionType
        Citizen.InvokeNative(0x4FD80C3DD84B817B, PlayerPedId())               -- ClearPedDesiredLocoForModel
        Citizen.InvokeNative(0x58F7DB5BD8FA2288, PlayerPedId())               -- ClearPedDesiredLocoMotionType
        self._data.bone = nil
    end

    function BrokenBone:setPaused(paused)
        self._data.paused = paused
    end

    DiseasesManager:loadDisease(BrokenBone)
end
