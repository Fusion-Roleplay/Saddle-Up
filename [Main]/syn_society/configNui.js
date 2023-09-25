
var configs = {
    theme: {
        "primary_color": "#d41919",
        "secondary_color": "#d41919"
    },
    jobs: [
        // Whitelisted jobs
        {
            "title": "police", // title to show in html nui in game
            "shortDescription": "Sherif", // short description 
            "description": "catch bad guys", // long description 
            "group": "police", // the job title they will gain in db
            "whitelisted": true, // if true players wont be able to select this, rather they will only see that it is an available option on your server
            "iconName": "police.png", // the logo of the job, you can add logos in this path syn_society\client\html\icons
            requirements: ["Join our discord for more information-- list the requirements you want people to have here"] // any special requirements you want listed 
        },
        {
            "title": "Horse Trainer",
            "shortDescription": "Train horses",
            "description": "train other players horses and get paid",
            "group": "horsetrainer",
            "whitelisted": true,
            "iconName": "horsetrainer.png",
            requirements: ["Join our discord for more information-- list the requirements you want people to have here"]
        },
        
        // Unwhitelisted jobs
        {
            "title": "Miner",
            "shortDescription": "mine stuff",
            "description": "Hit the mountains and mine stuff",
            "group": "miner",
            "whitelisted": false,
            "iconName": "miner.png",
            requirements: ["none"]
        },
        {
            "title": "Medic",
            "shortDescription": "help people in need",
            "description": "heal people",
            "group": "doctor",
            "whitelisted": false,
            "iconName": "doctor.png",
            requirements: ["none"]
        },
        /* { // addjobs by copy pasting whats between the stars *
            "title": "Miner",
            "shortDescription": "Repara vehiculos",
            "description": "Repara vehiculos y turbinas",
            "group": "mecanico",
            "whitelisted": false,
            "iconName": "police.jpg",
            requirements: ["Ninguna"]
        }, */
    ]
}