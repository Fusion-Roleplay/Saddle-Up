game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

escrow_ignore {
    'config.lua',
    'injectors.lua',
    'c/warmenu.lua',
    'readme/*'
}

client_scripts {
    'config.lua',
    'c/*.lua',
    'c/notification.js'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/images/*.png',
    'c/notification.js'
}

server_scripts {
    'config.lua',
    'injectors.lua',
    's/*.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'