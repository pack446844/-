local v1, v2 = pcall(function() --[[ Line: 10 ]]
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local u3 = v1 and v2
local v4, v5 = pcall(function() --[[ Line: 14 ]]
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local u6 = v4 and v5
local u7 = game:GetService("UserInputService")
local u8 = game:GetService("PathfindingService")
local u9 = game:GetService("Players")
game:GetService("Debris")
local u10 = game:GetService("StarterGui")
local u11 = game:GetService("Workspace")
local u12 = game:GetService("CollectionService")
local u13 = game:GetService("GuiService")
local v14 = script.Parent.Parent:WaitForChild("CommonUtils")
local u15 = require(v14:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u16 = true
local u17 = true
local u18 = false
local u19 = 1
local u20 = 8
local u21 = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true,
    [Enum.KeyCode.Down] = true
}
local u22 = u9.LocalPlayer
local u23 = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local u24 = RaycastParams.new()
u24.FilterType = Enum.RaycastFilterType.Exclude
local u25 = {}
if not u15 then
    local function u28(p26) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        if p26 then
            local v27 = p26:FindFirstChildOfClass("Humanoid")
            if v27 then
                return p26, v27
            else
                return u28(p26.Parent)
            end
        else
            return
        end
    end
    u25.FindCharacterAncestor = u28
    local function u39(p29, p30, p31) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u28
            [3] = u39
        --]]
        local v32 = p31 or {}
        local v33, v34, v35, v36 = u11:FindPartOnRayWithIgnoreList(p29, v32)
        if not v33 then
            return nil, nil
        end
        if p30 and v33.CanCollide == false then
            local v37 = not v33 or v33:FindFirstChildOfClass("Humanoid")
            if not v37 then
                local v38
                v38, v37 = u28(v33.Parent)
            end
            if v37 == nil then
                table.insert(v32, v33)
                return u39(p29, p30, v32)
            end
        end
        return v33, v34, v35, v36
    end
    u25.Raycast = u39
end
local u40 = {}
local u41 = nil
local u42 = nil
local u43 = nil
local u44 = nil
local function u55(p45) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u43
        [3] = u44
        [4] = u41
        [5] = u22
        [6] = u12
    --]]
    if p45 ~= u42 then
        if u43 then
            u43:Disconnect()
            u43 = nil
        end
        if u44 then
            u44:Disconnect()
            u44 = nil
        end
        u42 = p45
        local v46 = {}
        local v47 = u22
        if v47 then
            v47 = u22.Character
        end
        __set_list(v46, 1, {v47})
        u41 = v46
        if u42 ~= nil then
            local v48 = u12:GetTagged(u42)
            for _, v49 in ipairs(v48) do
                local v50 = u41
                table.insert(v50, v49)
            end
            u43 = u12:GetInstanceAddedSignal(u42):Connect(function(p51) --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                local v52 = u41
                table.insert(v52, p51)
            end)
            u44 = u12:GetInstanceRemovedSignal(u42):Connect(function(p53) --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                for v54 = 1, #u41 do
                    if u41[v54] == p53 then
                        u41[v54] = u41[#u41]
                        table.remove(u41)
                        return
                    end
                end
            end)
        end
    end
end
local function u120(p56) --[[ Line: 179 ]]
    if p56 == nil or p56.PrimaryPart == nil then
        return
    else
        assert(p56, "")
        local v57 = p56.PrimaryPart
        assert(v57, "")
        local v58 = p56.PrimaryPart.CFrame:Inverse()
        local v59 = Vector3.new(inf, inf, inf)
        local v60 = Vector3.new(-inf, -inf, -inf)
        for _, v61 in pairs(p56:GetDescendants()) do
            if v61:IsA("BasePart") and v61.CanCollide then
                local v62 = v58 * v61.CFrame
                local v63 = v61.Size.X / 2
                local v64 = v61.Size.Y / 2
                local v65 = v61.Size.Z / 2
                local v66 = Vector3.new(v63, v64, v65)
                local v67 = {}
                local v68 = v66.X
                local v69 = v66.Y
                local v70 = v66.Z
                local v71 = Vector3.new(v68, v69, v70)
                local v72 = v66.X
                local v73 = v66.Y
                local v74 = -v66.Z
                local v75 = Vector3.new(v72, v73, v74)
                local v76 = v66.X
                local v77 = -v66.Y
                local v78 = v66.Z
                local v79 = Vector3.new(v76, v77, v78)
                local v80 = v66.X
                local v81 = -v66.Y
                local v82 = -v66.Z
                local v83 = Vector3.new(v80, v81, v82)
                local v84 = -v66.X
                local v85 = v66.Y
                local v86 = v66.Z
                local v87 = Vector3.new(v84, v85, v86)
                local v88 = -v66.X
                local v89 = v66.Y
                local v90 = -v66.Z
                local v91 = Vector3.new(v88, v89, v90)
                local v92 = -v66.X
                local v93 = -v66.Y
                local v94 = v66.Z
                local v95 = Vector3.new(v92, v93, v94)
                local v96 = -v66.X
                local v97 = -v66.Y
                local v98 = -v66.Z
                __set_list(v67, 1, {v71, v75, v79, v83, v87, v91, v95, (Vector3.new(v96, v97, v98))})
                for _, v99 in ipairs(v67) do
                    local v100 = v62 * v99
                    local v101 = v59.X
                    local v102 = v100.X
                    local v103 = math.min(v101, v102)
                    local v104 = v59.Y
                    local v105 = v100.Y
                    local v106 = math.min(v104, v105)
                    local v107 = v59.Z
                    local v108 = v100.Z
                    local v109 = math.min(v107, v108)
                    v59 = Vector3.new(v103, v106, v109)
                    local v110 = v60.X
                    local v111 = v100.X
                    local v112 = math.max(v110, v111)
                    local v113 = v60.Y
                    local v114 = v100.Y
                    local v115 = math.max(v113, v114)
                    local v116 = v60.Z
                    local v117 = v100.Z
                    local v118 = math.max(v116, v117)
                    v60 = Vector3.new(v112, v115, v118)
                end
            end
        end
        local v119 = v60 - v59
        if v119.X < 0 or (v119.Y < 0 or v119.Z < 0) then
            return nil
        else
            return v119
        end
    end
end
local function u193(p121, p122, p123) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u22
        [3] = u40
        [4] = u19
        [5] = u3
        [6] = u120
        [7] = u6
        [8] = u8
        [9] = u16
        [10] = u23
        [11] = u20
        [12] = u15
        [13] = u24
        [14] = u41
        [15] = u11
    --]]
    local u124 = {}
    local v125
    if p123 == nil then
        v125 = u18
        p123 = true
    else
        v125 = p123
    end
    u124.Cancelled = false
    u124.Started = false
    u124.Finished = Instance.new("BindableEvent")
    u124.PathFailed = Instance.new("BindableEvent")
    u124.PathComputing = false
    u124.PathComputed = false
    u124.OriginalTargetPoint = p121
    u124.TargetPoint = p121
    u124.TargetSurfaceNormal = p122
    u124.DiedConn = nil
    u124.SeatedConn = nil
    u124.BlockedConn = nil
    u124.TeleportedConn = nil
    u124.CurrentPoint = 0
    u124.HumanoidOffsetFromPath = Vector3.new(0, 0, 0)
    u124.CurrentWaypointPosition = nil
    u124.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
    u124.CurrentWaypointPlaneDistance = 0
    u124.CurrentWaypointNeedsJump = false
    u124.CurrentHumanoidPosition = Vector3.new(0, 0, 0)
    u124.CurrentHumanoidVelocity = 0
    u124.NextActionMoveDirection = Vector3.new(0, 0, 0)
    u124.NextActionJump = false
    u124.Timeout = 0
    local v126 = u22
    local v127
    if v126 then
        v127 = v126.Character
    else
        v127 = v126
    end
    local v128
    if v127 then
        v128 = u40[v126]
        if not v128 or v128.Parent ~= v127 then
            u40[v126] = nil
            v128 = v127:FindFirstChildOfClass("Humanoid")
            if v128 then
                u40[v126] = v128
            end
        end
    else
        v128 = nil
    end
    u124.Humanoid = v128
    u124.OriginPoint = nil
    u124.AgentCanFollowPath = false
    u124.DirectPath = false
    u124.DirectPathRiseFirst = false
    u124.stopTraverseFunc = nil
    u124.setPointFunc = nil
    u124.pointList = nil
    local v129 = u124.Humanoid
    if v129 then
        v129 = u124.Humanoid.RootPart
    end
    if v129 then
        u124.OriginPoint = v129.CFrame.Position
        local v130 = 2
        local v131 = 5
        local v132 = true
        local v133 = u124.Humanoid.SeatPart
        if v133 and v133:IsA("VehicleSeat") then
            local v134 = v133:FindFirstAncestorOfClass("Model")
            if v134 then
                local v135 = v134.PrimaryPart
                v134.PrimaryPart = v133
                if p123 then
                    local v136 = v134:GetExtentsSize()
                    local v137 = u19 * 0.5
                    local v138 = v136.X * v136.X + v136.Z * v136.Z
                    v130 = v137 * math.sqrt(v138)
                    v131 = u19 * v136.Y
                    u124.AgentCanFollowPath = true
                    u124.DirectPath = p123
                    v132 = false
                end
                v134.PrimaryPart = v135
            end
        else
            local v139 = nil
            if u3 then
                local v140 = u22
                if v140 then
                    v140 = u22.Character
                end
                if v140 ~= nil then
                    v139 = u120(v140)
                end
            end
            if v139 == nil then
                local v141 = u22
                if v141 then
                    v141 = u22.Character
                end
                v139 = v141:GetExtentsSize()
            end
            assert(v139, "")
            local v142 = u19 * 0.5
            local v143 = v139.X * v139.X + v139.Z * v139.Z
            v130 = v142 * math.sqrt(v143)
            v131 = u19 * v139.Y
            v132 = u124.Humanoid.JumpPower > 0
            u124.AgentCanFollowPath = true
            u124.DirectPath = v125
            u124.DirectPathRiseFirst = u124.Humanoid.Sit
        end
        if u6 then
            u124.pathResult = u8:CreatePath({
                ["AgentRadius"] = v130,
                ["AgentHeight"] = v131,
                ["AgentCanJump"] = v132,
                ["AgentCanClimb"] = true
            })
        else
            u124.pathResult = u8:CreatePath({
                ["AgentRadius"] = v130,
                ["AgentHeight"] = v131,
                ["AgentCanJump"] = v132
            })
        end
    end
    function u124.Cleanup(_) --[[ Line: 332 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        if u124.stopTraverseFunc then
            u124.stopTraverseFunc()
            u124.stopTraverseFunc = nil
        end
        if u124.BlockedConn then
            u124.BlockedConn:Disconnect()
            u124.BlockedConn = nil
        end
        if u124.DiedConn then
            u124.DiedConn:Disconnect()
            u124.DiedConn = nil
        end
        if u124.SeatedConn then
            u124.SeatedConn:Disconnect()
            u124.SeatedConn = nil
        end
        if u124.TeleportedConn then
            u124.TeleportedConn:Disconnect()
            u124.TeleportedConn = nil
        end
        u124.Started = false
    end
    function u124.Cancel(_) --[[ Line: 361 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        u124.Cancelled = true
        u124:Cleanup()
    end
    function u124.IsActive(_) --[[ Line: 366 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v144 = u124.AgentCanFollowPath and u124.Started
        if v144 then
            v144 = not u124.Cancelled
        end
        return v144
    end
    function u124.OnPathInterrupted(_) --[[ Line: 370 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        u124.Cancelled = true
        u124:OnPointReached(false)
    end
    function u124.ComputePath(_) --[[ Line: 376 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        if u124.OriginPoint then
            if u124.PathComputed or u124.PathComputing then
                return
            end
            u124.PathComputing = true
            if u124.AgentCanFollowPath then
                if u124.DirectPath then
                    u124.pointList = { PathWaypoint.new(u124.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(u124.TargetPoint, u124.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) }
                    u124.PathComputed = true
                else
                    u124.pathResult:ComputeAsync(u124.OriginPoint, u124.TargetPoint)
                    u124.pointList = u124.pathResult:GetWaypoints()
                    u124.BlockedConn = u124.pathResult.Blocked:Connect(function(p145) --[[ Line: 390 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124:OnPathBlocked(p145)
                    end)
                    u124.PathComputed = u124.pathResult.Status == Enum.PathStatus.Success
                end
            end
            u124.PathComputing = false
        end
    end
    function u124.IsValidPath(_) --[[ Line: 398 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        u124:ComputePath()
        local v146 = u124.PathComputed
        if v146 then
            v146 = u124.AgentCanFollowPath
        end
        return v146
    end
    u124.Recomputing = false
    function u124.OnPathBlocked(_, p147) --[[ Line: 404 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u16
            [3] = u23
        --]]
        if u124.CurrentPoint <= p147 and not u124.Recomputing then
            u124.Recomputing = true
            if u124.stopTraverseFunc then
                u124.stopTraverseFunc()
                u124.stopTraverseFunc = nil
            end
            u124.OriginPoint = u124.Humanoid.RootPart.CFrame.p
            u124.pathResult:ComputeAsync(u124.OriginPoint, u124.TargetPoint)
            u124.pointList = u124.pathResult:GetWaypoints()
            if #u124.pointList > 0 then
                u124.HumanoidOffsetFromPath = u124.pointList[1].Position - u124.OriginPoint
            end
            u124.PathComputed = u124.pathResult.Status == Enum.PathStatus.Success
            if u16 then
                local v148 = u124
                local v149 = u124
                local v150, v151 = u23.CreatePathDisplay(u124.pointList)
                v148.stopTraverseFunc = v150
                v149.setPointFunc = v151
            end
            if u124.PathComputed then
                u124.CurrentPoint = 1
                u124:OnPointReached(true)
            else
                u124.PathFailed:Fire()
                u124:Cleanup()
            end
            u124.Recomputing = false
        end
    end
    function u124.OnRenderStepped(_, p152) --[[ Line: 440 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u20
        --]]
        if u124.Started and not u124.Cancelled then
            u124.Timeout = u124.Timeout + p152
            if u20 < u124.Timeout then
                u124:OnPointReached(false)
                return
            end
            u124.CurrentHumanoidPosition = u124.Humanoid.RootPart.Position + u124.HumanoidOffsetFromPath
            u124.CurrentHumanoidVelocity = u124.Humanoid.RootPart.Velocity
            while u124.Started and u124:IsCurrentWaypointReached() do
                u124:OnPointReached(true)
            end
            if u124.Started then
                u124.NextActionMoveDirection = u124.CurrentWaypointPosition - u124.CurrentHumanoidPosition
                if u124.NextActionMoveDirection.Magnitude > 1e-6 then
                    u124.NextActionMoveDirection = u124.NextActionMoveDirection.Unit
                else
                    u124.NextActionMoveDirection = Vector3.new(0, 0, 0)
                end
                if u124.CurrentWaypointNeedsJump then
                    u124.NextActionJump = true
                    u124.CurrentWaypointNeedsJump = false
                    return
                end
                u124.NextActionJump = false
            end
        end
    end
    function u124.IsCurrentWaypointReached(_) --[[ Line: 478 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        local v153
        if u124.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0) then
            v153 = true
        else
            local v154 = u124.CurrentWaypointPlaneNormal:Dot(u124.CurrentHumanoidPosition) - u124.CurrentWaypointPlaneDistance
            local v155 = 0.0625 * -u124.CurrentWaypointPlaneNormal:Dot(u124.CurrentHumanoidVelocity)
            v153 = v154 < math.max(1, v155)
        end
        if v153 then
            u124.CurrentWaypointPosition = nil
            u124.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u124.CurrentWaypointPlaneDistance = 0
        end
        return v153
    end
    function u124.OnPointReached(_, p156) --[[ Line: 504 ]]
        --[[
        Upvalues:
            [1] = u124
        --]]
        if p156 and not u124.Cancelled then
            if u124.setPointFunc then
                u124.setPointFunc(u124.CurrentPoint)
            end
            local v157 = u124.CurrentPoint + 1
            if #u124.pointList < v157 then
                if u124.stopTraverseFunc then
                    u124.stopTraverseFunc()
                end
                u124.Finished:Fire()
                u124:Cleanup()
            else
                local v158 = u124.pointList[u124.CurrentPoint]
                local v159 = u124.pointList[v157]
                local v160 = u124.Humanoid:GetState()
                if (v160 == Enum.HumanoidStateType.FallingDown or v160 == Enum.HumanoidStateType.Freefall) and true or v160 == Enum.HumanoidStateType.Jumping then
                    local v161 = v159.Action == Enum.PathWaypointAction.Jump
                    if not v161 and u124.CurrentPoint > 1 then
                        local v162 = u124.pointList[u124.CurrentPoint - 1]
                        local v163 = v158.Position - v162.Position
                        local v164 = v159.Position - v158.Position
                        v161 = Vector2.new(v163.x, v163.z).Unit:Dot(Vector2.new(v164.x, v164.z).Unit) < 0.996
                    end
                    if v161 then
                        u124.Humanoid.FreeFalling:Wait()
                        wait(0.1)
                    end
                end
                u124:MoveToNextWayPoint(v158, v159, v157)
            end
        else
            u124.PathFailed:Fire()
            u124:Cleanup()
            return
        end
    end
    function u124.MoveToNextWayPoint(_, p165, p166, p167) --[[ Line: 567 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u6
        --]]
        u124.CurrentWaypointPlaneNormal = p165.Position - p166.Position
        if not u6 or p166.Label ~= "Climb" then
            local v168 = u124
            local v169 = u124.CurrentWaypointPlaneNormal.X
            local v170 = u124.CurrentWaypointPlaneNormal.Z
            v168.CurrentWaypointPlaneNormal = Vector3.new(v169, 0, v170)
        end
        if u124.CurrentWaypointPlaneNormal.Magnitude > 1e-6 then
            u124.CurrentWaypointPlaneNormal = u124.CurrentWaypointPlaneNormal.Unit
            u124.CurrentWaypointPlaneDistance = u124.CurrentWaypointPlaneNormal:Dot(p166.Position)
        else
            u124.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u124.CurrentWaypointPlaneDistance = 0
        end
        u124.CurrentWaypointNeedsJump = p166.Action == Enum.PathWaypointAction.Jump
        u124.CurrentWaypointPosition = p166.Position
        u124.CurrentPoint = p167
        u124.Timeout = 0
    end
    function u124.Start(_, p171) --[[ Line: 599 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u23
            [3] = u16
        --]]
        if u124.AgentCanFollowPath then
            if u124.Started then
                return
            else
                u124.Started = true
                u23.CancelFailureAnimation()
                if u16 and (p171 == nil or p171) then
                    local v172 = u124
                    local v173 = u124
                    local v174, v175 = u23.CreatePathDisplay(u124.pointList, u124.OriginalTargetPoint)
                    v172.stopTraverseFunc = v174
                    v173.setPointFunc = v175
                end
                if #u124.pointList > 0 then
                    local v176 = u124
                    local v177 = u124.pointList[1].Position.Y - u124.OriginPoint.Y
                    v176.HumanoidOffsetFromPath = Vector3.new(0, v177, 0)
                    u124.CurrentHumanoidPosition = u124.Humanoid.RootPart.Position + u124.HumanoidOffsetFromPath
                    u124.CurrentHumanoidVelocity = u124.Humanoid.RootPart.Velocity
                    u124.SeatedConn = u124.Humanoid.Seated:Connect(function(_, _) --[[ Line: 626 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124:OnPathInterrupted()
                    end)
                    u124.DiedConn = u124.Humanoid.Died:Connect(function() --[[ Line: 627 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124:OnPathInterrupted()
                    end)
                    u124.TeleportedConn = u124.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 628 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124:OnPathInterrupted()
                    end)
                    u124.CurrentPoint = 1
                    u124:OnPointReached(true)
                else
                    u124.PathFailed:Fire()
                    if u124.stopTraverseFunc then
                        u124.stopTraverseFunc()
                    end
                end
            end
        else
            u124.PathFailed:Fire()
            return
        end
    end
    local v178 = u124.TargetPoint + u124.TargetSurfaceNormal * 1.5
    if u15 then
        local v179 = u24
        local v180
        if u41 then
            v180 = u41
        else
            u41 = {}
            local v181 = u41
            assert(v181, "")
            local v182 = u41
            local v183 = u22
            if v183 then
                v183 = u22.Character
            end
            table.insert(v182, v183)
            v180 = u41
        end
        v179.FilterDescendantsInstances = v180
        local v184 = u11:Raycast(v178, Vector3.new(-0, -50, -0), u24)
        if v184 then
            u124.TargetPoint = v184.Position
        end
    else
        local v185 = Ray.new(v178, Vector3.new(0, -50, 0))
        local v186 = u11
        local v187
        if u41 then
            v187 = u41
        else
            u41 = {}
            local v188 = u41
            assert(v188, "")
            local v189 = u41
            local v190 = u22
            if v190 then
                v190 = u22.Character
            end
            table.insert(v189, v190)
            v187 = u41
        end
        local v191, v192 = v186:FindPartOnRayWithIgnoreList(v185, v187)
        if v191 then
            u124.TargetPoint = v192
        end
    end
    u124:ComputePath()
    return u124
end
local function u196(p194) --[[ Line: 669 ]]
    if p194 ~= nil then
        for _, v195 in pairs(p194:GetChildren()) do
            if v195:IsA("Tool") then
                return v195
            end
        end
    end
end
local u197 = nil
local u198 = nil
local u199 = nil
local function u208(p200, u201, u202, u203, u204) --[[ Line: 702 ]]
    --[[
    Upvalues:
        [1] = u197
        [2] = u198
        [3] = u199
        [4] = u196
        [5] = u17
        [6] = u23
    --]]
    if u197 then
        if u197 then
            u197:Cancel()
            u197 = nil
        end
        if u198 then
            u198:Disconnect()
            u198 = nil
        end
        if u199 then
            u199:Disconnect()
            u199 = nil
        end
    end
    u197 = p200
    p200:Start(u204)
    u198 = p200.Finished.Event:Connect(function() --[[ Line: 709 ]]
        --[[
        Upvalues:
            [1] = u197
            [2] = u198
            [3] = u199
            [4] = u202
            [5] = u196
            [6] = u203
        --]]
        if u197 then
            u197:Cancel()
            u197 = nil
        end
        if u198 then
            u198:Disconnect()
            u198 = nil
        end
        if u199 then
            u199:Disconnect()
            u199 = nil
        end
        local v205 = u202 and u196(u203)
        if v205 then
            v205:Activate()
        end
    end)
    u199 = p200.PathFailed.Event:Connect(function() --[[ Line: 718 ]]
        --[[
        Upvalues:
            [1] = u197
            [2] = u198
            [3] = u199
            [4] = u204
            [5] = u17
            [6] = u23
            [7] = u201
        --]]
        if u197 then
            u197:Cancel()
            u197 = nil
        end
        if u198 then
            u198:Disconnect()
            u198 = nil
        end
        if u199 then
            u199:Disconnect()
            u199 = nil
        end
        if u204 == nil or u204 then
            local v206 = u17
            if v206 then
                local v207 = u197
                if v207 then
                    v207 = u197:IsActive()
                end
                v206 = not v207
            end
            if v206 then
                u23.PlayFailureAnimation()
            end
            u23.DisplayFailureWaypoint(u201)
        end
    end)
end
function OnTap(p209, p210, p211)
    --[[
    Upvalues:
        [1] = u11
        [2] = u22
        [3] = u40
        [4] = u15
        [5] = u41
        [6] = u24
        [7] = u10
        [8] = u9
        [9] = u197
        [10] = u198
        [11] = u199
        [12] = u193
        [13] = u208
        [14] = u17
        [15] = u23
        [16] = u25
        [17] = u196
    --]]
    local v212 = u11.CurrentCamera
    local v213 = u22.Character
    local v214 = u22
    local v215
    if v214 then
        v215 = v214.Character
    else
        v215 = v214
    end
    local v216
    if v215 then
        v216 = u40[v214]
        if not v216 or v216.Parent ~= v215 then
            u40[v214] = nil
            v216 = v215:FindFirstChildOfClass("Humanoid")
            if v216 then
                u40[v214] = v216
            end
        end
    else
        v216 = nil
    end
    local v217
    if v216 == nil then
        v217 = false
    else
        v217 = v216.Health > 0
    end
    if not v217 then
        return
    end
    if #p209 ~= 1 and not p210 then
        local v218 = #p209 >= 2 and (v212 and u196(v213))
        if v218 then
            v218:Activate()
        end
        goto l21
    end
    if not v212 then
        ::l21::
        return
    end
    local v219 = v212:ScreenPointToRay(p209[1].X, p209[1].Y)
    if not u15 then
        local v220 = Ray.new(v219.Origin, v219.Direction * 1000)
        local v221 = u25.Raycast
        local v222 = true
        local v223
        if u41 then
            v223 = u41
        else
            u41 = {}
            local v224 = u41
            assert(v224, "")
            local v225 = u41
            local v226 = u22
            if v226 then
                v226 = u22.Character
            end
            table.insert(v225, v226)
            v223 = u41
        end
        local v227, v228, v229 = v221(v220, v222, v223)
        local v230, v231 = u25.FindCharacterAncestor(v227)
        if p211 and (v231 and (u10:GetCore("AvatarContextMenuEnabled") and u9:GetPlayerFromCharacter(v231.Parent))) then
            if u197 then
                u197:Cancel()
                u197 = nil
            end
            if u198 then
                u198:Disconnect()
                u198 = nil
            end
            if u199 then
                u199:Disconnect()
                u199 = nil
            end
            return
        end
        if p210 then
            v230 = nil
        else
            p210 = v228
        end
        if p210 and v213 then
            if u197 then
                u197:Cancel()
                u197 = nil
            end
            if u198 then
                u198:Disconnect()
                u198 = nil
            end
            if u199 then
                u199:Disconnect()
                u199 = nil
            end
            local v232 = u193(p210, v229)
            if v232:IsValidPath() then
                u208(v232, p210, v230, v213)
            else
                v232:Cleanup()
                if u197 and u197:IsActive() then
                    u197:Cancel()
                end
                if u17 then
                    u23.PlayFailureAnimation()
                end
                u23.DisplayFailureWaypoint(p210)
            end
        end
        goto l21
    end
    local v233 = nil
    local v234 = nil
    local v235
    if u41 then
        v235 = u41
    else
        u41 = {}
        local v236 = u41
        assert(v236, "")
        local v237 = u41
        local v238 = u22
        if v238 then
            v238 = u22.Character
        end
        table.insert(v237, v238)
        v235 = u41
    end
    if not v235 then
        v235 = {}
    end
    while true do
        local v239 = true
        u24.FilterDescendantsInstances = v235
        local v240 = u11:Raycast(v219.Origin, v219.Direction * 1000, u24)
        if v240 then
            local v241 = v240.Instance
            if not v241.CanCollide then
                while true do
                    v233 = v241:FindFirstChildOfClass("Humanoid")
                    local v242 = v241.Parent
                    if v233 or not v242 then
                        break
                    end
                    v241 = v242
                end
                if v233 or not v242 then
                    v234 = v241
                else
                    table.insert(v235, v242)
                    v239 = false
                    v234 = nil
                end
                goto l32
            end
        end
        ::l32::
        if v239 then
            if p211 and (v233 and (u10:GetCore("AvatarContextMenuEnabled") and u9:GetPlayerFromCharacter(v233.Parent))) then
                if u197 then
                    u197:Cancel()
                    u197 = nil
                end
                if u198 then
                    u198:Disconnect()
                    u198 = nil
                end
                if u199 then
                    u199:Disconnect()
                    u199 = nil
                end
                return
            elseif v240 and v213 then
                local v243 = v240.Position
                if p210 then
                    v234 = nil
                else
                    p210 = v243
                end
                if u197 then
                    u197:Cancel()
                    u197 = nil
                end
                if u198 then
                    u198:Disconnect()
                    u198 = nil
                end
                if u199 then
                    u199:Disconnect()
                    u199 = nil
                end
                local v244 = u193(p210, v240.Normal)
                if v244:IsValidPath() then
                    u208(v244, p210, v234, v213)
                else
                    v244:Cleanup()
                    if u197 and u197:IsActive() then
                        u197:Cancel()
                    end
                    if u17 then
                        u23.PlayFailureAnimation()
                    end
                    u23.DisplayFailureWaypoint(p210)
                end
            else
                return
            end
        end
    end
end
local u245 = require(script.Parent:WaitForChild("Keyboard"))
local u246 = setmetatable({}, u245)
u246.__index = u246
function u246.new(p247) --[[ Line: 861 ]]
    --[[
    Upvalues:
        [1] = u245
        [2] = u246
    --]]
    local v248 = u245.new(p247)
    local v249 = u246
    local v250 = setmetatable(v248, v249)
    v250.fingerTouches = {}
    v250.numUnsunkTouches = 0
    v250.mouse2DownTime = tick()
    v250.mouse2DownPos = Vector2.new()
    v250.mouse2UpTime = tick()
    v250.keyboardMoveVector = Vector3.new(0, 0, 0)
    v250.tapConn = nil
    v250.inputBeganConn = nil
    v250.inputChangedConn = nil
    v250.inputEndedConn = nil
    v250.humanoidDiedConn = nil
    v250.characterChildAddedConn = nil
    v250.onCharacterAddedConn = nil
    v250.characterChildRemovedConn = nil
    v250.renderSteppedConn = nil
    v250.menuOpenedConnection = nil
    v250.preferredInputChangedConnection = nil
    v250.running = false
    v250.wasdEnabled = false
    return v250
end
function u246.DisconnectEvents(p251) --[[ Line: 892 ]]
    local v252 = p251.tapConn
    if v252 then
        v252:Disconnect()
    end
    local v253 = p251.inputBeganConn
    if v253 then
        v253:Disconnect()
    end
    local v254 = p251.inputChangedConn
    if v254 then
        v254:Disconnect()
    end
    local v255 = p251.inputEndedConn
    if v255 then
        v255:Disconnect()
    end
    local v256 = p251.humanoidDiedConn
    if v256 then
        v256:Disconnect()
    end
    local v257 = p251.characterChildAddedConn
    if v257 then
        v257:Disconnect()
    end
    local v258 = p251.onCharacterAddedConn
    if v258 then
        v258:Disconnect()
    end
    local v259 = p251.renderSteppedConn
    if v259 then
        v259:Disconnect()
    end
    local v260 = p251.characterChildRemovedConn
    if v260 then
        v260:Disconnect()
    end
    local v261 = p251.menuOpenedConnection
    if v261 then
        v261:Disconnect()
    end
    local v262 = p251.preferredInputChangedConnection
    if v262 then
        v262:Disconnect()
    end
end
function u246.OnTouchBegan(p263, p264, p265) --[[ Line: 906 ]]
    if p263.fingerTouches[p264] == nil and not p265 then
        p263.numUnsunkTouches = p263.numUnsunkTouches + 1
    end
    p263.fingerTouches[p264] = p265
end
function u246.OnTouchChanged(p266, p267, p268) --[[ Line: 913 ]]
    if p266.fingerTouches[p267] == nil then
        p266.fingerTouches[p267] = p268
        if not p268 then
            p266.numUnsunkTouches = p266.numUnsunkTouches + 1
        end
    end
end
function u246.OnTouchEnded(p269, p270, _) --[[ Line: 922 ]]
    if p269.fingerTouches[p270] ~= nil and p269.fingerTouches[p270] == false then
        p269.numUnsunkTouches = p269.numUnsunkTouches - 1
    end
    p269.fingerTouches[p270] = nil
end
function u246.OnPreferredInputChanged(_) --[[ Line: 929 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u7
    --]]
    local v271 = u22.Character
    if v271 then
        local v272 = u7.PreferredInput == Enum.PreferredInput.Touch
        for _, v273 in pairs(v271:GetChildren()) do
            if v273:IsA("Tool") then
                v273.ManualActivationOnly = v272
            end
        end
    end
end
function u246.OnCharacterAdded(u274, p275) --[[ Line: 941 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u197
        [4] = u198
        [5] = u199
        [6] = u23
        [7] = u13
    --]]
    u274:DisconnectEvents()
    u274.inputBeganConn = u7.InputBegan:Connect(function(p276, p277) --[[ Line: 944 ]]
        --[[
        Upvalues:
            [1] = u274
            [2] = u21
            [3] = u197
            [4] = u198
            [5] = u199
            [6] = u23
        --]]
        if p276.UserInputType == Enum.UserInputType.Touch then
            u274:OnTouchBegan(p276, p277)
        end
        if u274.wasdEnabled and (p277 == false and (p276.UserInputType == Enum.UserInputType.Keyboard and u21[p276.KeyCode])) then
            if u197 then
                u197:Cancel()
                u197 = nil
            end
            if u198 then
                u198:Disconnect()
                u198 = nil
            end
            if u199 then
                u199:Disconnect()
                u199 = nil
            end
            u23.CancelFailureAnimation()
        end
        if p276.UserInputType == Enum.UserInputType.MouseButton2 then
            u274.mouse2DownTime = tick()
            u274.mouse2DownPos = p276.Position
        end
    end)
    u274.inputChangedConn = u7.InputChanged:Connect(function(p278, p279) --[[ Line: 961 ]]
        --[[
        Upvalues:
            [1] = u274
        --]]
        if p278.UserInputType == Enum.UserInputType.Touch then
            u274:OnTouchChanged(p278, p279)
        end
    end)
    u274.inputEndedConn = u7.InputEnded:Connect(function(p280, p281) --[[ Line: 967 ]]
        --[[
        Upvalues:
            [1] = u274
            [2] = u197
        --]]
        if p280.UserInputType == Enum.UserInputType.Touch then
            u274:OnTouchEnded(p280, p281)
        end
        if p280.UserInputType == Enum.UserInputType.MouseButton2 then
            u274.mouse2UpTime = tick()
            local v282 = p280.Position
            local v283 = u197 or u274.keyboardMoveVector.Magnitude <= 0
            if u274.mouse2UpTime - u274.mouse2DownTime < 0.25 and ((v282 - u274.mouse2DownPos).magnitude < 5 and v283) then
                OnTap({ v282 })
            end
        end
    end)
    u274.tapConn = u7.TouchTap:Connect(function(p284, p285) --[[ Line: 984 ]]
        if not p285 then
            OnTap(p284, nil, true)
        end
    end)
    u274.menuOpenedConnection = u13.MenuOpened:Connect(function() --[[ Line: 990 ]]
        --[[
        Upvalues:
            [1] = u197
            [2] = u198
            [3] = u199
        --]]
        if u197 then
            u197:Cancel()
            u197 = nil
        end
        if u198 then
            u198:Disconnect()
            u198 = nil
        end
        if u199 then
            u199:Disconnect()
            u199 = nil
        end
    end)
    local function u288(p286) --[[ Line: 994 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u274
        --]]
        if u7.PreferredInput == Enum.PreferredInput.Touch and p286:IsA("Tool") then
            p286.ManualActivationOnly = true
        end
        if p286:IsA("Humanoid") then
            local v287 = u274.humanoidDiedConn
            if v287 then
                v287:Disconnect()
            end
            u274.humanoidDiedConn = p286.Died:Connect(function() --[[ Line: 1002 ]] end)
        end
    end
    u274.characterChildAddedConn = p275.ChildAdded:Connect(function(p289) --[[ Line: 1010 ]]
        --[[
        Upvalues:
            [1] = u288
        --]]
        u288(p289)
    end)
    u274.characterChildRemovedConn = p275.ChildRemoved:Connect(function(p290) --[[ Line: 1013 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if u7.PreferredInput == Enum.PreferredInput.Touch and p290:IsA("Tool") then
            p290.ManualActivationOnly = false
        end
    end)
    for _, v291 in pairs(p275:GetChildren()) do
        u288(v291)
    end
    u274.preferredInputChangedConnection = u7:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 1024 ]]
        --[[
        Upvalues:
            [1] = u274
        --]]
        u274:OnPreferredInputChanged()
    end)
end
function u246.Start(p292) --[[ Line: 1029 ]]
    p292:Enable(true)
end
function u246.Stop(p293) --[[ Line: 1033 ]]
    p293:Enable(false)
end
function u246.CleanupPath(_) --[[ Line: 1037 ]]
    --[[
    Upvalues:
        [1] = u197
        [2] = u198
        [3] = u199
    --]]
    if u197 then
        u197:Cancel()
        u197 = nil
    end
    if u198 then
        u198:Disconnect()
        u198 = nil
    end
    if u199 then
        u199:Disconnect()
        u199 = nil
    end
end
function u246.Enable(u294, p295, p296, p297) --[[ Line: 1041 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u197
        [3] = u198
        [4] = u199
        [5] = u7
        [6] = u245
    --]]
    if p295 then
        if not u294.running then
            if u22.Character then
                u294:OnCharacterAdded(u22.Character)
            end
            u294.onCharacterAddedConn = u22.CharacterAdded:Connect(function(p298) --[[ Line: 1047 ]]
                --[[
                Upvalues:
                    [1] = u294
                --]]
                u294:OnCharacterAdded(p298)
            end)
            u294.running = true
        end
        u294.touchJumpController = p297
        if u294.touchJumpController then
            u294.touchJumpController:Enable(u294.jumpEnabled)
        end
    else
        if u294.running then
            u294:DisconnectEvents()
            if u197 then
                u197:Cancel()
                u197 = nil
            end
            if u198 then
                u198:Disconnect()
                u198 = nil
            end
            if u199 then
                u199:Disconnect()
                u199 = nil
            end
            if u7.PreferredInput == Enum.PreferredInput.Touch then
                local v299 = u22.Character
                if v299 then
                    for _, v300 in pairs(v299:GetChildren()) do
                        if v300:IsA("Tool") then
                            v300.ManualActivationOnly = false
                        end
                    end
                end
            end
            u294.running = false
        end
        if u294.touchJumpController and not u294.jumpEnabled then
            u294.touchJumpController:Enable(true)
        end
        u294.touchJumpController = nil
    end
    u245.Enable(u294, p295)
    u294.wasdEnabled = p295 and p296 and p296 or false
    u294.enabled = p295
end
function u246.OnRenderStepped(p301, p302) --[[ Line: 1086 ]]
    --[[
    Upvalues:
        [1] = u197
    --]]
    p301.isJumping = false
    if u197 then
        u197:OnRenderStepped(p302)
        if u197 then
            p301.moveVector = u197.NextActionMoveDirection
            p301.moveVectorIsCameraRelative = false
            if u197.NextActionJump then
                p301.isJumping = true
            end
        else
            p301.moveVector = p301.keyboardMoveVector
            p301.moveVectorIsCameraRelative = true
        end
    else
        p301.moveVector = p301.keyboardMoveVector
        p301.moveVectorIsCameraRelative = true
    end
    if p301.jumpRequested then
        p301.isJumping = true
    end
end
function u246.UpdateMovement(p303, p304) --[[ Line: 1121 ]]
    if p304 == Enum.UserInputState.Cancel then
        p303.keyboardMoveVector = Vector3.new(0, 0, 0)
    elseif p303.wasdEnabled then
        local v305 = p303.leftValue + p303.rightValue
        local v306 = p303.forwardValue + p303.backwardValue
        p303.keyboardMoveVector = Vector3.new(v305, 0, v306)
    end
end
function u246.UpdateJump(_) --[[ Line: 1130 ]] end
function u246.SetShowPath(_, p307) --[[ Line: 1135 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16 = p307
end
function u246.GetShowPath(_) --[[ Line: 1139 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    return u16
end
function u246.SetWaypointTexture(_, p308) --[[ Line: 1143 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.SetWaypointTexture(p308)
end
function u246.GetWaypointTexture(_) --[[ Line: 1147 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23.GetWaypointTexture()
end
function u246.SetWaypointRadius(_, p309) --[[ Line: 1151 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.SetWaypointRadius(p309)
end
function u246.GetWaypointRadius(_) --[[ Line: 1155 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23.GetWaypointRadius()
end
function u246.SetEndWaypointTexture(_, p310) --[[ Line: 1159 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.SetEndWaypointTexture(p310)
end
function u246.GetEndWaypointTexture(_) --[[ Line: 1163 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23.GetEndWaypointTexture()
end
function u246.SetWaypointsAlwaysOnTop(_, p311) --[[ Line: 1167 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.SetWaypointsAlwaysOnTop(p311)
end
function u246.GetWaypointsAlwaysOnTop(_) --[[ Line: 1171 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23.GetWaypointsAlwaysOnTop()
end
function u246.SetFailureAnimationEnabled(_, p312) --[[ Line: 1175 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17 = p312
end
function u246.GetFailureAnimationEnabled(_) --[[ Line: 1179 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return u17
end
function u246.SetIgnoredPartsTag(_, p313) --[[ Line: 1183 ]]
    --[[
    Upvalues:
        [1] = u55
    --]]
    u55(p313)
end
function u246.GetIgnoredPartsTag(_) --[[ Line: 1187 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    return u42
end
function u246.SetUseDirectPath(_, p314) --[[ Line: 1191 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18 = p314
end
function u246.GetUseDirectPath(_) --[[ Line: 1195 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return u18
end
function u246.SetAgentSizeIncreaseFactor(_, p315) --[[ Line: 1199 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19 = p315 / 100 + 1
end
function u246.GetAgentSizeIncreaseFactor(_) --[[ Line: 1203 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return (u19 - 1) * 100
end
function u246.SetUnreachableWaypointTimeout(_, p316) --[[ Line: 1207 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20 = p316
end
function u246.GetUnreachableWaypointTimeout(_) --[[ Line: 1211 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return u20
end
function u246.SetUserJumpEnabled(p317, p318) --[[ Line: 1215 ]]
    p317.jumpEnabled = p318
    if p317.touchJumpController then
        p317.touchJumpController:Enable(p318)
    end
end
function u246.GetUserJumpEnabled(p319) --[[ Line: 1222 ]]
    return p319.jumpEnabled
end
function u246.MoveTo(_, p320, p321, p322) --[[ Line: 1226 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u193
        [3] = u208
    --]]
    local v323 = u22.Character
    if v323 == nil then
        return false
    end
    local v324 = u193(p320, Vector3.new(0, 1, 0), p322)
    if not (v324 and v324:IsValidPath()) then
        return false
    end
    u208(v324, p320, nil, v323, p321)
    return true
end
return u246