Vision = {}

-- -----------------------------------
-- Zone and Reward and Time
-- -----------------------------------

Vision.FishingZones = {
    FishingZone1 = {
        title = "Fishing Spot 1",
        blip = {
            title = "Fishing Spot 1",
            coordinate = vector3(-1818.31,-1203.39,13.02)
        },
        spots = {
            vector3(-1825.05,-1267.03,8.62),
            vector3(-1832.65,-1263.29,8.62),
            vector3(-1836.05,-1260.45,8.62),
            vector3(-1850.11,-1248.86,8.62),
            vector3(-1854.59,-1245.08,8.62),
            vector3(-1830.48,-1160.07,13.02),
            vector3(-1821.66,-1167.55,13.02),
            vector3(-1811.03,-1176.27,13.02),
            vector3(-1790.69,-1193.03,13.02),
            vector3(-1783.89,-1199.15,13.02),
            vector3(-1801.31,-1220.13,13.02)
        }
    }
    -- FishingZone2 = {
    --     title = "Fishing Spot 2",
    --     blip = {
    --         title = "Fishing Spot 2",
    --         coordinate = vector3(0.0000, 0.0000, 0.0000)
    --     },
    --     spots = {
    --         vector3(0.0000, 0.0000, 0.0000),
    --         vector3(0.0000, 0.0000, 0.0000)
    --     }
    -- }
}

Vision.RewardItems = {
    {item = "fish", chance = 40, valueMin = 1, valueMax = 5},
    {item = "money", chance = 40, valueMin = 1, valueMax = 100},
    {item = "garbage", chance = 90, valueMin = 1, valueMax = 5}
}

-- -----------------------------------
-- Vision Settings
-- -----------------------------------

Vision.Debug = true
Vision.UpdateCheck = true
Vision.FishingTime = 10000
Vision.KeyToFish = 38

-- -----------------------------------
-- Blip
-- -----------------------------------

Vision.BlipSettings = {
    sprite = 68,
    color = 27,
    scale = 0.8
}

-- -----------------------------------
-- Discord Webhook
-- -----------------------------------

Vision.DiscordNotify = false
Vision.Webhook = "https://discord.com/api/webhooks/000000000000000000000000000/000000000000000000000000000000000000000000000000000"