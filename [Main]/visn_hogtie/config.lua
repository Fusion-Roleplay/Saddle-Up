Config = {}

Config.DisableGiveUp = true -- Disable give up option
Config.DisableBreakFree = false -- Disable break free option (only enable if Config.TemporaryDisableBreakFree is set to false)
Config.TemporaryDisableBreakFree = true -- Temporary disable break free option (only enable if Config.DisableBreakFree is set to false)
Config.TemporaryDisableBreakFreeTime = 900000 * 15 -- Time in ms to disable break free option, default is 2 minutes