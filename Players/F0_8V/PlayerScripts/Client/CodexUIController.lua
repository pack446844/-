local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Defs.CodexDefs)
local u5 = require(v2.Shared.Defs.MonsterDefs)
local u6 = require(v2.Shared.Util.PlatformGui)
local u7 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v8 = v3:WaitForChild("CodexSync")
local u9 = v3:WaitForChild("CodexState")
local u10 = {
    ["killsByMonsterId"] = {},
    ["aggregate"] = {
        ["attackPct"] = 0,
        ["maxHpPct"] = 0,
        ["moveSpeedPct"] = 0,
        ["bossDamagePct"] = 0,
        ["damageReductionPct"] = 0
    },
    ["revision"] = 0
}
local u11 = "normal"
local u12 = false
local function u22(p13) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v14 = u4.STAT_LABELS
    local v15 = p13 and (p13.statKey or "") or ""
    local v16 = v14[tostring(v15)]
    if not v16 then
        local v17 = p13 and (p13.statKey or "") or ""
        v16 = tostring(v17)
    end
    local v18 = 0
    if p13 then
        p13 = p13.statValue
    end
    local v19 = tonumber(p13) or 0
    local v20 = math.max(v18, v19) * 100 + 0.5
    local v21 = math.floor(v20)
    return v16 .. " +" .. tostring(v21) .. "%"
end
local function u26(p23) --[[ Line: 56 ]]
    local v24
    if p23 then
        v24 = p23:FindFirstChildOfClass("UIListLayout")
    else
        v24 = p23
    end
    if v24 then
        return v24
    end
    if not p23 then
        return nil
    end
    local v25 = Instance.new("UIListLayout")
    v25.Padding = UDim.new(0, 8)
    v25.SortOrder = Enum.SortOrder.LayoutOrder
    v25.Parent = p23
    return v25
end
local function u29(p27, p28) --[[ Line: 66 ]]
    if p27 and p27:IsA("GuiButton") then
        if p28 then
            p27.BackgroundColor3 = Color3.fromRGB(176, 140, 46)
            p27.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            p27.BackgroundColor3 = Color3.fromRGB(42, 56, 88)
            p27.TextColor3 = Color3.fromRGB(220, 220, 220)
        end
    else
        return
    end
end
local function u35() --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v30 = {}
    local v31 = {}
    local v32 = u6.find(u7, "CodexGui")
    if v32 and (v32.Parent and not v31[v32]) then
        v31[v32] = true
        v30[#v30 + 1] = v32
    end
    local v33 = u7:FindFirstChild("CodexGui")
    if v33 and (v33.Parent and not v31[v33]) then
        v31[v33] = true
        v30[#v30 + 1] = v33
    end
    local v34 = u7:FindFirstChild("CodexGui_Mobile")
    if v34 and v34.Parent then
        if v31[v34] then
            return v30
        end
        v31[v34] = true
        v30[#v30 + 1] = v34
    end
    return v30
end
local function u41() --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v36 = {}
    local v37 = {}
    local v38 = u6.find(u7, "MainHUD")
    if v38 and (v38.Parent and not v37[v38]) then
        v37[v38] = true
        v36[#v36 + 1] = v38
    end
    local v39 = u7:FindFirstChild("MainHUD")
    if v39 and (v39.Parent and not v37[v39]) then
        v37[v39] = true
        v36[#v36 + 1] = v39
    end
    local v40 = u7:FindFirstChild("MainHUD_Mobile")
    if v40 and v40.Parent then
        if v37[v40] then
            return v36
        end
        v37[v40] = true
        v36[#v36 + 1] = v40
    end
    return v36
end
local function u56(p42) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    local v43 = p42 and p42:FindFirstChild("Root")
    if v43 then
        v43 = p42.Root:FindFirstChild("Window")
    end
    if v43 then
        v43 = v43:FindFirstChild("SummaryBar")
    end
    if v43 then
        local v44 = v43:FindFirstChild("SummaryTitle")
        local v45 = v43:FindFirstChild("SummaryDesc")
        if v44 and v44:IsA("TextLabel") then
            v44.Text = "\235\136\132\236\160\129 \237\154\168\234\179\188"
        end
        if v45 and v45:IsA("TextLabel") then
            local v46 = {}
            for _, v47 in ipairs({
                "attackPct",
                "maxHpPct",
                "moveSpeedPct",
                "bossDamagePct",
                "damageReductionPct"
            }) do
                local v48 = 0
                local v49 = u10.aggregate
                if v49 then
                    v49 = u10.aggregate[v47]
                end
                local v50 = tonumber(v49) or 0
                local v51 = math.max(v48, v50)
                if v51 > 0 then
                    local v52 = #v46 + 1
                    local v53 = u4.STAT_LABELS[v47] or v47
                    local v54 = v51 * 100 + 0.5
                    local v55 = math.floor(v54)
                    v46[v52] = v53 .. " +" .. tostring(v55) .. "%"
                end
            end
            v45.Text = #v46 > 0 and table.concat(v46, "   ") or "\236\149\132\236\167\129 \237\154\141\235\147\157\237\149\156 \235\143\132\234\176\144 \237\154\168\234\179\188\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164."
        end
    end
end
local function u99(p57, p58) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u22
    --]]
    if p57 and p58 then
        local v59 = p57:FindFirstChild("Background")
        local v60 = p57:FindFirstChild("NameLabel", true)
        local v61 = p57:FindFirstChild("ProgressLabel", true)
        local v62 = p57:FindFirstChild("BonusLabel", true)
        local v63 = p57:FindFirstChild("CheckMark", true)
        local v64 = p57:FindFirstChild("CompletedDim", true)
        local v65 = 1
        local v66
        if p58 then
            v66 = p58.goal
        else
            v66 = p58
        end
        local v67 = tonumber(v66)
        local v68
        if v67 then
            local v69 = math.floor(v67)
            local v70 = v69 < 1 and 1 or v69
            v68 = v70 > 2000000000 and 2000000000 or v70
        else
            v68 = 1
        end
        local v71 = math.max(v65, v68 or 1)
        local v72
        if p58 then
            v72 = p58.monsterId
        else
            v72 = p58
        end
        local v73 = 0
        local v74 = u10.killsByMonsterId
        if v74 then
            v74 = u10.killsByMonsterId[v72]
        end
        local v75 = tonumber(v74)
        local v76
        if v75 then
            local v77 = math.floor(v75)
            local v78 = v77 < 0 and 0 or v77
            v76 = v78 > 2000000000 and 2000000000 or v78
        else
            v76 = 0
        end
        local v79 = v71 <= math.max(v73, v76 or 0)
        if v60 and v60:IsA("TextLabel") then
            local v80 = p58.monsterId
            local v81
            if v80 then
                v81 = u5[v80] or nil
            else
                v81 = nil
            end
            local v82 = v81 and v81.displayName or (v80 or "Unknown")
            v60.Text = tostring(v82)
        end
        if v61 and v61:IsA("TextLabel") then
            local v83 = 1
            local v84
            if p58 then
                v84 = p58.goal
            else
                v84 = p58
            end
            local v85 = tonumber(v84)
            local v86
            if v85 then
                local v87 = math.floor(v85)
                local v88 = v87 < 1 and 1 or v87
                v86 = v88 > 2000000000 and 2000000000 or v88
            else
                v86 = 1
            end
            local v89 = math.max(v83, v86 or 1)
            local v90
            if p58 then
                v90 = p58.monsterId
            else
                v90 = p58
            end
            local v91 = 0
            local v92 = u10.killsByMonsterId
            if v92 then
                v92 = u10.killsByMonsterId[v90]
            end
            local v93 = tonumber(v92)
            local v94
            if v93 then
                local v95 = math.floor(v93)
                local v96 = v95 < 0 and 0 or v95
                v94 = v96 > 2000000000 and 2000000000 or v96
            else
                v94 = 0
            end
            local v97 = math.max(v91, v94 or 0)
            local v98 = math.min(v97, v89)
            v61.Text = tostring(v98) .. " / " .. tostring(v89)
        end
        if v62 and v62:IsA("TextLabel") then
            v62.Text = u22(p58)
        end
        if v63 and v63:IsA("GuiObject") then
            v63.Visible = v79
        end
        if v64 and v64:IsA("GuiObject") then
            v64.Visible = v79
        end
        if v59 and v59:IsA("GuiObject") then
            v59.BackgroundColor3 = v79 and Color3.fromRGB(24, 32, 52) or Color3.fromRGB(19, 26, 43)
        end
        if v60 and v60:IsA("TextLabel") then
            v60.TextTransparency = v79 and 0.1 or 0
        end
        if v61 and v61:IsA("TextLabel") then
            v61.TextTransparency = v79 and 0.05 or 0
        end
        if v62 and v62:IsA("TextLabel") then
            v62.TextTransparency = v79 and 0.05 or 0
        end
    end
end
local function u114(p100, p101) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u99
    --]]
    if p100 and (p101 and p101:IsA("Frame")) then
        local v102 = u4.BY_CATEGORY[u11] or {}
        local v103 = {}
        for _, v104 in ipairs(v102) do
            local v105
            if p100 and (p101 and v104) then
                local v106 = v104.monsterId or ""
                local v107 = "Entry_" .. tostring(v106)
                v105 = p100:FindFirstChild(v107)
                if not (v105 and v105:IsA("Frame")) then
                    v105 = p101:Clone()
                    v105.Name = v107
                    v105.Parent = p100
                end
            else
                v105 = nil
            end
            if v105 then
                v103[v105.Name] = true
                v105.Visible = true
                local v108 = v104.sortOrder
                local v109 = tonumber(v108)
                local v110
                if v109 then
                    local v111 = math.floor(v109)
                    local v112 = v111 < 0 and 0 or v111
                    v110 = v112 > 999999 and 999999 or v112
                else
                    v110 = 0
                end
                v105.LayoutOrder = v110 or 0
                u99(v105, v104)
            end
        end
        for _, v113 in ipairs(p100:GetChildren()) do
            if v113:IsA("Frame") and v113 ~= p101 then
                v113.Visible = v103[v113.Name] == true
            end
        end
    end
end
local function u121(p115) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u11
        [3] = u56
        [4] = u114
        [5] = u26
    --]]
    if p115 and p115.Parent then
        local v116 = p115:FindFirstChild("Root")
        if v116 then
            v116 = v116:FindFirstChild("Window")
        end
        if v116 then
            local v117 = v116:FindFirstChild("TabBar")
            if v117 then
                u29(v117:FindFirstChild("BtnNormal"), u11 == "normal")
                u29(v117:FindFirstChild("BtnBoss"), u11 == "boss")
                u29(v117:FindFirstChild("BtnWorldBoss"), u11 == "world_boss")
            end
            u56(p115)
            local u118 = v116:FindFirstChild("ListArea")
            if u118 then
                u118 = u118:FindFirstChild("ListScroll")
            end
            local v119
            if u118 then
                v119 = u118:FindFirstChild("EntryTemplate")
            else
                v119 = u118
            end
            if u118 and (v119 and v119:IsA("Frame")) then
                v119.Visible = false
                u114(u118, v119)
                local u120 = u26(u118)
                task.defer(function() --[[ Line: 193 ]]
                    --[[
                    Upvalues:
                        [1] = u118
                        [2] = u120
                    --]]
                    if u118 and (u118.Parent and u120) then
                        u118.CanvasSize = UDim2.new(0, 0, 0, u120.AbsoluteContentSize.Y + 8)
                    end
                end)
            end
        else
            return
        end
    else
        return
    end
end
local function u124() --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u121
        [3] = u12
    --]]
    local v122 = false
    for _, v123 in ipairs((u35())) do
        if v123.Enabled == true then
            u121(v123)
            v122 = true
        end
    end
    u12 = not v122
end
local function u142(p125) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u124
    --]]
    local v126 = u10
    local v127 = type(p125) == "table" and (p125.killsByMonsterId or {}) or {}
    local v128 = {}
    if type(v127) == "table" then
        for v129, v130 in pairs(v127) do
            v128[v129] = v130
        end
    end
    v126.killsByMonsterId = v128
    local v131 = u10
    local v132 = type(p125) == "table" and (p125.aggregate or {}) or {}
    local v133 = {}
    if type(v132) == "table" then
        for v134, v135 in pairs(v132) do
            v133[v134] = v135
        end
    end
    v131.aggregate = v133
    local v136 = u10
    local v137
    if type(p125) == "table" then
        v137 = p125.revision
    else
        v137 = false
    end
    local v138 = tonumber(v137)
    local v139
    if v138 then
        local v140 = math.floor(v138)
        local v141 = v140 < 0 and 0 or v140
        v139 = v141 > 2000000000 and 2000000000 or v141
    else
        v139 = 0
    end
    v136.revision = v139 or 0
    u124()
end
local function u166(p143) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u124
    --]]
    if type(p143) == "table" then
        local v144 = p143.revision
        local v145 = tonumber(v144)
        local v146
        if v145 then
            local v147 = math.floor(v145)
            local v148 = v147 < 0 and 0 or v147
            v146 = v148 > 2000000000 and 2000000000 or v148
        else
            v146 = 0
        end
        local v149 = v146 or 0
        if v149 >= u10.revision then
            u10.revision = v149
            local v150 = p143.changes
            local v151 = type(v150) == "table" and (p143.changes or {}) or {}
            for v152, v153 in pairs(v151) do
                local v154 = u10.killsByMonsterId
                local v155 = 0
                local v156 = tonumber(v153)
                local v157
                if v156 then
                    local v158 = math.floor(v156)
                    local v159 = v158 < 0 and 0 or v158
                    v157 = v159 > 2000000000 and 2000000000 or v159
                else
                    v157 = 0
                end
                v154[v152] = math.max(v155, v157 or 0)
            end
            local v160 = p143.aggregate
            if type(v160) == "table" then
                local v161 = u10
                local v162 = p143.aggregate
                local v163 = {}
                if type(v162) == "table" then
                    for v164, v165 in pairs(v162) do
                        v163[v164] = v165
                    end
                end
                v161.aggregate = v163
            end
            u124()
        end
    else
        return
    end
end
local function u178(u167) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u121
        [3] = u11
        [4] = u124
    --]]
    if u167 and u167.Parent then
        local v168 = u167:FindFirstChild("Root")
        if v168 then
            v168 = v168:FindFirstChild("Window")
        end
        if v168 then
            if u167:GetAttribute("CodexEnabledBound") ~= true then
                u167:SetAttribute("CodexEnabledBound", true)
                u167:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 243 ]]
                    --[[
                    Upvalues:
                        [1] = u167
                        [2] = u12
                        [3] = u121
                    --]]
                    if u167.Enabled == true and u12 == true then
                        u121(u167)
                        u12 = false
                    end
                end)
            end
            local v169 = v168:FindFirstChild("TitleBar")
            if v169 then
                v169 = v168.TitleBar:FindFirstChild("BtnClose")
            end
            local function v170() --[[ Line: 252 ]]
                --[[
                Upvalues:
                    [1] = u167
                --]]
                u167.Enabled = false
            end
            if v169 and v169:GetAttribute("CodexCloseBound") ~= true then
                v169:SetAttribute("CodexCloseBound", true)
                v169.Activated:Connect(v170)
            end
            local v171 = v168:FindFirstChild("TabBar")
            if v171 then
                local v172 = v171:FindFirstChild("BtnNormal")
                local function v173() --[[ Line: 256 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u124
                    --]]
                    u11 = "normal"
                    u124()
                end
                if v172 and v172:GetAttribute("CodexTabNormalBound") ~= true then
                    v172:SetAttribute("CodexTabNormalBound", true)
                    v172.Activated:Connect(v173)
                end
                local v174 = v171:FindFirstChild("BtnBoss")
                local function v175() --[[ Line: 257 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u124
                    --]]
                    u11 = "boss"
                    u124()
                end
                if v174 and v174:GetAttribute("CodexTabBossBound") ~= true then
                    v174:SetAttribute("CodexTabBossBound", true)
                    v174.Activated:Connect(v175)
                end
                local v176 = v171:FindFirstChild("BtnWorldBoss")
                local function v177() --[[ Line: 258 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u124
                    --]]
                    u11 = "world_boss"
                    u124()
                end
                if not v176 then
                    return
                end
                if v176:GetAttribute("CodexTabWorldBound") == true then
                    return
                end
                v176:SetAttribute("CodexTabWorldBound", true)
                v176.Activated:Connect(v177)
            end
        end
    else
        return
    end
end
local function u185() --[[ Line: 261 ]]
    --[[
    Upvalues:
        [1] = u41
        [2] = u6
        [3] = u7
        [4] = u9
        [5] = u142
    --]]
    for _, v179 in ipairs((u41())) do
        local v180 = v179:FindFirstChild("BtnCodex", true)
        local function v184() --[[ Line: 264 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u7
                [3] = u9
                [4] = u142
            --]]
            u6.toggle(u7, "CodexGui")
            local v181 = u6.find(u7, "CodexGui")
            if v181 and v181.Enabled == true then
                local v182, v183 = pcall(function() --[[ Line: 226 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    return u9:InvokeServer()
                end)
                if v182 and type(v183) == "table" then
                    u142(v183)
                end
            end
        end
        if v180 then
            if v180:GetAttribute("CodexHudBound") ~= true then
                v180:SetAttribute("CodexHudBound", true)
                v180.Activated:Connect(v184)
            end
        end
    end
end
local function u187() --[[ Line: 271 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u178
        [3] = u185
        [4] = u124
    --]]
    for _, v186 in ipairs((u35())) do
        u178(v186)
    end
    u185()
    u124()
end
task.defer(function() --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u187
        [3] = u9
        [4] = u142
    --]]
    u6.waitUntilReady(5)
    u187()
    local v188, v189 = pcall(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        return u9:InvokeServer()
    end)
    if v188 and type(v189) == "table" then
        u142(v189)
    end
end)
u6.modeChanged:Connect(function() --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u187
        [2] = u124
    --]]
    task.defer(u187)
    task.defer(u124)
end)
u7.ChildAdded:Connect(function(p190) --[[ Line: 288 ]]
    --[[
    Upvalues:
        [1] = u187
        [2] = u124
    --]]
    if p190 then
        local v191 = p190.Name or ""
        local v192 = tostring(v191)
        if v192 == "MainHUD" or (v192 == "MainHUD_Mobile" or (v192 == "CodexGui" or v192 == "CodexGui_Mobile")) then
            task.defer(u187)
            task.defer(u124)
        end
    end
end)
v8.OnClientEvent:Connect(function(p193) --[[ Line: 297 ]]
    --[[
    Upvalues:
        [1] = u142
        [2] = u166
    --]]
    if type(p193) == "table" then
        if p193.mode == "full" then
            u142(p193)
        else
            u166(p193)
        end
    else
        return
    end
end)
print("[CodexUIController] initialized")