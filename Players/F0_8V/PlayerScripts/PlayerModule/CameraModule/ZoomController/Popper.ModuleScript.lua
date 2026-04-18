local v1 = game:GetService("Players")
local v2 = script.Parent.Parent.Parent:WaitForChild("CommonUtils")
local v3 = require(v2:WaitForChild("FlagUtil"))
local v4 = require(v2:WaitForChild("CameraWrapper"))
local v5 = require(v2:WaitForChild("ConnectionUtil"))
local u6 = v3.getUserFlag("UserRaycastUpdateAPI2")
local u7 = v3.getUserFlag("UserCurrentCameraUpdate2")
local u8 = v3.getUserFlag("UserPlayerConnectionMemoryLeak")
local u9
if u7 then
    u9 = v4.new()
else
    u9 = nil
end
local u10
if u7 then
    u10 = nil
else
    u10 = game.Workspace.CurrentCamera
end
if u7 then
    u9:Enable()
end
local u11 = math.min
local u12 = math.tan
local u13 = math.rad
local u14 = Ray.new
local u15 = RaycastParams.new()
u15.IgnoreWater = true
u15.FilterType = Enum.RaycastFilterType.Exclude
u15.RespectCanCollide = true
local u16 = RaycastParams.new()
u16.IgnoreWater = true
u16.FilterType = Enum.RaycastFilterType.Include
local u17
if u8 then
    u17 = v5.new()
else
    u17 = nil
end
local u18 = nil
local u19 = nil
local u20, u21, u22
if u7 then
    local function v27() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u13
            [3] = u19
            [4] = u12
            [5] = u18
        --]]
        local v23 = u9:getCamera()
        local v24 = u13(v23.FieldOfView)
        local v25 = v23.ViewportSize
        local v26 = v25.X / v25.Y
        u19 = u12(v24 / 2) * 2
        u18 = v26 * u19
    end
    u9:Connect("FieldOfView", v27)
    u9:Connect("ViewportSize", v27)
    local v28 = u9:getCamera()
    local v29 = u13(v28.FieldOfView)
    local v30 = v28.ViewportSize
    local v31 = v30.X / v30.Y
    local v32 = u12(v29 / 2) * 2
    local v33 = v31 * v32
    local u34 = u9:getCamera().NearPlaneZ
    u9:Connect("NearPlaneZ", function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u9
        --]]
        u34 = u9:getCamera().NearPlaneZ
    end)
    u20 = v32
    u21 = v33
    u22 = u34
else
    local function v38() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u13
            [3] = u19
            [4] = u12
            [5] = u18
        --]]
        local v35 = u13(u10.FieldOfView)
        local v36 = u10.ViewportSize
        local v37 = v36.X / v36.Y
        u19 = u12(v35 / 2) * 2
        u18 = v37 * u19
    end
    u10:GetPropertyChangedSignal("FieldOfView"):Connect(v38)
    u10:GetPropertyChangedSignal("ViewportSize"):Connect(v38)
    local v39 = u13(u10.FieldOfView)
    local v40 = u10.ViewportSize
    local v41 = v40.X / v40.Y
    local v42 = u12(v39 / 2) * 2
    local v43 = v41 * v42
    local u44 = u10.NearPlaneZ
    u10:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u10
        --]]
        u44 = u10.NearPlaneZ
    end)
    u20 = v42
    u21 = v43
    u22 = u44
end
local u45 = {}
local u46 = {}
local function v57(u47) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u45
        [3] = u8
        [4] = u17
    --]]
    local function v51(p48) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u47
            [3] = u45
        --]]
        u46[u47] = p48
        local v49 = 1
        u45 = {}
        for _, v50 in pairs(u46) do
            u45[v49] = v50
            v49 = v49 + 1
        end
    end
    local function v54() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u47
            [3] = u45
        --]]
        u46[u47] = nil
        local v52 = 1
        u45 = {}
        for _, v53 in pairs(u46) do
            u45[v52] = v53
            v52 = v52 + 1
        end
    end
    if u8 then
        u17:trackConnection(("%*CharacterAdded"):format(u47.UserId), u47.CharacterAdded:Connect(v51))
        u17:trackConnection(("%*CharacterRemoving"):format(u47.UserId), u47.CharacterRemoving:Connect(v54))
    else
        u47.CharacterAdded:Connect(v51)
        u47.CharacterRemoving:Connect(v54)
    end
    if u47.Character then
        u46[u47] = u47.Character
        local v55 = 1
        u45 = {}
        for _, v56 in pairs(u46) do
            u45[v55] = v56
            v55 = v55 + 1
        end
    end
end
local function v61(p58) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u45
        [3] = u8
        [4] = u17
    --]]
    u46[p58] = nil
    local v59 = 1
    u45 = {}
    for _, v60 in pairs(u46) do
        u45[v59] = v60
        v59 = v59 + 1
    end
    if u8 then
        u17:disconnect((("%*CharacterAdded"):format(p58.UserId)))
        u17:disconnect((("%*CharacterRemoving"):format(p58.UserId)))
    end
end
v1.PlayerAdded:Connect(v57)
v1.PlayerRemoving:Connect(v61)
for _, v62 in ipairs(v1:GetPlayers()) do
    v57(v62)
end
local v63 = 1
u45 = {}
local u64 = u45
for _, v65 in pairs(u46) do
    u64[v63] = v65
    v63 = v63 + 1
end
local u66 = nil
local u67 = nil
if u7 then
    u9:Connect("CameraSubject", function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u67
        --]]
        local v68 = u9:getCamera().CameraSubject
        if v68 and v68:IsA("Humanoid") then
            u67 = v68.RootPart
            return
        elseif v68 and v68:IsA("BasePart") then
            u67 = v68
        else
            u67 = nil
        end
    end)
else
    u10:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u67
        --]]
        local v69 = u10.CameraSubject
        if v69:IsA("Humanoid") then
            u67 = v69.RootPart
            return
        elseif v69:IsA("BasePart") then
            u67 = v69
        else
            u67 = nil
        end
    end)
end
local u70 = {
    Vector2.new(0.4, 0),
    Vector2.new(-0.4, 0),
    Vector2.new(0, -0.4),
    Vector2.new(0, 0.4),
    Vector2.new(0, 0.2)
}
local function u81(p71, p72) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u15
        [3] = u64
        [4] = u14
    --]]
    if u6 then
        u15.FilterDescendantsInstances = u64
        local v73 = workspace:Raycast(p71, p72, u15)
        if v73 then
            return v73.Position, true
        end
        ::l4::
        return p71 + p72, false
    else
        local v74 = #u64
        while true do
            local v75, v76 = workspace:FindPartOnRayWithIgnoreList(u14(p71, p72), u64, false, true)
            if v75 then
                if v75.CanCollide then
                    local v77 = u64
                    for v78 = #v77, v74 + 1, -1 do
                        v77[v78] = nil
                    end
                    return v76, true
                end
                u64[#u64 + 1] = v75
            end
            if not v75 then
                local v79 = u64
                for v80 = #v79, v74 + 1, -1 do
                    v79[v80] = nil
                end
                goto l4
            end
        end
    end
end
local function u109(p82, p83, p84, p85) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u64
        [2] = u22
        [3] = u6
        [4] = u15
        [5] = u66
        [6] = u16
        [7] = u14
    --]]
    debug.profilebegin("queryPoint")
    local v86 = #u64
    local v87 = p84 + u22
    local v88 = p82 + p83 * v87
    local v89 = (1 / 0)
    local v90 = (1 / 0)
    local v91 = 0
    local v92
    if u6 then
        u15.FilterDescendantsInstances = u64
        local v93 = p82
        while true do
            local v94 = workspace:Raycast(p82, v88 - p82, u15)
            if not v94 then
                v92 = v89
                break
            end
            v91 = v91 + 1
            local v95 = v94.Instance
            local v96 = v94.Position
            v92 = (v96 - v93).Magnitude
            if v91 >= 64 then
                v90 = v92
                v92 = v89
            else
                local v97 = 1 - (1 - v95.Transparency) * (1 - v95.LocalTransparencyModifier) < 0.25 and (u6 or v95.CanCollide)
                if v97 then
                    if u66 == (v95:GetRootPart() or v95) then
                        v97 = false
                    else
                        v97 = not v95:IsA("TrussPart")
                    end
                end
                if v97 then
                    u16.FilterDescendantsInstances = { v95 }
                    if workspace:Raycast(v88, v96 - v88, u16) then
                        local v98
                        if p85 then
                            v98 = workspace:Raycast(p85, v88 - p85, u16) or workspace:Raycast(v88, p85 - v88, u16)
                        else
                            v98 = false
                        end
                        if v98 then
                            v90 = v92
                            v92 = v89
                        elseif v87 >= v89 then
                            v92 = v89
                        end
                    else
                        v90 = v92
                        v92 = v89
                    end
                else
                    v92 = v89
                end
            end
            u15:AddToFilter(v95)
            p82 = v96 - p83 * 0.001
            if v90 < (1 / 0) or not v95 then
                break
            end
            v89 = v92
        end
    else
        local v99 = p82
        while true do
            if true then
                local v100, v101 = workspace:FindPartOnRayWithIgnoreList(u14(p82, v88 - p82), u64, false, true)
                v91 = v91 + 1
                if v100 then
                    local v102 = v91 >= 64
                    local v103 = 1 - (1 - v100.Transparency) * (1 - v100.LocalTransparencyModifier) < 0.25 and (u6 or v100.CanCollide)
                    if v103 then
                        if u66 == (v100:GetRootPart() or v100) then
                            v103 = false
                        else
                            v103 = not v100:IsA("TrussPart")
                        end
                    end
                    if v103 or v102 then
                        local v104 = { v100 }
                        local v105 = workspace:FindPartOnRayWithWhitelist(u14(v88, v101 - v88), v104, true)
                        v92 = (v101 - v99).Magnitude
                        if v105 and not v102 then
                            local v106
                            if p85 then
                                v106 = workspace:FindPartOnRayWithWhitelist(u14(p85, v88 - p85), v104, true) or workspace:FindPartOnRayWithWhitelist(u14(v88, p85 - v88), v104, true)
                            else
                                v106 = false
                            end
                            if v106 then
                                v90 = v92
                                v92 = v89
                            elseif v87 >= v89 then
                                v92 = v89
                            end
                        else
                            v90 = v92
                            v92 = v89
                        end
                    else
                        v92 = v89
                    end
                    u64[#u64 + 1] = v100
                    p82 = v101 - p83 * 0.001
                else
                    v92 = v89
                end
            end
            if v90 < (1 / 0) or not v100 then
                break
            end
            v89 = v92
        end
        local v107 = u64
        for v108 = #v107, v86 + 1, -1 do
            v107[v108] = nil
        end
    end
    debug.profileend()
    return v92 - u22, v90 - u22
end
local function u125(p110, p111) --[[ Line: 361 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u9
        [4] = u21
        [5] = u20
        [6] = u22
        [7] = u109
    --]]
    debug.profilebegin("queryViewport")
    local v112 = p110.p
    local v113 = p110.rightVector
    local v114 = p110.upVector
    local v115 = -p110.lookVector
    local v116
    if u7 then
        v116 = u9:getCamera()
    else
        v116 = u10
    end
    u10 = v116
    local v117 = u10.ViewportSize
    local v118 = (1 / 0)
    local v119 = (1 / 0)
    for v120 = 0, 1 do
        local v121 = v113 * ((v120 - 0.5) * u21)
        for v122 = 0, 1 do
            local v123, v124 = u109(v112 + u22 * (v121 + v114 * ((v122 - 0.5) * u20)), v115, p111, u10:ViewportPointToRay(v117.x * v120, v117.y * v122).Origin)
            if v124 >= v119 then
                v124 = v119
            end
            if v123 < v118 then
                v119 = v124
                v118 = v123
            else
                v119 = v124
            end
        end
    end
    debug.profileend()
    return v118, v119
end
local function u139(p126, p127, p128) --[[ Line: 404 ]]
    --[[
    Upvalues:
        [1] = u81
        [2] = u11
        [3] = u109
        [4] = u70
    --]]
    debug.profilebegin("testPromotion")
    local v129 = p126.p
    local v130 = p126.rightVector
    local v131 = p126.upVector
    local v132 = -p126.lookVector
    debug.profilebegin("extrapolate")
    local v133 = (u81(v129, p128.posVelocity * 1.25) - v129).Magnitude
    local v134 = p128.posVelocity.magnitude
    for v135 = 0, u11(1.25, p128.rotVelocity.magnitude + v133 / v134), 0.0625 do
        local v136 = p128.extrapolate(v135)
        if p127 <= u109(v136.p, -v136.lookVector, p127) then
            return false
        end
    end
    debug.profileend()
    debug.profilebegin("testOffsets")
    for _, v137 in ipairs(u70) do
        local v138 = u81(v129, v130 * v137.x + v131 * v137.y)
        if u109(v138, (v129 + v132 * p127 - v138).Unit, p127) == (1 / 0) then
            return false
        end
    end
    debug.profileend()
    debug.profileend()
    return true
end
return function(p140, p141, p142) --[[ Name: Popper, Line 453 ]]
    --[[
    Upvalues:
        [1] = u66
        [2] = u67
        [3] = u125
        [4] = u139
    --]]
    debug.profilebegin("popper")
    u66 = u67 and u67:GetRootPart() or u67
    local v143, v144 = u125(p140, p141)
    if v144 >= p141 then
        v144 = p141
    end
    if v143 < v144 then
        if not u139(p140, p141, p142) then
            v143 = v144
        end
    else
        v143 = v144
    end
    u66 = nil
    debug.profileend()
    return v143
end