local armLength = 12.0
local heightOffset = 4.5    
local smoothness = 10.0     

local pID = nil

function OnCreate(entityID)
    pID = FindEntityByName("Player")
end

function OnUpdate(entityID, dt)
    if not pID then 
        pID = FindEntityByName("Player")
        return 
    end

    local pTrans = GetTransform(pID)
    local cTrans = GetTransform(entityID)

    if pTrans and cTrans then
        local pRot = pTrans.rotation
        cTrans:SetRotation(vec3.new(pRot.x + 18, pRot.y, pRot.z))

        local forward = cTrans:GetForward()
        
        -- target position
        local targetPos = vec3.new(
            pTrans.position.x - (forward.x * armLength),
            pTrans.position.y - (forward.y * armLength) + heightOffset,
            pTrans.position.z - (forward.z * armLength)
        )

        -- Lerp
        local curPos = cTrans.position
        local nextPos = vec3.new(
            curPos.x + (targetPos.x - curPos.x) * (smoothness * dt),
            curPos.y + (targetPos.y - curPos.y) * (smoothness * dt),
            curPos.z + (targetPos.z - curPos.z) * (smoothness * dt)
        )

        cTrans:SetPosition(nextPos)
    end
end