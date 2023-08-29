--------------------------------------------------------------------------------------------------------------
--------------------------- Underground Ranching Database Manager --------------------------------------------
--------------------------------------------------------------------------------------------------------------
----- This file only contains events to manage the database. Do not add any other events to this file. -------
--------------------------------------------------------------------------------------------------------------
-------------------------------------- DB SET ----------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------


RegisterServerEvent('Underground:Ranch:DBBuy')
AddEventHandler('Underground:Ranch:DBBuy', function(src, ranchid, steamid, charid)
	local _source = src
    MySQL.Async.execute("INSERT INTO underground_ranches (ranchid, name, ownercharid, ownersteamid) VALUES (@ranchid, @name, @ownercharid, @ownersteamid)", {['ranchid'] = ranchid, ['name'] = "Ranch", ['ownercharid'] = charid, ['ownersteamid'] = steamid})
end)

RegisterServerEvent('Underground:Ranch:DBBuyAnimal')
AddEventHandler('Underground:Ranch:DBBuyAnimal', function(src, ranchid, animalid, animaltype, animalmodel, animalcolor ,animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth, breedingState, breedingTime, animalPosStatus)
    print(src, ranchid, animalid, animaltype, animalmodel, animalcolor ,animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth)
    local _source = src
    MySQL.Async.execute("INSERT INTO underground_animals (ranchid, animalid, animaltype, animalmodel, animalcolor, animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth, breedingState, breedingTime, animalPosStatus) VALUES (@ranchid, @animalid, @animaltype, @animalmodel, @animalcolor, @animalname, @animalgender, @animalage, @collectAmount, @lastProductTime, @animalhunger, @animalthirst, @animalHealth, @breedingState, @breedingTime, @animalPosStatus)", {['ranchid'] = ranchid, ['animalid'] = animalid, ['animal'] = "Animal", ['animaltype'] = animaltype, ['animalmodel'] = animalmodel, ['animalcolor'] = animalcolor, ['animalname'] = animalname, ['animalgender'] = animalgender, ['animalage'] = animalage, ['collectAmount'] = collectAmount, ['lastProductTime'] = lastProductTime, ['animalhunger'] = animalhunger, ['animalthirst'] = animalthirst, ['animalHealth'] = animalHealth, ['breedingState'] = "NotBreeding", ['breedingTime'] = 0, ['animalPosStatus'] = "InPen"})
end)

RegisterServerEvent('Underground:Ranch:DBAddEmployee')
AddEventHandler('Underground:Ranch:DBAddEmployee', function(src, ranchid, steamid, charid)
    local _source = src
    MySQL.Async.execute("INSERT INTO underground_employees (ranchid, position, steamid, charid, tasksperformed, salary) VALUES (@ranchid, @position, @steamid, @charid, @tasksperformed, @salary)", {['ranchid'] = ranchid, ['position'] = "Worker", ['steamid'] = steamid, ['charid'] = charid, ['tasksperformed'] = 0, ['salary'] = 0})
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------------- DB UPDATE -------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Underground:Ranch:DBUpdateRanchStats')
AddEventHandler('Underground:Ranch:DBUpdateRanchStats', function(src, ranchid, clean, haybales, water)
    local _source = src
    MySQL.Async.execute("UPDATE underground_ranches Set clean=@clean WHERE ranchid=@ranchid", {['clean'] = clean, ['ranchid'] = ranchid})
    MySQL.Async.execute("UPDATE underground_ranches Set haybales=@haybales WHERE ranchid=@ranchid", {['haybales'] = haybales, ['ranchid'] = ranchid})
    MySQL.Async.execute("UPDATE underground_ranches Set water=@water WHERE ranchid=@ranchid", {['water'] = water, ['ranchid'] = ranchid})
end)


RegisterServerEvent('Underground:Ranch:DBTransfer')
AddEventHandler('Underground:Ranch:DBTransfer', function(src, ranchid, steamid, charid)
    local _source = src
    MySQL.Async.execute("UPDATE underground_ranches Set ownercharid=@ownercharid WHERE ranchid=@ranchid", {['ownercharid'] = charid, ['ranchid'] = ranchid})
    MySQL.Async.execute("UPDATE underground_ranches Set ownersteamid=@ownersteamid WHERE ranchid=@ranchid", {['ownersteamid'] = steamid, ['ranchid'] = ranchid})
end)

RegisterServerEvent('Underground:Ranch:DBUpdateAnimalStats')
AddEventHandler('Underground:Ranch:DBUpdateAnimalStats', function(src, ranchid, newranchid, animalid, animaltype, animalname, animalgender, animalage, collectAmount, lastProductTime, animalhunger, animalthirst, animalHealth, breedingState, breedingTime, animalPosStatus)
    local _source = src
    if newranchid == 0 then
        newranchid = ranchid
    end
    MySQL.Async.execute("UPDATE underground_animals Set ranchid=@ranchid WHERE ranchid=@ranchid AND animalid=@animalid", {['ranchid'] = newranchid,['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animaltype=@animaltype WHERE ranchid=@ranchid AND animalid=@animalid", {['animaltype'] = animaltype, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalname=@animalname WHERE ranchid=@ranchid AND animalid=@animalid", {['animalname'] = animalname, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalgender=@animalgender WHERE ranchid=@ranchid AND animalid=@animalid", {['animalgender'] = animalgender, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalage=@animalage WHERE ranchid=@ranchid AND animalid=@animalid", {['animalage'] = animalage, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set collectAmount=@collectAmount WHERE ranchid=@ranchid AND animalid=@animalid", {['collectAmount'] = collectAmount, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set lastProductTime=@lastProductTime WHERE ranchid=@ranchid AND animalid=@animalid", {['lastProductTime'] = lastProductTime, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalhunger=@animalhunger WHERE ranchid=@ranchid AND animalid=@animalid", {['animalhunger'] = animalhunger, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalthirst=@animalthirst WHERE ranchid=@ranchid AND animalid=@animalid", {['animalthirst'] = animalthirst, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalHealth=@animalHealth WHERE ranchid=@ranchid AND animalid=@animalid", {['animalHealth'] = animalHealth, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set breedingState=@breedingState WHERE ranchid=@ranchid AND animalid=@animalid", {['breedingState'] = breedingState, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set breedingTime=@breedingTime WHERE ranchid=@ranchid AND animalid=@animalid", {['breedingTime'] = breedingTime, ['ranchid'] = ranchid, ['animalid'] = animalid})
    MySQL.Async.execute("UPDATE underground_animals Set animalPosStatus=@animalPosStatus WHERE ranchid=@ranchid AND animalid=@animalid", {['animalPosStatus'] = animalPosStatus, ['ranchid'] = ranchid, ['animalid'] = animalid})
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------------- DB GET ----------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Underground:Ranch:DBGetAnimalStats')
AddEventHandler('Underground:Ranch:DBGetAnimalStats', function(src)
    local _source = src
    MySQL.Async.fetchAll('SELECT * FROM underground_animals', {}, function(result)
        TriggerClientEvent('Underground:Ranch:DBGetAnimalStats', _source, result)
    end)
end)

RegisterServerEvent('Underground:Ranch:DBGetEmployeeStats')
AddEventHandler('Underground:Ranch:DBGetEmployeeStats', function(src)
    local _source = src
    MySQL.Async.fetchAll('SELECT * FROM underground_employees', {}, function(result)
        TriggerClientEvent('Underground:Ranch:DBGetEmployeeStats', _source, result)
    end)
end)

RegisterServerEvent('Underground:Ranch:DBGetRanches')
AddEventHandler('Underground:Ranch:DBGetRanches', function(src)
    local _source = src
    MySQL.Async.fetchAll('SELECT * FROM underground_ranches', {}, function(result)
        TriggerClientEvent('Underground:Ranch:DBGetRanches', _source, result)
        print(result)
    end)
end)

--------------------------------------------------------------------------------------------------------------
-------------------------------------- DB REMOVE -------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

RegisterServerEvent('Underground:Ranch:DBRemoveAnimal')
AddEventHandler('Underground:Ranch:DBRemoveAnimal', function(src, ranchid, animal, animalcolor, type, amount, animalId)
    local _source = src
    MySQL.Async.execute("DELETE FROM underground_animals WHERE ranchid=@ranchid AND animalid=@animalid", {['ranchid'] = ranchid, ['animalid'] = animalId})
end)

RegisterServerEvent('Underground:Ranch:DBRemoveEmployee')
AddEventHandler('Underground:Ranch:DBRemoveEmployee', function(src, ranchid, steamid, charid)
    local _source = src
    MySQL.Async.execute("DELETE FROM underground_employees WHERE ranchid=@ranchid AND steamid=@steamid AND charid=@charid", {['ranchid'] = ranchid, ['steamid'] = steamid, ['charid'] = charid})
end)

RegisterServerEvent('Underground:Ranch:DBRemoveAllEmployees')
AddEventHandler('Underground:Ranch:DBRemoveAllEmployees', function(src, ranchid)
    local _source = src
    MySQL.Async.execute("DELETE FROM underground_employees WHERE ranchid=@ranchid", {['ranchid'] = ranchid})
end)

RegisterServerEvent('Underground:Ranch:DBSell')
AddEventHandler('Underground:Ranch:DBSell', function(src, ranchid)
    local _source = src
    MySQL.Async.execute("DELETE FROM ranch WHERE ranchid=@ranchid", {['ranchid'] = ranchid})    
    MySQL.Async.execute("DELETE FROM underground_employees WHERE ranchid=@ranchid", {['ranchid'] = ranchid})
    MySQL.Async.execute("DELETE FROM underground_animals WHERE ranchid=@ranchid", {['ranchid'] = ranchid})
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------