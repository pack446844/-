game:GetService("Players")
local u1 = game:GetService("GuiService")
local u2 = game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local v3 = script.Parent.Parent:WaitForChild("CommonUtils")
local u4 = require(v3:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC")
local u5
if u4 then
    u5 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
else
    u5 = nil
end
local u6 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u7 = setmetatable({}, u6)
u7.__index = u7
function u7.new() --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v8 = u6.new()
    local v9 = u7
    local v10 = setmetatable(v8, v9)
    v10.isFollowStick = false
    v10.thumbstickFrame = nil
    v10.moveTouchObject = nil
    v10.onTouchMovedConn = nil
    v10.onTouchEndedConn = nil
    v10.screenPos = nil
    v10.stickImage = nil
    v10.thumbstickSize = nil
    return v10
end
function u7.Enable(p11, p12, p13) --[[ Line: 44 ]]
    if p12 == nil then
        return false
    end
    local v14 = p12 and true or false
    if p11.enabled == v14 then
        return true
    end
    p11.moveVector = Vector3.new(0, 0, 0)
    p11.isJumping = false
    if v14 then
        if not p11.thumbstickFrame then
            p11:Create(p13)
        end
        p11.thumbstickFrame.Visible = true
    else
        p11.thumbstickFrame.Visible = false
        p11:OnInputEnded()
    end
    p11.enabled = v14
end
function u7.OnInputEnded(p15) --[[ Line: 65 ]]
    p15.thumbstickFrame.Position = p15.screenPos
    p15.stickImage.Position = UDim2.new(0, p15.thumbstickFrame.Size.X.Offset / 2 - p15.thumbstickSize / 4, 0, p15.thumbstickFrame.Size.Y.Offset / 2 - p15.thumbstickSize / 4)
    p15.moveVector = Vector3.new(0, 0, 0)
    p15.isJumping = false
    p15.thumbstickFrame.Position = p15.screenPos
    p15.moveTouchObject = nil
end
function u7.Create(u16, u17) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u1
    --]]
    if u16.thumbstickFrame then
        u16.thumbstickFrame:Destroy()
        u16.thumbstickFrame = nil
        if u16.onTouchMovedConn then
            u16.onTouchMovedConn:Disconnect()
            u16.onTouchMovedConn = nil
        end
        if u16.onTouchEndedConn then
            u16.onTouchEndedConn:Disconnect()
            u16.onTouchEndedConn = nil
        end
        if u16.absoluteSizeChangedConn then
            u16.absoluteSizeChangedConn:Disconnect()
            u16.absoluteSizeChangedConn = nil
        end
        if u4 and u16.avatarAbilitiesEnabledChangedConn then
            u16.avatarAbilitiesEnabledChangedConn:Disconnect()
            u16.avatarAbilitiesEnabledChangedConn = nil
        end
    end
    u16.thumbstickFrame = Instance.new("Frame")
    u16.thumbstickFrame.Name = "ThumbstickFrame"
    u16.thumbstickFrame.Active = true
    u16.thumbstickFrame.Visible = false
    u16.thumbstickFrame.BackgroundTransparency = 1
    local u18 = Instance.new("ImageLabel")
    u18.Name = "OuterImage"
    u18.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    u18.ImageRectOffset = Vector2.new()
    u18.ImageRectSize = Vector2.new(220, 220)
    u18.BackgroundTransparency = 1
    u18.Position = UDim2.new(0, 0, 0, 0)
    u16.stickImage = Instance.new("ImageLabel")
    u16.stickImage.Name = "StickImage"
    u16.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    u16.stickImage.ImageRectOffset = Vector2.new(220, 0)
    u16.stickImage.ImageRectSize = Vector2.new(111, 111)
    u16.stickImage.BackgroundTransparency = 1
    u16.stickImage.ZIndex = 2
    local function v23() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u4
            [3] = u5
            [4] = u16
            [5] = u18
        --]]
        local v19 = u17.AbsoluteSize.X
        local v20 = u17.AbsoluteSize.Y
        local v21 = math.min(v19, v20) <= 500
        if u4 and u5:isEnabled() then
            local v22 = v21 and 64 or 88
            u16.thumbstickSize = v21 and 72 or 120
            u16.screenPos = UDim2.new(0, v22, 1, -u16.thumbstickSize - v22)
        else
            u16.thumbstickSize = v21 and 70 or 120
            u16.screenPos = v21 and UDim2.new(0, u16.thumbstickSize / 2 - 10, 1, -u16.thumbstickSize - 20) or UDim2.new(0, u16.thumbstickSize / 2, 1, -u16.thumbstickSize * 1.75)
        end
        u16.thumbstickFrame.Size = UDim2.new(0, u16.thumbstickSize, 0, u16.thumbstickSize)
        u16.thumbstickFrame.Position = u16.screenPos
        u18.Size = UDim2.new(0, u16.thumbstickSize, 0, u16.thumbstickSize)
        u16.stickImage.Size = UDim2.new(0, u16.thumbstickSize / 2, 0, u16.thumbstickSize / 2)
        u16.stickImage.Position = UDim2.new(0, u16.thumbstickSize / 2 - u16.thumbstickSize / 4, 0, u16.thumbstickSize / 2 - u16.thumbstickSize / 4)
    end
    v23()
    u16.absoluteSizeChangedConn = u17:GetPropertyChangedSignal("AbsoluteSize"):Connect(v23)
    if u4 then
        u16.avatarAbilitiesEnabledChangedConn = u5:GetEnabledChangedSignal():Connect(v23)
    end
    u18.Parent = u16.thumbstickFrame
    u16.stickImage.Parent = u16.thumbstickFrame
    local u24 = nil
    local function u31(p25) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u16
        --]]
        local v26 = Vector2.new(p25.X - u24.X, p25.Y - u24.Y)
        local v27 = v26.magnitude
        local v28 = u16.thumbstickFrame.AbsoluteSize.X / 2
        if u16.isFollowStick and v28 < v27 then
            local v29 = v26.unit * v28
            u16.thumbstickFrame.Position = UDim2.new(0, p25.X - u16.thumbstickFrame.AbsoluteSize.X / 2 - v29.X, 0, p25.Y - u16.thumbstickFrame.AbsoluteSize.Y / 2 - v29.Y)
        else
            local v30 = math.min(v27, v28)
            v26 = v26.unit * v30
        end
        u16.stickImage.Position = UDim2.new(0, v26.X + u16.stickImage.AbsoluteSize.X / 2, 0, v26.Y + u16.stickImage.AbsoluteSize.Y / 2)
    end
    u16.thumbstickFrame.InputBegan:Connect(function(p32) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u24
        --]]
        if not u16.moveTouchObject and (p32.UserInputType == Enum.UserInputType.Touch and p32.UserInputState == Enum.UserInputState.Begin) then
            u16.moveTouchObject = p32
            u16.thumbstickFrame.Position = UDim2.new(0, p32.Position.X - u16.thumbstickFrame.Size.X.Offset / 2, 0, p32.Position.Y - u16.thumbstickFrame.Size.Y.Offset / 2)
            u24 = Vector2.new(u16.thumbstickFrame.AbsolutePosition.X + u16.thumbstickFrame.AbsoluteSize.X / 2, u16.thumbstickFrame.AbsolutePosition.Y + u16.thumbstickFrame.AbsoluteSize.Y / 2)
            Vector2.new(p32.Position.X - u24.X, p32.Position.Y - u24.Y)
        end
    end)
    u16.onTouchMovedConn = u2.TouchMoved:Connect(function(p33, _) --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u24
            [3] = u31
        --]]
        if p33 == u16.moveTouchObject then
            u24 = Vector2.new(u16.thumbstickFrame.AbsolutePosition.X + u16.thumbstickFrame.AbsoluteSize.X / 2, u16.thumbstickFrame.AbsolutePosition.Y + u16.thumbstickFrame.AbsoluteSize.Y / 2)
            local v34 = Vector2.new(p33.Position.X - u24.X, p33.Position.Y - u24.Y) / (u16.thumbstickSize / 2)
            local v35 = v34.magnitude
            local v36
            if v35 < 0.05 then
                v36 = Vector3.new()
            else
                local v37 = v34.unit
                local v38 = (v35 - 0.05) / 0.95
                local v39 = v37 * math.min(1, v38)
                local v40 = v39.X
                local v41 = v39.Y
                v36 = Vector3.new(v40, 0, v41)
            end
            u16.moveVector = v36
            u31(p33.Position)
        end
    end)
    u16.onTouchEndedConn = u2.TouchEnded:Connect(function(p42, _) --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p42 == u16.moveTouchObject then
            u16:OnInputEnded()
        end
    end)
    u1.MenuOpened:Connect(function() --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if u16.moveTouchObject then
            u16:OnInputEnded()
        end
    end)
    u16.thumbstickFrame.Parent = u17
end
return u7