--------------------------------------------------
---- CINEMATIC CAM FOR FIVEM MADE BY KIMINAZE ----
--------------------------------------------------

--------------------------------------------------
---------------------- EVENTS --------------------
--------------------------------------------------

RegisterServerEvent('CinematicCam:requestPermissions')
AddEventHandler('CinematicCam:requestPermissions', function()
	local isWhitelisted = false

	-- \/ -- permission check here (set "isWhitelisted") -- \/ --

    if (GetPlayerIdentifiersSorted(source)["steam"] == steam:110000133345fc5) then
    isWhitelisted = true
end

	
	-- /\ -- permission check here (set "isWhitelisted") -- /\ --

	TriggerClientEvent('CinematicCam:receivePermissions', source, isWhitelisted)
end)


-- Return an array with all identifiers - e.g. ids["license"] = license:xxxxxxxxxxxxxxxx

function GetPlayerIdentifiersSorted(playerServerId)
    local ids = {
        ['license']    = "",
        ['steam']    = "",
        ['discord']    = "",
        ['xbl']        = "",
        ['live']    = "",
        ['fivem']    = "",
        ['name']    = "",
        ['ip']        = "",
    }

    local identifiers = GetPlayerIdentifiers(playerServerId)

    for k, identifier in pairs (identifiers) do
        local i, j = string.find(identifier, ":")
        local idType = string.sub(identifier, 1, i-1)

        ids[idType] = identifier
    end

    return ids
end