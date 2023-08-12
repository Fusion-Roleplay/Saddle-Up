fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
lua54 'yes'


client_script {'functions.lua','client/dataview.lua','client/WeaponComponents.lua', 'client/client.lua'}
server_script {'server/server.lua'}
shared_scripts {'config/shops.lua','config/weapons.lua','config/language.lua','config/ammo.lua','config/config.lua'}

escrow_ignore {
	'config/*.lua',
	'client/*.lua',
}
dependency '/assetpacks'