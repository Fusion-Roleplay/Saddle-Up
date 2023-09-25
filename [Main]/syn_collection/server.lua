local VorpCore = {}
local VORP
local VorpInv
local automaticbill = false 
local automaticbilldiscord = false 
TriggerEvent("getCore",function(core)
	VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


Timer = function()
	local time = os.time()
  local d, h, m = os.date('*t',time).day, os.date('*t',time).hour, os.date('*t',time).min
    if d == Config.day and h == Config.hour and m == Config.minute then
		if automaticbill == false then  
			TriggerEvent("syn_society:autocollect")
		end
	elseif d == (Config.day-1) and h == Config.hour and m == Config.minute then
		if Config.webhook then 
			if automaticbilldiscord == false then  
				telldiscord()
			end
		end
    end
	Citizen.SetTimeout(60000, Timer)
end
Citizen.SetTimeout(0, Timer)


function isonline(charid)
	local players = GetPlayers()
	for k,v in pairs(players) do 
		local character = VorpCore.getUser(v).getUsedCharacter
		local charidx = character.charIdentifier
		if charid == charidx then 
			return true, v, character
		end
	end
	return false, 0, 0
end

function hasvalue(list,charid)
	for k,v in pairs(list) do 
		if k == charid then 
			return true 
		end
	end
	return false 
end
function hasvalue2(list2,job)
	for k,v in pairs(list2) do 
		if k == job then 
			return true 
		end
	end
	return false 
end

--[[ Citizen.CreateThread(function()
	Citizen.Wait(500)
	telldiscord()
	TriggerEvent("syn_society:autocollect")
end) ]]

RegisterServerEvent("syn_society:autocollect")
AddEventHandler("syn_society:autocollect", function()
	automaticbill = true 
	local list = {}
	local list2 = {}
	exports["ghmattimysql"]:execute("SELECT * FROM bills", {}, function(result)
		if result[1] ~= nil then
			for i=1, #result, 1 do
				local charid = result[i].charidentifier
				if hasvalue(list,charid) then 
					list[charid] = list[charid] + result[i].amount
				else
					list[charid] = result[i].amount
				end
				local job =  result[i].job
				if hasvalue2(list2,job) then 
					list2[job] = list2[job] + result[i].amount
				else
					list2[job] = result[i].amount
				end
			end
			for k,v in pairs(list2) do 
				exports.ghmattimysql:execute('SELECT ledger FROM society_ledger WHERE job=@job', {['job'] = k}, function(result2)
					if result2[1] ~= nil then
						local ledger = result2[1].ledger
						ledger = ledger + v
						exports.ghmattimysql:execute("UPDATE society_ledger Set ledger=@ledger WHERE job=@job", {['ledger'] = ledger,['job'] = k})
					end
				end) 
			end
			for k,v in pairs(list) do 
				local isonline , id, character = isonline(k)
				if isonline then 
					character.removeCurrency(0, v)
					TriggerClientEvent("vorp:TipRight", id, Config.language.billcollection..v, 30000)
				else
					exports.ghmattimysql:execute('SELECT money FROM characters WHERE charidentifier=@charidentifier', {['charidentifier'] = k}, function(result)
						local cash = result[1].money
						local money = cash - v 
						exports.ghmattimysql:execute("UPDATE characters Set money=@money WHERE charidentifier=@charidentifier", {['charidentifier'] = k,['money'] = money})

					end)
				end
				exports.ghmattimysql:execute("DELETE FROM bills WHERE charidentifier=@charidentifier", {["charidentifier"] = k})
			end
		end
	end)
end)
function telldiscord()
	automaticbilldiscord = true
    local webhook = Config.webhooklink
    local title = Config.language.title
    local avatar = Config.webhookavater
    local embeds = {
        {
            ["title"] = Config.language.taken,
            ["description"] = Config.language.discordmsg,
            ["color"] = 4777493,
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = botname,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end