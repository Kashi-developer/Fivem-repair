AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	if msg == "/repair" then 
		TriggerClientEvent('RepairVehicle', source) 
	end
end)