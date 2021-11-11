ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(200)
    end
end)

local display = false

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while true do 
        local Sleep = 2000
        local PlayerPedId = PlayerPedId()
        local PlayerCoord = GetEntityCoords(PlayerPedId)
        for i = 1, #Config.BlackMarket, 1 do
            local DistanceBlackMarket = #(PlayerCoord - Config.BlackMarket[i].NPC)
            if DistanceBlackMarket < 3.0 then
                Sleep = 2
                DrawText3D(Config.BlackMarket[i].NPC.x, Config.BlackMarket[i].NPC.y, Config.BlackMarket[i].NPC.z + 2.0, '~r~E~w~ - '..Config.BlackMarket[i].Satici)
                if IsControlJustPressed(0, 38) then
                    ESX.TriggerServerCallback('server:BlackMarket:server:PoliceSayi', function(count)
                        if count >= Config.BlackMarket[i].Police then
                            OpenBlackMarket()
                        else
                            ESX.Notify("Şuan Olmaz!","Şehirde yeteri kadar polis yok!",3000,"warning")
                        end
                    end)
                end
            end
        end
        Citizen.Wait(Sleep)
    end
end)

function openMarket()
    SetDisplay(not display)
end

RegisterNetEvent('openmarket')
AddEventHandler('openmarket', function()
    SetDisplay(not display)
end)

RegisterNUICallback("esya1", function()
TriggerServerEvent("fraider:esya1")
end)

RegisterNUICallback("esya2", function()
    TriggerServerEvent("fraider:esya2")
end)


RegisterNUICallback("esya3", function()
    TriggerServerEvent("fraider:esya3")
  end)

RegisterNUICallback("esya4", function()
TriggerServerEvent("fraider:esya4")
end)


RegisterNUICallback("esya5", function()
TriggerServerEvent("fraider:esya5")
end)

RegisterNUICallback("esya6", function()
    TriggerServerEvent("fraider:esya6")
end)


RegisterNUICallback("esya7", function()
    TriggerServerEvent("fraider:esya7")
end)

function OpenBlackMarket()
    openMarket()
end

Citizen.CreateThread(function()
    for i = 1, #Config.BlackMarket, 1 do
    RequestModel(Config.BlackMarket[i].Hash)
    while not HasModelLoaded(Config.BlackMarket[i].Hash) do
        Wait(1)
    end
    npc = CreatePed(1, Config.BlackMarket[i].Hash, Config.BlackMarket[i].NPC.x, Config.BlackMarket[i].NPC.y, Config.BlackMarket[i].NPC.z, Config.BlackMarket[i].Heading, false, true)
    SetPedCombatAttributes(npc, 46, true)               
    SetPedFleeAttributes(npc, 0, 0)               
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    end
end)
