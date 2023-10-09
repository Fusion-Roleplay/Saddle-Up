fx_version "adamant"

games {"rdr3"}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'client/client.lua',
	'client/dataview.lua',
}

server_scripts {
    'server/server.lua',
}

ui_page {
	'html/index.html'
}

files {
	'html/*',
	'html/css/*',
	'html/img/*',
	'html/js/*'
}