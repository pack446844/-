local u1 = Enum.ContextActionPriority.High.Value
local u2 = {
    0.10999999999999999,
    0.30000000000000004,
    0.4,
    0.5,
    0.6,
    0.7,
    0.75
}
local u3 = #u2
local u4 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v5 = game:GetService("Players")
local u6 = game:GetService("GuiService")
local u7 = game:GetService("UserInputService")
local u8 = game:GetService("ContextActionService")
local u9 = game:GetService("RunService")
local u10 = game:GetService("TweenService")
local v11 = script.Parent.Parent:WaitForChild("CommonUtils")
local u12 = require(v11:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC")
local v13, v14 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local u15 = v13 and v14
local u16
if u12 then
    u16 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
else
    u16 = nil
end
local u17 = v5.LocalPlayer
if not u17 then
    v5:GetPropertyChangedSignal("LocalPlayer"):Wait()
    u17 = v5.LocalPlayer
end
local u18 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u19 = setmetatable({}, u18)
u19.__index = u19
function u19.new() --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
    --]]
    local v20 = u18.new()
    local v21 = u19
    local v22 = setmetatable(v20, v21)
    v22.moveTouchObject = nil
    v22.moveTouchLockedIn = false
    v22.moveTouchFirstChanged = false
    v22.moveTouchStartPosition = nil
    v22.startImage = nil
    v22.endImage = nil
    v22.middleImages = {}
    v22.startImageFadeTween = nil
    v22.endImageFadeTween = nil
    v22.middleImageFadeTweens = {}
    v22.isFirstTouch = true
    v22.thumbstickFrame = nil
    v22.onRenderSteppedConn = nil
    v22.fadeInAndOutBalance = 0.5
    v22.fadeInAndOutHalfDuration = 0.3
    v22.hasFadedBackgroundInPortrait = false
    v22.hasFadedBackgroundInLandscape = false
    v22.tweenInAlphaStart = nil
    v22.tweenOutAlphaStart = nil
    return v22
end
function u19.GetIsJumping(p23) --[[ Line: 98 ]]
    local v24 = p23.isJumping
    p23.isJumping = false
    return v24
end
function u19.Enable(p25, p26, p27) --[[ Line: 104 ]]
    if p26 == nil then
        return false
    end
    local v28 = p26 and true or false
    if p25.enabled == v28 then
        return true
    end
    if v28 then
        if not p25.thumbstickFrame then
            p25:Create(p27)
        end
        p25:BindContextActions()
    else
        p25:UnbindContextActions()
        p25:OnInputEnded()
    end
    p25.enabled = v28
    p25.thumbstickFrame.Visible = v28
    return nil
end
function u19.OnInputEnded(p29) --[[ Line: 129 ]]
    p29.moveTouchObject = nil
    p29.moveVector = Vector3.new(0, 0, 0)
    p29:FadeThumbstick(false)
end
function u19.FadeThumbstick(p30, p31) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u2
    --]]
    if p31 or not p30.moveTouchObject then
        if p30.isFirstTouch then
            return
        else
            if p30.startImageFadeTween then
                p30.startImageFadeTween:Cancel()
            end
            if p30.endImageFadeTween then
                p30.endImageFadeTween:Cancel()
            end
            for v32 = 1, #p30.middleImages do
                if p30.middleImageFadeTweens[v32] then
                    p30.middleImageFadeTweens[v32]:Cancel()
                end
            end
            if p31 then
                p30.startImageFadeTween = u10:Create(p30.startImage, u4, {
                    ["ImageTransparency"] = 0
                })
                p30.startImageFadeTween:Play()
                p30.endImageFadeTween = u10:Create(p30.endImage, u4, {
                    ["ImageTransparency"] = 0.2
                })
                p30.endImageFadeTween:Play()
                for v33 = 1, #p30.middleImages do
                    p30.middleImageFadeTweens[v33] = u10:Create(p30.middleImages[v33], u4, {
                        ["ImageTransparency"] = u2[v33]
                    })
                    p30.middleImageFadeTweens[v33]:Play()
                end
            else
                p30.startImageFadeTween = u10:Create(p30.startImage, u4, {
                    ["ImageTransparency"] = 1
                })
                p30.startImageFadeTween:Play()
                p30.endImageFadeTween = u10:Create(p30.endImage, u4, {
                    ["ImageTransparency"] = 1
                })
                p30.endImageFadeTween:Play()
                for v34 = 1, #p30.middleImages do
                    p30.middleImageFadeTweens[v34] = u10:Create(p30.middleImages[v34], u4, {
                        ["ImageTransparency"] = 1
                    })
                    p30.middleImageFadeTweens[v34]:Play()
                end
            end
        end
    else
        return
    end
end
function u19.FadeThumbstickFrame(p35, p36, p37) --[[ Line: 178 ]]
    p35.fadeInAndOutHalfDuration = p36 * 0.5
    p35.fadeInAndOutBalance = p37
    p35.tweenInAlphaStart = tick()
end
function u19.InputInFrame(p38, p39) --[[ Line: 184 ]]
    local v40 = p38.thumbstickFrame.AbsolutePosition
    local v41 = v40 + p38.thumbstickFrame.AbsoluteSize
    local v42 = p39.Position
    return v42.X >= v40.X and (v42.Y >= v40.Y and (v42.X <= v41.X and v42.Y <= v41.Y))
end
function u19.DoFadeInBackground(p43) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v44 = u17:FindFirstChildOfClass("PlayerGui")
    local v45 = false
    if v44 then
        if v44.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or v44.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight then
            v45 = p43.hasFadedBackgroundInLandscape
            p43.hasFadedBackgroundInLandscape = true
        elseif v44.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait then
            v45 = p43.hasFadedBackgroundInPortrait
            p43.hasFadedBackgroundInPortrait = true
        end
    end
    if not v45 then
        p43.fadeInAndOutHalfDuration = 0.3
        p43.fadeInAndOutBalance = 0.5
        p43.tweenInAlphaStart = tick()
    end
end
function u19.DoMove(p46, p47) --[[ Line: 219 ]]
    local v48
    if p47.Magnitude < p46.radiusOfDeadZone then
        v48 = Vector3.new(0, 0, 0)
    else
        local v49 = p47.Unit
        local v50 = (p46.radiusOfMaxSpeed - p47.Magnitude) / p46.radiusOfMaxSpeed
        local v51 = v49 * (1 - math.max(0, v50))
        local v52 = v51.X
        local v53 = v51.Y
        v48 = Vector3.new(v52, 0, v53)
    end
    p46.moveVector = v48
end
function u19.LayoutMiddleImages(p54, p55, p56) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v57 = p54.thumbstickSize / 2 + p54.middleSize
    local v58 = p56 - p55
    local v59 = v58.Magnitude - p54.thumbstickRingSize / 2 - p54.middleSize
    local v60 = v58.Unit
    local v61 = p54.middleSpacing * u3
    local v62 = p54.middleSpacing
    if v61 < v59 then
        v62 = v59 / u3
    end
    for v63 = 1, u3 do
        local v64 = p54.middleImages[v63]
        local v65 = v57 + v62 * (v63 - 2)
        local v66 = v57 + v62 * (v63 - 1)
        if v65 < v59 then
            local v67 = p56 - v60 * v66
            local v68 = 1 - (v66 - v59) / v62
            local v69 = math.clamp(v68, 0, 1)
            v64.Visible = true
            v64.Position = UDim2.new(0, v67.X, 0, v67.Y)
            v64.Size = UDim2.new(0, p54.middleSize * v69, 0, p54.middleSize * v69)
        else
            v64.Visible = false
        end
    end
end
function u19.MoveStick(p70, p71) --[[ Line: 268 ]]
    local v72 = Vector2.new(p70.moveTouchStartPosition.X, p70.moveTouchStartPosition.Y) - p70.thumbstickFrame.AbsolutePosition
    local v73 = Vector2.new(p71.X, p71.Y) - p70.thumbstickFrame.AbsolutePosition
    p70.endImage.Position = UDim2.new(0, v73.X, 0, v73.Y)
    p70:LayoutMiddleImages(v72, v73)
end
function u19.BindContextActions(u74) --[[ Line: 276 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u1
        [4] = u7
    --]]
    local function u77(p75) --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u74
            [2] = u10
        --]]
        if u74.moveTouchObject then
            return Enum.ContextActionResult.Pass
        end
        if not u74:InputInFrame(p75) then
            return Enum.ContextActionResult.Pass
        end
        if u74.isFirstTouch then
            u74.isFirstTouch = false
            local v76 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
            u10:Create(u74.startImage, v76, {
                ["Size"] = UDim2.new(0, 0, 0, 0)
            }):Play()
            u10:Create(u74.endImage, v76, {
                ["Size"] = UDim2.new(0, u74.thumbstickSize, 0, u74.thumbstickSize),
                ["ImageColor3"] = Color3.new(0, 0, 0)
            }):Play()
        end
        u74.moveTouchLockedIn = false
        u74.moveTouchObject = p75
        u74.moveTouchStartPosition = p75.Position
        u74.moveTouchFirstChanged = true
        u74:DoFadeInBackground()
        return Enum.ContextActionResult.Pass
    end
    local function u83(p78) --[[ Line: 309 ]]
        --[[
        Upvalues:
            [1] = u74
        --]]
        if p78 ~= u74.moveTouchObject then
            return Enum.ContextActionResult.Pass
        end
        if u74.moveTouchFirstChanged then
            u74.moveTouchFirstChanged = false
            local v79 = Vector2.new(p78.Position.X - u74.thumbstickFrame.AbsolutePosition.X, p78.Position.Y - u74.thumbstickFrame.AbsolutePosition.Y)
            u74.startImage.Visible = true
            u74.startImage.Position = UDim2.new(0, v79.X, 0, v79.Y)
            u74.endImage.Visible = true
            u74.endImage.Position = u74.startImage.Position
            u74:FadeThumbstick(true)
            u74:MoveStick(p78.Position)
        end
        u74.moveTouchLockedIn = true
        local v80 = Vector2.new(p78.Position.X - u74.moveTouchStartPosition.X, p78.Position.Y - u74.moveTouchStartPosition.Y)
        local v81 = v80.X
        if math.abs(v81) <= 0 then
            local v82 = v80.Y
            if math.abs(v82) <= 0 then
                ::l7::
                return Enum.ContextActionResult.Sink
            end
        end
        u74:DoMove(v80)
        u74:MoveStick(p78.Position)
        goto l7
    end
    u8:BindActionAtPriority("DynamicThumbstickAction", function(_, p84, p85) --[[ Name: handleInput, Line 352 ]]
        --[[
        Upvalues:
            [1] = u77
            [2] = u74
        --]]
        if p84 == Enum.UserInputState.Begin then
            return u77(p85)
        elseif p84 == Enum.UserInputState.Change then
            if p85 == u74.moveTouchObject then
                return Enum.ContextActionResult.Sink
            else
                return Enum.ContextActionResult.Pass
            end
        else
            if p84 == Enum.UserInputState.End then
                if p85 == u74.moveTouchObject then
                    u74:OnInputEnded()
                    if u74.moveTouchLockedIn then
                        return Enum.ContextActionResult.Sink
                    end
                end
                return Enum.ContextActionResult.Pass
            end
            if p84 == Enum.UserInputState.Cancel then
                u74:OnInputEnded()
            end
            return
        end
    end, false, u1, Enum.UserInputType.Touch)
    u74.TouchMovedCon = u7.TouchMoved:Connect(function(p86, _) --[[ Line: 375 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        u83(p86)
    end)
end
function u19.UnbindContextActions(p87) --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8:UnbindAction("DynamicThumbstickAction")
    if p87.TouchMovedCon then
        p87.TouchMovedCon:Disconnect()
    end
end
function u19.Create(u88, u89) --[[ Line: 388 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u3
        [4] = u2
        [5] = u16
        [6] = u9
        [7] = u7
        [8] = u6
        [9] = u17
    --]]
    if u88.thumbstickFrame then
        u88.thumbstickFrame:Destroy()
        u88.thumbstickFrame = nil
        if u88.onRenderSteppedConn then
            u88.onRenderSteppedConn:Disconnect()
            u88.onRenderSteppedConn = nil
        end
        if u88.absoluteSizeChangedConn then
            u88.absoluteSizeChangedConn:Disconnect()
            u88.absoluteSizeChangedConn = nil
        end
        if u12 and u88.avatarAbilitiesEnabledChangedConn then
            u88.avatarAbilitiesEnabledChangedConn:Disconnect()
            u88.avatarAbilitiesEnabledChangedConn = nil
        end
    end
    local u90 = u15 and 100 or 0
    u88.thumbstickFrame = Instance.new("Frame")
    u88.thumbstickFrame.BorderSizePixel = 0
    u88.thumbstickFrame.Name = "DynamicThumbstickFrame"
    u88.thumbstickFrame.Visible = false
    u88.thumbstickFrame.BackgroundTransparency = 1
    u88.thumbstickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    u88.thumbstickFrame.Active = false
    u88.thumbstickFrame.Size = UDim2.new(0.4, u90, 0.6666666666666666, u90)
    u88.thumbstickFrame.Position = UDim2.new(0, -u90, 0.3333333333333333, 0)
    u88.startImage = Instance.new("ImageLabel")
    u88.startImage.Name = "ThumbstickStart"
    u88.startImage.Visible = true
    u88.startImage.BackgroundTransparency = 1
    u88.startImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
    u88.startImage.ImageRectOffset = Vector2.new(1, 1)
    u88.startImage.ImageRectSize = Vector2.new(144, 144)
    u88.startImage.ImageColor3 = Color3.new(0, 0, 0)
    u88.startImage.AnchorPoint = Vector2.new(0.5, 0.5)
    u88.startImage.ZIndex = 10
    u88.startImage.Parent = u88.thumbstickFrame
    u88.endImage = Instance.new("ImageLabel")
    u88.endImage.Name = "ThumbstickEnd"
    u88.endImage.Visible = true
    u88.endImage.BackgroundTransparency = 1
    u88.endImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
    u88.endImage.ImageRectOffset = Vector2.new(1, 1)
    u88.endImage.ImageRectSize = Vector2.new(144, 144)
    u88.endImage.AnchorPoint = Vector2.new(0.5, 0.5)
    u88.endImage.ZIndex = 10
    u88.endImage.Parent = u88.thumbstickFrame
    local function u92(p91) --[[ Line: 409 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u90
        --]]
        if p91 then
            u88.thumbstickFrame.Size = UDim2.new(1, u90, 0.4, u90)
            u88.thumbstickFrame.Position = UDim2.new(0, -u90, 0.6, 0)
        else
            u88.thumbstickFrame.Size = UDim2.new(0.4, u90, 0.6666666666666666, u90)
            u88.thumbstickFrame.Position = UDim2.new(0, -u90, 0.3333333333333333, 0)
        end
    end
    for v93 = 1, u3 do
        u88.middleImages[v93] = Instance.new("ImageLabel")
        u88.middleImages[v93].Name = "ThumbstickMiddle"
        u88.middleImages[v93].Visible = false
        u88.middleImages[v93].BackgroundTransparency = 1
        u88.middleImages[v93].Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
        u88.middleImages[v93].ImageRectOffset = Vector2.new(1, 1)
        u88.middleImages[v93].ImageRectSize = Vector2.new(144, 144)
        u88.middleImages[v93].ImageTransparency = u2[v93]
        u88.middleImages[v93].AnchorPoint = Vector2.new(0.5, 0.5)
        u88.middleImages[v93].ZIndex = 9
        u88.middleImages[v93].Parent = u88.thumbstickFrame
    end
    local function v101() --[[ Line: 465 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u12
            [3] = u88
            [4] = u16
            [5] = u90
        --]]
        local v94 = u89.AbsoluteSize
        local v95 = v94.X
        local v96 = v94.Y
        local v97 = math.min(v95, v96) > 500
        if u12 then
            local v98 = v97 and 2 or 1
            u88.thumbstickSize = 45 * v98
            u88.thumbstickRingSize = 20 * v98
            u88.middleSize = 10 * v98
            u88.middleSpacing = 14 * v98
            u88.radiusOfDeadZone = 2 * v98
            u88.radiusOfMaxSpeed = 20 * v98
            local v99 = 74 * v98
            if u16:isEnabled() then
                local v100 = v97 and 88 or 64
                u88.startImage.Position = UDim2.new(0, v99 * 0.5 + u90 + v100, 1, -v99 * 0.5 - u90 - v100)
                u88.startImage.Size = UDim2.new(0, v99, 0, v99)
            else
                u88.startImage.Position = UDim2.new(0, u88.thumbstickRingSize * 3.3 + u90, 1, -u88.thumbstickRingSize * 2.8 - u90)
                u88.startImage.Size = UDim2.new(0, v99, 0, v99)
            end
        else
            if v97 then
                u88.thumbstickSize = 90
                u88.thumbstickRingSize = 40
                u88.middleSize = 20
                u88.middleSpacing = 28
                u88.radiusOfDeadZone = 4
                u88.radiusOfMaxSpeed = 40
            else
                u88.thumbstickSize = 45
                u88.thumbstickRingSize = 20
                u88.middleSize = 10
                u88.middleSpacing = 14
                u88.radiusOfDeadZone = 2
                u88.radiusOfMaxSpeed = 20
            end
            u88.startImage.Position = UDim2.new(0, u88.thumbstickRingSize * 3.3 + u90, 1, -u88.thumbstickRingSize * 2.8 - u90)
            u88.startImage.Size = UDim2.new(0, u88.thumbstickRingSize * 3.7, 0, u88.thumbstickRingSize * 3.7)
        end
        u88.endImage.Position = u88.startImage.Position
        u88.endImage.Size = UDim2.new(0, u88.thumbstickSize * 0.8, 0, u88.thumbstickSize * 0.8)
    end
    v101()
    u88.absoluteSizeChangedConn = u89:GetPropertyChangedSignal("AbsoluteSize"):Connect(v101)
    if u12 then
        u88.avatarAbilitiesEnabledChangedConn = u16:GetEnabledChangedSignal():Connect(v101)
    end
    local u102 = nil
    local function v107() --[[ Line: 528 ]]
        --[[
        Upvalues:
            [1] = u102
            [2] = u92
        --]]
        if u102 then
            u102:Disconnect()
            u102 = nil
        end
        local u103 = workspace.CurrentCamera
        if u103 then
            local function v105() --[[ Line: 535 ]]
                --[[
                Upvalues:
                    [1] = u103
                    [2] = u92
                --]]
                local v104 = u103.ViewportSize
                u92(v104.X < v104.Y)
            end
            u102 = u103:GetPropertyChangedSignal("ViewportSize"):Connect(v105)
            local v106 = u103.ViewportSize
            u92(v106.X < v106.Y)
        end
    end
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v107)
    if workspace.CurrentCamera then
        v107()
    end
    u88.moveTouchStartPosition = nil
    u88.startImageFadeTween = nil
    u88.endImageFadeTween = nil
    u88.middleImageFadeTweens = {}
    u88.onRenderSteppedConn = u9.RenderStepped:Connect(function() --[[ Line: 555 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        if u88.tweenInAlphaStart == nil then
            if u88.tweenOutAlphaStart ~= nil then
                local v108 = tick() - u88.tweenOutAlphaStart
                local v109 = u88.fadeInAndOutHalfDuration * 2 - u88.fadeInAndOutHalfDuration * 2 * u88.fadeInAndOutBalance
                local v110 = u88.thumbstickFrame
                local v111 = v108 / v109
                v110.BackgroundTransparency = math.min(v111, 1) * 0.35 + 0.65
                if v109 < v108 then
                    u88.tweenOutAlphaStart = nil
                end
            end
        else
            local v112 = tick() - u88.tweenInAlphaStart
            local v113 = u88.fadeInAndOutHalfDuration * 2 * u88.fadeInAndOutBalance
            local v114 = u88.thumbstickFrame
            local v115 = v112 / v113
            v114.BackgroundTransparency = 1 - math.min(v115, 1) * 0.35
            if v113 < v112 then
                u88.tweenOutAlphaStart = tick()
                u88.tweenInAlphaStart = nil
                return
            end
        end
    end)
    u88.onTouchEndedConn = u7.TouchEnded:connect(function(p116) --[[ Line: 574 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        if p116 == u88.moveTouchObject then
            u88:OnInputEnded()
        end
    end)
    u6.MenuOpened:connect(function() --[[ Line: 580 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        if u88.moveTouchObject then
            u88:OnInputEnded()
        end
    end)
    local u117 = u17:FindFirstChildOfClass("PlayerGui")
    while not u117 do
        u17.ChildAdded:wait()
        u117 = u17:FindFirstChildOfClass("PlayerGui")
    end
    local u118 = nil
    local u119 = u117.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft and true or u117.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight
    local _ = u117:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 602 ]]
        --[[
        Upvalues:
            [1] = u119
            [2] = u117
            [3] = u118
            [4] = u88
        --]]
        if u119 and u117.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait or not u119 and u117.CurrentScreenOrientation ~= Enum.ScreenOrientation.Portrait then
            u118:disconnect()
            u88.fadeInAndOutHalfDuration = 2.5
            u88.fadeInAndOutBalance = 0.05
            u88.tweenInAlphaStart = tick()
            if u119 then
                u88.hasFadedBackgroundInPortrait = true
                return
            end
            u88.hasFadedBackgroundInLandscape = true
        end
    end)
    u88.thumbstickFrame.Parent = u89
    if game:IsLoaded() then
        u88.fadeInAndOutHalfDuration = 2.5
        u88.fadeInAndOutBalance = 0.05
        u88.tweenInAlphaStart = tick()
    else
        coroutine.wrap(function() --[[ Line: 622 ]]
            --[[
            Upvalues:
                [1] = u88
            --]]
            game.Loaded:Wait()
            u88.fadeInAndOutHalfDuration = 2.5
            u88.fadeInAndOutBalance = 0.05
            u88.tweenInAlphaStart = tick()
        end)()
    end
end
return u19