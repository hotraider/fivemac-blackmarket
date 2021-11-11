fx_version "adamant"

game "gta5"

client_script { 
"main/client.lua",
"main/shared.lua"
}

server_script {
"main/server.lua",
"main/shared.lua"
} 



ui_page "html/index.html"
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}
