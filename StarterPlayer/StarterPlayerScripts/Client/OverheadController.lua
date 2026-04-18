local u1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local u3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = v4.Shared.Net
local u6 = require(v4.Shared.Defs.UIConfig)
local u7 = {}
local u8 = {}
local u9 = {}
local u10 = setmetatable({}, {
    ["__mode"] = "k"
})
local u11 = Color3.fromRGB(255, 85, 85)
local u12 = Color3.fromRGB(255, 80, 80)
local u13 = Color3.fromRGB(225, 70, 70)
local u14 = Color3.fromRGB(70, 205, 95)
local function u21(p15) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u1
    --]]
    local v16 = tonumber(p15)
    if v16 then
        local v17 = math.floor(v16)
        if v17 <= 0 then
            return nil
        else
            local v18 = u9[v17]
            if v18 and v18.Parent == u1 then
                return v18
            else
                u9[v17] = nil
                local v19 = u1:GetPlayerByUserId(v17)
                if v19 and v19.Parent == u1 then
                    u9[v17] = v19
                    return v19
                else
                    for _, v20 in ipairs(u1:GetPlayers()) do
                        if v20.UserId == v17 then
                            u9[v17] = v20
                            return v20
                        end
                    end
                    return nil
                end
            end
        end
    else
        return nil
    end
end
local function u31(p22) --[[ Line: 66 ]]
    local v23 = tonumber(p22) or 0
    local v24 = math.floor(v23)
    local v25 = math.max(0, v24)
    local v26 = v25 / 3600
    local v27 = math.floor(v26)
    local v28 = v25 % 3600 / 60
    local v29 = math.floor(v28)
    local v30 = v25 % 60
    if v27 > 0 then
        return string.format("\234\176\144\236\152\165 %d:%02d:%02d", v27, v29, v30)
    else
        return string.format("\234\176\144\236\152\165 %02d:%02d", v29, v30)
    end
end
local function u39(p32) --[[ Line: 75 ]]
    if not p32 then
        return 0
    end
    local v33 = tonumber(p32:GetAttribute("JailedRemainingSeconds")) or 0
    local v34 = math.floor(v33)
    local v35 = math.max(0, v34)
    if v35 > 0 then
        return v35
    end
    local v36 = tonumber(p32:GetAttribute("JailedUntil")) or 0
    local v37 = math.floor(v36)
    local v38 = math.max(0, v37) - os.time()
    return math.max(0, v38)
end
local function u76(p40) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
    --]]
    if p40 then
        p40 = p40.Character
    end
    if not p40 then
        return nil
    end
    local v41 = p40:FindFirstChild("Head")
    if not v41 then
        return nil
    end
    local v42 = v41:FindFirstChild("OverheadBillboard")
    if v42 then
        return v42
    end
    local v43 = Instance.new("BillboardGui")
    v43.Name = "OverheadBillboard"
    v43.Size = UDim2.new(0, 240, 0, 166)
    v43.StudsOffset = Vector3.new(0, 3.45, 0)
    v43.AlwaysOnTop = false
    v43.MaxDistance = 60
    v43.Parent = v41
    local v44 = UDim2.new(1, 0, 0, 18)
    local v45 = UDim2.new(0, 0, 0, 0)
    local v46 = Enum.Font.GothamBold
    local v47 = Color3.fromRGB(255, 215, 90)
    local v48 = Instance.new("TextLabel")
    v48.Name = "VipLabel"
    v48.Size = v44
    v48.Position = v45
    v48.BackgroundTransparency = 1
    v48.TextColor3 = v47
    v48.TextScaled = false
    v48.TextSize = 22
    v48.Font = v46
    v48.Text = "[VIP]"
    v48.Parent = v43
    v48.Visible = false
    local v49 = UDim2.new(1, 0, 0, 20)
    local v50 = UDim2.new(0, 0, 0, 18)
    local v51 = Enum.Font.GothamBold
    local v52 = u6.OVERHEAD_DEFAULT
    local v53 = Instance.new("TextLabel")
    v53.Name = "JobLabel"
    v53.Size = v49
    v53.Position = v50
    v53.BackgroundTransparency = 1
    v53.TextColor3 = v52
    v53.TextScaled = false
    v53.TextSize = 26
    v53.Font = v51
    v53.Text = "\236\180\136\235\179\180\236\158\144"
    v53.Parent = v43
    local v54 = Instance.new("Frame")
    v54.Name = "PvpDot"
    v54.Size = UDim2.new(0, 10, 0, 10)
    v54.Position = UDim2.new(0, 6, 0, 49)
    v54.BackgroundColor3 = u14
    v54.BorderSizePixel = 0
    v54.Parent = v43
    local v55 = Instance.new("UICorner")
    v55.CornerRadius = UDim.new(1, 0)
    v55.Parent = v54
    local v56 = UDim2.new(0, 62, 0, 24)
    local v57 = UDim2.new(0, 20, 0, 42)
    local v58 = Enum.Font.GothamBold
    local v59 = u6.OVERHEAD_DEFAULT
    local v60 = Instance.new("TextLabel")
    v60.Name = "LevelLabel"
    v60.Size = v56
    v60.Position = v57
    v60.BackgroundTransparency = 1
    v60.TextColor3 = v59
    v60.TextScaled = false
    v60.TextSize = 22
    v60.Font = v58
    v60.Text = "Lv.1"
    v60.Parent = v43
    local v61 = UDim2.new(1, -88, 0, 24)
    local v62 = UDim2.new(0, 88, 0, 42)
    local v63 = Enum.Font.GothamBold
    local v64 = u6.OVERHEAD_DEFAULT
    local v65 = Instance.new("TextLabel")
    v65.Name = "NameLabel"
    v65.Size = v61
    v65.Position = v62
    v65.BackgroundTransparency = 1
    v65.TextColor3 = v64
    v65.TextScaled = false
    v65.TextSize = 22
    v65.Font = v63
    v65.Text = "\236\157\180\235\166\132\236\151\134\236\157\140"
    v65.Parent = v43
    v65.TextXAlignment = Enum.TextXAlignment.Left
    local v66 = UDim2.new(1, 0, 0, 20)
    local v67 = UDim2.new(0, 0, 0, 68)
    local v68 = Enum.Font.GothamBold
    local v69 = u6.OVERHEAD_DEFAULT
    local v70 = Instance.new("TextLabel")
    v70.Name = "GuildLabel"
    v70.Size = v66
    v70.Position = v67
    v70.BackgroundTransparency = 1
    v70.TextColor3 = v69
    v70.TextScaled = false
    v70.TextSize = 24
    v70.Font = v68
    v70.Text = ""
    v70.Parent = v43
    v70.TextWrapped = false
    local v71 = UDim2.new(1, 0, 0, 24)
    local v72 = UDim2.new(0, 0, 0, 90)
    local v73 = Enum.Font.GothamBold
    local v74 = u6.OVERHEAD_DEFAULT
    local v75 = Instance.new("TextLabel")
    v75.Name = "TitleLabel"
    v75.Size = v71
    v75.Position = v72
    v75.BackgroundTransparency = 1
    v75.TextColor3 = v74
    v75.TextScaled = false
    v75.TextSize = 26
    v75.Font = v73
    v75.Text = ""
    v75.Parent = v43
    v75.TextWrapped = false
    return v43
end
local function u86(p77) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p77 then
        p77 = p77.Character
    end
    if not p77 then
        return nil
    end
    local v78 = p77:FindFirstChild("Head")
    if not v78 then
        return nil
    end
    local v79 = v78:FindFirstChild("JailBillboard")
    if v79 then
        return v79
    end
    local v80 = Instance.new("BillboardGui")
    v80.Name = "JailBillboard"
    v80.Size = UDim2.new(0, 240, 0, 26)
    v80.StudsOffset = Vector3.new(0, 7.8, 0)
    v80.AlwaysOnTop = false
    v80.MaxDistance = 60
    v80.Parent = v78
    local v81 = UDim2.new(1, 0, 1, 0)
    local v82 = UDim2.new(0, 0, 0, 0)
    local v83 = Enum.Font.GothamBold
    local v84 = u12
    local v85 = Instance.new("TextLabel")
    v85.Name = "JailLabel"
    v85.Size = v81
    v85.Position = v82
    v85.BackgroundTransparency = 1
    v85.TextColor3 = v84
    v85.TextScaled = false
    v85.TextSize = 36
    v85.Font = v83
    v85.Text = ""
    v85.Parent = v80
    v85.Visible = false
    return v80
end
local function u95(p87) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v88 = type(p87) == "table" and p87.titleColor or nil
    if type(v88) ~= "table" then
        return u6.OVERHEAD_DEFAULT
    end
    local v89 = Color3.fromRGB
    local v90 = v88.r or v88[1]
    local v91 = tonumber(v90) or 255
    local v92 = v88.g or v88[2]
    local v93 = tonumber(v92) or 255
    local v94 = v88.b or v88[3]
    return v89(v91, v93, tonumber(v94) or 255)
end
local function u106(p96) --[[ Line: 160 ]]
    local v97 = p96:FindFirstChild("TitleEffectSparkle")
    if v97 and v97:IsA("Frame") then
        return v97
    end
    if v97 then
        v97:Destroy()
    end
    local u98 = Instance.new("Frame")
    u98.Name = "TitleEffectSparkle"
    u98.BackgroundTransparency = 1
    u98.BorderSizePixel = 0
    u98.AnchorPoint = Vector2.new(0.5, 0.5)
    u98.Size = UDim2.new(0, 16, 0, 16)
    u98.Position = UDim2.new(0.86, 0, 0.22, 0)
    u98.ZIndex = (p96.ZIndex or 1) + 3
    u98.Visible = false
    u98.Parent = p96
    local function v105(p99, p100, p101, p102) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u98
        --]]
        local v103 = Instance.new("Frame")
        v103.Name = p99
        v103.AnchorPoint = Vector2.new(0.5, 0.5)
        v103.Position = p101
        v103.Size = p100
        v103.Rotation = p102 or 0
        v103.BorderSizePixel = 0
        v103.BackgroundColor3 = Color3.fromRGB(255, 246, 205)
        v103.BackgroundTransparency = 0.15
        v103.ZIndex = u98.ZIndex
        v103.Parent = u98
        local v104 = Instance.new("UICorner")
        v104.CornerRadius = UDim.new(1, 0)
        v104.Parent = v103
        return v103
    end
    v105("V", UDim2.new(0, 2, 0, 16), UDim2.new(0.5, 0, 0.5, 0), 0)
    v105("H", UDim2.new(0, 16, 0, 2), UDim2.new(0.5, 0, 0.5, 0), 0)
    v105("D1", UDim2.new(0, 2, 0, 12), UDim2.new(0.5, 0, 0.5, 0), 45)
    v105("D2", UDim2.new(0, 2, 0, 12), UDim2.new(0.5, 0, 0.5, 0), -45)
    return u98
end
local function u115(p107) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p107 then
        local u108 = u10[p107]
        if u108 then
            u108.sparkleToken = (u108.sparkleToken or 0) + 1
            local u109 = u108.tween
            if u109 then
                pcall(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u109
                    --]]
                    u109:Cancel()
                end)
            end
            local u110 = u108.sparkleTweenIn
            if u110 then
                pcall(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u110
                    --]]
                    u110:Cancel()
                end)
            end
            local u111 = u108.sparkleTweenOut
            if u111 then
                pcall(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u111
                    --]]
                    u111:Cancel()
                end)
            end
            if u108.destroyConn then
                pcall(function() --[[ Line: 210 ]]
                    --[[
                    Upvalues:
                        [1] = u108
                    --]]
                    u108.destroyConn:Disconnect()
                end)
            end
            u10[p107] = nil
        end
        local v112 = p107:FindFirstChild("TitleEffectGradient")
        if v112 then
            v112:Destroy()
        end
        local v113 = p107:FindFirstChild("TitleEffectStroke")
        if v113 then
            v113:Destroy()
        end
        local v114 = p107:FindFirstChild("TitleEffectSparkle")
        if v114 then
            v114:Destroy()
        end
        p107.TextTransparency = 0
    end
end
local function u131(u116, u117, u118) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u106
        [3] = u3
        [4] = u131
    --]]
    if u116 and (u116.Parent and (u117 and (u117.effectId == "radiant_supporter" and u118.sparkle == true))) then
        u117.sparkleToken = (u117.sparkleToken or 0) + 1
        local u119 = u117.sparkleToken
        local v120 = 2.2 + math.random() * 2
        task.delay(v120, function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u116
                [3] = u117
                [4] = u119
                [5] = u106
                [6] = u118
                [7] = u3
                [8] = u131
            --]]
            if u10[u116] == u117 then
                if u117.sparkleToken == u119 then
                    if u116.Parent then
                        local u121 = u106(u116)
                        u121.Visible = true
                        u121.Position = UDim2.new(0.83, 0, 0.28, 0)
                        u121.Size = UDim2.new(0, 10, 0, 10)
                        u121.Rotation = -10
                        u121.BackgroundTransparency = 1
                        local v122 = {}
                        for _, v123 in ipairs(u121:GetChildren()) do
                            if v123:IsA("Frame") then
                                v123.BackgroundColor3 = u118.sparkleColor or Color3.fromRGB(255, 246, 205)
                                v123.BackgroundTransparency = 0.2
                                v122[#v122 + 1] = v123
                            end
                        end
                        local u124 = u117.sparkleTweenIn
                        if u124 then
                            pcall(function() --[[ Line: 63 ]]
                                --[[
                                Upvalues:
                                    [1] = u124
                                --]]
                                u124:Cancel()
                            end)
                        end
                        local u125 = u117.sparkleTweenOut
                        if u125 then
                            pcall(function() --[[ Line: 63 ]]
                                --[[
                                Upvalues:
                                    [1] = u125
                                --]]
                                u125:Cancel()
                            end)
                        end
                        if u117.sparkleBarTweens then
                            for _, u126 in ipairs(u117.sparkleBarTweens) do
                                if u126 then
                                    pcall(function() --[[ Line: 63 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u126
                                        --]]
                                        u126:Cancel()
                                    end)
                                end
                            end
                        end
                        u117.sparkleBarTweens = {}
                        local v127 = u3:Create(u121, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            ["Position"] = UDim2.new(0.87, 0, 0.14, 0),
                            ["Size"] = UDim2.new(0, 18, 0, 18),
                            ["Rotation"] = 12
                        })
                        local u128 = u3:Create(u121, TweenInfo.new(0.42, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            ["Position"] = UDim2.new(0.91, 0, 0.08, 0),
                            ["Size"] = UDim2.new(0, 12, 0, 12),
                            ["Rotation"] = 20
                        })
                        for _, v129 in ipairs(v122) do
                            u117.sparkleBarTweens[#u117.sparkleBarTweens + 1] = u3:Create(v129, TweenInfo.new(0.42, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                ["BackgroundTransparency"] = 1
                            })
                        end
                        u117.sparkleTweenIn = v127
                        u117.sparkleTweenOut = u128
                        v127.Completed:Connect(function() --[[ Line: 278 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u116
                                [3] = u117
                                [4] = u119
                                [5] = u128
                            --]]
                            if u10[u116] == u117 and u117.sparkleToken == u119 then
                                u128:Play()
                                for _, v130 in ipairs(u117.sparkleBarTweens or {}) do
                                    v130:Play()
                                end
                            end
                        end)
                        u128.Completed:Connect(function() --[[ Line: 284 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u116
                                [3] = u117
                                [4] = u119
                                [5] = u121
                                [6] = u131
                                [7] = u118
                            --]]
                            if u10[u116] == u117 and u117.sparkleToken == u119 then
                                if u121 and u121.Parent then
                                    u121.Visible = false
                                end
                                u131(u116, u117, u118)
                            end
                        end)
                        v127:Play()
                    end
                else
                    return
                end
            else
                return
            end
        end)
    end
end
local function u141(u132, p133) --[[ Line: 294 ]]
    --[[
    Upvalues:
        [1] = u115
        [2] = u10
        [3] = u3
        [4] = u131
    --]]
    local v134 = tostring(p133 or "")
    if u132 and (v134 ~= "" and v134 ~= "none") then
        local v135 = u10[u132]
        if not v135 or (v135.effectId ~= v134 or not v135.tween) then
            u115(u132)
            local v136
            if v134 == "silver_guardian" then
                v136 = {
                    ["tweenDuration"] = 2,
                    ["rotation"] = -3,
                    ["offsetStart"] = Vector2.new(-1.05, 0),
                    ["offsetEnd"] = Vector2.new(1.2, 0),
                    ["gradient"] = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(196, 208, 226)),
                        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(232, 239, 248)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(232, 239, 248)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 208, 226))
                    }),
                    ["glow"] = false,
                    ["sparkle"] = false
                }
            elseif v134 == "gold_shine" then
                v136 = {
                    ["tweenDuration"] = 1.8,
                    ["rotation"] = 0,
                    ["offsetStart"] = Vector2.new(-1.2, 0),
                    ["offsetEnd"] = Vector2.new(1.2, 0),
                    ["gradient"] = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(205, 145, 18)),
                        ColorSequenceKeypoint.new(0.36, Color3.fromRGB(255, 214, 70)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 248, 210)),
                        ColorSequenceKeypoint.new(0.64, Color3.fromRGB(255, 214, 70)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(205, 145, 18))
                    }),
                    ["glow"] = true,
                    ["strokeColor"] = Color3.fromRGB(255, 240, 170),
                    ["strokeTransparency"] = 0.42,
                    ["strokeThickness"] = 1.2,
                    ["sparkle"] = false
                }
            else
                if v134 ~= "radiant_supporter" then
                    u115(u132)
                    return
                end
                v136 = {
                    ["tweenDuration"] = 2.6,
                    ["rotation"] = -8,
                    ["offsetStart"] = Vector2.new(-0.9, 0),
                    ["offsetEnd"] = Vector2.new(1.2, 0),
                    ["gradient"] = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 210)),
                        ColorSequenceKeypoint.new(0.28, Color3.fromRGB(255, 214, 120)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 245, 255)),
                        ColorSequenceKeypoint.new(0.72, Color3.fromRGB(255, 214, 150)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 155, 215))
                    }),
                    ["glow"] = true,
                    ["strokeColor"] = Color3.fromRGB(255, 230, 245),
                    ["strokeTransparency"] = 0.22,
                    ["strokeThickness"] = 1.45,
                    ["sparkle"] = true,
                    ["sparkleColor"] = Color3.fromRGB(255, 244, 215)
                }
            end
            local v137 = Instance.new("UIGradient")
            v137.Name = "TitleEffectGradient"
            v137.Rotation = v136.rotation or 0
            v137.Color = v136.gradient
            v137.Offset = v136.offsetStart or Vector2.new(-1, 0)
            v137.Parent = u132
            local v138
            if v136.glow == true then
                v138 = Instance.new("UIStroke")
                v138.Name = "TitleEffectStroke"
                v138.Thickness = v136.strokeThickness or 1.1
                v138.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                v138.Color = v136.strokeColor or Color3.fromRGB(255, 255, 255)
                v138.Transparency = v136.strokeTransparency or 0.35
                v138.Parent = u132
            else
                v138 = nil
            end
            local v139 = u3:Create(v137, TweenInfo.new(v136.tweenDuration or 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), {
                ["Offset"] = v136.offsetEnd or Vector2.new(1.2, 0)
            })
            local v140 = {
                ["effectId"] = v134,
                ["tween"] = v139,
                ["sparkleToken"] = 0,
                ["destroyConn"] = u132.Destroying:Connect(function() --[[ Line: 388 ]]
                    --[[
                    Upvalues:
                        [1] = u115
                        [2] = u132
                    --]]
                    u115(u132)
                end)
            }
            u10[u132] = v140
            v139:Play()
            if v138 then
                v140.stroke = v138
            end
            if v136.sparkle == true then
                u131(u132, v140, v136)
            end
        end
    else
        u115(u132)
        return
    end
end
local function u148(p142, p143, p144) --[[ Line: 396 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u31
    --]]
    if p142 then
        local v145 = u39(p142)
        local v146 = p142:GetAttribute("IsJailed") == true and true or v145 > 0
        if p143 then
            p143.StudsOffset = Vector3.new(0, 3.45, 0)
        end
        if p144 then
            local v147 = p144:FindFirstChild("JailLabel")
            if v147 then
                p144.Enabled = v146
                v147.Visible = v146
                v147.Text = v146 and u31(v145) or ""
            end
        else
            return
        end
    else
        return
    end
end
local function u173(_, p149, p150) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u13
        [4] = u14
        [5] = u95
        [6] = u141
    --]]
    local v151 = u6.OVERHEAD_DEFAULT
    local v152
    if type(p150) == "table" then
        local v153 = p150.nameColorType or ""
        local v154 = tostring(v153)
        if v154 == "party" then
            v152 = u6.OVERHEAD_PARTY or u6.OVERHEAD_DEFAULT
        elseif v154 == "criminal" then
            v152 = u11
        else
            v152 = u6.OVERHEAD_DEFAULT
        end
    else
        v152 = u6.OVERHEAD_DEFAULT
    end
    local v155 = p149:FindFirstChild("VipLabel")
    local v156 = p149:FindFirstChild("JobLabel")
    local v157 = p149:FindFirstChild("LevelLabel")
    local v158 = p149:FindFirstChild("NameLabel")
    local v159 = p149:FindFirstChild("GuildLabel")
    local v160 = p149:FindFirstChild("TitleLabel")
    local v161 = p149:FindFirstChild("PvpDot")
    if v155 then
        v155.Visible = p150.vip == true
    end
    if v156 then
        local v162 = p150.jobDisplay
        v156.Text = type(v162) == "string" and (p150.jobDisplay or "Novice") or "Novice"
        v156.TextColor3 = v151
    end
    if v157 then
        local v163 = p150.level
        local v164 = tonumber(v163) or 1
        v157.Text = "Lv." .. math.floor(v164)
        v157.TextColor3 = v151
    end
    if v161 and v161:IsA("Frame") then
        v161.BackgroundColor3 = p150.pvpEnabled == true and u13 or u14
    end
    if v158 then
        local v165 = p150.name
        v158.Text = type(v165) == "string" and (p150.name or "...") or "..."
        v158.TextColor3 = v152
    end
    local v166 = p150.guildName
    local v167 = type(v166) == "string" and (p150.guildName or "") or ""
    local v168 = v167 == "" and "" or ("<" .. v167 .. ">" or "")
    local v169 = p150.titleText
    local v170 = type(v169) == "string" and (p150.titleText or "") or ""
    local v171 = v168 ~= ""
    local v172 = v170 ~= ""
    if v159 then
        v159.Text = v168
        v159.TextColor3 = v151
        v159.Visible = v171
        v159.Position = UDim2.new(0, 0, 0, 68)
    end
    if v160 then
        v160.Text = v170
        v160.TextColor3 = u95(p150)
        v160.Visible = v172
        v160.Position = v171 and UDim2.new(0, 0, 0, 90) or UDim2.new(0, 0, 0, 68)
        u141(v160, v172 and p150.titleEffectId or "")
    end
end
local function u182(u174, p175) --[[ Line: 477 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u76
        [4] = u86
        [5] = u173
        [6] = u148
        [7] = u182
    --]]
    local v176 = u7[u174]
    if not v176 then
        return false
    end
    local u177 = tonumber(p175) or 1
    local v178 = u21(u174)
    if v178 then
        local v179
        if v178 and v176 then
            local v180 = u76(v178)
            if v180 then
                local v181 = u86(v178)
                u173(v178, v180, v176)
                u148(v178, v180, v181)
                v179 = true
            else
                v179 = false
            end
        else
            v179 = false
        end
        if v179 then
            return true
        end
    end
    if u177 >= 12 then
        return false
    end
    task.delay(0.25, function() --[[ Line: 484 ]]
        --[[
        Upvalues:
            [1] = u182
            [2] = u174
            [3] = u177
        --]]
        u182(u174, u177 + 1)
    end)
    return false
end
local function v184(u183) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u182
    --]]
    if u183 then
        u9[u183.UserId] = u183
        if not u8[u183] then
            u8[u183] = true
            u183.CharacterAdded:Connect(function() --[[ Line: 495 ]]
                --[[
                Upvalues:
                    [1] = u182
                    [2] = u183
                --]]
                task.defer(function() --[[ Line: 496 ]]
                    --[[
                    Upvalues:
                        [1] = u182
                        [2] = u183
                    --]]
                    u182(u183.UserId, 1)
                end)
            end)
            if u183.Character then
                task.defer(function() --[[ Line: 501 ]]
                    --[[
                    Upvalues:
                        [1] = u182
                        [2] = u183
                    --]]
                    u182(u183.UserId, 1)
                end)
            end
        end
    else
        return
    end
end
v5.OverheadSync.OnClientEvent:Connect(function(p185, p186) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u182
    --]]
    if type(p185) == "number" and type(p186) == "table" then
        u7[p185] = p186
        u182(p185, 1)
    end
end)
u1.PlayerAdded:Connect(v184)
u1.PlayerRemoving:Connect(function(p187) --[[ Line: 514 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u7
    --]]
    u8[p187] = nil
    u9[p187.UserId] = nil
    u7[p187.UserId] = nil
end)
local u188 = 0
for _, v189 in ipairs(u1:GetPlayers()) do
    v184(v189)
end
v2.Heartbeat:Connect(function(p190) --[[ Line: 524 ]]
    --[[
    Upvalues:
        [1] = u188
        [2] = u7
        [3] = u21
        [4] = u76
        [5] = u86
        [6] = u173
        [7] = u148
    --]]
    u188 = u188 + p190
    if u188 >= 0.25 then
        u188 = 0
        for v191, v192 in pairs(u7) do
            local v193 = u21(v191)
            if v193 then
                if v193 then
                    if v192 then
                        local v194 = u76(v193)
                        if v194 then
                            local v195 = u86(v193)
                            u173(v193, v194, v192)
                            u148(v193, v194, v195)
                        end
                    end
                end
            else
                u7[v191] = nil
            end
        end
    end
end)
print("[OverheadController] \236\180\136\234\184\176\237\153\148 \236\153\132\235\163\140")