function OnCreate(entityID)
    myId = entityID;
end

function OnButtonClicked()
    local playBtn = FindEntityByName("PlayButton")
    local quitBtn = FindEntityByName("QuitButton")

    local playText = FindEntityByName("PlayText")
    local quitText = FindEntityByName("QuitText")
    local backText = FindEntityByName("BackText")


    local leaderboardText = FindEntityByName("LeaderboardText")
    local leaderboardBtn = FindEntityByName("LeaderboardButton")
    local scoreTextId = FindEntityByName("ScoreText")


    local backText = FindEntityByName("BackText")
    
    GetUIBase(playBtn).isVisible = true
    GetUIBase(quitBtn).isVisible = true
    GetUIBase(playText).isVisible = true
    GetUIBase(quitText).isVisible = true
    GetUIBase(leaderboardText).isVisible = true
    GetUIBase(leaderboardBtn).isVisible = true
    GetUIBase(scoreTextId).isVisible = false;
    GetUIBase(myId).isVisible = false;
    GetUIBase(backText).isVisible = false;
    

    DisplayLeaderboard()
end