keysCollected = 0
totalKeys = 2
LastLevel = 0
nextLevelName = "Level2"

InspectorVariables = {
    { name = "totalKeys", type = "int", value = 2 },
    { name = "LastLevel", type = "int", value = 0 },
    { name = "nextLevelName", type = "string", value = "Level2" }
}

function AddKey()
    keysCollected = keysCollected + 1
    print("Key Collected! Total: " .. keysCollected)
    
    if keysCollected >= totalKeys then
        print("All keys collected! Loading Next Level.")
        if LastLevel > 0 then
            local finalTime = StopPlayTimer();

            local scoreData = string.format("%.2f", finalTime) .. ","
            AppendFile("scores.txt", scoreData)
            LoadScene("Scenes/MainLevel.melevel")
        else
            local scenePath = "Scenes/" .. nextLevelName .. ".melevel"
            LoadScene(scenePath)
        end
    end
end