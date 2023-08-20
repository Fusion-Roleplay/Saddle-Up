fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author '🆂🅸🆁🅴🅲#0336'
description 'SS-Checker'
code 'SSCHECKER'
version '1.2'
lua54 'yes'

client_scripts {
	'c/c.lua',
	'c/SLOTS.lua'
}

server_scripts {
	's/s.lua',
	's/SLOTS.lua'
}

escrow_ignore {
    'c/SLOTS.lua',
    's/SLOTS.lua'
}
dependency '/assetpacks'