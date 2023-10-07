fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


lua54 "yes"

author 'Dietrich | TWH-Scripts' -- https://discord.gg/8KwVa7NYKW
description 'Prison-Island and Police-Systems'

ui_page 'html/index.html'

client_scripts {
	'client/*.lua',
}

shared_scripts {
	'config/*.lua',
	'utils/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

files {
    'html/**/*'
}

escrow_ignore {
	'html/*',
	'client/dataview.lua',
	'client/client.lua',
	'client/lawmenAPI.lua',
	'config/*',
	'utils/*'
	
}

dependency '/assetpacks'