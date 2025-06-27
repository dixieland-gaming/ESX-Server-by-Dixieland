fx_version 'cerulean'
game 'gta5'

author 'AngelicXS'
description 'Gang Territories'
version '1.1'

client_script {
    'client.lua'
}

server_script {
	'server.lua',
    '@mysql-async/lib/MySQL.lua'
}
lua54 'yes'
shared_script {
    'config.lua',
   '@es_extended/imports.lua',    --- Uncomment if using ESX
   '@ox_lib/init.lua',
}
