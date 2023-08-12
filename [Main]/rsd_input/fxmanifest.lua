version '1.0.0'
author 'RS DEVELOPMENT'
description 'RSD_INPUT https://script.redstartrp.fr'
repository 'https://script.redstartrp.fr'

fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

lua54 'yes'

ui_page('html/ui.html') 

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
	'html/*.html', 
    'html/*.css',
    'html/*.js',
    'html/font/*.ttf',
}

dependency '/assetpacks'