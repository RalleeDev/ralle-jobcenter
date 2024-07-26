fx_version 'cerulean'
game 'gta5'
lua54 'yes'

server_script 'server.lua'

client_script 'client.lua'

shared_scripts {
    '@ox_lib/init.lua',
    '@ox_core/lib/init.lua',
    'config.lua'
}
files {
    'locales/*.json'
}