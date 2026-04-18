local u1 = game:GetService("UserInputService")
local u2 = game:GetService("ContextActionService")
script.Parent.Parent:WaitForChild("CommonUtils")
local u3 = Vector3.new()
local u4 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u5 = setmetatable({}, u4)
u5.__index = u5
function u5.new(p6) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v7 = u4.new()
    local v8 = u5
    local v9 = setmetatable(v7, v8)
    v9.CONTROL_ACTION_PRIORITY = p6
    v9.forwardValue = 0
    v9.backwardValue = 0
    v9.leftValue = 0
    v9.rightValue = 0
    v9.jumpEnabled = true
    return v9
end
function u5.Enable(p10, p11) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p11 == p10.enabled then
        return true
    end
    p10.forwardValue = 0
    p10.backwardValue = 0
    p10.leftValue = 0
    p10.rightValue = 0
    p10.moveVector = u3
    p10.jumpRequested = false
    p10:UpdateJump()
    if p11 then
        p10:BindContextActions()
        p10:ConnectFocusEventListeners()
    else
        p10._connectionUtil:disconnectAll()
    end
    p10.enabled = p11
    return true
end
function u5.UpdateMovement(p12, p13) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p13 == Enum.UserInputState.Cancel then
        p12.moveVector = u3
    else
        local v14 = p12.leftValue + p12.rightValue
        local v15 = p12.forwardValue + p12.backwardValue
        p12.moveVector = Vector3.new(v14, 0, v15)
    end
end
function u5.UpdateJump(p16) --[[ Line: 72 ]]
    p16.isJumping = p16.jumpRequested
end
function u5.BindContextActions(u17) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2:BindActionAtPriority("moveForwardAction", function(_, p18, _) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.forwardValue = p18 == Enum.UserInputState.Begin and -1 or 0
        u17:UpdateMovement(p18)
        return Enum.ContextActionResult.Pass
    end, false, u17.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
    u2:BindActionAtPriority("moveBackwardAction", function(_, p19, _) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.backwardValue = p19 == Enum.UserInputState.Begin and 1 or 0
        u17:UpdateMovement(p19)
        return Enum.ContextActionResult.Pass
    end, false, u17.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
    u2:BindActionAtPriority("moveLeftAction", function(_, p20, _) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.leftValue = p20 == Enum.UserInputState.Begin and -1 or 0
        u17:UpdateMovement(p20)
        return Enum.ContextActionResult.Pass
    end, false, u17.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
    u2:BindActionAtPriority("moveRightAction", function(_, p21, _) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.rightValue = p21 == Enum.UserInputState.Begin and 1 or 0
        u17:UpdateMovement(p21)
        return Enum.ContextActionResult.Pass
    end, false, u17.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
    u2:BindActionAtPriority("jumpAction", function(_, p22, _) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v23 = u17
        local v24 = u17.jumpEnabled
        if v24 then
            v24 = p22 == Enum.UserInputState.Begin
        end
        v23.jumpRequested = v24
        u17:UpdateJump()
        return Enum.ContextActionResult.Pass
    end, false, u17.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
    u17._connectionUtil:trackBoundFunction("moveForwardAction", function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2:UnbindAction("moveForwardAction")
    end)
    u17._connectionUtil:trackBoundFunction("moveBackwardAction", function() --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2:UnbindAction("moveBackwardAction")
    end)
    u17._connectionUtil:trackBoundFunction("moveLeftAction", function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2:UnbindAction("moveLeftAction")
    end)
    u17._connectionUtil:trackBoundFunction("moveRightAction", function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2:UnbindAction("moveRightAction")
    end)
    u17._connectionUtil:trackBoundFunction("jumpAction", function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2:UnbindAction("jumpAction")
    end)
end
function u5.ConnectFocusEventListeners(u25) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local function v26() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u3
        --]]
        u25.moveVector = u3
        u25.forwardValue = 0
        u25.backwardValue = 0
        u25.leftValue = 0
        u25.rightValue = 0
        u25.jumpRequested = false
        u25:UpdateJump()
    end
    u25._connectionUtil:trackConnection("textBoxFocusReleased", u1.TextBoxFocusReleased:Connect(v26))
    u25._connectionUtil:trackConnection("textBoxFocused", u1.TextBoxFocused:Connect(function(_) --[[ Name: onTextFocusGained, Line 143 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.jumpRequested = false
        u25:UpdateJump()
    end))
    u25._connectionUtil:trackConnection("windowFocusReleased", u1.WindowFocused:Connect(v26))
end
return u5