
Config = {}

Config.vorp = true
Config.redem = false
Config.metadata = true 
-------- only have 1 enabled----------
Config.normaldrawtext = true -- 
Config.drawtext3d = false --
--------------------------------------
Config.discordid = true 
Config.webhook = true -- turn webhooks for each job on or off 
Config.adminwebhook = false -- turn admin webhook on or off 
Config.webhookavatar = "https://findicons.com/files/icons/2453/clipboard/1816/clipboard_paper.png"
Config.adminwebhooklink = "" -- input your webhook
Config.OpenMenu = 0x760A9C6F -- Key: G
Config.unemployed = "unemployed" --- make sure u set this up in vorp core config as well 
Config.salarytime = 15 -- every 30 minutes players get a salary from the jobs ledger (only if the job has a ledger set up and is included in the config below yes the money gets taken out of the ledger)
Config.maxsalary = 100 -- 30$ max salary --max salary job owners are allowed to set to ranks


Config.autocollect = true -- set to false if you dont want bills from the jobs mentioned below to be auto collected on the spot and instead go to the billing menu 
Config.autocollectjob = {"doctor","police","marshal"}

Config.Locations = { 
	--[[ Valentine = {	   -- you can add more job centers by copy pasting this 
        Pos = {x=-182.842, y=629.662, z=114.08}, -- location of job center 
        blipsprite = -272216216, -- blip sprite for job center
		Name = 'Job Center', -- blip name 
    }, ]]
    --[[ Valentine = {	   -- add more 
        Pos = {x=-182.842, y=629.662, z=114.08}, 
        blipsprite = -272216216, 
		Name = 'Job Center', 
	}, ]]
}

Config.jobs = { 
	police = {	   
        Pos = { 
            {x=-279.21, y=809.9, z=119.3},
            {x=1361.56, y=-1303.22, z=77.76},
            {x=2508.43, y=-1308.72, z=48.95},
            {x=-763.41, y=-1271.52, z=43.99},
            {x=-3624.99, y=-2601.39, z=-13.39},
            {x=2907.72, y=1312.85, z=44.93},
            {x=-1807.44, y=-348.05, z=164.70},
            {x=-5530.88,y=-2929.16,z=-1.36,},

    
        }, -- position of blip
        jobmenu = { 
            {x=-279.21, y=809.9, z=119.3},
            {x=1361.56, y=-1303.22, z=77.76},
            {x=2508.43, y=-1308.72, z=48.95},
            {x=-763.41, y=-1271.52, z=43.99},
            {x=-3624.99, y=-2601.39, z=-13.39},
            {x=2907.72, y=1312.85, z=44.93},
            {x=-1807.44, y=-348.05, z=164.70},
            {x=-5530.88,y=-2929.16,z=-1.36,},
        }, -- position of job menu
        blipsprite = 778811758, -- sprite of blip. find more here https://filmcrz.github.io/blips/
        showblip = true, -- new line
		Name = 'Police', -- name of blip
        recruitmentrank = 4,
        bossrank = 7, -- the boss rank, able to hire/fire/set salaries (make sure you add the ranks as i did in the database table called society from 0 to the boss rank)
        containerid = 1, -- this has to be a unique number that matches the number set on the database table container ! 
        containername = "Police Inv.", -- the name displayed when the container is open
        billing = true, -- allow players with this job to use billing by doing /bill amount
        webhook = "", -- if you have webhook enabled all the information important to this job will be logged both in the admin webhook and here 
        salary = true, -- (added line) enable/disable salary system.
    },

    bwb = {	   
        Pos = { 
            {x=-288.89, y=808.89, z=119.38},

        }, 
        jobmenu = { 
            {x = -782.77, y = -1285.64, z = 43.76},

        },
        blipsprite = -592068833,
		Name = 'Blackwater Bakery',
        recruitmentrank = 6,
        bossrank = 7,
        containerid = 4,
        containername = "BWB Inv.",
        billing = true,
        webhook = "https://discord.com/api/webhooks/1167992259124416563/7h4-U7fRp2barbBYYbyGeAztubzhT60Q7L8-P5H_uWneXeMsG-J3U2MplwMoU--YupCh",
        salary = true,

    },

   

    doctor = {	   
        Pos = { 
            {x=-288.89, y=808.89, z=119.38},
            {x=2976.17, y=571.99, z=44.81},
            {x=-1803.24, y=-432.46, z=158.83},
            {x=1370.36, y=-1312.08, z=77.93},
            {x=2721.72, y=-1225.92, z=50.36},
            {x=-831.95, y=-1269.82, z=43.68},
            {x=-5516.48, y=-2962.84, z=-0.81},
            {x=-3661.31, y=-2600.28, z=-13.28},
            {x=2921.79, y=1350.44, z=44.86},
        }, 
        jobmenu = { 
            {x=-288.89, y=808.89, z=119.38},
            {x=2976.17, y=571.99, z=44.81},
            {x=-1803.24, y=-432.46, z=158.83},
            {x=1370.36, y=-1312.08, z=77.93},
            {x=2721.72, y=-1225.92, z=50.36},
            {x=-831.95, y=-1269.82, z=43.68},
            {x=-5520.48, y=-2973.68, z=-0.86},
            {x=-3661.31, y=-2600.28, z=-13.28},
            {x=2921.79, y=1350.44, z=44.86},
        },
        blipsprite = -592068833,
		Name = 'Doctor',
        recruitmentrank = 1,
        bossrank = 7,
        containerid = 4,
        containername = "Doctor Inv.",
        billing = true,
        webhook = "",
        salary = true,

    },
    

}
-------------------
Config.alertsfunction = true 

Config.alerts = { 
    police = { -- job name
        command = "alertpolice",
        jobs = {"police","marshal"}, -- jobs the alert is sent to
        msg = "police help needed. check map for coords", -- alert sent to the players with the job name 
        isdoctor = false,
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
    doctor = {
        command = "alertdoctor",
        jobs = {"doctor"},
        msg = "doctor help needed. check map for coords",
        isdoctor = true,
        blip = {
            blipsprite = 2119977580,
            Name = 'Medic Alert',
        }
    },
   
}
Config.medicresponse = "resp"
Config.cancelblipcommand = "calert" -- removes alert blips
Config.alertcooldown = 60 -- seconds
Config.viewonduty = "viewduty" -- allows admins or job boss rank to viw who is on duty. for boss rank players its just /viewduty, for admins its /viewduty jobname
Config.ondutycommand = "onduty"
Config.offdutycommad = "offduty"
Config.checkduty = "checkduty"
Config.nosalaryoffduty = true -- dont pay salary to off duty players for the jobs listed below 
Config.dutyjobs = {"police","doctor"}
Config.afkoffdutytimer = 5 -- go off duty if you are alerted and afk for 5 minutes
Config.ondutyinstant = true -- instantly go on duty when command is used 
Config.ondutytime = 2.5 -- minutes 
Config.dutywebhooks = { 
    doctor = "",
    drbarber = "",
    police = "",
    marshal = "",
}

Config.dutystationsenabled = true -- 
Config.menuoption = true -- if set to true players can still use the onduty command but will be prompted to select their region
Config.dutystationjobs = {"police"}
Config.dutystationlocations = {
    ["armadillo"] = {
        coords = {x = -3620.92, y = -2606.35, z = -13.33},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Armadillo Duty Station",
        blipsprite = -1656531561,
    },
    ["blackwater"] = {
        coords = {x = -761.7, y = -1268.1, z = 44.0},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Blackwater Duty Station",
        blipsprite = -1656531561,
    },
    ["strawberry"] = {
        coords = {x = -1814.0, y = -354.8, z = 164.6},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Strawberry Duty Station",
        blipsprite = -1656531561,
    },
    ["valentine"] = {
        coords = {x = -278.4, y = 805.3, z = 119.3},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Valentine Duty Station",
        blipsprite = -1656531561,
    },
    ["annes"] = {
        coords = {x = 2908.3, y = 1308.9, z = 44.9},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Annesburg Duty Station",
        blipsprite = -1656531561,
    },
    ["rhodes"] = {
        coords = {x = 1361.95, y = -1298.9, z = 77.76},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Rhodes Duty Station",
        blipsprite = -1656531561,
    },
    ["sd"] = {
        coords = {x = 2511.99, y = -1309.1, z = 48.95},
        job = {"police","marshal"},
        showblip = true,
        blipname = "Saint Denis Duty Station",
        blipsprite = -1656531561,
    },
}

----------------
Config.Language = {
    usestation = "You Need To Use A Duty Station To Go On Duty", -- new language
    SelectedJob = "You have selected the job :", -- new language
    goonduty = "Press (G) To Go On Duty At: ", -- new language
    dutyregions = " Duty Regions", -- new language
    changingroom = "Changing Room",
    manageemployees = "Manage Employees",
    jobmenu = "Job Menu",
    nooutfits = "No saved outfits",
    outfits = "Outfits",
    yourjobis = "your job title is : ",
    hire = "Hire",
    fire = "Fire",
    setsalary = "Set Salary",
    setrank = "Set Rank",
    cantfire = "Cant Fire Yourself",
    canthire = "Cant Hire Yourself",
    youhired = "You Hired ",
    youfired = "You Fired ",
    hired = "You Were Hired as ",
    fired = "You Were Fired From ",
    changerank = "You Changed The Job Rank of ",
    rankchanged = "your Job Rank Was Changed To ",
    cantchangerank = "You Cant Change Your Own Rank",
    highestrank = "You Cant Rank Above Or Equal To The Highest Rank, Rank: ",
    Torank = " To Rank: ",
    listrank = " // Rank: ",
    confirm = "Confirm",
    playerid = "Player ID",
    rank = "Rank",
    salarys = "Salary",
    salary = "You Recieved A Salary Payment of: ",
    maxsalary = "Cannot exceed max salary of : ",
    salaryupdated = "You Updated The Salary Of Rank ",
    to = " To ",
    from = " From ",
    noledgercash = "Your Society Ledger Doesnt Have Enough Cash To Pay Salary",
    ledger = "Ledger",
    ledgercash = "Job Ledger Cash: ",
    depositcash = "Deposit Cash",
    withdrawcash = "Withdraw Cash",
    deposited = "You Deposited : ",
    invalidamount = "Invalid Amount",
    withdrew = "You Withdrew : ",
    inventory = "Inventory",
    qt = "Invalid quantity",
    carry = "You cant carry more items",
    limit = "You reached the limit for this item",
    someoneisclose = "Someone is too close to you",
    noplayer = "No Person Nearby",
    finesent = "You Sent A Bill Amount Of :",
    finerecieve = "You Recieved A Bill Amount Of :",
    bills = "Your Bills:",
    billpaid = "You Paid A Bill Amount Of: ",
    takena = " Has Taken A ",
    taken = " Has Taken ",
    put = " Deposited ",
    issuedbill = " Issued A Bill Amount Of ",
    paidbill = " Paid A Bill Amount Of",
    withdrews = " Withdrew An Amount Of ",
    deposits = " Deposited An Amount Of ",
    billss = "Bills:",
    viewbills = "View Bills",
    drawtextjobmenu = "Press G For Job Menu", 
    drawtextjobcenter = "Press G For Job Center", 
    nocash1 = "You Dont Have Enough Money", 
    maxslots = "cant store more items, slot limit is ", -- newline	
    dothis = "~e~do /",
    toremovenoti = " to remove notifications",
    needsyourhelp = "someone needs your help, check your map for a blip do ~e~(/",
    needsyourhelp2 = "~e~someone needs your help, check your map for a blip",
    torespond = ")~q~ to respond", 
    docontheway = "~e~Doctor is on the way",
    nodoc = "~e~ No Doctors Available",
    youonduty = "~e~ You Are on Duty",
    youoffduty = "~e~ You Are off Duty",
    duty = " On Duty",
    offD = " Off Duty",
    serverid = "Server ID: ",
    noneavailable = "None Available", 
    waitafew = "Cant Spam Wait a Few", 
    alertsent = "Alert Sent", 
    afkoffduty = "You were taken off duty for being AFK",
    wentonduty = "Is on Duty",
    wentoffduty = "Is off Duty",
    cantgoonduty = "cant go on duty if hogtied,dead or cuffed"
}
