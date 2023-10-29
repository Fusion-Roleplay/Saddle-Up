if GetCurrentResourceName() == 'vorp_inventory' then
    local rscVersion = tonumber(GetResourceMetadata('vorp_inventory', 'version', 0))

    if IsDuplicityVersion() then
        Citizen.CreateThread(function ()
            while not InventoryAPI do
                Citizen.Wait(0)
            end
    
            local fncName = 'giveWeapon2'
            if rscVersion >= 3.1 then
                fncName = 'giveWeapon'

                print('[RedM Weapon Maintenance] Detected vorp_inventory(' .. rscVersion .. ') version >= 3.1, applying updated patch for InventoryAPI.')
            end

            while not InventoryAPI[fncName] do
                Citizen.Wait(0)
            end
    
            local oldFnc = InventoryAPI[fncName]
            InventoryAPI[fncName] = function(player, weaponId, target)
                TriggerEvent('redm_weapon_maintenance:vorp:onGiveWeapon2', function()
                    oldFnc(player, weaponId, target)
                end, player, weaponId, target)
            end
    
            print('[RedM Weapon Maintenance] Patched InventoryAPI.' .. fncName .. '!')
        end)
    
        Citizen.CreateThread(function ()
            while not UsersWeapons do
                Citizen.Wait(0)
            end
    
            AddEventHandler('redm_weapon_maintenance:vorp:getWeaponData', function (cb, weaponId, inventory)
                if (not UsersWeapons) or (not UsersWeapons[inventory or 'default']) then
                    return cb(nil)
                end
        
                return cb(UsersWeapons[inventory or 'default'][weaponId])
            end)
    
            print('[RedM Weapon Maintenance] Patched InventoryAPI, added getWeaponData event!')
        end)
    
        Citizen.CreateThread(function ()
            while not ItemPickUps do
                Citizen.Wait(0)
            end
    
            AddEventHandler('redm_weapon_maintenance:vorp:getItemPickUpsData', function (cb, obj)
                if (not ItemPickUps) or (not ItemPickUps[obj]) then
                    return cb(nil)
                end
        
                return cb(ItemPickUps[obj])
            end)
    
            print('[RedM Weapon Maintenance] Patched InventoryService, added getItemPickUpsData event!')
        end)
    end
end