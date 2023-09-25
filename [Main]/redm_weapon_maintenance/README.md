# RedM Weapon Maintenance
Having trouble with dirty and sooty weapon? This script is solution for all of your pain! This script brings back RDR2 weapon inspecting/cleaning mechanics.

## Weapon malfunctions system
After enabling the malfunction system, weapons will begin to randomly jam when their current degradation level exceeds the Config.MalfunctionMinDegradation value. The probability of a weapon jamming is determined by the current degradation level of the weapon and can be further adjusted by the Config.MalfunctionChanceMultiplier parameter. This probability is calculated using the following equation: math.random(1, 100) < ((currentDegradation * 100) * Config.MalfunctionChanceMultiplier). Additionally, a weapon can permanently jam (with Config.MalfunctionEnablePermanentJamming and permanent degradation feature enabled) if its permanent degradation level is equal to or greater than the Config.MalfunctionPermJamMinPermDegradation value.

## Weapon permanent degradation system
After enabling permanent degradation, weapons will begin to sustain irreversible damage when their current degradation level exceeds the `Config.PermDegMinDegradation` value. At this point, the weapons cannot be restored to a state better than their current level of permanent degradation. It's important to note that inadequate maintenance will accelerate the rate at which the weapon breaks down, whereas proper upkeep will extend its lifespan. The speed at which permanent degradation occurs can be adjusted using the `Config.PermDegMultiplier` parameter. It is recommended to start with a low value and increase it if necessary. Weapon permanent degradation is calculated using this equation: `currentPermDegradation + (currentDegradation * (Config.PermDegMultiplier / 1000))`. Once weapon permanent degradation hit's level of 1.0 `redm_weapon_maintenance:weaponBroke` event containing weaponHash and depending on current framework weaponData for VORP and weaponMeta for RedEM:RP is triggered on both client and server.

Example usage (VORP):
```
RegisterNetEvent('redm_weapon_maintenance:weaponBroke', function (weaponHash, weaponData)
    print('Weapon', weaponHash, 'with id', weaponData.id, 'broke!')
end)
```


## RedEM:RP Compatibility note:
All weapon stats(degradation, damage, dirt, soot, isJammed) are stored in item meta field.

- Requirements:
    - [redemrp_inventory 2.0v](https://github.com/RedEM-RP/redemrp_inventory)

- Installation:
    1. Append code below to `redemrp_inventory/client/cl_main.lua`:
        ```
        RegisterNetEvent('redemrp_inventory:SendItems', function (items, otherItems, weight, isOther)
            if isOther then
                return
            end

            for _, item in ipairs(items) do
                if item.type == 'item_weapon' then
                    local weaponHash = tonumber(item.weaponHash)

                    if UsedWeapons[weaponHash] and UsedWeapons[weaponHash].meta.uid == item.meta.uid then
                        UsedWeapons[weaponHash].meta = item.meta
                    end
                end
            end
        end)
        ```

    2. Change `Config.UseIntegration` config field to `'redemrp'`.
    3. That's all!


## RedEM:RP Reboot Compatibility note:
- Installation:
    1. Append code below to `redemrp_inventory/client/main.lua`:
        ```
        RegisterNetEvent('redemrp_inventory:SendItems', function (items, otherItems, weight, isOther)
            if isOther then
                return
            end

            for _, item in ipairs(items) do
                if item.type == 'item_weapon' then
                    local weaponHash = tonumber(item.weaponHash)

                    if UsedWeapons[weaponHash] and UsedWeapons[weaponHash].meta.uid == item.meta.uid then
                        UsedWeapons[weaponHash].meta = item.meta
                    end
                end
            end
        end)
        ```

    2. Append `shared_script '@redm_weapon_maintenance/patches/redemrp_inventory.lua'` to redemrp_inventory fxmanifest.lua before server_scripts and client_scripts.
    2. Change `Config.UseIntegration` config field to `'redemrp'`.
    3. That's all!

---

## VORP Compatibility note:
All weapon stats(degradation, damage, dirt, soot, isJammed) are stored in `loadout_props` database table.

- Requirements:
    - [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)

- Installation:
    1. Import `vorp.sql` from sql directory.
    2. Append `'@redm_weapon_maintenance/patches/vorp_inventory.lua'` to vorp_inventory fxmanifest.lua in shared_scripts.
    3. Change `Config.UseIntegration` config field to `'vorp'`.
    3. That's all!

- Update from 1.1.5 to 1.1.6:
    1. Import `vorp_update__1_1_5__to__1_1_6.sql` from sql directory.
    2. That's all!

## VORP Syn scripts compatibility note:
After enabling syn scripts compatibility, weapon id is also saved in `comps` db field as `_ID`. This enables restoring weapon props after using it within syn containers (syn containers doesn't keep track of old weapon id). Enabling this can lead to unexpected issues for any resources using weapon components and `comps` db field. So it's recomended for more experienced users.

- Enabling:
    1. Change `Config.EnableSynScriptsCompatibility` config field to `'true'`.
    2. It is recomended to use `/rwm_initweaponsid` command at first launch (**!!! ONLY IN THE SERVER CONSOLE !!!**).
    3. Reboot server.
    4. That's all!