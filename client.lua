local whitelistedweapons = Config.WhitelistedWeapons[selectedWeapon]
local playershootcount = 0
local playerhasused = false

AddEventHandler('CEventGunShot', function(witnesses, ped)
    local playerPed = PlayerPedId()
    local selectedWeapon = GetSelectedPedWeapon(playerPed)

    if whitelistedweapons then return end

    if ped == playerPed then
        local shooting = IsPedShooting(playerPed)

        playershootcount = playershootcount + 1

        Citizen.CreateThread(function()
            Wait(1000)
            playershootcount = playershootcount - 1
        end)
        if playershootcount > 500 and not detected then
            DropPlayer('Player has used RageBot Count:'..playershootcount..'')
            playerhasused = true
        end
    end
end)
