
AxRadialMenu = {
    KeepInput = false,
    Menus = {
        [1] = {
            shoudclose = false,
            label = "Citizen",
            icon = "fas fa-user",
            submenu = {
                {
                    shoudclose = false,
                    label = "Give ID",
                    submenu = false,
                    icon = "fas fa-id-card-alt",
                    type = "client",
					event = "Ax-Radial:Citizen",
                    parameter = "idcard"
                },
                {
                    shoudclose = true,
                    label = "Scenes",
                    submenu = false,
                    type = "client",
					event = "Ax-Radial:Citizen",
                    parameter = "scene",
                    icon = "fas fa-film"
                },
                {
                    shoudclose = false,
                    label = "Forecast",
                    submenu = false,
                    type = "client",
                    parameter = "forecast",
					event = "Ax-Radial:Citizen",
                    icon = "fas fa-cloud-sun-rain"
                },
                {
                    shoudclose = true,
                    label = "Dice",
                    submenu = false,
                    type = "client",                  
                    icon = "fas fa-dice-six",
					event = "Ax-Radial:Citizen",
					parameter = "dice 3"
					
                },
                {
                    shoudclose = false,
                    label = "Flip Coin",
                    submenu = false,
                    type = "client",
                    parameter = "flipcoin",
					event = "Ax-Radial:Citizen",
                    icon = "fas fa-coins"
                },
                {
                    shoudclose = false,
                    label = "RPS",
                    submenu = false,
                    type = "client",
                    parameter = "rps",
					event = "Ax-Radial:Citizen",
                    icon = "fas fa-hand-rock"
                }
            }
        },
        [2] = {
            shoudclose = false,
            label = "UI",
            icon = "fas fa-sitemap",
            submenu = {
                {
                    shoudclose = false,
                    label = "HUD",
                    submenu = false,
                    type = "client",
					parameter = "hud",
                    event = "Ax-Radial:UI",
                    icon = "fas fa-eye-slash"
                },
                {
                    shoudclose = false,
                    label = "Reload",
                    submenu = false,
                    type = "client",
					parameter = "rc",
                    event = "Ax-Radial:UI",
                    icon = "fas fa-hat-cowboy-side"
                },
				{
                    shoudclose = false,
                    label = "Hide Chat",
                    submenu = false,
                    type = "client",
                    event = "Ax-Radial:UI",
                    icon = "fas fa-comment-slash",
                    parameter = "togglechat"
                },
                {
                    shoudclose = false,
                    label = "Race Menu",
                    submenu = false,
                    type = "client",
                    event = "Ax-Radial:UI",
                    icon = "fas fa-horse-head",
                    parameter = "race",
                },
			    {
                    shoudclose = false,
                    label = "Pet Menu",
                    submenu = false,
                    type = "client",
                    event = "Ax-Radial:UI",
                    icon = "fas fa-paw",
                    parameter = "open_pet_menu",
                },
                {
                    shoudclose = false,
                    label = "Next",
                    icon = "fas fa-chevron-circle-right",
                    submenu = {
                        
						{
                            shoudclose = true,
                            label = "Delete Horse",
                            submenu = false,
                            type = "client",
					        parameter = "dh",
                            event = "Ax-Radial:UI",
                            icon = "fas fa-backspace"
                        },
						{
                            shoudclose = true,
                            label = "Delete Wagon",
                            submenu = false,
                            type = "client",
					        parameter = "dv",
                            event = "Ax-Radial:UI",
                            icon = "fas fa-backspace"
                        },
                        {
                            shoudclose = true,
                            label = "Delete Campfire",
                            submenu = false,
                            type = "client",
					        parameter = "dcampfire",
                            event = "Ax-Radial:UI",
                            icon = "fas fa-backspace"
                        },
				        {
                            shoudclose = true,
                            label = "Delete Tent",
                            submenu = false,
                            type = "client",
					        parameter = "dtent",
                            event = "Ax-Radial:UI",
                            icon = "fas fa-backspace"
                        }
                    }
                }
            }
        },
        [3] = {
            shoudclose = true,
            label = "Misc",
            submenu = true,
			type = "client",
            icon = "fas fa-puzzle-piece",
			event = "Ax-Radial:Clothing",
			parameter = "poker 1"
        },
        [4] = {
            shoudclose = false,
            label = "",
            icon = "",
            submenu = {
                {
                    shoudclose = false,
                    label = "Awkward",
                    submenu = false,
                    event = "Ax-Radial:Dance",
                    type = "client",
                    parameter = "Awkward",
                    icon = "fas fa-running"
                },
                {
                    shoudclose = false,
                    label = "Carefree 1",
                    submenu = false,
                    event = "Ax-Radial:Dance",
                    type = "client",
                    parameter = "Carefree 1",
                    icon = "fas fa-running"
                },
                {
                    shoudclose = false,
                    label = "Carefree 2",
                    submenu = false,
                    event = "Ax-Radial:Dance",
                    type = "client",
                    parameter = "Carefree 2",
                    icon = "fas fa-running"
                },
                {
                    shoudclose = false,
                    label = "Confident 1",
                    submenu = false,
                    event = "Ax-Radial:Dance",
                    type = "client",
                    parameter = "Confident 1",
                    icon = "fas fa-running"
                },
                {
                    shoudclose = false,
                    label = "Confident 2",
                    submenu = false,
                    event = "Ax-Radial:Dance",
                    type = "client",
                    parameter = "Confident 2",
                    icon = "fas fa-running"
                },            
				{
                    shoudclose = false,
                    label = "Next",
                    icon = "fas fa-chevron-circle-right",
                    submenu = {
                        
                        {
                            shoudclose = false,
                            label = "Drunk 1",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Drunk 1",
                        },
                        {
                            shoudclose = false,
                            label = "Drunk 2",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Drunk 2",
                        },
						{
                            shoudclose = false,
                            label = "Formal",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Formal",
                        },
						{
                            shoudclose = false,
                            label = "Graceful",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Graceful",
                        },
						{
                            shoudclose = false,
                            label = "Old",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Old",
                        },
						{
                            shoudclose = false,
                            label = "Wild",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Dance",
                            icon = "fas fa-running",
                            parameter = "Wild 1",
                        }
                    }
                }
            }
        },
            
        
        [5] = {
            shoudclose = false,
            icon = "fas fa-walking",
            label = "Walk Styles",
            submenu = {
                {
                    shoudclose = true,
                    label = "Normal",
                    submenu = false,
                    icon = "fas fa-walking",
                    event = "Ax-Radial:Walkstyle",
                    parameter = "walkremove",
                    type = "client"
                },
                {
                    shoudclose = true,
                    label = "walkcasul",
                    submenu = false,
                    icon = "fas fa-walking",
                    event = "Ax-Radial:Walkstyle",
                    parameter = "walkcasul",
                    type = "client"
                },
                {
                    shoudclose = true,
                    label = "crazy",
                    submenu = false,
                    icon = "fas fa-walking",
                    event = "Ax-Radial:Walkstyle",
                    parameter = "walkcrazy",
                    type = "client"
                },
                {
                    shoudclose = true,
                    label = "drunk",
                    submenu = false,
                    icon = "fas fa-walking",
                    event = "Ax-Radial:Walkstyle",
                    parameter = "walkdrunk",
                    type = "client"
                },
                {
                    shoudclose = true,
                    label = "easy",
                    submenu = false,
                    icon = "fas fa-walking",
                    event = "Ax-Radial:Walkstyle",
                    parameter = "walkeasy",
                    type = "client"
                },
                {
                    shoudclose = false,
                    label = "Next",
                    icon = "fas fa-chevron-circle-right",
                    submenu = {
                        
                        {
                            shoudclose = true,
                            label = "flamboyant",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkflamboyant",
                        },
                        {
                            shoudclose = true,
                            label = "greenhorn",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkgreenhorn",
                        },
						{
                            shoudclose = true,
                            label = "gunslinger",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkgunslinger",
                        },
						{
                            shoudclose = true,
                            label = "inquisitive",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkinquisitive",
                        },
						{
                            shoudclose = true,
                            label = "gunslinger 2",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkgunslinger",
                        },
						{
                            shoudclose = true,
                            label = "crazy 2",
                            submenu = false,
                            type = "client",
                            event = "Ax-Radial:Walkstyle",
                            icon = "fas fa-walking",
                            parameter = "walkcrazy",
                        }
                    }
                }
            }
        },


        [6] = {
            shoudclose = false,
            label = "Actions",
            icon = "fas fa-theater-masks",
            submenu = {
                {
                    shoudclose = true,
                    label = "Emotes 1",
                    submenu = false,
                    type = "client",
					event = "Ax-Radial:Actions",
                    parameter = "em",
                    icon = "fas fa-theater-masks"
                },
                {
                    shoudclose = true,
                    label = "Emotes 2",
                    submenu = false,
                    event = "Ax-Radial:Actions",
                    parameter = "am",
                    type = "client",
                    icon = "fas fa-theater-masks"
                },
                {
                    shoudclose = true,
                    label = "Clothing",
                    submenu = false,
                    event = "Ax-Radial:Actions",
                    parameter = "cl",
                    type = "client",
                    icon = "fas fa-tshirt"
                },
                {
                    shoudclose = true,
                    label = "Alert Police",
                    submenu = false,
                    event = "Ax-Radial:Actions",
                    parameter = "alertpolice",
                    type = "client",
                    icon = "fas fa-exclamation-circle"
                },
                {
                    shoudclose = true,
                    label = "Alert Doctor",
                    submenu = false,
                    event = "Ax-Radial:Actions",
                    parameter = "alertdoctor",
                    type = "client",
                    icon = "fas fa-exclamation-circle"
                },
				
                {
                    shoudclose = true,
                    label = "Instrument",
                    submenu = false,
                    type = "client",
                    event = "Ax-Radial:Actions",
				    parameter = "instrument guitar",
                    icon = "fas fa-guitar"
                }
                    
            }
        }
    },
    WorkMenu = {
        ["Clothing"] = {
            {
                shoudclose = true,
                label = "poker",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "poker 1",
                icon = "fas fa-hat-cowboy"
            },
            {
                shoudclose = true,
                label = "Bird",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "Bird",
                icon = "fas fa-dove"
            },
            {
                shoudclose = false,
                label = "Bandana",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "bandana",
                icon = "fas fa-mask"
            },
            {
                shoudclose = false,
                label = "Mask",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "mask",
                icon = "fas fa-mask"
            },
            {
                shoudclose = true,
                label = "Tip",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "tip",
                icon = "far fa-comment"
            },
			{
                shoudclose = true,
                label = "/me help",
                submenu = false,
                type = "client",
                event = "Ax-Radial:Clothing",
				parameter = "me I'm over here!",
                icon = "fas fa-comment-dots"
            }
        }
    }
}