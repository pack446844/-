local u1 = {}
u1.__index = u1
local u2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local u4 = game:GetService("UserInputService")
local u5 = game:GetService("GuiService")
local u6 = game:GetService("Workspace")
local u7 = UserSettings():GetService("UserGameSettings")
local u8 = game:GetService("VRService")
script.Parent:WaitForChild("CommonUtils")
local u9 = require(script:WaitForChild("Keyboard"))
local u10 = require(script:WaitForChild("Gamepad"))
local u11 = require(script:WaitForChild("DynamicThumbstick"))
local v12, v13 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local u14 = v12 and v13
local u15 = require(script:WaitForChild("TouchThumbstick"))
local u16 = require(script:WaitForChild("ClickToMoveController"))
local u17 = require(script:WaitForChild("TouchJump"))
local u18 = require(script:WaitForChild("VehicleController"))
local u19 = Enum.ContextActionPriority.Medium.Value
local u20 = {
    [Enum.TouchMovementMode.DPad] = u11,
    [Enum.DevTouchMovementMode.DPad] = u11,
    [Enum.TouchMovementMode.Thumbpad] = u11,
    [Enum.DevTouchMovementMode.Thumbpad] = u11,
    [Enum.TouchMovementMode.Thumbstick] = u15,
    [Enum.DevTouchMovementMode.Thumbstick] = u15,
    [Enum.TouchMovementMode.DynamicThumbstick] = u11,
    [Enum.DevTouchMovementMode.DynamicThumbstick] = u11,
    [Enum.TouchMovementMode.ClickToMove] = u16,
    [Enum.DevTouchMovementMode.ClickToMove] = u16,
    [Enum.TouchMovementMode.Default] = u11,
    [Enum.ComputerMovementMode.Default] = u9,
    [Enum.ComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.Scriptable] = nil,
    [Enum.ComputerMovementMode.ClickToMove] = u16,
    [Enum.DevComputerMovementMode.ClickToMove] = u16
}
function u1.new() --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u18
        [4] = u19
        [5] = u3
        [6] = u7
        [7] = u5
        [8] = u4
    --]]
    local v21 = u1
    local u22 = setmetatable({}, v21)
    u22.controllers = {}
    u22.activeControlModule = nil
    u22.activeController = nil
    u22.touchJumpController = nil
    u22.moveFunction = u2.LocalPlayer.Move
    u22.humanoid = nil
    u22.controlsEnabled = true
    u22.humanoidSeatedConn = nil
    u22.vehicleController = nil
    u22.touchControlFrame = nil
    u22.currentTorsoAngle = 0
    u22.inputMoveVector = Vector3.new(0, 0, 0)
    u22.vehicleController = u18.new(u19)
    u2.LocalPlayer.CharacterAdded:Connect(function(p23) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:OnCharacterAdded(p23)
    end)
    u2.LocalPlayer.CharacterRemoving:Connect(function(p24) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:OnCharacterRemoving(p24)
    end)
    if u2.LocalPlayer.Character then
        u22:OnCharacterAdded(u2.LocalPlayer.Character)
    end
    u3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p25) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:OnRenderStepped(p25)
    end)
    u7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
    end)
    u7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
    end)
    u22.playerGui = nil
    u22.touchGui = nil
    u22.playerGuiAddedConn = nil
    u5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
        u22:UpdateActiveControlModuleEnabled()
    end)
    u4:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:UpdateMovementMode()
    end)
    u22.playerGui = u2.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not u22.playerGui then
        u22.playerGuiAddedConn = u2.LocalPlayer.ChildAdded:Connect(function(p26) --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if p26:IsA("PlayerGui") then
                u22.playerGui = p26
                u22.playerGuiAddedConn:Disconnect()
                u22.playerGuiAddedConn = nil
                u22:UpdateMovementMode()
            end
        end)
    end
    u22:UpdateMovementMode()
    return u22
end
function u1.GetMoveVector(p27) --[[ Line: 167 ]]
    return not p27.activeController and Vector3.new(0, 0, 0) or p27.activeController:GetMoveVector()
end
function u1.GetEstimatedVRTorsoFrame(p28) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v29 = u8:GetUserCFrame(Enum.UserCFrame.Head)
    local _, v30, _ = v29:ToEulerAnglesYXZ()
    local v31 = -v30
    if u8:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and u8:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        local v32 = u8:GetUserCFrame(Enum.UserCFrame.LeftHand)
        local v33 = u8:GetUserCFrame(Enum.UserCFrame.RightHand)
        local v34 = v29.Position - v32.Position
        local v35 = v29.Position - v33.Position
        local v36 = v34.X
        local v37 = v34.Z
        local v38 = -math.atan2(v36, v37)
        local v39 = v35.X
        local v40 = v35.Z
        local v41 = (-math.atan2(v39, v40) - v38 + 12.566370614359172) % 6.283185307179586
        if v41 > 3.141592653589793 then
            v41 = v41 - 6.283185307179586
        end
        local v42 = (v38 + v41 / 2 + 12.566370614359172) % 6.283185307179586
        if v42 > 3.141592653589793 then
            v42 = v42 - 6.283185307179586
        end
        local v43 = (v31 - p28.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v43 > 3.141592653589793 then
            v43 = v43 - 6.283185307179586
        end
        local v44 = (v42 - p28.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v44 > 3.141592653589793 then
            v44 = v44 - 6.283185307179586
        end
        local v45
        if v44 > -1.5707963267948966 then
            v45 = v44 < 1.5707963267948966
        else
            v45 = false
        end
        if not v45 then
            v44 = v43
        end
        local v46 = math.min(v44, v43)
        local v47 = math.max(v44, v43)
        local v48 = 0
        if v46 > 0 then
            v47 = v46
        elseif v47 >= 0 then
            v47 = v48
        end
        p28.currentTorsoAngle = v47 + p28.currentTorsoAngle
    else
        p28.currentTorsoAngle = v31
    end
    return CFrame.new(v29.Position) * CFrame.fromEulerAnglesYXZ(0, -p28.currentTorsoAngle, 0)
end
function u1.GetActiveController(p49) --[[ Line: 231 ]]
    return p49.activeController
end
function u1.UpdateActiveControlModuleEnabled(u50) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u16
        [4] = u15
        [5] = u11
        [6] = u17
        [7] = u5
    --]]
    local function v51() --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u4
            [3] = u16
            [4] = u15
            [5] = u11
            [6] = u17
            [7] = u2
        --]]
        if u50.touchControlFrame and (u4.PreferredInput == Enum.PreferredInput.Touch and (u50.activeControlModule == u16 or (u50.activeControlModule == u15 or u50.activeControlModule == u11))) then
            if not u50.controllers[u17] then
                u50.controllers[u17] = u17.new()
            end
            u50.touchJumpController = u50.controllers[u17]
            u50.touchJumpController:Enable(true, u50.touchControlFrame)
        elseif u50.touchJumpController then
            u50.touchJumpController:Enable(false)
        end
        if u50.activeControlModule == u16 then
            u50.activeController:Enable(true, u2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, u50.touchJumpController)
            return
        elseif u50.touchControlFrame then
            u50.activeController:Enable(true, u50.touchControlFrame)
        else
            u50.activeController:Enable(true)
        end
    end
    if u50.activeController then
        if u50.controlsEnabled then
            if u5.TouchControlsEnabled or (u4.PreferredInput ~= Enum.PreferredInput.Touch or u50.activeControlModule ~= u16 and (u50.activeControlModule ~= u15 and u50.activeControlModule ~= u11)) then
                v51()
            else
                u50.activeController:Enable(false)
                if u50.touchJumpController then
                    u50.touchJumpController:Enable(false)
                end
                if u50.moveFunction then
                    u50.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
                end
            end
        else
            u50.activeController:Enable(false)
            if u50.touchJumpController then
                u50.touchJumpController:Enable(false)
            end
            if u50.moveFunction then
                u50.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
            end
            return
        end
    else
        return
    end
end
function u1.Enable(p52, p53) --[[ Line: 307 ]]
    local v54 = p53 == nil and true or p53
    if p52.controlsEnabled == v54 then
        return
    else
        p52.controlsEnabled = v54
        if p52.activeController then
            p52:UpdateActiveControlModuleEnabled()
        end
    end
end
function u1.Disable(p55) --[[ Line: 322 ]]
    p55:Enable(false)
end
function u1.SelectComputerMovementModule(_) --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u10
        [4] = u9
        [5] = u7
        [6] = u16
        [7] = u20
    --]]
    if u4.KeyboardEnabled or u4.GamepadEnabled then
        local v56 = nil
        local v57 = u2.LocalPlayer.DevComputerMovementMode
        if v57 == Enum.DevComputerMovementMode.UserChoice then
            if u4.PreferredInput == Enum.PreferredInput.Gamepad then
                v56 = u10
            elseif u4.PreferredInput == Enum.PreferredInput.KeyboardAndMouse then
                v56 = u9
            end
            if u7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v56 == u9 then
                v56 = u16
            end
        else
            v56 = u20[v57]
            if not v56 and v57 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", v57)
            end
        end
        if v56 then
            return v56, true
        elseif v57 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true
        else
            return nil, false
        end
    else
        return nil, false
    end
end
function u1.SelectTouchModule(_) --[[ Line: 371 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u7
    --]]
    local v58 = u2.LocalPlayer.DevTouchMovementMode
    local v59
    if v58 == Enum.DevTouchMovementMode.UserChoice then
        v59 = u20[u7.TouchMovementMode]
    else
        if v58 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true
        end
        v59 = u20[v58]
    end
    return v59, true
end
local function u62() --[[ Line: 384 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v60 = u4:GetGamepadState(Enum.UserInputType.Gamepad1)
    for _, v61 in pairs(v60) do
        if v61.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v61.Position
        end
    end
    return Vector3.new(0, 0, 0)
end
function u1.calculateRawMoveVector(p63, p64, p65) --[[ Line: 394 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u62
    --]]
    local v66 = u6.CurrentCamera
    if not v66 then
        return p65
    end
    local v67 = v66.CFrame
    if u8.VREnabled and p64.RootPart then
        u8:GetUserCFrame(Enum.UserCFrame.Head)
        local v68 = p63:GetEstimatedVRTorsoFrame()
        if (v66.Focus.Position - v67.Position).Magnitude < 3 then
            v67 = v67 * v68
        else
            v67 = v66.CFrame * (v68.Rotation + v68.Position * v66.HeadScale)
        end
    end
    if p64:GetState() ~= Enum.HumanoidStateType.Swimming then
        local _, _, _, v73, v70, v71, _, _, v72, _, _, v73 = v67:GetComponents()
        if v72 >= 1 or v72 <= -1 then
            v71 = -v70 * math.sign(v72)
        end
        local v74 = v73 * v73 + v71 * v71
        local v75 = math.sqrt(v74)
        local v76 = (v73 * p65.X + v71 * p65.Z) / v75
        local v77 = (v73 * p65.Z - v71 * p65.X) / v75
        return Vector3.new(v76, 0, v77)
    end
    if not u8.VREnabled then
        return v67:VectorToWorldSpace(p65)
    end
    local v78 = p65.X
    local v79 = p65.Z
    local v80 = Vector3.new(v78, 0, v79)
    if v80.Magnitude < 0.01 then
        return Vector3.new(0, 0, 0)
    end
    local v81 = -u62().Y * 1.3962634015954636
    local v82 = -v80.X
    local v83 = -v80.Z
    local v84 = math.atan2(v82, v83)
    local _, v85, _ = v67:ToEulerAnglesYXZ()
    local v86 = v84 + v85
    return CFrame.fromEulerAnglesYXZ(v81, v86, 0).LookVector
end
function u1.OnRenderStepped(p87, p88) --[[ Line: 453 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u2
    --]]
    if p87.activeController and (p87.activeController.enabled and p87.humanoid) then
        local v89 = p87.activeController:GetMoveVector()
        local v90 = p87.activeController:IsMoveVectorCameraRelative()
        local v91 = p87:GetClickToMoveController()
        if p87.activeController == v91 then
            v91:OnRenderStepped(p88)
        elseif v89.magnitude > 0 then
            v91:CleanupPath()
        else
            v91:OnRenderStepped(p88)
            v89 = v91:GetMoveVector()
            v90 = v91:IsMoveVectorCameraRelative()
        end
        if p87.vehicleController then
            local v92
            v89, v92 = p87.vehicleController:Update(v89, v90, p87.activeControlModule == u10)
        end
        if v90 then
            v89 = p87:calculateRawMoveVector(p87.humanoid, v89)
        end
        p87.inputMoveVector = v89
        if u8.VREnabled then
            v89 = p87:updateVRMoveVector(v89)
        end
        p87.moveFunction(u2.LocalPlayer, v89, false)
        local v93 = p87.humanoid
        local v94 = not p87.activeController:GetIsJumping() and p87.touchJumpController
        if v94 then
            v94 = p87.touchJumpController:GetIsJumping()
        end
        v93.Jump = v94
    end
end
function u1.updateVRMoveVector(p95, p96) --[[ Line: 502 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v97 = workspace.CurrentCamera
    local v98 = (v97.Focus.Position - v97.CFrame.Position).Magnitude < 5
    if p96.Magnitude ~= 0 or (not v98 or (not u8.AvatarGestures or (not p95.humanoid or p95.humanoid.Sit))) then
        return p96
    end
    local v99 = u8:GetUserCFrame(Enum.UserCFrame.Head)
    local v100 = v99.Rotation + v99.Position * v97.HeadScale
    local v101 = -0.7 * p95.humanoid.RootPart.Size.Y / 2
    local v102 = (v97.CFrame * v100 * CFrame.new(0, v101, 0)).Position - p95.humanoid.RootPart.CFrame.Position
    local v103 = v102.x
    local v104 = v102.z
    return Vector3.new(v103, 0, v104)
end
function u1.OnHumanoidSeated(p105, p106, p107) --[[ Line: 527 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if p106 then
        if p107 and p107:IsA("VehicleSeat") then
            if not p105.vehicleController then
                p105.vehicleController = p105.vehicleController.new(u19)
            end
            p105.vehicleController:Enable(true, p107)
            return
        end
    elseif p105.vehicleController then
        p105.vehicleController:Enable(false, p107)
    end
end
function u1.OnCharacterAdded(u108, p109) --[[ Line: 542 ]]
    u108.humanoid = p109:FindFirstChildOfClass("Humanoid")
    while not u108.humanoid do
        p109.ChildAdded:wait()
        u108.humanoid = p109:FindFirstChildOfClass("Humanoid")
    end
    if u108.humanoidSeatedConn then
        u108.humanoidSeatedConn:Disconnect()
        u108.humanoidSeatedConn = nil
    end
    u108.humanoidSeatedConn = u108.humanoid.Seated:Connect(function(p110, p111) --[[ Line: 553 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        u108:OnHumanoidSeated(p110, p111)
    end)
    u108:UpdateMovementMode()
end
function u1.OnCharacterRemoving(p112, _) --[[ Line: 560 ]]
    p112.humanoid = nil
    p112:UpdateMovementMode()
end
function u1.UpdateTouchGuiVisibility(p113) --[[ Line: 566 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v114 = p113.humanoid and u5.TouchControlsEnabled
    if v114 then
        v114 = u4.PreferredInput == Enum.PreferredInput.Touch
    end
    if v114 and not p113.touchGui then
        p113:CreateTouchGuiContainer()
    end
    if p113.touchGui then
        p113.touchGui.Enabled = v114 and true or false
    end
end
function u1.SwitchToController(p115, p116) --[[ Line: 585 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if p116 then
        if not p115.controllers[p116] then
            p115.controllers[p116] = p116.new(u19)
        end
        if p115.activeController ~= p115.controllers[p116] then
            if p115.activeController then
                p115.activeController:Enable(false)
            end
            p115.activeController = p115.controllers[p116]
            p115.activeControlModule = p116
            p115:UpdateActiveControlModuleEnabled()
        end
    else
        if p115.activeController then
            p115.activeController:Enable(false)
        end
        p115.activeController = nil
        p115.activeControlModule = nil
    end
end
function u1.UpdateMovementMode(p117) --[[ Line: 624 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    p117:UpdateTouchGuiVisibility()
    if u4.PreferredInput == Enum.PreferredInput.Touch then
        local v118, v119 = p117:SelectTouchModule()
        if v119 and p117.touchControlFrame then
            p117:SwitchToController(v118)
            return
        end
    else
        p117:SwitchToController((p117:SelectComputerMovementModule()))
    end
end
function u1.CreateTouchGuiContainer(p120) --[[ Line: 640 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p120.playerGui then
        if p120.touchGui then
            p120.touchGui:Destroy()
        end
        p120.touchGui = Instance.new("ScreenGui")
        p120.touchGui.Name = "TouchGui"
        p120.touchGui.ResetOnSpawn = false
        p120.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        if u14 then
            p120.touchGui.ClipToDeviceSafeArea = false
        end
        p120.touchControlFrame = Instance.new("Frame")
        p120.touchControlFrame.Name = "TouchControlFrame"
        p120.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
        p120.touchControlFrame.BackgroundTransparency = 1
        p120.touchControlFrame.Parent = p120.touchGui
        p120.touchGui.Parent = p120.playerGui
    end
end
function u1.GetClickToMoveController(p121) --[[ Line: 666 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
    --]]
    if not p121.controllers[u16] then
        p121.controllers[u16] = u16.new(u19)
    end
    return p121.controllers[u16]
end
return u1.new()