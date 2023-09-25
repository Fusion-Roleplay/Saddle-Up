Citizen.CreateThread(function()

    WarMenu.CreateMenu('emotes', "Emote Menu")
    WarMenu.SetSubTitle('emotes', 'Play An Emote')
	WarMenu.CreateSubMenu('view_actions', 'emotes', '')
    WarMenu.CreateSubMenu('view_dances', 'emotes', '')
	WarMenu.CreateSubMenu('view_greets', 'emotes', '')
	WarMenu.CreateSubMenu('view_reactions', 'emotes', '')
	WarMenu.CreateSubMenu('view_taunts', 'emotes', '')
	WarMenu.CreateSubMenu('view_Walkstyle', 'emotes', '')

    while true do

        if WarMenu.IsMenuOpened('emotes') then
			if WarMenu.MenuButton('Actions', 'view_actions') then
            end
			if WarMenu.MenuButton('Dances', 'view_dances') then
            end
			if WarMenu.MenuButton('Greets', 'view_greets') then
            end
			if WarMenu.MenuButton('Reactions', 'view_reactions') then
            end
			if WarMenu.MenuButton('Taunts', 'view_taunts') then
            end
			if WarMenu.MenuButton('Walkstyle', 'view_Walkstyle') then
            end
            WarMenu.Display()
		
		
		-- Actions
		elseif WarMenu.IsMenuOpened('view_actions') then

			if WarMenu.Button('Bite Gold Coin') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_BITING_GOLD_COIN_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Blow Kiss') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_BLOW_KISS_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Boast') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_BOAST_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Check Watch') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_CHECK_POCKET_WATCH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Coin Flip') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_COIN_FLIP_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Fist Pump') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_FIST_PUMP_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Flex') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_FLEX_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Follow') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_FOLLOW_ME_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hissy Fit') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_HISSYFIT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Howl') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_HOWL_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hypnosis') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_HYPNOSIS_POCKET_WATCH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Lets Craft') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LETS_CRAFT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Lets Fish') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LETS_FISH_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Lets Go') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LETS_GO_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Cards, Anyone?') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LETS_PLAY_CARDS_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Look To Distance') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LOOK_DISTANCE_1"),0,0,0,0,0)

			elseif WarMenu.Button('Look Yonder') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_LOOK_YONDER_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('New Threads...') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_NEWTHREADS_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Point') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_POINT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Posse Up') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_POSSE_UP_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Prayer') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_PRAYER_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Prospector Jig') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_PROSPECTOR_JIG_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Rock Paper Scissors') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_ROCK_PAPER_SCISSORS_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Scheme') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SCHEME_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Hip Fire') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SHOOTHIP_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Skyward Shooting') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SKYWARD_SHOOTING_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Smoke Cigar') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGAR_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Smoke Cigarette') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGARETTE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Smoke Pipe') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SMOKE_PIPE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Spit') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SPIT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Spooky...') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_SPOOKY_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Stop Here') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_STOP_HERE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Take Notes') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_TAKE_NOTES_1"),0,0,0,0,0)
				
			end
			WarMenu.Display()
			
		-- Dances
        elseif WarMenu.IsMenuOpened('view_dances') then
            
			if WarMenu.Button('Awkward') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_AWKWARD_A_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Carefree 1') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_CAREFREE_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Carefree 2') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_CAREFREE_B_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Confident 1') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_CONFIDENT_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Confident 2') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_CONFIDENT_B_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Drunk 1') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_DRUNK_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Drunk 2') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_DRUNK_B_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Formal') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_FORMAL_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Graceful') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_GRACEFUL_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Old') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_OLD_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Wild 1') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_WILD_A_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Wild 2') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_DANCE_WILD_B_1"),0,0,0,0,0)
			
			end
			WarMenu.Display()
		
		-- Greets
		elseif WarMenu.IsMenuOpened('view_greets') then
			
			if WarMenu.Button('Fancy Bow') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_FANCY_BOW_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Gentle Wave') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_GENTLEWAVE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Get Over Here') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_GET_OVER_HERE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Nice To See You') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_GLAD_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hat Flick') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_HAT_FLICK_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hat Tip') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_HAT_TIP_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hey You') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_HEY_YOU_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Respectful Bow') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_RESPECTFUL_BOW_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Seven') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_SEVEN_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Subtle Wave') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_SUBTLE_WAVE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Tada') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_TADA_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Thumbs Up') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_THUMBSUP_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Tough Nod') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_TOUGH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Wave') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_GREET_WAVENEAR_1"),0,0,0,0,0)
				
			end
			WarMenu.Display()
			
		-- Reactions
		elseif WarMenu.IsMenuOpened('view_reactions') then
			
			if WarMenu.Button('Applause') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_APPLAUSE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Beg For Mercy') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_BEGMERCY_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Clap Along...') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_CLAP_ALONG_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hangover') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_HANGOVER_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('How Dare You') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_HOW_DARE_YOU_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hurl') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_HURL_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Hush') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_HUSH_YOUR_MOUTH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Jovial Laugh') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_JOVIAL_LAUGH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Nod Head') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_NOD_HEAD_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Point And Laugh') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_POINTLAUGH_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Scared') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SCARED_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Shake Head') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SHAKEHEAD_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('I\'ve Been Hit') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SHOT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Shrug') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SHRUG_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Shuffle') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SHUFFLE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Slow Clap') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SLOW_CLAP_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Sniff The Air') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SNIFFING_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Sob') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SOB_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Surrender') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_SURRENDER_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Thanks') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_THANKS_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Thumbs Down') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_THUMBSDOWN_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Who, Me') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_WHO_ME_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Yeehaw') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_REACTION_YEEHAW_1"),0,0,0,0,0)

			end
			WarMenu.Display()
			
		-- Taunts
		elseif WarMenu.IsMenuOpened('view_taunts') then
			
			if WarMenu.Button('Boo Hoo') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_BOOHOO_1"),0,0,0,0,0)
			
			elseif WarMenu.Button('Chicken') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_CHICKEN_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Cougar Snarl') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_COUGAR_SNARL_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Flip Off') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_FLIP_OFF_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Frighten') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_FRIGHTEN_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Pound Chest') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_GORILLA_CHEST_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('I\'M Watching You') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_IM_WATCHING_YOU_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Provoke') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_PROVOKE_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Ripper...') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_RIPPER_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Throat Slit') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_THROAT_SLIT_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('Up Yours') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_UP_YOURS_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('You Vs. Me') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_VERSUS_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('War Cry') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_WAR_CRY_1"),0,0,0,0,0)
				
			elseif WarMenu.Button('You Stink') then
				Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_TAUNT_YOUSTINK_1"),0,0,0,0,0)
				
			end
			WarMenu.Display()
			
		
		-- Taunts
		elseif WarMenu.IsMenuOpened('view_Walkstyle') then
			
			if WarMenu.Button ('walkcasul') then 
	        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
	        Wait(500)
		    animation = "MP_Style_Casual"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
	        TriggerServerEvent("syn_walkanim:setwalk",animation)
      
	        elseif WarMenu.Button ('walkcrazy') then
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_Crazy"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button ('walkdrunk') then
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "mp_style_drunk"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button ('walkeasy') then
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_EasyRider"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button ('walkflamboyant') then
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_Flamboyant"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button ('walkremove') then
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "noanim"
            TriggerServerEvent("syn_walkanim:setwalk",animation)
      
	        elseif WarMenu.Button ('walkflamboyant') then
	        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_Flamboyant"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button ('walkgreenhorn') then
	        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_Greenhorn"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	        elseif WarMenu.Button 'walkgunslinger' then
	        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "MP_Style_Gunslinger"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
	   
	        elseif WarMenu.Button 'walkinquisitive' then
	        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
            Wait(500)
            animation = "mp_style_inquisitive"
            Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
            TriggerServerEvent("syn_walkanim:setwalk",animation)
	  
	  
	        end
	        WarMenu.Display()
			
		
		elseif IsDisabledControlJustPressed(0, 0xA8E3F467) then
			WarMenu.OpenMenu('emotes')
		   
		end
		 RegisterCommand("em", function(source, args)
	     WarMenu.OpenMenu('emotes')
		end)
		
			Citizen.Wait(0)
		end
	end)