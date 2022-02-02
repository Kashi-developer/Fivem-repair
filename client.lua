function GetVehHealthPercent()
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsUsing(ped)
	local vehiclehealth = GetEntityHealth(vehicle) - 100
	local maxhealth = GetEntityMaxHealth(vehicle) - 100
	local procentage = (vehiclehealth / maxhealth) * 100
	return procentage
end




function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsUsing(ped)
		local damage = GetVehHealthPercent(vehicle)
		if IsPedInAnyVehicle(ped, false) then
			SetPlayerVehicleDamageModifier(PlayerId(), 100) -- Seems to not work at the moment --
			if damage < 95 then
				SetVehicleUndriveable(vehicle, true)
				ShowNotification("~r~Silnik zostal uszkodzony.")
			end
		end
	end
end)

-- Repairing cars  
-- My own part here

RegisterNetEvent('RepairVehicle')
AddEventHandler('RepairVehicle', function()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then 
		local vehicle = GetVehiclePedIsUsing(playerPed, false)
		SetVehicleEngineHealth(vehicle, 100)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleFixed(vehicle)
		ShowNotification("~g~Silnik zostal naprawiony.")
	else 
		ShowNotification("~r~Nie jestes w pojezdzie!")	
	end
end)