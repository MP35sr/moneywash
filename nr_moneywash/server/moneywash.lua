ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ketell:notifyy')
AddEventHandler('ketell:notifyy', function()
    TriggerClientEvent("ketell:notify", -1)
end)

RegisterServerEvent('ketell:cucibaju')
AddEventHandler('ketell:cucibaju', function(completed, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local item, random1, random2 = nil, 1, 1
	local kontol = 0
	--local ngentod = xPlayer.getInventoryItem('moneywash_card').count
	kontol = xPlayer.getAccount('black_money').money

	if xPlayer.job.name == 'cartel' then
	--if ngentod > 0 then
		if kontol < 5000 then
			TriggerClientEvent('ox_lib:notify', _source,{ type = 'error', description = "You do not have enough dirty money to wash"})
	 		else
	if xPlayer.getInventoryItem('black_money').count >= 5000 then
		item = 'black_money'
		random2 = math.random(5000, xPlayer.getInventoryItem('black_money').count)
		if xPlayer.getInventoryItem('black_money').count >= 5000 then
			random2 = math.random(5000, 10000)
		end
		random1 = ESX.Math.Round(random2 / 100 * 100)
	end
end

	if xPlayer and item then
			xPlayer.removeAccountMoney('black_money', random2)
			xPlayer.addMoney(random1)
			TriggerClientEvent('ox_lib:notify', _source,{ type = 'success', description = "You washed " .. random2 .. "$\ndirty money" ,duration = 2500})
	end
else
	TriggerClientEvent('ox_lib:notify', _source,{ type = 'error', description = "Kamu Tidak Dapat Akses Ini!"})
	end
end)