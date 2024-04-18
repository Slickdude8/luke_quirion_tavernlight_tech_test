-- Let the storage key be a local variable
-- so we can change it without having to find every instance
-- within our code
local STORAGEKEY = 1000

local function releaseStorage(player)
    -- setStorageValue should take in a boolean instead
    -- of using -1 and 1 for values
    player:setStorageValue(STORAGEKEY, false)
end

function onLogout(player)
    -- since we are using booleans now, this expression can be simplified
    if player:getStorageValue(STORAGEKEY) then
        addEvent(releaseStorage, STORAGEKEY, player)
    end
    return true
end