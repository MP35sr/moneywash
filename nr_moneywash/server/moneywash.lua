ESX = nil
-- local policekonek  = 0
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- function MinimalPolice()

-- 	local xPlayers = ESX.GetPlayers()

-- 	policekonek = 0

-- 	for i=1, #xPlayers, 1 do
-- 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
-- 		if xPlayer.job.name == 'police' then
-- 			policekonek = policekonek + 1
-- 		end
-- 	end

-- 	SetTimeout(120 * 1000, MinimalPolice)
-- end


-- local apaiya = TriggerClientEvent

-- local iyah = RegisterServerEvent
-- local iya = AddEventHandler

RegisterServerEvent('ketell:notifyy')
AddEventHandler('ketell:notifyy', function()
    TriggerClientEvent("ketell:notify", -1)
end)

-- RegisterServerEvent('ketell:cuciduit')
-- AddEventHandler('ketell:cuciduit', function(completed)
-- 	local _source = source
-- 	local xPlayer = ESX.GetPlayerFromId(_source)
-- 	local kontol = 0
	
-- 	kontol = xPlayer.getAccount('black_money').money

-- 	local ngentod = xPlayer.getInventoryItem('moneywash_card').count
	
-- 	if ngentod > 0 then
-- 		if kontol < 2000 then
--             TriggerClientEvent('ox_lib:notify', _source,{ type = 'error', description = "You do not have enough dirty money to wash"})
-- 		else
-- 			xPlayer.removeAccountMoney('black_money', 2000)
-- 			xPlayer.addMoney(2000)
--         TriggerClientEvent('ox_lib:notify', _source,{ type = 'success', description = "You washed 1000$ dirty money"})
-- 		end
-- 	else
--         TriggerClientEvent('ox_lib:notify', _source,{ type = 'error', description = "You Do not have card moneywash!"})
-- 	end
-- end)
-- ESX.RegisterServerCallback('ketell:police', function(source, cb)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

-- 	cb(policekonek)
-- end)

ESX.RegisterServerCallback('ketell:policeany',function(source, cb)
	local policeany = 0
	local playerList = ESX.GetPlayers()
	for i=1, #playerList, 1 do
	  local _source = playerList[i]
	  local xPlayer = ESX.GetPlayerFromId(_source)
	  local jobwarga = xPlayer.job.name
	  if jobwarga == 'police' then
		policeany = policeany + 1
	  end
	end
	cb(policeany)
  end)

RegisterServerEvent('ketell:cucibaju')
AddEventHandler('ketell:cucibaju', function(completed, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--local moneyjob = xPlayer.job.name
	local random1, random2 = 0, 0
	local kontol = 0
	--local ngentod = xPlayer.getInventoryItem('moneywash_card').count
	kontol = xPlayer.getAccount('black_money').money

	--if moneyjob == 'cartel' or moneyjob == 'biker' or moneyjob == 'yakuza' or moneyjob == 'gang' or moneyjob == 'family' or moneyjob == 'mafia' then
		--if (xPlayer.job ~= nil and moneyjob == 'biker' and xPlayer.job.grade > 1) then
	--if ngentod > 0 then
		if kontol < 2000 then
			TriggerClientEvent('ox_lib:notify', _source,{ type = 'error', description = "You do not have enough dirty money to wash"})
	else
		--if xPlayer.getInventoryItem('black_money').count >= 2000 then
		--item = 'black_money'
		-- random2 = math.random(2000, xPlayer.getInventoryItem('black_money').count)
		if xPlayer.getInventoryItem('black_money').count >= 2000 then
			random2 = math.random(2000, xPlayer.getInventoryItem('black_money').count)
			random2 = math.random(2000, 5000)
		-- end
		random1 = ESX.Math.Round(random2 / 100 * 90)
	end
end

		if kontol then
			xPlayer.removeAccountMoney('black_money', random2)
			xPlayer.addMoney(random1)
			TriggerClientEvent('ox_lib:notify', _source,{ type = 'success', description = "You washed " .. random2 .. "$\ndirty money" ,duration = 2500})
		end
-- else
-- 	apaiya('ox_lib:notify', _source,{ type = 'error', description = "Kamu tidak ada Akses!"})
-- 	end
end)