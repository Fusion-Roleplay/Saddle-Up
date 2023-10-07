MinijobsConfig = {}

MinijobsConfig.useProgressbar = true
MinijobsConfig.progressbar = "progressBars" --change to "progressBars" if you use normal ones


MinijobsConfig.enableCotton = true
MinijobsConfig.Cotton ={
    location1 = {
        center = {x = 3285.6518554688 , y = -562.98559570313 , z = 42.116325378418},
        radius = 25,
        props = {"crp_cotton_bb_sim","crp_cotton_ba_sim"},
        timeToCollect = 20000,
        timeReduce = 1,

        enableRake = true,
        timeToRake = 30000,
        timeReduceRake = 1

    },
    location2 = {
        center = {x = 3255.4721679688 , y = -542.44775390625 , z = 42.005569458008},
        radius = 25,
        props = {"crp_cotton_bb_sim","crp_cotton_ba_sim"},
        timeToCollect = 20000,
        timeReduce = 1,

        enableRake = true,
        timeToRake = 30000,
        timeReduceRake = 1

    },
    location3 = {
        center = {x = 3202.9262695313 , y = -590.02362060547 , z = 41.880397796631},
        radius = 20,
        props = {"crp_cotton_bb_sim","crp_cotton_ba_sim"},
        timeToCollect = 20000,
        timeReduce = 1,
        
        enableRake = true,
        timeToRake = 30000,
        timeReduceRake = 1

    }
    
}

MinijobsConfig.enableBroom = true
MinijobsConfig.Broom ={ --points where broom scenarios can be played 
    location1 = {
        coords = {x=3342.04, y=-691.30, z=43.88},
        distance = 3,
        duration = 30000,
        timeReduce = 1,

    },
}

MinijobsConfig.enableRepair = true
MinijobsConfig.Repair ={
    wall1 = {
        coords = {x=3327.907, y=-690.14, z= 44.19},
        distance = 1.5,
        duration = 30000,
        timeReduce = 1,

    },
    wall2 = {
        coords = {x=3378.519287109375, y= -695.390869140625, Z= 45.73780822753906},
        distance = 1.5,
        duration = 30000,
        timeReduce = 1,

    },
}