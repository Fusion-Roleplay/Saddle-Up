-- IMPORTANT READ 
-- before anything make sure you have ran all the DB files ! and updated your SQL tables !

-- to use society functions of the store script you must own syn_society ! if you dont you can ignore this file entirely!
-- only use this if you are converting from syn_stores V1 to the new syn stores ! 
-- if you are a new syn stores user and you never used syn_stores V1 you can ignore this file entirely !


-- copy paste the Config.societyshops from your old syn stores config to here, 
-- restart this script 
-- after you restart you must then delete everything inside this file ! 
-- then you can start using the new syn stores !



Config.societyshops = { -- money made from these shops goes to society ledger, make sure your databases aligen 
    --[[ bastille = {	  
        id = 1, 
        society = "bastille",
        ranklock = true, 
        rank = 3, 
        Pos = {x=2637.79, y=-1224.52, z=53.38}, 
        blipsprite = -1954662204, 
        Name = 'Bastille Store', 
        showblip = false,
    },  ]]

}