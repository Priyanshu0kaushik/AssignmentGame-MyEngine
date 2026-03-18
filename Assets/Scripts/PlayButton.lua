function OnButtonClicked()
    print("Play Button was clicked!")

    local playBtn = FindEntityByName("PlayButton")
    local quitBtn = FindEntityByName("QuitButton")

    local playText = FindEntityByName("PlayText")
    local quitText = FindEntityByName("QuitText")

    local lvl1btn = FindEntityByName("Level1Button")
    local lvl1text = FindEntityByName("Level1Text")

    local lvl2btn = FindEntityByName("Level2Button")
    local lvl2text = FindEntityByName("Level2Text")

    local lvl3btn = FindEntityByName("Level3Button")
    local lvl3text = FindEntityByName("Level3Text")

    local leaderboardText = FindEntityByName("LeaderboardText")
    local leaderboardBtn = FindEntityByName("LeaderboardButton")

    GetUIBase(playBtn).isVisible = false
    GetUIBase(quitBtn).isVisible = false
    GetUIBase(playText).isVisible = false
    GetUIBase(quitText).isVisible = false
    GetUIBase(leaderboardText).isVisible = false
    GetUIBase(leaderboardBtn).isVisible = false
    

    GetUIBase(lvl1btn).isVisible = true
    GetUIBase(lvl1text).isVisible = true

    GetUIBase(lvl2btn).isVisible = true
    GetUIBase(lvl2text).isVisible = true
    
    GetUIBase(lvl3btn).isVisible = true
    GetUIBase(lvl3text).isVisible = true

    

end