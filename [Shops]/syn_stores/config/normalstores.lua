-- these shops are only templates ! items inside here and shop locations are up to you to manage, add and set up as per your server needs ! 
-- not all items in these shops will work on all servers they are meant to be configured as per your needs  

-- you can add weapons to shops now ! by using a line like this 
--{name = "WEAPON_SHOTGUN_SAWEDOFF", label = "Sawed off", price = "15",type = "item_weapon"},
-- shops can sell weapons but they cannot buy weapons ! 

Config.normalstores = {  -- delete everything inside here if you dont want normal shops 
    {	   
        Pos = {x=-322.3, y=803.93, z=117.88}, -- location of shop
        blipsprite = 1475879922, -- blip sprite for shop
        Name = 'Valentine Store', -- blip name 
        joblock = {},-- leave empty if you want the shop to be available to everyone, if u wana lock it to a job set it as such {"police","doctor"} etc
        showblip = true,
        sellitems = { -- items sold by shop
        {name = "water", label = "water", price = "2",type = "item_standard"}, -- change label of items shown 



        },
        buyitems = { -- Items the shop will buy, these will only show if the player has them in his inventory 
            {name = "water", label = "water", price = "1",type = "item_standard"},
        },
    },
    
}