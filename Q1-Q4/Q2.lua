function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < ?;"

    -- the way string.format and %d were used is vulnerable to SQL injection
    -- parameterizing the membercount values should help protect against that
    -- storeQuery should take in optional arguments for parameterizing
    local resultId = db.storeQuery(selectGuildQuery, memberCount)

    if resultId then
        -- in order to print all the guild names, you'll need to loop over the set
        repeat
            local guildName = resultId.getString("name")
            print(guildName)
        -- loop over the set until there are no more rows
        until not resultId.next()
        -- free the set
        resultId.free()
    else
        print("Could not retrieve guild names")
    end
end