local u1 = game:GetService("ContextActionService")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("Players")
game:GetService("RunService")
local u4 = UserSettings():GetService("UserGameSettings")
local u5 = game:GetService("VRService")
local u6 = game:GetService("GuiService")
local v7 = script.Parent.Parent:WaitForChild("CommonUtils")
local v8 = require(v7:WaitForChild("FlagUtil"))
local u9 = v8.getUserFlag("UserPSSinkUnknownTouchEvents")
local v10 = v8.getUserFlag("UserPSTextboxResetCameraInput")
local u11 = v3.LocalPlayer
local u12 = Enum.ContextActionPriority.Medium.Value
local u13 = Vector2.new(1, 0.77) * 0.06981317007977318 * 60
local u14 = Vector2.new(1, 0.77) * 0.008726646259971648
local u15 = Vector2.new(1, 0.77) * 0.12217304763960307
local u16 = Vector2.new(1, 0.66) * 0.017453292519943295
local u17 = Instance.new("BindableEvent")
local u18 = Instance.new("BindableEvent")
local u19 = u17.Event
local u20 = u18.Event
u2.InputBegan:Connect(function(p21, p22) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p22 and p21.UserInputType == Enum.UserInputType.MouseButton2 then
        u17:Fire()
    end
end)
u2.InputEnded:Connect(function(p23, _) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p23.UserInputType == Enum.UserInputType.MouseButton2 then
        u18:Fire()
    end
end)
local function u27(p24) --[[ Line: 61 ]]
    local v25 = (math.abs(p24) - 0.1) / 0.9 * 2
    local v26 = (math.exp(v25) - 1) / 6.38905609893065
    return math.sign(p24) * math.clamp(v26, 0, 1)
end
local function u32(p28) --[[ Line: 75 ]]
    local v29 = workspace.CurrentCamera
    if not v29 then
        return p28
    end
    local v30 = v29.CFrame:ToEulerAnglesYXZ()
    if p28.Y * v30 >= 0 then
        return p28
    end
    local v31 = (1 - (math.abs(v30) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25
    return Vector2.new(1, v31) * p28
end
local function u39(p33) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v34 = u11:FindFirstChildOfClass("PlayerGui")
    if v34 then
        v34 = v34:FindFirstChild("TouchGui")
    end
    local v35
    if v34 then
        v35 = v34:FindFirstChild("TouchControlFrame")
    else
        v35 = v34
    end
    if v35 then
        v35 = v35:FindFirstChild("DynamicThumbstickFrame")
    end
    if not v35 then
        return false
    end
    if not v34.Enabled then
        return false
    end
    local v36 = v35.AbsolutePosition
    local v37 = v36 + v35.AbsoluteSize
    local v38
    if p33.X >= v36.X and (p33.Y >= v36.Y and p33.X <= v37.X) then
        v38 = p33.Y <= v37.Y
    else
        v38 = false
    end
    return v38
end
local v40 = {}
local u41 = {}
local u42 = 0
local u43 = {
    ["Thumbstick2"] = Vector2.new()
}
local u44 = {
    ["Left"] = 0,
    ["Right"] = 0,
    ["I"] = 0,
    ["O"] = 0
}
local u45 = {
    ["Movement"] = Vector2.new(),
    ["Wheel"] = 0,
    ["Pan"] = Vector2.new(),
    ["Pinch"] = 0
}
local u46 = {
    ["Move"] = Vector2.new(),
    ["Pinch"] = 0
}
local u47 = Instance.new("BindableEvent")
v40.gamepadZoomPress = u47.Event
local u48 = u5.VREnabled and Instance.new("BindableEvent") or nil
if u5.VREnabled then
    v40.gamepadReset = u48.Event
end
function v40.getRotationActivated() --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u43
    --]]
    return u42 > 0 and true or u43.Thumbstick2.Magnitude > 0
end
function v40.getRotation(p49, p50) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u44
        [3] = u43
        [4] = u45
        [5] = u32
        [6] = u46
        [7] = u13
        [8] = u14
        [9] = u15
        [10] = u16
    --]]
    local v51 = Vector2.new(1, u4:GetCameraYInvertValue())
    local v52 = Vector2.new(u44.Right - u44.Left, 0) * p49
    local v53 = u43.Thumbstick2 * u4.GamepadCameraSensitivity * p49
    local v54 = u45.Movement
    local v55 = u45.Pan
    local v56 = u32(u46.Move)
    if p50 then
        v52 = Vector2.new()
    end
    return (v52 * 2.0943951023931953 + v53 * u13 + v54 * u14 + v55 * u15 + v56 * u16) * v51
end
function v40.getZoomDelta() --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u45
        [3] = u46
    --]]
    local v57 = u44.O - u44.I
    local v58 = -u45.Wheel + u45.Pinch
    local v59 = -u46.Pinch
    return v57 * 0.1 + v58 * 1 + v59 * 0.04
end
local function u62(_, _, p60) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u27
    --]]
    local v61 = p60.Position
    u43[p60.KeyCode.Name] = Vector2.new(u27(v61.X), -u27(v61.Y))
    return Enum.ContextActionResult.Pass
end
local function u65(_, p63, p64) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u44
    --]]
    u44[p64.KeyCode.Name] = p63 == Enum.UserInputState.Begin and 1 or 0
end
local function u67(_, p66, _) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u47
    --]]
    if p66 == Enum.UserInputState.Begin then
        u47:Fire()
    end
end
local function u69(_, p68, _) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    if p68 == Enum.UserInputState.Begin then
        u48:Fire()
    end
end
local function u74() --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u44
        [3] = u45
        [4] = u46
        [5] = u42
    --]]
    local v70 = {
        u43,
        u44,
        u45,
        u46
    }
    for _, v71 in pairs(v70) do
        for v72, v73 in pairs(v71) do
            if type(v73) == "boolean" then
                v71[v72] = false
            else
                v71[v72] = v71[v72] * 0
            end
        end
    end
    u42 = 0
end
local u75 = {}
local u76 = nil
local u77 = nil
local function u83(p78, p79) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u39
        [3] = u42
        [4] = u75
    --]]
    local v80 = p78.UserInputType == Enum.UserInputType.Touch
    assert(v80)
    local v81 = p78.UserInputState == Enum.UserInputState.Begin
    assert(v81)
    if u76 == nil and (u39(p78.Position) and not p79) then
        u76 = p78
    else
        if not p79 then
            local v82 = u42 + 1
            u42 = math.max(0, v82)
        end
        u75[p78] = p79
    end
end
local function u88(p84, _) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u75
        [3] = u77
        [4] = u42
    --]]
    local v85 = p84.UserInputType == Enum.UserInputType.Touch
    assert(v85)
    local v86 = p84.UserInputState == Enum.UserInputState.End
    assert(v86)
    if p84 == u76 then
        u76 = nil
    end
    if u75[p84] == false then
        u77 = nil
        local v87 = u42 - 1
        u42 = math.max(0, v87)
    end
    u75[p84] = nil
end
local function u100(p89, p90) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u75
        [3] = u9
        [4] = u46
        [5] = u77
    --]]
    local v91 = p89.UserInputType == Enum.UserInputType.Touch
    assert(v91)
    local v92 = p89.UserInputState == Enum.UserInputState.Change
    assert(v92)
    if p89 == u76 then
        return
    else
        if u75[p89] == nil then
            if u9 then
                u75[p89] = true
            else
                u75[p89] = p90
            end
        end
        local v93 = {}
        for v94, v95 in pairs(u75) do
            if not v95 then
                table.insert(v93, v94)
            end
        end
        if #v93 == 1 and u75[p89] == false then
            local v96 = p89.Delta
            local v97 = u46
            v97.Move = v97.Move + Vector2.new(v96.X, v96.Y)
        end
        if #v93 == 2 then
            local v98 = (v93[1].Position - v93[2].Position).Magnitude
            if u77 then
                local v99 = u46
                v99.Pinch = v99.Pinch + (v98 - u77)
            end
            u77 = v98
        else
            u77 = nil
        end
    end
end
local function u101() --[[ Line: 354 ]]
    --[[
    Upvalues:
        [1] = u75
        [2] = u76
        [3] = u77
        [4] = u42
    --]]
    u75 = {}
    u76 = nil
    u77 = nil
    u42 = 0
end
local function u106(p102, p103, p104, p105) --[[ Line: 362 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    if not p105 then
        u45.Wheel = p102
        u45.Pan = p103
        u45.Pinch = -p104
    end
end
local function u110(p107, p108) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u83
        [2] = u42
    --]]
    if p107.UserInputType == Enum.UserInputType.Touch then
        u83(p107, p108)
    elseif p107.UserInputType == Enum.UserInputType.MouseButton2 and not p108 then
        local v109 = u42 + 1
        u42 = math.max(0, v109)
    end
end
local function u114(p111, p112) --[[ Line: 379 ]]
    --[[
    Upvalues:
        [1] = u100
        [2] = u45
    --]]
    if p111.UserInputType == Enum.UserInputType.Touch then
        u100(p111, p112)
    elseif p111.UserInputType == Enum.UserInputType.MouseMovement then
        local v113 = p111.Delta
        u45.Movement = Vector2.new(v113.X, v113.Y)
    end
end
local function u118(p115, p116) --[[ Line: 388 ]]
    --[[
    Upvalues:
        [1] = u88
        [2] = u42
    --]]
    if p115.UserInputType == Enum.UserInputType.Touch then
        u88(p115, p116)
    elseif p115.UserInputType == Enum.UserInputType.MouseButton2 then
        local v117 = u42 - 1
        u42 = math.max(0, v117)
    end
end
local u119 = false
function v40.setInputEnabled(p120) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u119
        [2] = u74
        [3] = u101
        [4] = u1
        [5] = u62
        [6] = u12
        [7] = u65
        [8] = u5
        [9] = u69
        [10] = u67
        [11] = u41
        [12] = u2
        [13] = u110
        [14] = u114
        [15] = u118
        [16] = u106
        [17] = u6
    --]]
    if u119 == p120 then
        return
    else
        u119 = p120
        u74()
        u101()
        if u119 then
            u1:BindActionAtPriority("RbxCameraThumbstick", u62, false, u12, Enum.KeyCode.Thumbstick2)
            u1:BindActionAtPriority("RbxCameraKeypress", u65, false, u12, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
            if u5.VREnabled then
                u1:BindAction("RbxCameraGamepadReset", u69, false, Enum.KeyCode.ButtonL3)
            end
            u1:BindAction("RbxCameraGamepadZoom", u67, false, Enum.KeyCode.ButtonR3)
            local v121 = u41
            local v122 = u2.InputBegan
            local v123 = u110
            table.insert(v121, v122:Connect(v123))
            local v124 = u41
            local v125 = u2.InputChanged
            local v126 = u114
            table.insert(v124, v125:Connect(v126))
            local v127 = u41
            local v128 = u2.InputEnded
            local v129 = u118
            table.insert(v127, v128:Connect(v129))
            local v130 = u41
            local v131 = u2.PointerAction
            local v132 = u106
            table.insert(v130, v131:Connect(v132))
            local v133 = u41
            local v134 = u6.MenuOpened
            local v135 = u101
            table.insert(v133, v134:connect(v135))
        else
            u1:UnbindAction("RbxCameraThumbstick")
            u1:UnbindAction("RbxCameraMouseMove")
            u1:UnbindAction("RbxCameraMouseWheel")
            u1:UnbindAction("RbxCameraKeypress")
            u1:UnbindAction("RbxCameraGamepadZoom")
            if u5.VREnabled then
                u1:UnbindAction("RbxCameraGamepadReset")
            end
            for _, v136 in pairs(u41) do
                v136:Disconnect()
            end
            u41 = {}
        end
    end
end
function v40.getInputEnabled() --[[ Line: 468 ]]
    --[[
    Upvalues:
        [1] = u119
    --]]
    return u119
end
function v40.resetInputForFrameEnd() --[[ Line: 472 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u46
    --]]
    u45.Movement = Vector2.new()
    u46.Move = Vector2.new()
    u46.Pinch = 0
    u45.Wheel = 0
    u45.Pan = Vector2.new()
    u45.Pinch = 0
end
u2.WindowFocused:Connect(u74)
u2.WindowFocusReleased:Connect(u74)
if v10 then
    u2.TextBoxFocusReleased:Connect(u74)
end
local u137 = false
local u138 = false
local u139 = 0
function v40.getHoldPan() --[[ Line: 496 ]]
    --[[
    Upvalues:
        [1] = u137
    --]]
    return u137
end
function v40.getTogglePan() --[[ Line: 500 ]]
    --[[
    Upvalues:
        [1] = u138
    --]]
    return u138
end
function v40.getPanning() --[[ Line: 504 ]]
    --[[
    Upvalues:
        [1] = u138
        [2] = u137
    --]]
    return u138 or u137
end
function v40.setTogglePan(p140) --[[ Line: 508 ]]
    --[[
    Upvalues:
        [1] = u138
    --]]
    u138 = p140
end
local u141 = false
local u142 = nil
local u143 = nil
function v40.enableCameraToggleInput() --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u141
        [2] = u137
        [3] = u138
        [4] = u142
        [5] = u143
        [6] = u19
        [7] = u139
        [8] = u20
        [9] = u2
    --]]
    if not u141 then
        u141 = true
        u137 = false
        u138 = false
        if u142 then
            u142:Disconnect()
        end
        if u143 then
            u143:Disconnect()
        end
        u142 = u19:Connect(function() --[[ Line: 533 ]]
            --[[
            Upvalues:
                [1] = u137
                [2] = u139
            --]]
            u137 = true
            u139 = tick()
        end)
        u143 = u20:Connect(function() --[[ Line: 538 ]]
            --[[
            Upvalues:
                [1] = u137
                [2] = u139
                [3] = u138
                [4] = u2
            --]]
            u137 = false
            if tick() - u139 < 0.3 and (u138 or u2:GetMouseDelta().Magnitude < 2) then
                u138 = not u138
            end
        end)
    end
end
function v40.disableCameraToggleInput() --[[ Line: 546 ]]
    --[[
    Upvalues:
        [1] = u141
        [2] = u142
        [3] = u143
    --]]
    if u141 then
        u141 = false
        if u142 then
            u142:Disconnect()
            u142 = nil
        end
        if u143 then
            u143:Disconnect()
            u143 = nil
        end
    end
end
return v40