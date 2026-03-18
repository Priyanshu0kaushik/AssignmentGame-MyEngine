nextLevelName = "Level2"

InspectorVariables = {
    { name = "nextLevelName", type = "string", value = "Level2" }
}
function OnButtonClicked()
    local scenePath = "Scenes/" .. nextLevelName .. ".melevel"
    LoadScene(scenePath)
end