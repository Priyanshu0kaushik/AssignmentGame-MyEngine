InspectorVariables = {
    { name = "LevelName", type = "string", value = "Level2" }
}
function OnButtonClicked()
    local currentLevel = LevelName

    local scenePath = "Scenes/" .. currentLevel .. ".melevel"
    print("Loading " .. currentLevel);
    if currentLevel == "Level1" then
        StartPlayTimer();
    end
    LoadScene(scenePath)
end