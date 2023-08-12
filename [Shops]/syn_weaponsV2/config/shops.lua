Config5 = {}

Config5.weaponshops = { -- money for houses bought goes here. sellers have it to collected from here. 
    Valentine = {	   -- you can add more wep markets by copy pasting this 
        Pos = {x=-279.52, y=783.21, z=119.52}, -- location of wep market 
        blipsprite = 202506373, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Weapons Shop', -- blip name 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },
    Strawberry = {	   -- you can add more wep markets by copy pasting this 
    Pos = {x=-1770.07, y=-383.18, z=157.71}, -- location of wep market 
    blipsprite = 202506373, -- blip sprite for wep market
    showblip = false, -- show blip or not 
    Name = 'Weapons Shop', -- blip name 
    weapons = {
        ["Melee"] = {
           --[[  ["Horror Knife"] = {	
                hashname = "WEAPON_MELEE_KNIFE_HORROR",
                price = 5,    
            
            },
            ["Rustic Knife"] = {	
                hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                price = 5,    
            
            },
            ["Tradders Knife"] = {	
                hashname = "WEAPON_MELEE_KNIFE_TRADER",
                price = 5,    
            
            }, ]]
            ["Knife"] = {	
                hashname = "WEAPON_MELEE_KNIFE",  
                price = 2,      
            
            },
           --[[  ["JawBone Knife"] = {	
                hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                price = 2,   
            
            },
            ["Cleaver"] = {	
                hashname = "WEAPON_MELEE_CLEAVER",    
                price = 2, 
            
            },
            ["Hunter Hatchet"] = {	
                hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                price = 8,   
            },
            ["Machete"] = {	
                hashname = "WEAPON_MELEE_MACHETE",   
                price = 5.5,  
            },
            ["Collector Machete"] = {	
                hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                price = 5.5,  
            }, ]]
        },
        ["Bows"] = {
            ["Bow"] = {	
                hashname = "WEAPON_BOW",    
                price = 7, 
            
            },
           --[[  ["Improved Bow"] = {	
                hashname = "WEAPON_BOW_IMPROVED",   
                price = 15,  
            
            }, ]]
        },
        ["Rifles"] = {
           --[[  ["Elephant Rifle"] = {	
                hashname = "WEAPON_RIFLE_ELEPHANT",  
                price = 400,   
            
            }, ]]
            ["Varmint Rifle"] = {	
                hashname = "WEAPON_RIFLE_VARMINT",   
                price = 15,  
            
            },
            --[[ ["Rollingblock Rifle"] = {	
                hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                price = 1000, 
            
            }, ]]
            --[[ ["Carcano Rifle"] = {	
                hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                price = 1000,   
            
            }, ]]
           --[[  ["Springfield Rifle"] = {	
                hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                price = 1000,    
            
            },
            ["Boltaction Rifle"] = {	
                hashname = "WEAPON_RIFLE_BOLTACTION",    
                price = 250, 
            
            }, ]]
        },
        ["Repeaters"] = {
           --[[  ["Winchester Repeater"] = {	
                hashname = "WEAPON_REPEATER_WINCHESTER",   
                price = 70,  
            
            },
            ["Henry Repeater"] = {	
                hashname = "WEAPON_REPEATER_HENRY",    
                price = 75.5, 
            
            },
            ["Evans Repeater"] = {	
                hashname = "WEAPON_REPEATER_EVANS",    
                price = 80, 
            
            }, ]]
            ["Carbine Repeater"] = {	
                hashname = "WEAPON_REPEATER_CARBINE",    
                price = 20, 
            
            },
        },
        ["Pistols"] = {
           --[[  ["Volcanic Pistol "] = {	
                hashname = "WEAPON_PISTOL_VOLCANIC",    
                price = 1000, 
            
            },
            ["M1899 Pistol "] = {	
                hashname = "WEAPON_PISTOL_M1899",    
                price = 10000, 
            
            }, ]]
           --[[  ["SemiAuto Pistol "] = {	
                hashname = "WEAPON_PISTOL_SEMIAUTO",    
                price = 1000, 
            
            }, ]]
         --[[    ["Mauser Pistol "] = {	
                hashname = "WEAPON_PISTOL_MAUSER",    
                price = 1000, 
            
            },
             ]]

        },
        ["Revolvers"] = {
           --[[  ["Navy Revolver Crossover"] = {	
                hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                price = 50, 
            
            },
            ["Schofield Revolver"] = {	
                hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                price = 50, 
            
            },
            ["Lemat Revolver"] = {	
                hashname = "WEAPON_REVOLVER_LEMAT",    
                price = 40, 
            
            },
            ["Double Action Revolver"] = {	
                hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                price = 55, 
            
            }, ]]
            ["Cattleman Revolver"] = {	
                hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                price = 10, 
            
            },
            --[[ ["Navy Revolver"] = {	
                hashname = "WEAPON_REVOLVER_NAVY",    
                price = 60, 
            
            }, ]]
        },
        ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
        -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
        -- only then will the throwable show up in their weapon wheel 
           --[[  ["Bolas Hawkmoth"] = {	
                hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                price = 100, 
            
            },
            ["Bolas Iron-Spiked"] = {	
                hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                price = 100, 
            
            },
            ["Bolas Intertwined"] = {	
                hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                price = 100, 
            
            },
            ["Tomahawk"] = {	
                hashname = "WEAPON_THROWN_TOMAHAWK",    
                price = 10, 
            
            }, ]]
            ["Knives"] = {	
                hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                price = 4, 
            
            },
            --[[ ["Poison Bottle"] = {	
                hashname = "WEAPON_THROWN_POISONBOTTLE",    
                price = 15, 
            
            },
            ["Bolas"] = {	
                hashname = "WEAPON_THROWN_BOLAS",    
                price = 4, 
            
            }, ]]
           --[[  ["Dynamite"] = {	
                hashname = "WEAPON_THROWN_DYNAMITE",    
                price = 100, 
            
            },
            ["Molotov"] = {	
                hashname = "WEAPON_THROWN_MOLOTOV",    
                price = 100, 
            
            }, ]]

        },
        ["Shotguns"] = {
            --[[ ["Semiauto Shotgun"] = {	
                hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                price = 100, 
            
            },
            ["Sawedoff Shotgun"] = {	
                hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                price = 250, 
            
            },
            ["Repeating Shotgun"] = {	
                hashname = "WEAPON_SHOTGUN_REPEATING",    
                price = 1000, 
            
            },
            ["Pump Shotgun"] = {	
                hashname = "WEAPON_SHOTGUN_PUMP",    
                price = 1000, 
            
            }, ]]
            ["Doublebarrel Shotgun"] = {	
                hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                price = 125, 
            
            },
        },
        ["Misc."] = {
            --[[ ["Metal Dectector"] = {	
                hashname = "WEAPON_KIT_METAL_DETECTOR",    
                price = 2, 
            
            },["Halloween Lantern"] = {	
                hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                price = 2, 
            
            }, ]]
            ["Lasso"] = {	
                hashname = "WEAPON_LASSO",    
                price = 20, 
            
            },
            --[[ ["Reinforced Lasso"] = {	
                hashname = "WEAPON_LASSO_REINFORCED",    
                price = 10, 
            
            },
            ["Improved Binoculars"] = {	
                hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                price = 10, 
            
            },]]
            ["Binoculars"] = {	
                hashname = "WEAPON_KIT_BINOCULARS",    
                price = 2.5, 
            
            }, 
            ["Fishing Rod"] = {	
                hashname = "WEAPON_FISHINGROD",    
                price = 1, 
            
            },
            ["Lantern"] = {	
                hashname = "WEAPON_MELEE_LANTERN",    
                price = 1, 
            
            },
            --[[ ["Camera"] = {	
                hashname = "WEAPON_KIT_CAMERA",    
                price = 40, 
            
            },
            ["Advanced Camera"] = {	
                hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                price = 200, 
            
            },
            
            ["Davy Lantern"] = {	
                hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                price = 15, 
            
            }, ]]
        },
    }, 
    ammo = {
        ["Repeater"] = {
            ["Repeater Ammo Normal"] = {
                price = 1, 
                item = "ammorepeaternormal",
            },
            --[[ ["Repeater Ammo Express"] = {
                price = 2, 
                item = "ammorepeaterexpress",
                
            },
            ["Repeater Ammo Explosive"] = {
                
                price = 5, 
                item = "ammorepeaterexplosive",
                
            },
            ["Repeater Ammo Velocity"] = {
                
                price = 5, 
                item = "ammorepeatervelocity",
                
            },
            ["Repeater Ammo Splitpoint"] = {
                
                price = 8, 
                item = "ammorepeatersplitpoint",
               
            }, ]]
        },

        ["Revolver"] = {
            ["Revolver Ammo Normal"] = {
               
                price = 1, 
                item = "ammorevolvernormal",
                
            },
           --[[  ["Revolver Ammo Express"] = {
                
                price = 2, 
                item = "ammorevolverexpress",
                
            },
            ["Revolver Ammo Explosive"] = {
               
                price = 5, 
                item = "ammorevolverexplosive",
                
            },
            ["Revolver Ammo Velocity"] = {
                
                price = 5, 
                item = "ammorevolvervelocity",
                
            },
            ["Revolver Ammo Splitpoint"] = {
               
                price = 8, 
                item = "ammorevolversplitpoint",
               
            }, ]]

        },
        ["Rifle"] = {
            ["Rifle Ammo Normal"] = {
                
                price = 1, 
                item = "ammoriflenormal",
                
            },
            --[[ ["Elephant Rifle Ammo"] = {
                
                price = 10, 
                item = "ammoelephant",
                
            },
            ["Rifle Ammo Express"] = {
               
                price = 5, 
                item = "ammorifleexpress",
                
            },
            ["Rifle Ammo Explosive"] = {
                
                price = 5, 
                item = "ammorifleexplosive",
                
            },
            ["Rifle Ammo Velocity"] = {
               
                price = 5, 
                item = "ammoriflevelocity",
               
            },
            ["Rifle Ammo Splitpoint"] = {
                
                price = 8, 
                item = "ammoriflesplitpoint",
               
            }, ]]

        },
        ["Shotgun"] = {
           --[[  ["Shotgun Ammo Incendiary"] = {
               
                price = 5, 
                item = "ammoshotgunincendiary",
               
            }, ]]
            --[[ ["Shotgun Ammo Explosive"] = {
               
                price = 5, 
                item = "ammoshotgunexplosive",
                
            }, ]]
            ["Shotgun Ammo Normal"] = {
               
                price = 1, 
                item = "ammoshotgunnormal",
                
            },
           --[[  ["Shotgun Ammo Slug"] = {
               
                price = 2, 
                item = "ammoshotgunslug",
               
            }, ]]
        },
        ["Pistol"] = {
           --[[  ["Pistol Ammo Normal"] = {
               
                price = 1, 
                item = "ammopistolnormal",
                
            },
            ["Pistol Ammo Express"] = {
               
                price = 2, 
                item = "ammopistolexpress",
                
            },
            ["Pistol Ammo Explosive"] = {
                
                price = 5, 
                item = "ammopistolexplosive",
                
            },
            ["Pistol Ammo Velocity"] = {
               
                price = 5, 
                item = "ammopistolvelocity",
                
            },
            ["Pistol Ammo Splitpoint"] = {
               
                price = 8, 
                item = "ammopistolsplitpoint",
               
            }, ]]

        },
        ["Arrow"] = {
            ["Arrow Normal"] = {
               
                price = 1, 
                item = "ammoarrmownormal",
                
            },
            --[[ ["Arrow Dynamite"] = {
                
                price = 5, 
                item = "ammoarrowdynamite",
                
            }, ]]
           --[[  ["Arrow Fire"] = {
               
                price = 2, 
                item = "ammoarrowfire",
                
            }, ]]
           --[[  ["Arrow Improved"] = {
              
                price = 3, 
                item = "ammoarrowimproved",
                
            }, ]]
            ["Arrow Small Game"] = {
               
                price = 0.5, 
                item = "ammoarrowsmallgame",
                
            },
            --[[ ["Arrow Poison"] = {
               
                price = 5, 
                item = "ammoarrowpoison",
                
            }, ]]

        },
        ["Varmint Ammo"] = {
            ["Varmint ammo"] = {
               
                price = 1, 
                item = "ammovarmint",
                
            },
            --[[ ["Varmint Tranquilizer Ammo"] = {
                
                price = 5, 
                item = "ammovarminttranq",
                
            }, ]]

        },
        ["Throwing"] = {
            ["Knives ammo"] = {
                
                price = 2, 
                item = "ammoknives",
                
            },
           --[[  ["Tomahawk Ammo"] = {
               
                price = 2, 
                item = "ammotomahawk",
               
            },
            ["Poison Bottle Ammo"] = {
               
                price = 5, 
                item = "ammopoisonbottle",
               
            }, ]]
            ["Bolla Ammo"] = {
               
                price = 1, 
                item = "ammobolla",
                
            },
           --[[  ["Hawkmoth Bolla Ammo"] = {
                price = 1, 
                item = "ammobolahawk",
                
            },
            ["Interwired Bolla Ammo"] = {
                price = 1, 
                item = "ammobolainterwired",
               
            },
            ["Iron-Spiked Bolla Ammo"] = {
                price = 1, 
                item = "ammobolaironspiked",
                
            },
            ["Dynamite Ammo"] = {
               
                price = 5, 
                item = "ammodynamite",
                
            },
            ["Volatile Dynamite Ammo"] = {
               
                price = 5, 
                item = "ammovoldynamite",
                
            },
            ["Molotov Ammo"] = {
               
                price = 5, 
                item = "ammomolotov",
               
            },
            ["Volatile Molotov Ammo"] = {
               
                price = 5, 
                item = "ammovolmolotov",
               
            }, ]]

        },

    }
},
    Blackwater = {	   -- you can add more wep markets by copy pasting this 
        Pos = {x=-878.74,y=-1395.15,z=44.76}, -- location of wep market 
        blipsprite = 202506373, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Weapons Shop', -- blip name 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },
    Rhodes = {	   -- you can add more wep markets by copy pasting this 
        Pos = {x=1328.54, y=-1317.83, z=77.94}, -- location of wep market 
        blipsprite = 202506373, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Weapons Shop', -- blip name 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },
    ---------------------------
    SaintD = {	  
        Pos = {x=2715.53, y=-1281.09, z=49.63}, 
        blipsprite = 202506373,
        showblip = true,
        Name = 'Weapons Shop', 
        weapons = {
            ["Melee"] = {
--[[                 ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 8,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 8,      
                
                },
                --[[ ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 5,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 3, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 8,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 10,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
                --[[ ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 20,  
                
                }, ]]
            },
             ["Rifles"] = {
              --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 100,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                },
                ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000.50,   
                
                },
                ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 100, 
                
                }, ]]
            },
            ["Repeaters"] = {
                --[[ ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 145,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 130, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 125, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
              --[[   ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                },
                ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 100, 
                
                }, ]]
               

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 60, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 55, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 75, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 15, 
                
                },
               --[[  ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 80, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
                --[[ ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 8, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 6, 
                
                },
               --[[  ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 100, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 10, 
                
                },
                ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
               --[[  ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 100, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 100, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                },
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 800, 
                
                }, ]]
            },
            ["Misc."] = {
               --[[  ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
               --[[  ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 30, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 100, 
                
                }, ]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 10, 
                
                },
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 10, 
                
                },
               --[[  ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 250, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 8, 
                
                },
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 20, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 2, 
                    item = "ammoriflenormal",
                    
                },
               --[[  ["Elephant Rifle Ammo"] = {
                    
                    price = 5, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 8, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 10, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 12, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 20, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 3, 
                    item = "ammoshotgunincendiary",
                   
                },
                ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 3, 
                    item = "ammoshotgunnormal",
                    
                },
                --[[ ["Shotgun Ammo Slug"] = {
                   
                    price = 5, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 5, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 5, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 2, 
                    item = "ammoarrmownormal",
                    
                },
               --[[  ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                },
                ["Arrow Fire"] = {
                   
                    price = 10, 
                    item = "ammoarrowfire",
                    
                },
                ["Arrow Improved"] = {
                  
                    price = 8, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 1, 
                    item = "ammoarrowsmallgame",
                    
                },
               --[[  ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 5, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
                --[[ ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
               --[[  ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
                ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },

    Annesburg = {	  
        Pos = {x=2944.70, y=1318.51, z=44.82}, 
        blipsprite = 202506373,
        showblip = false,
        Name = 'Weapons Shop', 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },
    Tumbleweed = {	   -- you can add more wep markets by copy pasting this 
        Pos = {x=-5508.61,y=-2961.96,z=-0.64,}, -- location of wep market 
        blipsprite = 202506373, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Weapons Shop', -- blip name 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                --[[ ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                }, ]]
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },

    Armadillo = {	   -- you can add more wep markets by copy pasting this 
        Pos = {x=-3681.89, y=-2598.50, z=-13.73}, -- location of wep market 
        blipsprite = 202506373, -- blip sprite for wep market
        showblip = false, -- show blip or not 
        Name = 'Weapons Shop', -- blip name 
        weapons = {
            ["Melee"] = {
               --[[  ["Horror Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_HORROR",
                    price = 5,    
                
                },
                ["Rustic Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_RUSTIC",
                    price = 5,    
                
                },
                ["Tradders Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_TRADER",
                    price = 5,    
                
                }, ]]
                ["Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE",  
                    price = 2,      
                
                },
               --[[  ["JawBone Knife"] = {	
                    hashname = "WEAPON_MELEE_KNIFE_JAWBONE",  
                    price = 2,   
                
                },
                ["Cleaver"] = {	
                    hashname = "WEAPON_MELEE_CLEAVER",    
                    price = 2, 
                
                },
                ["Hunter Hatchet"] = {	
                    hashname = "WEAPON_MELEE_HATCHET_HUNTER",  
                    price = 8,   
                },
                ["Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE",   
                    price = 5.5,  
                },
                ["Collector Machete"] = {	
                    hashname = "WEAPON_MELEE_MACHETE_COLLECTOR",   
                    price = 5.5,  
                }, ]]
            },
            ["Bows"] = {
                ["Bow"] = {	
                    hashname = "WEAPON_BOW",    
                    price = 7, 
                
                },
               --[[  ["Improved Bow"] = {	
                    hashname = "WEAPON_BOW_IMPROVED",   
                    price = 15,  
                
                }, ]]
            },
            ["Rifles"] = {
               --[[  ["Elephant Rifle"] = {	
                    hashname = "WEAPON_RIFLE_ELEPHANT",  
                    price = 400,   
                
                }, ]]
                ["Varmint Rifle"] = {	
                    hashname = "WEAPON_RIFLE_VARMINT",   
                    price = 15,  
                
                },
                --[[ ["Rollingblock Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",    
                    price = 1000, 
                
                }, ]]
                --[[ ["Carcano Rifle"] = {	
                    hashname = "WEAPON_SNIPERRIFLE_CARCANO",  
                    price = 1000,   
                
                }, ]]
               --[[  ["Springfield Rifle"] = {	
                    hashname = "WEAPON_RIFLE_SPRINGFIELD", 
                    price = 1000,    
                
                },
                ["Boltaction Rifle"] = {	
                    hashname = "WEAPON_RIFLE_BOLTACTION",    
                    price = 250, 
                
                }, ]]
            },
            ["Repeaters"] = {
               --[[  ["Winchester Repeater"] = {	
                    hashname = "WEAPON_REPEATER_WINCHESTER",   
                    price = 70,  
                
                },
                ["Henry Repeater"] = {	
                    hashname = "WEAPON_REPEATER_HENRY",    
                    price = 75.5, 
                
                },
                ["Evans Repeater"] = {	
                    hashname = "WEAPON_REPEATER_EVANS",    
                    price = 80, 
                
                }, ]]
                ["Carbine Repeater"] = {	
                    hashname = "WEAPON_REPEATER_CARBINE",    
                    price = 20, 
                
                },
            },
            ["Pistols"] = {
               --[[  ["Volcanic Pistol "] = {	
                    hashname = "WEAPON_PISTOL_VOLCANIC",    
                    price = 1000, 
                
                },
                ["M1899 Pistol "] = {	
                    hashname = "WEAPON_PISTOL_M1899",    
                    price = 10000, 
                
                }, ]]
               --[[  ["SemiAuto Pistol "] = {	
                    hashname = "WEAPON_PISTOL_SEMIAUTO",    
                    price = 1000, 
                
                }, ]]
             --[[    ["Mauser Pistol "] = {	
                    hashname = "WEAPON_PISTOL_MAUSER",    
                    price = 1000, 
                
                },
                 ]]

            },
            ["Revolvers"] = {
               --[[  ["Navy Revolver Crossover"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY_CROSSOVER",    
                    price = 50, 
                
                },
                ["Schofield Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_SCHOFIELD",    
                    price = 50, 
                
                },
                ["Lemat Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_LEMAT",    
                    price = 40, 
                
                },
                ["Double Action Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_DOUBLEACTION",    
                    price = 55, 
                
                }, ]]
                ["Cattleman Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_CATTLEMAN",    
                    price = 10, 
                
                },
                --[[ ["Navy Revolver"] = {	
                    hashname = "WEAPON_REVOLVER_NAVY",    
                    price = 60, 
                
                }, ]]
            },
            ["Throwable"] = { -- Due to vorp bug, using this weapon never runs out of ammo if u requip. 
            -- in order for throwables to work. the player must buy the throwable weapon then buy and use the related ammo box
            -- only then will the throwable show up in their weapon wheel 
               --[[  ["Bolas Hawkmoth"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_HAWKMOTH",    
                    price = 100, 
                
                },
                ["Bolas Iron-Spiked"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_IRONSPIKED",    
                    price = 100, 
                
                },
                ["Bolas Intertwined"] = {	
                    hashname = "WEAPON_THROWN_BOLAS_INTERTWINED",    
                    price = 100, 
                
                },
                ["Tomahawk"] = {	
                    hashname = "WEAPON_THROWN_TOMAHAWK",    
                    price = 10, 
                
                }, ]]
                ["Knives"] = {	
                    hashname = "WEAPON_THROWN_THROWING_KNIVES",    
                    price = 4, 
                
                },
                --[[ ["Poison Bottle"] = {	
                    hashname = "WEAPON_THROWN_POISONBOTTLE",    
                    price = 15, 
                
                },
                ["Bolas"] = {	
                    hashname = "WEAPON_THROWN_BOLAS",    
                    price = 4, 
                
                }, ]]
               --[[  ["Dynamite"] = {	
                    hashname = "WEAPON_THROWN_DYNAMITE",    
                    price = 100, 
                
                },
                ["Molotov"] = {	
                    hashname = "WEAPON_THROWN_MOLOTOV",    
                    price = 100, 
                
                }, ]]

            },
            ["Shotguns"] = {
                --[[ ["Semiauto Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SEMIAUTO",    
                    price = 100, 
                
                },
                ["Sawedoff Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_SAWEDOFF",    
                    price = 250, 
                
                },
                ["Repeating Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_REPEATING",    
                    price = 1000, 
                
                },
                ["Pump Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_PUMP",    
                    price = 1000, 
                
                }, ]]
                ["Doublebarrel Shotgun"] = {	
                    hashname = "WEAPON_SHOTGUN_DOUBLEBARREL",    
                    price = 125, 
                
                },
            },
            ["Misc."] = {
                --[[ ["Metal Dectector"] = {	
                    hashname = "WEAPON_KIT_METAL_DETECTOR",    
                    price = 2, 
                
                },["Halloween Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN_HALLOWEEN",    
                    price = 2, 
                
                }, ]]
                ["Lasso"] = {	
                    hashname = "WEAPON_LASSO",    
                    price = 20, 
                
                },
                --[[ ["Reinforced Lasso"] = {	
                    hashname = "WEAPON_LASSO_REINFORCED",    
                    price = 10, 
                
                },
                ["Improved Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS_IMPROVED",    
                    price = 10, 
                
                },]]
                ["Binoculars"] = {	
                    hashname = "WEAPON_KIT_BINOCULARS",    
                    price = 2.5, 
                
                }, 
                ["Fishing Rod"] = {	
                    hashname = "WEAPON_FISHINGROD",    
                    price = 1, 
                
                },
                ["Lantern"] = {	
                    hashname = "WEAPON_MELEE_LANTERN",    
                    price = 1, 
                
                },
                --[[ ["Camera"] = {	
                    hashname = "WEAPON_KIT_CAMERA",    
                    price = 40, 
                
                },
                ["Advanced Camera"] = {	
                    hashname = "WEAPON_kIT_CAMERA_ADVANCED",    
                    price = 200, 
                
                },
                
                ["Davy Lantern"] = {	
                    hashname = "WEAPON_MELEE_DAVY_LANTERN",    
                    price = 15, 
                
                }, ]]
            },
        }, 
        ammo = {
            ["Repeater"] = {
                ["Repeater Ammo Normal"] = {
                    price = 1, 
                    item = "ammorepeaternormal",
                },
                --[[ ["Repeater Ammo Express"] = {
                    price = 2, 
                    item = "ammorepeaterexpress",
                    
                },
                ["Repeater Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorepeaterexplosive",
                    
                },
                ["Repeater Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorepeatervelocity",
                    
                },
                ["Repeater Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammorepeatersplitpoint",
                   
                }, ]]
            },

            ["Revolver"] = {
                ["Revolver Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammorevolvernormal",
                    
                },
               --[[  ["Revolver Ammo Express"] = {
                    
                    price = 2, 
                    item = "ammorevolverexpress",
                    
                },
                ["Revolver Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammorevolverexplosive",
                    
                },
                ["Revolver Ammo Velocity"] = {
                    
                    price = 5, 
                    item = "ammorevolvervelocity",
                    
                },
                ["Revolver Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammorevolversplitpoint",
                   
                }, ]]

            },
            ["Rifle"] = {
                ["Rifle Ammo Normal"] = {
                    
                    price = 1, 
                    item = "ammoriflenormal",
                    
                },
                --[[ ["Elephant Rifle Ammo"] = {
                    
                    price = 10, 
                    item = "ammoelephant",
                    
                },
                ["Rifle Ammo Express"] = {
                   
                    price = 5, 
                    item = "ammorifleexpress",
                    
                },
                ["Rifle Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammorifleexplosive",
                    
                },
                ["Rifle Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammoriflevelocity",
                   
                },
                ["Rifle Ammo Splitpoint"] = {
                    
                    price = 8, 
                    item = "ammoriflesplitpoint",
                   
                }, ]]

            },
            ["Shotgun"] = {
               --[[  ["Shotgun Ammo Incendiary"] = {
                   
                    price = 5, 
                    item = "ammoshotgunincendiary",
                   
                }, ]]
                --[[ ["Shotgun Ammo Explosive"] = {
                   
                    price = 5, 
                    item = "ammoshotgunexplosive",
                    
                }, ]]
                ["Shotgun Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammoshotgunnormal",
                    
                },
               --[[  ["Shotgun Ammo Slug"] = {
                   
                    price = 2, 
                    item = "ammoshotgunslug",
                   
                }, ]]
            },
            ["Pistol"] = {
               --[[  ["Pistol Ammo Normal"] = {
                   
                    price = 1, 
                    item = "ammopistolnormal",
                    
                },
                ["Pistol Ammo Express"] = {
                   
                    price = 2, 
                    item = "ammopistolexpress",
                    
                },
                ["Pistol Ammo Explosive"] = {
                    
                    price = 5, 
                    item = "ammopistolexplosive",
                    
                },
                ["Pistol Ammo Velocity"] = {
                   
                    price = 5, 
                    item = "ammopistolvelocity",
                    
                },
                ["Pistol Ammo Splitpoint"] = {
                   
                    price = 8, 
                    item = "ammopistolsplitpoint",
                   
                }, ]]

            },
            ["Arrow"] = {
                ["Arrow Normal"] = {
                   
                    price = 1, 
                    item = "ammoarrmownormal",
                    
                },
                --[[ ["Arrow Dynamite"] = {
                    
                    price = 5, 
                    item = "ammoarrowdynamite",
                    
                }, ]]
               --[[  ["Arrow Fire"] = {
                   
                    price = 2, 
                    item = "ammoarrowfire",
                    
                }, ]]
               --[[  ["Arrow Improved"] = {
                  
                    price = 3, 
                    item = "ammoarrowimproved",
                    
                }, ]]
                ["Arrow Small Game"] = {
                   
                    price = 0.5, 
                    item = "ammoarrowsmallgame",
                    
                },
                --[[ ["Arrow Poison"] = {
                   
                    price = 5, 
                    item = "ammoarrowpoison",
                    
                }, ]]

            },
            ["Varmint Ammo"] = {
                ["Varmint ammo"] = {
                   
                    price = 1, 
                    item = "ammovarmint",
                    
                },
                --[[ ["Varmint Tranquilizer Ammo"] = {
                    
                    price = 5, 
                    item = "ammovarminttranq",
                    
                }, ]]

            },
            ["Throwing"] = {
                ["Knives ammo"] = {
                    
                    price = 2, 
                    item = "ammoknives",
                    
                },
               --[[  ["Tomahawk Ammo"] = {
                   
                    price = 2, 
                    item = "ammotomahawk",
                   
                },
                ["Poison Bottle Ammo"] = {
                   
                    price = 5, 
                    item = "ammopoisonbottle",
                   
                }, ]]
                ["Bolla Ammo"] = {
                   
                    price = 1, 
                    item = "ammobolla",
                    
                },
               --[[  ["Hawkmoth Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolahawk",
                    
                },
                ["Interwired Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolainterwired",
                   
                },
                ["Iron-Spiked Bolla Ammo"] = {
                    price = 1, 
                    item = "ammobolaironspiked",
                    
                },
                ["Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammodynamite",
                    
                },
                ["Volatile Dynamite Ammo"] = {
                   
                    price = 5, 
                    item = "ammovoldynamite",
                    
                },
                ["Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammomolotov",
                   
                },
                ["Volatile Molotov Ammo"] = {
                   
                    price = 5, 
                    item = "ammovolmolotov",
                   
                }, ]]

            },

        }
    },
   
} 