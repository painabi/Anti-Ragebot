local playershootcount = 0
local playerhasused = false

AddEventHandler('CEventGunShot', function(witnesses, ped)
    local playerPed = PlayerPedId()
    local selectedWeapon = GetSelectedPedWeapon(playerPed)

    if Config.WhitelistedWeapons[selectedWeapon] then return end

    if ped == playerPed then
        local shooting = IsPedShooting(playerPed)

        playershootcount = playershootcount + 1

        Citizen.CreateThread(function()
            Wait(1000)
            playershootcount = playershootcount - 1
        end)
        if playershootcount > 500 and not detected then
            TriggerServerEvent('your_server_name:antieventlogger5455455454', playershootcount)
            playerhasused = true
        end
    end
end)
