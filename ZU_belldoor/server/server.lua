ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('esx_doorbell:ringDoorbell')
AddEventHandler('esx_doorbell:ringDoorbell', function(job, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xTarget = ESX.GetPlayerFromId(xPlayers[i])
        if xTarget.job.name == job then
            TriggerClientEvent('esx_doorbell:showNotification', xTarget.source, "Quelqu'un sonne à la " .. label)
        end
    end

    TriggerClientEvent('esx_doorbell:showNotification', xPlayer.source, "Vous avez sonné à la " .. label)
end)