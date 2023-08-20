-- ANIMATION WHEN GIVE ITEMS TO OTHERS PLAYERS / SLOT
RegisterNetEvent('SS-TUTORIALS:ANIM:GIVEITEM')
AddEventHandler('SS-TUTORIALS:ANIM:GIVEITEM', function()
    local playerPed = PlayerPedId() 
    local dict = 'script_rc@chrb@ig1_visit_clerk'
    local anim = 'arthur_gives_money_player'
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
    Citizen.Wait(1)
    end   
    TaskPlayAnim(playerPed, dict, anim, 4.0, 4.0, 2000, 10, 0, false, false, false, false) 
end)
-- ANIMATION WHEN GIVE ITEMS TO OTHERS PLAYERS / SLOT