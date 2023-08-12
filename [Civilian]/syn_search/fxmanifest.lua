fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

game "rdr3"

shared_scripts {
	'config.lua',
	'functions.lua'
}

client_script {
    'client/client.lua',
}
server_script {
    'server/server.lua',
}

escrow_ignore {
	'client/client.lua',
	'config.lua',
	'functions.lua'
}

dependency '/assetpacks'