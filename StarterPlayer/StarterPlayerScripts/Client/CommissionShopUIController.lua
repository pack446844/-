local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Defs.DailyCommissionDefs)
local u6 = require(v2.Shared.Defs.CommissionShopDefs)
local u7 = require(v2.Shared.Util.PlatformGui)
local v8 = v4:WaitForChild("DailyCommissionSync")
local v9 = v4:WaitForChild("DataSync")
local v10 = v4:WaitForChild("HudSync")
local v11 = v4:WaitForChild("InventorySync")
local u12 = v4:WaitForChild("CommissionShopRequest")
local v13 = v4:WaitForChild("CommissionShopSync")
local v14 = v4:WaitForChild("CommissionShopNotice")
local v15 = v4:WaitForChild("CommissionShopBuffSync")
local u16 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u17 = {
    ["token"] = 0,
    ["shop"] = {
        ["expBuffSeconds"] = 0,
        ["goldBuffSeconds"] = 0,
        ["ownedTitleIds"] = {},
        ["equippedTitleId"] = "",
        ["timeDisplayCapMinutes"] = 999,
        ["expMultiplier"] = 1,
        ["goldMultiplier"] = 1
    }
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
local function u35(p23) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v24 = type(p23) == "table" and p23 and p23 or {}
    if v24.type == "timed_exp_buff" then
        local v25 = u17.shop.expBuffSeconds
        local v26 = tonumber(v25)
        local v27
        if v26 then
            local v28 = math.floor(v26)
            local v29 = v28 < 0 and 0 or v28
            v27 = v29 > 2000000000 and 2000000000 or v29
        else
            v27 = 0
        end
        return v27 or 0
    end
    if v24.type ~= "timed_gold_buff" then
        return 0
    end
    local v30 = u17.shop.goldBuffSeconds
    local v31 = tonumber(v30)
    local v32
    if v31 then
        local v33 = math.floor(v31)
        local v34 = v33 < 0 and 0 or v33
        v32 = v34 > 2000000000 and 2000000000 or v34
    else
        v32 = 0
    end
    return v32 or 0
end
local function u50(p36) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v37 = tonumber(p36)
    local v38
    if v37 then
        local v39 = math.floor(v37)
        local v40 = v39 < 0 and 0 or v39
        v38 = v40 > 2000000000 and 2000000000 or v40
    else
        v38 = 0
    end
    local v41 = v38 or 0
    if v41 <= 0 then
        return "\235\130\168\236\157\128 \236\139\156\234\176\132 : \236\151\134\236\157\140"
    else
        local v42 = u17.shop.timeDisplayCapMinutes
        local v43 = tonumber(v42)
        local v44
        if v43 then
            local v45 = math.floor(v43)
            local v46 = v45 < 1 and 1 or v45
            v44 = v46 > 999 and 999 or v46
        else
            v44 = 999
        end
        local v47 = v44 or 999
        local v48 = v41 / 60
        local v49 = math.ceil(v48)
        if v47 < v49 then
            return "\235\130\168\236\157\128 \236\139\156\234\176\132 : " .. tostring(v47) .. "\235\182\132+"
        else
            return "\235\130\168\236\157\128 \236\139\156\234\176\132 : " .. tostring(v49) .. "\235\182\132"
        end
    end
end
local function u62() --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u22
        [3] = u5
        [4] = u17
    --]]
    for _, v51 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        local v52 = u22(v51, "BoardFrame", "Frame")
        local v53 = v52 and u22(v52, "TokenLabel", "TextLabel") or nil
        if v53 then
            local v54 = string.format
            local v55 = "%s : %d"
            local v56 = u5.TOKEN_DISPLAY_NAME or "\236\157\152\235\162\176 \236\166\157\237\145\156"
            local v57 = u17.token
            local v58 = tonumber(v57)
            local v59
            if v58 then
                local v60 = math.floor(v58)
                local v61 = v60 < 0 and 0 or v60
                v59 = v61 > 2000000000 and 2000000000 or v61
            else
                v59 = 0
            end
            v53.Text = v54(v55, v56, v59 or 0)
        end
    end
end
local function u71(p63, u64) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local u65 = u22(p63, "ShopList", "ScrollingFrame")
    local v66 = u22(p63, "ShopPlaceholderLabel", "TextLabel")
    if not u65 then
        u65 = Instance.new("ScrollingFrame")
        u65.Name = "ShopList"
        u65.BackgroundColor3 = Color3.fromRGB(18, 22, 28)
        u65.BorderSizePixel = 0
        u65.ScrollBarThickness = u64 and 8 or 10
        u65.Size = UDim2.new(1, 0, 1, 0)
        u65.CanvasSize = UDim2.new()
        u65.Parent = p63
        local v67 = Instance.new("UICorner")
        v67.CornerRadius = UDim.new(0, 14)
        v67.Parent = u65
        local v68 = Instance.new("UIStroke")
        v68.Color = Color3.fromRGB(75, 95, 125)
        v68.Thickness = 1.4
        v68.Parent = u65
        local v69 = Instance.new("UIPadding")
        v69.PaddingTop = UDim.new(0, u64 and 10 or 12)
        v69.PaddingBottom = UDim.new(0, u64 and 10 or 12)
        v69.PaddingLeft = UDim.new(0, u64 and 10 or 14)
        v69.PaddingRight = UDim.new(0, u64 and 10 or 14)
        v69.Parent = u65
        local u70 = Instance.new("UIListLayout")
        u70.Name = "Layout"
        u70.Padding = UDim.new(0, u64 and 8 or 10)
        u70.Parent = u65
        u70:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u70
                [3] = u64
            --]]
            u65.CanvasSize = UDim2.new(0, 0, 0, u70.AbsoluteContentSize.Y + (u64 and 20 or 24))
        end)
    end
    if v66 then
        v66.Visible = false
    end
    return u65
end
local function u96(p72, u73, p74) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
    --]]
    local v75 = Instance.new("Frame")
    local v76 = u73.id
    v75.Name = "ShopItem_" .. tostring(v76)
    v75.BackgroundColor3 = Color3.fromRGB(32, 38, 48)
    v75.BorderSizePixel = 0
    v75.Size = UDim2.new(1, 0, 0, p74 and 120 or 132)
    v75.Parent = p72
    local v77 = Instance.new("UICorner")
    v77.CornerRadius = UDim.new(0, 14)
    v77.Parent = v75
    local v78 = Instance.new("UIStroke")
    v78.Color = Color3.fromRGB(88, 106, 138)
    v78.Thickness = 1.2
    v78.Parent = v75
    local v79 = Instance.new("TextLabel")
    v79.Name = "TitleLabel"
    v79.BackgroundTransparency = 1
    v79.Font = Enum.Font.GothamBold
    v79.TextSize = p74 and 18 or 20
    v79.TextXAlignment = Enum.TextXAlignment.Left
    v79.TextYAlignment = Enum.TextYAlignment.Top
    v79.TextColor3 = Color3.fromRGB(255, 255, 255)
    local v80 = u73.displayName
    if not v80 then
        local v81 = u73.id
        v80 = tostring(v81)
    end
    v79.Text = v80
    v79.Position = UDim2.new(0, 14, 0, 10)
    v79.Size = UDim2.new(1, -138, 0, p74 and 24 or 26)
    v79.Parent = v75
    local v82 = Instance.new("TextLabel")
    v82.Name = "DescLabel"
    v82.BackgroundTransparency = 1
    v82.Font = Enum.Font.Gotham
    v82.TextSize = p74 and 13 or 14
    v82.TextXAlignment = Enum.TextXAlignment.Left
    v82.TextYAlignment = Enum.TextYAlignment.Top
    v82.TextWrapped = true
    v82.TextColor3 = Color3.fromRGB(200, 208, 220)
    v82.Position = UDim2.new(0, 14, 0, p74 and 36 or 38)
    v82.Size = UDim2.new(1, -138, 0, p74 and 34 or 36)
    v82.Parent = v75
    local v83 = Instance.new("TextLabel")
    v83.Name = "StatusLabel"
    v83.BackgroundTransparency = 1
    v83.Font = Enum.Font.GothamBold
    v83.TextSize = p74 and 13 or 14
    v83.TextXAlignment = Enum.TextXAlignment.Left
    v83.TextYAlignment = Enum.TextYAlignment.Top
    v83.TextColor3 = Color3.fromRGB(130, 235, 255)
    v83.Position = UDim2.new(0, 14, 0, p74 and 78 or 82)
    v83.Size = UDim2.new(1, -138, 0, 18)
    v83.Parent = v75
    local v84 = Instance.new("TextLabel")
    v84.Name = "PriceLabel"
    v84.BackgroundTransparency = 1
    v84.Font = Enum.Font.GothamBold
    v84.TextSize = p74 and 13 or 14
    v84.TextXAlignment = Enum.TextXAlignment.Left
    v84.TextYAlignment = Enum.TextYAlignment.Top
    v84.TextColor3 = Color3.fromRGB(255, 225, 130)
    v84.Position = UDim2.new(0, 14, 1, -24)
    v84.Size = UDim2.new(1, -138, 0, 16)
    local v85 = string.format
    local v86 = "%s %d"
    local v87 = u5.TOKEN_DISPLAY_NAME or "\236\157\152\235\162\176 \236\166\157\237\145\156"
    local v88 = u73.priceToken
    local v89 = tonumber(v88)
    local v90
    if v89 then
        local v91 = math.floor(v89)
        local v92 = v91 < 0 and 0 or v91
        v90 = v92 > 2000000000 and 2000000000 or v92
    else
        v90 = 0
    end
    v84.Text = v85(v86, v87, v90 or 0)
    v84.Parent = v75
    local u93 = Instance.new("TextButton")
    u93.Name = "BuyBtn"
    u93.TextColor3 = Color3.fromRGB(255, 255, 255)
    u93.Font = Enum.Font.GothamBold
    u93.TextSize = p74 and 15 or 16
    u93.BorderSizePixel = 0
    u93.Size = UDim2.new(0, p74 and 92 or 102, 0, p74 and 42 or 46)
    u93.Position = UDim2.new(1, -(p74 and 104 or 114), 0.5, -(p74 and 21 or 23))
    u93.Parent = v75
    local v94 = Instance.new("UICorner")
    v94.CornerRadius = UDim.new(0, 12)
    v94.Parent = u93
    local v95 = Instance.new("UIStroke")
    v95.Name = "Stroke"
    v95.Thickness = 1.2
    v95.Parent = u93
    if u93:GetAttribute("CommissionShopBound") ~= true then
        u93:SetAttribute("CommissionShopBound", true)
        u93.Activated:Connect(function() --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u12
                [3] = u73
            --]]
            if u93.Active == true then
                u12:FireServer({
                    ["action"] = "purchase",
                    ["itemId"] = u73.id
                })
            end
        end)
    end
    return v75
end
local function u115(p97) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u71
        [3] = u6
        [4] = u96
    --]]
    if not (p97 and p97.Parent) then
        return nil, nil, nil
    end
    local v98 = u22(p97, "BoardFrame", "Frame")
    local v99
    if v98 then
        v99 = u22(v98, "ShopPage", "Frame") or nil
    else
        v99 = nil
    end
    local v100
    if v99 then
        v100 = u22(v99, "ShopPlaceholderLabel", "TextLabel") or nil
    else
        v100 = nil
    end
    if not v99 then
        return nil, nil, nil
    end
    local v101 = u71
    local v102
    if p97 then
        local v103 = p97.Name
        v102 = string.sub(v103, -7) == "_Mobile"
    else
        v102 = p97
    end
    local v104 = v101(v99, v102)
    local v105 = u6.getItems()
    for _, v106 in ipairs(v105) do
        local v107 = v106.id
        if not v104:FindFirstChild("ShopItem_" .. tostring(v107)) then
            local v108 = u96
            local v109
            if p97 then
                local v110 = p97.Name
                v109 = string.sub(v110, -7) == "_Mobile"
            else
                v109 = p97
            end
            v108(v104, v106, v109)
        end
    end
    for _, v111 in ipairs(v104:GetChildren()) do
        if v111:IsA("Frame") then
            local v112 = v111.Name
            if string.sub(v112, 1, 9) == "ShopItem_" then
                local v113 = v111.Name
                local v114 = string.sub(v113, 10)
                if not u6.getItem(v114) then
                    v111:Destroy()
                end
            end
        end
    end
    if v100 then
        v100.Visible = #v105 <= 0
    end
    return v98, v99, v104
end
local function u147(p116, p117) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u50
        [3] = u35
    --]]
    local v118 = p116:FindFirstChild("DescLabel")
    local v119 = p116:FindFirstChild("StatusLabel")
    local v120 = p116:FindFirstChild("BuyBtn")
    local v121
    if v120 then
        v121 = v120:FindFirstChild("Stroke") or nil
    else
        v121 = nil
    end
    if v118 then
        local v122 = p117.description
        local v123 = type(v122) == "string" and v122 and v122 or ""
        local v124 = p117.durationSeconds
        local v125 = tonumber(v124)
        local v126
        if v125 then
            local v127 = math.floor(v125)
            local v128 = v127 < 0 and 0 or v127
            v126 = v128 > 2000000000 and 2000000000 or v128
        else
            v126 = 0
        end
        local v129 = v126 or 0
        if v129 > 0 and (p117.type == "timed_exp_buff" or p117.type == "timed_gold_buff") then
            local v130 = string.format
            local v131 = v129 / 60
            v123 = v123 .. v130(" (%d\235\182\132)", (math.ceil(v131)))
        end
        v118.Text = v123
    end
    if v119 and v120 then
        if p117.type == "timed_exp_buff" or p117.type == "timed_gold_buff" then
            local v132
            if p117.type == "timed_exp_buff" then
                local v133 = u17.shop.expMultiplier
                v132 = tonumber(v133) or 1
            else
                local v134 = u17.shop.goldMultiplier
                v132 = tonumber(v134) or 1
            end
            local v135 = (v132 - 1) * 100 + 0.5
            local v136 = math.floor(v135)
            local v137 = math.max(0, v136)
            v119.Text = string.format("%s / +%d%%", u50((u35(p117))), v137)
            v120.Text = "\234\181\172\235\167\164"
            v120.Active = true
            v120.AutoButtonColor = true
            v120.BackgroundColor3 = Color3.fromRGB(50, 130, 82)
            if v121 then
                v121.Color = Color3.fromRGB(120, 220, 160)
                return
            end
        elseif p117.type == "title_unlock" then
            local v138 = type(p117) == "table" and (p117.titleId or "") or ""
            local v139
            if (type(v138) == "string" and v138 and v138 or "") == "" then
                v139 = false
            else
                local v140 = u17.shop.equippedTitleId
                local v141 = type(v140) == "string" and v140 and v140 or ""
                local v142 = p117.titleId
                v139 = v141 == (type(v142) == "string" and v142 and v142 or "")
            end
            if v139 then
                v119.Text = "\236\131\129\237\131\156 : \236\158\165\236\176\169\236\164\145"
                v120.Text = "\236\158\165\236\176\169\236\164\145"
                v120.Active = false
                v120.AutoButtonColor = false
                v120.BackgroundColor3 = Color3.fromRGB(65, 75, 95)
                if v121 then
                    v121.Color = Color3.fromRGB(125, 145, 180)
                    return
                end
            else
                local v143 = type(p117) == "table" and (p117.titleId or "") or ""
                local v144 = type(v143) == "string" and v143 and v143 or ""
                local v145
                if v144 == "" then
                    v145 = false
                else
                    local v146 = u17.shop.ownedTitleIds
                    if type(v146) == "table" then
                        v145 = u17.shop.ownedTitleIds[v144] == true
                    else
                        v145 = false
                    end
                end
                if v145 then
                    v119.Text = "\236\131\129\237\131\156 : \235\179\180\236\156\160\236\164\145"
                    v120.Text = "\235\179\180\236\156\160\236\164\145"
                    v120.Active = false
                    v120.AutoButtonColor = false
                    v120.BackgroundColor3 = Color3.fromRGB(65, 75, 95)
                    if v121 then
                        v121.Color = Color3.fromRGB(125, 145, 180)
                        return
                    end
                else
                    v119.Text = "\236\131\129\237\131\156 : \235\175\184\235\179\180\236\156\160"
                    v120.Text = "\234\181\172\235\167\164"
                    v120.Active = true
                    v120.AutoButtonColor = true
                    v120.BackgroundColor3 = Color3.fromRGB(50, 130, 82)
                    if v121 then
                        v121.Color = Color3.fromRGB(120, 220, 160)
                        return
                    end
                end
            end
        else
            v119.Text = "\236\167\128\236\155\144\237\149\152\236\167\128 \236\149\138\235\138\148 \236\131\129\237\146\136"
            v120.Text = "\235\182\136\234\176\128"
            v120.Active = false
            v120.AutoButtonColor = false
            v120.BackgroundColor3 = Color3.fromRGB(90, 60, 60)
            if v121 then
                v121.Color = Color3.fromRGB(170, 110, 110)
            end
        end
    end
end
local function u160(p148) --[[ Line: 303 ]]
    --[[
    Upvalues:
        [1] = u115
        [2] = u6
        [3] = u147
    --]]
    local _, _, v149 = u115(p148)
    if v149 then
        for _, v150 in ipairs(u6.getItems()) do
            local v151 = v150.id
            local v152 = v149:FindFirstChild("ShopItem_" .. tostring(v151))
            if v152 then
                u147(v152, v150)
            end
        end
        local v153 = v149:FindFirstChild("Layout")
        if v153 and v153:IsA("UIListLayout") then
            local v154 = UDim2.new
            local v155 = 0
            local v156 = 0
            local v157 = 0
            local v158 = v153.AbsoluteContentSize.Y
            if p148 then
                local v159 = p148.Name
                p148 = string.sub(v159, -7) == "_Mobile"
            end
            v149.CanvasSize = v154(v155, v156, v157, v158 + (p148 and 20 or 24))
        end
    end
end
local function u162() --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u62
        [2] = u16
        [3] = u160
    --]]
    u62()
    for _, v161 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        u160(v161)
    end
end
local function u176(p163) --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u62
    --]]
    if type(p163) == "table" then
        if p163.dailyCommissionToken ~= nil then
            local v164 = u17
            local v165 = p163.dailyCommissionToken
            local v166 = tonumber(v165)
            local v167
            if v166 then
                local v168 = math.floor(v166)
                local v169 = v168 < 0 and 0 or v168
                v167 = v169 > 2000000000 and 2000000000 or v169
            else
                v167 = 0
            end
            v164.token = v167 or 0
        end
        if p163.token ~= nil then
            local v170 = u17
            local v171 = p163.token
            local v172 = tonumber(v171)
            local v173
            if v172 then
                local v174 = math.floor(v172)
                local v175 = v174 < 0 and 0 or v174
                v173 = v175 > 2000000000 and 2000000000 or v175
            else
                v173 = 0
            end
            v170.token = v173 or 0
        end
        u62()
    end
end
v8.OnClientEvent:Connect(function(p177) --[[ Line: 327 ]]
    --[[
    Upvalues:
        [1] = u176
    --]]
    u176(p177)
end)
v9.OnClientEvent:Connect(function(p178) --[[ Line: 330 ]]
    --[[
    Upvalues:
        [1] = u176
    --]]
    u176(p178)
end)
v10.OnClientEvent:Connect(function(p179) --[[ Line: 333 ]]
    --[[
    Upvalues:
        [1] = u176
    --]]
    u176(p179)
end)
v11.OnClientEvent:Connect(function(p180) --[[ Line: 336 ]]
    --[[
    Upvalues:
        [1] = u176
    --]]
    u176(p180)
end)
v13.OnClientEvent:Connect(function(p181) --[[ Line: 339 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u62
        [3] = u16
        [4] = u160
    --]]
    if type(p181) == "table" then
        local v182 = u17.shop
        local v183 = p181.expBuffSeconds
        local v184 = tonumber(v183)
        local v185
        if v184 then
            local v186 = math.floor(v184)
            local v187 = v186 < 0 and 0 or v186
            v185 = v187 > 2000000000 and 2000000000 or v187
        else
            v185 = 0
        end
        v182.expBuffSeconds = v185 or 0
        local v188 = u17.shop
        local v189 = p181.goldBuffSeconds
        local v190 = tonumber(v189)
        local v191
        if v190 then
            local v192 = math.floor(v190)
            local v193 = v192 < 0 and 0 or v192
            v191 = v193 > 2000000000 and 2000000000 or v193
        else
            v191 = 0
        end
        v188.goldBuffSeconds = v191 or 0
        local v194 = u17.shop
        local v195 = p181.ownedTitleIds
        v194.ownedTitleIds = type(v195) == "table" and (p181.ownedTitleIds or {}) or {}
        local v196 = u17.shop
        local v197 = p181.equippedTitleId
        v196.equippedTitleId = type(v197) == "string" and v197 and v197 or ""
        local v198 = u17.shop
        local v199 = p181.timeDisplayCapMinutes
        local v200 = tonumber(v199)
        local v201
        if v200 then
            local v202 = math.floor(v200)
            local v203 = v202 < 1 and 1 or v202
            v201 = v203 > 999 and 999 or v203
        else
            v201 = 999
        end
        v198.timeDisplayCapMinutes = v201 or 999
        local v204 = u17.shop
        local v205 = p181.expMultiplier
        v204.expMultiplier = tonumber(v205) or 1
        local v206 = u17.shop
        local v207 = p181.goldMultiplier
        v206.goldMultiplier = tonumber(v207) or 1
        u62()
        for _, v208 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
            u160(v208)
        end
    end
end)
v15.OnClientEvent:Connect(function(p209) --[[ Line: 350 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u62
        [3] = u16
        [4] = u160
    --]]
    if type(p209) == "table" then
        local v210 = u17.shop
        local v211 = p209.expBuffSeconds
        local v212 = tonumber(v211)
        local v213
        if v212 then
            local v214 = math.floor(v212)
            local v215 = v214 < 0 and 0 or v214
            v213 = v215 > 2000000000 and 2000000000 or v215
        else
            v213 = 0
        end
        v210.expBuffSeconds = v213 or 0
        local v216 = u17.shop
        local v217 = p209.goldBuffSeconds
        local v218 = tonumber(v217)
        local v219
        if v218 then
            local v220 = math.floor(v218)
            local v221 = v220 < 0 and 0 or v220
            v219 = v221 > 2000000000 and 2000000000 or v221
        else
            v219 = 0
        end
        v216.goldBuffSeconds = v219 or 0
        local v222 = u17.shop
        local v223 = p209.timeDisplayCapMinutes
        local v224 = tonumber(v223)
        local v225
        if v224 then
            local v226 = math.floor(v224)
            local v227 = v226 < 1 and 1 or v226
            v225 = v227 > 999 and 999 or v227
        else
            v225 = 999
        end
        v222.timeDisplayCapMinutes = v225 or (u17.shop.timeDisplayCapMinutes or 999)
        local v228 = u17.shop
        local v229 = p209.expMultiplier
        v228.expMultiplier = tonumber(v229) or (u17.shop.expMultiplier or 1)
        local v230 = u17.shop
        local v231 = p209.goldMultiplier
        v230.goldMultiplier = tonumber(v231) or (u17.shop.goldMultiplier or 1)
        u62()
        for _, v232 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
            u160(v232)
        end
    end
end)
v14.OnClientEvent:Connect(function(p233) --[[ Line: 359 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v234 = type(p233) == "table" and p233 and p233 or {}
    local u235 = v234.text
    local u236 = v234.isError == true
    if not pcall(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u235
            [3] = u236
        --]]
        local v237 = u3
        local v238 = {
            ["Title"] = "\236\157\152\235\162\176 \236\131\129\236\160\144"
        }
        local v239 = u235 or ""
        v238.Text = tostring(v239)
        v238.Duration = u236 and 3 or 2.5
        v237:SetCore("SendNotification", v238)
    end) then
        warn("[CommissionShopUI] " .. tostring(u235))
    end
end)
task.defer(function() --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u62
        [3] = u16
        [4] = u160
        [5] = u12
    --]]
    u7.waitUntilReady(5)
    u62()
    for _, v240 in ipairs({ u16:FindFirstChild("CommissionBoardGui"), u16:FindFirstChild("CommissionBoardGui_Mobile") }) do
        u160(v240)
    end
    u12:FireServer({
        ["action"] = "requestSync"
    })
end)
u7.modeChanged:Connect(function() --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u162
    --]]
    task.defer(u162)
end)
u16.ChildAdded:Connect(function(p241) --[[ Line: 373 ]]
    --[[
    Upvalues:
        [1] = u162
    --]]
    if p241 and (p241.Name == "CommissionBoardGui" or p241.Name == "CommissionBoardGui_Mobile") then
        task.defer(u162)
    end
end)
print("[CommissionShopUIController] initialized")