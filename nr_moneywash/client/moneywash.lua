ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)


-- exports('CancelProgress', lib.cancelProgress)
-- exports('ProgressActive', lib.progressActive)


RegisterNetEvent("ketell:notify")
AddEventHandler("ketell:notify", function()
	if ConfigMoneyWash.EnablePoliceNotify then
    	local player = ESX.GetPlayerData()
    	if player.job.name == "police" then
		local playerCoords = GetEntityCoords(PlayerPedId())
		local data = {displayCode = '211', description = 'Money Laundry in progress', isImportant = 1, recipientList = {'police'}, length = '4000'}
		local dispatchData = {dispatchData = data, caller = 'Local', coords = playerCoords}
		TriggerServerEvent('wf-alerts:svNotify', dispatchData)
    	end
	end
end)

function WashMoney()
    TriggerEvent('ketell:prosescuci')
 
end

RegisterNetEvent("ketell:prosescuci")
AddEventHandler("ketell:prosescuci", function(completed)
    if not proses then
        proses = true
    local sucess = (lib.progressCircle({
        duration = 3000,
        label = 'Money Wash Progress',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    }))
    if sucess then
        --TriggerServerEvent('ketell:cuciduit')
        TriggerServerEvent('ketell:cucibaju')
        proses = false
    else
        proses = false
        local laundromat = vector3(1137.46, -991.97, 46.11)
        local chance = math.random(0,100)
         if chance > 80 then
          TriggerServerEvent("ketell:notifyy", laundromat)
            end
        end
    end
end)

if ConfigMoneyWash.EnableMoneyWashBlip then
    Citizen.CreateThread(function()
		for k,v in pairs(ConfigMoneyWash.MoneyWash) do
			for i = 1, #v.WashMoney, 1 do
				local blip = AddBlipForCoord(v.WashMoney[i])
				
				SetBlipSprite (blip, 483)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 17)
				SetBlipAsShortRange(blip, true)
				
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(ConfigMoneyWash.WashMoneyBlipName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end)
end

Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("MoneyWash", vector3(1135.07, -989.66, 46.11), 6.8, 1.6, {
        name="MoneyWash",
        heading = 7,
        -- debugPoly = true,
        minZ = 45.11,
        maxZ = 47.41
    }, {
        options = {
        {
        event = "moneywash:qt",
        icon = "fas fa-money-bill",
        label = "Wash Money",
        },
    },
        distance = 4.0
    })
end)

RegisterNetEvent('moneywash:qt')
AddEventHandler('moneywash:qt', function()
    WashMoney()
end)


