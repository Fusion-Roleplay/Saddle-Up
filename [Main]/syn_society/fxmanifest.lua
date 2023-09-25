fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
lua54 'yes'


ui_page 'client/html/ui.html'

client_script {
	'config.lua',
	'client/main.lua',
	'client/warmenu.lua'

}

server_scripts {
	'config.lua',
	'server/main.lua'
}

files {
	'client/html/ui.html',
	'client/html/styles.css',
	'client/html/scripts.js',
	'configNui.js',
	'client/html/debounce.min.js',
	'client/html/sweetalert2.all.min.js',
	-- Icons
	'client/html/logo.png',
	'client/html/icons/**/*'
}

escrow_ignore {
	'config.lua',
	'client/*.lua',
	'configNui.js',
	'fxmanifest - redem.lua',

}
dependency '/assetpacks'