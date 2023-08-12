function ToInteger(number)
    number = tonumber(number)
    if number ~= nil then 
        if 0 >  number then 
            number = number * -1
        end
        return math.floor(number or error("Could not cast '" .. tostring(number) .. "' to number.'"))
    else
        return 0
    end
end


function round(number, decimals)
    if tonumber(number) == nil then 
        return nil 
    end
    local scale = 10^decimals
    local c = 2^52 + 2^51
    return ((number * scale + c ) - c) / scale
end


function notebookanim()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_WRITE_NOTEBOOK"), 10000, true, false, false, false)
    Wait(10000)
    ClearPedTasks(PlayerPedId())
end


function AnIndexOf(t,val)
    for k,v in ipairs(t) do 
        if v == val then return k end
    end
end

function deep_copy(orig)
    local copy
    if type(orig) == "table" then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
        copy[deep_copy(orig_key)] = deep_copy(orig_value)
      end
      setmetatable(copy, deep_copy(getmetatable(orig)))
    else
      copy = orig
    end
    return copy
end


function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
end
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())  
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
    	SetTextScale(0.30, 0.30)
  		SetTextFontForCurrentCommand(1)
    	SetTextColor(255, 255, 255, 215)
    	SetTextCentre(1)
    	DisplayText(str,_x,_y)
    	local factor = (string.len(text)) / 225
    	DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function contains(table, element)
    if table ~= 0 then 
        for k, v in pairs(table) do
            if v == element then
                return true
            end
        end
    end
return false
end

function sameitem(table1,table2) -- new line
    if table1 == nil or table2 == nil then 
        return true
      end
      for k,v in pairs(table1) do 
          if type(table1[k]) ~= "table" then 
              if table1[k] ~= table2[k] then 
                  return false 
              end
          else
              if not sameitem(table1[k],table2[k]) then 
                  return false 
              end
          end
      end
      return true 
end

function containsitemname(table, element,meta)
    if table ~= 0 then 
        for k, v in pairs(table) do
            if v.itemname == element and sameitem(meta,v.metadata) then
                return true, k
            end
        end
    end
return false
end

function isbuyitem(table,element)
    for k,v in pairs(table) do 
        if v.name == element then 
            return true, v.price
        end
    end
return false, 0
end

function isbuyitemfromplayer(table,element)
    for k,v in pairs(table) do 
        if v.name == element then 
            return true, v.price, v.amount,k
        end
    end
return false, 0
end


    
function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end


function shopitemcount(items,weapons)
    local keys = 0
    for k,v in pairs(items) do
       keys = keys + v.itemcount
    end
    for k,v in pairs(weapons) do
       keys = keys + 1
    end
    return keys
end

function allow(table)
    for k, v in pairs(table) do
        if v == "false" then  
            return false
        end
    end
  return true
end

function istownbanned(town)
    for k,v in pairs(miscinfo.towns) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end

function tooclose(shops,coords)
    local tooclose = {}
    if next(shops) ~= nil then 
        for k,v in pairs(shops) do 
            local shopcoords = v.coords 
            local dist = GetDistanceBetweenCoords(coords,shopcoords.x,shopcoords.y,shopcoords.z , true)
            if dist < Config.shopspacing then
                table.insert( tooclose, "false" )
            end
        end
        if contains(tooclose, "false") then 
            return true 
        else
            return false 
        end
    else
        return false 
    end
end



function standstill()
    TaskStandStill(PlayerPedId(), -1)
    FreezeEntityPosition(PlayerPedId(),true)
end

function searchfun(stringx)
    if string.find(stringx, "https://discord.com/api/webhooks/") then
        return true 
    end
    return false 
end

function itemsearch(name,tablex)
    local temptable = {}
    for k,v in ipairs(tablex) do
        local first = string.lower(v.label)
        local sec = string.lower(name)
        if string.find(first, sec) then
            table.insert( temptable, v)
        end
    end
    return temptable
end



-- get discord id
function getIdentity(source, identity)
	local num = 0
	local num2 = GetNumPlayerIdentifiers(source)
  
	if GetNumPlayerIdentifiers(source) > 0 then
	  local ident = nil
	  while num < num2 and not ident do
		local a = GetPlayerIdentifier(source, num)
		if string.find(a, identity) then ident = a end
		num = num+1
	  end
	  --return ident;
      if ident == nil then 
        return ""
      end
	  return string.sub(ident, 9)
	end
end

function hasshop(charid,table)
    for k,v in pairs(table) do 
        if v.charid == charid then 
            return true 
        end
    end
    return false
end

function cmp(a, b)
    a = tostring(string.upper(a.label))
    b = tostring(string.upper(b.label))
    local patt = '^(.-)%s*(%d+)$'
    local _,_, col1, num1 = a:find(patt)
    local _,_, col2, num2 = b:find(patt)
    if (col1 and col2) and col1 == col2 then
       return tonumber(num1) < tonumber(num2)
    end
    return a < b
end

function findkey(table, value)
    for k,v in pairs(table) do
        if v.name == value then
            return k
        end
    end
    return nil
end

