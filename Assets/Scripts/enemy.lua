speed = 5
startEntityName = "Block1"
endEntityName = "Block2"
yOffset = 5

InspectorVariables = {
    { name = "speed", type = "int", value = 5 },
    { name = "yOffset", type = "int", value = 5 },
    { name = "startEntityName", type = "string", value = "Block1" },
    { name = "endEntityName", type = "string", value = "Block2" }
}

startPos = nil
endPos = nil
direction = 1.0

function OnCreate(entityID)
end

function Setup()
    local startEnt = FindEntityByName(startEntityName)
    local endEnt = FindEntityByName(endEntityName)

    if startEnt and startEnt ~= 4294967295 then
        local t = GetTransform(startEnt)
        startPos = vec3.new(t.position.x, t.position.y + yOffset, t.position.z)
    end

    if endEnt and endEnt ~= 4294967295 then
        local t = GetTransform(endEnt)
        endPos = vec3.new(t.position.x, t.position.y + yOffset, t.position.z)
    end
end

function OnUpdate(entityID, dt)
    if not startPos or not endPos then 
        Setup()
        return
    end

    local trans = GetTransform(entityID)
    local pos = trans.position

    -- Move towards target
    local target = direction > 0 and endPos or startPos
    local diff = vec3.new(target.x - pos.x, target.y - pos.y, target.z - pos.z)
    local dist = math.sqrt(diff.x * diff.x + diff.y * diff.y + diff.z * diff.z)

    if dist < 0.3 then
        direction = -direction  -- toggling direction
    else
        local norm = vec3.new(diff.x / dist, diff.y / dist, diff.z / dist)
        
        newPos = vec3.new(
            pos.x + norm.x * speed * dt,
            pos.y + norm.y * speed * dt,
            pos.z + norm.z * speed * dt
        )
        trans:SetPosition(newPos)
    end
end

function OnCollision(selfID, otherID)
    local name = GetName(otherID)
    if name == "Player" then
        local playerScript = GetScript(otherID)
        if playerScript then
            local respawn = playerScript["Respawn"]
            if respawn then respawn(otherID) end
        end
    end
end