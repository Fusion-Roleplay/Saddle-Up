--Limpar
function animClean()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 32000, true, false, false, false)
end

--Dar comida ás galinhas
function animFeedChicken()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FEED_CHICKEN"), 32000, true, false, false, false)
end

--Meter água
function animWater()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SPREAD"), 32000, true, false, false, false)
end

--Meter água
function animWater2()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"), 15000, true, false, false, false)
end

--Tirar leite
function CrouchAnim()
    local dict = "mech_milking"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "milking_loop_player", 1.0, 8.0, -1, 1, 0, false, false, false)
end

--Tirar ovos
function egganim()
    local dict = "mech_pickup@loot_body@dead_hogtie_face_up@transitions"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "rt_to_loot", 1.0, 8.0, -1, 1, 0, false, false, false)
end

--Escavar
function shovelanim()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_SHOVEL_COAL_PICKUP"), 32000, true, false, false, false)
    local dict = "mech_pickup@mp_treasure@grab_01"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "base", 1.0, 8.0, -1, 1, 0, false, false, false)
end

-- Clean Ped After Anims
function CleanPedAfterAnim()
    ClearPedTasks(PlayerPedId())
    Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
end
