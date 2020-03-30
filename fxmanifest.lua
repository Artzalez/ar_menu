fx_version "adamant"

games { 'rdr3', 'gta5' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
-- UI
ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/fonts/chinese-rocks-rg.ttf",
	"ui/assets/cursor.png",
	"ui/assets/close.png",
	"ui/front.js",
	"ui/script.js",
	"ui/style.css",
	'ui/debounce.min.js'
}

-- Client Scripts
client_scripts {
		"client.lua",
}
