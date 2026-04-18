local u1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = game:GetService("RunService")
local u5 = u1.LocalPlayer
local u6 = u5:WaitForChild("PlayerGui")
local u7 = require(v2.Shared.Util.PlatformGui)
local v8 = v2.Shared.Net
local u9 = require(v2.Shared.Defs.PartyConfig)
local u10 = v8:WaitForChild("PartyActionRequest")
local v11 = v8:WaitForChild("PartyInvite")
local v12 = v8:WaitForChild("PartySync")
local v13 = v8:WaitForChild("PartyNotice")
local u14 = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = nil
local u22 = nil
local u23 = nil
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = nil
local u28 = nil
local u29 = {}
local u30 = nil
local u31 = nil
local u32 = 0
local u33 = false
local u34 = nil
local u35 = nil
local u36 = setmetatable({}, {
    ["__mode"] = "k"
})
local function u38(u37) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u37.Font = Enum.Font.SourceSans
    pcall(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u14
        --]]
        u37.FontFace = u14
    end)
    if u37:IsA("TextLabel") or u37:IsA("TextButton") then
        u37.TextStrokeColor3 = Color3.new(0, 0, 0)
        u37.TextStrokeTransparency = 0.75
    end
end
local function u49(p39, p40, p41, p42, p43, p44, p45, p46, p47) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v48 = Instance.new("TextLabel")
    v48.Name = p39
    v48.Size = p41
    v48.Position = p42
    v48.BackgroundTransparency = p46 == nil and 1 or p46
    v48.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v48.Text = tostring(p43 or "")
    v48.TextSize = p44 or 18
    v48.TextColor3 = p45 or Color3.fromRGB(35, 35, 35)
    v48.TextXAlignment = Enum.TextXAlignment.Left
    v48.TextYAlignment = Enum.TextYAlignment.Center
    v48.ZIndex = p47 or 1
    v48.Parent = p40
    u38(v48)
    return v48
end
local function u59(p50, p51, p52, p53, p54, p55, p56, p57) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v58 = Instance.new("TextButton")
    v58.Name = p50
    v58.Size = p52
    v58.Position = p53
    v58.BackgroundColor3 = p56 or Color3.fromRGB(240, 240, 240)
    v58.BorderSizePixel = 0
    v58.Text = tostring(p54 or "")
    v58.TextSize = p55 or 18
    v58.TextColor3 = Color3.fromRGB(35, 35, 35)
    v58.AutoButtonColor = true
    v58.ZIndex = p57 or 1
    v58.Parent = p51
    u38(v58)
    return v58
end
local function u68(p60) --[[ Line: 127 ]]
    local v61 = typeof(p60) == "Color3" and p60 and p60 or Color3.fromRGB(90, 170, 255)
    local v62 = string.format
    local v63 = v61.R * 255 + 0.5
    local v64 = math.floor(v63)
    local v65 = v61.G * 255 + 0.5
    local v66 = math.floor(v65)
    local v67 = v61.B * 255 + 0.5
    return v62("%d,%d,%d", v64, v66, (math.floor(v67)))
end
local function u74(p69) --[[ Line: 132 ]]
    if type(p69) ~= "table" then
        return nil
    end
    local v70 = p69.shields
    if type(v70) == "table" then
        return p69.shields
    end
    local v71 = p69.shieldState
    if type(v71) == "table" then
        return p69.shieldState
    end
    local v72 = p69.shieldSnapshot
    if type(v72) == "table" then
        return p69.shieldSnapshot
    end
    local v73 = p69.shieldEntries
    return type(v73) == "table" and {
        ["entries"] = p69.shieldEntries,
        ["current"] = p69.shieldCurrent,
        ["max"] = p69.shieldMax
    } or nil
end
local function u103(p75, p76) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u74
    --]]
    local v77 = tonumber(p76) or 0
    local v78 = math.max(0, v77)
    local v79 = u74(p75)
    local v80
    if v79 then
        local v81 = v79.entries
        v80 = type(v81) == "table" and (v79.entries or {}) or {}
    else
        v80 = {}
    end
    local v82 = 0
    local v83 = {}
    for _, v84 in ipairs(v80) do
        local v85 = v84.current
        local v86 = (tonumber(v85) or 0) + 0.5
        local v87 = math.floor(v86)
        local v88 = math.max(0, v87)
        if v88 > 0 then
            v82 = v82 + v88
            local v89 = #v83 + 1
            local v90 = {}
            local v91 = v84.entryId
            if not v91 then
                local v92 = #v83 + 1
                v91 = tostring(v92)
            end
            v90.entryId = v91
            v90.current = v88
            local v93 = v84.hudColor
            v90.hudColor = typeof(v93) == "Color3" and v84.hudColor or Color3.fromRGB(90, 170, 255)
            local v94 = v84.sortOrder
            v90.sortOrder = tonumber(v94) or 0
            local v95 = v84.expireAt
            v90.expireAt = tonumber(v95) or (1 / 0)
            v83[v89] = v90
        end
    end
    table.sort(v83, function(p96, p97) --[[ Line: 159 ]]
        if p96.sortOrder ~= p97.sortOrder then
            return p96.sortOrder < p97.sortOrder
        end
        if p96.expireAt ~= p97.expireAt then
            return p96.expireAt < p97.expireAt
        end
        local v98 = p96.entryId
        local v99 = tostring(v98)
        local v100 = p97.entryId
        return v99 < tostring(v100)
    end)
    if #v83 == 0 and v78 > 0 then
        local v101 = {
            ["entryId"] = "default"
        }
        local v102 = v78 + 0.5
        v101.current = math.floor(v102)
        v101.hudColor = Color3.fromRGB(90, 170, 255)
        v101.sortOrder = 0
        v101.expireAt = (1 / 0)
        v83[1] = v101
        v82 = v83[1].current
    end
    return v83, math.max(0, v82)
end
local function u119(p104, p105, p106) --[[ Line: 171 ]]
    local v107 = tonumber(p104) or 0
    local v108 = math.max(0, v107)
    local v109 = tonumber(p105) or 1
    local v110 = math.max(1, v109)
    local v111 = tonumber(p106) or 0
    local v112 = math.max(0, v111)
    if v108 <= 0 and v112 <= 0 then
        return 0, 0
    end
    if v112 <= 0 then
        local v113 = v108 / v110
        return math.clamp(v113, 0, 1), 0
    end
    local v114 = v110 + v112
    if v114 <= 0 then
        return 0, 0
    end
    local v115 = v108 / v114
    local v116 = math.clamp(v115, 0, 1)
    local v117 = v112 / v114
    local v118 = 1 - v116
    return v116, math.clamp(v117, 0, v118)
end
local function u141(p120, p121, p122, p123) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u103
        [2] = u68
    --]]
    local v124 = (tonumber(p121) or 0) + 0.5
    local v125 = math.floor(v124)
    local v126 = math.max(0, v125)
    local v127 = (tonumber(p122) or 1) + 0.5
    local v128 = math.floor(v127)
    local v129 = math.max(1, v128)
    local v130 = (tonumber(p123) or 0) + 0.5
    local v131 = math.floor(v130)
    local v132 = math.max(0, v131)
    if v132 <= 0 then
        return string.format("%d / %d", v126, v129)
    end
    local v133, v134 = u103(p120, v132)
    local v135 = {}
    if #v133 > 0 and v134 > 0 then
        for _, v136 in ipairs(v133) do
            local v137 = v136.current
            local v138 = (tonumber(v137) or 0) + 0.5
            local v139 = math.floor(v138)
            local v140 = math.max(0, v139)
            if v140 > 0 then
                if v132 < v140 then
                    v140 = v132
                end
                v135[#v135 + 1] = string.format("<font color=\"rgb(%s)\">(+%d)</font>", u68(v136.hudColor), v140)
                v132 = v132 - v140
                if v132 <= 0 then
                    break
                end
            end
        end
    end
    if v132 > 0 then
        v135[#v135 + 1] = string.format("<font color=\"rgb(%s)\">(+%d)</font>", u68(Color3.fromRGB(90, 170, 255)), v132)
    end
    return string.format("%d%s / %d", v126, table.concat(v135, ""), v129)
end
local function u147(p142, p143) --[[ Line: 207 ]]
    local v144 = "ShieldSegment_" .. tostring(p143)
    local v145 = p142:FindFirstChild(v144)
    if not (v145 and v145:IsA("Frame")) then
        v145 = Instance.new("Frame")
        v145.Name = v144
        v145.BorderSizePixel = 0
        v145.Parent = p142
    end
    local v146 = p142.ZIndex or 1
    v145.ZIndex = math.max(1, v146)
    return v145
end
local function u161(p148, p149, p150, p151) --[[ Line: 220 ]]
    --[[
    Upvalues:
        [1] = u103
        [2] = u147
    --]]
    local v152, v153 = u103(p149, p151)
    local v154 = {}
    local v155 = 0
    for _, v156 in ipairs(v152) do
        local v157 = v153 > 0 and (v156.current / v153 or 0) or 0
        if v157 > 0.0001 and p150 > 0.0001 then
            local v158 = u147(p148, v156.entryId)
            v158.BackgroundColor3 = v156.hudColor
            v158.Position = UDim2.new(v155, 0, 0, 0)
            v158.Size = UDim2.new(v157, 0, 1, 0)
            v158.Visible = true
            v155 = v155 + v157
            v154[v158.Name] = true
        end
    end
    for _, v159 in ipairs(p148:GetChildren()) do
        if v159:IsA("Frame") and v159.Name:sub(1, 14) == "ShieldSegment_" then
            local v160
            if v154[v159.Name] == true then
                v160 = p150 > 0.0001
            else
                v160 = false
            end
            v159.Visible = v160
        end
    end
end
local function u183() --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
        [3] = u16
        [4] = u49
        [5] = u59
        [6] = u17
        [7] = u18
        [8] = u19
        [9] = u31
        [10] = u33
        [11] = u34
        [12] = u35
        [13] = u20
        [14] = u22
        [15] = u10
        [16] = u21
        [17] = u23
        [18] = u24
        [19] = u25
        [20] = u26
        [21] = u30
        [22] = u29
        [23] = u27
    --]]
    if not (u15 and u15.Parent) then
        u15 = Instance.new("ScreenGui")
        u15.Name = "PartyGui"
        u15.ResetOnSpawn = false
        u15.IgnoreGuiInset = true
        u15.DisplayOrder = 220
        u15.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u15.Parent = u6
        local v162 = u15
        local v163 = UDim2.new(0, 420, 0, 460)
        local v164 = UDim2.new(0.5, -210, 0.5, -230)
        local v165 = Color3.fromRGB(255, 255, 255)
        local v166 = Instance.new("Frame")
        v166.Name = "ListPanel"
        v166.Size = v163
        v166.Position = v164
        v166.BackgroundColor3 = v165 or Color3.fromRGB(255, 255, 255)
        v166.BorderSizePixel = 0
        v166.ZIndex = 10
        v166.Parent = v162
        u16 = v166
        u16.Visible = false
        u49("Title", u16, UDim2.new(1, -16, 0, 38), UDim2.new(0, 12, 0, 8), "\237\140\140\237\139\176", 28, Color3.fromRGB(35, 35, 35), 1, 11)
        u59("CloseBtn", u16, UDim2.new(0, 68, 0, 32), UDim2.new(1, -80, 0, 10), "\235\139\171\234\184\176", 20, Color3.fromRGB(235, 235, 235), 11).Activated:Connect(function() --[[ Line: 280 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16.Visible = false
        end)
        u17 = Instance.new("ScrollingFrame")
        u17.Name = "ListScroll"
        u17.Size = UDim2.new(1, -24, 1, -62)
        u17.Position = UDim2.new(0, 12, 0, 50)
        u17.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
        u17.BackgroundTransparency = 0
        u17.BorderSizePixel = 0
        u17.CanvasSize = UDim2.new(0, 0, 0, 0)
        u17.ScrollBarThickness = 10
        u17.ZIndex = 10
        u17.Parent = u16
        local u167 = Instance.new("UIListLayout")
        u167.Padding = UDim.new(0, 6)
        u167.SortOrder = Enum.SortOrder.LayoutOrder
        u167.Parent = u17
        u167:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 300 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u167
            --]]
            u17.CanvasSize = UDim2.new(0, 0, 0, u167.AbsoluteContentSize.Y + 8)
        end)
        local v168 = u15
        local v169 = UDim2.new(0, 340, 0, 252)
        local v170 = UDim2.new(1, -18, 0, 92)
        local v171 = Color3.fromRGB(255, 255, 255)
        local v172 = Instance.new("Frame")
        v172.Name = "StatusPanel"
        v172.Size = v169
        v172.Position = v170
        v172.BackgroundColor3 = v171 or Color3.fromRGB(255, 255, 255)
        v172.BorderSizePixel = 0
        v172.ZIndex = 10
        v172.Parent = v168
        u18 = v172
        u18.AnchorPoint = Vector2.new(1, 0)
        u18.Visible = false
        u19 = u59("StatusToggleBtn", u15, UDim2.fromOffset(34, 22), UDim2.new(1, -18, 0, 88), "\226\150\178", 18, Color3.fromRGB(255, 255, 255), 12)
        u19.AnchorPoint = Vector2.new(1, 1)
        u19.Visible = false
        u19.Activated:Connect(function() --[[ Line: 311 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u33
                [3] = u34
                [4] = u35
            --]]
            if u31 and u31.inParty == true then
                u33 = not u33
                u34()
                u35()
            end
        end)
        u20 = u49("CountLabel", u18, UDim2.new(0, 160, 0, 34), UDim2.new(0, 12, 0, 10), "0 / 4", 28, Color3.fromRGB(35, 35, 35), 1, 11)
        u22 = u59("LeaveBtn", u18, UDim2.new(0, 96, 0, 34), UDim2.new(1, -108, 0, 10), "\237\131\136\237\135\180", 20, Color3.fromRGB(235, 235, 235), 11)
        u22.Activated:Connect(function() --[[ Line: 321 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10:FireServer({
                ["action"] = "leave"
            })
        end)
        u21 = Instance.new("ScrollingFrame")
        u21.Name = "MemberList"
        u21.Size = UDim2.new(1, -24, 1, -54)
        u21.Position = UDim2.new(0, 12, 0, 48)
        u21.BackgroundTransparency = 1
        u21.BorderSizePixel = 0
        u21.CanvasSize = UDim2.new(0, 0, 0, 0)
        u21.ScrollBarThickness = 0
        u21.ScrollingDirection = Enum.ScrollingDirection.Y
        u21.ZIndex = 10
        u21.Parent = u18
        local u173 = Instance.new("UIListLayout")
        u173.Padding = UDim.new(0, 8)
        u173.SortOrder = Enum.SortOrder.LayoutOrder
        u173.Parent = u21
        u173:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 341 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u173
            --]]
            u21.CanvasSize = UDim2.new(0, 0, 0, u173.AbsoluteContentSize.Y + 4)
        end)
        local v174 = u15
        local v175 = UDim2.new(0, 380, 0, 132)
        local v176 = UDim2.new(0.5, -190, 1, -154)
        local v177 = Color3.fromRGB(255, 255, 255)
        local v178 = Instance.new("Frame")
        v178.Name = "InvitePanel"
        v178.Size = v175
        v178.Position = v176
        v178.BackgroundColor3 = v177 or Color3.fromRGB(255, 255, 255)
        v178.BorderSizePixel = 0
        v178.ZIndex = 20
        v178.Parent = v174
        u23 = v178
        u23.Visible = false
        u24 = u49("InviteMessage", u23, UDim2.new(1, -20, 0, 64), UDim2.new(0, 10, 0, 10), "", 22, Color3.fromRGB(35, 35, 35), 1, 21)
        u24.TextWrapped = true
        u25 = u59("AcceptBtn", u23, UDim2.new(0.5, -14, 0, 38), UDim2.new(0, 10, 1, -48), "\236\136\152\235\157\189", 22, Color3.fromRGB(220, 245, 225), 21)
        u26 = u59("DeclineBtn", u23, UDim2.new(0.5, -14, 0, 38), UDim2.new(0.5, 4, 1, -48), "\234\177\176\236\160\136", 22, Color3.fromRGB(245, 225, 225), 21)
        u25.Activated:Connect(function() --[[ Line: 354 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u29
                [3] = u10
            --]]
            if u30 then
                local v179 = u30
                table.remove(u29, 1)
                u30 = nil
                u10:FireServer({
                    ["action"] = "accept",
                    ["fromUserId"] = v179.fromUserId
                })
            end
        end)
        u26.Activated:Connect(function() --[[ Line: 362 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u29
                [3] = u10
            --]]
            if u30 then
                local v180 = u30
                table.remove(u29, 1)
                u30 = nil
                u10:FireServer({
                    ["action"] = "decline",
                    ["fromUserId"] = v180.fromUserId
                })
            end
        end)
        u27 = u49("NoticeLabel", u15, UDim2.new(0, 380, 0, 34), UDim2.new(0.5, -190, 1, -44), "", 22, Color3.fromRGB(35, 35, 35), 0, 30)
        u27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        u27.TextXAlignment = Enum.TextXAlignment.Center
        u27.Visible = false
        u34()
        local v181 = u31
        if v181 then
            v181 = u31.inParty == true
        end
        if u19 then
            u19.Visible = v181
            u19.Text = u33 and "\226\150\188" or "\226\150\178"
        end
        if u18 then
            local v182 = u18
            if v181 then
                v181 = not u33
            end
            v182.Visible = v181
        end
    end
end
local function u191() --[[ Line: 391 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u7
    --]]
    local v184 = workspace.CurrentCamera
    local v185 = v184 and v184.ViewportSize or Vector2.new(1920, 1080)
    if v185.X <= 0 or v185.Y <= 0 then
        v185 = Vector2.new(1920, 1080)
    end
    local v186 = u3.TouchEnabled
    if v186 then
        local v187 = v185.X
        local v188 = v185.Y
        v186 = math.min(v187, v188) <= 900
    end
    if v186 then
        local v189 = u6:FindFirstChild("MainHUD_Mobile") or u7.find(u6, "MainHUD")
        if v189 then
            local v190 = v189:FindFirstChild("BtnRobux", true) or v189:FindFirstChild("BtnR$", true)
            if v190 and (v190:IsA("GuiObject") and v190.Visible) then
                return v190
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
local function u211() --[[ Line: 400 ]]
    --[[
    Upvalues:
        [1] = u191
    --]]
    local v192 = workspace.CurrentCamera
    local v193 = v192 and v192.ViewportSize or Vector2.new(1920, 1080)
    if v193.X <= 0 or v193.Y <= 0 then
        v193 = Vector2.new(1920, 1080)
    end
    local v194 = v193.X - 8
    local v195 = v193.X * 0.24
    local v196 = math.floor(v195)
    local v197 = math.clamp(v196, 160, 220)
    local v198 = v193.Y * 0.18
    local v199 = math.floor(v198)
    local v200 = math.clamp(v199, 132, 156)
    local v201 = v193.Y * 0.24
    local v202 = math.floor(v201)
    local v203 = math.clamp(v202, 160, 220)
    local v204 = u191()
    local v205
    if v204 and (v204.AbsoluteSize.X > 0 and v204.AbsoluteSize.Y > 0) then
        local v206 = v194 - (v204.AbsolutePosition.X + v204.AbsoluteSize.X + 8)
        local v207 = math.floor(v206)
        if v207 >= 132 then
            v197 = math.clamp(v207, 132, 220)
            local v208 = v204.AbsolutePosition.Y
            local v209 = math.floor(v208)
            v205 = math.max(8, v209)
        else
            local v210 = v204.AbsolutePosition.Y + v204.AbsoluteSize.Y + 8
            v205 = math.floor(v210)
        end
    else
        v205 = 8
    end
    return v197, v200, v203, v205, v205 + v200 + 8, v194
end
u34 = function() --[[ Line: 423 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u23
        [4] = u27
        [5] = u19
        [6] = u3
        [7] = u17
        [8] = u20
        [9] = u22
        [10] = u21
        [11] = u24
        [12] = u25
        [13] = u26
        [14] = u211
    --]]
    if u16 and (u18 and (u23 and (u27 and u19))) then
        local v212 = workspace.CurrentCamera
        local v213 = v212 and v212.ViewportSize or Vector2.new(1920, 1080)
        if v213.X <= 0 or v213.Y <= 0 then
            v213 = Vector2.new(1920, 1080)
        end
        local v214 = u3.TouchEnabled
        if v214 then
            local v215 = v213.X
            local v216 = v213.Y
            v214 = math.min(v215, v216) <= 900
        end
        if v214 then
            local v217, v218, v219, v220, v221, v222 = u211()
            u16.AnchorPoint = Vector2.new(1, 0)
            u16.Size = UDim2.fromOffset(v217, v219)
            u16.Position = UDim2.fromOffset(v222, v221)
            u18.AnchorPoint = Vector2.new(1, 0)
            u18.Size = UDim2.fromOffset(v217, v218)
            u18.Position = UDim2.fromOffset(v222, v220)
            u19.AnchorPoint = Vector2.new(1, 1)
            u19.Size = UDim2.fromOffset(28, 18)
            local v223 = u19
            local v224 = UDim2.fromOffset
            local v225 = v220 - 4
            v223.Position = v224(v222, (math.max(v225, 22)))
            u19.TextSize = 14
            u23.Size = UDim2.fromOffset(math.max(v217, 220), 116)
            local v226 = u23
            local v227 = UDim2.new
            local v228 = math.max(v217, 220) * 0.5
            v226.Position = v227(0.5, -math.floor(v228), 1, -204)
            local v229 = math.max(v217, 220)
            local v230 = math.min(v229, 300)
            u27.Size = UDim2.fromOffset(v230, 32)
            local v231 = u27
            local v232 = UDim2.new
            local v233 = v230 * 0.5
            v231.Position = v232(0.5, -math.floor(v233), 1, -44)
            u17.Size = UDim2.new(1, -16, 1, -50)
            u17.Position = UDim2.new(0, 8, 0, 42)
            u20.Size = UDim2.fromOffset(92, 20)
            u20.Position = UDim2.new(0, 6, 0, 4)
            u20.TextSize = 18
            u22.Size = UDim2.fromOffset(54, 20)
            u22.Position = UDim2.new(1, -60, 0, 4)
            u22.TextSize = 14
            u21.Size = UDim2.new(1, -12, 1, -30)
            u21.Position = UDim2.new(0, 6, 0, 26)
            u21.ScrollBarThickness = 6
            u24.Size = UDim2.new(1, -20, 0, 54)
            u24.Position = UDim2.new(0, 10, 0, 8)
            u25.Size = UDim2.new(0.5, -14, 0, 34)
            u25.Position = UDim2.new(0, 10, 1, -42)
            u26.Size = UDim2.new(0.5, -14, 0, 34)
            u26.Position = UDim2.new(0.5, 4, 1, -42)
        else
            u16.AnchorPoint = Vector2.new(0, 0)
            u16.Size = UDim2.fromOffset(420, 460)
            u16.Position = UDim2.new(0.5, -210, 0.5, -230)
            u18.Size = UDim2.fromOffset(340, 252)
            u18.Position = UDim2.new(1, -18, 0, 92)
            u19.AnchorPoint = Vector2.new(1, 1)
            u19.Size = UDim2.fromOffset(34, 22)
            u19.Position = UDim2.new(1, -18, 0, 88)
            u19.TextSize = 18
            u23.Size = UDim2.fromOffset(380, 132)
            u23.Position = UDim2.new(0.5, -190, 1, -154)
            u27.Size = UDim2.fromOffset(380, 34)
            u27.Position = UDim2.new(0.5, -190, 1, -44)
            u17.Size = UDim2.new(1, -24, 1, -62)
            u17.Position = UDim2.new(0, 12, 0, 50)
            u20.Size = UDim2.fromOffset(132, 30)
            u20.Position = UDim2.new(0, 10, 0, 8)
            u20.TextSize = 28
            u22.Size = UDim2.fromOffset(84, 30)
            u22.Position = UDim2.new(1, -94, 0, 8)
            u22.TextSize = 20
            u21.Size = UDim2.new(1, -20, 1, -44)
            u21.Position = UDim2.new(0, 10, 0, 40)
            u21.ScrollBarThickness = 0
            u24.Size = UDim2.new(1, -20, 0, 64)
            u24.Position = UDim2.new(0, 10, 0, 10)
            u25.Size = UDim2.new(0.5, -14, 0, 38)
            u25.Position = UDim2.new(0, 10, 1, -48)
            u26.Size = UDim2.new(0.5, -14, 0, 38)
            u26.Position = UDim2.new(0.5, 4, 1, -48)
        end
    else
        return
    end
end
local function u236(p234) --[[ Line: 495 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u183
        [3] = u32
        [4] = u27
    --]]
    if not u15 then
        u183()
    end
    u32 = u32 + 1
    local u235 = u32
    u27.Text = tostring(p234 or "")
    u27.Visible = u27.Text ~= ""
    if u27.Visible then
        task.delay(2.25, function() --[[ Line: 502 ]]
            --[[
            Upvalues:
                [1] = u235
                [2] = u32
                [3] = u27
            --]]
            if u235 == u32 then
                u27.Visible = false
            end
        end)
    end
end
local function u260() --[[ Line: 518 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u1
        [3] = u59
        [4] = u5
        [5] = u10
    --]]
    if u17 and u17.Parent then
        local v237 = u17
        for _, v238 in ipairs(v237:GetChildren()) do
            if v238.Name:sub(1, 7) == "Player_" then
                v238:Destroy()
            end
        end
        local v239 = u1:GetPlayers()
        table.sort(v239, function(p240, p241) --[[ Line: 509 ]]
            local v242 = p240.DisplayName or p240.Name
            local v243
            if v242 == p240.Name then
                v243 = p240.Name
            else
                v243 = v242 .. " (@" .. p240.Name .. ")"
            end
            local v244 = p241.DisplayName or p241.Name
            local v245
            if v244 == p241.Name then
                v245 = p241.Name
            else
                v245 = v244 .. " (@" .. p241.Name .. ")"
            end
            if v243 == v245 then
                return p240.UserId < p241.UserId
            else
                return v243 < v245
            end
        end)
        local v246 = 0
        for _, u247 in ipairs(v239) do
            v246 = v246 + 1
            local v248 = u59
            local v249 = u247.UserId
            local v250 = "Player_" .. tostring(v249)
            local v251 = u17
            local v252 = UDim2.new(1, -8, 0, 42)
            local v253 = UDim2.new(0, 4, 0, 0)
            local v254 = u247.DisplayName or u247.Name
            local v255
            if v254 == u247.Name then
                v255 = u247.Name
            else
                v255 = v254 .. " (@" .. u247.Name .. ")"
            end
            local v256 = v248(v250, v251, v252, v253, v255, 22, Color3.fromRGB(255, 255, 255), 10)
            v256.LayoutOrder = v246
            v256.TextXAlignment = Enum.TextXAlignment.Left
            v256.Text = "  " .. v256.Text
            if u247 == u5 then
                v256.Active = false
                v256.AutoButtonColor = false
                v256.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
                local v257 = "  "
                local v258 = u247.DisplayName or u247.Name
                local v259
                if v258 == u247.Name then
                    v259 = u247.Name
                else
                    v259 = v258 .. " (@" .. u247.Name .. ")"
                end
                v256.Text = v257 .. v259 .. " [\235\130\152]"
            else
                v256.Activated:Connect(function() --[[ Line: 537 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u247
                    --]]
                    u10:FireServer({
                        ["action"] = "invite",
                        ["targetUserId"] = u247.UserId
                    })
                end)
            end
        end
    end
end
local function u268() --[[ Line: 548 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u183
        [3] = u30
        [4] = u29
        [5] = u24
        [6] = u23
    --]]
    if not u15 then
        u183()
    end
    if u30 then
        local v261 = os.clock()
        local v262 = u30.expireAt or 0
        if tonumber(v262) < v261 then
            table.remove(u29, 1)
            u30 = nil
        end
    end
    if not u30 then
        while #u29 > 0 do
            local v263 = u29[1]
            if type(v263) == "table" then
                local v264 = os.clock()
                local v265 = v263.expireAt or 0
                if v264 <= tonumber(v265) then
                    u30 = v263
                    break
                end
            end
            table.remove(u29, 1)
        end
    end
    if u30 then
        local v266 = u24
        local v267 = u30.fromName or "Unknown"
        v266.Text = tostring(v267) .. "\235\139\152\236\157\180 \237\140\140\237\139\176 \236\180\136\235\140\128\235\165\188 \235\179\180\235\131\136\236\138\181\235\139\136\235\139\164."
        if u23 then
            u23.Visible = true
        end
    else
        u24.Text = ""
        if u23 then
            u23.Visible = false
        end
    end
end
local function u285(p269) --[[ Line: 577 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u29
        [3] = u30
        [4] = u268
    --]]
    local v270 = type(p269) == "table" and p269 and p269 or {}
    local v271 = v270.fromUserId
    local v272 = tonumber(v271)
    if v272 then
        local v273 = v270.duration
        local v274 = tonumber(v273)
        if not v274 then
            local v275 = u9.INVITE_EXPIRE
            v274 = tonumber(v275) or 20
        end
        for v276, v277 in ipairs(u29) do
            local v278 = v277.fromUserId
            if tonumber(v278) == v272 then
                local v279 = v270.fromName or (v277.fromName or "Unknown")
                v277.fromName = tostring(v279)
                v277.expireAt = os.clock() + v274
                if v276 ~= 1 and u30 then
                    local v280 = u30.fromUserId
                    if tonumber(v280) == v272 then
                        u30 = v277
                    end
                end
                u268()
                return
            end
        end
        local v281 = u29
        local v282 = #u29 + 1
        local v283 = {
            ["fromUserId"] = v272
        }
        local v284 = v270.fromName or "Unknown"
        v283.fromName = tostring(v284)
        v283.expireAt = os.clock() + v274
        v281[v282] = v283
        u268()
    end
end
u35 = function() --[[ Line: 603 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u31
        [3] = u19
        [4] = u33
        [5] = u18
        [6] = u20
        [7] = u3
        [8] = u49
        [9] = u119
        [10] = u161
        [11] = u141
    --]]
    if u21 then
        local v286 = u21
        for _, v287 in ipairs(v286:GetChildren()) do
            if v287.Name:sub(1, 7) == "Member_" then
                v287:Destroy()
            end
        end
        local v288 = u31
        if v288 and v288.inParty == true then
            local v289 = u20
            local v290 = v288.memberCount or 0
            local v291 = tostring(v290)
            local v292 = v288.maxMembers or 4
            v289.Text = v291 .. " / " .. tostring(v292)
            local v293 = u31
            if v293 then
                v293 = u31.inParty == true
            end
            if u19 then
                u19.Visible = v293
                u19.Text = u33 and "\226\150\188" or "\226\150\178"
            end
            if u18 then
                local v294 = u18
                if v293 then
                    v293 = not u33
                end
                v294.Visible = v293
            end
            if not u33 then
                local v295 = workspace.CurrentCamera
                local v296 = v295 and v295.ViewportSize or Vector2.new(1920, 1080)
                if v296.X <= 0 or v296.Y <= 0 then
                    v296 = Vector2.new(1920, 1080)
                end
                local v297 = u3.TouchEnabled
                if v297 then
                    local v298 = v296.X
                    local v299 = v296.Y
                    v297 = math.min(v298, v299) <= 900
                end
                local v300 = v288.members or {}
                local v301 = v297 and 20 or 30
                local v302 = v297 and 34 or 52
                local v303 = v297 and 16 or 24
                local v304 = v297 and 18 or 28
                local v305 = v297 and 10 or 18
                local v306 = v297 and 15 or 22
                for v307, v308 in ipairs(v300) do
                    local v309 = Instance.new("Frame")
                    local v310 = v308.userId or v307
                    v309.Name = "Member_" .. tostring(v310)
                    v309.Size = UDim2.new(1, 0, 0, v302)
                    v309.BackgroundTransparency = 1
                    v309.BorderSizePixel = 0
                    v309.LayoutOrder = v307
                    v309.ZIndex = 10
                    v309.Parent = u21
                    local v311 = v308.level or 1
                    local v312 = tostring(v311)
                    local v313 = v308.name or "Unknown"
                    local v314 = "Lv." .. v312 .. " " .. tostring(v313)
                    u49("Title", v309, UDim2.new(1, 0, 0, v303), UDim2.new(0, 0, 0, 0), v314, v304, Color3.fromRGB(35, 35, 35), 1, 11).TextXAlignment = Enum.TextXAlignment.Left
                    local v315 = Instance.new("Frame")
                    v315.Name = "HpBarBack"
                    v315.Size = UDim2.new(1, 0, 0, v305)
                    v315.Position = UDim2.new(0, 0, 0, v301)
                    v315.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
                    v315.BorderSizePixel = 0
                    v315.ZIndex = 10
                    v315.Parent = v309
                    local v316 = v308.hp
                    local v317 = tonumber(v316) or 0
                    local v318 = math.max(0, v317)
                    local v319 = v308.maxHp
                    local v320 = tonumber(v319) or 1
                    local v321 = math.max(1, v320)
                    local v322 = v308.shieldCurrent
                    local v323 = tonumber(v322) or 0
                    local v324 = math.max(0, v323)
                    local v325, v326 = u119(v318, v321, v324)
                    local v327 = Instance.new("Frame")
                    v327.Name = "HpBarFill"
                    v327.Size = UDim2.new(v325, 0, 1, 0)
                    v327.BackgroundColor3 = Color3.fromRGB(90, 190, 105)
                    v327.BorderSizePixel = 0
                    v327.ZIndex = 11
                    v327.Parent = v315
                    local v328 = Instance.new("Frame")
                    v328.Name = "ShieldBarFill"
                    v328.Size = UDim2.new(v326, 0, 1, 0)
                    v328.Position = UDim2.new(v325, 0, 0, 0)
                    v328.BackgroundTransparency = 1
                    v328.BorderSizePixel = 0
                    v328.ZIndex = 12
                    v328.Visible = v326 > 0.0001
                    v328.ClipsDescendants = true
                    v328.Parent = v315
                    u161(v328, v308, v326, v324)
                    local v329 = u49("HpText", v315, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), u141(v308, v318, v321, v324), v306, Color3.fromRGB(35, 35, 35), 1, 13)
                    v329.TextXAlignment = Enum.TextXAlignment.Center
                    v329.RichText = true
                end
            end
        else
            local v330 = u31
            if v330 then
                v330 = u31.inParty == true
            end
            if u19 then
                u19.Visible = v330
                u19.Text = u33 and "\226\150\188" or "\226\150\178"
            end
            if u18 then
                local v331 = u18
                if v330 then
                    v330 = not u33
                end
                v331.Visible = v330
            end
            return
        end
    else
        return
    end
end
local function u332() --[[ Line: 690 ]]
    --[[
    Upvalues:
        [1] = u183
        [2] = u16
        [3] = u260
    --]]
    u183()
    u16.Visible = not u16.Visible
    if u16.Visible then
        u260()
    end
end
local function u337() --[[ Line: 696 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v333 = {}
    local v334 = u7.find(u6, "MainHUD")
    if v334 then
        table.insert(v333, v334)
    end
    local v335 = u6:FindFirstChild("MainHUD")
    local v336 = u6:FindFirstChild("MainHUD_Mobile")
    if v335 and v335 ~= v334 then
        table.insert(v333, v335)
    end
    if v336 and v336 ~= v334 then
        table.insert(v333, v336)
    end
    return v333
end
local function u341() --[[ Line: 707 ]]
    --[[
    Upvalues:
        [1] = u337
        [2] = u28
        [3] = u36
        [4] = u332
    --]]
    local v338 = false
    for _, v340 in ipairs((u337())) do
        if v340 then
            local v340 = v340:FindFirstChild("BtnParty", true)
        end
        if v340 and v340:IsA("GuiButton") then
            v338 = true
            u28 = v340
            if not u36[v340] then
                u36[v340] = true
                v340.Activated:Connect(u332)
            end
        end
    end
    return v338
end
local function v344() --[[ Line: 723 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v342 = workspace.CurrentCamera
    if v342 then
        v342:GetPropertyChangedSignal("ViewportSize"):Connect(u34)
    else
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 729 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            local v343 = workspace.CurrentCamera
            if v343 then
                v343:GetPropertyChangedSignal("ViewportSize"):Connect(u34)
                u34()
            end
        end)
    end
end
u183()
u34()
u341()
u6.DescendantAdded:Connect(function(p345) --[[ Line: 740 ]]
    --[[
    Upvalues:
        [1] = u341
        [2] = u34
    --]]
    if p345.Name == "BtnParty" and p345:IsA("GuiButton") then
        task.defer(u341)
        task.defer(u34)
        return
    elseif p345.Name == "MainHUD" or p345.Name == "MainHUD_Mobile" then
        task.defer(u341)
        task.defer(u34)
    elseif (p345.Name == "BtnRobux" or p345.Name == "BtnR$") and p345:IsA("GuiObject") then
        task.defer(u34)
    end
end)
v344()
u1.PlayerAdded:Connect(function() --[[ Line: 753 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u260
    --]]
    if u16 and u16.Visible then
        u260()
    end
end)
u1.PlayerRemoving:Connect(function() --[[ Line: 756 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u260
    --]]
    if u16 and u16.Visible then
        u260()
    end
end)
u3.InputBegan:Connect(function(p346, p347) --[[ Line: 760 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u183
        [3] = u16
        [4] = u260
    --]]
    if not (p347 or u3:GetFocusedTextBox()) then
        if p346.KeyCode == Enum.KeyCode.P then
            u183()
            u16.Visible = not u16.Visible
            if u16.Visible then
                u260()
                return
            end
        elseif p346.KeyCode == Enum.KeyCode.Escape and (u16 and u16.Visible) then
            u16.Visible = false
        end
    end
end)
v4.RenderStepped:Connect(function() --[[ Line: 769 ]]
    --[[
    Upvalues:
        [1] = u268
    --]]
    u268()
end)
v11.OnClientEvent:Connect(function(p348) --[[ Line: 773 ]]
    --[[
    Upvalues:
        [1] = u285
    --]]
    u285(p348)
end)
v12.OnClientEvent:Connect(function(p349) --[[ Line: 777 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u35
    --]]
    u31 = type(p349) == "table" and p349 and p349 or nil
    if not u31 or u31.inParty ~= true then
        u31 = nil
    end
    u35()
end)
v13.OnClientEvent:Connect(function(p350) --[[ Line: 781 ]]
    --[[
    Upvalues:
        [1] = u236
    --]]
    u236((type(p350) == "table" and p350 and p350 or {}).text or "")
end)
print("[PartyUIController] initialized")