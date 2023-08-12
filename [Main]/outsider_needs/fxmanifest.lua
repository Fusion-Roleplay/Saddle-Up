---@diagnostic disable: undefined-global
fx_version "cerulean"
game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name "needs"
description "metabolism"
author "@outsider"

lua54 'yes'
client_script { 'client/*.lua' }
shared_script 'config.lua'
server_scripts {
	'server/*.lua',
	'items.lua',
	'@oxmysql/lib/MySQL.lua'
}

escrow_ignore { 'config.lua', "APIdeveloper.md", "items.lua" }

-- ui
ui_page 'html/ui.html'
files {
	"html/ui.*",
	"html/img/*.png",
	"html/vendor/*.js",
	"html/img/rpg_meter/*.png",

}

-- version
version '3.0'
vorp_checker 'yes'
vorp_name '^5Outsider-scripts ^4version Check^3'
vorp_github 'https://github.com/outsider-scripts/outsider_needs'

dependency '/assetpacks'