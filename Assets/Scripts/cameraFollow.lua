armLength = 12
heightOffset = 4    
smoothness = 10
pitchOffset = 18

InspectorVariables = {
    { name = "armLength",    type = "int", value = 12 },
    { name = "heightOffset", type = "int", value = 4 },
    { name = "smoothness",   type = "int", value = 10 },
    { name = "pitchOffset",  type = "int", value = 18 }
}

local pID = nil
local currentPitch = 18.0

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

    if not pTrans or not cTrans then return end

    local pRot = pTrans.rotation
    currentPitch = currentPitch + (pitchOffset - currentPitch) * (smoothness * dt)
    cTrans:SetRotation(vec3.new(currentPitch, pRot.y, pRot.z))

    local forward = cTrans:GetForward()
    
    -- target position
    local targetPos = vec3.new(
        pTrans.position.x - (forward.x * armLength),
        pTrans.position.y - (forward.y * armLength) + heightOffset,
        pTrans.position.z - (forward.z * armLength)
    )

    -- Lerp
    local curPos = cTrans.position
    cTrans:SetPosition(vec3.new(
        curPos.x + (targetPos.x - curPos.x) * (smoothness * dt),
        curPos.y + (targetPos.y - curPos.y) * (smoothness * dt),
        curPos.z + (targetPos.z - curPos.z) * (smoothness * dt)
    ))
end