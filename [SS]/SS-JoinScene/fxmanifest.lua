fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'SIREC'
description 'SS-JoinScene'
code "SSJOINSCENE"
version '2.1'
lua54 'yes'

ui_page 'UI/UI.html'

files {
    'UI/*.html', 
    'UI/*.js', 
    'UI/*.css', 
    'UI/*.mp3', 
    'UI/*.png'}

client_scripts {
	'config.lua',
	'c/c.lua',
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'