local ExtractorInUse = false
local temp, timer, good, cold, hot = 400, 0, 0, 0, 0

local extratemp
local controlKeyTemperature = 0x07CE1E61

function PrompControlTemp()
    Citizen.CreateThread(function()
        local str = "Control"
        extratemp = PromptRegisterBegin()
        PromptSetControlAction(extratemp, controlKeyTemperature)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(extratemp, str)
        PromptSetEnabled(extratemp, true)
        PromptSetVisible(extratemp, true)
        PromptSetHoldMode(extratemp, true)
        PromptRegisterEnd(extratemp)
    end)
end

function HateOrLoveIt()
    if not ExtractorInUse then
        ExtractorInUse = true
        temp, timer, good, cold, hot = 400, 0, 0, 0, 0
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        SetCurrentPedWeapon(PlayerPedId(), -1569615261, true)
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), true)
        RequestAnimDict("veh_balloon@driver_rear@base")
        while not HasAnimDictLoaded("veh_balloon@driver_rear@base") do
            Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), "veh_balloon@driver_rear@base", "enter_crouched_ptn1", 1.0, 0.5, 1000, tonumber(0),
            0.0, 0, 0, 0)
        Wait(1000)
        TaskPlayAnim(PlayerPedId(), "veh_balloon@driver_rear@base", "base_ptn1_crouched", 1.0, 0.5, -1, tonumber(2),
            0.0, 0, 0, 0)
        PrompControlTemp()
        while true do
            Wait(1)
            local average = 0
            local count = 0
            if temp <= 1001 then
                temp = temp + 2.0
            end
            local t = temp / 10000
            DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.02, 0.11, 0.8, 0, 0, 0, 190, 0)
            if t > 0.06 then
                DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.01, t, 0.2, 204, 0, 0, 190, 0)
                hot = hot + 1
            elseif t < 0.04 then
                DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.01, t, 0.2, 0, 102, 255, 190, 0)
                cold = cold + 1
            else
                DrawSprite("generic_textures", "hud_menu_4a", 0.2, 0.9, 0.01, t, 0.2, 51, 204, 51, 190, 0)
                good = good + 1
            end
            if PromptHasHoldModeCompleted(extratemp) then
                temp = temp - 2.5
                if temp < 0 then
                    temp = 0
                end
                if temp > 1000 then
                    temp = 1000
                end
            end
            timer = timer + 1
            average = average + temp
            count = count + 1
            local realtemp = average / count
            print(realtemp)
            local timeout = 300
            if timer > timeout then
                PromptDelete(extratemp)
                local result = {
                    good = good,
                    cold = cold,
                    hot = hot,
                    realtemp = realtemp
                }
                TaskPlayAnim(PlayerPedId(), "veh_balloon@driver_rear@base", "exit_crouched_ptn1", 1.0, 0.5, 1000,
                    tonumber(0), 0.0, 0, 0, 0)
                Wait(1000)
                ClearPedTasks(PlayerPedId())
                SetModelAsNoLongerNeeded(prop)
                FreezeEntityPosition(PlayerPedId(), false)
                ExtractorInUse = false
                return result
            end
        end
    end
end

function SetAmount(text)
    Wait(1000)
    local Amount = 0
    AddTextEntry('FMMC_MPM_NA', "Amount of " .. text .. " to input:")
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Citizen.Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        Amount = GetOnscreenKeyboardResult()
        if Amount == nil then
            Amount = 0
        end
    end
    print("2 " .. Amount)
    return Amount
end

function reward()
    local result = HateOrLoveIt()
    local hot = result.hot
    local cold = result.cold
    local good = result.good

    if hot > cold and hot > good then
        local resultadofinal = (hot / 3)
        if good > hot and good > cold then
            local resultadofinal = (good / 6)
            if cold > hot and cold > good then
                local resultadofinal = (cold / 15)
            end
        end
    end
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        PromptDelete(extratemp)
    end
end)
