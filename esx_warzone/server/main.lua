ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('player:money')
AddEventHandler('player:money', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    --xPlayer.addAccountMoney('bank', 100000)
    xPlayer.addMoney(100000)
end)
