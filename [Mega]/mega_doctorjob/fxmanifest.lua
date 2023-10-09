fx_version "adamant"

games {"rdr3"}

lua54 "yes"

escrow_ignore {
	'client/dataview.lua',
	'client/diseases/*',
	'client/client.lua',
	'config/*',
	'ui/*',
	'utils/*',	
	'client/DoctorjobAPI.lua',
	'server/adapters/*.lua'
}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'@uiprompt/uiprompt.lua',
	'client/*.lua',
	'client/diseases/*.lua',
	'client/DoctorjobAPI.lua',
	'client/adapters/*.lua'
}

shared_scripts {
	'config/*.lua',
	'utils/*.lua'
}

server_scripts {
    'server/*.lua',
	'server/adapters/*.lua'
}

client_exports {
	'client/DoctorjobAPI.lua'
} 

files {
	'ui/img/*',
	'ui/js/*.js',
	'ui/css/*.css',
	'ui/index.html',
	'ui/fonts/*.ttf',
	'ui/fonts/*.otf'
}

ui_page 'ui/index.html'
dependency '/assetpacks'