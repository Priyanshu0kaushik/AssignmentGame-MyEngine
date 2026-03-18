local speed = 60.0
local turnSpeed = 120.0
local jumpForce = 1050.0 

local canJump = true

function OnUpdate(entityID, dt)

    local rb = GetRigidBody(entityID)
    local trans = GetTransform(entityID)
    if not rb or not trans then return end

    -- Rotation
    local rot = trans.rotation
    local yaw = rot.y
    if IsKeyPressed(65) then yaw = yaw - (turnSpeed * dt) -- A
    elseif IsKeyPressed(68) then yaw = yaw + (turnSpeed * dt) end -- D
    trans:SetRotation(vec3.new(rot.x, yaw, rot.z))

    -- Movement
    local forward = trans:GetForward()
    if IsKeyPressed(87) then rb:AddForce(forward * speed) -- W
    elseif IsKeyPressed(83) then rb:AddForce(forward * -speed) end -- S

    -- JUMP
    -- 32 - Space
    if IsKeyPressed(32) and canJump then
        rb:AddForce(vec3.new(0, jumpForce, 0))
        canJump = false
    end

    if not canJump and math.abs(rb.velocity.y) < 0.1 then
        canJump = true
    end

    
    if not IsKeyPressed(87) and not IsKeyPressed(83) then
        local v = rb.velocity
        rb.velocity = vec3.new(v.x * 0.95, v.y, v.z * 0.95)
    end
end