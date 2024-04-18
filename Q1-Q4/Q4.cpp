void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // this bool is for memory management to keep track of
    // if we used the new keyword to make the player this method
    bool created_player = false;

    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        // player is instantiated using the 'new' keyword
        // it needs to be deleted once finished
        player = new Player(nullptr);
        created_player = true;
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        // before returning, check if we created the player within this method and delete it
        if(created_player){
            delete player;
        }
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    // delete the player if we created a new one in this method
    if(created_player) {
        delete player;
    }
}