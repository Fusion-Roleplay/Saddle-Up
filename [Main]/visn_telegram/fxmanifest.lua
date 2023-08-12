--[[
-- Author: Tim Plate
-- Project: visn_telegram
-- Copyright (c) 2023 Tim Plate Solutions
--]]

fx_version "cerulean"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Tim Plate <admin@plate-solutions.de>'
description 'veryinsanee\'s Telegram'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'script/translation.lua',
    'script/input.lua',
    'script/client.lua'
}

server_scripts {
    'script/translation.lua',
    'script/server.lua'
}

files {
    'nui/*.html',
    'nui/*.js',
    'nui/*.css',
    'nui/assets/img/*.png',
    'nui/assets/fonts/*.ttf',
    'nui/assets/fonts/*.woff',
    'nui/assets/fonts/*.woff2',
    'languages/*.json'
}

escrow_ignore {
    'config.lua',
    'installation/**',
    'languages/**',
    'README.txt'
}

ui_page 'nui/index.html'
server_export 'CreateTelegram'
dependency '/assetpacks'