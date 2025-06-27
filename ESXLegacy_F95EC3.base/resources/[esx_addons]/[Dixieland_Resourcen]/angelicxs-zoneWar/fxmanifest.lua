fx_version 'cerulean'
game 'gta5'

author 'AngelicXS'
version '1.0'

client_script {
    'client.lua',
}

server_script {
	'server.lua',
}

lua54 'yes'
shared_script {
    'config.lua',
   '@ox_lib/init.lua',
}