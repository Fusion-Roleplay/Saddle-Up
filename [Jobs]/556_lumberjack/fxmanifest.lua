game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

dependency 'objectloader'

escrow_ignore {
    'config.lua',
    'readme/*'
}

client_scripts {
    'config.lua',
    'client/*.lua',
    'client/notification.js',

}
ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/images/*.png',
    'montosrest.xml',
    'client/notification.js'
}

objectloader_maps {
	'montosrest.xml',
}

server_scripts {
    'config.lua',
    'server/*.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'