local v1 = {}
local v2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local v4 = game:GetService("UserInputService")
local v5 = v2.LocalPlayer
local u6 = script.Parent
local v7 = v4.TouchEnabled
u6.Visible = v7
local u8 = {
    ["OFF"] = "rbxasset://textures/ui/mouseLock_off@2x.png",
    ["ON"] = "rbxasset://textures/ui/mouseLock_on@2x.png"
}
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = workspace.CurrentCamera
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = false
local function u22() --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
        [3] = u10
        [4] = u11
        [5] = u12
    --]]
    if u16 then
        if u9 and u9.Parent then
            if u10 and u11 then
                if u11.Health <= 0 then
                    return
                else
                    u12 = workspace.CurrentCamera
                    if u12 then
                        local v17 = u12.CFrame.LookVector
                        local v18 = v17.X
                        local v19 = v17.Z
                        local v20 = Vector3.new(v18, 0, v19)
                        if v20.Magnitude > 0.001 then
                            local v21 = v20.Unit
                            u10.CFrame = CFrame.lookAt(u10.Position, u10.Position + v21)
                        end
                    else
                        return
                    end
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
local function v23() --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u8
        [4] = u13
        [5] = u11
        [6] = u3
        [7] = u22
    --]]
    if u16 then
        if u16 then
            u16 = false
            u6.Image = u16 and u8.ON or u8.OFF
            if u13 then
                u13:Disconnect()
                u13 = nil
            end
            if u11 then
                u11.AutoRotate = not u16
                u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
            end
        else
            return
        end
    elseif not u16 then
        u16 = true
        u6.Image = u16 and u8.ON or u8.OFF
        if u11 then
            u11.AutoRotate = not u16
            u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
        end
        if u13 then
            u13:Disconnect()
            u13 = nil
        end
        u13 = u3.RenderStepped:Connect(u22)
    end
end
function v1.IsLocked(_) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    return u16
end
function v1.SetLocked(_, p24) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u8
        [4] = u11
        [5] = u13
        [6] = u3
        [7] = u22
    --]]
    if p24 then
        if not u16 then
            u16 = true
            u6.Image = u16 and u8.ON or u8.OFF
            if u11 then
                u11.AutoRotate = not u16
                u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
            end
            if u13 then
                u13:Disconnect()
                u13 = nil
            end
            u13 = u3.RenderStepped:Connect(u22)
        end
    elseif u16 then
        u16 = false
        u6.Image = u16 and u8.ON or u8.OFF
        if u13 then
            u13:Disconnect()
            u13 = nil
        end
        if u11 then
            u11.AutoRotate = not u16
            u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
        end
    else
        return
    end
end
function v1.Destroy(_) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u8
        [4] = u13
        [5] = u11
        [6] = u14
        [7] = u15
    --]]
    if u16 then
        u16 = false
        u6.Image = u16 and u8.ON or u8.OFF
        if u13 then
            u13:Disconnect()
            u13 = nil
        end
        if u11 then
            u11.AutoRotate = not u16
            u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
        end
    end
    if u14 then
        u14:Disconnect()
        u14 = nil
    end
    if u15 then
        u15:Disconnect()
        u15 = nil
    end
end
u6.Image = u16 and u8.ON or u8.OFF
if not v7 then
    return v1
end
u9 = v5.Character or v5.CharacterAdded:Wait()
if u9 then
    u10 = u9:WaitForChild("HumanoidRootPart")
    u11 = u9:WaitForChild("Humanoid")
    if u11 then
        u11.AutoRotate = not u16
        u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
    end
else
    u10 = nil
    u11 = nil
end
u15 = v5.CharacterAdded:Connect(function(p25) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u11
        [4] = u16
        [5] = u13
        [6] = u3
        [7] = u22
    --]]
    u9 = p25
    if u9 then
        u10 = u9:WaitForChild("HumanoidRootPart")
        u11 = u9:WaitForChild("Humanoid")
        if u11 then
            u11.AutoRotate = not u16
            u11.CameraOffset = u16 and Vector3.new(1.7, 0, 0) or Vector3.new(0, 0, 0)
        end
    else
        u10 = nil
        u11 = nil
    end
    if u16 then
        if u13 then
            u13:Disconnect()
            u13 = nil
        end
        u13 = u3.RenderStepped:Connect(u22)
    end
end)
u14 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12 = workspace.CurrentCamera
end)
u6.Activated:Connect(v23)
return v1