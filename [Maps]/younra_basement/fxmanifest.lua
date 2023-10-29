-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                            ║
-- ║                                   REDM                                     ║
-- ║                                                                            ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝
fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
this_is_a_map "yes"
-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                            ║
-- ║                                  SCRIPTS                                   ║
-- ║                                                                            ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝
ui_page "scripts/sound/index.html"

files {
	"scripts/sound/index.html",
	'scripts/sound/door.mp3',
    "stream/tunnel.ymap",
    "stream/tunnel2.ymap",
    "stream/tunel_last_ytyp.ytyp"
}

shared_scripts {
    'scripts/config.lua',
}

client_scripts {
    'scripts/client/*.lua',
    'scripts/Framework/client/*.lua',
}

server_scripts {
    'scripts/server/*.lua',
    'scripts/Framework/server/*.lua',
}

-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                            ║
-- ║                                   MAPPING                                  ║
-- ║                                                                            ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝

data_file 'DLC_ITYP_REQUEST' 'stream/tunel_last_ytyp.ytyp'

-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                            ║
-- ║                                    END                                     ║
-- ║                                                                            ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝
escrow_ignore {
    "stream/tunel_last.ydr",
    'scripts/notification.lua',
    'scripts/sound/**/*',
    'scripts/config.lua',
}

lua54 "yes"
dependency '/assetpacks'