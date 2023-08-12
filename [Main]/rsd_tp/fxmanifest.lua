version '1.0.0'
author 'RS DEVELOPMENT'
description 'RSD_TP https://script.redstartrp.fr'
repository 'https://script.redstartrp.fr'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

dependency 'rsd_notify'

server_scripts {
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'