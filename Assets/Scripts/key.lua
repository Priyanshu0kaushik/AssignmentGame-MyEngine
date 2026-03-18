function OnCollision(myID, otherID)
    local otherName = GetName(otherID)
    
    if otherName == "Player" then
        local managerId = FindEntityByName("LevelManager")
        
        if managerId ~= 0 then
            local managerScript = GetScript(managerId)
            
            if managerScript then
                managerScript.AddKey()
            end
        end
        print("Key Collected by " .. otherName)
        DestroyEntity(myID) 
    end
end