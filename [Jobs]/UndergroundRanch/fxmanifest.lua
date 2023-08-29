version '0.0.1'
author 'Underground RedM'
description 'Underground Ranch, a plugin for RedM.'
lua54 'yes'
fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
    '[Client]/animals.lua',
    '[Client]/animations.lua',
    '[Client]/client.lua',
    '[Client]/commands.lua',
    '[Client]/notifications.lua',
    '[Client]/ranch.lua',
    '[Client]/spawner.lua',
    '[Client]/store.lua',
    '[Client]/tasks.lua',
}

shared_script 'config.lua'

server_scripts {
    '[Server]/server.lua',
    '[Server]/db.lua',
    '[Server]/svopen.lua',
    '@mysql-async/lib/MySQL.lua',
}

escrow_ignore {
	'config.lua',
    '[Client]/notifications.lua',
    '[Server]/svopen.lua',
}