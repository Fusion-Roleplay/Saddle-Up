MedicineItems = {
    ['bandage'] = {
        healProbability = {
            ['bleeding'] = 1.0,
            ['cold'] = 0.001 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = 60000,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 10000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 20,
        language = {
            cureExpired = "The bandage has fallen, you start bleeding again. Put on a bandage and visit a doctor.",
            applying = "Applying bandage...",
            applied = "Bandage applied, you stopped bleeding.",
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = nil,
        animation = nil,
        -- if you don't want to use scenario set it to nil
        scenario = 'WORLD_HUMAN_CROUCH_INSPECT',
        -- the next damage type, used for the bandaged state
        damageType = 'bandaged'
    },
    ['antibiotic'] = {
        healProbability = {
            ['cold'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 5000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 20,
        language = {
            applying = "Drinking antibiotic...",
            applied = "The effect of the antibiotics makes you feel better.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    },
    ['antipoison'] = {
        healProbability = {
            ['snakeBite'] = 1.0 
        },
        -- milliseconds, time after the cure will stop working
        -- (-1 for complete cure)
        cureDuration = -1,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 5000,
        -- health to add when used
        healthAmount = 0,
        -- inner core health added from 0 to 100
        innerCoreHealth = 0,
        language = {
            applying = "Drinking anti-poison remedy...",
            applied = "The effect of the remedy makes you feel better.",
            --cureExpired = "" -- no need for that if cureDuration is -1
        },
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "amb_rest_drunk@world_human_drinking@male_a@idle_a",
        animation = "idle_a",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
    }
}

-- Items for reviving unconscious people
ReviveItems = {
    ['syringe'] = {
        reviveProbability = 1.0,
        -- milliseconds, time it takes to apply medication (progressbar)
        applyDuration = 20000,
        -- health to add when used
        healthAmount = 200,
        -- inner core health added from 0 to 100
        innerCoreHealth = 20,
        -- if you don't want to use animation set those to nil and set scenario instead
        animationDict = "mech_revive@unapproved",
        animation = "revive",
        -- if you don't want to use scenario set it to nil
        scenario = nil,
        language = {
            applying = "Injecting syringe...",
        },
        -- allowed jobs to use it, if you want it to be usable for anyone just leave it empty
        allowedJobs = { 'doctor' }
    }
}