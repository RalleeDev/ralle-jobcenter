fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'RalleeDev'
Description 'A simple, low effort jobcenter for ox_core using ox_lib'
version '0.0.5'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

client_script 'client/client.lua'

shared_scripts {
    '@ox_lib/init.lua',
    '@ox_core/lib/init.lua',
    'config.lua'
}
files {
    'locales/*.json'
}