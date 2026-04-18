local u1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local u3 = game:GetService("SoundService")
local u4 = "UserSoundsUseRelativeVelocity2"
local v5, v6 = pcall(function() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return UserSettings():IsUserFeatureEnabled(u4)
end)
local u7 = v5 and v6
local u8 = "UserNewCharacterSoundsApi3"
local v9, v10 = pcall(function() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return UserSettings():IsUserFeatureEnabled(u8)
end)
local u11 = v9 and v10
local u12 = "UserFixCharSoundsEmitters"
local v13, v14 = pcall(function() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return UserSettings():IsUserFeatureEnabled(u12)
end)
local u15 = v13 and v14
local u16 = {
    ["Climbing"] = {
        ["SoundId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looped"] = true
    },
    ["Died"] = {
        ["SoundId"] = "rbxasset://sounds/uuhhh.mp3"
    },
    ["FreeFalling"] = {
        ["SoundId"] = "rbxasset://sounds/action_falling.ogg",
        ["Looped"] = true
    },
    ["GettingUp"] = {
        ["SoundId"] = "rbxasset://sounds/action_get_up.mp3"
    },
    ["Jumping"] = {
        ["SoundId"] = "rbxasset://sounds/action_jump.mp3"
    },
    ["Landing"] = {
        ["SoundId"] = "rbxasset://sounds/action_jump_land.mp3"
    },
    ["Running"] = {
        ["SoundId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looped"] = true,
        ["Pitch"] = 1.85
    },
    ["Splash"] = {
        ["SoundId"] = "rbxasset://sounds/impact_water.mp3"
    },
    ["Swimming"] = {
        ["SoundId"] = "rbxasset://sounds/action_swim.mp3",
        ["Looped"] = true,
        ["Pitch"] = 1.6
    }
}
local u17 = {
    ["Climbing"] = {
        ["AssetId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looping"] = true
    },
    ["Died"] = {
        ["AssetId"] = "rbxasset://sounds/uuhhh.mp3"
    },
    ["FreeFalling"] = {
        ["AssetId"] = "rbxasset://sounds/action_falling.ogg",
        ["Looping"] = true
    },
    ["GettingUp"] = {
        ["AssetId"] = "rbxasset://sounds/action_get_up.mp3"
    },
    ["Jumping"] = {
        ["AssetId"] = "rbxasset://sounds/action_jump.mp3"
    },
    ["Landing"] = {
        ["AssetId"] = "rbxasset://sounds/action_jump_land.mp3"
    },
    ["Running"] = {
        ["AssetId"] = "rbxasset://sounds/action_footsteps_plastic.mp3",
        ["Looping"] = true,
        ["PlaybackSpeed"] = 1.85
    },
    ["Splash"] = {
        ["AssetId"] = "rbxasset://sounds/impact_water.mp3"
    },
    ["Swimming"] = {
        ["AssetId"] = "rbxasset://sounds/action_swim.mp3",
        ["Looping"] = true,
        ["PlaybackSpeed"] = 1.6
    }
}
local function u21(p18, p19) --[[ Line: 100 ]]
    if p18 then
        local v20 = p18.ActiveController and (not (p18.ActiveController:IsA("GroundController") and p18.GroundSensor) and p18.ActiveController:IsA("ClimbController"))
        if v20 then
            v20 = p18.ClimbSensor
        end
        if v20 and v20.SensedPart then
            return p19 - v20.SensedPart:GetVelocityAtPosition(p18.RootPart.Position)
        else
            return p19
        end
    else
        return p19
    end
end
local u98 = require(script:WaitForChild("AtomicBinding")).new({
    ["humanoid"] = "Humanoid",
    ["rootPart"] = "HumanoidRootPart"
}, function(p22) --[[ Name: initializeSoundSystem, Line 164 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u3
        [4] = u15
        [5] = u1
        [6] = u17
        [7] = u16
        [8] = u21
        [9] = u2
    --]]
    local u23 = p22.humanoid
    local u24 = p22.rootPart
    local u25
    if u7 then
        u25 = u23.Parent:FindFirstChild("ControllerManager")
    else
        u25 = nil
    end
    local u26 = {}
    if u11 and u3.CharacterSoundsUseNewApi == Enum.RolloutState.Enabled then
        local v27 = nil
        local v28 = nil
        if u15 then
            v28 = u23.RootPart
        else
            v27 = u1.LocalPlayer.Character
        end
        local v29 = 5
        local v30 = {}
        while v29 < 150 do
            v30[v29] = 5 / v29
            v29 = v29 * 1.25
        end
        v30[150] = 0
        local v31
        if u15 then
            v31 = Instance.new("AudioEmitter", v28)
        else
            v31 = Instance.new("AudioEmitter", v27)
        end
        v31.Name = "RbxCharacterSoundsEmitter"
        v31:SetDistanceAttenuation(v30)
        for v32, v33 in pairs(u17) do
            local v34 = Instance.new("AudioPlayer")
            local v35 = Instance.new("Wire")
            v34.Name = v32
            v35.Name = v32 .. "Wire"
            v34.Archivable = false
            v34.Volume = 0.65
            for v36, v37 in pairs(v33) do
                v34[v36] = v37
            end
            v34.Parent = u24
            v35.Parent = v34
            v35.SourceInstance = v34
            v35.TargetInstance = v31
            u26[v32] = v34
        end
    else
        for v38, v39 in pairs(u16) do
            local v40 = Instance.new("Sound")
            v40.Name = v38
            v40.Archivable = false
            v40.RollOffMinDistance = 5
            v40.RollOffMaxDistance = 150
            v40.Volume = 0.65
            for v41, v42 in pairs(v39) do
                v40[v41] = v42
            end
            v40.Parent = u24
            u26[v38] = v40
        end
    end
    local u43 = {}
    local function u52(p44) --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u11
        --]]
        local v45 = pairs
        local v46 = u43
        local v47 = {}
        local v48 = p44 or nil
        for v49, v50 in pairs(v46) do
            v47[v49] = v50
        end
        for v51 in v45(v47) do
            if v51 ~= v48 then
                if u11 and v51:IsA("AudioPlayer") then
                    v51:Stop()
                else
                    v51.Playing = false
                end
                u43[v51] = nil
            end
        end
    end
    local u73 = {
        [Enum.HumanoidStateType.FallingDown] = function() --[[ Line: 252 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52()
        end,
        [Enum.HumanoidStateType.GettingUp] = function() --[[ Line: 256 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u26
                [3] = u11
            --]]
            u52()
            local v53 = u26.GettingUp
            v53.TimePosition = 0
            if u11 and v53:IsA("AudioPlayer") then
                v53:Play()
            else
                v53.Playing = true
            end
        end,
        [Enum.HumanoidStateType.Jumping] = function() --[[ Line: 261 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u26
                [3] = u11
            --]]
            u52()
            local v54 = u26.Jumping
            v54.TimePosition = 0
            if u11 and v54:IsA("AudioPlayer") then
                v54:Play()
            else
                v54.Playing = true
            end
        end,
        [Enum.HumanoidStateType.Swimming] = function() --[[ Line: 266 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u26
                [3] = u11
                [4] = u52
                [5] = u43
            --]]
            local v55 = u24.AssemblyLinearVelocity.Y
            local v56 = math.abs(v55)
            if v56 > 0.1 then
                local v57 = u26.Splash
                local v58 = (v56 - 100) * 0.72 / 250 + 0.28
                v57.Volume = math.clamp(v58, 0, 1)
                local v59 = u26.Splash
                v59.TimePosition = 0
                if u11 and v59:IsA("AudioPlayer") then
                    v59:Play()
                else
                    v59.Playing = true
                end
            end
            u52(u26.Swimming)
            local v60 = u26.Swimming
            if u11 and v60:IsA("AudioPlayer") then
                v60:Play()
            else
                v60.Playing = true
            end
            u43[u26.Swimming] = true
        end,
        [Enum.HumanoidStateType.Freefall] = function() --[[ Line: 277 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u52
                [3] = u11
                [4] = u43
            --]]
            u26.FreeFalling.Volume = 0
            u52(u26.FreeFalling)
            local v61 = u26.FreeFalling
            if u11 and v61:IsA("AudioPlayer") then
                v61.Looping = true
            else
                v61.Looped = true
            end
            if u26.FreeFalling:IsA("Sound") then
                u26.FreeFalling.PlaybackRegionsEnabled = true
            end
            u26.FreeFalling.LoopRegion = NumberRange.new(2, 9)
            local v62 = u26.FreeFalling
            v62.TimePosition = 0
            if u11 and v62:IsA("AudioPlayer") then
                v62:Play()
            else
                v62.Playing = true
            end
            u43[u26.FreeFalling] = true
        end,
        [Enum.HumanoidStateType.Landed] = function() --[[ Line: 291 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u24
                [3] = u26
                [4] = u11
            --]]
            u52()
            local v63 = u24.AssemblyLinearVelocity.Y
            local v64 = math.abs(v63)
            if v64 > 75 then
                local v65 = u26.Landing
                local v66 = (v64 - 50) * 1 / 50 + 0
                v65.Volume = math.clamp(v66, 0, 1)
                local v67 = u26.Landing
                v67.TimePosition = 0
                if u11 and v67:IsA("AudioPlayer") then
                    v67:Play()
                    return
                end
                v67.Playing = true
            end
        end,
        [Enum.HumanoidStateType.Running] = function() --[[ Line: 300 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u26
                [3] = u11
                [4] = u43
            --]]
            u52(u26.Running)
            local v68 = u26.Running
            if u11 and v68:IsA("AudioPlayer") then
                v68:Play()
            else
                v68.Playing = true
            end
            u43[u26.Running] = true
        end,
        [Enum.HumanoidStateType.Climbing] = function() --[[ Line: 306 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u24
                [3] = u7
                [4] = u21
                [5] = u25
                [6] = u11
                [7] = u52
                [8] = u43
            --]]
            local v69 = u26.Climbing
            local v70 = u24.AssemblyLinearVelocity
            if u7 then
                v70 = u21(u25, v70)
            end
            local v71 = v70.Y
            if math.abs(v71) > 0.1 then
                if u11 and v69:IsA("AudioPlayer") then
                    v69:Play()
                else
                    v69.Playing = true
                end
                u52(v69)
            else
                u52()
            end
            u43[v69] = true
        end,
        [Enum.HumanoidStateType.Seated] = function() --[[ Line: 319 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52()
        end,
        [Enum.HumanoidStateType.Dead] = function() --[[ Line: 323 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u26
                [3] = u11
            --]]
            u52()
            local v72 = u26.Died
            v72.TimePosition = 0
            if u11 and v72:IsA("AudioPlayer") then
                v72:Play()
            else
                v72.Playing = true
            end
        end
    }
    local u84 = {
        [u26.Climbing] = function(_, p74, p75) --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u21
                [3] = u25
                [4] = u11
            --]]
            if u7 then
                p75 = u21(u25, p75)
            end
            local v76 = p75.Magnitude > 0.1
            if u11 and p74:IsA("AudioPlayer") then
                if p74.IsPlaying and not v76 then
                    p74:Stop()
                    return
                end
                if not p74.IsPlaying and v76 then
                    p74:Play()
                    return
                end
            else
                p74.Playing = v76
            end
        end,
        [u26.FreeFalling] = function(p77, p78, p79) --[[ Line: 336 ]]
            if p79.Magnitude > 75 then
                local v80 = p78.Volume + p77 * 0.9
                p78.Volume = math.clamp(v80, 0, 1)
            else
                p78.Volume = 0
            end
        end,
        [u26.Running] = function(_, p81, p82) --[[ Line: 344 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u11
            --]]
            local v83
            if p82.Magnitude > 0.5 then
                v83 = u23.MoveDirection.Magnitude > 0.5
            else
                v83 = false
            end
            if u11 and p81:IsA("AudioPlayer") then
                if p81.IsPlaying and not v83 then
                    p81:Stop()
                    return
                end
                if not p81.IsPlaying and v83 then
                    p81:Play()
                    return
                end
            else
                p81.Playing = v83
            end
        end
    }
    local u85 = {
        [Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
    }
    local u86 = u85[u23:GetState()] or u23:GetState()
    local v87 = u86
    local v88 = u73[v87]
    if v88 then
        v88()
    end
    u86 = v87
    local u92 = u23.StateChanged:Connect(function(_, p89) --[[ Line: 368 ]]
        --[[
        Upvalues:
            [1] = u85
            [2] = u86
            [3] = u73
        --]]
        local v90 = u85[p89] or p89
        if v90 ~= u86 then
            local v91 = u73[v90]
            if v91 then
                v91()
            end
            u86 = v90
        end
    end)
    local u96 = u2.Stepped:Connect(function(_, p93) --[[ Line: 376 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u84
            [3] = u24
        --]]
        for v94 in pairs(u43) do
            local v95 = u84[v94]
            if v95 then
                v95(p93, v94, u24.AssemblyLinearVelocity)
            end
        end
    end)
    return function() --[[ Name: terminate, Line 387 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u96
            [3] = u26
        --]]
        u92:Disconnect()
        u96:Disconnect()
        for _, v97 in pairs(u26) do
            v97:Destroy()
        end
        table.clear(u26)
    end
end)
local u99 = {}
local function u101(p100) --[[ Line: 410 ]]
    --[[
    Upvalues:
        [1] = u98
    --]]
    u98:bindRoot(p100)
end
local function u103(p102) --[[ Line: 414 ]]
    --[[
    Upvalues:
        [1] = u98
    --]]
    u98:unbindRoot(p102)
end
local function v110(p104) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u99
        [2] = u98
        [3] = u101
        [4] = u103
    --]]
    local v105 = u99[p104]
    if not v105 then
        v105 = {}
        u99[p104] = v105
    end
    if p104.Character then
        u98:bindRoot(p104.Character)
    end
    local v106 = p104.CharacterAdded
    local v107 = u101
    table.insert(v105, v106:Connect(v107))
    local v108 = p104.CharacterRemoving
    local v109 = u103
    table.insert(v105, v108:Connect(v109))
end
local function v114(p111) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u99
        [2] = u98
    --]]
    local v112 = u99[p111]
    if v112 then
        for _, v113 in ipairs(v112) do
            v113:Disconnect()
        end
        u99[p111] = nil
    end
    if p111.Character then
        u98:unbindRoot(p111.Character)
    end
end
for _, v115 in ipairs(u1:GetPlayers()) do
    task.spawn(v110, v115)
end
u1.PlayerAdded:Connect(v110)
u1.PlayerRemoving:Connect(v114)