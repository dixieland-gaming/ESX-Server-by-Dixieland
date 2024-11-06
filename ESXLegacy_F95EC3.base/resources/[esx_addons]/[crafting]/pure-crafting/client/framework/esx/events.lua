if Config.framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function()
    TriggerServerEvent('pure-crafting:playerLoaded')
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    TriggerServerEvent('pure-crafting:playerUnloaded')
end)

function getPlayerUniqueId(source)
    local PlayerData = ESX.GetPlayerData()
    return PlayerData.identifier
end
