fx_version "cerulean"
games { "gta5" }

author "Kugelspitzer"
name 'Vision - Fishing'
discription 'a Simple Fishing Script'
version '1.0.0'

shared_script {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/cl_main.lua',
    'config.lua'
}

server_scripts {
    'server/sv_main.lua',
    'server/sv_updater.lua',
    'config.lua'
}

dependencies {
    'es_extended'
}