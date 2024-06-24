fx_version 'cerulean'
game 'gta5'

description 'ESX Doorbell System for Jobs'
author 'YourName'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/doorbell-sound.ogg'
}