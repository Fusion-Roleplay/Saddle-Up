fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author '🆂🅸🆁🅴🅲#0336'
description 'SS-TrashBin'
code "SSTRASHBIN"
version '1.1'
lua54 'yes'

server_scripts {
	'config.lua',
	's/s.lua',
}

client_scripts {
	'config.lua',
	'c/c.lua',
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'