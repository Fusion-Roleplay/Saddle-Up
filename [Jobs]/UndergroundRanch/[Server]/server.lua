
--------------------------------------------------------------------------------------------------------------
--------------------------- Underground Ranching Server Stuff ------------------------------------------------
--------------------------------------------------------------------------------------------------------------
------------- This file only contains events to make the script synchronized and functional :) ---------------
--------------------------------------------------------------------------------------------------------------
-------------------------------------- VARIABLES -------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
local ranchesData, animalsData, statsData = {}, {}, {}
local GeneralRanchId = 1
--------------------------------------------------------------------------------------------------------------
-------------------------------------- RANCH STUFF -----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
 
RegisterCommand("printidentifiers", function(source, args, rawCommand)
    local steamid = GetPlayerIdentifierByType(source, "steam")
    local license = GetPlayerIdentifierByType(source, "license")
	local xblid = GetPlayerIdentifierByType(source, "xbl")
	local liveid = GetPlayerIdentifierByType(source, "live")
	local discordid = GetPlayerIdentifierByType(source, "discord")
	local license2 = GetPlayerIdentifierByType(source, "license2")
	local ipid = GetPlayerIdentifierByType(source, "ip")
	print("steamid: "..steamid)
	print("licenseid: "..license)
	print("xblid: "..xblid)
	print("liveid: "..liveid)
	print("discordid: "..discordid)
	print("license2: "..license2)
	print("ipid: "..ipid)
end)

-- Buy a ranch
RegisterServerEvent("Underground:Ranch:BuyRanch")
AddEventHandler("Underground:Ranch:BuyRanch", function(ranchid, charid)
	local money = CheckMoney(source)
	if money >= Config.Ranches[ranchid].price then
		local steamid = GetPlayerIdentifierByType(source, "steam")
		TriggerEvent("Underground:Ranch:DBBuy", source, ranchid, steamid, charid)
		TriggerEvent("Underground:Ranch:TakeMoney", source, Config.Ranches[ranchid].price)
		TriggerClientEvent("Underground:Ranch:Notify", source, "You bought a ranch for $"..Config.Ranches[ranchid].price)
	else
		TriggerClientEvent("Underground:Ranch:Notify", source, "You don't have enough money to buy this ranch.")
	end
end)

-- Sell a ranch
RegisterServerEvent('Underground:Ranch:Sell')
AddEventHandler('Underground:Ranch:Sell', function(ranchid)
	TriggerEvent('Underground:Ranch:GiveMoney', source, Config.Ranches[ranchid].price)
	TriggerEvent('Underground:Ranch:DBSell', source, ranchid)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You sold your ranch for $"..Config.Ranches[ranchid].price)
end)

-- Transfer a ranch
RegisterServerEvent('Underground:Ranch:Transfer')
AddEventHandler('Underground:Ranch:Transfer', function(ranchid, steamid, charid)
	TriggerEvent('Underground:Ranch:DBSell', source, ranchid)
	TriggerEvent('Underground:Ranch:DBBuy', source, ranchid, steamid, charid)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You transferred your ranch to "..charid.."("..steamid..")")
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------------- EMPLOYEE STUFF --------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Add an employee
RegisterServerEvent('Underground:Ranch:AddEmployee')
AddEventHandler('Underground:Ranch:AddEmployee', function(ranchid, steamid, charid)
	TriggerEvent('Underground:Ranch:DBAddEmployee', source, ranchid, steamid, charid)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You added "..charid.."("..steamid..") to your ranch.")
end)

-- Remove an employee
RegisterServerEvent('Underground:Ranch:RemoveEmployee')
AddEventHandler('Underground:Ranch:RemoveEmployee', function(ranchid, steamid, charid)
	TriggerEvent('Underground:Ranch:DBRemoveEmployee', source, ranchid, steamid, charid)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You removed "..charid.."("..steamid..") from your ranch.")
end)

--------------------------------------------------------------------------------------------------------------
---------------------------------------- ANIMAL STUFF --------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
function randomGender()
	local male = "male"
	local female = "female"
	local chance = math.random(1, 100)
	if chance > 50 then
		return male
	else
		return female
	end
end

function animalIdGenerator()
local newanimalid = math.random(1, 999999)
MySQL.Async.fetchAll('SELECT * FROM underground_animals', {}, function(result)
	if result == nil then
		return newanimalid
	end
	for i = 1, #result do
		if result[i].animalid == newanimalid then
			newanimalid = animalIdGenerator()
			return newanimalid
		end
	end
end)
return newanimalid
end

-- Buy an animal
RegisterServerEvent('Underground:Ranch:BuyAnimal')
AddEventHandler('Underground:Ranch:BuyAnimal', function(ranchid, type, model, color, price, name)
	local _source = source
    local animalcount = 0
	ranchid = GeneralRanchId
	MySQL.Async.fetchAll('SELECT animaltype FROM underground_animals WHERE ranchid = @ranchid', {['@ranchid'] = ranchid}, function(result)
        if result == nil then
			print("nil result")
            animalcount = 0
		else
        	for k,v in pairs(result) do
				if v.animaltype == type then
            		animalcount = animalcount + 1
				end
			end
			for k, v in pairs(Config.Ranches[GeneralRanchId].zones) do
				if v.name == type then
					if animalcount >= v.animalLimit then
						   TriggerClientEvent("Underground:Ranch:Notify", _source, "You can't buy more animals, you reached the limit.")
						return
					end
				end		
			end
			local money = CheckMoney(_source)
			if money >= price then
				local animaltype = type
				local animalmodel = model
				local animalcolor = color
				local animalname = name
				local animalgender = tostring(randomGender())
				local animalage = 0
				local collectAmount = 0
				local lastProductTime = 0
				local animalhunger = 0
				local animalthirst = 0
				local animalHealth = 100
				local animalid = animalIdGenerator()
				TriggerEvent('Underground:Ranch:DBBuyAnimal', _source, ranchid, animalid, animaltype, animalmodel, animalcolor ,animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth)
				TriggerEvent('Underground:Ranch:TakeMoney', _source, price)
				TriggerClientEvent("Underground:Ranch:Notify", _source, "You bought an animal for $"..price)
				TriggerClientEvent("Underground:Ranch:SpawnAnimalAfterBuy", _source, animalmodel, animalcolor, animalid, ranchid, type)
			else
				TriggerClientEvent("Underground:Ranch:Notify", _source, "You don't have enough money to buy this animal.")
			end
		end
    end)
end)

-- Sell an animal
RegisterServerEvent('Underground:Ranch:RemoveAnimal')
AddEventHandler('Underground:Ranch:RemoveAnimal', function(ranchid, animalid, price)
	TriggerEvent('Underground:Ranch:DBRemoveAnimal', source, ranchid, animalid, price)
	TriggerEvent('Underground:Ranch:GiveMoney', source, price)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You sold your animal for $"..price)
end)

-- Update an animal
RegisterServerEvent('Underground:Ranch:UpdateAnimalStats')
AddEventHandler('Underground:Ranch:UpdateAnimal', function(ranchid, animalId, stats)
	local newstats = json.decode(stats)
	local newranchid = newstats.ranchid
	local animalid = newstats.animalid
	local animaltype = newstats.animaltype
	local animalname = newstats.animalname
	local animalgender = newstats.animalgender
	local animalage = newstats.animalage
	local collectAmount = newstats.collectAmount
	local lastProductTime = newstats.lastProductTime
	local animalhunger = newstats.animalhunger
	local animalthirst = newstats.animalthirst
	local animalHealth = newstats.animalHealth
	local breedingState = newstats.breedingState
	local breedingTime = newstats.breedingTime
	local animalPosStatus = newstats.animalPosStatus
	
	TriggerEvent('Underground:Ranch:DBUpdateAnimalStats', source, ranchid, newranchid, animalid, animaltype, animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth, breedingState, breedingTime, animalPosStatus)
	TriggerClientEvent("Underground:Ranch:Notify", source, "You updated your animal.")
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------- Data Requests ---------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Get ranches data
RegisterServerEvent('Underground:Ranch:GetRanches')
AddEventHandler('Underground:Ranch:GetRanches', function()
	TriggerEvent('Underground:Ranch:DBGetRanches', source)
end)

-- Return ranches data
RegisterServerEvent('Underground:Ranch:GetAnimals')
AddEventHandler('Underground:Ranch:GetAnimals', function(ranchid, animalid, health, hunger, thirst)
	TriggerEvent('Underground:Ranch:DBGetAnimals', source, ranchid, animalid, health, hunger, thirst)
end)

-- Return animals data
RegisterServerEvent('Underground:Ranch:GetAnimalStats')
AddEventHandler('Underground:Ranch:GetAnimalStats', function(ranchid, animalid)
	TriggerEvent('Underground:Ranch:DBGetAnimalStats', source, ranchid, animalid)
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------------- Server Returns --------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- Return animal stats data
RegisterServerEvent('Underground:Ranch:ReturnAnimals')
AddEventHandler('Underground:Ranch:ReturnAnimals', function(src, ranchid, animals)
	animalsData = animals
	TriggerClientEvent('Underground:Ranch:CLReturnAnimals', src, ranchid, animals)
end)
-- Return animal stats data
RegisterServerEvent('Underground:Ranch:ReturnAnimalStats')
AddEventHandler('Underground:Ranch:ReturnAnimalStats', function(src, ranchid, animalid, stats)
	statsData = stats
	TriggerClientEvent('Underground:Ranch:CLReturnAnimalStats', src, ranchid, animalid, stats)
end)

-- Return ranches data
RegisterServerEvent('Underground:Ranch:ReturnRanches')
AddEventHandler('Underground:Ranch:ReturnRanches', function(src, ranches)
	ranchesData = ranches
	TriggerClientEvent('Underground:Ranch:CLReturnRanches', src, ranches)
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
