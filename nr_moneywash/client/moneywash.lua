ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

-- if not lib then return end

-- -- Module is deprecated and provided for compatibility
-- -- All functions are now part of with ox_lib

-- exports('Keyboard', lib.inputDialog)

-- exports('Progress', function(options, completed)
-- 	local success = lib.progressCircle(options)

-- 	if completed then
-- 		completed(not success)
-- 	end
-- end)

-- exports('CancelProgress', lib.cancelProgress)
-- exports('ProgressActive', lib.progressActive)
-- local audah = TriggerServerEvent
-- local apaiya = TriggerEvent

-- local iyah = RegisterNetEvent
-- local iya = AddEventHandler

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

-- function WashMoney()
--     TriggerEvent('ketell:prosescuci')
 
-- end

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
        anim = {
            dict = 'mp_player_intdrink',
            clip = 'loop_bottle'
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
         if chance > 5 then
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


            exports.qtarget:AddBoxZone("MoneyWash", vector3(1135.07, -989.66, 46.11), 6.8, 1.6, {
                name="MoneyWash",
                heading=7,
                debugPoly=false,
                minZ=45.11,
                maxZ=47.41
                }, {
                    options = {
                        {
                        event = "moneywash:qt",
                        icon = "fas fa-money-bill",
                        label = "Money Wash",
                        job = {
                            ['cartel'] = 0,
                            ['mafia'] = 0,
                            ['gang'] = 0,
                            ['yakuza'] = 0,
                            ['biker'] = 0,
                            ['yakuza'] = 0,
                            ['family'] = 0,
                        },
                        },
                    },
                    distance = 1.5
            })


RegisterNetEvent('moneywash:qt')
AddEventHandler('moneywash:qt', function()
    --WashMoney()
    ESX.TriggerServerCallback('ketell:policeany', function(policeany)
		if policeany >= ConfigMoneyWash.MinimalPolisi then
            TriggerEvent('ketell:prosescuci')
        else
            lib.notify({
                title = 'MoneyWash',
                description = 'Kekurangan Polisi',
                type = 'error'
            })
        end
    end)
end)