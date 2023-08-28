game 'rdr3'
lua54 'yes'
version '1.2.5'
author 'Areski'
fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script {
	'config.lua',
    'client.lua'
}

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'