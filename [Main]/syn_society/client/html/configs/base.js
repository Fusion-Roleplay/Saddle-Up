
var configs = {
    theme: {
        "primary_color": "#0cc7c4",
        "secondary_color": "#0cc7c4"
    },
    jobs: [
        // Whitelisted jobs
        {
            "title": "police",
            "shortDescription": "Sherif",
            "description": "catch bad guys",
            "group": "police",
            "whitelisted": true,
            "iconName": "police.jpg",
            requirements: ["Join our discord"]
        },
        
        // Unwhitelisted jobs
        {
            "title": "Miner",
            "shortDescription": "mine stuff",
            "description": "Hit the mountains and mine stuff",
            "group": "miner",
            "whitelisted": false,
            "iconName": "miner.jpg",
            requirements: ["none"]
        },
        /* {
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