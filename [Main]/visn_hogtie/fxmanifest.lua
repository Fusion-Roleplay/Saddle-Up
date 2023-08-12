fx_version "cerulean"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Tim Plate <admin@plate-solutions.de>'
description 'veryinsanee\'s Hogtie'
version '1.0.0'
lua54 'yes'

client_scripts {
    'config.lua',
    'client.lua'
}

escrow_ignore {
    'config.lua',
    'README.txt'
}

dependency '/assetpacks'