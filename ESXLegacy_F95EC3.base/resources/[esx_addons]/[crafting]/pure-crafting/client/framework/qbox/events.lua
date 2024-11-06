if Config.framework ~= 'qbox' then return end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('pure-crafting:playerLoaded')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('pure-crafting:playerUnloaded')
end)

function getPlayerUniqueId()
    local citizenid = QBX.PlayerData.citizenid
    return citizenid
end