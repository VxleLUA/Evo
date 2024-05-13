local allowedUserIds = {
    [5257022706] = true,
}

local function isAllowed(userId)
    return allowedUserIds[userId] == true
end
local function checkAuthorization()
    local player = game.Players.LocalPlayer
    local userId = player.UserId
    if not isAllowed(userId) then
        player:Kick("Authorization failed. You are not authorized to join this game.")
    end
end
if game.Players.LocalPlayer then
    checkAuthorization()
else
    game.Players.LocalPlayerAdded:Connect(checkAuthorization)
end
