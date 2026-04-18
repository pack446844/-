local u1 = {}
u1.__index = u1
local u2 = {
    "CameraMinZoomDistance",
    "CameraMaxZoomDistance",
    "CameraMode",
    "DevCameraOcclusionMode",
    "DevComputerCameraMode",
    "DevTouchCameraMode",
    "DevComputerMovementMode",
    "DevTouchMovementMode",
    "DevEnableMouseLock"
}
local u3 = {
    "ComputerCameraMovementMode",
    "ComputerMovementMode",
    "ControlMode",
    "GamepadCameraSensitivity",
    "MouseSensitivity",
    "RotationType",
    "TouchCameraMovementMode",
    "TouchMovementMode"
}
local u4 = game:GetService("Players")
local u5 = game:GetService("RunService")
local u6 = game:GetService("UserInputService")
local u7 = game:GetService("VRService")
local u8 = UserSettings():GetService("UserGameSettings")
local v9 = script.Parent:WaitForChild("CommonUtils")
local u10 = require(v9:WaitForChild("ConnectionUtil"))
local v11 = require(v9:WaitForChild("FlagUtil"))
local u12 = require(script:WaitForChild("CameraUtils"))
local u13 = require(script:WaitForChild("CameraInput"))
local u14 = require(script:WaitForChild("ClassicCamera"))
local u15 = require(script:WaitForChild("OrbitalCamera"))
local u16 = require(script:WaitForChild("LegacyCamera"))
local u17 = require(script:WaitForChild("VehicleCamera"))
local u18 = require(script:WaitForChild("VRCamera"))
local u19 = require(script:WaitForChild("VRVehicleCamera"))
local u20 = require(script:WaitForChild("Invisicam"))
local u21 = require(script:WaitForChild("Poppercam"))
local u22 = require(script:WaitForChild("TransparencyController"))
local u23 = require(script:WaitForChild("MouseLockController"))
local u24 = {}
local u25 = {}
if not u4.LocalPlayer then
    return {}
end
local v26 = u4.LocalPlayer
assert(v26, "Strict typing check")
local v27 = u4.LocalPlayer:WaitForChild("PlayerScripts")
v27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
v27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
v27:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
v27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
v27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
v27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
v27:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
local u28 = v11.getUserFlag("UserPlayerConnectionMemoryLeak")
local u29 = v11.getUserFlag("UserPSFixCameraControllerReset")
function u1.new() --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u28
        [3] = u10
        [4] = u1
        [5] = u4
        [6] = u23
        [7] = u5
        [8] = u2
        [9] = u3
        [10] = u8
        [11] = u6
    --]]
    local v30 = {
        ["activeTransparencyController"] = u22.new()
    }
    local v31
    if u28 then
        v31 = u10.new()
    else
        v31 = nil
    end
    v30.connectionUtil = v31
    local v32 = u1
    local u33 = setmetatable(v30, v32)
    u33.activeCameraController = nil
    u33.activeOcclusionModule = nil
    u33.activeMouseLockController = nil
    u33.currentComputerCameraMovementMode = nil
    u33.cameraSubjectChangedConn = nil
    u33.cameraTypeChangedConn = nil
    for _, v34 in pairs(u4:GetPlayers()) do
        u33:OnPlayerAdded(v34)
    end
    u4.PlayerAdded:Connect(function(p35) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:OnPlayerAdded(p35)
    end)
    if u28 then
        u4.PlayerRemoving:Connect(function(p36) --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:OnPlayerRemoving(p36)
        end)
    end
    u33.activeTransparencyController:Enable(true)
    u33.activeMouseLockController = u23.new()
    local v37 = u33.activeMouseLockController
    assert(v37, "Strict typing check")
    local v38 = u33.activeMouseLockController:GetBindableToggleEvent()
    if v38 then
        v38:Connect(function() --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:OnMouseLockToggled()
        end)
    end
    u33:ActivateCameraController()
    u33:ActivateOcclusionModule(u4.LocalPlayer.DevCameraOcclusionMode)
    u33:OnCurrentCameraChanged()
    u5:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p39) --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Update(p39)
    end)
    for _, u40 in pairs(u2) do
        u4.LocalPlayer:GetPropertyChangedSignal(u40):Connect(function() --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u40
            --]]
            u33:OnLocalPlayerCameraPropertyChanged(u40)
        end)
    end
    for _, u41 in pairs(u3) do
        u8:GetPropertyChangedSignal(u41):Connect(function() --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u41
            --]]
            u33:OnUserGameSettingsPropertyChanged(u41)
        end)
    end
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:OnCurrentCameraChanged()
    end)
    u6:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:OnPreferredInputChanged()
    end)
    return u33
end
function u1.GetCameraMovementModeFromSettings(_) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u6
        [4] = u8
    --]]
    if u4.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return u12.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
    else
        local v42, v43
        if u6.PreferredInput == Enum.PreferredInput.Touch then
            v42 = u12.ConvertCameraModeEnumToStandard(u4.LocalPlayer.DevTouchCameraMode)
            v43 = u12.ConvertCameraModeEnumToStandard(u8.TouchCameraMovementMode)
        else
            v42 = u12.ConvertCameraModeEnumToStandard(u4.LocalPlayer.DevComputerCameraMode)
            v43 = u12.ConvertCameraModeEnumToStandard(u8.ComputerCameraMovementMode)
        end
        if v42 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v43
        else
            return v42
        end
    end
end
function u1.ActivateOcclusionModule(p44, p45) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
        [3] = u25
        [4] = u4
    --]]
    local v46
    if p45 == Enum.DevCameraOcclusionMode.Zoom then
        v46 = u21
    else
        if p45 ~= Enum.DevCameraOcclusionMode.Invisicam then
            warn("CameraScript ActivateOcclusionModule called with unsupported mode")
            return
        end
        v46 = u20
    end
    p44.occlusionMode = p45
    if p44.activeOcclusionModule and p44.activeOcclusionModule:GetOcclusionMode() == p45 then
        if not p44.activeOcclusionModule:GetEnabled() then
            p44.activeOcclusionModule:Enable(true)
        end
    else
        local v47 = p44.activeOcclusionModule
        p44.activeOcclusionModule = u25[v46]
        if not p44.activeOcclusionModule then
            p44.activeOcclusionModule = v46.new()
            if p44.activeOcclusionModule then
                u25[v46] = p44.activeOcclusionModule
            end
        end
        if p44.activeOcclusionModule then
            if p44.activeOcclusionModule:GetOcclusionMode() ~= p45 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", p44.activeOcclusionModule:GetOcclusionMode(), "~=", p45)
            end
            if v47 then
                if v47 == p44.activeOcclusionModule then
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module")
                else
                    v47:Enable(false)
                end
            end
            if p45 == Enum.DevCameraOcclusionMode.Invisicam then
                if u4.LocalPlayer.Character then
                    p44.activeOcclusionModule:CharacterAdded(u4.LocalPlayer.Character, u4.LocalPlayer)
                end
            else
                for _, v48 in pairs(u4:GetPlayers()) do
                    if v48 and v48.Character then
                        p44.activeOcclusionModule:CharacterAdded(v48.Character, v48)
                    end
                end
                p44.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject)
            end
            p44.activeOcclusionModule:Enable(true)
        end
    end
end
function u1.ShouldUseVehicleCamera(p49) --[[ Line: 320 ]]
    local v50 = workspace.CurrentCamera
    if not v50 then
        return false
    end
    local v51 = v50.CameraType
    local v52 = v50.CameraSubject
    local v53 = v51 == Enum.CameraType.Custom and true or v51 == Enum.CameraType.Follow
    local v54 = v52 and v52:IsA("VehicleSeat") or false
    local v55 = p49.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam
    if v54 then
        if not v53 then
            v55 = v53
        end
    else
        v55 = v54
    end
    return v55
end
function u1.ActivateCameraController(p56) --[[ Line: 336 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u18
        [4] = u14
        [5] = u15
        [6] = u19
        [7] = u17
        [8] = u24
        [9] = u29
    --]]
    local v57 = workspace.CurrentCamera.CameraType
    local v58 = p56:GetCameraMovementModeFromSettings()
    local v59 = nil
    if v57 == Enum.CameraType.Scriptable then
        if p56.activeCameraController then
            p56.activeCameraController:Enable(false)
            p56.activeCameraController = nil
        end
    else
        if v57 == Enum.CameraType.Custom then
            v58 = p56:GetCameraMovementModeFromSettings()
        elseif v57 == Enum.CameraType.Track then
            v58 = Enum.ComputerCameraMovementMode.Classic
        elseif v57 == Enum.CameraType.Follow then
            v58 = Enum.ComputerCameraMovementMode.Follow
        elseif v57 == Enum.CameraType.Orbital then
            v58 = Enum.ComputerCameraMovementMode.Orbital
        elseif v57 == Enum.CameraType.Attach or (v57 == Enum.CameraType.Watch or v57 == Enum.CameraType.Fixed) then
            v59 = u16
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", v57)
        end
        if not v59 then
            if u7.VREnabled then
                v59 = u18
            elseif v58 == Enum.ComputerCameraMovementMode.Classic or (v58 == Enum.ComputerCameraMovementMode.Follow or (v58 == Enum.ComputerCameraMovementMode.Default or v58 == Enum.ComputerCameraMovementMode.CameraToggle)) then
                v59 = u14
            else
                if v58 ~= Enum.ComputerCameraMovementMode.Orbital then
                    warn("ActivateCameraController did not select a module.")
                    return
                end
                v59 = u15
            end
        end
        if p56:ShouldUseVehicleCamera() then
            if u7.VREnabled then
                v59 = u19
            else
                v59 = u17
            end
        end
        local v60
        if u24[v59] then
            v60 = u24[v59]
            if u29 then
                if v60.Reset and p56.activeCameraController ~= v60 then
                    v60:Reset()
                end
            elseif v60.Reset then
                v60:Reset()
            end
        else
            v60 = v59.new()
            u24[v59] = v60
        end
        if p56.activeCameraController then
            if p56.activeCameraController == v60 then
                if not p56.activeCameraController:GetEnabled() then
                    p56.activeCameraController:Enable(true)
                end
            else
                p56.activeCameraController:Enable(false)
                p56.activeCameraController = v60
                p56.activeCameraController:Enable(true)
            end
        elseif v60 ~= nil then
            p56.activeCameraController = v60
            local v61 = p56.activeCameraController
            assert(v61, "Strict typing check")
            p56.activeCameraController:Enable(true)
        end
        if p56.activeCameraController then
            p56.activeCameraController:SetCameraMovementMode(v58)
            p56.activeCameraController:SetCameraType(v57)
        end
    end
end
function u1.OnCameraSubjectChanged(p62) --[[ Line: 442 ]]
    local v63 = workspace.CurrentCamera
    local v64
    if v63 then
        v64 = v63.CameraSubject
    else
        v64 = nil
    end
    if p62.activeTransparencyController then
        p62.activeTransparencyController:SetSubject(v64)
    end
    if p62.activeOcclusionModule then
        p62.activeOcclusionModule:OnCameraSubjectChanged(v64)
    end
    p62:ActivateCameraController()
end
function u1.OnCameraTypeChanged(p65, p66) --[[ Line: 457 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
    --]]
    if p66 == Enum.CameraType.Scriptable and u6.MouseBehavior == Enum.MouseBehavior.LockCenter then
        u12.restoreMouseBehavior()
    end
    p65:ActivateCameraController()
end
function u1.OnCurrentCameraChanged(u67) --[[ Line: 469 ]]
    local u68 = game.Workspace.CurrentCamera
    if u68 then
        if u67.cameraSubjectChangedConn then
            u67.cameraSubjectChangedConn:Disconnect()
        end
        if u67.cameraTypeChangedConn then
            u67.cameraTypeChangedConn:Disconnect()
        end
        u67.cameraSubjectChangedConn = u68:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 481 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            u67:OnCameraSubjectChanged()
        end)
        u67.cameraTypeChangedConn = u68:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 485 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u68
            --]]
            u67:OnCameraTypeChanged(u68.CameraType)
        end)
        u67:OnCameraSubjectChanged()
        u67:OnCameraTypeChanged(u68.CameraType)
    end
end
function u1.OnLocalPlayerCameraPropertyChanged(p69, p70) --[[ Line: 493 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p70 == "CameraMode" then
        if u4.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
            if u4.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
                p69:ActivateCameraController()
            else
                warn("Unhandled value for property player.CameraMode: ", u4.LocalPlayer.CameraMode)
            end
        end
        if not p69.activeCameraController or p69.activeCameraController:GetModuleName() ~= "ClassicCamera" then
            p69:ActivateCameraController()
        end
        if p69.activeCameraController then
            p69.activeCameraController:UpdateForDistancePropertyChange()
            return
        end
    else
        if p70 == "DevComputerCameraMode" or p70 == "DevTouchCameraMode" then
            p69:ActivateCameraController()
            return
        end
        if p70 == "DevCameraOcclusionMode" then
            p69:ActivateOcclusionModule(u4.LocalPlayer.DevCameraOcclusionMode)
            return
        end
        if p70 == "CameraMinZoomDistance" or p70 == "CameraMaxZoomDistance" then
            if p69.activeCameraController then
                p69.activeCameraController:UpdateForDistancePropertyChange()
                return
            end
        else
            if p70 == "DevTouchMovementMode" then
                return
            end
            if p70 == "DevComputerMovementMode" then
                return
            end
            local _ = p70 == "DevEnableMouseLock"
        end
    end
end
function u1.OnUserGameSettingsPropertyChanged(p71, p72) --[[ Line: 535 ]]
    if p72 == "ComputerCameraMovementMode" or p72 == "TouchCameraMovementMode" then
        p71:ActivateCameraController()
    end
end
function u1.OnPreferredInputChanged(p73) --[[ Line: 541 ]]
    p73:ActivateCameraController()
end
function u1.Update(p74, p75) --[[ Line: 551 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if p74.activeCameraController then
        p74.activeCameraController:UpdateMouseBehavior()
        local v76, v77 = p74.activeCameraController:Update(p75)
        if p74.activeOcclusionModule then
            v76, v77 = p74.activeOcclusionModule:Update(p75, v76, v77)
        end
        local v78 = game.Workspace.CurrentCamera
        v78.CFrame = v76
        v78.Focus = v77
        if p74.activeTransparencyController then
            p74.activeTransparencyController:Update(p75)
        end
        if u13.getInputEnabled() then
            u13.resetInputForFrameEnd()
        end
    end
end
function u1.OnCharacterAdded(p79, p80, p81) --[[ Line: 577 ]]
    if p79.activeOcclusionModule then
        p79.activeOcclusionModule:CharacterAdded(p80, p81)
    end
end
function u1.OnCharacterRemoving(p82, p83, p84) --[[ Line: 583 ]]
    if p82.activeOcclusionModule then
        p82.activeOcclusionModule:CharacterRemoving(p83, p84)
    end
end
function u1.OnPlayerAdded(u85, u86) --[[ Line: 589 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    if u28 then
        if u85.connectionUtil then
            u85.connectionUtil:trackConnection(("%*CharacterAdded"):format(u86.UserId), u86.CharacterAdded:Connect(function(p87) --[[ Line: 593 ]]
                --[[
                Upvalues:
                    [1] = u85
                    [2] = u86
                --]]
                u85:OnCharacterAdded(p87, u86)
            end))
            u85.connectionUtil:trackConnection(("%*CharacterRemoving"):format(u86.UserId), u86.CharacterRemoving:Connect(function(p88) --[[ Line: 596 ]]
                --[[
                Upvalues:
                    [1] = u85
                    [2] = u86
                --]]
                u85:OnCharacterRemoving(p88, u86)
            end))
            return
        end
    else
        u86.CharacterAdded:Connect(function(p89) --[[ Line: 601 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u86
            --]]
            u85:OnCharacterAdded(p89, u86)
        end)
        u86.CharacterRemoving:Connect(function(p90) --[[ Line: 604 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u86
            --]]
            u85:OnCharacterRemoving(p90, u86)
        end)
    end
end
function u1.OnPlayerRemoving(p91, p92) --[[ Line: 610 ]]
    if p91.connectionUtil then
        p91.connectionUtil:disconnect((("%*CharacterAdded"):format(p92.UserId)))
        p91.connectionUtil:disconnect((("%*CharacterRemoving"):format(p92.UserId)))
    end
end
function u1.OnMouseLockToggled(p93) --[[ Line: 618 ]]
    if p93.activeMouseLockController then
        local v94 = p93.activeMouseLockController:GetIsMouseLocked()
        local v95 = p93.activeMouseLockController:GetMouseLockOffset()
        if p93.activeCameraController then
            p93.activeCameraController:SetIsMouseLocked(v94)
            p93.activeCameraController:SetMouseLockOffset(v95)
        end
    end
end
u1.new()
return {}