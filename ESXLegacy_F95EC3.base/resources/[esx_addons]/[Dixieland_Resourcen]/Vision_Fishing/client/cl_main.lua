local isFishing = false
local inFishingZone = false

if Vision.Debug then
    local filename = function()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("^.*/(.*).lua$") or str
    end
    print("^1[DEBUG]^0 ^3-^0 "..filename()..".lua^0 ^2Loaded^0!");
end

function CreateFishingBlips()
    for zoneName, zoneInfo in pairs(Vision.FishingZones) do
        local blip = AddBlipForCoord(zoneInfo.blip.coordinate)

        SetBlipSprite(blip, Vision.BlipSettings.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Vision.BlipSettings.scale)
        SetBlipColour(blip, Vision.BlipSettings.color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(zoneInfo.blip.title)
        EndTextCommandSetBlipName(blip)

        if Vision.Debug then
            print(string.format("^1[DEBUG]^0 ^3-^0 Blip ^2Loaded^0: ^5%s^0 at ^4(%.2f, %.2f, %.2f)^0", zoneInfo.blip.title, zoneInfo.blip.coordinate.x, zoneInfo.blip.coordinate.y, zoneInfo.blip.coordinate.z))
        end
    end
end

Citizen.CreateThread(function()
    CreateFishingBlips()

    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local inFishingZone = false
        local playerPosX, playerPosY, playerPosZ = coords.x, coords.y, coords.z

        for zoneName, zoneInfo in pairs(Vision.FishingZones) do
            for i = 1, #zoneInfo.spots do
                local spot = zoneInfo.spots[i]
                local spotPosX, spotPosY, spotPosZ = spot.x, spot.y, spot.z
        
                local distanceSquared = (playerPosX - spotPosX) ^ 2 + (playerPosY - spotPosY) ^ 2 + (playerPosZ - spotPosZ + 1.0) ^ 2
        
                if distanceSquared < 100.0 then
                    inFishingZone = true
                    
                    DrawMarker(1, spotPosX, spotPosY, spotPosZ - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.0, 155, 88, 242, 100, false, true, 2, nil, nil, false)
        
                    if distanceSquared < 2.25 then
                        ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to fish')
                        
                        if IsControlJustReleased(0, Vision.KeyToFish) and not isFishing then
                            StartFishing()
                        end
                    end
                end
            end
        end

        if not inFishingZone then
            Citizen.Wait(1000)
        end
    end
end)

function StartFishing()
    isFishing = true
    local playerPed = PlayerPedId()
    
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("You now start fishing")
    EndTextCommandThefeedPostTicker(true, true)

    if Vision.Debug then
        print("^1[DEBUG]^0 ^3-^0 Start ^2Info^0: You now start fishing!^0")
    end

    FreezeEntityPosition(playerPed, true)

    local fishingRodModel = "prop_fishing_rod_01"
    RequestModel(fishingRodModel)

    while not HasModelLoaded(fishingRodModel) do
        Citizen.Wait(100)
    end

    local rod = CreateObject(fishingRodModel, 0, 0, 0, true, true, false)
    AttachEntityToEntity(rod, playerPed, GetPedBoneIndex(playerPed, 60309), 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

    RemoveAnimDict('mini@tennis')
    RemoveAnimDict('amb@world_human_stand_fishing@idle_a')

    local animDict1 = 'amb@world_human_stand_fishing@idle_a'
    local animName1 = 'idle_c'
    RequestAnimDict(animDict1)

    while not HasAnimDictLoaded(animDict1) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(playerPed, animDict1, animName1, 1.0, -1.0, -1, 11, 0, false, false, false)

    Citizen.Wait(Vision.FishingTime)

    DeleteObject(rod)
    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)

    if math.random() < 0.5 then
        TriggerServerEvent('vision_fishing:givefish')
    else
        TriggerEvent("vision_fishing:fishnotcaught")
    end

    isFishing = false
end

RegisterNetEvent("vision_fishing:fishcaught")
AddEventHandler("vision_fishing:fishcaught", function(item, value)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("You got ~b~" .. value .. " " .. item .. "~s~!")
    EndTextCommandThefeedPostTicker(true, true)

    if Vision.Debug then
        print("^1[DEBUG]^0 ^3-^0 Item ^2Info^0: You got " .. value .. " " .. item .. "!^0")
    end
end)

RegisterNetEvent("vision_fishing:fishnotcaught")
AddEventHandler("vision_fishing:fishnotcaught", function(item)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName("You didn't catch anything")
    EndTextCommandThefeedPostTicker(true, true)

    if Vision.Debug then
        print("^1[DEBUG]^0 ^3-^0 Item ^2Info^0: You didn't catch anything!^0")
    end
end)

RegisterNetEvent("vision_fishing:startfishing")
AddEventHandler("vision_fishing:startfishing", function()
    StartFishing()
end)
