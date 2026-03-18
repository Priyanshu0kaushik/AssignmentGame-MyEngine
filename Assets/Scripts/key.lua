function OnCollision(myID, otherID)
    local otherName = GetName(otherID)
    
    if otherName == "Player" then
        print("Key Collected by " .. otherName)
        DestroyEntity(myID) 
    end
end