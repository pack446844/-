local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = game:GetService("ContextActionService")
local v5 = game:GetService("RunService")
local u6 = game:GetService("TextService")
local u7 = v2.Shared.Net
local u8 = require(v2.Shared.Defs.UIConfig)
local u9 = require(v2.Shared.Util.ExpUtil)
local u10 = require(v2.Shared.Defs.CombatConfig)
local u11 = v1.LocalPlayer
local u12 = u11:WaitForChild("PlayerGui")
local u13 = require(v2.Shared.Util.PlatformGui)
local u14 = require(v2.Shared.Util.MobileTargeting)
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = nil
local u22 = UDim2.new(1, 0, 1, 0)
local u23 = UDim2.new(0, 0, 0, 0)
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = nil
local u28 = nil
local u29 = nil
local v30 = u7:WaitForChild("SkillCastAck")
local v31 = u7:WaitForChild("StatusEffectSync")
local v32 = u7:WaitForChild("HudSync")
local u33 = u7:WaitForChild("PlayerDataResyncRequest")
local u34 = u7:WaitForChild("ReturnRequest")
local u35 = nil
local u36 = {}
local u37 = {}
local u38 = {}
local u39 = {
    ["current"] = 0,
    ["max"] = 0,
    ["entries"] = {}
}
local u40 = {}
local u41 = nil
local u42 = nil
local u43 = nil
local u44 = nil
local u45 = nil
local u46 = nil
local u47 = 0
local u48 = nil
local u49 = 0
local u50 = nil
local u51 = nil
local u52 = 0
local u53 = nil
local u54 = nil
local u55 = nil
local u56 = nil
local u57 = nil
local function u63(p58) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u50
        [3] = u51
        [4] = u14
    --]]
    if u13.getResolvedMode() ~= "mobile" then
        if u50 and u50.Parent then
            u50:Destroy()
        end
        u50 = nil
        u51 = nil
        return nil
    end
    if not p58 then
        if u50 and u50.Parent then
            u50:Destroy()
        end
        u50 = nil
        u51 = nil
        return nil
    end
    local v59 = u14.getAttachPart(p58)
    if not v59 then
        if u50 and u50.Parent then
            u50:Destroy()
        end
        u50 = nil
        u51 = nil
        return nil
    end
    if u50 and (u50.Parent == v59 and u51 == p58) then
        return u50
    end
    if u50 and u50.Parent then
        u50:Destroy()
    end
    u50 = nil
    u51 = nil
    local v60 = Instance.new("BillboardGui")
    v60.Name = "MobileTargetArrow"
    v60.Size = UDim2.new(0, 56, 0, 44)
    local v61 = (tonumber(p58:GetAttribute("MonsterHpBarOffsetY")) or 3.4) + 1.35
    v60.StudsOffset = Vector3.new(0, v61, 0)
    v60.AlwaysOnTop = true
    v60.MaxDistance = 80
    v60.LightInfluence = 0
    v60.Parent = v59
    local v62 = Instance.new("TextLabel")
    v62.Name = "Arrow"
    v62.BackgroundTransparency = 1
    v62.Size = UDim2.new(1, 0, 1, 0)
    v62.Text = "\226\150\188"
    v62.TextColor3 = Color3.fromRGB(255, 0, 4)
    v62.TextStrokeTransparency = 0.15
    v62.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v62.TextScaled = true
    v62.Font = Enum.Font.GothamBlack
    v62.Parent = v60
    u50 = v60
    u51 = p58
    return u50
end
local function u65() --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u50
        [4] = u51
        [5] = u11
        [6] = u52
        [7] = u63
    --]]
    if u13.getResolvedMode() ~= "mobile" then
        u14.clearTarget()
        if u50 and u50.Parent then
            u50:Destroy()
        end
        u50 = nil
        u51 = nil
        return nil
    end
    local v64 = u14.maintain(u11) or u14.ensureTarget(u11)
    if v64 then
        u52 = os.clock()
        u63(v64)
        return v64
    end
    if u50 and os.clock() - u52 < 0.2 then
        return u51
    end
    if u50 and u50.Parent then
        u50:Destroy()
    end
    u50 = nil
    u51 = nil
    return nil
end
local function u68() --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v66 = workspace.CurrentCamera
    local v67 = v66 and v66.ViewportSize or Vector2.new(0, 0)
    if v67.X <= 0 or v67.Y <= 0 then
        if u15 and (u15.AbsoluteSize.X > 0 and u15.AbsoluteSize.Y > 0) then
            return u15.AbsoluteSize
        else
            return Vector2.new(1920, 1080)
        end
    else
        return v67
    end
end
local function u77() --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v69 = u11
    local v70 = tonumber(v69:GetAttribute("JailedRemainingSeconds")) or 0
    local v71 = math.floor(v70)
    local v72 = math.max(0, v71)
    if v72 > 0 then
        return v72
    end
    local v73 = u11
    local v74 = tonumber(v73:GetAttribute("JailedUntil")) or 0
    local v75 = math.floor(v74)
    local v76 = math.max(0, v75) - os.time()
    return math.max(0, v76)
end
local function u83() --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u20
        [3] = u21
        [4] = u22
        [5] = u23
    --]]
    if not (u19 and (u20 and u21)) then
        return nil
    end
    local v78 = u19:FindFirstChild("HpShieldBar")
    if not (v78 and v78:IsA("Frame")) then
        v78 = Instance.new("Frame")
        v78.Name = "HpShieldBar"
        v78.Parent = u19
    end
    v78.BackgroundTransparency = 1
    v78.BorderSizePixel = 0
    v78.ClipsDescendants = true
    local v79 = (u20.ZIndex or 1) + 1
    v78.ZIndex = math.max(1, v79)
    v78.Size = UDim2.new(u22.X.Scale, u22.X.Offset, u22.Y.Scale, u22.Y.Offset)
    v78.Position = UDim2.new(u23.X.Scale, u23.X.Offset, u23.Y.Scale, u23.Y.Offset)
    local v80 = u21
    local v81 = u21.ZIndex or 1
    local v82 = (v78.ZIndex or 1) + 2
    v80.ZIndex = math.max(v81, v82)
    return v78
end
local function u89(p84, p85) --[[ Line: 201 ]]
    local v86 = "ShieldSegment_" .. tostring(p85)
    local v87 = p84:FindFirstChild(v86)
    if not (v87 and v87:IsA("Frame")) then
        v87 = Instance.new("Frame")
        v87.Name = v86
        v87.BorderSizePixel = 0
        v87.Parent = p84
    end
    local v88 = p84.ZIndex or 1
    v87.ZIndex = math.max(1, v88)
    return v87
end
local function u98(p90) --[[ Line: 214 ]]
    local v91 = typeof(p90) == "Color3" and p90 and p90 or Color3.fromRGB(90, 170, 255)
    local v92 = string.format
    local v93 = v91.R * 255 + 0.5
    local v94 = math.floor(v93)
    local v95 = v91.G * 255 + 0.5
    local v96 = math.floor(v95)
    local v97 = v91.B * 255 + 0.5
    return v92("%d,%d,%d", v94, v96, (math.floor(v97)))
end
local function u125(p99) --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    local v100 = tonumber(p99) or 0
    local v101 = math.max(0, v100)
    local v102 = u39.entries
    local v103 = type(v102) == "table" and (u39.entries or {}) or {}
    local v104 = 0
    local v105 = {}
    for _, v106 in ipairs(v103) do
        local v107 = v106.current
        local v108 = (tonumber(v107) or 0) + 0.5
        local v109 = math.floor(v108)
        local v110 = math.max(0, v109)
        if v110 > 0 then
            v104 = v104 + v110
            local v111 = #v105 + 1
            local v112 = {}
            local v113 = v106.entryId
            if not v113 then
                local v114 = #v105 + 1
                v113 = tostring(v114)
            end
            v112.entryId = v113
            v112.current = v110
            local v115 = v106.hudColor
            v112.hudColor = typeof(v115) == "Color3" and v106.hudColor or Color3.fromRGB(90, 170, 255)
            local v116 = v106.sortOrder
            v112.sortOrder = tonumber(v116) or 0
            local v117 = v106.expireAt
            v112.expireAt = tonumber(v117) or (1 / 0)
            v105[v111] = v112
        end
    end
    table.sort(v105, function(p118, p119) --[[ Line: 237 ]]
        if p118.sortOrder ~= p119.sortOrder then
            return p118.sortOrder < p119.sortOrder
        end
        if p118.expireAt ~= p119.expireAt then
            return p118.expireAt < p119.expireAt
        end
        local v120 = p118.entryId
        local v121 = tostring(v120)
        local v122 = p119.entryId
        return v121 < tostring(v122)
    end)
    if #v105 == 0 and v101 > 0 then
        local v123 = {
            ["entryId"] = "default"
        }
        local v124 = v101 + 0.5
        v123.current = math.floor(v124)
        v123.hudColor = Color3.fromRGB(90, 170, 255)
        v123.sortOrder = 0
        v123.expireAt = (1 / 0)
        v105[1] = v123
        v104 = v105[1].current
    end
    return v105, math.max(0, v104)
end
local function u141(p126, p127, p128) --[[ Line: 249 ]]
    local v129 = tonumber(p126) or 0
    local v130 = math.max(0, v129)
    local v131 = tonumber(p127) or 1
    local v132 = math.max(1, v131)
    local v133 = tonumber(p128) or 0
    local v134 = math.max(0, v133)
    if v130 <= 0 and v134 <= 0 then
        return 0, 0, 0
    end
    if v134 <= 0 then
        local v135 = v130 / v132
        return math.clamp(v135, 0, 1), 0, 0
    end
    local v136 = v132 + v134
    if v136 <= 0 then
        return 0, 0, 0
    end
    local v137 = v130 / v136
    local v138 = math.clamp(v137, 0, 1)
    local v139 = v134 / v136
    local v140 = 1 - v138
    return v138, math.clamp(v139, 0, v140), v134
end
local function u154(p142) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u125
        [2] = u98
    --]]
    local v143 = (tonumber(p142) or 0) + 0.5
    local v144 = math.floor(v143)
    local v145 = math.max(0, v144)
    if v145 <= 0 then
        return ""
    end
    local v146, v147 = u125(v145)
    local v148 = {}
    if #v146 > 0 and v147 > 0 then
        for _, v149 in ipairs(v146) do
            local v150 = v149.current
            local v151 = (tonumber(v150) or 0) + 0.5
            local v152 = math.floor(v151)
            local v153 = math.max(0, v152)
            if v153 > 0 then
                if v145 < v153 then
                    v153 = v145
                end
                v148[#v148 + 1] = string.format("<font color=\"rgb(%s)\">(+%d)</font>", u98(v149.hudColor), v153)
                v145 = v145 - v153
                if v145 <= 0 then
                    break
                end
            end
        end
    end
    if v145 > 0 then
        v148[#v148 + 1] = string.format("<font color=\"rgb(%s)\">(+%d)</font>", u98(Color3.fromRGB(90, 170, 255)), v145)
    end
    return table.concat(v148, "")
end
local function u181(p155) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u141
        [2] = u83
        [3] = u20
        [4] = u22
        [5] = u23
        [6] = u8
        [7] = u125
        [8] = u89
        [9] = u21
        [10] = u154
    --]]
    if p155 then
        local v156 = p155.current
        local v157 = tonumber(v156) or 0
        local v158 = math.max(0, v157)
        local v159 = p155.max
        local v160 = tonumber(v159) or 1
        local v161 = math.max(1, v160)
        local v162 = p155.shieldCurrent
        local v163 = tonumber(v162) or 0
        local v164 = math.max(0, v163)
        local v165, v166 = u141(v158, v161, v164)
        local v167
        if v161 > 0 then
            local v168 = v158 / v161
            v167 = math.clamp(v168, 0, 1) or 0
        else
            v167 = 0
        end
        local v169 = u83()
        if v169 then
            u20.Size = UDim2.new(v165, 0, u22.Y.Scale, u22.Y.Offset)
            u20.Position = UDim2.new(u23.X.Scale, u23.X.Offset, u23.Y.Scale, u23.Y.Offset)
            local v170 = u20
            local v171
            if v167 > 0.5 then
                v171 = u8.HP_COLOR_FULL
            elseif v167 > 0.25 then
                v171 = u8.HP_COLOR_MID
            else
                v171 = u8.HP_COLOR_LOW
            end
            v170.BackgroundColor3 = v171
            v169.Position = UDim2.new(u23.X.Scale + v165, u23.X.Offset, u23.Y.Scale, u23.Y.Offset)
            v169.Size = UDim2.new(v166, 0, u22.Y.Scale, u22.Y.Offset)
            local v172, v173 = u125(v164)
            local v174 = 0
            local v175 = {}
            for _, v176 in ipairs(v172) do
                local v177 = v173 > 0 and (v176.current / v173 or 0) or 0
                if v177 > 0.0001 then
                    local v178 = u89(v169, v176.entryId)
                    v178.BackgroundColor3 = v176.hudColor
                    v178.Position = UDim2.new(v174, 0, 0, 0)
                    v178.Size = UDim2.new(v177, 0, 1, 0)
                    v178.Visible = true
                    v174 = v174 + v177
                    v175[v178.Name] = true
                end
            end
            for _, v179 in ipairs(v169:GetChildren()) do
                if v179:IsA("Frame") and v179.Name:sub(1, 14) == "ShieldSegment_" then
                    local v180
                    if v175[v179.Name] == true then
                        v180 = v166 > 0.0001
                    else
                        v180 = false
                    end
                    v179.Visible = v180
                end
            end
            v169.Visible = v166 > 0.0001
            u21.RichText = true
            if v164 > 0 then
                u21.Text = string.format("HP: %d%s / %d", math.ceil(v158), u154(v164), (math.ceil(v161)))
            else
                u21.Text = "HP: " .. math.ceil(v158) .. " / " .. math.ceil(v161)
            end
        else
            return
        end
    else
        return
    end
end
local function u185() --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u48
        [2] = u15
    --]]
    local v182
    if u48 and u48.Parent then
        v182 = u48
    elseif u15 then
        u48 = u15:FindFirstChild("ReturnSlot", true)
        v182 = u48
    else
        v182 = nil
    end
    if not v182 then
        return nil
    end
    local v183 = v182:FindFirstChild("ReturnCooldownLabel")
    if v183 and v183:IsA("TextLabel") then
        return v183
    end
    local v184 = Instance.new("TextLabel")
    v184.Name = "ReturnCooldownLabel"
    v184.BackgroundTransparency = 1
    v184.Size = UDim2.new(1, 0, 1, 0)
    v184.Position = UDim2.new(0, 0, 0, 0)
    v184.ZIndex = (v182.ZIndex or 1) + 5
    v184.Font = Enum.Font.GothamBold
    v184.TextColor3 = Color3.fromRGB(255, 255, 255)
    v184.TextStrokeTransparency = 0
    v184.TextScaled = true
    v184.Visible = false
    v184.Parent = v182
    return v184
end
local function u195() --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u185
        [2] = u11
    --]]
    local v186 = u185()
    if v186 then
        local v187 = u11
        local v188 = (tonumber(v187:GetAttribute("ReturnCooldownUntil")) or 0) - os.time()
        if v188 <= 0 then
            v186.Visible = false
            v186.Text = ""
        else
            local v189 = (tonumber(v188) or 0) + 0.999
            local v190 = math.floor(v189)
            local v191 = math.max(0, v190)
            local v192 = v191 / 60
            local v193 = math.floor(v192)
            local v194 = v191 % 60
            v186.Text = string.format("%d:%02d", v193, v194)
            v186.Visible = true
        end
    else
        return
    end
end
local function u196() --[[ Line: 391 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u11
        [4] = u77
        [5] = u14
        [6] = u65
    --]]
    if u13.getResolvedMode() == "mobile" then
        if u3:GetFocusedTextBox() then
            return
        elseif u11:GetAttribute("IsJailed") ~= true and u77() <= 0 then
            u14.cycleTarget(u11, u14.getCycleDistance())
            u65()
        end
    else
        return
    end
end
local function u198(p197) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u196
        [2] = u53
    --]]
    if p197 and p197:IsA("GuiButton") then
        if p197:GetAttribute("TargetCycleBound") ~= true then
            p197:SetAttribute("TargetCycleBound", true)
            p197.Activated:Connect(u196)
            u53 = p197
        end
    else
        return
    end
end
local function u201() --[[ Line: 413 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u77
        [4] = u195
        [5] = u49
        [6] = u34
    --]]
    if u3:GetFocusedTextBox() then
        return
    elseif u11:GetAttribute("IsJailed") == true and true or u77() > 0 then
        return
    else
        local v199 = u11
        if (tonumber(v199:GetAttribute("ReturnCooldownUntil")) or 0) > os.time() then
            u195()
            return
        else
            local v200 = os.clock()
            if v200 - u49 >= 0.2 then
                u49 = v200
                u34:FireServer()
            end
        end
    end
end
local function u203() --[[ Line: 424 ]]
    --[[
    Upvalues:
        [1] = u48
        [2] = u15
        [3] = u201
        [4] = u195
    --]]
    local v202
    if u48 and u48.Parent then
        v202 = u48
    elseif u15 then
        u48 = u15:FindFirstChild("ReturnSlot", true)
        v202 = u48
    else
        v202 = nil
    end
    if v202 and v202:IsA("GuiButton") then
        if v202:GetAttribute("ReturnBound") ~= true then
            v202:SetAttribute("ReturnBound", true)
            v202.Activated:Connect(u201)
            u195()
        end
    else
        return
    end
end
local function u205() --[[ Line: 433 ]]
    --[[
    Upvalues:
        [1] = u47
        [2] = u33
    --]]
    local v204 = os.clock()
    if v204 - u47 >= 0.35 then
        u47 = v204
        u33:FireServer()
    end
end
local function u210(p206) --[[ Line: 440 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u12
    --]]
    local u207
    if u15 then
        u207 = u15:FindFirstChild(p206, true) or nil
    else
        u207 = nil
    end
    if not u207 then
        for _, v208 in ipairs({ u13.find(u12, "MainHUD"), u12:FindFirstChild("MainHUD"), u12:FindFirstChild("MainHUD_Mobile") }) do
            if v208 and v208 ~= u15 then
                u207 = v208:FindFirstChild(p206, true)
                if u207 then
                    break
                end
            end
        end
    end
    if not (u207 and u207:IsA("GuiButton")) then
        return false
    end
    if pcall(function() --[[ Line: 451 ]]
        --[[
        Upvalues:
            [1] = u207
        --]]
        u207:Activate()
    end) then
        return true
    end
    if p206 == "BtnInventory" then
        u13.toggle(u12, "InventoryGui")
    elseif p206 == "BtnQuest" then
        u13.toggle(u12, "QuestGui")
    else
        local v209 = p206 == "BtnJob" and u12:FindFirstChild("JobGui")
        if v209 then
            v209.Enabled = not v209.Enabled
        end
    end
    return true
end
local function u214(p211) --[[ Line: 464 ]]
    if not p211 then
        return nil
    end
    local v212 = p211:FindFirstChild("CooldownLabel")
    if v212 and v212:IsA("TextLabel") then
        return v212
    end
    local v213 = Instance.new("TextLabel")
    v213.Name = "CooldownLabel"
    v213.BackgroundTransparency = 1
    v213.Size = UDim2.new(1, 0, 1, 0)
    v213.Position = UDim2.new(0, 0, 0, 0)
    v213.ZIndex = (p211.ZIndex or 1) + 5
    v213.Font = Enum.Font.GothamBold
    v213.TextColor3 = Color3.fromRGB(255, 255, 255)
    v213.TextStrokeTransparency = 0
    v213.TextScaled = true
    v213.Visible = false
    v213.Parent = p211
    return v213
end
local function u216() --[[ Line: 488 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u42
        [3] = u43
    --]]
    local v215 = u44()
    if not v215 then
        return nil, nil
    end
    if u42 and (u42.Parent == v215 and (u43 and u43.Parent == u42)) then
        return u42, u43
    end
    if u42 and (u42.Parent and u42.Parent ~= v215) then
        u42:Destroy()
        u42 = nil
        u43 = nil
    end
    u42 = Instance.new("Frame")
    u42.Name = "SkillTooltip"
    u42.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    u42.BackgroundTransparency = 0
    u42.BorderSizePixel = 0
    u42.ClipsDescendants = true
    u42.Size = UDim2.new(0, 320, 0, 56)
    u42.Visible = false
    u42.ZIndex = 1000
    u42.Parent = v215
    u43 = Instance.new("TextLabel")
    u43.Name = "TooltipText"
    u43.BackgroundTransparency = 1
    u43.Position = UDim2.new(0, 12, 0, 10)
    u43.Size = UDim2.new(1, -24, 0, 32)
    u43.Font = Enum.Font.GothamBold
    u43.TextSize = 20
    u43.TextColor3 = Color3.fromRGB(255, 255, 255)
    u43.TextStrokeTransparency = 1
    u43.TextWrapped = true
    u43.TextXAlignment = Enum.TextXAlignment.Left
    u43.TextYAlignment = Enum.TextYAlignment.Top
    u43.RichText = false
    u43.ZIndex = 1001
    u43.Parent = u42
    return u42, u43
end
u44 = function() --[[ Line: 524 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u12
    --]]
    if u45 and u45.Parent == u12 then
        return u45
    end
    local v217 = u12:FindFirstChild("SkillTooltipOverlayGui")
    if v217 and not v217:IsA("ScreenGui") then
        v217:Destroy()
        v217 = nil
    end
    if not v217 then
        v217 = Instance.new("ScreenGui")
        v217.Name = "SkillTooltipOverlayGui"
        v217.ResetOnSpawn = false
        v217.IgnoreGuiInset = true
        v217.DisplayOrder = 10000
        v217.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v217.Parent = u12
    end
    u45 = v217
    return v217
end
local function u221(p218) --[[ Line: 550 ]]
    local v219 = {}
    if not p218 then
        return v219
    end
    for _, v220 in ipairs(p218:GetChildren()) do
        if v220:IsA("TextLabel") and (v220.Name:sub(1, 10) == "SkillText_" or v220:GetAttribute("SkillLabel") == true) then
            v219[#v219 + 1] = v220
        end
    end
    return v219
end
local function u230(p222, p223, p224) --[[ Line: 566 ]]
    --[[
    Upvalues:
        [1] = u221
    --]]
    if not p222 then
        return nil
    end
    local v225
    if p223 == "" then
        v225 = nil
    else
        v225 = "SkillText_" .. p223 or nil
    end
    local v226
    if p224 == "" then
        v226 = nil
    else
        v226 = "SkillText_" .. p224 or nil
    end
    for _, v227 in ipairs((u221(p222))) do
        local v228 = v227:GetAttribute("SkillId")
        local v229 = v227:GetAttribute("SkillName")
        if v228 == p223 or (v229 == p224 or (v227.Name == v225 or (v227.Name == p223 or (v227.Name == v226 or v227.Name == p224)))) then
            return v227
        end
    end
    return nil
end
local function u236(p231, p232, p233) --[[ Line: 578 ]]
    if not p231 or p233 == "" then
        return nil
    end
    local v234 = p231:FindFirstChild("SkillText_Dynamic")
    if not (v234 and v234:IsA("TextLabel")) then
        v234 = Instance.new("TextLabel")
        v234.Name = "SkillText_Dynamic"
        v234.BackgroundTransparency = 1
        v234.AnchorPoint = Vector2.new(0.5, 0.5)
        v234.Position = UDim2.new(0.5, 0, 0.5, 0)
        v234.Size = UDim2.new(1, -6, 1, -6)
        v234.Font = Enum.Font.GothamBold
        v234.TextSize = 14
        v234.TextWrapped = true
        v234.TextColor3 = Color3.fromRGB(255, 255, 255)
        v234.TextStrokeTransparency = 0.2
        local v235 = (p231.ZIndex or 1) + 2
        v234.ZIndex = math.max(v235, 6)
        v234.Parent = p231
        v234:SetAttribute("SkillLabel", true)
    end
    v234:SetAttribute("SkillId", p232)
    v234:SetAttribute("SkillName", p233)
    v234.Text = p233
    return v234
end
local function u252(p237, p238) --[[ Line: 619 ]]
    --[[
    Upvalues:
        [1] = u65
        [2] = u14
        [3] = u11
        [4] = u37
        [5] = u10
    --]]
    local v239 = u65()
    if p238 == "placed_area" then
        if not v239 then
            return nil, nil, "target_required"
        end
        local v240 = u14.getRoot(v239)
        local v241 = u11.Character
        if v241 then
            v241 = u11.Character:FindFirstChild("HumanoidRootPart")
        end
        if not (v240 and v241) then
            return nil, nil, "target_required"
        end
        local v242 = 0
        local v243 = u37[p237]
        if not v243 then
            v243 = {
                ["unlocked"] = false,
                ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[p237] or 999,
                ["skillId"] = "",
                ["displayName"] = "",
                ["description"] = "",
                ["icon"] = "",
                ["castType"] = "",
                ["rawDetail"] = nil,
                ["hasResolvedSkill"] = false
            }
            u37[p237] = v243
        end
        local v244 = v243.rawDetail
        local v245
        if type(v244) == "table" then
            v245 = v243.rawDetail or nil
        else
            v245 = nil
        end
        local v246
        if v245 then
            local v247 = v245.placement
            if type(v247) == "table" then
                v246 = v245.placement or nil
            else
                v246 = nil
            end
        else
            v246 = nil
        end
        if v246 then
            local v248 = v246.maxDistance
            local v249 = tonumber(v248) or 0
            v242 = math.max(0, v249)
        end
        if v242 > 0 then
            local v250 = v240.Position.X - v241.Position.X
            local v251 = v240.Position.Z - v241.Position.Z
            if Vector3.new(v250, 0, v251).Magnitude > v242 + 1.5 then
                return nil, nil, "target_out_of_range"
            end
        end
        return v240.Position, {
            ["isMobileTargeting"] = true,
            ["targetModel"] = v239
        }, nil
    elseif p238 == "summon" then
        return nil, {
            ["isMobileTargeting"] = true,
            ["targetModel"] = v239
        }, nil
    else
        return nil, nil, nil
    end
end
local function u281(p253) --[[ Line: 643 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u37
        [3] = u10
        [4] = u216
        [5] = u15
        [6] = u6
        [7] = u68
    --]]
    if p253 then
        local v254
        if p253 then
            local v255 = string.match
            local v256 = p253.Name or ""
            v254 = tonumber(v255(v256, "SkillSlot(%d+)"))
        else
            v254 = nil
        end
        local v257
        if v254 then
            local v258 = u37[v254]
            if not v258 then
                v258 = {
                    ["unlocked"] = false,
                    ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[v254] or 999,
                    ["skillId"] = "",
                    ["displayName"] = "",
                    ["description"] = "",
                    ["icon"] = "",
                    ["castType"] = "",
                    ["rawDetail"] = nil,
                    ["hasResolvedSkill"] = false
                }
                u37[v254] = v258
            end
            v257 = v258 or nil
        else
            v257 = nil
        end
        local v259 = p253:GetAttribute("SkillDesc") or ""
        if v257 and (v257.unlocked and (v257.hasResolvedSkill and v259 ~= "")) then
            local v260, v261 = u216()
            if v260 and (v261 and u15) then
                local v262 = u6:GetTextSize(v259, v261.TextSize, v261.Font, Vector2.new(296, 1000)).Y
                local v263 = math.max(32, v262)
                v261.Text = v259
                v261.Size = UDim2.new(1, -24, 0, v263)
                v260.Size = UDim2.new(0, 320, 0, v263 + 20)
                local v264 = u68()
                local v265 = p253.AbsolutePosition
                local v266 = p253.AbsoluteSize
                local v267 = v265.X + v266.X * 0.5
                local v268 = v264.X - 160 - 4
                local v269 = math.max(164, v268)
                local v270 = math.clamp(v267, 164, v269)
                local v271 = v265.Y - 10
                local v272 = v265.Y + v266.Y + 10
                if v271 - v260.Size.Y.Offset < 4 then
                    v260.AnchorPoint = Vector2.new(0.5, 0)
                    local v273 = UDim2.new
                    local v274 = v270 + 0.5
                    local v275 = math.floor(v274)
                    local v276 = v272 + 0.5
                    v260.Position = v273(0, v275, 0, (math.floor(v276)))
                else
                    v260.AnchorPoint = Vector2.new(0.5, 1)
                    local v277 = UDim2.new
                    local v278 = v270 + 0.5
                    local v279 = math.floor(v278)
                    local v280 = v271 + 0.5
                    v260.Position = v277(0, v279, 0, (math.floor(v280)))
                end
                v260.Visible = true
            elseif u42 then
                u42.Visible = false
            end
        else
            if u42 then
                u42.Visible = false
            end
            return
        end
    else
        if u42 then
            u42.Visible = false
        end
        return
    end
end
local function u286(p282) --[[ Line: 683 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u29
        [3] = u214
    --]]
    u36[p282] = nil
    local v283
    if u29 then
        v283 = u29:FindFirstChild("SkillSlot" .. p282)
    else
        v283 = nil
    end
    if v283 then
        local v284 = u214(v283)
        local v285 = v283:FindFirstChild("SkillIcon")
        if v284 then
            v284.Visible = false
            v284.Text = ""
        end
        if v285 and v285:IsA("ImageLabel") then
            v285.Visible = false
            v285.ImageTransparency = 0
        end
    end
end
local function u296(p287) --[[ Line: 693 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u214
        [3] = u36
        [4] = u286
    --]]
    local v288
    if u29 then
        v288 = u29:FindFirstChild("SkillSlot" .. p287)
    else
        v288 = nil
    end
    if v288 then
        local v289 = u214(v288)
        local v290 = v288:FindFirstChild("SkillIcon")
        local v291 = u36[p287]
        if v291 then
            local v292 = workspace:GetServerTimeNow()
            local v293 = v291.finishAt - v292
            if v293 <= 0.05 then
                u286(p287)
            else
                local v294 = v293 * 10
                local v295 = math.ceil(v294) / 10
                v289.Text = string.format("%.1fs", v295)
                v289.Visible = true
                if v290 and v290:IsA("ImageLabel") then
                    v290.Visible = false
                    v290.ImageTransparency = 0
                end
            end
        else
            if v289 then
                v289.Visible = false
                v289.Text = ""
            end
            if v290 and v290:IsA("ImageLabel") then
                v290.Visible = false
                v290.ImageTransparency = 0
            end
            return
        end
    else
        return
    end
end
local function u304(p297, p298, p299, p300) --[[ Line: 713 ]]
    --[[
    Upvalues:
        [1] = u286
        [2] = u36
        [3] = u296
    --]]
    local v301 = tonumber(p297) or 0
    local v302 = tonumber(p299) or 0
    local v303 = tonumber(p300) or workspace:GetServerTimeNow()
    if v301 < 1 or v301 > 4 then
        return
    elseif v302 <= 0 then
        u286(v301)
    else
        u36[v301] = {
            ["skillId"] = tostring(p298 or ""),
            ["finishAt"] = v303 + v302
        }
        u296(v301)
    end
end
local function u312(p305, p306, p307, p308) --[[ Line: 723 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u10
    --]]
    local v309 = u37[p305]
    if not v309 then
        v309 = {
            ["unlocked"] = false,
            ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[p305] or 999,
            ["skillId"] = "",
            ["displayName"] = "",
            ["description"] = "",
            ["icon"] = "",
            ["castType"] = "",
            ["rawDetail"] = nil,
            ["hasResolvedSkill"] = false
        }
        u37[p305] = v309
    end
    local v310 = v309.hasResolvedSkill
    local v311 = v309.skillId or ""
    if p308 ~= nil then
        v309.unlocked = p308 == true
    end
    if not p307 then
        v309.castType = v309.castType or ""
        v309.rawDetail = nil
        return v309, v310, v311
    end
    v309.requiredLevel = p306.requiredLevel or u10.SKILL_UNLOCK_LEVELS[p305] or (v309.requiredLevel or 999)
    v309.skillId = p306.skillId or ""
    v309.displayName = p306.displayName or ""
    v309.description = p306.description or ""
    v309.icon = p306.icon or ""
    v309.castType = p306.castType or ""
    v309.rawDetail = p306
    v309.hasResolvedSkill = true
    return v309, v310, v311
end
local function u327(p313) --[[ Line: 744 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u37
        [3] = u10
        [4] = u214
        [5] = u221
        [6] = u230
        [7] = u236
        [8] = u46
        [9] = u281
    --]]
    local v314
    if u29 then
        v314 = u29:FindFirstChild("SkillSlot" .. p313)
    else
        v314 = nil
    end
    if v314 then
        local v315 = u37[p313]
        if not v315 then
            v315 = {
                ["unlocked"] = false,
                ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[p313] or 999,
                ["skillId"] = "",
                ["displayName"] = "",
                ["description"] = "",
                ["icon"] = "",
                ["castType"] = "",
                ["rawDetail"] = nil,
                ["hasResolvedSkill"] = false
            }
            u37[p313] = v315
        end
        local v316 = v314:FindFirstChild("LockIcon")
        local v317 = v314:FindFirstChild("UnlockLevel")
        local v318 = v314:FindFirstChild("SkillIcon")
        local v319 = v314:FindFirstChildOfClass("UIStroke")
        local v320 = v315.hasResolvedSkill and (v315.skillId or "") or ""
        u214(v314)
        v314:SetAttribute("SkillId", v320)
        v314:SetAttribute("SkillName", v315.displayName or "")
        v314:SetAttribute("SkillDesc", v315.description or "")
        v314:SetAttribute("SkillCastType", v315.castType or "")
        if v315.unlocked then
            v314.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
            if v316 then
                v316.Visible = false
            end
            if v317 then
                v317.Visible = false
                if v317:IsA("TextLabel") then
                    v317.Text = ""
                end
            end
            if v318 then
                v318.Visible = false
                v318.ImageTransparency = 0
            end
            if v315.hasResolvedSkill and v320 ~= "" then
                local v321 = v315.displayName or ""
                for _, v322 in ipairs((u221(v314))) do
                    v322.Visible = false
                    v322.TextTransparency = 0
                end
                local v323 = u230(v314, v320, v321) or u236(v314, v320, v321)
                if v323 then
                    v323.Visible = true
                    v323.TextTransparency = 0
                end
            else
                for _, v324 in ipairs((u221(v314))) do
                    v324.Visible = false
                    v324.TextTransparency = 0
                end
            end
            if v319 then
                v319.Color = Color3.fromRGB(255, 200, 50)
            end
        else
            v314.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            if v316 then
                v316.Visible = true
            end
            if v317 then
                v317.Visible = true
                if v317:IsA("TextLabel") then
                    local v325 = v315.requiredLevel or 999
                    v317.Text = "Lv." .. tostring(v325)
                end
            end
            for _, v326 in ipairs((u221(v314))) do
                v326.Visible = false
                v326.TextTransparency = 0
            end
            if v318 then
                v318.Visible = false
                v318.ImageTransparency = 0
            end
            if v319 then
                v319.Color = Color3.fromRGB(120, 120, 130)
            end
        end
        if u46 == v314 then
            u281(v314)
        end
    end
end
local function u334(p328, p329, p330, p331) --[[ Line: 779 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u10
        [3] = u286
        [4] = u36
        [5] = u296
    --]]
    local v332 = u37[p328]
    if not v332 then
        v332 = {
            ["unlocked"] = false,
            ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[p328] or 999,
            ["skillId"] = "",
            ["displayName"] = "",
            ["description"] = "",
            ["icon"] = "",
            ["castType"] = "",
            ["rawDetail"] = nil,
            ["hasResolvedSkill"] = false
        }
        u37[p328] = v332
    end
    local v333 = v332.hasResolvedSkill and (v332.skillId or "") or ""
    if v332.unlocked then
        if p331 then
            if v333 == "" then
                u286(p328)
                return
            end
            if u36[p328] and (u36[p328].skillId ~= "" and u36[p328].skillId ~= v333) then
                u286(p328)
                return
            end
            if p329 and (p330 ~= "" and p330 ~= v333) then
                u286(p328)
                return
            end
        end
        u296(p328)
    else
        u286(p328)
    end
end
local function u344(p335) --[[ Line: 791 ]]
    --[[
    Upvalues:
        [1] = u312
        [2] = u327
        [3] = u334
    --]]
    local v336 = p335 and (p335.unlockedSlots or {}) or {}
    local v337 = p335 and p335.slots or {}
    for v338 = 1, 4 do
        local v339 = v337[v338]
        local v340
        if type(v339) == "table" then
            v340 = v337[v338] or nil
        else
            v340 = nil
        end
        local v341 = v340 ~= nil
        local _, v342, v343 = u312(v338, v340 or {}, v341, v336[v338])
        u327(v338)
        u334(v338, v342, v343, v341)
    end
end
local function u346() --[[ Line: 804 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u41
    --]]
    if not u29 then
        return nil
    end
    if u41 and u41.Parent == u29 then
        return u41
    end
    u41 = u29:FindFirstChild("StatusEffectFrame")
    if not u41 then
        u41 = Instance.new("Frame")
        u41.Name = "StatusEffectFrame"
        u41.BackgroundTransparency = 1
        u41.AnchorPoint = Vector2.new(0.5, 1)
        u41.Position = UDim2.new(0.5, 0, 0, -8)
        u41.Size = UDim2.new(0, 260, 0, 100)
        u41.ZIndex = 20
        u41.Parent = u29
        local v345 = Instance.new("UIListLayout")
        v345.SortOrder = Enum.SortOrder.LayoutOrder
        v345.Padding = UDim.new(0, 4)
        v345.HorizontalAlignment = Enum.HorizontalAlignment.Center
        v345.Parent = u41
    end
    return u41
end
local function u366() --[[ Line: 833 ]]
    --[[
    Upvalues:
        [1] = u346
        [2] = u38
        [3] = u40
    --]]
    local v347 = u346()
    if v347 then
        local v348 = {}
        for v349, v350 in ipairs(u38) do
            local v351 = u40[v350.entryId]
            if not (v351 and v351.Parent) then
                v351 = Instance.new("TextLabel")
                local v352 = v350.entryId
                v351.Name = "Effect_" .. tostring(v352)
                v351.BackgroundTransparency = 0.15
                v351.BorderSizePixel = 0
                v351.Size = UDim2.new(0, 240, 0, 60)
                v351.Font = Enum.Font.GothamBold
                v351.TextSize = 25
                v351.TextXAlignment = Enum.TextXAlignment.Left
                v351.TextColor3 = Color3.fromRGB(255, 255, 255)
                v351.TextStrokeTransparency = 0.55
                v351.Parent = v347
                u40[v350.entryId] = v351
            end
            v351.LayoutOrder = v349
            v351.BackgroundColor3 = v350.isBuff and Color3.fromRGB(35, 95, 60) or Color3.fromRGB(110, 45, 45)
            local v353 = "  "
            local v354 = v350.displayName or (v350.effectId or "Effect")
            local v355 = tostring(v354)
            local v356 = v350.stacks
            local v357
            if (tonumber(v356) or 1) > 1 then
                local v358 = v350.stacks
                v357 = " x" .. tostring(v358) or ""
            else
                v357 = ""
            end
            local v359 = "  "
            local v360 = v350.expireAt
            local v361 = (tonumber(v360) or 0) - workspace:GetServerTimeNow()
            local v362 = math.max(0, v361)
            local v363
            if v362 >= 10 then
                v363 = string.format("%.0fs", v362)
            else
                v363 = string.format("%.1fs", v362)
            end
            v351.Text = v353 .. v355 .. v357 .. v359 .. v363
            v351.Visible = true
            v348[v350.entryId] = true
        end
        for v364, v365 in pairs(u40) do
            if not v348[v364] then
                v365:Destroy()
                u40[v364] = nil
            end
        end
        v347.Visible = #u38 > 0
    end
end
local function u383() --[[ Line: 868 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u46
        [3] = u281
        [4] = u42
        [5] = u3
        [6] = u11
        [7] = u77
        [8] = u37
        [9] = u10
        [10] = u13
        [11] = u252
        [12] = u7
    --]]
    for u367 = 1, 4 do
        local u368
        if u29 then
            u368 = u29:FindFirstChild("SkillSlot" .. u367)
        else
            u368 = nil
        end
        if u368 and u368:GetAttribute("HudSkillBound") ~= true then
            u368:SetAttribute("HudSkillBound", true)
            u368.MouseEnter:Connect(function() --[[ Line: 873 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u368
                    [3] = u281
                --]]
                u46 = u368
                u281(u368)
            end)
            u368.MouseLeave:Connect(function() --[[ Line: 877 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u368
                    [3] = u42
                --]]
                if u46 == u368 then
                    u46 = nil
                    if u42 then
                        u42.Visible = false
                    end
                end
            end)
            u368.Activated:Connect(function() --[[ Line: 880 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u11
                    [3] = u77
                    [4] = u367
                    [5] = u37
                    [6] = u10
                    [7] = u13
                    [8] = u252
                    [9] = u7
                --]]
                if u3:GetFocusedTextBox() then
                    return
                elseif u11:GetAttribute("IsJailed") == true and true or u77() > 0 then
                    return
                else
                    local v369 = u367
                    local v370 = u37[v369]
                    if not v370 then
                        v370 = {
                            ["unlocked"] = false,
                            ["requiredLevel"] = u10.SKILL_UNLOCK_LEVELS[v369] or 999,
                            ["skillId"] = "",
                            ["displayName"] = "",
                            ["description"] = "",
                            ["icon"] = "",
                            ["castType"] = "",
                            ["rawDetail"] = nil,
                            ["hasResolvedSkill"] = false
                        }
                        u37[v369] = v370
                    end
                    local v371 = v370.castType or ""
                    local v372 = tostring(v371)
                    if u13.getResolvedMode() == "mobile" then
                        local v373, v374, v375 = u252(u367, v372)
                        if v375 == "target_required" or v375 == "target_out_of_range" then
                            return
                        end
                        if v374 or v373 then
                            u7.SkillRequest:FireServer(u367, v373, v374)
                            return
                        end
                    end
                    local v376 = u11.Character
                    if v376 then
                        v376 = v376:FindFirstChild("HumanoidRootPart")
                    end
                    if v376 then
                        local v377 = v376.CFrame.LookVector
                        local v378 = v377.X
                        local v379 = v377.Z
                        local v380 = Vector3.new(v378, 0, v379)
                        local v381 = v380.Magnitude <= 0.001 and Vector3.new(0, 0, -1) or v380
                        local v382 = v376.Position + v381.Unit * 100
                        u7.SkillRequest:FireServer(u367, v382)
                    end
                end
            end)
        end
    end
end
local u384 = nil
local function u394(p385) --[[ Line: 922 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u15
        [4] = u16
        [5] = u17
        [6] = u18
        [7] = u19
        [8] = u20
        [9] = u21
        [10] = u22
        [11] = u23
        [12] = u24
        [13] = u25
        [14] = u26
        [15] = u27
        [16] = u28
        [17] = u29
        [18] = u35
        [19] = u48
        [20] = u41
        [21] = u45
        [22] = u42
        [23] = u43
        [24] = u46
        [25] = u54
        [26] = u203
        [27] = u198
        [28] = u383
        [29] = u55
        [30] = u384
        [31] = u56
        [32] = u181
        [33] = u57
        [34] = u344
        [35] = u38
        [36] = u366
        [37] = u346
        [38] = u195
        [39] = u205
    --]]
    local v386 = u13.wait(u12, "MainHUD", 2) or u13.find(u12, "MainHUD") or (u12:FindFirstChild("MainHUD") or u12:FindFirstChild("MainHUD_Mobile"))
    if not v386 then
        return false
    end
    local v387 = v386:FindFirstChild("TopLeft")
    local v388 = v386:FindFirstChild("SkillBar")
    if not (v387 and v388) then
        return false
    end
    u15 = v386
    u16 = v387
    u17 = u16:FindFirstChild("LevelLabel")
    u18 = u16:FindFirstChild("NameLabel")
    u19 = u16:FindFirstChild("HpBarBg")
    u20 = u19 and u19:FindFirstChild("HpBar") or nil
    u21 = u19 and u19:FindFirstChild("HpText") or nil
    if u20 then
        u22 = u20.Size
        u23 = u20.Position
    end
    u24 = u16:FindFirstChild("ExpBarBg")
    u25 = u24 and u24:FindFirstChild("ExpBar") or nil
    u26 = u24 and u24:FindFirstChild("ExpText") or nil
    u27 = u16:FindFirstChild("DuelScore")
    u28 = u16:FindFirstChild("GoldLabel")
    u29 = v388
    u35 = u16:FindFirstChild("AtkLabel") or u16:FindFirstChild("AttackLabel")
    u48 = nil
    u41 = nil
    if u45 and u45.Parent ~= u12 then
        u45 = nil
    end
    if u42 and (u42.Parent and u42.Parent ~= u45) then
        u42:Destroy()
        u42 = nil
        u43 = nil
    end
    if u46 and not (u46.Parent and u46:IsDescendantOf(u15)) then
        u46 = nil
    end
    if u54 then
        u54:Disconnect()
        u54 = nil
    end
    if u15 then
        u54 = u15.DescendantAdded:Connect(function(u389) --[[ Line: 909 ]]
            --[[
            Upvalues:
                [1] = u203
                [2] = u198
                [3] = u383
            --]]
            if u389 and (u389.Name == "ReturnSlot" and u389:IsA("GuiButton")) then
                task.defer(u203)
                return
            elseif u389 and (u389.Name == "TargetBt" and u389:IsA("GuiButton")) then
                task.defer(function() --[[ Line: 913 ]]
                    --[[
                    Upvalues:
                        [1] = u198
                        [2] = u389
                    --]]
                    u198(u389)
                end)
            elseif u389 and u389:IsA("GuiButton") then
                local v390 = string.match
                local v391 = u389.Name or ""
                if tonumber(v390(v391, "SkillSlot(%d+)")) then
                    task.defer(u383)
                end
            end
        end)
    end
    u383()
    u203()
    if u15 then
        local v392 = u15:FindFirstChild("TargetBt", true)
        if v392 and v392:IsA("GuiButton") then
            u198(v392)
        end
    end
    if u55 then
        u384(u55)
    end
    if u56 then
        u181(u56)
    end
    if u57 then
        u344(u57)
    end
    if #u38 > 0 then
        u366()
    else
        local v393 = u346()
        if v393 then
            v393.Visible = false
        end
    end
    u195()
    if p385 == true then
        task.defer(u205)
    end
    return true
end
u384 = function(p395) --[[ Line: 967 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u27
        [4] = u28
        [5] = u25
        [6] = u26
        [7] = u35
        [8] = u9
        [9] = u344
    --]]
    if p395 then
        if u17 and (u18 and (u27 and (u28 and (u25 and u26)))) then
            u17.Text = "Lv. " .. (p395.level or 1)
            u18.Text = p395.name == "" and "???" or (p395.name or "???")
            u27.Text = "\234\178\176\237\136\172: " .. (p395.duelScore or 0)
            u28.Text = "Gold: " .. (p395.gold or 0)
            if u35 and u35:IsA("TextLabel") then
                local v396 = u35
                local v397 = p395.attackPower or 0
                v396.Text = "\234\179\181\234\178\169\235\160\165 : " .. tostring(v397)
            end
            local v398 = u9.expForLevel(p395.level or 1)
            local v399
            if v398 > 0 then
                local v400 = (p395.exp or 0) / v398
                v399 = math.clamp(v400, 0, 1) or 0
            else
                v399 = 0
            end
            u25.Size = UDim2.new(v399, 0, 1, 0)
            u26.Text = "EXP: " .. (p395.exp or 0) .. " / " .. v398
            u344({
                ["unlockedSlots"] = p395.unlockedSkillSlots or {}
            })
        end
    else
        return
    end
end
u7.DataSync.OnClientEvent:Connect(function(p401) --[[ Line: 984 ]]
    --[[
    Upvalues:
        [1] = u55
        [2] = u384
    --]]
    u55 = p401
    u384(p401)
end)
v32.OnClientEvent:Connect(function(p402) --[[ Line: 989 ]]
    --[[
    Upvalues:
        [1] = u55
        [2] = u384
    --]]
    u55 = p402
    u384(p402)
end)
u7.HpSync.OnClientEvent:Connect(function(p403) --[[ Line: 994 ]]
    --[[
    Upvalues:
        [1] = u56
        [2] = u181
    --]]
    u56 = p403
    u181(p403)
end)
u7.SkillBarSync.OnClientEvent:Connect(function(p404) --[[ Line: 999 ]]
    --[[
    Upvalues:
        [1] = u57
        [2] = u344
    --]]
    if p404 then
        u57 = p404
        u344(p404)
    end
end)
v31.OnClientEvent:Connect(function(p405) --[[ Line: 1005 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u39
        [3] = u366
        [4] = u56
        [5] = u181
    --]]
    local v406
    if p405 then
        v406 = p405.effects
    else
        v406 = p405
    end
    u38 = type(v406) == "table" and (p405.effects or {}) or {}
    local v407
    if p405 then
        v407 = p405.shields
    else
        v407 = p405
    end
    u39 = type(v407) == "table" and p405.shields or {
        ["current"] = 0,
        ["max"] = 0,
        ["entries"] = {}
    }
    u366()
    if u56 then
        u181(u56)
    end
end)
v30.OnClientEvent:Connect(function(p408) --[[ Line: 1012 ]]
    --[[
    Upvalues:
        [1] = u304
    --]]
    if p408 then
        u304(p408.slotIndex, p408.skillId, p408.cooldown, p408.startedAt)
    end
end)
v5.RenderStepped:Connect(function() --[[ Line: 1017 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u296
        [3] = u38
        [4] = u366
        [5] = u46
        [6] = u281
        [7] = u42
        [8] = u195
        [9] = u13
        [10] = u65
        [11] = u50
        [12] = u51
    --]]
    if u36[1] then
        u296(1)
    end
    if u36[2] then
        u296(2)
    end
    if u36[3] then
        u296(3)
    end
    if u36[4] then
        u296(4)
    end
    if #u38 > 0 then
        u366()
    end
    if u46 and u46.Parent then
        u281(u46)
    elseif u46 and not u46.Parent then
        u46 = nil
        if u42 then
            u42.Visible = false
        end
    end
    u195()
    if u13.getResolvedMode() == "mobile" then
        u65()
    else
        if u50 and u50.Parent then
            u50:Destroy()
        end
        u50 = nil
        u51 = nil
    end
end)
u3.InputBegan:Connect(function(p409, p410) --[[ Line: 1028 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u77
        [4] = u7
    --]]
    if not (p410 or u3:GetFocusedTextBox()) then
        local v411 = {
            [Enum.KeyCode.One] = 1,
            [Enum.KeyCode.Two] = 2,
            [Enum.KeyCode.Three] = 3,
            [Enum.KeyCode.Four] = 4
        }
        if v411[p409.KeyCode] then
            if u11:GetAttribute("IsJailed") == true and true or u77() > 0 then
                return
            end
            local v412 = u11:GetMouse()
            local v413 = v412 and (v412.Hit and v412.Hit.Position) or nil
            u7.SkillRequest:FireServer(v411[p409.KeyCode], v413)
        end
    end
end)
local function v416(p414, p415) --[[ Line: 1040 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u210
        [3] = u201
    --]]
    if p415 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass
    end
    if u3:GetFocusedTextBox() then
        return Enum.ContextActionResult.Pass
    end
    if p414 == "HUD_TOGGLE_INVENTORY" then
        u210("BtnInventory")
    elseif p414 == "HUD_TOGGLE_JOB" then
        u210("BtnJob")
    elseif p414 == "HUD_TOGGLE_QUEST" then
        u210("BtnQuest")
    elseif p414 == "HUD_RETURN_HOME" then
        u201()
    end
    return Enum.ContextActionResult.Sink
end
v4:BindActionAtPriority("HUD_TOGGLE_INVENTORY", v416, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.I)
v4:BindActionAtPriority("HUD_TOGGLE_JOB", v416, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.J)
v4:BindActionAtPriority("HUD_TOGGLE_QUEST", v416, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Q)
v4:BindActionAtPriority("HUD_RETURN_HOME", v416, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.B)
task.defer(function() --[[ Name: bootstrapHud, Line 1060 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u394
    --]]
    if not u13.waitUntilReady(5) then
        warn("[HUDController] platform ready timeout, using fallback HUD bind")
    end
    u394(true)
end)
u13.modeChanged:Connect(function() --[[ Line: 1069 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u42
        [3] = u394
        [4] = u13
        [5] = u65
        [6] = u14
        [7] = u50
        [8] = u51
    --]]
    task.defer(function() --[[ Line: 1070 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u42
            [3] = u394
            [4] = u13
            [5] = u65
            [6] = u14
            [7] = u50
            [8] = u51
        --]]
        u46 = nil
        if u42 then
            u42.Visible = false
        end
        u394(false)
        if u13.getResolvedMode() == "mobile" then
            u65()
        else
            u14.clearTarget()
            if u50 and u50.Parent then
                u50:Destroy()
            end
            u50 = nil
            u51 = nil
        end
    end)
end)
u12.ChildAdded:Connect(function(p417) --[[ Line: 1082 ]]
    --[[
    Upvalues:
        [1] = u394
    --]]
    if p417 and (p417.Name == "MainHUD" or p417.Name == "MainHUD_Mobile") then
        task.defer(function() --[[ Line: 1084 ]]
            --[[
            Upvalues:
                [1] = u394
            --]]
            u394(false)
        end)
    end
end)
u11.CharacterAdded:Connect(function() --[[ Line: 1090 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u50
        [3] = u51
        [4] = u394
    --]]
    u14.clearTarget()
    if u50 and u50.Parent then
        u50:Destroy()
    end
    u50 = nil
    u51 = nil
    task.delay(0.2, function() --[[ Line: 1093 ]]
        --[[
        Upvalues:
            [1] = u394
        --]]
        u394(true)
    end)
end)
print("[HUDController] initialized")