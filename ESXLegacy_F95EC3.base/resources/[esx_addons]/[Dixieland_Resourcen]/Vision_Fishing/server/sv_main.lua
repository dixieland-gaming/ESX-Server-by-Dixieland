SetConvarServerInfo('tags', 'Vision-Scripts')

RegisterServerEvent('vision_fishing:givefish')
AddEventHandler('vision_fishing:givefish', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(0, 100)
    local item = nil
    local value = nil

    for i = 1, #Vision.RewardItems, 1 do
        if chance <= Vision.RewardItems[i].chance then
            item = Vision.RewardItems[i].item
            if Vision.RewardItems[i].valueMin and Vision.RewardItems[i].valueMax then
                value = math.random(Vision.RewardItems[i].valueMin, Vision.RewardItems[i].valueMax)
            end
            break
        end
    end

    if item then
        xPlayer.addInventoryItem(item, value)
        TriggerClientEvent("vision_fishing:fishcaught", source, item, value)

        if Vision.DiscordNotify then
            local webhook = Vision.Webhook
            local name = GetPlayerName(source)
            local steam = GetPlayerIdentifier(source, 0)
            local discord = GetPlayerIdentifier(source, 1)
            local id = source
            local item = item
            local value = value
        
            local VisionMessage = {
                embeds = {{
                    title = "Vision - Fishing",
                    description = "A Player caught a fish!",
                    fields = {
                        {name = "Player:", value = "```[" .. id .. "] " .. name .. "```"},
                        {name = "Item:", value = "```[" .. value .. "] " .. item .. "```"},
                        {name = "Steam:", value = "```" .. steam .. "```"},
                        {name = "Discord:", value = "```" .. discord .. "```"}
                    },
                    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                    color = 0x6f249e
                }}
            }
        
            PerformHttpRequest(webhook, function(err, text, headers) 

            end, 'POST', json.encode(VisionMessage), {['Content-Type'] = 'application/json'})
        end
    else
        TriggerClientEvent("vision_fishing:fishnotcaught", source, nil)
    end
end)
