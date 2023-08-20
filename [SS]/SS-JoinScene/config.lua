-- Author 'SIREC#0001'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {

-- CONFIG NEW CHARACTER
UseSceneNewCharacter = true, -- INTRO FOR NEW CHARACTERS ?
NewScene1 = "cutscene_mp_freemodetutorial", -- PUT false TO LEAVE ONLY CITY INTRO
NewScene2 = "cutscene_mar6_train", -- PUT false TO LEAVE ONLY CITY INTRO
-- CONFIG NEW CHARACTER
    
-- CONFIG RE-JOIN
UseRejoinScene = true, -- WAKEUP SCENE FOR EXISTING CHARACTERS ?
FewMomentLater = "Title_Gen_FewHoursLater",
-- CONFIG RE-JOIN
    
Cities = {
    [1] = {coords = vector3(-169.43858337402344, 628.2980346679688, 114.13208770751952), label = "Valentine", text = "Welcome To Valentine, Dude"},
	[2] = {coords = vector3(-726.5482177734375, -1242.9404296875, 44.83410263061523), label = "BlackWater", text = "Welcome To BlackWater, Dude"},
    [3] = {coords = vector3(1226.9034423828125, -1303.65234375, 77.0045394897461), label = "Rhodes", text = "Welcome To Rhodes, Dude"},
    [4] = {coords = vector3(2721.853515625, -1446.0433349609375, 46.32825088500976), label = "Saint Denis", text = "Welcome To Saint Denis, Dude"},
    [5] = {coords = vector3(-1831.0718994140625, -411.4170837402344, 162.50518798828125), label = "Strawberry", text = "Welcome To Strawberry, Dude"},
    [6] = {coords = vector3(2944.730712890625, 1282.3148193359375, 44.72583389282226), label = "Annesburg", text = "Welcome To Annesburg, Dude"},
},
    
IntroTexts = {
[1] = "Welcome to SERVER NAME",
[2] = "Your story is ready to begin...",
[3] = "... in the middle of the wilderness !",
[4] = "Find your friends and face your rivals !",
[5] = "And the most important thing, stay alive!",
[6] = "You are almost there, take care of yourself and...",
}
}