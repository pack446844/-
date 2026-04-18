game:GetService("Players")
local u1 = game:GetService("GuiService")
local v2 = script.Parent.Parent:WaitForChild("CommonUtils")
local u3 = require(v2:WaitForChild("ConnectionUtil"))
local u4 = require(v2:WaitForChild("CharacterUtil"))
local u5 = require(v2:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC")
local u6
if u5 then
    u6 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
else
    u6 = nil
end
local u7 = { "rbxasset://textures/ui/Input/JumpButtonRegular.png", "rbxasset://textures/ui/Input/JumpButtonPressed.png" }
local u8 = {
    ["HUMANOID_STATE_ENABLED_CHANGED"] = "HUMANOID_STATE_ENABLED_CHANGED",
    ["HUMANOID_JUMP_POWER"] = "HUMANOID_JUMP_POWER",
    ["HUMANOID_JUMP_HEIGHT"] = "HUMANOID_JUMP_HEIGHT",
    ["HUMANOID"] = "HUMANOID",
    ["JUMP_INPUT_ENDED"] = "JUMP_INPUT_ENDED",
    ["MENU_OPENED"] = "MENU_OPENED"
}
local u9 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u10 = setmetatable({}, u9)
u10.__index = u10
function u10.new() --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u3
    --]]
    local v11 = u9.new()
    local v12 = u10
    local v13 = setmetatable(v11, v12)
    v13.parentUIFrame = nil
    v13.jumpButton = nil
    v13.externallyEnabled = false
    v13.isJumping = false
    v13._active = false
    v13._connectionUtil = u3.new()
    return v13
end
function u10._reset(p14) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
    --]]
    p14.isJumping = false
    p14.touchObject = nil
    if p14.jumpButton then
        if u5 and u6:isEnabled() then
            p14.jumpButton.Image = u7[1]
            return
        end
        p14.jumpButton.ImageRectOffset = Vector2.new(1, 146)
    end
end
function u10.EnableButton(u15, p16) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u1
    --]]
    if p16 ~= u15._active then
        if p16 then
            if not u15.jumpButton then
                u15:Create()
            end
            u15.jumpButton.Visible = true
            u15._connectionUtil:trackConnection(u8.JUMP_INPUT_ENDED, u15.jumpButton.InputEnded:Connect(function(p17) --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                if p17 == u15.touchObject then
                    u15:_reset()
                end
            end))
            u15._connectionUtil:trackConnection(u8.MENU_OPENED, u1.MenuOpened:Connect(function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                if u15.touchObject then
                    u15:_reset()
                end
            end))
        else
            if u15.jumpButton then
                u15.jumpButton.Visible = false
            end
            u15._connectionUtil:disconnect(u8.JUMP_INPUT_ENDED)
            u15._connectionUtil:disconnect(u8.MENU_OPENED)
        end
        u15:_reset()
        u15._active = p16
    end
end
function u10.UpdateEnabled(p18) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v19 = u4.getChild("Humanoid", "Humanoid")
    if v19 and p18.externallyEnabled and (v19.UseJumpPower and v19.JumpPower > 0 or not v19.UseJumpPower and v19.JumpHeight > 0) and v19:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
        p18:EnableButton(true)
    else
        p18:EnableButton(false)
    end
end
function u10._setupConfigurations(u20) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
    --]]
    local function u21() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:UpdateEnabled()
    end
    local v25 = u4.onChild("Humanoid", "Humanoid", function(p22) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u8
            [3] = u21
        --]]
        u20:UpdateEnabled()
        u20:_reset()
        u20._connectionUtil:trackConnection(u8.HUMANOID_JUMP_POWER, p22:GetPropertyChangedSignal("JumpPower"):Connect(u21))
        u20._connectionUtil:trackConnection(u8.HUMANOID_JUMP_HEIGHT, p22:GetPropertyChangedSignal("JumpHeight"):Connect(u21))
        u20._connectionUtil:trackConnection(u8.HUMANOID_STATE_ENABLED_CHANGED, p22.StateEnabledChanged:Connect(function(p23, p24) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if p23 == Enum.HumanoidStateType.Jumping and p24 ~= u20._active then
                u20:UpdateEnabled()
            end
        end))
    end)
    u20._connectionUtil:trackConnection(u8.HUMANOID, v25)
end
function u10.Enable(p26, p27, p28) --[[ Line: 172 ]]
    if p28 then
        p26.parentUIFrame = p28
    end
    if p26.externallyEnabled == p27 then
        return
    else
        p26.externallyEnabled = p27
        p26:UpdateEnabled()
        if p27 then
            p26:_setupConfigurations()
        else
            p26._connectionUtil:disconnectAll()
        end
    end
end
function u10.Create(u29) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
    --]]
    if u29.parentUIFrame then
        if u29.jumpButton then
            u29.jumpButton:Destroy()
            u29.jumpButton = nil
        end
        if u29.absoluteSizeChangedConn then
            u29.absoluteSizeChangedConn:Disconnect()
            u29.absoluteSizeChangedConn = nil
        end
        if u5 and u29.avatarAbilitiesEnabledChangedConn then
            u29.avatarAbilitiesEnabledChangedConn:Disconnect()
            u29.avatarAbilitiesEnabledChangedConn = nil
        end
        u29.jumpButton = Instance.new("ImageButton")
        u29.jumpButton.Name = "JumpButton"
        u29.jumpButton.Visible = false
        u29.jumpButton.BackgroundTransparency = 1
        if u5 and u6:isEnabled() then
            u29.jumpButton.Image = u7[1]
        else
            u29.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
            u29.jumpButton.ImageRectOffset = Vector2.new(1, 146)
            u29.jumpButton.ImageRectSize = Vector2.new(144, 144)
        end
        local function v36() --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u5
                [3] = u6
                [4] = u7
            --]]
            local v30 = u29.parentUIFrame.AbsoluteSize.x
            local v31 = u29.parentUIFrame.AbsoluteSize.y
            local v32 = math.min(v30, v31) <= 500
            if u5 and u6:isEnabled() then
                local v33 = v32 and 72 or 120
                local v34 = -v33 - (v32 and 64 or 88)
                u29.jumpButton.Image = u7[1]
                u29.jumpButton.ImageRectOffset = Vector2.new(0, 0)
                u29.jumpButton.ImageRectSize = Vector2.new(0, 0)
                u29.jumpButton.Size = UDim2.new(0, v33, 0, v33)
                u29.jumpButton.Position = UDim2.new(1, v34, 1, v34)
            else
                local v35 = v32 and 70 or 120
                if u5 then
                    u29.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
                    u29.jumpButton.ImageRectOffset = Vector2.new(1, 146)
                    u29.jumpButton.ImageRectSize = Vector2.new(144, 144)
                end
                u29.jumpButton.Size = UDim2.new(0, v35, 0, v35)
                u29.jumpButton.Position = v32 and UDim2.new(1, -(v35 * 1.5 - 10), 1, -v35 - 20) or UDim2.new(1, -(v35 * 1.5 - 10), 1, -v35 * 1.75)
            end
        end
        v36()
        u29.absoluteSizeChangedConn = u29.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v36)
        if u5 then
            u29.avatarAbilitiesEnabledChangedConn = u6:GetEnabledChangedSignal():Connect(v36)
        end
        u29.touchObject = nil
        u29.jumpButton.InputBegan:connect(function(p37) --[[ Line: 260 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u5
                [3] = u6
                [4] = u7
            --]]
            if not u29.touchObject and (p37.UserInputType == Enum.UserInputType.Touch and p37.UserInputState == Enum.UserInputState.Begin) then
                u29.touchObject = p37
                if u5 and u6:isEnabled() then
                    u29.jumpButton.Image = u7[2]
                else
                    u29.jumpButton.ImageRectOffset = Vector2.new(146, 146)
                end
                u29.isJumping = true
            end
        end)
        u29.jumpButton.Parent = u29.parentUIFrame
    end
end
return u10