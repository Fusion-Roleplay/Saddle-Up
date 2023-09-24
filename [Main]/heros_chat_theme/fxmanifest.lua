----------------------------------
--            Heros©            --
--              --              --
--     Discord: #Heros#5092     --
----------------------------------


author "Heros"

game "rdr3"
lua54 'yes'

fx_version 'adamant'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

escrow_ignore {
	'config.lua'
}

client_script 'main.lua'

dependency 'chat'

file 'theme/style.css'

chat_theme 'ccChat' {
    styleSheet = 'theme/style.css',
    msgTemplates = {
        ccChat = '<div id="notification" class="noisy"><div id="color-box" style="background-color: {0} !important;" class="noisy"></div><div id="info"><div id="top-info"><div id="left-info"><h1 id="title"><i class="{1}"></i></h1><h2 id="sub-title">{2}</h2></div><h2 id="time">{3}</h2></div><div id="bottom-info"><br><p id="text">{4}</p></div></div>'
    }
}

exports {
    'getTimestamp'
}

dependency '/assetpacks'