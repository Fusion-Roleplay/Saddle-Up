local blips = {}
local inmenu = false 
local openmenuprompt
local prompts = GetRandomIntInRange(0, 0xffffff)
local allserveritems = {}
local locational = {}
local activeshopinfo = {}
local playershopblips = {}
local gotinfo = false 
local canshop = true 
local charid
local checking = false 
local activeshopid 
local isownerinventory = false 
local inmenustatus = false 
local changelocational = false 
local amountx = 0 
local pricex = 0
local playerjob 
local renderednpc = {}
local societylocational = {}
local societyshopblips = {}
local issociety = false 
local playerrank
local isboss = false 
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)



function closemenu()
    if inmenu then 
        inmenu = false 
        TriggerEvent("inv:dropstatus",true)
        MenuData.CloseAll()
        FreezeEntityPosition(PlayerPedId(),false)
	    ClearPedTasks(PlayerPedId())
        if activeshopid ~= nil then 
            if changelocational == true then 
                local infolocation 
                if issociety then 
                    infolocation = societylocational[activeshopid]
                else
                    infolocation = locational[activeshopid]
                end
                TriggerServerEvent("syn_store:changelocational",activeshopid,infolocation,issociety)
                changelocational = false 
            end
            if issociety then 
                TriggerServerEvent("syn_store:outofstore2",activeshopid)
                issociety = false 
                isboss = false 
            else
                TriggerServerEvent("syn_store:outofstore",activeshopid)
            end
            activeshopid = nil 
        end
        amountx = 0 
        pricex = 0
    end
end
AddEventHandler('menuapi:closemenu', function()
    closemenu()
end)

AddEventHandler("syn:closeinv", function()
    if not isownerinventory then 
        closemenu()
    else
        isownerinventory = false 
        shopownermenu(activeshopid)
    end
end)

RegisterNetEvent("syn_store:recjob")
AddEventHandler("syn_store:recjob", function(x,y,z)
    playerjob = x 
    playerrank = y
    isboss = z 
    checking = false 
end)

AddEventHandler("syn_scene:stopscene", function(x)
    canshop = x
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(x)
  charid = x 
  TriggerServerEvent("syn_store:getserveritems")
  TriggerServerEvent("syn_store:getplayershops")
end)
RegisterNetEvent("syn_store:recserveritems")
AddEventHandler("syn_store:recserveritems", function(x)
    allserveritems = x 
end)
RegisterNetEvent("syn_store:reccharid")
AddEventHandler("syn_store:reccharid", function(x)
  charid = x 
end)

RegisterNetEvent("syn_store:recactiveshop")
AddEventHandler("syn_store:recactiveshop", function(x)
    activeshopinfo = x
    checking = false 
end)
RegisterNetEvent("syn_store:recinmenustatus")
AddEventHandler("syn_store:recinmenustatus", function(x)
    inmenustatus = x
    checking = false 
end)
local movingshop = false 
RegisterNetEvent("syn_store:recallowmoveshop")
AddEventHandler("syn_store:recallowmoveshop", function(allowmove,locationalx)
    locational = locationalx
    if allowmove then 
        FreezeEntityPosition(PlayerPedId(),false)
	    ClearPedTasks(PlayerPedId())
        movingshop = true 
    else
        TriggerEvent("vorp:TipBottom", language.notenoughcash2..Config.moveshopcost, 2000)
        closemenu()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        if  movingshop then 
            sleep = false 
            drawtext(language.reloccommand..Config.relocatecommand, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
        if sleep then 
            Wait(500)
        end
    end
end)


function rendernpc(k)
    if renderednpc[k] == nil then 
        renderednpc[k] = {state = false,npc = nil} 
    end
    if renderednpc[k].state == false then
        renderednpc[k].state  = true 
        RequestModel(Config.npc[k].npcmodel)
        while not HasModelLoaded(Config.npc[k].npcmodel) do                
            Wait(100)
        end
        local npc = CreatePed(Config.npc[k].npcmodel, Config.npc[k].coords.x, Config.npc[k].coords.y, Config.npc[k].coords.z, Config.npc[k].coords.h, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        Citizen.InvokeNative(0xA91E6CF94404E8C9,npc)
        if Config.npc[k].grounded then 
            local height = 100
            local foundground, groundZ, normal  = GetGroundZAndNormalFor_3dCoord(Config.npc[k].coords.x, Config.npc[k].coords.y, height + 0.0)
            while not foundground do 
            	height = height + 10
            	foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(Config.npc[k].coords.x, Config.npc[k].coords.y, height + 0.0)
            	Wait(100)
            end
            SetEntityCoords(npc, Config.npc[k].coords.x, Config.npc[k].coords.y, groundZ)
        end
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true) 
        SetBlockingOfNonTemporaryEvents(npc, true) 
        SetModelAsNoLongerNeeded(Config.npc[k].npcmodel)
        renderednpc[k].npc  = npc
    end
end
-- logic to delete npcs
function derendernpc(k)
    if renderednpc[k] == nil then 
        renderednpc[k] = {state = false,npc = nil} 
    end
    if renderednpc[k].state == true then
        renderednpc[k].state = false  
        if renderednpc[k].npc ~= nil then 
            DeleteEntity(renderednpc[k].npc)
            renderednpc[k].npc = nil  
        end
    end
end

-- logic to find distance of player to npcs that need rendering 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        local playercoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.npc) do 
            local dist = GetDistanceBetweenCoords(playercoords,v.coords.x,v.coords.y,v.coords.z, true)
            if v.coords.r > dist then 
                rendernpc(k)
            else
                derendernpc(k)
            end
        end
        Wait(500)
    end
end)

RegisterCommand(Config.relocatecommand, function(source, args, rawCommand)
    if movingshop then 
        local coords = GetEntityCoords(PlayerPedId())
        if issociety then 
            if not tooclose(societylocational,coords) then 
                TriggerServerEvent("syn_store:takemovecash")
                movingshop = false 
                changelocational = true 
                societylocational[activeshopid].coords = coords
                closemenu()
            else
                TriggerEvent("vorp:TipBottom", language.tooclose, 2000)
            end
        else
            if not tooclose(locational,coords) then 
                TriggerServerEvent("syn_store:takemovecash")
                movingshop = false 
                changelocational = true 
                locational[activeshopid].coords = coords
                closemenu()
            else
                TriggerEvent("vorp:TipBottom", language.tooclose, 2000)
            end
        end
    end
end)


RegisterNetEvent("syn_store:addtolocational")
AddEventHandler("syn_store:addtolocational", function(id,info,typesociety)
    if typesociety then
        societylocational[id] = info
        if societyshopblips[id] ~= nil then 
            RemoveBlip(societyshopblips[id])
            societyshopblips[id] = nil 
        end
        if info ~= nil and next(info) ~= nil then 
            if info.blip == 1 then 
                local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                SetBlipSprite(blip, Config.societystoreblip, 1)
                SetBlipScale(blip, 0.8)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                societyshopblips[id] = blip
            end
        end
    else
        locational[id] = info
        if playershopblips[id] ~= nil then 
            RemoveBlip(playershopblips[id])
            playershopblips[id] = nil 
        end
        if info ~= nil and next(info) ~= nil then 
            if info.blip == 1 then 
                local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                SetBlipSprite(blip, Config.playershopsprite, 1)
                SetBlipScale(blip, 0.8)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                playershopblips[id] = blip
            end
        end
    end
end)

RegisterNetEvent("syn_store:recplayershops")
AddEventHandler("syn_store:recplayershops", function(x,y)
    locational = x
    societylocational = y 
    gotinfo = true 
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    if Config.debug then 
        TriggerServerEvent("syn_store:getcharid")
        TriggerServerEvent("syn_store:getserveritems")
        TriggerServerEvent("syn_store:getplayershops")
    end
    for k,v in pairs(Config.normalstores) do 
        if v.showblip then 
            local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
            SetBlipSprite(blip, v.blipsprite, 1)
            SetBlipScale(blip, 0.8)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
            table.insert(blips,blip)
        end
    end
    
    local str = language.menu
	openmenuprompt = PromptRegisterBegin()
	PromptSetControlAction(openmenuprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openmenuprompt, str)
	PromptSetEnabled(openmenuprompt, 1)
    PromptSetVisible(openmenuprompt, 1)
	PromptSetStandardMode(openmenuprompt,1)
	PromptSetGroup(openmenuprompt, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openmenuprompt,true)
	PromptRegisterEnd(openmenuprompt)
    while not gotinfo do 
        Wait(100)
    end
    if next(locational) ~= nil then 
        for k,v in pairs(locational) do 
            if v.blip == 1 then 
                local blip = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite(blip, Config.playershopsprite, 1)
                SetBlipScale(blip, 0.8)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.name)
                playershopblips[k] = blip
            end
        end
    end

    if next(societylocational) ~= nil then 
        for k,v in pairs(societylocational) do 
            if v.blip == 1 then 
                local blip = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite(blip, Config.societystoreblip, 1)
                SetBlipScale(blip, 0.8)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.name)
                societyshopblips[k] = blip
            end
        end
    end

end)
AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k,v in pairs(blips) do 
            RemoveBlip(v)
        end
        for k,v in pairs(playershopblips) do 
            RemoveBlip(v)
        end
        for k,v in pairs(societyshopblips) do 
            RemoveBlip(v)
        end
        for k,v in pairs(renderednpc) do 
            if v.npc ~= nil then 
                DeleteEntity(v.npc)
            end
        end
    end
end)

RegisterNetEvent("syn_store:createshop")
AddEventHandler("syn_store:createshop", function(opensoc)
    if canshop then 
        if opensoc == nil then 
            TriggerEvent("vorp_inventory:CloseInv")
            local coords = GetEntityCoords(PlayerPedId())
            if not tooclose(locational,coords) then 
                TriggerEvent("syn_inputs:sendinputs", language.confirm, language.shopname, function(cb)
                    local name =     tostring(cb)
                    if name ~= nil and name ~= "" then
                        notebookanim()
                        TriggerServerEvent("syn_store:createplayershop",name,coords)
                    else
                        TriggerEvent("vorp:TipBottom", language.invalidname, 2000)
                    end
                end)
            else
                TriggerEvent("vorp:TipBottom", language.tooclose, 2000)
            end
        else
            TriggerEvent("vorp_inventory:CloseInv")
            local coords = GetEntityCoords(PlayerPedId())
            if not tooclose(locational,coords) then 
                TriggerEvent("syn_inputs:sendinputs", language.confirm, language.shopname, function(cb)
                    local name =     tostring(cb)
                    if name ~= nil and name ~= "" then
                        notebookanim()
                        TriggerServerEvent("syn_store:createsocietyshop",name,coords,opensoc)
                    else
                        TriggerEvent("vorp:TipBottom", language.invalidname, 2000)
                    end
                end)
            else
                TriggerEvent("vorp:TipBottom", language.tooclose, 2000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        local player = PlayerPedId()
        local coords = GetEntityCoords(PlayerPedId())
        local joblocked = false 
        if not inmenu and canshop and not movingshop and not IsPedOnMount(player) then 
            for k,v in pairs(Config.normalstores) do 
                local dist = GetDistanceBetweenCoords(coords,v.Pos.x,v.Pos.y,v.Pos.z, true)
                if Config.interactiondistance > dist  then 
                    sleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', v.Name)
                    PromptSetActiveGroupThisFrame(prompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenuprompt) then
                        if v.joblock ~= nil and next(v.joblock) ~= nil then 
                            joblocked = true 
                            checking = true 
                            TriggerServerEvent("syn_store:getjob")
                            while checking do 
                                Wait(100)
                            end
                        end
                        if not joblocked or contains(v.joblock,playerjob) then 
                            inmenu = true 
                            TriggerEvent("inv:dropstatus",false)
                            standstill()
                            local shoptype = 1 
                            local id = k
                            local store = Config.normalstores[id]
                            local isowner = 0
                            local geninfo = {shoptype=shoptype, buyitems=store.buyitems, sellitems=store.sellitems,isowner=isowner}
                            local infox = {name = v.Name,activeshopid = id,slots=0,geninfo=geninfo}
                            TriggerServerEvent("syn_store:reloadStoreInventory", id,geninfo,0,infox)
                        else
                            TriggerEvent("vorp:TipBottom", language.joblock, 2000)
                        end
                    
                    end
                end
            end
            for k,v in pairs(locational) do 
                local dist = GetDistanceBetweenCoords(coords,v.coords.x,v.coords.y,v.coords.z, true)
                if Config.interactiondistance > dist then 
                    sleep = false 
                    local label  = CreateVarString(10, 'LITERAL_STRING', v.name..language.shopid..k)
                    PromptSetActiveGroupThisFrame(prompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenuprompt) then
                        checking = true 
                        TriggerServerEvent("syn_store:issomeoneinmenu",k)
                        while checking do 
                            Wait(100)
                        end
                        if not inmenustatus then 
                            checking = true 
                            TriggerServerEvent("syn_store:getactiveshop",k)
                            while checking do 
                                Wait(100)
                            end
                            inmenu = true 
                            TriggerEvent("inv:dropstatus",false)

                            standstill()
                            local shoptype = 2
                            local buyitems = activeshopinfo.buyitems
                            local isowner = 0
                            local ownercharid = activeshopinfo.charid
                            local slots = activeshopinfo.slots
                            activeshopid = k
                            TriggerServerEvent("syn_store:instore",activeshopid)
                            if ownercharid ~= charid then 
                                local geninfo = {shoptype=shoptype,isowner=isowner,buyitems=buyitems}
                                local infox = {name = v.name,activeshopid = activeshopid,slots=slots,geninfo=geninfo}
                                TriggerServerEvent("syn_store:reloadStoreInventory", activeshopid,geninfo,0,infox)
                            else
                                shopownermenu(activeshopid)
                            end
                        else
                            TriggerEvent("vorp:TipBottom", language.shopused, 2000)
                            Wait(5000)
                        end
                    
                    end
                end
            end
            if Config.synsociety then 
                for k,v in pairs(societylocational) do 
                    local dist = GetDistanceBetweenCoords(coords,v.coords.x,v.coords.y,v.coords.z, true)
                    if Config.interactiondistance > dist then 
                        sleep = false 
                        local label  = CreateVarString(10, 'LITERAL_STRING', v.name..language.shopid..k)
                        PromptSetActiveGroupThisFrame(prompts, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenuprompt) then
                            checking = true 
                            TriggerServerEvent("syn_store:issomeoneinmenu2",k)
                            while checking do 
                                Wait(100)
                            end
                            if not inmenustatus then 
                                checking = true 
                                TriggerServerEvent("syn_store:getactiveshop2",k)
                                while checking do 
                                    Wait(100)
                                end
                                inmenu = true 
                                TriggerEvent("inv:dropstatus",false)

                                standstill()
                                local shoptype = 3
                                local buyitems = activeshopinfo.buyitems
                                local isowner = 0
                                local society = activeshopinfo.society
                                local managerank = activeshopinfo.rank
                                local slots = activeshopinfo.slots
                                activeshopid = k
                                issociety = true 
                                TriggerServerEvent("syn_store:instore2",activeshopid)
                                checking = true 
                                TriggerServerEvent("syn_store:getjob")
                                while checking do 
                                    Wait(100)
                                end
                                if playerjob == society and (playerrank >= managerank or isboss) then 
                                    shopownermenu(activeshopid)
                                else
                                    local geninfo = {shoptype=shoptype,isowner=isowner,buyitems=buyitems,society = society}
                                    local infox = {name = v.name,activeshopid = activeshopid,slots=slots,geninfo=geninfo}
                                    TriggerServerEvent("syn_store:reloadStoreInventory", activeshopid,geninfo,0,infox)
                                end
                            else
                                TriggerEvent("vorp:TipBottom", language.shopused, 2000)
                                Wait(5000)
                            end
                        
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)


function shopownermenu(shopid)
     local info 
     if issociety then 
        info = societylocational[shopid]
     else
        info = locational[shopid]
     end
     local shopname = info.name

	MenuData.CloseAll()
	local elements = {
        {label = language.shopinventory, value = "shopinv" , desc =  language.shopinventory2 },
        {label = language.upgrade, value = "upgrade" , desc =  language.upgrade2.."<span style=color:Green;> "..Config.upgradecost.."</span>"  }

    }
    if not issociety then 
        table.insert(elements,{label = language.shopledger.."<span style=color:Green;> "..round(activeshopinfo.ledger,2).."</span>", value = "ledger" , desc =  language.shopledger2 })
        local taxledger = round(activeshopinfo.taxledger,2)
        if Config.playerstoretax > taxledger then 
            table.insert(elements,{label = language.taxledger.."<span style=color:Red;> "..taxledger.."</span>", value = "taxledger" , desc =  language.taxledger2.."<span style=color:Green;> "..Config.playerstoretax.."</span>" })
        else
            table.insert(elements,{label = language.taxledger.."<span style=color:Green;> "..taxledger.."</span>", value = "taxledger" , desc =  language.taxledger2.."<span style=color:Green;> "..Config.playerstoretax.."</span>" })
        end
    else
        if isboss then 
            table.insert(elements,{label = language.management, value = "rank" , desc =  language.management2})
        end
    end
    table.insert(elements,{label = language.buyitems, value = "buyitems" , desc =  language.buyitems2 })
    table.insert(elements,{label = language.moveshop, value = "moveshop" , desc =  language.upgrade2.."<span style=color:Green;> "..Config.moveshopcost.."</span>" })
    table.insert(elements,{label = language.changename, value = "changename" , desc =  language.changename2 })
    table.insert(elements,{label = language.blipvisibleity, tag = "blipvisibleity" , desc =  language.blipvisibleity2, type = "slider", min =0 , max =1,value =info.blip, hop= 1})
    if Config.allowuserwebhooks then 
        table.insert(elements,{label = language.webhook, value = "webhook" , desc =  language.webhook2 })
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = shopname,
		subtext    = language.shopid..shopid,
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if data.current.value == "buyitems" then 
            buyitems(shopid)
        end
        if data.current.value == "rank" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.management, function(cb)
				local amount =     ToInteger(tonumber(cb))
                if amount ~= nil and amount ~= "" and amount > 0 then
                    TriggerServerEvent("syn_store:setrank",shopid,amount,activeshopinfo.society)
                    closemenu()
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                    closemenu()
                end
            end)
        end
        if data.current.value == "moveshop" then 
            MenuData.CloseAll()
            TriggerServerEvent("syn_store:allowmoveshop")
        end
        if data.current.value == "shopinv" then 
            MenuData.CloseAll()
            isownerinventory = true
            local shoptype 
            if issociety then 
                shoptype = 3
            else
                shoptype = 2
            end
            local geninfo = {shoptype=shoptype,isowner=1,buyitems=activeshopinfo.buyitems}
            local infox = {name = shopname,activeshopid = shopid,slots=activeshopinfo.slots,geninfo=geninfo}
            TriggerServerEvent("syn_store:reloadStoreInventory", shopid,geninfo,0,infox)
        end
        if data.current.value == "ledger" then 
            shopledger(shopid)
        end
        if data.current.value == "taxledger" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
				local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    if Config.playerstoretax >= amount then 
                        TriggerServerEvent("syn_store:deposittax",shopid,amount)
                        closemenu()
                    else
                        TriggerClientEvent("vorp:TipBottom", _source, language.taxlimit..Config.playerstoretax, 2000)
                        closemenu()
                    end
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
            
        end
        if data.current.value == "upgrade" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
				local amount =     ToInteger(tonumber(cb))
                if amount ~= nil and amount ~= "" and amount > 0 then
                    TriggerServerEvent("syn_store:upgradeslots",shopid,amount,issociety)
                    closemenu()
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                    closemenu()
                end
            end)
        end
        if data.current.value == "changename" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.shopname, function(cb)
                local name =     tostring(cb)
                if name ~= nil and name ~= "" then
                    changelocational = true 
                    if issociety then 
                        societylocational[shopid].name = name
                        RemoveBlip(societyshopblips[shopid])
                        local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                        SetBlipSprite(blip, Config.societystoreblip, 1)
                        SetBlipScale(blip, 0.8)
                        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                        societyshopblips[shopid] = blip
                    else
                        locational[shopid].name = name
                        RemoveBlip(playershopblips[shopid])
                        local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                        SetBlipSprite(blip, Config.playershopsprite, 1)
                        SetBlipScale(blip, 0.8)
                        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                        playershopblips[shopid] = blip
                    end
                    MenuData.CloseAll()
                    shopownermenu(shopid)
                    TriggerEvent("vorp:TipBottom", language.namechanged, 2000)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidname, 2000)
                end
            end)
        end
        if (data.current.tag == 'blipvisibleity') then
            if info ~= data.current.value then
                changelocational = true 
                if issociety then 
                    societylocational[shopid].blip = data.current.value
                    if societylocational[shopid].blip == 1 then 
                        local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                        SetBlipSprite(blip, Config.societystoreblip, 1)
                        SetBlipScale(blip, 0.8)
                        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                        societyshopblips[shopid] = blip
                    else
                        RemoveBlip(societyshopblips[shopid])
                    end
                else
                    locational[shopid].blip = data.current.value
                    if locational[shopid].blip == 1 then 
                        local blip = N_0x554d9d53f696d002(1664425300, info.coords.x, info.coords.y, info.coords.z)
                        SetBlipSprite(blip, Config.playershopsprite, 1)
                        SetBlipScale(blip, 0.8)
                        Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
                        playershopblips[shopid] = blip
                    else
                        RemoveBlip(playershopblips[shopid])
                    end
                end
            end
        end
        if data.current.value == "webhook" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.webhookurl, function(cb)
                local webhook =     tostring(cb)
                if webhook ~= nil and webhook ~= "" and searchfun(webhook) then
                    TriggerServerEvent("syn_store:addwebhook",shopid,webhook,issociety)
                    TriggerEvent("vorp:TipBottom", language.webhookadded, 2000)
                    closemenu()
                else
                    TriggerEvent("vorp:TipBottom", language.invalidurl, 2000)
                    closemenu()
                end
            end)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end


function buyitems(shopid)
    local info 
    if issociety then 
        info = societylocational[shopid]
    else
        info = locational[shopid]
    end
    local shopname = info.name

   MenuData.CloseAll()
   local elements = {
    {label = language.additem, value = "additem" , desc =  language.additem2 },
    }
    table.sort(activeshopinfo.buyitems, cmp)
    for k,v in pairs(activeshopinfo.buyitems) do
        table.insert(elements,{label = v.label, value = "manage" ,tag = v, desc = language.managelisting  })
    end
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = "",
       align    = 'top-left',
       elements = elements,
       lastmenu = "shopownermenu",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
        end
        if data.current.value == "additem" then 
            additem(shopid)
        end
        if data.current.value == "manage" then 
            amountx = data.current.tag.amount
            pricex = data.current.tag.price        
            manage(shopid,data.current.tag)
        end
   end,
   function(data, menu)
       menu.close()
   end)
end

function manage(shopid,theitem)
    local info 
    if issociety then 
        info = societylocational[shopid]
    else
        info = locational[shopid]
    end
    local shopname = info.name
    MenuData.CloseAll()
    local elements = {
        {label = language.amount..": "..amountx, value = "amount" , desc =  language.amount2 },
        {label = language.pricetobuy..": "..pricex, value = "price" , desc =  language.pricetobuy2 },
        {label = language.confirm, value = "confirm" , desc =  language.confirm2 },
        {label = language.remove, value = "remove" , desc =  language.remove2 },

    }
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = "",
       align    = 'top-left',
       elements = elements,
       lastmenu = "buyitems",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
            amountx = 0
            pricex = 0
        elseif data.current.value == "amount" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
                local amount =     ToInteger(tonumber(cb))
                if amount ~= nil and amount ~= "" and amount > 0 then
                    amountx = amount 
                    manage(shopid,theitem)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
        elseif data.current.value == "price" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.pricetobuy, function(cb)
                local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    pricex = amount 
                    manage(shopid,theitem)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
        elseif data.current.value == "confirm" then 
            TriggerServerEvent("syn_store:editbuyitem",shopid,theitem,amountx,pricex,issociety)
            closemenu()
        elseif data.current.value == "remove" then 
            TriggerServerEvent("syn_store:removebuyitem",shopid,theitem,issociety)
            closemenu()
        end
   end,
   function(data, menu)
       menu.close()
   end)
end

function additem(shopid)
    local info 
    if issociety then 
        info = societylocational[shopid]
    else
        info = locational[shopid]
    end
    local shopname = info.name

   MenuData.CloseAll()
   local elements = {
    {label = language.search, value = "search" , desc =  language.search2 },
    }
    for k,v in pairs(allserveritems) do 
        table.insert(elements,{label = v.label, item = k , desc =language.additem })
    end
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = "",
       align    = 'top-left',
       elements = elements,
       lastmenu = "buyitems",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
        elseif data.current.value == "search" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.search, function(cb)
                local name =     tostring(cb)
                if name ~= nil and name ~= "" then
                    local newtable = itemsearch(name,allserveritems)
                    searched(shopid,newtable)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidname, 2000)
                end
            end)
        else
            additemtobuylist(shopid,allserveritems[data.current.item])
        end
   end,
   function(data, menu)
       menu.close()
   end)
end

function searched(shopid,newtable)
    local info 
    if issociety then 
        info = societylocational[shopid]
    else
        info = locational[shopid]
    end
    local shopname = info.name

   MenuData.CloseAll()
   local elements = {
    }
    for k,v in pairs(newtable) do 
        table.insert(elements,{label = v.label, item = k , desc =language.additem })
    end
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = "",
       align    = 'top-left',
       elements = elements,
       lastmenu = "additem",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
        else 
            additemtobuylist(shopid,newtable[data.current.item])  
        end
   end,
   function(data, menu)
       menu.close()
   end)
end



function additemtobuylist(shopid,theitem)
    local info 
    if issociety then 
        info = societylocational[shopid]
    else
        info = locational[shopid]
    end
    local shopname = info.name
   MenuData.CloseAll()
   local elements = {
    {label = language.amount..": "..amountx, value = "amount" , desc =  language.amount2 },
    {label = language.pricetobuy..": "..pricex, value = "price" , desc =  language.pricetobuy2 },
    {label = language.confirm, value = "confirm" , desc =  language.confirm2 },
    }
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = "",
       align    = 'top-left',
       elements = elements,
       lastmenu = "additem",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
            amountx = 0
            pricex = 0
        elseif data.current.value == "amount" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
                local amount =     ToInteger(tonumber(cb))
                if amount ~= nil and amount ~= "" and amount > 0 then
                    amountx = amount 
                    additemtobuylist(shopid,theitem)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
        elseif data.current.value == "price" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.pricetobuy, function(cb)
                local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    pricex = amount 
                    additemtobuylist(shopid,theitem)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
        elseif data.current.value == "confirm" then 
            TriggerServerEvent("syn_store:addbuyitem",shopid,theitem,amountx,pricex,issociety)
            closemenu()
        end
   end,
   function(data, menu)
       menu.close()
   end)
end

function shopledger(shopid)
    local info = locational[shopid]
    local shopname = info.name

   MenuData.CloseAll()
   local elements = {
    {label = language.withdraw, value = "withdraw" , desc =  language.withdraw2 },
    {label = language.deposit, value = "deposit" , desc =  language.deposit2 },
    }
  MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
   {
       title    = shopname,
       subtext    = language.shopledger.."<span style=color:Green;> "..round(activeshopinfo.ledger,2).."</span>",
       align    = 'top-left',
       elements = elements,
       lastmenu = "shopownermenu",

   },
   function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger](shopid)
        end
       if data.current.value == "withdraw" then 
           TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
               local amount =     round(tonumber(cb), 2)
               if amount ~= nil and amount ~= "" and amount > 0 then
                   TriggerServerEvent("syn_store:withdraw",shopid,amount)
                   closemenu()
               else
                   TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                   closemenu()
               end
           end)
           
       end
       if data.current.value == "deposit" then 
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
                local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    TriggerServerEvent("syn_store:deposit",shopid,amount)
                    closemenu()
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                    closemenu()
                end
            end)
            
        end
   end,
   function(data, menu)
       menu.close()
   end)
end
