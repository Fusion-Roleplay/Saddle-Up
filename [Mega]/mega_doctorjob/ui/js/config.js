const CONFIG = {
    // Translation for boneIDs to readable names
    boneNames: {
        'head': 'Head',
        'right-arm': 'Right Arm',
        'left-arm': 'Left Arm',
        'right-leg': 'Right Leg',
        'left-leg': 'Left Leg',
        'torso': 'Torso'
    },
    defaultBodyTemperatureRange: [36.0, 37.5],
    defaultHeartRate: 'Normal',
    language: {
        cut: 'Cut',
        projectile: 'Projectile',
        broken: 'Broken',
        bandaged: 'Dirty Bandage'
    },
    // Don't touch unless you know what you're doing
    // Used for the medical ui to localise damage, it links to the svg file ids
    boneIDsToName: {
        ['torso']: [
            0,
            14410,
            14411,
            14412,
            14413,
            14414,
            14415,
            14416,
            11569,
        ],
        ['head']: [
            21030
        ],
        ['right-arm']: [
            54802,
            16827,
            16828,
            16829,
            16747,
            16748,
            16749,
            16750,
            16731,
            16732,
            16733,
            16734,
            16779,
            16780,
            16781,
            16782,
            16763,
            16764,
            16765,
            16766,
            54187,
            22798,
            46065,
        ],
        ['left-arm']: [
            30226,
            41403,
            41404,
            41405,
            41323,
            41324,
            41325,
            41326,
            41307,
            41308,
            41309,
            41310,
            41355,
            41356,
            41357,
            41358,
            41339,
            41340,
            41341,
            41342,
            53675,
            34606,
            37873
        ],
        ['right-leg']: [
            43312,
            55120,
            65478,
            53081,
            11440,
            11456
        ],
        ['left-leg']: [
            43312,
            33646,
            6884,
            41273,
            18013,
            18029
        ],
    }
}