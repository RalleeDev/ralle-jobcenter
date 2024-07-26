fx_version 'cerulean'
game 'gta5'
lua54 'yes'

server_script 'server/server.lua'

client_script 'client/client.lua'

shared_scripts {
    '@ox_lib/init.lua',
    '@ox_core/lib/init.lua',
    'config.lua'
}
files {
    'locales/*.json'
}