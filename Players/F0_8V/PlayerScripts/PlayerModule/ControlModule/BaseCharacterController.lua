local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
local u2 = require(v1:WaitForChild("ConnectionUtil"))
local u3 = Vector3.new()
local u4 = {}
u4.__index = u4
function u4.new() --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    v6.enabled = false
    v6.moveVector = u3
    v6.moveVectorIsCameraRelative = true
    v6.isJumping = false
    v6._connectionUtil = u2.new()
    return v6
end
function u4.GetMoveVector(p7) --[[ Line: 45 ]]
    return p7.moveVector
end
function u4.IsMoveVectorCameraRelative(p8) --[[ Line: 49 ]]
    return p8.moveVectorIsCameraRelative
end
function u4.GetIsJumping(p9) --[[ Line: 53 ]]
    return p9.isJumping
end
function u4.Enable(_, _) --[[ Line: 59 ]]
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
    return false
end
return u4