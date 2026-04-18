local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Defs.DailyCommissionDefs)
local u6 = require(v2.Shared.Defs.MonsterDefs)
local u7 = require(v2.Shared.Defs.ItemDefs)
local u8 = require(v2.Shared.Util.PlatformGui)
local u9 = v4:WaitForChild("DailyCommissionRequest")
local v10 = v4:WaitForChild("DailyCommissionSync")
local v11 = v4:WaitForChild("DailyCommissionOpen")
local v12 = v4:WaitForChild("DailyCommissionNotice")
local v13 = v4:WaitForChild("InventorySync")
local v14 = v4:WaitForChild("DataSync")
local u15 = v4:WaitForChild("RobuxShopRequest")
local u16 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u17 = {
    ["payload"] = nil,
    ["inventory"] = {}
}
local function u22(p18, p19, p20) --[[ Line: 43 ]]
    if not p18 then
        return nil
    end
    for _, v21 in ipairs(p18:GetDescendants()) do
        if v21.Name == p19 and (not p20 or v21:IsA(p20)) then
            return v21
        end
    end
    return nil
end
local function u41(p23) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v24 = type(p23) == "table" and p23 and p23 or {}
    local v25 = v24.required
    local v26 = tonumber(v25)
    local v27
    if v26 then
        local v28 = math.floor(v26)
        local v29 = v28 < 1 and 1 or v28
        v27 = v29 > 2000000000 and 2000000000 or v29
    else
        v27 = 1
    end
    local v30 = v27 or 1
    if v24.claimed == true then
        return v30, true
    end
    if v24.missionType ~= "collect" then
        local v31 = v24.progress
        local v32 = tonumber(v31)
        local v33
        if v32 then
            local v34 = math.floor(v32)
            v33 = v34 < 0 and 0 or v34
            if v30 ~= nil then
                if v30 < v33 then
                    v33 = v30
                end
            end
        else
            v33 = 0
        end
        local v35 = v33 or 0
        return v35, v24.completed == true and true or v30 <= v35
    end
    local v36 = v24.targetId
    local v37 = u17.inventory[v36]
    local v38 = tonumber(v37) or 0
    local v39 = math.floor(v38)
    local v40 = math.max(0, v39)
    return math.min(v30, v40), v30 <= v40
end
local function u60(p42) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v43 = p42.required
    local v44 = tonumber(v43)
    local v45
    if v44 then
        local v46 = math.floor(v44)
        local v47 = v46 < 1 and 1 or v46
        v45 = v47 > 2000000000 and 2000000000 or v47
    else
        v45 = 1
    end
    local v48 = v45 or 1
    if p42.missionType == "kill" then
        local v49 = p42.targetId
        local v50 = u6[v49]
        local v51 = v50 and v50.displayName or tostring(v49 or "\235\140\128\236\131\129")
        local v52 = (type(v51) == "string" and v51 and v51 or ""):gsub("^LV%d+%s*", ""):gsub("^Lv%d+%s*", ""):gsub("^lv%d+%s*", "")
        return ((v52 == "" or not v52) and "\235\140\128\236\131\129" or v52) .. " " .. tostring(v48) .. "\235\167\136\235\166\172\235\165\188 \236\178\152\236\185\152\237\149\152\236\132\184\236\154\148."
    end
    if p42.missionType == "collect" then
        local v53 = p42.targetId
        local v54 = u7[v53]
        local v55
        if v54 then
            v55 = v54.displayName
        else
            v55 = v54
        end
        return ((type(v55) == "string" and v55 and v55 or "") ~= "" and v54.displayName or tostring(v53 or "\236\158\172\235\163\140")) .. " " .. tostring(v48) .. "\234\176\156\235\165\188 \235\130\169\237\146\136\237\149\152\236\132\184\236\154\148."
    end
    if p42.missionType ~= "target_kill" then
        return "\236\157\152\235\162\176\235\165\188 \236\167\132\237\150\137\237\149\152\236\132\184\236\154\148."
    end
    local v56 = p42.targetId
    local v57 = u6[v56]
    local v58 = v57 and v57.displayName or tostring(v56 or "\235\140\128\236\131\129")
    local v59 = (type(v58) == "string" and v58 and v58 or ""):gsub("^LV%d+%s*", ""):gsub("^Lv%d+%s*", ""):gsub("^lv%d+%s*", "")
    return ((v59 == "" or not v59) and "\235\140\128\236\131\129" or v59) .. "\236\157\132(\235\165\188) \237\134\160\235\178\140\237\149\152\236\132\184\236\154\148."
end
local function u84(p61) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v62 = p61.reward
    local v63 = type(v62) == "table" and p61.reward or {}
    local v64 = string.format
    local v65 = "\235\179\180\236\131\129 : EXP %d / GOLD %d / %s %d"
    local v66 = v63.exp
    local v67 = tonumber(v66)
    local v68
    if v67 then
        local v69 = math.floor(v67)
        local v70 = v69 < 0 and 0 or v69
        v68 = v70 > 2000000000 and 2000000000 or v70
    else
        v68 = 0
    end
    local v71 = v68 or 0
    local v72 = v63.gold
    local v73 = tonumber(v72)
    local v74
    if v73 then
        local v75 = math.floor(v73)
        local v76 = v75 < 0 and 0 or v75
        v74 = v76 > 2000000000 and 2000000000 or v76
    else
        v74 = 0
    end
    local v77 = v74 or 0
    local v78 = u5.TOKEN_DISPLAY_NAME or "\236\157\152\235\162\176 \236\166\157\237\145\156"
    local v79 = v63.token
    local v80 = tonumber(v79)
    local v81
    if v80 then
        local v82 = math.floor(v80)
        local v83 = v82 < 0 and 0 or v82
        v81 = v83 > 2000000000 and 2000000000 or v83
    else
        v81 = 0
    end
    return v64(v65, v71, v77, v78, v81 or 0)
end
local function u95(p85) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p85 then
        local v86 = u22(p85, "BoardFrame", "Frame")
        if v86 then
            local v87 = u22(v86, "DailyPage", "Frame")
            local v88 = u22(v86, "ShopPage", "Frame")
            local v89 = u22(v86, "DailyTabBtn", "GuiButton")
            local v90 = u22(v86, "ShopTabBtn", "GuiButton")
            if p85 then
                p85 = p85:GetAttribute("CommissionActiveTab")
            end
            local v91 = type(p85) == "string" and p85 and p85 or ""
            local v92 = v91 ~= "shop" and "daily" or v91
            if v87 then
                v87.Visible = v92 ~= "shop"
            end
            if v88 then
                v88.Visible = v92 == "shop"
            end
            local v93 = v92 ~= "shop"
            if v89 and v89:IsA("GuiButton") then
                if v93 then
                    v89.BackgroundTransparency = 0
                else
                    v89.BackgroundTransparency = 0.15
                end
            end
            local v94 = v92 == "shop"
            if v90 then
                if not v90:IsA("GuiButton") then
                    return
                end
                if v94 then
                    v90.BackgroundTransparency = 0
                    return
                end
                v90.BackgroundTransparency = 0.15
            end
        end
    else
        return
    end
end
local function u98(p96) --[[ Line: 130 ]]
    if p96 then
        for _, v97 in ipairs(p96:GetChildren()) do
            if v97:IsA("Frame") and v97.Name ~= "SlotTemplate" then
                v97:Destroy()
            end
        end
    end
end
local function u107(u99) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u95
        [3] = u15
        [4] = u5
    --]]
    if u99 then
        if u99:GetAttribute("CommissionBound") == true then
            return
        else
            u99:SetAttribute("CommissionBound", true)
            local v100 = u22(u99, "BoardFrame", "Frame")
            if v100 then
                local v101 = u22(v100, "CloseBtn", "GuiButton")
                local v102 = u22(v100, "DailyTabBtn", "GuiButton")
                local v103 = u22(v100, "ShopTabBtn", "GuiButton")
                local v104 = u22(v100, "ResetProductBtn", "GuiButton")
                if v101 then
                    v101.Activated:Connect(function() --[[ Line: 146 ]]
                        --[[
                        Upvalues:
                            [1] = u99
                        --]]
                        u99.Enabled = false
                    end)
                end
                if v102 then
                    v102.Activated:Connect(function() --[[ Line: 147 ]]
                        --[[
                        Upvalues:
                            [1] = u99
                            [2] = u95
                        --]]
                        local v105 = u99
                        if v105 then
                            v105:SetAttribute("CommissionActiveTab", "daily")
                        end
                        u95(u99)
                    end)
                end
                if v103 then
                    v103.Activated:Connect(function() --[[ Line: 148 ]]
                        --[[
                        Upvalues:
                            [1] = u99
                            [2] = u95
                        --]]
                        local v106 = u99
                        if v106 then
                            v106:SetAttribute("CommissionActiveTab", "shop")
                        end
                        u95(u99)
                    end)
                end
                if v104 then
                    v104.Activated:Connect(function() --[[ Line: 150 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u5
                        --]]
                        u15:FireServer({
                            ["action"] = "purchaseProduct",
                            ["productKey"] = u5.FULL_RESET_PRODUCT_KEY or "dailyCommissionReset"
                        })
                    end)
                end
                if u99 then
                    u99:SetAttribute("CommissionActiveTab", "daily")
                end
                u95(u99)
            end
        end
    else
        return
    end
end
local function u184(p108) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u107
        [2] = u95
        [3] = u17
        [4] = u22
        [5] = u5
        [6] = u98
        [7] = u41
        [8] = u6
        [9] = u7
        [10] = u60
        [11] = u84
        [12] = u9
        [13] = u3
    --]]
    if p108 and p108.Parent then
        u107(p108)
        u95(p108)
        local u109 = u17.payload
        local v110 = u22(p108, "BoardFrame", "Frame")
        if v110 then
            local v111 = u22(v110, "TokenLabel", "TextLabel")
            local v112 = u22(v110, "ResetAtLabel", "TextLabel")
            local v113 = u22(v110, "VipBonusLabel", "TextLabel")
            local v114 = u22(v110, "EmptyLabel", "TextLabel")
            local v115 = u22(v110, "DailyPage", "Frame")
            local v116 = v115 and u22(v115, "SlotList", "ScrollingFrame") or u22(v110, "SlotList", "ScrollingFrame")
            local v117
            if v116 then
                v117 = u22(v116, "SlotTemplate", "Frame") or nil
            else
                v117 = nil
            end
            if v111 then
                local v118 = string.format
                local v119 = "%s : %d"
                local v120
                if u109 then
                    v120 = u109.tokenDisplayName or (u5.TOKEN_DISPLAY_NAME or "\236\157\152\235\162\176 \236\166\157\237\145\156")
                else
                    v120 = u5.TOKEN_DISPLAY_NAME or "\236\157\152\235\162\176 \236\166\157\237\145\156"
                end
                local v121
                if u109 then
                    v121 = u109.token
                else
                    v121 = u109
                end
                local v122 = tonumber(v121)
                local v123
                if v122 then
                    local v124 = math.floor(v122)
                    local v125 = v124 < 0 and 0 or v124
                    v123 = v125 > 2000000000 and 2000000000 or v125
                else
                    v123 = 0
                end
                v111.Text = v118(v119, v120, v123 or 0)
            end
            if v112 then
                local v126 = string.format
                local v127 = "\235\167\164\236\157\188 %02d:00 \236\180\136\234\184\176\237\153\148"
                local v128
                if u109 then
                    v128 = u109.resetHourKst
                else
                    v128 = u109
                end
                local v129 = tonumber(v128)
                local v130
                if v129 then
                    local v131 = math.floor(v129)
                    local v132 = v131 < 0 and 0 or v131
                    v130 = v132 > 23 and 23 or v132
                else
                    v130 = 4
                end
                v112.Text = v126(v127, v130 or 4)
            end
            if v113 then
                local v133
                if u109 then
                    v133 = u109.tokenMultiplier
                else
                    v133 = u109
                end
                local v134 = tonumber(v133) or 1
                if u109 and (u109.hasTokenBonus and v134 > 1) then
                    v113.Text = string.format("\236\157\152\235\162\176 \235\179\180\235\132\136\236\138\164 : \236\166\157\237\145\156 x%.1f", v134)
                else
                    v113.Text = "\236\157\152\235\162\176 \235\179\180\235\132\136\236\138\164 : \236\151\134\236\157\140"
                end
            end
            if v116 and v117 then
                u98(v116)
                local v135 = false
                for u136, u137 in ipairs(u109 and (u109.slots or {}) or {}) do
                    v135 = true
                    local v138 = v117:Clone()
                    v138.Name = "Slot_" .. tostring(u136)
                    v138.Visible = true
                    v138.Parent = v116
                    local v139 = u137.grade
                    local u140 = u5.GRADES[v139] or (u5.GRADES.common or {
                        ["displayName"] = "\236\157\188\235\176\152",
                        ["color"] = Color3.fromRGB(255, 255, 255)
                    })
                    local v141, v142 = u41(u137)
                    local u143 = u22(v138, "GradeLabel", "TextLabel")
                    local v144 = u22(v138, "TitleLabel", "TextLabel")
                    local v145 = u22(v138, "DescLabel", "TextLabel")
                    local v146 = u22(v138, "ProgressLabel", "TextLabel")
                    local v147 = u22(v138, "RewardLabel", "TextLabel")
                    local v148 = u22(v138, "StateLabel", "TextLabel")
                    local v149 = u22(v138, "ClaimBtn", "GuiButton")
                    local v150 = u22(v138, "RerollBtn", "GuiButton")
                    local v151 = u22(v138, "RerollCostLabel", "TextLabel")
                    if u143 then
                        u143.Text = u140.displayName or "\236\157\188\235\176\152"
                        pcall(function() --[[ Line: 197 ]]
                            --[[
                            Upvalues:
                                [1] = u143
                                [2] = u140
                            --]]
                            u143.TextColor3 = u140.color
                        end)
                    end
                    if v144 then
                        local v152
                        if u137.missionType == "kill" then
                            local v153 = u137.targetId
                            local v154 = u6[v153]
                            local v155 = v154 and v154.displayName or tostring(v153 or "\235\140\128\236\131\129")
                            local v156 = (type(v155) == "string" and v155 and v155 or ""):gsub("^LV%d+%s*", ""):gsub("^Lv%d+%s*", ""):gsub("^lv%d+%s*", "")
                            v152 = ((v156 == "" or not v156) and "\235\140\128\236\131\129" or v156) .. " \236\178\152\236\185\152"
                        elseif u137.missionType == "collect" then
                            local v157 = u137.targetId
                            local v158 = u7[v157]
                            local v159
                            if v158 then
                                v159 = v158.displayName
                            else
                                v159 = v158
                            end
                            v152 = ((type(v159) == "string" and v159 and v159 or "") ~= "" and v158.displayName or tostring(v157 or "\236\158\172\235\163\140")) .. " \235\130\169\237\146\136"
                        elseif u137.missionType == "target_kill" then
                            local v160 = u137.targetId
                            local v161 = u6[v160]
                            local v162 = v161 and v161.displayName or tostring(v160 or "\235\140\128\236\131\129")
                            local v163 = (type(v162) == "string" and v162 and v162 or ""):gsub("^LV%d+%s*", ""):gsub("^Lv%d+%s*", ""):gsub("^lv%d+%s*", "")
                            v152 = ((v163 == "" or not v163) and "\235\140\128\236\131\129" or v163) .. " \237\134\160\235\178\140"
                        else
                            v152 = "\236\157\152\235\162\176"
                        end
                        v144.Text = v152
                    end
                    if v145 then
                        v145.Text = u60(u137)
                    end
                    if v146 then
                        local v164 = string.format
                        local v165 = "\236\167\132\237\150\137\235\143\132 %d / %d"
                        local v166 = u137.required
                        local v167 = tonumber(v166)
                        local v168
                        if v167 then
                            local v169 = math.floor(v167)
                            local v170 = v169 < 1 and 1 or v169
                            v168 = v170 > 2000000000 and 2000000000 or v170
                        else
                            v168 = 1
                        end
                        v146.Text = v164(v165, v141, v168 or 1)
                    end
                    if v147 then
                        v147.Text = u84(u137)
                    end
                    if v148 then
                        if u137.claimed == true then
                            v148.Text = "\236\136\152\235\160\185 \236\153\132\235\163\140"
                        elseif v142 then
                            v148.Text = "\236\136\152\235\160\185 \234\176\128\235\138\165"
                        else
                            v148.Text = "\236\167\132\237\150\137\236\164\145"
                        end
                    end
                    if v151 then
                        local v171 = string.format
                        local v172 = "\235\166\172\235\161\164 \235\185\132\236\154\169 : %dG"
                        local v173 = u137.rerollCost
                        local v174 = tonumber(v173)
                        local v175
                        if v174 then
                            local v176 = math.floor(v174)
                            local v177 = v176 < 0 and 0 or v176
                            v175 = v177 > 2000000000 and 2000000000 or v177
                        else
                            v175 = 0
                        end
                        v151.Text = v171(v172, v175 or 0)
                    end
                    if v149 then
                        local v178
                        if u137.claimed == true then
                            v178 = false
                        else
                            v178 = v142
                        end
                        v149.AutoButtonColor = v178
                        if u137.claimed == true then
                            v142 = false
                        end
                        v149.Active = v142
                        v149.Text = u137.claimed == true and "\236\153\132\235\163\140" or "\236\136\152\235\160\185"
                        v149.Activated:Connect(function() --[[ Line: 212 ]]
                            --[[
                            Upvalues:
                                [1] = u137
                                [2] = u9
                                [3] = u136
                                [4] = u109
                            --]]
                            if u137.claimed ~= true then
                                u9:FireServer({
                                    ["action"] = "claim",
                                    ["slotIndex"] = u136,
                                    ["slotId"] = u137.slotId,
                                    ["boardCycle"] = u109.boardCycle
                                })
                            end
                        end)
                    end
                    if v150 then
                        v150.AutoButtonColor = u137.claimed ~= true
                        v150.Active = u137.claimed ~= true
                        v150.Activated:Connect(function() --[[ Line: 220 ]]
                            --[[
                            Upvalues:
                                [1] = u137
                                [2] = u3
                                [3] = u9
                                [4] = u136
                                [5] = u109
                            --]]
                            if u137.claimed == true then
                                local u179 = "\236\157\180\235\175\184 \236\136\152\235\160\185\237\149\156 \236\157\152\235\162\176\235\138\148 \235\166\172\235\161\164\237\149\160 \236\136\152 \236\151\134\236\138\181\235\139\136\235\139\164."
                                local u180 = true
                                if not pcall(function() --[[ Line: 38 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u3
                                        [2] = u179
                                        [3] = u180
                                    --]]
                                    local v181 = u3
                                    local v182 = {
                                        ["Title"] = "\236\157\152\235\162\176 \234\178\140\236\139\156\237\140\144"
                                    }
                                    local v183 = u179 or ""
                                    v182.Text = tostring(v183)
                                    v182.Duration = u180 and 3 or 2.5
                                    v181:SetCore("SendNotification", v182)
                                end) then
                                    warn("[DailyCommissionUI] " .. tostring("\236\157\180\235\175\184 \236\136\152\235\160\185\237\149\156 \236\157\152\235\162\176\235\138\148 \235\166\172\235\161\164\237\149\160 \236\136\152 \236\151\134\236\138\181\235\139\136\235\139\164."))
                                end
                            else
                                u9:FireServer({
                                    ["action"] = "reroll",
                                    ["slotIndex"] = u136,
                                    ["slotId"] = u137.slotId,
                                    ["boardCycle"] = u109.boardCycle
                                })
                            end
                        end)
                    end
                end
                if v114 then
                    v114.Visible = not v135
                end
            end
        else
            return
        end
    else
        return
    end
end
local function u186() --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u107
        [3] = u184
    --]]
    for _, v185 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        if v185 then
            u107(v185)
            u184(v185)
        end
    end
end
v14.OnClientEvent:Connect(function(p187) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u16
        [3] = u184
    --]]
    if type(p187) == "table" then
        local v188 = p187.inventory
        if type(v188) == "table" then
            u17.inventory = p187.inventory
        end
    end
    for _, v189 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        u184(v189)
    end
end)
v13.OnClientEvent:Connect(function(p190) --[[ Line: 242 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u16
        [3] = u184
    --]]
    if type(p190) == "table" then
        local v191 = p190.inventory
        if type(v191) == "table" then
            u17.inventory = p190.inventory
        end
    end
    for _, v192 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        u184(v192)
    end
end)
v10.OnClientEvent:Connect(function(p193) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u16
        [3] = u184
    --]]
    if type(p193) == "table" then
        u17.payload = p193
        for _, v194 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
            u184(v194)
        end
    end
end)
v11.OnClientEvent:Connect(function(p195) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u16
        [3] = u184
        [4] = u8
    --]]
    if type(p195) == "table" then
        u17.payload = p195
    end
    for _, v196 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        u184(v196)
    end
    u8.setEnabled(u16, "CommissionBoardGui", true)
end)
v12.OnClientEvent:Connect(function(p197) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v198 = type(p197) == "table" and p197 and p197 or {}
    local u199 = v198.text
    local u200 = v198.isError == true
    if not pcall(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u199
            [3] = u200
        --]]
        local v201 = u3
        local v202 = {
            ["Title"] = "\236\157\152\235\162\176 \234\178\140\236\139\156\237\140\144"
        }
        local v203 = u199 or ""
        v202.Text = tostring(v203)
        v202.Duration = u200 and 3 or 2.5
        v201:SetCore("SendNotification", v202)
    end) then
        warn("[DailyCommissionUI] " .. tostring(u199))
    end
end)
task.defer(function() --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u186
        [3] = u9
    --]]
    u8.waitUntilReady(5)
    u186()
    u9:FireServer({
        ["action"] = "requestSync"
    })
end)
u8.modeChanged:Connect(function() --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u186
    --]]
    task.defer(u186)
end)
u16.ChildAdded:Connect(function(p204) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u186
    --]]
    if p204 and (p204.Name == "CommissionBoardGui" or p204.Name == "CommissionBoardGui_Mobile") then
        task.defer(u186)
    end
end)
print("[DailyCommissionUIController] initialized")