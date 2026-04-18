local v1 = {}
local u2 = "rbxasset://textures/ui/traildot.png"
local u3 = "rbxasset://textures/ui/waypoint.png"
local u4 = false
local u5 = UDim2.new(0, 42, 0, 50)
local u6 = Vector2.new(0, 0.5)
local u7 = Vector2.new(0, 1)
local u8 = Vector2.new(0, 0.5)
local u9 = Vector2.new(0.1, 0.5)
local u10 = Vector2.new(-0.1, 0.5)
local u11 = Vector2.new(1.5, 1.5)
local u12 = RaycastParams.new()
u12.FilterType = Enum.RaycastFilterType.Exclude
local v13 = game:GetService("Players")
local u14 = game:GetService("TweenService")
local u15 = game:GetService("RunService")
local u16 = game:GetService("Workspace")
local v17 = script.Parent.Parent:WaitForChild("CommonUtils")
local u18 = require(v17:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u19 = v13.LocalPlayer
local function u31() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u2
        [4] = u5
        [5] = u6
        [6] = u3
        [7] = u8
    --]]
    local v20 = Instance.new("Part")
    v20.Size = Vector3.new(1, 1, 1)
    v20.Anchored = true
    v20.CanCollide = false
    v20.Name = "TrailDot"
    v20.Transparency = 1
    local v21 = Instance.new("ImageHandleAdornment")
    v21.Name = "TrailDotImage"
    v21.Size = u11
    v21.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v21.AlwaysOnTop = u4
    v21.Image = u2
    v21.Adornee = v20
    v21.Parent = v20
    local v22 = Instance.new("Part")
    v22.Size = Vector3.new(2, 2, 2)
    v22.Anchored = true
    v22.CanCollide = false
    v22.Name = "EndWaypoint"
    v22.Transparency = 1
    local v23 = Instance.new("ImageHandleAdornment")
    v23.Name = "TrailDotImage"
    v23.Size = u11
    v23.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v23.AlwaysOnTop = u4
    v23.Image = u2
    v23.Adornee = v22
    v23.Parent = v22
    local v24 = Instance.new("BillboardGui")
    v24.Name = "EndWaypointBillboard"
    v24.Size = u5
    v24.LightInfluence = 0
    v24.SizeOffset = u6
    v24.AlwaysOnTop = true
    v24.Adornee = v22
    v24.Parent = v22
    local v25 = Instance.new("ImageLabel")
    v25.Image = u3
    v25.BackgroundTransparency = 1
    v25.Size = UDim2.new(1, 0, 1, 0)
    v25.Parent = v24
    local v26 = Instance.new("Part")
    v26.Size = Vector3.new(2, 2, 2)
    v26.Anchored = true
    v26.CanCollide = false
    v26.Name = "FailureWaypoint"
    v26.Transparency = 1
    local v27 = Instance.new("ImageHandleAdornment")
    v27.Name = "TrailDotImage"
    v27.Size = u11
    v27.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v27.AlwaysOnTop = u4
    v27.Image = u2
    v27.Adornee = v26
    v27.Parent = v26
    local v28 = Instance.new("BillboardGui")
    v28.Name = "FailureWaypointBillboard"
    v28.Size = u5
    v28.LightInfluence = 0
    v28.SizeOffset = u8
    v28.AlwaysOnTop = true
    v28.Adornee = v26
    v28.Parent = v26
    local v29 = Instance.new("Frame")
    v29.BackgroundTransparency = 1
    v29.Size = UDim2.new(0, 0, 0, 0)
    v29.Position = UDim2.new(0.5, 0, 1, 0)
    v29.Parent = v28
    local v30 = Instance.new("ImageLabel")
    v30.Image = u3
    v30.BackgroundTransparency = 1
    v30.Position = UDim2.new(0, -u5.X.Offset / 2, 0, -u5.Y.Offset)
    v30.Size = u5
    v30.Parent = v29
    return v20, v22, v26
end
local u32, u33, u34 = u31()
local function u45(p35, p36) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u12
        [3] = u16
        [4] = u19
    --]]
    if u18 then
        u12.FilterDescendantsInstances = { u16.CurrentCamera, u19.Character }
        local v37 = u16:Raycast(p36 + Vector3.new(0, 2.5, 0), Vector3.new(-0, -10, -0), u12)
        if v37 then
            p35.CFrame = CFrame.lookAlong(v37.Position, v37.Normal)
            local v38 = u16.CurrentCamera
            local v39 = v38:FindFirstChild("ClickToMoveDisplay")
            if not v39 then
                v39 = Instance.new("Model")
                v39.Name = "ClickToMoveDisplay"
                v39.Parent = v38
            end
            p35.Parent = v39
            return
        end
    else
        local v40, v41, v42 = u16:FindPartOnRayWithIgnoreList(Ray.new(p36 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { u16.CurrentCamera, u19.Character })
        if v40 then
            p35.CFrame = CFrame.new(v41, v41 + v42)
            local v43 = u16.CurrentCamera
            local v44 = v43:FindFirstChild("ClickToMoveDisplay")
            if not v44 then
                v44 = Instance.new("Model")
                v44.Name = "ClickToMoveDisplay"
                v44.Parent = v43
            end
            p35.Parent = v44
        end
    end
end
local u46 = {}
u46.__index = u46
function u46.Destroy(p47) --[[ Line: 177 ]]
    p47.DisplayModel:Destroy()
end
function u46.NewDisplayModel(_, p48) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u45
    --]]
    local v49 = u32:Clone()
    u45(v49, p48)
    return v49
end
function u46.new(p50, p51) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    local v52 = u46
    local v53 = setmetatable({}, v52)
    v53.DisplayModel = v53:NewDisplayModel(p50)
    v53.ClosestWayPoint = p51
    return v53
end
local u54 = {}
u54.__index = u54
function u54.Destroy(p55) --[[ Line: 199 ]]
    p55.Destroyed = true
    p55.Tween:Cancel()
    p55.DisplayModel:Destroy()
end
function u54.NewDisplayModel(_, p56) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u45
    --]]
    local v57 = u33:Clone()
    u45(v57, p56)
    return v57
end
function u54.CreateTween(p58) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    local v59 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true)
    local v60 = {
        ["SizeOffset"] = u7
    }
    local v61 = u14:Create(p58.DisplayModel.EndWaypointBillboard, v59, v60)
    v61:Play()
    return v61
end
function u54.TweenInFrom(p62, p63) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v64 = p63 - p62.DisplayModel.Position
    local v65 = p62.DisplayModel.EndWaypointBillboard
    local v66 = v64.Y
    v65.StudsOffset = Vector3.new(0, v66, 0)
    local v67 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v68 = u14:Create(p62.DisplayModel.EndWaypointBillboard, v67, {
        ["StudsOffset"] = Vector3.new(0, 0, 0)
    })
    v68:Play()
    return v68
end
function u54.new(p69, p70, p71) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u54
    --]]
    local v72 = u54
    local u73 = setmetatable({}, v72)
    u73.DisplayModel = u73:NewDisplayModel(p69)
    u73.Destroyed = false
    if p71 and (p71 - p69).Magnitude > 5 then
        u73.Tween = u73:TweenInFrom(p71)
        coroutine.wrap(function() --[[ Line: 243 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73.Tween.Completed:Wait()
            if not u73.Destroyed then
                u73.Tween = u73:CreateTween()
            end
        end)()
    else
        u73.Tween = u73:CreateTween()
    end
    u73.ClosestWayPoint = p70
    return u73
end
local u74 = {}
u74.__index = u74
function u74.Hide(p75) --[[ Line: 260 ]]
    p75.DisplayModel.Parent = nil
end
function u74.Destroy(p76) --[[ Line: 264 ]]
    p76.DisplayModel:Destroy()
end
function u74.NewDisplayModel(_, p77) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u45
        [3] = u18
        [4] = u12
        [5] = u16
        [6] = u19
    --]]
    local v78 = u34:Clone()
    u45(v78, p77)
    if u18 then
        u12.FilterDescendantsInstances = { u16.CurrentCamera, u19.Character }
        local v79 = u16:Raycast(p77 + Vector3.new(0, 2.5, 0), Vector3.new(-0, -10, -0), u12)
        if v79 then
            v78.CFrame = CFrame.lookAlong(v79.Position, v79.Normal)
            local v80 = u16.CurrentCamera
            local v81 = v80:FindFirstChild("ClickToMoveDisplay")
            if not v81 then
                v81 = Instance.new("Model")
                v81.Name = "ClickToMoveDisplay"
                v81.Parent = v80
            end
            v78.Parent = v81
            return v78
        end
    else
        local v82, v83, v84 = u16:FindPartOnRayWithIgnoreList(Ray.new(p77 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { u16.CurrentCamera, u19.Character })
        if v82 then
            v78.CFrame = CFrame.new(v83, v83 + v84)
            local v85 = u16.CurrentCamera
            local v86 = v85:FindFirstChild("ClickToMoveDisplay")
            if not v86 then
                v86 = Instance.new("Model")
                v86.Name = "ClickToMoveDisplay"
                v86.Parent = v85
            end
            v78.Parent = v86
        end
    end
    return v78
end
function u74.RunFailureTween(p87) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u10
        [4] = u8
    --]]
    wait(0.125)
    local v88 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v89 = {
        ["SizeOffset"] = u9
    }
    local v90 = u14:Create(p87.DisplayModel.FailureWaypointBillboard, v88, v89)
    v90:Play()
    u14:Create(p87.DisplayModel.FailureWaypointBillboard.Frame, v88, {
        ["Rotation"] = 10
    }):Play()
    v90.Completed:wait()
    local v91 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
    local v92 = {
        ["SizeOffset"] = u10
    }
    local v93 = u14:Create(p87.DisplayModel.FailureWaypointBillboard, v91, v92)
    v93:Play()
    local v94 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
    u14:Create(p87.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v94, {
        ["ImageColor3"] = Color3.new(0.75, 0.75, 0.75)
    }):Play()
    u14:Create(p87.DisplayModel.FailureWaypointBillboard.Frame, v94, {
        ["Rotation"] = -10
    }):Play()
    v93.Completed:wait()
    local v95 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v96 = {
        ["SizeOffset"] = u8
    }
    local v97 = u14:Create(p87.DisplayModel.FailureWaypointBillboard, v95, v96)
    v97:Play()
    u14:Create(p87.DisplayModel.FailureWaypointBillboard.Frame, v95, {
        ["Rotation"] = 0
    }):Play()
    v97.Completed:wait()
    wait(0.125)
end
function u74.new(p98) --[[ Line: 341 ]]
    --[[
    Upvalues:
        [1] = u74
    --]]
    local v99 = u74
    local v100 = setmetatable({}, v99)
    v100.DisplayModel = v100:NewDisplayModel(p98)
    return v100
end
local u101 = Instance.new("Animation")
u101.AnimationId = "rbxassetid://2874840706"
local u102 = nil
local function u114(p103, p104) --[[ Line: 373 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u54
    --]]
    local v105 = {}
    local v106 = 1
    for v107 = 1, #p103 - 1 do
        local v108 = (p103[v107].Position - p103[#p103].Position).Magnitude < 3
        local v109
        if v107 % 2 == 0 then
            v109 = not v108
        else
            v109 = false
        end
        if v109 then
            v105[v106] = u46.new(p103[v107].Position, v107)
            v106 = v106 + 1
        end
    end
    local v110 = u54.new(p103[#p103].Position, #p103, p104)
    table.insert(v105, v110)
    local v111 = {}
    local v112 = 1
    for v113 = #v105, 1, -1 do
        v111[v112] = v105[v113]
        v112 = v112 + 1
    end
    return v111
end
local u115 = 0
function v1.CreatePathDisplay(u116, p117) --[[ Line: 407 ]]
    --[[
    Upvalues:
        [1] = u115
        [2] = u114
        [3] = u15
        [4] = u16
        [5] = u11
    --]]
    u115 = u115 + 1
    local u118 = u114(u116, p117)
    local function u122(p119) --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u118
        --]]
        for v120 = #u118, 1, -1 do
            local v121 = u118[v120]
            if v121.ClosestWayPoint > p119 then
                break
            end
            v121:Destroy()
            u118[v120] = nil
        end
    end
    local u123 = "ClickToMoveResizeTrail" .. u115
    local function v129() --[[ Line: 425 ]]
        --[[
        Upvalues:
            [1] = u118
            [2] = u15
            [3] = u123
            [4] = u16
            [5] = u11
        --]]
        if #u118 == 0 then
            u15:UnbindFromRenderStep(u123)
        else
            local v124 = u16.CurrentCamera.CFrame.p
            for v125 = 1, #u118 do
                local v126 = u118[v125].DisplayModel:FindFirstChild("TrailDotImage")
                if v126 then
                    local v127 = u11
                    local v128 = (u118[v125].DisplayModel.Position - v124).Magnitude - 10
                    v126.Size = v127 * (math.clamp(v128, 0, 90) / 90 * 1.5 + 1)
                end
            end
        end
    end
    u15:BindToRenderStep(u123, Enum.RenderPriority.Camera.Value - 1, v129)
    return function() --[[ Name: removePath, Line 441 ]]
        --[[
        Upvalues:
            [1] = u122
            [2] = u116
        --]]
        u122(#u116)
    end, u122
end
local u130 = nil
function v1.DisplayFailureWaypoint(p131) --[[ Line: 449 ]]
    --[[
    Upvalues:
        [1] = u130
        [2] = u74
    --]]
    if u130 then
        u130:Hide()
    end
    local u132 = u74.new(p131)
    u130 = u132
    coroutine.wrap(function() --[[ Line: 455 ]]
        --[[
        Upvalues:
            [1] = u132
        --]]
        u132:RunFailureTween()
        u132:Destroy()
        u132 = nil
    end)()
end
function v1.CreateEndWaypoint(p133) --[[ Line: 462 ]]
    --[[
    Upvalues:
        [1] = u54
    --]]
    return u54.new(p133)
end
function v1.PlayFailureAnimation() --[[ Line: 466 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u102
        [3] = u101
    --]]
    local v134 = u19.Character
    local v135
    if v134 then
        v135 = v134:FindFirstChildOfClass("Humanoid")
    else
        v135 = nil
    end
    if v135 then
        local v136
        if v135 == nil then
            v136 = u102
        else
            u102 = v135:LoadAnimation(u101)
            local v137 = u102
            assert(v137, "")
            u102.Priority = Enum.AnimationPriority.Action
            u102.Looped = false
            v136 = u102
        end
        v136:Play()
    end
end
function v1.CancelFailureAnimation() --[[ Line: 474 ]]
    --[[
    Upvalues:
        [1] = u102
    --]]
    if u102 ~= nil and u102.IsPlaying then
        u102:Stop()
    end
end
function v1.SetWaypointTexture(p138) --[[ Line: 480 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u32
        [3] = u33
        [4] = u34
        [5] = u31
    --]]
    u2 = p138
    local v139, v140, v141 = u31()
    u32 = v139
    u33 = v140
    u34 = v141
end
function v1.GetWaypointTexture() --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2
end
function v1.SetWaypointRadius(p142) --[[ Line: 489 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u32
        [3] = u33
        [4] = u34
        [5] = u31
    --]]
    u11 = Vector2.new(p142, p142)
    local v143, v144, v145 = u31()
    u32 = v143
    u33 = v144
    u34 = v145
end
function v1.GetWaypointRadius() --[[ Line: 494 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11.X
end
function v1.SetEndWaypointTexture(p146) --[[ Line: 498 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u32
        [3] = u33
        [4] = u34
        [5] = u31
    --]]
    u3 = p146
    local v147, v148, v149 = u31()
    u32 = v147
    u33 = v148
    u34 = v149
end
function v1.GetEndWaypointTexture() --[[ Line: 503 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3
end
function v1.SetWaypointsAlwaysOnTop(p150) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u32
        [3] = u33
        [4] = u34
        [5] = u31
    --]]
    u4 = p150
    local v151, v152, v153 = u31()
    u32 = v151
    u33 = v152
    u34 = v153
end
function v1.GetWaypointsAlwaysOnTop() --[[ Line: 512 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4
end
return v1