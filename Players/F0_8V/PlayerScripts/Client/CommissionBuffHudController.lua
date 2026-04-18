local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Util.PlatformGui)
local u5 = v3:WaitForChild("CommissionShopRequest")
local v6 = v3:WaitForChild("CommissionShopBuffSync")
local u7 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u8 = nil
local u9 = nil
local u10 = {
    ["expBuffSeconds"] = 0,
    ["goldBuffSeconds"] = 0,
    ["timeDisplayCapMinutes"] = 999,
    ["expMultiplier"] = 1,
    ["goldMultiplier"] = 1
}
local u11 = {
    ["expIcon"] = nil,
    ["goldIcon"] = nil,
    ["expLabel"] = nil,
    ["goldLabel"] = nil
}
local function u17(p12, p13, p14) --[[ Line: 29 ]]
    if not p12 then
        return nil
    end
    for _, v15 in ipairs(p12:GetDescendants()) do
        if not p14 or v15:IsA(p14) then
            for _, v16 in ipairs(p13) do
                if v15.Name == v16 then
                    return v15
                end
            end
        end
    end
    return nil
end
local function u32(p18) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v19 = tonumber(p18)
    local v20
    if v19 then
        local v21 = math.floor(v19)
        local v22 = v21 < 0 and 0 or v21
        v20 = v22 > 2000000000 and 2000000000 or v22
    else
        v20 = 0
    end
    local v23 = v20 or 0
    if v23 <= 0 then
        return ""
    else
        local v24 = u10.timeDisplayCapMinutes
        local v25 = tonumber(v24)
        local v26
        if v25 then
            local v27 = math.floor(v25)
            local v28 = v27 < 1 and 1 or v27
            v26 = v28 > 999 and 999 or v28
        else
            v26 = 999
        end
        local v29 = v26 or 999
        local v30 = v23 / 60
        local v31 = math.ceil(v30)
        if v29 < v31 then
            return tostring(v29) .. "\235\182\132+"
        else
            return tostring(v31) .. "\235\182\132"
        end
    end
end
local function u35() --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not u9 then
        return nil
    end
    local v33 = u9:FindFirstChild("CommissionBuffHost")
    if v33 then
        return v33
    end
    local v34 = Instance.new("Frame")
    v34.Name = "CommissionBuffHost"
    v34.BackgroundTransparency = 1
    v34.BorderSizePixel = 0
    v34.Size = UDim2.new(0, 116, 0, 88)
    v34.Position = UDim2.new(1, 8, 0, 2)
    v34.Parent = u9
    return v34
end
local function u45(p36, p37, p38, p39) --[[ Line: 65 ]]
    local v40 = p36:FindFirstChild(p37)
    if v40 then
        return v40
    end
    local v41 = Instance.new("Frame")
    v41.Name = p37
    v41.BackgroundColor3 = Color3.fromRGB(30, 36, 46)
    v41.BackgroundTransparency = 0.12
    v41.BorderSizePixel = 0
    v41.Size = UDim2.new(1, 0, 0, 40)
    v41.Position = UDim2.new(0, 0, 0, p39 == 1 and 0 or 48)
    v41.Parent = p36
    local v42 = Instance.new("UICorner")
    v42.CornerRadius = UDim.new(0, 10)
    v42.Parent = v41
    local v43 = Instance.new("UIStroke")
    v43.Color = Color3.fromRGB(90, 110, 140)
    v43.Thickness = 1.1
    v43.Parent = v41
    local v44 = Instance.new("TextLabel")
    v44.Name = "TitleLabel"
    v44.BackgroundTransparency = 1
    v44.Font = Enum.Font.GothamBold
    v44.TextSize = 13
    v44.TextColor3 = Color3.fromRGB(255, 255, 255)
    v44.TextXAlignment = Enum.TextXAlignment.Left
    v44.Text = p38
    v44.Position = UDim2.new(0, 8, 0, 3)
    v44.Size = UDim2.new(1, -16, 0, 15)
    v44.Parent = v41
    return v41
end
local function u48(p46) --[[ Line: 100 ]]
    if not p46 then
        return nil
    end
    local v47 = p46:FindFirstChild("TimeLabel")
    if not (v47 and v47:IsA("TextLabel")) then
        v47 = Instance.new("TextLabel")
        v47.Name = "TimeLabel"
        v47.Parent = p46
    end
    v47.BackgroundTransparency = 1
    v47.Font = Enum.Font.GothamBold
    v47.TextSize = 22
    v47.TextColor3 = Color3.fromRGB(255, 60, 60)
    v47.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v47.TextStrokeTransparency = 0
    v47.TextScaled = false
    v47.TextWrapped = false
    v47.TextXAlignment = Enum.TextXAlignment.Center
    v47.TextYAlignment = Enum.TextYAlignment.Center
    v47.Text = ""
    v47.Size = UDim2.new(1, -8, 1, -20)
    v47.Position = UDim2.new(0, 4, 0, 18)
    v47.ZIndex = 10
    return v47
end
local function u54() --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u8
        [4] = u9
        [5] = u17
        [6] = u35
        [7] = u45
        [8] = u11
        [9] = u48
    --]]
    local v49 = u4.find(u7, "MainHUD") or (u7:FindFirstChild("MainHUD") or u7:FindFirstChild("MainHUD_Mobile"))
    if not v49 then
        return false
    end
    local v50 = v49:FindFirstChild("TopLeft")
    if not v50 then
        return false
    end
    u8 = v49
    u9 = v50
    local v51 = u17(v49, {
        "ExpBuffIcon",
        "CommissionExpBuffIcon",
        "BuffIcon_Exp",
        "BuffExpIcon"
    }, "GuiObject")
    local v52 = u17(v49, {
        "GoldBuffIcon",
        "CommissionGoldBuffIcon",
        "BuffIcon_Gold",
        "BuffGoldIcon"
    }, "GuiObject")
    if not (v51 and v52) then
        local v53 = u35()
        v51 = v51 or u45(v53, "ExpBuffIcon", "EXP", 1)
        v52 = v52 or u45(v53, "GoldBuffIcon", "GOLD", 2)
    end
    u11.expIcon = v51
    u11.goldIcon = v52
    u11.expLabel = u48(v51)
    u11.goldLabel = u48(v52)
    return true
end
local function u83() --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u54
        [4] = u11
        [5] = u10
        [6] = u32
    --]]
    if u8 and (u8.Parent and (u9 and u9.Parent)) or u54() then
        local v55 = u11.expIcon
        local v56 = u11.expLabel
        local v57 = u10.expBuffSeconds
        if v55 and v56 then
            local v58 = tonumber(v57)
            local v59
            if v58 then
                local v60 = math.floor(v58)
                local v61 = v60 < 0 and 0 or v60
                v59 = v61 > 2000000000 and 2000000000 or v61
            else
                v59 = 0
            end
            local v62 = (v59 or 0) > 0
            v55.Visible = v62
            v56.Text = v62 and u32(v57) or ""
        end
        local v63 = u11.goldIcon
        local v64 = u11.goldLabel
        local v65 = u10.goldBuffSeconds
        if v63 and v64 then
            local v66 = tonumber(v65)
            local v67
            if v66 then
                local v68 = math.floor(v66)
                local v69 = v68 < 0 and 0 or v68
                v67 = v69 > 2000000000 and 2000000000 or v69
            else
                v67 = 0
            end
            local v70 = (v67 or 0) > 0
            v63.Visible = v70
            v64.Text = v70 and u32(v65) or ""
        end
        local v71 = u9
        if v71 then
            v71 = u9:FindFirstChild("CommissionBuffHost")
        end
        if v71 and (u11.expIcon == v71:FindFirstChild("ExpBuffIcon") or u11.goldIcon == v71:FindFirstChild("GoldBuffIcon")) then
            local v72 = true
            local v73 = u10.expBuffSeconds
            local v74 = tonumber(v73)
            local v75
            if v74 then
                local v76 = math.floor(v74)
                local v77 = v76 < 0 and 0 or v76
                v75 = v77 > 2000000000 and 2000000000 or v77
            else
                v75 = 0
            end
            if (v75 or 0) <= 0 then
                local v78 = u10.goldBuffSeconds
                local v79 = tonumber(v78)
                local v80
                if v79 then
                    local v81 = math.floor(v79)
                    local v82 = v81 < 0 and 0 or v81
                    v80 = v82 > 2000000000 and 2000000000 or v82
                else
                    v80 = 0
                end
                v72 = (v80 or 0) > 0
            end
            v71.Visible = v72
        end
    end
end
v6.OnClientEvent:Connect(function(p84) --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u83
    --]]
    local v85 = type(p84) == "table" and p84 and p84 or {}
    local v86 = u10
    local v87 = v85.expBuffSeconds
    local v88 = tonumber(v87)
    local v89
    if v88 then
        local v90 = math.floor(v88)
        local v91 = v90 < 0 and 0 or v90
        v89 = v91 > 2000000000 and 2000000000 or v91
    else
        v89 = 0
    end
    v86.expBuffSeconds = v89 or 0
    local v92 = u10
    local v93 = v85.goldBuffSeconds
    local v94 = tonumber(v93)
    local v95
    if v94 then
        local v96 = math.floor(v94)
        local v97 = v96 < 0 and 0 or v96
        v95 = v97 > 2000000000 and 2000000000 or v97
    else
        v95 = 0
    end
    v92.goldBuffSeconds = v95 or 0
    local v98 = u10
    local v99 = v85.timeDisplayCapMinutes
    local v100 = tonumber(v99)
    local v101
    if v100 then
        local v102 = math.floor(v100)
        local v103 = v102 < 1 and 1 or v102
        v101 = v103 > 999 and 999 or v103
    else
        v101 = 999
    end
    v98.timeDisplayCapMinutes = v101 or 999
    local v104 = u10
    local v105 = v85.expMultiplier
    v104.expMultiplier = tonumber(v105) or 1
    local v106 = u10
    local v107 = v85.goldMultiplier
    v106.goldMultiplier = tonumber(v107) or 1
    u83()
end)
task.defer(function() --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u54
        [3] = u83
        [4] = u5
    --]]
    u4.waitUntilReady(5)
    u54()
    u83()
    u5:FireServer({
        ["action"] = "requestSync"
    })
end)
u4.modeChanged:Connect(function() --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u11
        [4] = u54
        [5] = u83
    --]]
    task.defer(function() --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u11
            [4] = u54
            [5] = u83
        --]]
        u8 = nil
        u9 = nil
        u11.expIcon = nil
        u11.goldIcon = nil
        u11.expLabel = nil
        u11.goldLabel = nil
        u54()
        u83()
    end)
end)
u7.ChildAdded:Connect(function(p108) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u11
        [4] = u54
        [5] = u83
    --]]
    if p108 and (p108.Name == "MainHUD" or p108.Name == "MainHUD_Mobile") then
        task.defer(function() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u9
                [3] = u11
                [4] = u54
                [5] = u83
            --]]
            u8 = nil
            u9 = nil
            u11.expIcon = nil
            u11.goldIcon = nil
            u11.expLabel = nil
            u11.goldLabel = nil
            u54()
            u83()
        end)
    end
end)
print("[CommissionBuffHudController] initialized")