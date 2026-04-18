local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
local v2 = require(v1:WaitForChild("FlagUtil"))
local u3 = Enum.ContextActionPriority.Medium.Value
local u4 = game:GetService("Players")
local u5 = game:GetService("ContextActionService")
local u6 = game:GetService("UserInputService")
local u7 = UserSettings().GameSettings
local u8 = require(script.Parent:WaitForChild("CameraUtils"))
local u9 = v2.getUserFlag("UserFixStuckShiftLock")
local u10 = {}
u10.__index = u10
function u10.new() --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u4
        [4] = u6
    --]]
    local v11 = u10
    local u12 = setmetatable({}, v11)
    u12.isMouseLocked = false
    u12.savedMouseCursor = nil
    u12.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift }
    u12.mouseLockToggledEvent = Instance.new("BindableEvent")
    local v13 = script:FindFirstChild("BoundKeys")
    if not (v13 and v13:IsA("StringValue")) then
        if v13 then
            v13:Destroy()
        end
        v13 = Instance.new("StringValue")
        assert(v13, "")
        v13.Name = "BoundKeys"
        v13.Value = "LeftShift,RightShift"
        v13.Parent = script
    end
    if v13 then
        v13.Changed:Connect(function(p14) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12:OnBoundKeysObjectChanged(p14)
        end)
        u12:OnBoundKeysObjectChanged(v13.Value)
    end
    u7.Changed:Connect(function(p15) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        if p15 == "ControlMode" or p15 == "ComputerMovementMode" then
            u12:UpdateMouseLockAvailability()
        end
    end)
    u4.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:UpdateMouseLockAvailability()
    end)
    u4.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:UpdateMouseLockAvailability()
    end)
    u6:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:UpdateMouseLockAvailability()
    end)
    u12:UpdateMouseLockAvailability()
    return u12
end
function u10.GetIsMouseLocked(p16) --[[ Line: 90 ]]
    return p16.isMouseLocked
end
function u10.GetBindableToggleEvent(p17) --[[ Line: 94 ]]
    return p17.mouseLockToggledEvent.Event
end
function u10.GetMouseLockOffset(_) --[[ Line: 98 ]]
    return Vector3.new(1.75, 0, 0)
end
function u10.UpdateMouseLockAvailability(p18) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u6
    --]]
    local v19 = u4.LocalPlayer.DevEnableMouseLock
    local v20 = u4.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
    local v21 = u7.ControlMode == Enum.ControlMode.MouseLockSwitch
    local v22 = u7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
    local v23 = u6.PreferredInput == Enum.PreferredInput.KeyboardAndMouse and (v19 and (v21 and not v22))
    if v23 then
        v23 = not v20
    end
    if v23 ~= p18.enabled then
        p18:EnableMouseLock(v23)
    end
end
function u10.OnBoundKeysObjectChanged(p24, p25) --[[ Line: 115 ]]
    p24.boundKeys = {}
    for v26 in string.gmatch(p25, "[^%s,]+") do
        for _, v27 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v26 == v27.Name then
                p24.boundKeys[#p24.boundKeys + 1] = v27
                break
            end
        end
    end
    p24:UnbindContextActions()
    p24:BindContextActions()
end
function u10.OnMouseLockToggled(p28) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    p28.isMouseLocked = not p28.isMouseLocked
    if p28.isMouseLocked then
        local v29 = script:FindFirstChild("CursorImage")
        if v29 and (v29:IsA("StringValue") and v29.Value) then
            u8.setMouseIconOverride(v29.Value)
        else
            if v29 then
                v29:Destroy()
            end
            local v30 = Instance.new("StringValue")
            assert(v30, "")
            v30.Name = "CursorImage"
            v30.Value = "rbxasset://textures/MouseLockedCursor.png"
            v30.Parent = script
            u8.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
        end
    else
        u8.restoreMouseIcon()
    end
    p28.mouseLockToggledEvent:Fire()
end
function u10.DoMouseLockSwitch(p31, _, p32, _) --[[ Line: 155 ]]
    if p32 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass
    end
    p31:OnMouseLockToggled()
    return Enum.ContextActionResult.Sink
end
function u10.BindContextActions(u33) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    local v34 = u5
    local v35 = u3
    local v36 = u33.boundKeys
    v34:BindActionAtPriority("MouseLockSwitchAction", function(p37, p38, p39) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        return u33:DoMouseLockSwitch(p37, p38, p39)
    end, false, v35, unpack(v36))
end
function u10.UnbindContextActions(_) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5:UnbindAction("MouseLockSwitchAction")
end
function u10.IsMouseLocked(p40) --[[ Line: 173 ]]
    local v41 = p40.enabled
    if v41 then
        v41 = p40.isMouseLocked
    end
    return v41
end
function u10.EnableMouseLock(p42, p43) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
    --]]
    if p43 ~= p42.enabled then
        p42.enabled = p43
        if p42.enabled then
            p42:BindContextActions()
            return
        end
        u8.restoreMouseIcon()
        p42:UnbindContextActions()
        if u9 then
            if p42.isMouseLocked then
                p42.isMouseLocked = false
                p42.mouseLockToggledEvent:Fire()
                return
            end
        else
            if p42.isMouseLocked then
                p42.mouseLockToggledEvent:Fire()
            end
            p42.isMouseLocked = false
        end
    end
end
return u10