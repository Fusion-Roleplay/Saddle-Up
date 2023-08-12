fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
author 'Hobbs'
lua54 'yes'


client_scripts {
  'shared/locale.lua',
  'languages/*.lua',
  'client.lua' 
}

server_scripts {
  'shared/locale.lua',
  'languages/*.lua',
  'server.lua' 
}

shared_scripts {
  'config.lua'
}

version '1.0.0'