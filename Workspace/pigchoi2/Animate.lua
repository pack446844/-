local u1 = script.Parent
local u2 = u1:WaitForChild("Humanoid")
local u3 = "Standing"
local function u4() --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1:GetScale()
end
local u5 = script:FindFirstChild("ScaleDampeningPercent")
local u6 = ""
local u7 = nil
local u8 = nil
local u9 = nil
local u10 = 1
local u11 = nil
local u12 = nil
local u13 = {}
local u14 = {}
local u15 = {
    ["idle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766666",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766951",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766388",
            ["weight"] = 9
        }
    },
    ["walk"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777826",
            ["weight"] = 10
        }
    },
    ["run"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767714",
            ["weight"] = 10
        }
    },
    ["swim"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507784897",
            ["weight"] = 10
        }
    },
    ["swimidle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507785072",
            ["weight"] = 10
        }
    },
    ["jump"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765000",
            ["weight"] = 10
        }
    },
    ["fall"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767968",
            ["weight"] = 10
        }
    },
    ["climb"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765644",
            ["weight"] = 10
        }
    },
    ["sit"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=2506281703",
            ["weight"] = 10
        }
    },
    ["toolnone"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507768375",
            ["weight"] = 10
        }
    },
    ["toolslash"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522635514",
            ["weight"] = 10
        }
    },
    ["toollunge"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522638767",
            ["weight"] = 10
        }
    },
    ["wave"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770239",
            ["weight"] = 10
        }
    },
    ["point"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770453",
            ["weight"] = 10
        }
    },
    ["dance"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771019",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771955",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507772104",
            ["weight"] = 10
        }
    },
    ["dance2"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776043",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776720",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776879",
            ["weight"] = 10
        }
    },
    ["dance3"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777268",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777451",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777623",
            ["weight"] = 10
        }
    },
    ["laugh"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770818",
            ["weight"] = 10
        }
    },
    ["cheer"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770677",
            ["weight"] = 10
        }
    }
}
local u16 = {
    ["wave"] = false,
    ["point"] = false,
    ["dance"] = true,
    ["dance2"] = true,
    ["dance3"] = true,
    ["laugh"] = false,
    ["cheer"] = false
}
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = nil
function resetManagerListeners()
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u19
    --]]
    if u17 then
        u17:Disconnect()
        u17 = nil
    end
    if u18 then
        u18:Disconnect()
        u18 = nil
    end
    if u19 then
        u19:Disconnect()
        u19 = nil
    end
end
function processIfManagerBelongsToCharacter(u22)
    --[[
    Upvalues:
        [1] = u1
        [2] = u21
        [3] = u20
        [4] = u17
        [5] = u18
        [6] = u19
    --]]
    if u22.RootPart ~= u1.PrimaryPart then
        return false
    end
    if u21 ~= u22 then
        resetManagerListeners()
        u20 = u22.GroundSensor
        u17 = u22:GetPropertyChangedSignal("GroundSensor"):Connect(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u17
            --]]
            if processIfManagerBelongsToCharacter(u22) then
                u17:Disconnect()
                u17 = nil
            end
        end)
        u18 = u22:GetPropertyChangedSignal("RootPart"):Connect(function() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u18
            --]]
            if processIfManagerBelongsToCharacter(u22) then
                u18:Disconnect()
                u18 = nil
            end
        end)
        u19 = u22.AncestryChanged:Connect(function(_, p23) --[[ Line: 149 ]]
            if p23 == nil then
                resetManagerListeners()
                lookForControllerManager()
            end
        end)
        u21 = u22
    end
    return true
end
function lookForControllerManager()
    --[[
    Upvalues:
        [1] = u20
        [2] = u21
        [3] = u1
    --]]
    u20 = nil
    u21 = nil
    local v24 = u1:FindFirstChildOfClass("ControllerManager")
    if v24 then
        processIfManagerBelongsToCharacter(v24)
    end
    if u21 == nil then
        local u25 = nil
        u25 = u1.ChildAdded:Connect(function(p26) --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            if p26:IsA("ControllerManager") and processIfManagerBelongsToCharacter(p26) then
                u25:Disconnect()
                u25 = nil
            end
        end)
    end
end
lookForControllerManager()
math.randomseed(tick())
function findExistingAnimationInSet(p27, p28)
    if p27 == nil or p28 == nil then
        return 0
    end
    for v29 = 1, p27.count do
        if p27[v29].anim.AnimationId == p28.AnimationId then
            return v29
        end
    end
    return 0
end
function configureAnimationSet(u30, u31)
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u2
    --]]
    if u14[u30] ~= nil then
        for _, v32 in pairs(u14[u30].connections) do
            v32:disconnect()
        end
    end
    u14[u30] = {}
    u14[u30].count = 0
    u14[u30].totalWeight = 0
    u14[u30].connections = {}
    local u33 = true
    local v34, _ = pcall(function() --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    u33 = not v34 and true or u33
    local v35 = script:FindFirstChild(u30)
    if u33 and v35 ~= nil then
        local v36 = u14[u30].connections
        local v37 = v35.ChildAdded
        table.insert(v36, v37:connect(function(_) --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            configureAnimationSet(u30, u31)
        end))
        local v38 = u14[u30].connections
        local v39 = v35.ChildRemoved
        table.insert(v38, v39:connect(function(_) --[[ Line: 227 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            configureAnimationSet(u30, u31)
        end))
        for _, v40 in pairs(v35:GetChildren()) do
            if v40:IsA("Animation") then
                local v41 = v40:FindFirstChild("Weight")
                local v42 = v41 == nil and 1 or v41.Value
                u14[u30].count = u14[u30].count + 1
                local v43 = u14[u30].count
                u14[u30][v43] = {}
                u14[u30][v43].anim = v40
                u14[u30][v43].weight = v42
                u14[u30].totalWeight = u14[u30].totalWeight + u14[u30][v43].weight
                local v44 = u14[u30].connections
                local v45 = v40.Changed
                table.insert(v44, v45:connect(function(_) --[[ Line: 243 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                    --]]
                    configureAnimationSet(u30, u31)
                end))
                local v46 = u14[u30].connections
                local v47 = v40.ChildAdded
                table.insert(v46, v47:connect(function(_) --[[ Line: 244 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                    --]]
                    configureAnimationSet(u30, u31)
                end))
                local v48 = u14[u30].connections
                local v49 = v40.ChildRemoved
                table.insert(v48, v49:connect(function(_) --[[ Line: 245 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                    --]]
                    configureAnimationSet(u30, u31)
                end))
            end
        end
    end
    if u14[u30].count <= 0 then
        for v50, v51 in pairs(u31) do
            u14[u30][v50] = {}
            u14[u30][v50].anim = Instance.new("Animation")
            u14[u30][v50].anim.Name = u30
            u14[u30][v50].anim.AnimationId = v51.id
            u14[u30][v50].weight = v51.weight
            u14[u30].count = u14[u30].count + 1
            u14[u30].totalWeight = u14[u30].totalWeight + v51.weight
        end
    end
    for _, v52 in pairs(u14) do
        for v53 = 1, v52.count do
            if u13[v52[v53].anim.AnimationId] == nil then
                u2:LoadAnimation(v52[v53].anim)
                u13[v52[v53].anim.AnimationId] = true
            end
        end
    end
end
function configureAnimationSetOld(u54, u55)
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
    --]]
    if u14[u54] ~= nil then
        for _, v56 in pairs(u14[u54].connections) do
            v56:disconnect()
        end
    end
    u14[u54] = {}
    u14[u54].count = 0
    u14[u54].totalWeight = 0
    u14[u54].connections = {}
    local u57 = true
    local v58, _ = pcall(function() --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    u57 = not v58 and true or u57
    local v59 = script:FindFirstChild(u54)
    if u57 and v59 ~= nil then
        local v60 = u14[u54].connections
        local v61 = v59.ChildAdded
        table.insert(v60, v61:connect(function(_) --[[ Line: 297 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
            --]]
            configureAnimationSet(u54, u55)
        end))
        local v62 = u14[u54].connections
        local v63 = v59.ChildRemoved
        table.insert(v62, v63:connect(function(_) --[[ Line: 298 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
            --]]
            configureAnimationSet(u54, u55)
        end))
        local v64 = 1
        for _, v65 in pairs(v59:GetChildren()) do
            if v65:IsA("Animation") then
                local v66 = u14[u54].connections
                local v67 = v65.Changed
                table.insert(v66, v67:connect(function(_) --[[ Line: 302 ]]
                    --[[
                    Upvalues:
                        [1] = u54
                        [2] = u55
                    --]]
                    configureAnimationSet(u54, u55)
                end))
                u14[u54][v64] = {}
                u14[u54][v64].anim = v65
                local v68 = v65:FindFirstChild("Weight")
                if v68 == nil then
                    u14[u54][v64].weight = 1
                else
                    u14[u54][v64].weight = v68.Value
                end
                u14[u54].count = u14[u54].count + 1
                u14[u54].totalWeight = u14[u54].totalWeight + u14[u54][v64].weight
                v64 = v64 + 1
            end
        end
    end
    if u14[u54].count <= 0 then
        for v69, v70 in pairs(u55) do
            u14[u54][v69] = {}
            u14[u54][v69].anim = Instance.new("Animation")
            u14[u54][v69].anim.Name = u54
            u14[u54][v69].anim.AnimationId = v70.id
            u14[u54][v69].weight = v70.weight
            u14[u54].count = u14[u54].count + 1
            u14[u54].totalWeight = u14[u54].totalWeight + v70.weight
        end
    end
    for _, v71 in pairs(u14) do
        for v72 = 1, v71.count do
            u2:LoadAnimation(v71[v72].anim)
        end
    end
end
function scriptChildModified(p73)
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v74 = u15[p73.Name]
    if v74 ~= nil then
        configureAnimationSet(p73.Name, v74)
    end
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local v75
if u2 then
    v75 = u2:FindFirstChildOfClass("Animator")
else
    v75 = nil
end
local u76, u77
if v75 then
    local v78 = v75:GetPlayingAnimationTracks()
    u76 = u20
    u77 = u21
    for _, v79 in ipairs(v78) do
        v79:Stop(0)
        v79:Destroy()
    end
else
    u76 = u20
    u77 = u21
end
for v80, v81 in pairs(u15) do
    configureAnimationSet(v80, v81)
end
local u82 = "None"
local u83 = 0
local u84 = 0
local u85 = false
function stopAllAnimations()
    --[[
    Upvalues:
        [1] = u6
        [2] = u16
        [3] = u85
        [4] = u7
        [5] = u9
        [6] = u8
        [7] = u12
        [8] = u11
    --]]
    local v86 = u6
    local v87 = u16[v86] ~= nil and u16[v86] == false and "idle" or v86
    if u85 then
        v87 = "idle"
        u85 = false
    end
    u6 = ""
    u7 = nil
    if u9 ~= nil then
        u9:disconnect()
    end
    if u8 ~= nil then
        u8:Stop()
        u8:Destroy()
        u8 = nil
    end
    if u12 ~= nil then
        u12:disconnect()
    end
    if u11 ~= nil then
        u11:Stop()
        u11:Destroy()
        u11 = nil
    end
    return v87
end
function getHeightScale()
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u5
    --]]
    if not u2 then
        return u4()
    end
    if not u2.AutomaticScalingEnabled then
        return u4()
    end
    local v88 = u2.HipHeight / 2
    if u5 == nil then
        u5 = script:FindFirstChild("ScaleDampeningPercent")
    end
    if u5 ~= nil then
        v88 = 1 + (u2.HipHeight - 2) * u5.Value / 2
    end
    return v88
end
local function u94(p89) --[[ Line: 449 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
    --]]
    local v90 = p89 * 1.25 / getHeightScale()
    local v91 = 0.0001
    local v92 = 0.0001
    local v93 = 1
    if v90 <= 0.5 then
        v93 = v90 / 0.5
        v91 = 1
    elseif v90 < 1 then
        v92 = (v90 - 0.5) / 0.5
        v91 = 1 - v92
    else
        v93 = v90 / 1
        v92 = 1
    end
    u8:AdjustWeight(v91)
    u11:AdjustWeight(v92)
    u8:AdjustSpeed(v93)
    u11:AdjustSpeed(v93)
end
function setAnimationSpeed(p95)
    --[[
    Upvalues:
        [1] = u6
        [2] = u94
        [3] = u10
        [4] = u8
    --]]
    if u6 == "walk" then
        u94(p95)
    elseif p95 ~= u10 then
        u10 = p95
        u8:AdjustSpeed(u10)
    end
end
function keyFrameReachedFunc(p96)
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u8
        [4] = u16
        [5] = u85
        [6] = u10
        [7] = u2
    --]]
    if p96 == "End" then
        if u6 == "walk" then
            if u11.Looped ~= true then
                u11.TimePosition = 0
            end
            if u8.Looped ~= true then
                u8.TimePosition = 0
                return
            end
        else
            local v97 = u6
            local v98 = u16[v97] ~= nil and u16[v97] == false and "idle" or v97
            if u85 then
                if u8.Looped then
                    return
                end
                v98 = "idle"
                u85 = false
            end
            local v99 = u10
            playAnimation(v98, 0.15, u2)
            setAnimationSpeed(v99)
        end
    end
end
function rollAnimation(p100)
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v101 = math.random(1, u14[p100].totalWeight)
    local v102 = 1
    while u14[p100][v102].weight < v101 do
        v101 = v101 - u14[p100][v102].weight
        v102 = v102 + 1
    end
    return v102
end
local function u108(p103, p104, p105, p106) --[[ Line: 530 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u11
        [4] = u10
        [5] = u6
        [6] = u9
        [7] = u14
        [8] = u12
    --]]
    if p103 ~= u7 then
        if u8 ~= nil then
            u8:Stop(p105)
            u8:Destroy()
        end
        if u11 ~= nil then
            u11:Stop(p105)
            u11:Destroy()
            u11 = nil
        end
        u10 = 1
        u8 = p106:LoadAnimation(p103)
        u8.Priority = Enum.AnimationPriority.Core
        u8:Play(p105)
        u6 = p104
        u7 = p103
        if u9 ~= nil then
            u9:disconnect()
        end
        u9 = u8.KeyframeReached:connect(keyFrameReachedFunc)
        if p104 == "walk" then
            local v107 = rollAnimation("run")
            u11 = p106:LoadAnimation(u14.run[v107].anim)
            u11.Priority = Enum.AnimationPriority.Core
            u11:Play(p105)
            if u12 ~= nil then
                u12:disconnect()
            end
            u12 = u11.KeyframeReached:connect(keyFrameReachedFunc)
        end
    end
end
function playAnimation(p109, p110, p111)
    --[[
    Upvalues:
        [1] = u14
        [2] = u108
        [3] = u85
    --]]
    local v112 = rollAnimation(p109)
    u108(u14[p109][v112].anim, p109, p110, p111)
    u85 = false
end
function playEmote(p113, p114, p115)
    --[[
    Upvalues:
        [1] = u108
        [2] = u85
    --]]
    u108(p113, p113.Name, p114, p115)
    u85 = true
end
local u116 = ""
local u117 = nil
local u118 = nil
local u119 = nil
function toolKeyFrameReachedFunc(p120)
    --[[
    Upvalues:
        [1] = u116
        [2] = u2
    --]]
    if p120 == "End" then
        playToolAnimation(u116, 0, u2)
    end
end
function playToolAnimation(p121, p122, p123, p124)
    --[[
    Upvalues:
        [1] = u14
        [2] = u118
        [3] = u117
        [4] = u116
        [5] = u119
    --]]
    local v125 = rollAnimation(p121)
    local v126 = u14[p121][v125].anim
    if u118 ~= v126 then
        if u117 ~= nil then
            u117:Stop()
            u117:Destroy()
            p122 = 0
        end
        u117 = p123:LoadAnimation(v126)
        if p124 then
            u117.Priority = p124
        end
        u117:Play(p122)
        u116 = p121
        u118 = v126
        u119 = u117.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end
function stopToolAnimations()
    --[[
    Upvalues:
        [1] = u116
        [2] = u119
        [3] = u118
        [4] = u117
    --]]
    local v127 = u116
    if u119 ~= nil then
        u119:disconnect()
    end
    u116 = ""
    u118 = nil
    if u117 ~= nil then
        u117:Stop()
        u117:Destroy()
        u117 = nil
    end
    return v127
end
function onRunning(p128)
    --[[
    Upvalues:
        [1] = u76
        [2] = u2
        [3] = u77
        [4] = u85
        [5] = u3
        [6] = u16
        [7] = u6
    --]]
    local v129 = getHeightScale()
    if u76 ~= nil and u2.EvaluateStateMachine == false then
        local v130 = u2.RootPart
        local v131 = u76.SensedPart
        if v131 then
            local v132 = v131:GetVelocityAtPosition(u76.HitFrame.Position)
            local v133 = v130.AssemblyLinearVelocity
            local v134 = v133.X - v132.X
            local v135 = v133.Z - v132.Z
            local v136 = Vector3.new(v134, 0, v135).Magnitude
            local v137 = u77.MovingDirection.Magnitude
            if v137 < 0.1 then
                v136 = 0
                v137 = 0
            elseif v137 > 1 then
                v137 = 1
            end
            p128 = v136 * v137
        end
    end
    local v138 = u85
    if v138 then
        v138 = u2.MoveDirection == Vector3.new(0, 0, 0)
    end
    if (v138 and (u2.WalkSpeed / v129 or 0.75) or 0.75) * v129 < p128 then
        playAnimation("walk", 0.2, u2)
        setAnimationSpeed(p128 / 16)
        u3 = "Running"
    elseif u16[u6] == nil and not u85 then
        playAnimation("idle", 0.2, u2)
        u3 = "Standing"
    end
end
function onDied()
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3 = "Dead"
end
function onJumping()
    --[[
    Upvalues:
        [1] = u2
        [2] = u84
        [3] = u3
    --]]
    playAnimation("jump", 0.1, u2)
    u84 = 0.31
    u3 = "Jumping"
end
function onClimbing(p139)
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v140 = p139 / getHeightScale()
    playAnimation("climb", 0.1, u2)
    setAnimationSpeed(v140 / 5)
    u3 = "Climbing"
end
function onGettingUp()
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3 = "GettingUp"
end
function onFreeFall()
    --[[
    Upvalues:
        [1] = u84
        [2] = u2
        [3] = u3
    --]]
    if u84 <= 0 then
        playAnimation("fall", 0.2, u2)
    end
    u3 = "FreeFall"
end
function onFallingDown()
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3 = "FallingDown"
end
function onSeated()
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3 = "Seated"
end
function onPlatformStanding()
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3 = "PlatformStanding"
end
function onSwimming(p141)
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v142 = p141 / getHeightScale()
    if v142 > 1 then
        playAnimation("swim", 0.4, u2)
        setAnimationSpeed(v142 / 10)
        u3 = "Swimming"
    else
        playAnimation("swimidle", 0.4, u2)
        u3 = "Standing"
    end
end
function animateTool()
    --[[
    Upvalues:
        [1] = u82
        [2] = u2
    --]]
    if u82 == "None" then
        playToolAnimation("toolnone", 0.1, u2, Enum.AnimationPriority.Idle)
        return
    elseif u82 == "Slash" then
        playToolAnimation("toolslash", 0, u2, Enum.AnimationPriority.Action)
        return
    elseif u82 == "Lunge" then
        playToolAnimation("toollunge", 0, u2, Enum.AnimationPriority.Action)
    end
end
function getToolAnim(p143)
    for _, v144 in ipairs(p143:GetChildren()) do
        if v144.Name == "toolanim" and v144.className == "StringValue" then
            return v144
        end
    end
    return nil
end
local u145 = 0
function stepAnimate(p146)
    --[[
    Upvalues:
        [1] = u145
        [2] = u84
        [3] = u3
        [4] = u2
        [5] = u1
        [6] = u82
        [7] = u83
        [8] = u118
    --]]
    local v147 = p146 - u145
    u145 = p146
    if u84 > 0 then
        u84 = u84 - v147
    end
    if u3 == "FreeFall" and u84 <= 0 then
        playAnimation("fall", 0.2, u2)
    else
        if u3 == "Seated" then
            playAnimation("sit", 0.5, u2)
            return
        end
        if u3 == "Running" then
            playAnimation("walk", 0.2, u2)
        elseif u3 == "Dead" or (u3 == "GettingUp" or (u3 == "FallingDown" or (u3 == "Seated" or u3 == "PlatformStanding"))) then
            stopAllAnimations()
        end
    end
    local v148 = u1:FindFirstChildOfClass("Tool")
    if v148 and v148:FindFirstChild("Handle") then
        local v149 = getToolAnim(v148)
        if v149 then
            u82 = v149.Value
            v149.Parent = nil
            u83 = p146 + 0.3
        end
        if u83 < p146 then
            u83 = 0
            u82 = "None"
        end
        animateTool()
    else
        stopToolAnimations()
        u82 = "None"
        u118 = nil
        u83 = 0
    end
end
u2.Died:connect(onDied)
u2.Running:connect(onRunning)
u2.Jumping:connect(onJumping)
u2.Climbing:connect(onClimbing)
u2.GettingUp:connect(onGettingUp)
u2.FreeFalling:connect(onFreeFall)
u2.FallingDown:connect(onFallingDown)
u2.Seated:connect(onSeated)
u2.PlatformStanding:connect(onPlatformStanding)
u2.Swimming:connect(onSwimming)
game:GetService("Players").LocalPlayer.Chatted:connect(function(p150) --[[ Line: 850 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u16
        [3] = u2
    --]]
    local v151 = ""
    if string.sub(p150, 1, 3) == "/e " then
        v151 = string.sub(p150, 4)
    elseif string.sub(p150, 1, 7) == "/emote " then
        v151 = string.sub(p150, 8)
    end
    if u3 == "Standing" and u16[v151] ~= nil then
        playAnimation(v151, 0.1, u2)
    end
end)
script:WaitForChild("PlayEmote").OnInvoke = function(p152) --[[ Line: 864 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u16
        [3] = u2
        [4] = u8
    --]]
    if u3 == "Standing" then
        if u16[p152] ~= nil then
            playAnimation(p152, 0.1, u2)
            return true, u8
        end
        if typeof(p152) ~= "Instance" or not p152:IsA("Animation") then
            return false
        end
        playEmote(p152, 0.1, u2)
        return true, u8
    end
end
if u1.Parent ~= nil then
    playAnimation("idle", 0.1, u2)
    local _ = "Standing"
end
while u1.Parent ~= nil do
    local _, v153 = wait(0.1)
    stepAnimate(v153)
end