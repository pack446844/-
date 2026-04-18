local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v3 = game:GetService("CollectionService")
local v4 = game:GetService("ReplicatedStorage")
local u5 = require(v4.Shared.Defs.UIConfig)
local u6 = v1.LocalPlayer
local u7 = u6:WaitForChild("PlayerGui")
local u8 = {}
local u9 = nil
local u10 = 0
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local function u22() --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u7
        [4] = u13
        [5] = u5
        [6] = u14
        [7] = u15
        [8] = u16
        [9] = u17
    --]]
    if not (u11 and (u11.Parent and (u12 and u12.Parent))) then
        u11 = u7:FindFirstChild("BossHudGui")
        if u11 then
            u11:Destroy()
        end
        u11 = Instance.new("ScreenGui")
        u11.Name = "BossHudGui"
        u11.ResetOnSpawn = false
        u11.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u11.IgnoreGuiInset = false
        u11.Parent = u7
        u12 = Instance.new("Frame")
        u12.Name = "Root"
        u12.AnchorPoint = Vector2.new(0.5, 0)
        u12.Position = UDim2.new(0.5, 0, 0, 12)
        u12.Size = UDim2.new(0, 640, 0, 74)
        u12.BackgroundTransparency = 1
        u12.Visible = false
        u12.Parent = u11
        u13 = Instance.new("TextLabel")
        u13.Name = "TypeLabel"
        u13.BackgroundTransparency = 1
        u13.Position = UDim2.new(0, 0, 0, 0)
        u13.Size = UDim2.new(0, 170, 0, 24)
        u13.Font = Enum.Font.GothamBold
        u13.TextSize = 22
        u13.TextXAlignment = Enum.TextXAlignment.Left
        u13.TextColor3 = u5.BOSS_MAIN_COLOR
        u13.TextStrokeTransparency = 0.2
        u13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        u13.Parent = u12
        u14 = Instance.new("TextLabel")
        u14.Name = "NameLabel"
        u14.BackgroundTransparency = 1
        u14.Position = UDim2.new(0, 176, 0, 0)
        u14.Size = UDim2.new(1, -176, 0, 24)
        u14.Font = Enum.Font.GothamBold
        u14.TextSize = 22
        u14.TextXAlignment = Enum.TextXAlignment.Left
        u14.TextColor3 = u5.BOSS_NAME_COLOR
        u14.TextStrokeTransparency = 0.2
        u14.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        u14.Parent = u12
        u15 = Instance.new("Frame")
        u15.Name = "HpBack"
        u15.Position = UDim2.new(0, 0, 0, 34)
        u15.Size = UDim2.new(1, 0, 0, 24)
        u15.BackgroundColor3 = u5.BOSS_BAR_BACK_COLOR
        u15.BorderSizePixel = 0
        u15.Parent = u12
        local v18 = u15
        local v19 = Instance.new("UICorner")
        v19.CornerRadius = UDim.new(0, 6)
        v19.Parent = v18
        u16 = Instance.new("Frame")
        u16.Name = "HpFill"
        u16.Size = UDim2.new(1, 0, 1, 0)
        u16.BackgroundColor3 = u5.BOSS_BAR_FILL_COLOR
        u16.BorderSizePixel = 0
        u16.Parent = u15
        local v20 = u16
        local v21 = Instance.new("UICorner")
        v21.CornerRadius = UDim.new(0, 6)
        v21.Parent = v20
        u17 = Instance.new("TextLabel")
        u17.Name = "HpText"
        u17.BackgroundTransparency = 1
        u17.Size = UDim2.new(1, 0, 1, 0)
        u17.Font = Enum.Font.GothamBold
        u17.TextSize = 18
        u17.TextColor3 = Color3.fromRGB(255, 255, 255)
        u17.TextStrokeTransparency = 0.2
        u17.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        u17.Parent = u15
    end
end
local function u41(p23) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u12
        [3] = u5
        [4] = u13
        [5] = u14
        [6] = u16
        [7] = u17
    --]]
    local v24
    if p23 then
        v24 = p23:FindFirstChildOfClass("Humanoid")
    else
        v24 = p23
    end
    if v24 and v24.Health > 0 then
        u22()
        local v25 = p23 and (p23:GetAttribute("MonsterBossKind") or "") or ""
        local v26 = tostring(v25)
        local v27, v28
        if v26 == "mini_boss" then
            v27 = u5.BOSS_MINI_COLOR
            v28 = "\240\159\152\136 [\235\175\184\235\139\136\235\179\180\236\138\164]"
        elseif v26 == "world_boss" then
            v27 = u5.BOSS_MAIN_COLOR
            v28 = "\240\159\145\145 [\236\155\148\235\147\156\235\179\180\236\138\164]"
        else
            v27 = u5.BOSS_MAIN_COLOR
            v28 = "\240\159\145\185 [\235\179\180\236\138\164]"
        end
        u13.Text = v28
        u13.TextColor3 = v27
        local v29 = u14
        local v30
        if p23 then
            v30 = p23:GetAttribute("MonsterLevel")
        else
            v30 = p23
        end
        local v31 = tonumber(v30) or 1
        local v32 = p23 and p23:GetAttribute("MonsterDisplayName") or "\235\179\180\236\138\164"
        local v33 = tostring(v32)
        v29.Text = "LV." .. tostring(v31) .. " " .. v33
        local v34 = (v24.MaxHealth or 1) + 0.5
        local v35 = math.floor(v34)
        local v36 = math.max(1, v35)
        local v37 = (v24.Health or 0) + 0.5
        local v38 = math.floor(v37)
        local v39 = math.clamp(v38, 0, v36)
        local v40 = v39 / v36
        u16.Size = UDim2.new(v40, 0, 1, 0)
        u17.Text = tostring(v39) .. " / " .. tostring(v36)
        u12.Visible = true
    else
        u22()
        u12.Visible = false
    end
end
local function v43(p42) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u22
        [4] = u12
    --]]
    u8[p42] = nil
    if u9 == p42 then
        u9 = nil
        u22()
        u12.Visible = false
    end
end
local function u64(p44) --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u9
        [4] = u10
    --]]
    local v45 = (1 / 0)
    local v46 = nil
    for v47 in pairs(u8) do
        local v48 = v47 and v47.Parent
        if v48 then
            if v47:GetAttribute("MonsterIsBoss") == true then
                local v49
                if v47 then
                    v49 = v47:FindFirstChildOfClass("Humanoid")
                else
                    v49 = v47
                end
                v48 = v49 ~= nil
            else
                v48 = false
            end
        end
        if v48 then
            local v50
            if v47 then
                v50 = v47:FindFirstChildOfClass("Humanoid")
            else
                v50 = v47
            end
            local v51
            if v47 then
                v51 = v47:GetAttribute("MonsterBossUiShowDistance")
            else
                v51 = v47
            end
            local v52 = tonumber(v51) or 0
            local v53 = v52 <= 0 and 150 or v52
            local v54 = u6.Character
            if v54 then
                v54 = v54:FindFirstChild("HumanoidRootPart")
            end
            local v55
            if v47 then
                v55 = v47:FindFirstChild("HumanoidRootPart") or v47.PrimaryPart
            else
                v55 = v47
            end
            local v56 = not (v54 and v55) and (1 / 0) or (v54.Position - v55.Position).Magnitude
            if v50 and (v50.Health > 0 and (v56 <= v53 and v56 < v45)) then
                v46 = v47
                v45 = v56
            end
        else
            u8[v47] = nil
        end
    end
    if u9 then
        local v57 = u9
        local v58 = v57 and v57.Parent
        if v58 then
            if v57:GetAttribute("MonsterIsBoss") == true then
                if v57 then
                    v57 = v57:FindFirstChildOfClass("Humanoid")
                end
                v58 = v57 ~= nil
            else
                v58 = false
            end
        end
        if v58 then
            local v59 = u9
            local v60 = u6.Character
            if v60 then
                v60 = v60:FindFirstChild("HumanoidRootPart")
            end
            if v59 then
                v59 = v59:FindFirstChild("HumanoidRootPart") or v59.PrimaryPart
            end
            local v61 = not (v60 and v59) and (1 / 0) or (v60.Position - v59.Position).Magnitude
            local v62 = u9
            if v62 then
                v62 = v62:GetAttribute("MonsterBossUiShowDistance")
            end
            local v63 = tonumber(v62) or 0
            if v61 <= (v63 <= 0 and 150 or v63) + 12 and p44 < u10 then
                return u9
            end
        end
    end
    if v46 ~= u9 then
        u10 = p44 + 0.9
    end
    return v46
end
u22()
local u65 = u9
local u66 = u10
local u67 = u12
local function v71(p68) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v69 = p68 and p68.Parent
    if v69 then
        if p68:GetAttribute("MonsterIsBoss") == true then
            local v70
            if p68 then
                v70 = p68:FindFirstChildOfClass("Humanoid")
            else
                v70 = p68
            end
            v69 = v70 ~= nil
        else
            v69 = false
        end
    end
    if v69 then
        u8[p68] = true
    end
end
for _, v72 in ipairs(v3:GetTagged("Boss_Active")) do
    local v73 = v72 and v72.Parent
    if v73 then
        if v72:GetAttribute("MonsterIsBoss") == true then
            local v74
            if v72 then
                v74 = v72:FindFirstChildOfClass("Humanoid")
            else
                v74 = v72
            end
            v73 = v74 ~= nil
        else
            v73 = false
        end
    end
    if v73 then
        u8[v72] = true
    end
end
v3:GetInstanceAddedSignal("Boss_Active"):Connect(v71)
v3:GetInstanceRemovedSignal("Boss_Active"):Connect(v43)
v2.RenderStepped:Connect(function() --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u64
        [2] = u65
        [3] = u41
        [4] = u22
        [5] = u67
    --]]
    u65 = u64((os.clock()))
    if u65 then
        u41(u65)
    else
        u22()
        u67.Visible = false
    end
end)
u6.CharacterAdded:Connect(function() --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u65
        [2] = u66
    --]]
    task.delay(0.2, function() --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u66
        --]]
        u65 = nil
        u66 = 0
    end)
end)
print("[BossHudController] initialized")