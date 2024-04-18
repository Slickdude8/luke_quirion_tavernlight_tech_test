function remove_player_from_PlayerParty(playerId, membername)
    local player = Player(playerId)
    local party = player:getParty()

    -- instead of using k and v, which are not descriptive,
    -- change v to a more descriptive name, and k to _ to denote the key
    -- of the pair isnt used
    for _, party_member in pairs(party:getMembers()) do

        if party_member == Player(membername) then
            party:removeMember(Player(membername))

            -- short circuit the for loop once the player has been removed
            return true
        end
    end
    -- there is no player matching the given id and name in the party
    return false
end