Config3 = {}
Config3.ammo = { -- both crafting and shops
    ["Repeater"] = {
        ["Repeater Ammo Normal"] = {
            key = "AMMO_REPEATER",-- DO NOT CHANGE THESE  
            item = "ammorepeaternormal",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200, -- max ammo allowed by game 
            guncheck = 0xDDB2578E95EF7138,-- DO NOT CHANGE THESE 
            qt = 100, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "nitrite",label = "nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Repeater Ammo Express"] = {
            key = "AMMO_REPEATER_EXPRESS", 
            item = "ammorepeaterexpress",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0xDDB2578E95EF7138,
            qt = 100, -- number of bullets in box    
            expadd = 1,
            expreq = 50,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 3},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 3},
                item3 = {name = "nitrite",label = "nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},

            }, 
        },
        ["Repeater Ammo Explosive"] = {
            key = "AMMO_REPEATER_EXPRESS_EXPLOSIVE", 
            item = "ammorepeaterexplosive",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 20,
            guncheck = 0xDDB2578E95EF7138,
            qt = 30, -- number of bullets in box
            expadd = 1,
            expreq = 50,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 5},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 5},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 5},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Repeater Ammo Velocity"] = {
            key = "AMMO_REPEATER_HIGH_VELOCITY", 
            item = "ammorepeatervelocity",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0xDDB2578E95EF7138,
            qt = 100, -- number of bullets in box	    
            expadd = 1,
            expreq = 10,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Repeater Ammo Splitpoint"] = {
            key = "AMMO_REPEATER_SPLIT_POINT", 
            item = "ammorepeatersplitpoint",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 100,
            guncheck = 0xDDB2578E95EF7138,
            qt = 50, -- number of bullets in box	    
            expadd = 1,
            expreq = 30,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
    },

    ["Revolver"] = {
        ["Revolver Ammo Normal"] = {
            key = "AMMO_REVOLVER",-- DO NOT CHANGE THESE  
            item = "ammorevolvernormal",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 200, -- max ammo allowed by game 
            guncheck = 0xC212F1D05A8232BB ,-- DO NOT CHANGE THESE 
            qt = 100, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "nitrite",label = "nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Revolver Ammo Express"] = {
            key = "AMMO_REVOLVER_EXPRESS", 
            item = "ammorevolverexpress",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 200,
            guncheck = 0xC212F1D05A8232BB ,
            qt = 100, -- number of bullets in box    
            expadd = 1,
            expreq = 50,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 3},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 3},
                item3 = {name = "nitrite",label = "nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Revolver Ammo Explosive"] = {
            key = "AMMO_REVOLVER_EXPRESS_EXPLOSIVE", 
            item = "ammorevolverexplosive",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 30,
            guncheck = 0xC212F1D05A8232BB ,
            qt = 5, -- number of bullets in box
            expadd = 1,
            expreq = 30,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 5},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 5},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 5},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Revolver Ammo Velocity"] = {
            key = "AMMO_REVOLVER_HIGH_VELOCITY", 
            item = "ammorevolvervelocity",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 200,
            guncheck = 0xC212F1D05A8232BB ,
            qt = 100, -- number of bullets in box	    
            expadd = 1,
            expreq = 10,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Revolver Ammo Splitpoint"] = {
            key = "AMMO_REVOLVER_SPLIT_POINT", 
            item = "ammorevolversplitpoint",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 100,
            guncheck = 0xC212F1D05A8232BB ,
            qt = 50, -- number of bullets in box	    
            expadd = 1,
            expreq = 30,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 8},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 8},
                item3 = {name = "nitrite",label = "nitrite", amount = 8},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },

    },
    ["Rifle"] = {
        ["Rifle Ammo Normal"] = {
            key = "AMMO_RIFLE",-- DO NOT CHANGE THESE  
            item = "ammoriflenormal",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 100, -- max ammo allowed by game 
            guncheck = 0x0A82317B7EBFC420 ,-- DO NOT CHANGE THESE 
            guncheck2 = 0x6AD66548840472E5,
            qt = 100, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "nitrite",label = "nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Elephant Rifle Ammo"] = {
            key = "AMMO_RIFLE_ELEPHANT",-- DO NOT CHANGE THESE  
            item = "ammoelephant",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 20, -- max ammo allowed by game 
            guncheck = 0x0A82317B7EBFC420 ,-- DO NOT CHANGE THESE 
            guncheck2 = 0x6AD66548840472E5,
            qt = 10, -- number of bullets in box 
            expadd = 1,
            expreq = 100,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "nitrite",label = "nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Rifle Ammo Express"] = {
            key = "AMMO_RIFLE_EXPRESS", 
            item = "ammorifleexpress",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0x0A82317B7EBFC420 ,
            guncheck2 = 0x6AD66548840472E5,
            qt = 100, -- number of bullets in box    
            expadd = 1,
            expreq = 200,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 3},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 3},
                item3 = {name = "nitrite",label = "nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Rifle Ammo Explosive"] = {
            key = "AMMO_RIFLE_EXPRESS_EXPLOSIVE", 
            item = "ammorifleexplosive",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 10,
            guncheck = 0x0A82317B7EBFC420 ,
            guncheck2 = 0x6AD66548840472E5,
            qt = 5, -- number of bullets in box
            expadd = 1,
            expreq = 500,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 5},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 5},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 5},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Rifle Ammo Velocity"] = {
            key = "AMMO_RIFLE_HIGH_VELOCITY", 
            item = "ammoriflevelocity",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0x0A82317B7EBFC420 ,
            guncheck2 = 0x6AD66548840472E5,
            qt = 100, -- number of bullets in box	    
            expadd = 1,
            expreq = 100,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Rifle Ammo Splitpoint"] = {
            key = "AMMO_RIFLE_SPLIT_POINT", 
            item = "ammoriflesplitpoint",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 100,
            guncheck = 0x0A82317B7EBFC420 ,
            guncheck2 = 0x6AD66548840472E5,
            qt = 50, -- number of bullets in box	    
            expadd = 1,
            expreq = 250,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 3},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 3},
                item3 = {name = "nitrite",label = "nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },

    },
    ["Shotgun"] = {
        ["Shotgun Ammo Incendiary"] = {
            key = "AMMO_SHOTGUN_BUCKSHOT_INCENDIARY",-- DO NOT CHANGE THESE  
            item = "ammoshotgunincendiary",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 50, -- max ammo allowed by game 
            guncheck = 0xC75386174ECE95D5  ,-- DO NOT CHANGE THESE 
            qt = 10, -- number of bullets in box 
            expadd = 1,
            expreq = 500,
            diff = 2000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Shotgun Ammo Explosive"] = {
            key = "AMMO_SHOTGUN_SLUG_EXPLOSIVE", 
            item = "ammoshotgunexplosive",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 50,
            guncheck = 0xC75386174ECE95D5  ,
            qt = 10, -- number of bullets in box    
            expadd = 1,
            expreq = 1000,
            diff = 2000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 5},
                item2 = {name = "rubber",label = "Rubber", amount = 5},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Shotgun Ammo Normal"] = {
            key = "AMMO_SHOTGUN", 
            item = "ammoshotgunnormal",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 50,
            guncheck = 0xC75386174ECE95D5  ,
            qt = 25, -- number of bullets in box
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "rubber",label = "Rubber", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Shotgun Ammo Slug"] = {
            key = "AMMO_SHOTGUN_SLUG", 
            item = "ammoshotgunslug",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","grimfellows","highland"}, 
            maxammo = 50,
            guncheck = 0xC75386174ECE95D5  ,
            qt = 25, -- number of bullets in box	    
            expadd = 1,
            expreq = 20,
            diff = 3000,
            materials = {
                item1 = {name = "rubber",label = "Rubber", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
    },
    ["Pistol"] = {
        ["Pistol Ammo Normal"] = {
            key = "AMMO_PISTOL",-- DO NOT CHANGE THESE  
            item = "ammopistolnormal",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200, -- max ammo allowed by game 
            guncheck = 0xDDC64F5E31EEDAB6  ,-- DO NOT CHANGE THESE 
            qt = 100, -- number of bullets in box 
            expadd = 1,
            expreq = 500,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 1},
                item3 = {name = "nitrite",label = "Nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Pistol Ammo Express"] = {
            key = "AMMO_PISTOL_EXPRESS", 
            item = "ammopistolexpress",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0xDDC64F5E31EEDAB6  ,
            qt = 100, -- number of bullets in box    
            expadd = 10,
            expreq = 1000,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 3},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 5},
                item3 = {name = "nitrite",label = "Nitrite", amount = 3},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Pistol Ammo Explosive"] = {
            key = "AMMO_PISTOL_EXPRESS_EXPLOSIVE", 
            item = "ammopistolexplosive",
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 10,
            guncheck = 0xDDC64F5E31EEDAB6  ,
            qt = 5, -- number of bullets in box
            expadd = 1,
            expreq = 100,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "nitrite",label = "Nitrite", amount = 1},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Pistol Ammo Velocity"] = {
            key = "AMMO_PISTOL_HIGH_VELOCITY", 
            item = "ammopistolvelocity",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200,
            guncheck = 0xDDC64F5E31EEDAB6  ,
            qt = 100, -- number of bullets in box	    
            expadd = 10,
            expreq = 1200,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 2},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "nitrite",label = "Nitrite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Pistol Ammo Splitpoint"] = {
            key = "AMMO_PISTOL_SPLIT_POINT", 
            item = "ammopistolsplitpoint",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 100,
            guncheck = 0xDDC64F5E31EEDAB6  ,
            qt = 50, -- number of bullets in box	    
            expadd = 10,
            expreq = 1500,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 3},
                item3 = {name = "nitrite",label = "Nitrite", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },

    },
    ["Arrow"] = {
        ["Arrow Normal"] = {
            key = "AMMO_ARROW",-- DO NOT CHANGE THESE  
            item = "ammoarrmownormal",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 40, -- max ammo allowed by game 
            guncheck = 0 ,-- DO NOT CHANGE THESE 
            qt = 20, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 5000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 2},
                item2 = {name = "wood",label = "wood", amount = 2},
                item3 = {name = "turkeyf",label = "Turkey feather", amount = 2},
            }, 
        },
        ["Arrow Dynamite"] = {
            key = "AMMO_ARROW_DYNAMITE", 
            item = "ammoarrowdynamite",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 8,
            guncheck = 0  ,
            qt = 4, -- number of bullets in box    
            expadd = 1,
            expreq = 50,
            diff = 2500,
            materials = {
                item1 = {name = "hawkf",label = "Hawk feather", amount = 2},
                item2 = {name = "wood",label = "wood", amount = 2},
                item3 = {name = "dynamite",label = "Pipe charge dynamite", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
                item5 = {name = "acid",label = "Acid", amount = 5},
                item6 = {name = "alcohol",label = "Alcohol", amount = 5},


            }, 
        },
        ["Arrow Fire"] = {
            key = "AMMO_ARROW_FIRE", 
            item = "ammoarrowfire",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 5,
            guncheck = 0  ,
            qt = 1, -- number of bullets in box
            expadd = 1,
            expreq = 10000,
            diff = 3000,
            materials = {
                item1 = {name = "nitrite",label = "Nitrite", amount = 2},
                item2 = {name = "wood",label = "wood", amount = 2},
                item3 = {name = "rabbits",label = "Rabbitskin", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
                item5 = {name = "alcohol",label = "Alcohol", amount = 5},
                item6 = {name = "iron",label = "iron ore", amount = 10},
                item7 = {name = "porkfat",label = "Pork Fat", amount = 5},


            }, 
        },
        ["Arrow Improved"] = { --Dont reccommend making craftable item is unstable
            key = "AMMO_ARROW_IMPROVED", 
            item = "ammoarrowimproved",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 40,
            guncheck = 0  ,
            qt = 20, -- number of bullets in box	    
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
            }, 
        },
        ["Arrow Small Game"] = {
            key = "AMMO_ARROW_SMALL_GAME", 
            item = "ammoarrowsmallgame",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 40,
            guncheck = 0  ,
            qt = 20, -- number of bullets in box	    
            expadd = 1,
            expreq = 0,
            diff = 5000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "quailf",label = "Quail feather", amount = 1},
            }, 
        },
        ["Arrow Poison"] = {
            key = "AMMO_ARROW_POISON", 
            item = "ammoarrowpoison",
            playeritem = {"WEAPON_BOW", "WEAPON_BOW_IMPROVED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 20,
            guncheck = 0  ,
            qt = 10, -- number of bullets in box	    
            expadd = 1,
            expreq = 25,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 2},
                item2 = {name = "wood",label = "wood", amount = 2},
                item3 = {name = "Snake_Poison",label = "Snake_Poison", amount = 2},
            }, 
        },

    },
    ["Varmint Ammo"] = {
        ["Varmint ammo"] = {
            key = "AMMO_22",-- DO NOT CHANGE THESE  
            item = "ammovarmint",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 100, -- max ammo allowed by game 
            guncheck = 0x0A82317B7EBFC420 ,-- DO NOT CHANGE THESE 
            qt = 50, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 5},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 5},
                item3 = {name = "nitrite",label = "Nitrite", amount = 5},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Varmint Tranquilizer Ammo"] = {
            key = "AMMO_22_TRANQUILIZER",-- DO NOT CHANGE THESE  
            item = "ammovarminttranq",
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns"}, 
            maxammo = 200, -- max ammo allowed by game 
            guncheck = 0x0A82317B7EBFC420 ,-- DO NOT CHANGE THESE 
            qt = 100, -- number of bullets in box 
            expadd = 1,
            expreq = 100,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "shellcasing",label = "Shell Casing", amount = 2},
                item3 = {name = "Snake_Poison",label = "Snake Poison", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },

    },
    ["Throwing"] = {
        ["Knives ammo"] = {
            key = "AMMO_THROWING_KNIVES",-- DO NOT CHANGE THESE  
            item = "ammoknives",
            playeritem = {"WEAPON_THROWN_THROWING_KNIVES"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","shaman","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","wapitishaman","blackhawkshaman","bloodcherokeetribe","choctawshaman","blacksmokeshaman","roanokeshaman","valwahyashaman","grimfellows","highland"}, 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 5,
            diff = 5000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "clay",label = "Clay", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Tomahawk Ammo"] = {
            key = "AMMO_TOMAHAWK",-- DO NOT CHANGE THESE  
            item = "ammotomahawk",
            playeritem = {"WEAPON_THROWN_TOMAHAWK"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"shaman","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman"}, 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 5,
            diff = 5000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "fibers",label = "Fibers", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Poison Bottle Ammo"] = {
            key = "AMMO_POISONBOTTLE",-- DO NOT CHANGE THESE  
            item = "ammopoisonbottle",
            playeritem = {"WEAPON_THROWN_POISONBOTTLE"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","shaman","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman","grimfellows","highland"}, 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 50,
            diff = 3000,
            materials = {
                item1 = {name = "glassbottle",label = "glassbottle", amount = 5},
                item2 = {name = "Snake_Poison",label = "Snake_Poison", amount = 2},
                item3 = {name = "acid",label = "acid", amount = 2},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Bolla Ammo"] = {
            key = "AMMO_BOLAS",-- DO NOT CHANGE THESE  
            item = "ammobolla",
            playeritem = {"WEAPON_THROWN_BOLAS"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","shaman","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman","grimfellows","highland"}, 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 0,
            diff = 5000,
            materials = {
                item1 = {name = "ironbar",label = "Iron Bar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
            }, 
        },
        ["Hawkmoth Bolla Ammo"] = {
            key = "AMMO_BOLAS_HAWKMOTH",-- DO NOT CHANGE THESE  
            item = "ammobolahawk",
            playeritem = {"WEAPON_THROWN_BOLAS_HAWKMOTH"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","grimfellows","highland"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 25,
            diff = 3500,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "hawkt",label = "Hawk claws", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
            }, 
        },
        ["Interwired Bolla Ammo"] = {
            key = "AMMO_BOLAS_INTERTWINED",-- DO NOT CHANGE THESE  
            item = "ammobolainterwired",
            playeritem = {"WEAPON_THROWN_BOLAS_INTERTWINED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","grimfellows","highland"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 10,
            diff = 4000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "fibers",label = "Fibers", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
            }, 
        },
        ["ironbar-Spiked Bolla Ammo"] = {
            key = "AMMO_BOLAS_IRONSPIKED",-- DO NOT CHANGE THESE  
            item = "ammobolaironspiked",
            playeritem = {"WEAPON_THROWN_BOLAS_IRONSPIKED"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"bountyhunter","pinkerton","cumberlandguild","omenbounty","beanbounty","regulators","grimfellows","highland"}, -- jobs that can craft this weapon is job only is true 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 50,
            diff = 3000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 3},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "clay",label = "Clay", amount = 1},
                item4 = {name = "coal",label = "Coal", amount = 1},
            }, 
        },
        ["Dynamite Ammo"] = {
            key = "AMMO_DYNAMITE",-- DO NOT CHANGE THESE  
            item = "ammodynamite",
            playeritem = {"WEAPON_THROWN_DYNAMITE"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","shaman","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman","grimfellows","highland"}, 
            maxammo = 5, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 5, -- number of bullets in box 
            expadd = 1,
            expreq = 100000,
            diff = 1500,
            materials = {
                item1 = {name = "nitrite",label = "nitrite", amount = 10},
                item2 = {name = "acid",label = "Acid", amount = 10},
                item3 = {name = "clay",label = "Clay", amount = 10},
                item4 = {name = "dynamite",label = "Pipe charge dynamite", amount = 5},
                item5 = {name = "specialpelt",label = "Special Pelt", amount = 5},
                item6 = {name = "coal",label = "Coal", amount = 1},
                item7 = {name = "fibers",label = "Fibers", amount = 10},
                item8 = {name = "alcohol",label = "Alcohol", amount = 5},
                item9 = {name = "fertilizerbless",label = "Blessed Fertilizer", amount = 5},
                item11 = {name = "iron",label = "iron ore", amount = 5},
                item12 = {name = "porkfat",label = "Pork Fat", amount = 5},
                item13 = {name = "sap",label = "Sap", amount = 5},
                item14 = {name = "fertilizersyn",label = "Synful Fertilizer", amount = 5},


            }, 
        },
        ["Volatile Dynamite Ammo"] = {
            key = "AMMO_DYNAMITE_VOLATILE",-- DO NOT CHANGE THESE  
            item = "ammovoldynamite",
            playeritem = {"WEAPON_THROWN_DYNAMITE"},
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"noone"}, 
            maxammo = 3, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 3, -- number of bullets in box 
            expadd = 1,
            expreq = 1000,
            diff = 2000,
            materials = {
                item1 = {name = "ironbar",label = "ironbar", amount = 1},
                item2 = {name = "wood",label = "wood", amount = 1},
                item3 = {name = "rock",label = "rock", amount = 1},
                item6 = {name = "coal",label = "Coal", amount = 1},

            }, 
        },
        ["Molotov Ammo"] = {
            key = "AMMO_MOLOTOV",-- DO NOT CHANGE THESE  
            item = "ammomolotov",
            playeritem = {"WEAPON_THROWN_MOLOTOV"},
            letcraft = true, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"gunsmith","sdgunsmith","annesburgguns","rguns","bountyhunter","pinkerton","shaman","cumberlandguild","omenbounty","beanbounty","regulators","bwgunsmith","annesburggunsmith","frontierarms","strwgunsmith","twgunsmith","lympanyguns","wapitishaman","blackhawkshaman","blacksmokeshaman","bloodcherokeetribe","choctawshaman","roanokeshaman","valwahyashaman","grimfellows","highland"}, 
            maxammo = 3, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 3, -- number of bullets in box 
            expadd = 1,
            expreq = 20,
            diff = 3000,
            materials = {
                item1 = {name = "glassbottle",label = "glassbottle", amount = 3},
                item2 = {name = "specialpelt",label = "Special Pelt", amount = 1},
                item3 = {name = "alcohol",label = "alcohol", amount = 3},
                item6 = {name = "coal",label = "Coal", amount = 1},
                item7 = {name = "glassbottle",label = "Glass Bottle", amount = 5},
                item8 = {name = "iron",label = "iron ore", amount = 5},
                item9 = {name = "porkfat",label = "Pork Fat", amount = 5},
                item10 = {name = "sap",label = "Sap", amount = 5},


            }, 
        },
        ["Volatile Molotov Ammo"] = {
            key = "AMMO_MOLOTOV_VOLATILE",-- DO NOT CHANGE THESE  
            item = "ammovolmolotov",
            playeritem = {"WEAPON_THROWN_MOLOTOV"},
            letcraft = false, -- show in crafting u can toggle this to false if you want to make this weapon sellable but not craftable
            jobonly = true, -- turn this to true if you want crafting this weapon to only be allowed for a certain job
            jobs = {"noone"}, 
            maxammo = 3, -- max ammo allowed by game 
            guncheck = 0  ,-- DO NOT CHANGE THESE 
            qt = 3, -- number of bullets in box 
            expadd = 1,
            expreq = 100,
            diff = 3000,
            materials = {
                item1 = {name = "glassbottle",label = "glassbottle", amount = 3},
                item2 = {name = "specialpelt",label = "Special Pelt", amount = 1},
                item3 = {name = "alcohol",label = "alcohol", amount = 10},
                item6 = {name = "coal",label = "Coal", amount = 1},

            }, 
        },

    },
    
    
    
}