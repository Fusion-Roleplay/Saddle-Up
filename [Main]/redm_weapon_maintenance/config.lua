Config = {}

Config.Debug = true
Config.EnableNotifications = true

--[[ Integrations config ]]--
Config.UseIntegration = 'vorp' -- 'redemrp' / 'vorp' / false 
Config.StatsSyncInterval = 30000
Config.PropsLoadTimeout = 5000 -- Max time for weapon props to load.
Config.EnableGunOilCheck = true
Config.GunOilItemName = 'gun_oil'
Config.DisableCleaningViaWheelMenu = false
Config.EnableSynScriptsCompatibility = true -- Only for vorp users | read README.md before using.
Config.EnableWeaponMalfunctions = true
Config.EnablePermanentDegradation = true

--[[ Malfunctions config ]]--
Config.MalfunctionMinDegradation = 0.3 -- 0.0 (good condition) - 1.0 (poor condition) | Minimal level of weapon degradation when malfunctions will begin to occur.
Config.MalfunctionChanceMultiplier = 0.5 -- Chance multiplier of malfunction to occur.
Config.MalfunctionNotificationEnabled = true
Config.MalfunctionNotificationDuration = 2500
Config.MalfunctionNotification = 'The weapon is jammed and needs to be cleaned.'
Config.MalfunctionEnableJammedSound = true
Config.MalfunctionEnablePermanentJamming = true -- Jams weapon permanently (can be unjammed by cleaning when permanent degradation is lower than Config.MalfunctionPermJamMinPermDegradation) when permanent degradation is greater or equal to Config.MalfunctionPermJamMinPermDegradation value.
Config.MalfunctionPermJamMinPermDegradation = 1.0 -- Defines a level of permanent degradation when weapon gets permanently jammed.
Config.MalfunctionPermJamNotification = 'The weapon is completely broken.'

--[[ Permanent degradation config ]]--
Config.PermDegMinDegradation = 0.0 -- 0.0 (good condition) - 1.0 (poor condition) | Minimal level of weapon degradation to begin permanently damaging the weapon when shooting.
Config.PermDegMultiplier = 0.25 -- Permanent weapon damage multiplier when shooting degraded weapon. Basically, if you're shooting a not well-maintained weapon, you will break your gun way faster than if shooting a better-maintained weapon. It is strongly recomended to start with low multiplier and increase if needed.
Config.PermDegReminderEnabled = true
Config.PermDegReminderMinDegradation = 0.65 -- 0.0 (good condition) - 1.0 (poor condition) | Minimal level of weapon degradation to begin reminding player of permanent weapon degradation.
Config.PermDegReminderMinInterval = 10 * (60 * 1000) -- Minimal time between the next reminder.
Config.PermDegReminderDuration = 6000
Config.PermDegReminderNotification = 'The weapon is in bad condition and will be permanently damaging itself way faster.'