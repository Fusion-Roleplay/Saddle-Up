if GetCurrentResourceName() == 'vorp_inventory' then
    if IsDuplicityVersion() then
        Citizen.CreateThread(function ()
            while not InventoryAPI do
                Citizen.Wait(0)
            end
    
            while not InventoryAPI.giveWeapon2 do
                Citizen.Wait(0)
            end
    
            local oldFnc = InventoryAPI.giveWeapon2
            InventoryAPI.giveWeapon2 = function(player, weaponId, target)
                TriggerEvent('redm_weapon_maintenance:vorp:onGiveWeapon2', function()
                    oldFnc(player, weaponId, target)
                end, player, weaponId, target)
            end
    
            print('[RedM Weapon Maintenance] Patched InventoryAPI.giveWeapon2!')
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