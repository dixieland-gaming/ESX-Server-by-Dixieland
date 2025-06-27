lib.versionCheck('stevoscriptsteam/dxl_fruitpicking')
lib.locale()
local stevo_lib = exports['stevo_lib']:import()
local config = lib.require('config')

lib.callback.register('dxl_fruitpicking:pickFruit', function(source, type)
    local nearPoint = false 
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)

    for i = 1, #type.points do 
        local point = type.points[i]
        local dist = #(point - coords)
        if dist < type.interactDistance then 
            nearPoint = true
            break 
        end
    end

    if not nearPoint then
        local name = GetPlayerName(source)
        local identifier = stevo_lib.GetIdentifier(source)

        lib.print.info(('User: %s (%s) tried to exploit dxl_fruitpicking'):format(name, identifier))
        if config.dropCheaters then 
            DropPlayer(source, 'Trying to exploit dxl_fruitpicking')
        end
        return false
    end

    stevo_lib.AddItem(source, type.item, type.pickChance)

    if config.debug then
        local name = GetPlayerName(source)
        local identifier = stevo_lib.GetIdentifier(source)
        lib.print.info(('Added %s %s to %s (%s) via dxl_fruitpicking:pickFruit'):format(type.pickChance, type.item, name, identifier))
    end

    return true
end)

lib.callback.register('dxl_fruitpicking:sellFruit', function(source, all, item, buyer)

    if stevo_lib.HasItem(source, item) < 1 then 
        return false 
    end

    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local buyerCoords = buyer.ped.coords.xyz

    local dist = #(buyerCoords - coords)
    if dist > buyer.interactDistance then 
        local name = GetPlayerName(source)
        local identifier = stevo_lib.GetIdentifier(source)

        lib.print.info(('User: %s (%s) tried to exploit dxl_fruitpicking'):format(name, identifier))
        if config.dropCheaters then 
            DropPlayer(source, 'Trying to exploit dxl_fruitpicking')
        end
        return false
    end

    if not buyer.items[item] then 
        local name = GetPlayerName(source)
        local identifier = stevo_lib.GetIdentifier(source)

        lib.print.info(('User: %s (%s) tried to exploit dxl_fruitpicking'):format(name, identifier))
        if config.dropCheaters then 
            DropPlayer(source, 'Trying to exploit dxl_fruitpicking')
        end
        return false
    end

    local amount = all and stevo_lib.HasItem(source, item) or 1
    print(stevo_lib.HasItem(source, item))

    print(amount)

    stevo_lib.RemoveItem(source, item, amount)

    local payout = amount * buyer.items[item].sale

    stevo_lib.AddItem(source, config.moneyItem, payout)

    if config.debug then
        local name = GetPlayerName(source)
        local identifier = stevo_lib.GetIdentifier(source)
        lib.print.info(('Added $%s to %s (%s) via dxl_fruitpicking:sellFruit'):format(payout, name, identifier))
    end

    return payout
end)


AddEventHandler('onResourceStart', function(resource)
    if resource ~= cache.resource then return end
end)


AddEventHandler('onResourceStop', function(resource)
    if resource ~= cache.resource then return end
end)



 