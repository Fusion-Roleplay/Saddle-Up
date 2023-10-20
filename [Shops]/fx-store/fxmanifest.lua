fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'Fixitfy Store System'
author "Fixitfy Development"
version '1.5' 

shared_scripts {
    "framework/vorp.lua",
    "config.lua"
}
client_scripts {
    "c.lua"
}
server_scripts {
    "s.lua",
    "versionchecker.lua"
}

escrow_ignore {
    'config.lua',
    'versionchecker.lua',
    'framework/*.lua'
}

lua54 'yes'
ui_page 'ui/index.html'

files {
    'ui/**/*',
}

dependency '/assetpacks'