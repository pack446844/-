local v1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local u3 = require(v2.Shared.Defs.UIConfig)
local u4 = Color3.fromRGB(70, 170, 255)
local u5 = {}
local function u8(p6) --[[ Line: 24 ]]
    if not p6 then
        return nil
    end
    for _, v7 in ipairs(p6:GetDescendants()) do
        if v7:IsA("BasePart") then
            return v7
        end
    end
    return nil
end
local function u14(p9) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p9 then
        local v10 = p9:GetAttribute("MonsterAttachPartName")
        if type(v10) == "string" and v10 ~= "" then
            local v11 = p9:FindFirstChild(v10, true)
            if v11 and v11:IsA("BasePart") then
                return v11
            end
        end
        local v12 = p9:FindFirstChild("Head")
        if v12 and v12:IsA("BasePart") then
            return v12
        else
            local v13 = p9:FindFirstChild("HumanoidRootPart")
            if v13 and v13:IsA("BasePart") then
                return v13
            elseif p9.PrimaryPart then
                return p9.PrimaryPart
            else
                return u8(p9)
            end
        end
    else
        return nil
    end
end
local function u27(p15, p16) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    local v17 = p16:FindFirstChild("MonsterHpBillboard")
    if v17 then
        return v17
    end
    local v18 = tonumber(p15:GetAttribute("MonsterHpBarOffsetY")) or 3.4
    local v19 = Instance.new("BillboardGui")
    v19.Name = "MonsterHpBillboard"
    v19.Size = UDim2.new(0, 140, 0, 54)
    v19.StudsOffset = Vector3.new(0, v18, 0)
    v19.AlwaysOnTop = true
    v19.MaxDistance = 65
    v19.LightInfluence = 0
    v19.Parent = p16
    local v20 = Instance.new("Frame")
    v20.Name = "Root"
    v20.Size = UDim2.new(1, 0, 1, 0)
    v20.BackgroundTransparency = 1
    v20.Parent = v19
    local v21 = Instance.new("TextLabel")
    v21.Name = "EliteText"
    v21.AnchorPoint = Vector2.new(0.5, 0)
    v21.Position = UDim2.new(0.5, 0, 0, 0)
    v21.Size = UDim2.new(1, 0, 0, 16)
    v21.BackgroundTransparency = 1
    v21.Text = ""
    v21.TextColor3 = u4
    v21.TextStrokeTransparency = 0.2
    v21.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v21.TextScaled = true
    v21.Font = Enum.Font.GothamBold
    v21.Visible = false
    v21.Parent = v20
    local v22 = Instance.new("TextLabel")
    v22.Name = "HpText"
    v22.AnchorPoint = Vector2.new(0.5, 0)
    v22.Position = UDim2.new(0.5, 0, 0, 16)
    v22.Size = UDim2.new(1, 0, 0, 18)
    v22.BackgroundTransparency = 1
    v22.Text = "0/0"
    v22.TextColor3 = Color3.fromRGB(255, 255, 255)
    v22.TextStrokeTransparency = 0.2
    v22.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v22.TextScaled = true
    v22.Font = Enum.Font.GothamBold
    v22.Parent = v20
    local v23 = Instance.new("Frame")
    v23.Name = "BarBack"
    v23.AnchorPoint = Vector2.new(0.5, 1)
    v23.Position = UDim2.new(0.5, 0, 1, 0)
    v23.Size = UDim2.new(0, 110, 0, 12)
    v23.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    v23.BorderSizePixel = 0
    v23.Parent = v20
    local v24 = Instance.new("UICorner")
    v24.CornerRadius = UDim.new(0, 4)
    v24.Parent = v23
    local v25 = Instance.new("Frame")
    v25.Name = "Fill"
    v25.Size = UDim2.new(1, 0, 1, 0)
    v25.BackgroundColor3 = u3.HP_COLOR_FULL
    v25.BorderSizePixel = 0
    v25.Parent = v23
    local v26 = Instance.new("UICorner")
    v26.CornerRadius = UDim.new(0, 4)
    v26.Parent = v25
    return v19
end
local function u53(p28) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    local v29 = u5[p28]
    if v29 and v29.ready then
        local v30 = v29.hum
        local v31 = v29.bb
        if v30 and (v30.Parent and (v31 and v31.Parent)) then
            local v32 = v30.MaxHealth
            local v33 = (tonumber(v32) or 0) + 0.5
            local v34 = math.floor(v33)
            local v35 = math.max(0, v34)
            local v36 = math.max(1, v35)
            local v37 = v30.Health
            local v38 = (tonumber(v37) or 0) + 0.5
            local v39 = math.floor(v38)
            local v40 = math.max(0, v39)
            local v41 = math.clamp(v40, 0, v36)
            local v42 = v41 / v36
            local v43 = v31:FindFirstChild("Root")
            local v44
            if v43 then
                v44 = v43:FindFirstChild("EliteText") or nil
            else
                v44 = nil
            end
            local v45
            if v43 then
                v45 = v43:FindFirstChild("HpText") or nil
            else
                v45 = nil
            end
            local v46
            if v43 then
                v46 = v43:FindFirstChild("BarBack") or nil
            else
                v46 = nil
            end
            local v47
            if v46 then
                v47 = v46:FindFirstChild("Fill") or nil
            else
                v47 = nil
            end
            if v43 and (v44 and (v45 and (v46 and v47))) then
                local v48
                if p28 then
                    v48 = p28:GetAttribute("MonsterIsElite") == true
                else
                    v48 = p28
                end
                v44.Visible = v48
                local v49
                if v48 then
                    local v50
                    if p28 then
                        v50 = p28:GetAttribute("MonsterEliteTitleText")
                    else
                        v50 = p28
                    end
                    v49 = (type(v50) ~= "string" or (v50 == "" or not v50)) and "\236\151\152\235\166\172\237\138\184" or v50 or ""
                else
                    v49 = ""
                end
                v44.Text = v49
                if v48 then
                    v31.Size = UDim2.new(0, 140, 0, 54)
                    v45.Position = UDim2.new(0.5, 0, 0, 16)
                else
                    v31.Size = UDim2.new(0, 140, 0, 36)
                    v45.Position = UDim2.new(0.5, 0, 0, 0)
                end
                v47.Size = UDim2.new(v42, 0, 1, 0)
                local v51
                if v42 <= 0.25 then
                    v51 = u3.HP_COLOR_LOW
                elseif v42 <= 0.6 then
                    v51 = u3.HP_COLOR_MID
                else
                    v51 = u3.HP_COLOR_FULL
                end
                v47.BackgroundColor3 = v51
                v45.Text = tostring(v41) .. "/" .. tostring(v36)
                local v52
                if v30.Health > 0 then
                    v52 = p28.Parent ~= nil
                else
                    v52 = false
                end
                v31.Enabled = v52
            end
        else
            return
        end
    else
        return
    end
end
local function u57(p54) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v55 = u5[p54]
    if v55 then
        for _, v56 in ipairs(v55.conns) do
            if v56 and v56.Disconnect then
                v56:Disconnect()
            end
        end
        if v55.bb and v55.bb.Parent then
            v55.bb:Destroy()
        end
        u5[p54] = nil
    end
end
local function u78(u58, u59, p60, p61) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u53
        [3] = u57
        [4] = u5
    --]]
    u59.ready = true
    u59.hum = p60
    u59.attach = p61
    u59.bb = u27(u58, p61)
    local v62 = u59.conns
    local v63 = p60.HealthChanged
    local function v64() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u58
        --]]
        u53(u58)
    end
    table.insert(v62, v63:Connect(v64))
    local v65 = u59.conns
    local v66 = p60:GetPropertyChangedSignal("MaxHealth")
    local function v67() --[[ Line: 210 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u58
        --]]
        u53(u58)
    end
    table.insert(v65, v66:Connect(v67))
    local v68 = u59.conns
    local v69 = u58:GetPropertyChangedSignal("Parent")
    local function v70() --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u57
        --]]
        if u58.Parent == nil then
            u57(u58)
        end
    end
    table.insert(v68, v69:Connect(v70))
    local v71 = u59.conns
    local v72 = p61.AncestryChanged
    local function v75(_, p73) --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u58
            [3] = u59
        --]]
        if p73 == nil and u5[u58] then
            local v74 = u59.bb
            if v74 and v74.Parent then
                v74:Destroy()
            end
            u59.ready = false
            u59.bb = nil
            u59.attach = nil
            u59.hum = nil
        end
    end
    table.insert(v71, v72:Connect(v75))
    local v76 = u59.conns
    local v77 = u58.DescendantAdded
    table.insert(v76, v77:Connect(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        if u59.ready then
            if not (u59.bb and u59.bb.Parent) then
                u59.ready = false
                u59.bb = nil
                u59.attach = nil
                u59.hum = nil
            end
        end
    end))
    u53(u58)
end
local function u83(p79) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u14
        [3] = u78
    --]]
    local v80 = u5[p79]
    if not v80 or (v80.ready or not (p79 and p79.Parent)) then
        return false
    end
    local v81
    if p79 then
        v81 = p79:FindFirstChildOfClass("Humanoid")
    else
        v81 = p79
    end
    local v82 = u14(p79)
    if not (v81 and v82) then
        return false
    end
    u78(p79, v80, v81, v82)
    return true
end
local function u94(u84) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u83
        [3] = u57
    --]]
    if u5[u84] then
        return
    elseif u84 and u84.Parent then
        local v85 = {
            ["ready"] = false,
            ["resolving"] = false,
            ["hum"] = nil,
            ["attach"] = nil,
            ["bb"] = nil,
            ["conns"] = {}
        }
        u5[u84] = v85
        local v86 = v85.conns
        local v87 = u84.DescendantAdded
        local function v88() --[[ Line: 275 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u84
                [3] = u83
            --]]
            if u5[u84] and not u5[u84].ready then
                u83(u84)
            end
        end
        table.insert(v86, v87:Connect(v88))
        local v89 = v85.conns
        local v90 = u84:GetPropertyChangedSignal("Parent")
        local function v91() --[[ Line: 280 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u57
            --]]
            if u84.Parent == nil then
                u57(u84)
            end
        end
        table.insert(v89, v90:Connect(v91))
        local v92 = not u83(u84) and u5[u84]
        if v92 then
            if v92.resolving then
                return
            end
            v92.resolving = true
            task.spawn(function() --[[ Line: 256 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u84
                    [3] = u83
                --]]
                for _ = 1, 30 do
                    if not u5[u84] or (not u84.Parent or u83(u84)) then
                        break
                    end
                    task.wait(0.2)
                end
                local v93 = u5[u84]
                if v93 then
                    v93.resolving = false
                end
            end)
        end
    end
end
for _, v95 in ipairs(v1:GetTagged("Monster_Active")) do
    task.defer(u94, v95)
end
v1:GetInstanceAddedSignal("Monster_Active"):Connect(function(p96) --[[ Line: 294 ]]
    --[[
    Upvalues:
        [1] = u94
    --]]
    task.defer(u94, p96)
end)
v1:GetInstanceRemovedSignal("Monster_Active"):Connect(function(p97) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u57
    --]]
    u57(p97)
end)
print("[MonsterHpBarController] initialized")