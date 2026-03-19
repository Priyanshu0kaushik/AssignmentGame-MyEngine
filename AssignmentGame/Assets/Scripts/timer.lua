function OnUpdate(entityID, dt)
    GetTextUI(entityID).text = string.format("%.2f", GetPlayTime());
end
