version '0.0.1'
author 'Underground RedM'
description 'Underground Furnaces, a plugin for RedM.'
lua54 'yes'
fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
    '[Client]/client.lua',
    '[Client]/helper.lua',
    '[Client]/commands.lua',
    '[Client]/cs.lua',
    '[Client]/nc.js',
}

shared_script 'config.lua'

server_scripts {
    '[Server]/sv.lua',
}

escrow_ignore {
	'config.lua',
}