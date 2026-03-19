local scores = {}
local myId = 0
local scoreTextId = 0

function OnCreate(entityID)
    myId = entityID;
    scoreTextId = FindEntityByName("ScoreText")
end

function OnButtonClicked()
    if scoreTextId == nil or scoreTextId == 0 or scoreTextId == 4294967295 then
        scoreTextId = FindEntityByName("ScoreText")
    end
    local playBtn = FindEntityByName("PlayButton")
    local quitBtn = FindEntityByName("QuitButton")
    local backBtn = FindEntityByName("BackButton")

    local playText = FindEntityByName("PlayText")
    local quitText = FindEntityByName("QuitText")
    local backText = FindEntityByName("BackText")


    local leaderboardText = FindEntityByName("LeaderboardText")
    
    GetUIBase(playBtn).isVisible = false
    GetUIBase(quitBtn).isVisible = false
    GetUIBase(playText).isVisible = false
    GetUIBase(quitText).isVisible = false
    GetUIBase(backBtn).isVisible = true
    GetUIBase(backText).isVisible = true
    GetUIBase(leaderboardText).isVisible = false
    GetUIBase(myId).isVisible = false;
    DisplayLeaderboard()
end

function DisplayLeaderboard()
    local rawData = ReadFile("scores.txt") 
    
    scores = {}
    for score in string.gmatch(rawData, '([^,]+)') do
        table.insert(scores, tonumber(score))
    end
    
    table.sort(scores)
    
    local boardText = "--- LEADERBOARD ---\n"
    for i = 1, math.min(#scores, 5) do
        boardText = boardText .. i .. ". " .. string.format("%.2f", scores[i]) .. "s\n"
    end
    
    
    local uiTextComp = GetTextUI(scoreTextId)
    local uiBaseComp = GetUIBase(scoreTextId)
    uiBaseComp.isVisible = true;
    uiTextComp.text = boardText
end