fx_version 'adamant'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

author 'Razed'
description 'RedM Visuals'
version '1.0.0'

files {
    'visualsettings.dat',

    'data/timecycle/timecycle_mods_1.xml',
    'data/timecycle/timecycle_mods_2.xml',
    'data/timecycle/timecycle_mods_3.xml',
    'data/timecycle/timecycle_mods_4.xml',
	'data/timecycle/w_blizzard.xml',
    'data/timecycle/w_clouds.xml',
    'data/timecycle/w_drizzle.xml',
    'data/timecycle/w_fog.xml',
    'data/timecycle/w_groundblizzard.xml',
    'data/timecycle/w_hail.xml',
    'data/timecycle/w_highpressure.xml',
    'data/timecycle/w_hurricane.xml',
    'data/timecycle/w_misty.xml',
    'data/timecycle/w_overcast.xml',
    'data/timecycle/w_overcastdark.xml',
    'data/timecycle/w_rain.xml',
    'data/timecycle/w_sandstorm.xml',
    'data/timecycle/w_shower.xml',
    'data/timecycle/w_sleet.xml',
    'data/timecycle/w_snow.xml',
    'data/timecycle/w_snowclearing.xml',
    'data/timecycle/w_snowlight.xml',
	'data/timecycle/w_sunny.xml',
	'data/timecycle/w_thunder.xml',
	'data/timecycle/w_thunderstorm.xml',
	'data/timecycle/w_whiteout.xml',
    'stream/lutpostfx.ytd',
    'stream/lutpostfx_hdr.ytd',
    'stream/weapon_atlas.ytd',
    'stream/hud_textures.ytd',
    'stream/pbrWeaponSurfaces.ymt',
    'stream/strings.gxt2',
    'stream/multiwheel_weapons.ytd',
    'stream/pbrWeaponSurfaces.ymt',
    'stream/map_data.ymt',


    'map.meta',
    'weather.xml',
    'weatherclimates.xml',

	'time.xml',
	
    'data/levels/popzone.ymt',	
	
    'replacements.lua',
    'client.lua',
}

this_is_a_map 'yes'
replace_level_meta 'map' -- uses map.meta

client_scripts {
    'replacements.lua',
    'client.lua',
}

data_file 'TIMECYCLEMOD_FILE' 'data/timecycle/timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'data/timecycle/timecycle_mods_2.xml'
data_file 'TIMECYCLEMOD_FILE' 'data/timecycle/timecycle_mods_3.xml'
data_file 'TIMECYCLEMOD_FILE' 'data/timecycle/timecycle_mods_4.xml'

-- used for splitting large ytds
--data_file 'GTXD_PARENTING_FILE' 'gtxd.meta'

-- keeping if RedM ever does anything to them,
-- now handled in map.meta/weather.xml
--[[
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_blizzard.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_clouds.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_drizzle.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_fog.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_groundblizzard.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_hail.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_highpressure.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_hurricane.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_misty.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_overcast.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_overcastdark.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_rain.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_sandstorm.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_shower.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_sleet.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_snow.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_snowclearing.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_snowlight.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_sunny.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_thunder.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_thunderstorm.xml'
data_file 'TIMECYCLE_FILE' 'data/timecycle/w_whiteout.xml'
]]

dependency '/assetpacks'