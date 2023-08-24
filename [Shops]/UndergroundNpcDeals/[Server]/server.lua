local checkPD = 0

-- vorp stuff
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local Inventory = exports.vorp_inventory:vorp_inventoryApi()
--local Character = VorpCore.getUser(source).getUsedCharacter
function getDistance(A, B)
    local x = B.x - A.x
    local y = B.y - A.y
    local z = B.z - A.z
    return math.sqrt((x ^ 2) + (y ^ 2) + (z ^ 2))
end

-------------------------------------------------WEBHOOK------------------------------------

function SendWebhook(webhook, source, text)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
    	local User = VorpCore.getUser(source)
    	local Character = User.getUsedCharacter
    	local playerName = Character.firstname
	local playerLame = Character.lastname
	local data = "NPC DEAL ➝ ".. time .. ' : ' .. playerName ..' '..playerLame..' ➝ ' .. text
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = data}), { ['Content-Type'] = 'application/json' })
end
---------------------------------function check PD requirement-----------------------
function checkPDreq()
    local users = GetPlayers()
    local coponline = 0

    for _k,_v in pairs(users) do
        local users = 1--VorpCore.getUser(_v)
        local character = 1--Users.getUsedCharacter
        local job = police
        
        if job == Config.job[1] then
            coponline = coponline + 1
        end   
    end
    
    if coponline < Config.minLaw then
        return(0)
    end
    return(1)

end

RegisterServerEvent('FrankieSellToNPC:CheckTabAndSellItMyGuy')
AddEventHandler('FrankieSellToNPC:CheckTabAndSellItMyGuy', function(Coords)
    
    
    local _source = source
    local kis = math.random(1,2)
    local AmountToSell = math.random(1,2)
	local luck = math.random(1,4)
    local count = 0
    local Character = 1
    local sellFcked = 0
    local dis = getDistance(Coords, Config.coordinates[1])

    print(json.encode(dis))

--------------------------------------coords check----------------------------------------
    if  (Config.distance - dis) > 0 then
        sellFcked = 1
--    else
--        sellDcked = 0
    end

--------------------------------------CHECK PD----------------------------------------

    
    if checkPD == 1 then
        print('Not the best time for this... (Not enough cops online)')
    elseif checkPD == 0 then --0 e 1 trocados
        
 --------------------------------------------------------------------------------  
        local randomitem = 0
        local playeritem = {}
        local _x = 0
        for _k,_v in pairs(Config.item) do
            if Inventory.getItemCount(_source, _v) ~= nil then
                _x = _x + 1
                playeritem[_x] = _v
            end
        end

        if _x > 0 then
            randomitem = playeritem [math.random(1,_x)]
            count = Inventory.getItemCount(_source, randomitem)
        end
 
        if sellFcked == 1 then
            if _x == 0 then
                print('_x == 0 ...', 6000)    
            
            
            else 
                print(json.encode(luck))
                if luck > 4 then
                    print('No luck...', 6000)
                else
                    print(json.encode(count))
                    print(json.encode(randomitem))
                    if count >= AmountToSell then
                        Inventory.subItem(_source, randomitem, AmountToSell)
                        local price = kis * AmountToSell
                        local text = AmountToSell.. ' ' ..randomitem.. ' for ' ..price..' dollars ' 
                        --Character.addCurrency(0 , price)
                        print('You sold '..AmountToSell.. ' ' ..randomitem.. ' for ' ..price..' dollars ', 6000)
                        local webhook = Config.WebHook
  	                    SendWebhook(webhook, _source, text)
                    else
                        print('He wanted '..AmountToSell..' '..randomitem..' and you have less!') 
                    end
                end
            end
        else
            print('Sell fucked 0 ...', 6000)
        end
    end
end)


-----police notify-----------
RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords)
    --[[checkPD = checkPDreq()
    
    
    if checkPD == 1 then
        print(json.encode(checkPD))
        for each, player in ipairs(players) do
            TriggerEvent("vorp:getCharacter", player, function(user)
                if user ~= nil then
                    if user.job == Config.job[1] then
                        TriggerClientEvent("Witness:ToggleNotification2", player, coords)
                    end
                end
            end)
        end
    end]]
    print('notify police')
end)