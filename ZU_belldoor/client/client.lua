ESX = exports["es_extended"]:getSharedObject()

function PlayDoorbellSound()
    local soundFile = Config.DoorbellSound
    local soundVolume = Config.DoorbellVolume

    SendNUIMessage({
        transactionType = 'playSound',
        transactionFile = soundFile,
        transactionVolume = soundVolume
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        for _, jobDoorbells in pairs(Config.Doorbells) do
            for _, doorbell in ipairs(jobDoorbells) do
                local distance = #(coords - doorbell.coords)
                if distance < 10 then
                    -- Marqueur principal (cercle blanc)
                    DrawMarker(1, doorbell.coords.x, doorbell.coords.y, doorbell.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.1, 255, 255, 255, 100, false, true, 2, false, nil, nil, false)
                    
 
                    if distance < 1.5 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour sonner")
                        if IsControlJustReleased(0, 38) then -- Touche E
                            TriggerServerEvent('esx_doorbell:ringDoorbell', doorbell.job, doorbell.label)
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('esx_doorbell:showNotification')
AddEventHandler('esx_doorbell:showNotification', function(message)
    ESX.ShowNotification(message, false, false, Config.NotificationDuration)
    PlayDoorbellSound()
end)