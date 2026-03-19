speed = 60
turnSpeed = 120
jumpForce = 700
maxSpeed = 8
groundFriction = 80
airFriction = 98

InspectorVariables = {
    { name = "speed",          type = "int", value = 60 },
    { name = "turnSpeed",      type = "int", value = 120 },
    { name = "jumpForce",      type = "int", value = 700 },
    { name = "maxSpeed",       type = "int", value = 8 },
    { name = "groundFriction", type = "int", value = 80 },
    { name = "airFriction",    type = "int", value = 98 }
}

canJump = false
isRespawning = false
respawnTimer = 0.0
jumpCooldown = 0.0

function OnUpdate(entityID, dt)
    if isRespawning then
        respawnTimer = respawnTimer - dt
        if respawnTimer <= 0 then isRespawning = false end
        return
    end

    local rb = GetRigidBody(entityID)
    local trans = GetTransform(entityID)
    local col = GetCollider(entityID)
    if not rb or not trans then return end

    if col then canJump = col.isColliding end
    if jumpCooldown > 0 then jumpCooldown = jumpCooldown - dt end

    -- Rotation
    local rot = trans.rotation
    local yaw = rot.y
    if IsKeyPressed(65) then yaw = yaw - (turnSpeed * dt)
    elseif IsKeyPressed(68) then yaw = yaw + (turnSpeed * dt) end
    trans:SetRotation(vec3.new(rot.x, yaw, rot.z))

    -- Movement
    local forward = trans:GetForward()
    local v = rb.velocity
    local horizSpeed = math.sqrt(v.x * v.x + v.z * v.z)

    if IsKeyPressed(87) then
        if horizSpeed < maxSpeed then rb:AddForce(forward * speed) end
    elseif IsKeyPressed(83) then
        if horizSpeed < maxSpeed then rb:AddForce(forward * -speed) end
    else
        -- Damping when not moving
        local gf = groundFriction / 100.0
        local af = airFriction / 100.0
        local friction = (col and col.isColliding) and gf or af
        rb.velocity = vec3.new(v.x * friction, v.y, v.z * friction)
    end

    -- Jump
    if IsKeyPressed(32) and canJump and jumpCooldown <= 0 then
        rb:AddForce(vec3.new(0, jumpForce, 0))
        canJump = false
        jumpCooldown = 0.3
    end

    -- Respawn
    local pos = trans.position
    if pos.y < -20 then
        isRespawning = true
        Respawn(entityID)
    end
end

function Respawn(entityID)
    local playerTrans = GetTransform(entityID)
    local startEnt = FindEntityByName("StartPoint")
    local startTrans = GetTransform(startEnt)
    local rb = GetRigidBody(entityID)
    if not playerTrans or not startTrans or not rb then return end

    local pos = startTrans.position
    playerTrans:SetPosition(vec3.new(pos.x, pos.y + 2.0, pos.z))
    rb.velocity.x = 0
    rb.velocity.y = 0
    rb.velocity.z = 0
    canJump = false
    isRespawning = true
    respawnTimer = 0.05
end