fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author '🆂🅸🆁🅴🅲#0336'
description 'SS-Licenses'
code "SSLICENSES"
version '1.4'
lua54 'yes'

client_scripts {
	'config.lua',
	'c/c.lua',
}

server_scripts {
	'config.lua',
	's/s.lua',
}

ui_page 'UI/UI.html'

files {
	'UI/UI.html',
	'UI/css/*.css',
	'UI/js/*.js',
	'UI/images/*.png',
	'UI/css/*.woff', 
}

dependencies {
    'SS-Inputs',
	'SS-IdentityCard'
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'