RegisterNetEvent('Ax-Radial:Walkstyle')
AddEventHandler('Ax-Radial:Walkstyle',function(option)
      
	  if option == 'walkcasul' then 
	    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
	    Wait(500)
		animation = "MP_Style_Casual"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
	    TriggerServerEvent("syn_walkanim:setwalk",animation)
      
	  elseif option == 'walkcrazy' then
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "MP_Style_Crazy"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkdrunk' then
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "mp_style_drunk"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkeasy' then
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "MP_Style_EasyRider"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkflamboyant' then
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "MP_Style_Flamboyant"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkremove' then
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "noanim"
        TriggerServerEvent("syn_walkanim:setwalk",animation)
      
	  elseif option == 'walkflamboyant' then
	    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "MP_Style_Flamboyant"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkgreenhorn' then
	    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
        Wait(500)
        animation = "MP_Style_Greenhorn"
        Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
        TriggerServerEvent("syn_walkanim:setwalk",animation)
		
	  elseif option == 'walkgunslinger' then
	   Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
       Wait(500)
       animation = "MP_Style_Gunslinger"
       Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
       TriggerServerEvent("syn_walkanim:setwalk",animation)
	   
	  elseif option == 'walkinquisitive' then
	   Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,0,-1) 
       Wait(500)
       animation = "mp_style_inquisitive"
       Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation,1,-1)
       TriggerServerEvent("syn_walkanim:setwalk",animation)
	  elseif option == 'walkremove' then
  end
end)

RegisterNetEvent('Ax-Radial:Dance')
AddEventHandler('Ax-Radial:Dance',function(command)
ExecuteCommand(command)
end)

RegisterNetEvent('Ax-Radial:Citizen')
AddEventHandler('Ax-Radial:Citizen',function(command)
    ExecuteCommand(command)
end)
RegisterNetEvent('Ax-Radial:UI')
AddEventHandler('Ax-Radial:UI',function(command)
    ExecuteCommand(command)
end)
RegisterNetEvent('Ax-Radial:Clothing')
AddEventHandler('Ax-Radial:Clothing',function(command)
    ExecuteCommand(command)
end)

RegisterNetEvent('Ax-Radial:Actions')
AddEventHandler('Ax-Radial:Actions',function(command)
    ExecuteCommand(command)
end)