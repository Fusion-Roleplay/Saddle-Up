PlayerData = {}
Initializing = true
local startingPos = nil
local blips = {}
local helpRequests = {}
local npcs = {}
local playerOpened = nil
BandanaUp = false

local NPlayerSelector = nil
TriggerEvent('mega_nplayerselector:load', function (data)
    NPlayerSelector = data
end)

function InitPrompts()
    -- Prop Prompts
    Citizen.CreateThread(function ()
        local bedPromptGroup = UipromptGroup:new(Config.language.medicalBed)
    
        local lay = Uiprompt:new(0x2EAB0795, Config.language.layDown, bedPromptGroup)
        lay:setHoldMode(true)
    
        local visit = Uiprompt:new(0x5415BE48, Config.language.visit, bedPromptGroup)
        visit:setHoldMode(true)
        visit:setOnHoldModeJustCompleted(function()
            visit:setEnabled(false)
            NPlayerSelector:onPlayerSelected(function (data)
                TriggerServerEvent('mega_doctorjob:visit', data.id)       
                NPlayerSelector:deactivate()
            end)
            NPlayerSelector:setRange(5)
            NPlayerSelector:activate()
            Wait(1)
            visit:setEnabled(true)
        end)
        if not contains(Config.jobs, PlayerData.job) then
            visit:setVisible(false)
        end
    
        local getUp = Uiprompt:new(0x827E9EE8, Config.language.getUp, bedPromptGroup)
        getUp:setHoldMode(true)
        getUp:setVisible(false)
        getUp:setOnHoldModeJustCompleted(function ()
            getUp:setVisible(false)
            getUp:setEnabled(false)
            lay:setVisible(true)
            lay:setEnabled(true)
            ClearPedTasks(PlayerPedId())
            FreezeEntityPosition(PlayerPedId(), false)
            SetEntityCoords(PlayerPedId(), startingPos.x, startingPos.y, startingPos.z, true, false, false, false)
        end)
    
        lay:setOnHoldModeJustCompleted(function ()
            startingPos = GetEntityCoords(PlayerPedId())
            LayOnBed(PlayerPedId())
            lay:setVisible(false)
            lay:setEnabled(false)
            getUp:setEnabled(true)
            getUp:setVisible(true)
        end)
    
        local sleep = false
        while true do
            if sleep then
                Citizen.Wait(500)
            else
                Citizen.Wait(2)
            end
            local coords = GetEntityCoords(PlayerPedId())
            if IsNearProp(coords) then
                bedPromptGroup:setActiveThisFrame()
                bedPromptGroup:handleEvents()
                sleep = false
            else
                sleep = true
            end
        end
    end)

    -- Target Prompts
    Citizen.CreateThread(function ()
        if not contains(Config.jobs, PlayerData.job) then
            return
        end
        local visitPrompt
        while Config.allowPlayerTargeting do
            local res, entity = GetPlayerTargetEntity(PlayerId()) 
            if entity ~= 0 then
                if IsPedAPlayer(entity) then
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local targetCoords = GetEntityCoords(entity)
                    if #(playerCoords - targetCoords) <= Config.playerTargetRange then
                        local id = Citizen.InvokeNative(0xB796970BD125FCE8, entity) -- UiPromptGetGroupIdForTargetEntity
                        if not visitPrompt then
                            visitPrompt = SetupPrompt(1, 0x5415BE48, id, Config.language.visit)
                        end
                        if PromptHasStandardModeCompleted(visitPrompt) then
                            TriggerServerEvent('mega_doctorjob:visit', GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))       
                        end
                    else
                        if visitPrompt then 
                            PromptDelete(visitPrompt)
                            visitPrompt = nil
                        end
                    end
                end
            else
                if visitPrompt then 
                    PromptDelete(visitPrompt)
                    visitPrompt = nil
                end
            end
            Citizen.Wait(2)
        end
    end)

    -- Dead Inspect Prompt Setup
    RegisterCommand(Config.inspectCommand, function (source, args)
        if not contains(Config.inspectJobs, PlayerData.job) then
            return
        end
        NPlayerSelector:onPlayerSelected(function (data)
            NPlayerSelector:deactivate()
            data.id = tonumber(data.id)
            local targetPlayer = GetPlayerFromServerId(data.id)
            local targetPed = GetPlayerPed(targetPlayer)
            if IsPedDeadOrDying(targetPed) then
                local retval, bone = GetPedLastDamageBone(targetPed)
                TriggerServerEvent('mega_doctorjob:inspect', data.id, bone)
            end
        end)
        NPlayerSelector:setRange(5)
        NPlayerSelector:activate()
    end)

    -- NPC Prompts
    Citizen.CreateThread(function ()

        local healNPCPromptGroup = UipromptGroup:new(Config.language.npcDoctor)
    
        local heal = Uiprompt:new(0x2EAB0795, Config.language.healMe, healNPCPromptGroup)
        heal:setHoldMode(true)
        local revive = Uiprompt:new(0x760A9C6F, Config.language.revive, healNPCPromptGroup)
        revive:setHoldMode(true)

        local sleep = true
        while true do
            if sleep then
                Citizen.Wait(500)
            else
                Citizen.Wait(2)
            end
            local coords = GetEntityCoords(PlayerPedId())
            local hospital = IsNearNPC(coords)
            if hospital then
                heal:setOnHoldModeJustCompleted(function ()
                    TriggerServerEvent('mega_doctorjob:npcHeal', hospital)
                end)
                revive:setOnHoldModeJustCompleted(function ()
                    revive:setEnabled(false)
                    NPlayerSelector:onPlayerSelected(function (data)
                        NPlayerSelector:deactivate()             
                        local targetEntity = GetPlayerPed(data.id)
                        if not IsPedDeadOrDying(targetEntity) then
                            TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, Config.language.notDead, 5000, 'health')
                            return
                        end     
                        local retval, bone = GetPedLastDamageBone(targetPed)
                        if Config.noHeadshotRevive and bone == 21030 then
                            TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, Config.language.cannotReviveHeadshot, 5000, 'health')
                            return
                        end
                        TriggerServerEvent('mega_doctorjob:npcRevive', hospital, data.id)
                    end)
                    NPlayerSelector:setRange(5)
                    NPlayerSelector:activate()
                    Wait(1)
                    revive:setEnabled(true)
                end)
                healNPCPromptGroup:setActiveThisFrame()
                healNPCPromptGroup:handleEvents()
                sleep = false
            else
                sleep = true
            end
        end
    end)
end

function SetupPrompt(promptID, key, group, text)
    if not PromptIsValid(promptID) then
        promptID = PromptRegisterBegin()
        PromptSetControlAction(promptID, key)
        local str = CreateVarString(10, 'LITERAL_STRING', text)
        PromptSetText(promptID, str)
        PromptSetEnabled(promptID, 1)
        PromptSetVisible(promptID, 1)
        PromptSetStandardMode(promptID, 1)
        PromptSetGroup(promptID, group)
        PromptRegisterEnd(promptID)
    end
    return promptID
end

function IsNearProp(coords)
    for k,v in pairs(Config.medicalBeds) do       
        if DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 1.0, GetHashKey(v), 0) then
            return true
        end
    end
    return false
end

function IsNearNPC(coords)
    for k,v in pairs(Config.hospitals) do       
        if #(v.npc.coords - coords) <= v.npc.range then
            return k
        end
    end
    return false
end

function RefreshBlips()
    for k,v in pairs(blips) do
        RemoveBlip(v)
    end
    for k,v in pairs(Config.hospitals) do
        if v.showBlip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blip, v.blipSprite)
            SetBlipScale(blip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, k)
            table.insert(blips, blip)
        end
    end
end

function RefreshNPCs()
    for k,v in pairs(npcs) do
        Citizen.InvokeNative(0xFAA3D236, v) -- DeleteEntity
    end
    for k,v in pairs(Config.hospitals) do
        if v.npc.enabled then
            local model = RequestModel(GetHashKey(v.npc.npcModel))

            while not HasModelLoaded(GetHashKey(v.npc.npcModel)) do
                Wait(100)
            end
    
            local spawnCoords = v.npc.coords
            local ped = CreatePed(GetHashKey(v.npc.npcModel), spawnCoords.x, spawnCoords.y, spawnCoords.z, v.npc.heading, false, true, true, true)
            Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
            SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
            SetEntityCanBeDamaged(ped, false)
            SetEntityInvincible(ped, true)
            Wait(2000)
            FreezeEntityPosition(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetModelAsNoLongerNeeded(GetHashKey(v.npc.npcModel))
            table.insert(npcs, ped)
        end
    end
end

RegisterNetEvent('mega_doctorjob:openInspectDashboard')
AddEventHandler('mega_doctorjob:openInspectDashboard', function (lastDamagedBone, patientData)
    SendNUIMessage({
        action = 'inspect',
        lastDamagedBone = lastDamagedBone,
        diseases = DiseasesConfig,
        patient = patientData
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('mega_doctorjob:openDashboard')
AddEventHandler('mega_doctorjob:openDashboard', function (patientData, notes, hospital, target)
    playerOpened = patientData.charid
    SendNUIMessage({
        action = 'show',
        patient = patientData,
        diseases = DiseasesConfig,
        notes = notes,
        hospital = hospital,
        target = target,
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('mega_doctorjob:updateDashboard')
AddEventHandler('mega_doctorjob:updateDashboard', function (player, data)
    if playerOpened == player then
        SendNUIMessage({
            action = 'update',
            data = data
        })
    end
end)

RegisterNetEvent('mega_doctorjob:setPlayer')
AddEventHandler('mega_doctorjob:setPlayer', function (data)
    PlayerData = data
    for k,v in pairs(PlayerData.diseases) do
        local disease = DiseasesManager:getDisease(k)
        if disease then
            for k,v in pairs(PlayerData.diseases[k]) do
                disease._data[k] = v
            end
        end 
    end
    EventManager:init()
    DiseasesManager:init()
    Initializing = false
    InitPrompts()
    RefreshBlips()
    RefreshNPCs()
end)

RegisterNetEvent('mega_doctorjob:healItemUsed')
AddEventHandler('mega_doctorjob:healItemUsed', function (healItem)
    Citizen.CreateThread(function ()
        local itemConfig = MedicineItems[healItem]
        ClearPedTasks(PlayerPedId())
        if itemConfig.scenario then
            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(itemConfig.scenario), -1, true, false, false, false)
        else 
            PlayAnimation(PlayerPedId(), itemConfig.animationDict, itemConfig.animation, itemConfig.applyDuration, 0)
        end
        FreezeEntityPosition(PlayerPedId(), true)
        exports['mega_progressbars']:DisplayProgressBar(itemConfig.applyDuration, itemConfig.language.applying)
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, itemConfig.language.applied, 5000, 'health')
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mega_doctorjob:healPlayer', nil, itemConfig.healthAmount, itemConfig.innerCoreHealth)
        local itemHealProbabilities = MedicineItems[healItem].healProbability
        local healedDiseases = {} -- just for webhooks data
        for diseaseID, healProb in pairs(itemHealProbabilities) do
            local disease = DiseasesManager:getDisease(diseaseID)
            if disease:getActive() then
                local random = math.random()
                if random <= healProb then
                    table.insert(healedDiseases, disease.config.displayName)
                    local initialDamageType = disease._data.damageType
                    if itemConfig.damageType then
                        disease._data.damageType = itemConfig.damageType
                    end
                    if itemConfig.cureDuration ~= -1 then
                        Citizen.CreateThread(function ()
                            disease:setPaused(true)
                            Citizen.Wait(itemConfig.cureDuration)
                            if disease._data.active then
                                -- if it's still on item's damage type no doctor healed him
                                -- otherwise the doctor is already healing him and must be restarted
                                if disease._data.damageType == itemConfig.damageType then
                                    TriggerEvent('mega_notify:notifyRight', Config.language.notificationTitle, itemConfig.language.cureExpired, 5000, 'health')
                                    disease._data.damageType = initialDamageType
                                    disease:setPaused(false)
                                end
                            end
                        end)
                    else 
                        disease:setActive(false)
                        disease:stopEffect()
                    end
                end
            end    
        end
        TriggerServerEvent('mega_doctorjob:healItemUsedWebhook', healItem, healedDiseases)
    end)
end)

RegisterNetEvent('mega_doctorjob:heal')
AddEventHandler('mega_doctorjob:heal', function (amount, innerCoreHealth) 
    if amount == 0 then return end
    amount = math.floor(amount)
    local health = GetEntityHealth(PlayerPedId()) + amount
    local maxHealth = GetEntityMaxHealth(PlayerPedId())
    SetEntityHealth(PlayerPedId(), health)
    if health >= maxHealth then
        SetEntityHealth(PlayerPedId(), maxHealth)
    end
    local newInnerCore = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 0, Citizen.ResultAsInteger()) + innerCoreHealth -- GetAttributeCoreValue
    if newInnerCore >= 100 then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 100) -- SetAttributeCoreValue
    end
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, newInnerCore) -- SetAttributeCoreValue
end)

RegisterNetEvent('mega_doctorjob:reviveItemUsed')
AddEventHandler('mega_doctorjob:reviveItemUsed', function (reviveItem)
    Citizen.CreateThread(function ()
        NPlayerSelector:onPlayerSelected(function (data)
            NPlayerSelector:deactivate()
            local itemConfig = ReviveItems[reviveItem]
            if tonumber(data.id) == GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId())) then
                return
            end
            ClearPedTasks(PlayerPedId())
            if itemConfig.scenario then
                TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(itemConfig.scenario), -1, true, false, false, false)
            else 
                PlayAnimation(PlayerPedId(), itemConfig.animationDict, itemConfig.animation, -1, 0)
                Wait(2000)
                Citizen.InvokeNative(0xEAA885BA3CEA4E4A, PlayerPedId(), itemConfig.animationDict, itemConfig.animation, 0)
            end
            FreezeEntityPosition(PlayerPedId(), true)
            exports['mega_progressbars']:DisplayProgressBar(itemConfig.applyDuration, itemConfig.language.applying)
            Citizen.InvokeNative(0xEAA885BA3CEA4E4A, PlayerPedId(), itemConfig.animationDict, itemConfig.animation, 1)
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('mega_doctorjob:revivePlayer', data.id)    
            TriggerServerEvent('mega_doctorjob:healPlayer', data.id, itemConfig.healthAmount, itemConfig.innerCoreHealth)
            TriggerServerEvent('mega_doctorjob:reviveItemUsed', reviveItem)
            ClearPedTasks(PlayerPedId())
        end)
        NPlayerSelector:setRange(5)
        NPlayerSelector:activate()
    end)
end)

RegisterNetEvent('mega_doctorjob:healDisease')
AddEventHandler('mega_doctorjob:healDisease', function (diseaseID, completeHeal)
    local disease = DiseasesManager:getDiseases()[diseaseID]
    local damageType = disease._data.damageType
    if (not damageType) or completeHeal then
        disease._data.damageType = nil
        disease:setActive(false)
        disease:stopEffect()
        return
    end
    damageType = Config.damageTypes[damageType].next
    disease._data.damageType = damageType
    if not damageType then
        disease:setActive(false)
        disease:stopEffect()
    end
end)

RegisterNetEvent('mega_doctorjob:healAll')
AddEventHandler('mega_doctorjob:healAll', function (diseasesOnly)
    diseasesOnly = diseasesOnly or false
    local diseases = DiseasesManager:getDiseases()
    for k,disease in pairs(diseases) do
        disease._data.damageType = nil
        disease:setActive(false)
        disease:stopEffect()
    end
    if not diseasesOnly then
        SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 100.0)
    end
end)

RegisterNetEvent('mega_doctorjob:giveDisease')
AddEventHandler('mega_doctorjob:giveDisease', function (diseaseID)
    local disease = DiseasesManager:getDiseases()[diseaseID]
    disease:setActive(true)
    disease:startEffect()
end)

RegisterNetEvent(Config.bandanaEvent)
AddEventHandler(Config.bandanaEvent, function (bandana)
    BandanaUp = bandana
end)

RegisterNetEvent('mega_doctorjob:addHelpRequest')
AddEventHandler('mega_doctorjob:addHelpRequest', function (coords, time, source)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)
    local radius = Citizen.InvokeNative(0x45F13B7E0A15C880, Config.radiusStyle, coords.x, coords.y, coords.z, Config.blipRadius)
    SetBlipSprite(blip, Config.alertBlipSprite)
    SetBlipScale(blip, 0.2)
    table.insert(helpRequests, { blip = blip, radius = radius, source = source, coords = coords })
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, string.format(Config.language.helpBlipText, #helpRequests, time))
    Citizen.Wait(Config.alertTimeout*1000)
    RemoveBlip(blip)
    RemoveBlip(radius)
end)

AddEventHandler('onResourceStop', function (res)
    if res == GetCurrentResourceName() then
        for k,v in pairs(blips) do
            RemoveBlip(v)
        end
        for k,v in pairs(npcs) do
            DeletePed(v) -- DeletePed
        end
        for k,v in pairs(helpRequests) do
            RemoveBlip(v.blip)
            if v.radius ~= nil then
                RemoveBlip(v.radius)
            end
        end
    end
end)

RegisterNUICallback('closeUi', function (data, cb)
    playerOpened = nil
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback('healDisease', function (data, cb)
    playerOpened = nil
    SetNuiFocus(false, false)
    local disease = data.disease
    local damageType = Config.damageTypes[disease.damageType]
    if not damageType then 
        damageType = Config.damageTypes['default']
    end
    PlayAnimation(PlayerPedId(), damageType.animationDict, damageType.animation, damageType.duration, 28)
    exports.mega_progressbars:DisplayProgressBar(damageType.duration, damageType.lang)
    TriggerServerEvent('mega_doctorjob:healPlayerDisease', data.target, data.diseaseID)
    cb({})
end)

RegisterNUICallback('addNote', function (data, cb)
    TriggerServerEvent('mega_doctorjob:addNote', data.text, data.hospital, data.patientCharId)
    cb({})
end)

RegisterNUICallback('deleteNote', function (data, cb)
    TriggerServerEvent('mega_doctorjob:deleteNote', data.noteId, data.hospitalId, data.patientCharId)
    cb({})
end)

RegisterCommand(Config.clearAlertCommand, function ()
    ClearGpsCustomRoute()
    SetGpsCustomRouteRender(false, 16, 16)
    for k,v in pairs(helpRequests) do
        RemoveBlip(v.blip)
        if v.radius ~= nil then
            RemoveBlip(v.radius)
        end
    end
end)

RegisterCommand(Config.alertCommand, function (source, args)
    if IsPedDeadOrDying(PlayerPedId()) and not Config.allowDeadPlayers then
        return
    end
    TriggerServerEvent('mega_doctorjob:createHelpRequest')
end)

RegisterCommand(Config.respondCommand, function (source, args)
    if not Config.enableAlertResponse then return end
    local helpId = tonumber(args[1])
    if not helpId then return end
    local helpRequest = helpRequests[helpId]
    if not helpRequest then return end
    ClearGpsCustomRoute()
    StartGpsMultiRoute(`COLOR_RED`, true, true)
    AddPointToGpsMultiRoute(helpRequest.coords.x, helpRequest.coords.y, helpRequest.coords.z)
    SetGpsCustomRouteRender(true, 8, 8)
    TriggerServerEvent('mega_doctorjob:respondHelpRequest', helpRequest)
end)

TriggerEvent("chat:addSuggestion", "/healDisease", "Mega Doctorjob | Heals the specified disease for specified player.",{
    {name = "diseaseID", help='Example: bleeding, malaria, brokenBone...'},
    {name = "target", help='The ID of the target user'},
})

TriggerEvent("chat:addSuggestion", "/giveDisease", "Mega Doctorjob | Gives the specified disease for specified player.",{
    {name = "diseaseID", help='Example: bleeding, malaria, brokenBone...'},
    {name = "target", help='The ID of the target user'},
})