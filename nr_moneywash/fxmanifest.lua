fx_version "adamant"
game 'gta5'
lua54 'on'
description 'SERDADU#7004'

server_scripts {
	'configmoneywash.lua',
	'server/moneywash.lua',
}

client_scripts {
	'@nr_base/polyzone/client.lua',
    '@nr_base/polyzone/BoxZone.lua',
    '@nr_base/polyzone/EntityZone.lua',
    '@nr_base/polyzone/CircleZone.lua',
    '@nr_base/polyzone/ComboZone.lua',
	'configmoneywash.lua',
	'client/moneywash.lua',
    'locales/*.lua',
}

shared_scripts {
    '@es_extended/imports.lua',
	'@es_extended/locale.lua',
    '@ox_lib/init.lua',
}

dependencies {
	'es_extended'
}

