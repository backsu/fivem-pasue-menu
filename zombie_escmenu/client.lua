Citizen.CreateThread(function()
	while true do
	Citizen.Wait(1)
		SetPauseMenuActive(false)
	if (IsControlJustPressed(0, 200)) then
		TransitionToBlurred(1000)
		SetNuiFocus(true,true)
		SendNUIMessage({
		open = true
		})
		end
	end
end)

RegisterNetEvent("ToggleActionmenu")
AddEventHandler("ToggleActionmenu", function()
	ToggleActionMenu()
end)

RegisterNetEvent("zombie_escmenu:on")
AddEventHandler("zombie_escmenu:on", function()
    TransitionToBlurred(1000)
	SetNuiFocus(true,true)
	SendNUIMessage({
	open = true
	})
end)

RegisterNetEvent("zombie_escmenu:opendiscord")
AddEventHandler("zombie_escmenu:opendiscord", function()
	SetNuiFocus(true,true)
	SendNUIMessage({
	opendiscord = true
	})
end)


RegisterNUICallback('close', function(data, cb)
	TransitionFromBlurred(1000)
    closemenu()
  	cb('ok')
end)

function closemenu()
	TransitionFromBlurred(1000)
  SetNuiFocus( false, false )
      SendNUIMessage({
        open = false
      })
  end
  
function closediscord()
  SetNuiFocus( false, false )
      SendNUIMessage({
        opendiscord = false
      })
  end
  
  
  
RegisterNUICallback('Continue', function(data, cb)
    closemenu()
  	cb('ok')
end)

RegisterNUICallback('discord', function(data, cb)
    closemenu()
	TriggerEvent("zombie_escmenu:opendiscord")
  	cb('ok')
end)

RegisterNUICallback('guide', function(data, cb)
	closemenu()
	TriggerEvent("zombie_escmenuhtml:on")
  	cb('ok')
end)

RegisterNUICallback('key', function(data, cb)
	closemenu()
	ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1)
  	cb('ok')
end)

RegisterNUICallback('offgame', function(data, cb)
    TriggerServerEvent("zombie_escmenu:drop")
  	cb('ok')
end)


RegisterNUICallback('discorcopy', function(data, cb)
	closediscord()
    TransitionToBlurred(1000)
	SetNuiFocus(true,true)
	SendNUIMessage({
	open = true
	})
  	cb('ok')
end)
