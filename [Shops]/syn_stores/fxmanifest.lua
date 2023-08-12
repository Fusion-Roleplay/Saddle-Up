fx_version 'adamant'
game 'rdr3'
author 'Synthetic Blue'
version '1.0.0'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
shared_scripts {
	'config/config.lua',
	'config/normalstores.lua',
	'config/language.lua',
	'functions.lua',

}

client_scripts {
	'config/npc_creator.lua',
	'client.lua'
}

server_scripts {
	'updater/updater.lua',
	'server.lua'
}
escrow_ignore {
	'functions.lua',
	'updater/updater.lua',
	'config/npc_creator.lua',
	'config/config.lua',
	'config/normalstores.lua',
	'config/language.lua',
	'client.lua',
}
dependency {
	"vorp_core",
	"vorp_inventory",
	"syn_inputs",
}
dependency '/assetpacks'