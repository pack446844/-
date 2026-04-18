local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Util.PlatformGui)
local u6 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v7 = v4:WaitForChild("WorldBossUi")
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = 0
local function u25(p16) --[[ Line: 35 ]]
    local v17 = 0
    local v18 = tonumber(p16)
    local v19
    if v18 then
        local v20 = math.floor(v18)
        local v21 = v20 < 0 and 0 or v20
        v19 = v21 > 2000000000 and 2000000000 or v21
    else
        v19 = 0
    end
    local v22 = math.max(v17, v19 or 0)
    local v23 = tostring(v22)
    repeat
        local v24
        v23, v24 = v23:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
    until v24 <= 0
    return v23
end
local function u27() --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u5
        [4] = u11
        [5] = u12
        [6] = u13
    --]]
    if u9 and u10 then
        local v26
        if u5.isReady and u5.isReady() then
            v26 = u5.useMobileGui()
        else
            v26 = u5.computeMode
            if v26 then
                v26 = u5.computeMode() == "mobile"
            end
        end
        u10.Size = v26 and UDim2.fromScale(0.88, 0.74) or UDim2.fromScale(0.52, 0.68)
        u10.Position = UDim2.fromScale(0.5, 0.5)
        if u11 then
            u11.TextSize = v26 and 22 or 26
        end
        if u12 then
            u12.TextSize = v26 and 14 or 16
        end
        if u13 then
            u13.ScrollBarThickness = v26 and 8 or 10
        end
    end
end
local function u29() --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if u14 then
        for _, v28 in ipairs(u14:GetChildren()) do
            if not (v28:IsA("UIListLayout") or v28:IsA("UIPadding")) then
                v28:Destroy()
            end
        end
    end
end
local function u47() --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u9
        [4] = u10
        [5] = u11
        [6] = u12
        [7] = u15
        [8] = u13
        [9] = u14
        [10] = u5
        [11] = u27
    --]]
    if not (u8 and u8.Parent) then
        u8 = Instance.new("ScreenGui")
        u8.Name = "WorldBossResultGui"
        u8.ResetOnSpawn = false
        u8.IgnoreGuiInset = false
        u8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u8.Parent = u6
        u9 = Instance.new("Frame")
        u9.Name = "Backdrop"
        u9.Size = UDim2.fromScale(1, 1)
        u9.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        u9.BackgroundTransparency = 0.35
        u9.Visible = false
        u9.Parent = u8
        u10 = Instance.new("Frame")
        u10.Name = "Panel"
        u10.AnchorPoint = Vector2.new(0.5, 0.5)
        u10.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
        u10.BorderSizePixel = 0
        u10.Parent = u9
        local v30 = u10
        local v31 = Instance.new("UICorner")
        v31.CornerRadius = UDim.new(0, 20)
        v31.Parent = v30
        local v32 = Instance.new("UIStroke")
        v32.Color = Color3.fromRGB(255, 180, 90)
        v32.Thickness = 1.4
        v32.Transparency = 0.05
        v32.Parent = u10
        u11 = Instance.new("TextLabel")
        u11.Name = "Title"
        u11.BackgroundTransparency = 1
        u11.Position = UDim2.fromScale(0.05, 0.03)
        u11.Size = UDim2.fromScale(0.72, 0.08)
        u11.Font = Enum.Font.GothamBold
        u11.TextColor3 = Color3.fromRGB(255, 230, 190)
        u11.TextXAlignment = Enum.TextXAlignment.Left
        u11.Parent = u10
        u12 = Instance.new("TextLabel")
        u12.Name = "Sub"
        u12.BackgroundTransparency = 1
        u12.Position = UDim2.fromScale(0.05, 0.105)
        u12.Size = UDim2.fromScale(0.72, 0.05)
        u12.Font = Enum.Font.Gotham
        u12.TextColor3 = Color3.fromRGB(215, 215, 215)
        u12.TextXAlignment = Enum.TextXAlignment.Left
        u12.Parent = u10
        local v33 = Instance.new("TextButton")
        v33.Name = "Close"
        v33.AnchorPoint = Vector2.new(1, 0)
        v33.Position = UDim2.fromScale(0.95, 0.045)
        v33.Size = UDim2.fromScale(0.11, 0.065)
        v33.BackgroundColor3 = Color3.fromRGB(48, 48, 58)
        v33.BorderSizePixel = 0
        v33.Font = Enum.Font.GothamBold
        v33.Text = "\235\139\171\234\184\176"
        v33.TextColor3 = Color3.fromRGB(255, 255, 255)
        v33.TextScaled = true
        v33.Parent = u10
        local v34 = Instance.new("UICorner")
        v34.CornerRadius = UDim.new(0, 12)
        v34.Parent = v33
        v33.MouseButton1Click:Connect(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u9
            --]]
            u15 = u15 + 1
            u9.Visible = false
        end)
        local u35 = Instance.new("Frame")
        u35.Name = "Header"
        u35.Position = UDim2.fromScale(0.05, 0.18)
        u35.Size = UDim2.fromScale(0.9, 0.07)
        u35.BackgroundColor3 = Color3.fromRGB(34, 34, 42)
        u35.BorderSizePixel = 0
        u35.Parent = u10
        local v36 = Instance.new("UICorner")
        v36.CornerRadius = UDim.new(0, 12)
        v36.Parent = u35
        local function v42(p37, p38, p39, p40) --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            local v41 = Instance.new("TextLabel")
            v41.BackgroundTransparency = 1
            v41.Position = p38
            v41.Size = p39
            v41.Font = Enum.Font.GothamBold
            v41.Text = p37
            v41.TextSize = 15
            v41.TextColor3 = Color3.fromRGB(255, 245, 220)
            v41.TextXAlignment = p40 or Enum.TextXAlignment.Left
            v41.Parent = u35
            return v41
        end
        v42("\235\147\177\236\136\152", UDim2.fromScale(0.04, 0), UDim2.fromScale(0.14, 1), Enum.TextXAlignment.Left)
        v42("\236\157\180\235\166\132", UDim2.fromScale(0.2, 0), UDim2.fromScale(0.42, 1), Enum.TextXAlignment.Left)
        v42("\235\141\176\235\175\184\236\167\128", UDim2.fromScale(0.64, 0), UDim2.fromScale(0.32, 1), Enum.TextXAlignment.Right)
        u13 = Instance.new("ScrollingFrame")
        u13.Name = "Rows"
        u13.Position = UDim2.fromScale(0.05, 0.27)
        u13.Size = UDim2.fromScale(0.9, 0.63)
        u13.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        u13.BorderSizePixel = 0
        u13.CanvasSize = UDim2.new()
        u13.AutomaticCanvasSize = Enum.AutomaticSize.Y
        u13.ScrollBarImageTransparency = 0.25
        u13.Parent = u10
        local v43 = u13
        local v44 = Instance.new("UICorner")
        v44.CornerRadius = UDim.new(0, 14)
        v44.Parent = v43
        u14 = Instance.new("Frame")
        u14.Name = "RowHolder"
        u14.Size = UDim2.new(1, -10, 0, 0)
        u14.Position = UDim2.new(0, 0, 0, 0)
        u14.BackgroundTransparency = 1
        u14.AutomaticSize = Enum.AutomaticSize.Y
        u14.Parent = u13
        local v45 = Instance.new("UIListLayout")
        v45.Padding = UDim.new(0, 6)
        v45.Parent = u14
        local v46 = Instance.new("UIPadding")
        v46.PaddingTop = UDim.new(0, 8)
        v46.PaddingBottom = UDim.new(0, 8)
        v46.PaddingLeft = UDim.new(0, 8)
        v46.PaddingRight = UDim.new(0, 8)
        v46.Parent = u14
        if u5.modeChanged then
            u5.modeChanged:Connect(function() --[[ Line: 204 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27()
            end)
        end
        u27()
    end
end
local function u64(p48) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u14
        [3] = u25
    --]]
    local u49
    if u5.isReady and u5.isReady() then
        u49 = u5.useMobileGui()
    else
        u49 = u5.computeMode
        if u49 then
            u49 = u5.computeMode() == "mobile"
        end
    end
    local u50 = Instance.new("Frame")
    local v51 = p48.rank or 0
    u50.Name = "Row_" .. tostring(v51)
    u50.Size = UDim2.new(1, 0, 0, u49 and 42 or 38)
    u50.BackgroundColor3 = p48.rank == 1 and Color3.fromRGB(72, 44, 18) or Color3.fromRGB(28, 28, 36)
    u50.BorderSizePixel = 0
    u50.Parent = u14
    local v52 = Instance.new("UICorner")
    v52.CornerRadius = UDim.new(0, 10)
    v52.Parent = u50
    local v53 = Instance.new("UIStroke")
    v53.Color = p48.rank == 1 and Color3.fromRGB(255, 205, 110) or Color3.fromRGB(58, 58, 70)
    v53.Thickness = 1
    v53.Transparency = 0.25
    v53.Parent = u50
    local function v61(p54, p55, p56, p57, p58, p59) --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u50
        --]]
        local v60 = Instance.new("TextLabel")
        v60.BackgroundTransparency = 1
        v60.Position = p55
        v60.Size = p56
        v60.Font = p59 and Enum.Font.GothamBold or Enum.Font.Gotham
        v60.Text = tostring(p54 or "")
        v60.TextSize = u49 and 15 or 16
        v60.TextColor3 = p58 or Color3.fromRGB(245, 245, 245)
        v60.TextXAlignment = p57 or Enum.TextXAlignment.Left
        v60.Parent = u50
        return v60
    end
    local v62 = p48.rank or "-"
    v61(tostring(v62), UDim2.fromScale(0.03, 0), UDim2.fromScale(0.13, 1), Enum.TextXAlignment.Left, p48.rank == 1 and Color3.fromRGB(255, 220, 120) or Color3.fromRGB(255, 255, 255), true)
    local v63 = p48.name
    v61(type(v63) == "string" and v63 and v63 or "", UDim2.fromScale(0.19, 0), UDim2.fromScale(0.43, 1), Enum.TextXAlignment.Left, Color3.fromRGB(245, 245, 245), p48.rank <= 3)
    v61(u25(p48.damage), UDim2.fromScale(0.63, 0), UDim2.fromScale(0.33, 1), Enum.TextXAlignment.Right, Color3.fromRGB(255, 245, 220), p48.rank <= 3)
end
local function u82(p65) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u47
        [2] = u29
        [3] = u11
        [4] = u12
        [5] = u14
        [6] = u64
        [7] = u9
        [8] = u15
    --]]
    u47()
    u29()
    local v66
    if type(p65) == "table" then
        local v67 = p65.rows
        v66 = type(v67) == "table" and (p65.rows or {}) or {}
    else
        v66 = {}
    end
    local v68 = u11
    local v69 = p65.title or "\236\155\148\235\147\156\235\179\180\236\138\164"
    v68.Text = tostring(v69) .. " \235\158\173\237\130\185"
    local v70 = u12
    local v71 = p65.zoneName or "\236\155\148\235\147\156\235\179\180\236\138\164 \236\167\128\236\151\173"
    local v72 = tostring(v71)
    local v73 = #v66
    v70.Text = v72 .. "  |  \236\176\184\236\151\172\236\158\144 " .. tostring(v73) .. "\235\170\133"
    if #v66 <= 0 then
        local v74 = Instance.new("TextLabel")
        v74.Size = UDim2.new(1, 0, 0, 42)
        v74.BackgroundTransparency = 1
        v74.Font = Enum.Font.Gotham
        v74.Text = "\237\145\156\236\139\156\237\149\160 \236\176\184\236\151\172\236\158\144\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164."
        v74.TextColor3 = Color3.fromRGB(230, 230, 230)
        v74.TextSize = 16
        v74.Parent = u14
    else
        for _, v75 in ipairs(v66) do
            u64(v75)
        end
    end
    u9.Visible = true
    u15 = u15 + 1
    local u76 = u15
    if p65 then
        p65 = p65.autoCloseSeconds
    end
    local v77 = tonumber(p65)
    local v78
    if v77 then
        local v79 = math.floor(v77)
        local v80 = v79 < 0 and 0 or v79
        v78 = v80 > 120 and 120 or v80
    else
        v78 = 0
    end
    local v81 = v78 or 0
    if v81 > 0 then
        task.delay(v81, function() --[[ Line: 270 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u15
                [3] = u76
            --]]
            if u9 and (u9.Parent and u15 == u76) then
                u9.Visible = false
            end
        end)
    end
end
v7.OnClientEvent:Connect(function(p83) --[[ Line: 276 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u82
    --]]
    if type(p83) == "table" then
        local v84 = p83.action
        local v85 = type(v84) == "string" and v84 and v84 or ""
        if v85 == "spawn_notice" then
            local v86 = p83.bossName
            local v87 = type(v86) == "string" and v86 and v86 or ""
            local v88 = p83.zoneName
            local v89 = type(v88) == "string" and v88 and v88 or ""
            local v90 = p83.title
            local u91 = (type(v90) == "string" and v90 and v90 or "") == "" and "\236\155\148\235\147\156\235\179\180\236\138\164" or (p83.title or "\236\155\148\235\147\156\235\179\180\236\138\164")
            local u92 = v87 .. " \236\182\156\237\152\132\n" .. v89
            if not pcall(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u91
                    [3] = u92
                --]]
                local v93 = u3
                local v94 = {}
                local v95 = u91
                v94.Title = (type(v95) == "string" and v95 and v95 or "") == "" and "\236\155\148\235\147\156\235\179\180\236\138\164" or (u91 or "\236\155\148\235\147\156\235\179\180\236\138\164")
                local v96 = u92 or ""
                v94.Text = tostring(v96)
                v94.Duration = 5
                v93:SetCore("SendNotification", v94)
            end) then
                warn("[WorldBossUI] " .. tostring(u92))
                return
            end
        elseif v85 == "claimed_notice" then
            local v97 = p83.title
            local u98 = (type(v97) == "string" and v97 and v97 or "") ~= "" and p83.title
            if not u98 then
                local v99 = p83.bossName
                u98 = (type(v99) == "string" and v99 and v99 or "") == "" and "\236\155\148\235\147\156\235\179\180\236\138\164" or (p83.bossName or "\236\155\148\235\147\156\235\179\180\236\138\164")
            end
            local v100 = p83.text
            local u101 = (type(v100) == "string" and v100 and v100 or "") ~= "" and p83.text
            if not u101 then
                local v102 = p83.bossName
                u101 = (type(v102) == "string" and v102 and v102 or "") ~= "" and p83.bossName .. " \235\179\180\236\131\129\236\157\128 \236\152\164\235\138\152 \236\157\180\235\175\184 \235\176\155\236\149\152\236\138\181\235\139\136\235\139\164." or "\236\152\164\235\138\152 \236\157\180\235\175\184 \236\155\148\235\147\156\235\179\180\236\138\164 \235\179\180\236\131\129\236\157\132 \235\176\155\236\149\152\236\138\181\235\139\136\235\139\164."
            end
            if not pcall(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u98
                    [3] = u101
                --]]
                local v103 = u3
                local v104 = {}
                local v105 = u98
                v104.Title = (type(v105) == "string" and v105 and v105 or "") == "" and "\236\155\148\235\147\156\235\179\180\236\138\164" or (u98 or "\236\155\148\235\147\156\235\179\180\236\138\164")
                local v106 = u101 or ""
                v104.Text = tostring(v106)
                v104.Duration = 5
                v103:SetCore("SendNotification", v104)
            end) then
                warn("[WorldBossUI] " .. tostring(u101))
                return
            end
        elseif v85 == "special_drop_notice" then
            local v107 = p83.itemName
            local v108 = type(v107) == "string" and v107 and v107 or ""
            local v109 = p83.text
            local u110 = type(v109) == "string" and v109 and v109 or ""
            if u110 == "" then
                u110 = ((v108 == "" or not v108) and "\237\138\185\235\179\132 \235\179\180\236\131\129" or v108) .. " \237\154\141\235\147\157!"
            end
            local v111 = p83.title
            local u112 = (type(v111) == "string" and v111 and v111 or "") ~= "" and p83.title
            if not u112 then
                local v113 = p83.bossName
                u112 = (type(v113) == "string" and v113 and v113 or "") ~= "" and p83.bossName or "\236\155\148\235\147\156\235\179\180\236\138\164"
            end
            if not pcall(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u112
                    [3] = u110
                --]]
                local v114 = u3
                local v115 = {}
                local v116 = u112
                v115.Title = (type(v116) == "string" and v116 and v116 or "") == "" and "\236\155\148\235\147\156\235\179\180\236\138\164" or (u112 or "\236\155\148\235\147\156\235\179\180\236\138\164")
                local v117 = u110 or ""
                v115.Text = tostring(v117)
                v115.Duration = 5
                v114:SetCore("SendNotification", v115)
            end) then
                warn("[WorldBossUI] " .. tostring(u110))
                return
            end
        elseif v85 == "show_results" then
            u82(p83)
        end
    end
end)