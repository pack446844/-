local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Defs.EquipmentOptionDefs)
local v5 = v3:WaitForChild("DataSync")
local v6 = v3:WaitForChild("InventorySync")
local v7 = v3:WaitForChild("HudSync")
local u8 = v3:WaitForChild("EquipmentOptionRequest")
local v9 = v3:WaitForChild("EquipmentOptionNotice")
local u10 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u11 = {
    "weapon",
    "armor",
    "accessory",
    "shoes"
}
local u12 = {
    ["gui"] = nil,
    ["panel"] = nil,
    ["tokenLabel"] = nil,
    ["noticeLabel"] = nil
}
local u13 = {}
local u14 = {}
local u15 = {
    ["weapon"] = "",
    ["armor"] = "",
    ["accessory"] = "",
    ["shoes"] = ""
}
local u16 = {}
local u17 = 0
local u18 = 0
local u19 = nil
local u20 = nil
local u21 = nil
local function u29(p22) --[[ Line: 44 ]]
    local v23 = type(p22) == "table" and p22 and p22 or {}
    local v24 = {}
    local v25 = v23.weapon
    v24.weapon = type(v25) == "string" and (v23.weapon or "") or ""
    local v26 = v23.armor
    v24.armor = type(v26) == "string" and (v23.armor or "") or ""
    local v27 = v23.accessory
    v24.accessory = type(v27) == "string" and (v23.accessory or "") or ""
    local v28 = v23.shoes
    v24.shoes = type(v28) == "string" and (v23.shoes or "") or ""
    return v24
end
local function u32() --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u19
        [4] = u20
        [5] = u21
    --]]
    local u30 = u10:FindFirstChild("EquipGui")
    local v31
    if u30 then
        v31 = u30:FindFirstChild("EquipBox")
    else
        v31 = u30
    end
    if u12.gui ~= u30 or u12.panel ~= v31 then
        u12.gui = u30
        u12.panel = v31
    end
    if u19 then
        u19:Disconnect()
        u19 = nil
    end
    if u20 then
        u20:Disconnect()
        u20 = nil
    end
    if v31 then
        u19 = v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            u21()
        end)
    end
    if u30 then
        u20 = u30:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u21
            --]]
            if u30.Enabled then
                task.defer(u21)
            end
        end)
    end
end
local function u39(p33, p34) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u18
    --]]
    local v35 = u10:FindFirstChild("EquipGui")
    local u36
    if v35 then
        u36 = v35:FindFirstChild("EquipBox")
    else
        u36 = v35
    end
    if u12.gui ~= v35 or u12.panel ~= u36 then
        u12.gui = v35
        u12.panel = u36
    end
    if u36 then
        local u37 = u12.noticeLabel
        if u37 and u37.Parent == u36 then
            u18 = u18 + 1
            local u38 = u18
            u37.Text = tostring(p33 or "")
            u37.TextColor3 = p34 and Color3.fromRGB(210, 70, 70) or Color3.fromRGB(70, 150, 80)
            u37.Visible = u37.Text ~= ""
            task.delay(2.2, function() --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u38
                    [3] = u37
                    [4] = u36
                --]]
                if u18 == u38 then
                    if u37 and u37.Parent == u36 then
                        u37.Visible = false
                    end
                end
            end)
        end
    else
        return
    end
end
local function u49() --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u17
    --]]
    local v40 = u10:FindFirstChild("EquipGui")
    local v41
    if v40 then
        v41 = v40:FindFirstChild("EquipBox")
    else
        v41 = v40
    end
    if u12.gui ~= v40 or u12.panel ~= v41 then
        u12.gui = v40
        u12.panel = v41
    end
    if v41 then
        if not u12.tokenLabel or u12.tokenLabel.Parent ~= v41 then
            local v42 = Instance.new("TextLabel")
            v42.Name = "OptionTokenLabel"
            v42.BackgroundTransparency = 1
            v42.Position = UDim2.new(0, 120, 0, 12)
            v42.Size = UDim2.new(0, 170, 0, 22)
            v42.TextXAlignment = Enum.TextXAlignment.Left
            v42.TextColor3 = Color3.fromRGB(80, 80, 80)
            v42.TextSize = 18
            v42.Font = Enum.Font.SourceSansBold
            v42.ZIndex = 12
            v42.Parent = v41
            u12.tokenLabel = v42
        end
        if not u12.noticeLabel or u12.noticeLabel.Parent ~= v41 then
            local v43 = Instance.new("TextLabel")
            v43.Name = "OptionNoticeLabel"
            v43.BackgroundTransparency = 1
            v43.AnchorPoint = Vector2.new(0, 1)
            v43.Position = UDim2.new(0, 12, 1, -6)
            v43.Size = UDim2.new(1, -24, 0, 18)
            v43.TextXAlignment = Enum.TextXAlignment.Left
            v43.TextColor3 = Color3.fromRGB(70, 150, 80)
            v43.TextSize = 16
            v43.Font = Enum.Font.SourceSansBold
            v43.ZIndex = 12
            v43.Visible = false
            v43.Parent = v41
            u12.noticeLabel = v43
        end
        local v44 = u12.tokenLabel
        local v45 = string.format
        local v46 = u17
        local v47 = tonumber(v46) or 0
        local v48 = math.floor(v47)
        v44.Text = v45("\236\157\152\235\162\176 \236\166\157\237\145\156 : %d", (math.max(0, v48)))
    end
end
local function u63(u50) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u13
        [4] = u15
        [5] = u8
        [6] = u4
        [7] = u16
    --]]
    local v51 = u10:FindFirstChild("EquipGui")
    local v52
    if v51 then
        v52 = v51:FindFirstChild("EquipBox")
    else
        v52 = v51
    end
    if u12.gui ~= v51 or u12.panel ~= v52 then
        u12.gui = v51
        u12.panel = v52
    end
    local v53
    if v52 then
        v53 = v52:FindFirstChild(u50 .. "Slot") or nil
    else
        v53 = nil
    end
    if v53 then
        local v54 = u13[u50]
        if not v54 or v54.frame ~= v53 then
            v54 = {
                ["frame"] = v53
            }
            u13[u50] = v54
            local v55 = Instance.new("TextLabel")
            v55.Name = "OptionLabel"
            v55.BackgroundTransparency = 1
            v55.TextXAlignment = Enum.TextXAlignment.Left
            v55.TextYAlignment = Enum.TextYAlignment.Center
            v55.TextSize = 16
            v55.Font = Enum.Font.SourceSansBold
            v55.ZIndex = 5
            v55.Parent = v53
            v54.optionLabel = v55
            local v56 = Instance.new("TextButton")
            v56.Name = "OptionRerollButton"
            v56.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
            v56.BorderSizePixel = 0
            v56.AnchorPoint = Vector2.new(1, 1)
            v56.Position = UDim2.new(1, -8, 1, -6)
            v56.Size = UDim2.new(0, 72, 0, 22)
            v56.TextSize = 15
            v56.Font = Enum.Font.SourceSansBold
            v56.TextColor3 = Color3.fromRGB(35, 35, 35)
            v56.ZIndex = 5
            v56.Parent = v53
            local v57 = Instance.new("UICorner")
            v57.CornerRadius = UDim.new(0, 6)
            v57.Parent = v56
            v56.Activated:Connect(function() --[[ Line: 177 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u50
                    [3] = u8
                --]]
                local v58 = u15[u50] or ""
                if v58 ~= "" then
                    u8:FireServer({
                        ["action"] = "reroll",
                        ["itemId"] = v58
                    })
                end
            end)
            v54.rerollBtn = v56
        end
        local v59 = v53:FindFirstChild("ClearButton")
        local v60
        if v53.AbsoluteSize.X > 0 then
            v60 = v53.AbsoluteSize.X <= 180
        else
            v60 = false
        end
        if v59 and v59:IsA("GuiButton") then
            v59.AnchorPoint = Vector2.new(1, 0)
            v59.Position = UDim2.new(1, -8, 0, 8)
            v59.Size = UDim2.new(0, 50, 0, 22)
            v59.TextSize = 15
        end
        if v60 then
            v54.optionLabel.Position = UDim2.new(0, 72, 0, 38)
            v54.optionLabel.Size = UDim2.new(1, -214, 0, 18)
            v54.optionLabel.TextSize = 14
        else
            v54.optionLabel.Position = UDim2.new(0, 208, 0, 27)
            v54.optionLabel.Size = UDim2.new(1, -278, 0, 20)
            v54.optionLabel.TextSize = 16
        end
        local v61 = u15[u50] or ""
        local v62
        if v61 == "" then
            v61 = nil
            v62 = nil
        else
            v62 = u4.normalizeEntry(u16[v61])
        end
        if v61 == "" then
            v54.optionLabel.Text = ""
            v54.rerollBtn.Visible = false
            return
        elseif v62 then
            v54.optionLabel.Text = u4.formatOptionText(v62)
            v54.optionLabel.TextColor3 = u4.getGradeColor(v62.grade)
            v54.rerollBtn.Text = string.format("\236\158\172\236\132\164\236\160\149 %d", u4.REROLL_TOKEN_COST or 25)
            v54.rerollBtn.Visible = true
            v54.rerollBtn.Active = true
            v54.rerollBtn.AutoButtonColor = true
        else
            v54.optionLabel.Text = "\236\152\181\236\133\152 \236\151\134\236\157\140"
            v54.optionLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
            v54.rerollBtn.Text = "\235\172\180\235\163\140 \235\182\128\236\151\172"
            v54.rerollBtn.Visible = true
            v54.rerollBtn.Active = true
            v54.rerollBtn.AutoButtonColor = true
        end
    else
        return
    end
end
u21 = function() --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u49
        [2] = u11
        [3] = u63
    --]]
    u49()
    for _, v64 in ipairs(u11) do
        u63(v64)
    end
end
local function v73(p65) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
        [3] = u29
        [4] = u16
        [5] = u4
        [6] = u17
        [7] = u21
    --]]
    if type(p65) == "table" then
        local v66 = p65.inventory
        if type(v66) == "table" then
            u14 = p65.inventory
        end
        local v67 = p65.equipment
        if type(v67) == "table" then
            u15 = u29(p65.equipment)
        end
        local v68 = p65.equipmentOptions
        if type(v68) == "table" then
            local v69 = p65.equipmentOptions
            u16 = u4.cloneMap(v69)
        end
        if p65.dailyCommissionToken ~= nil then
            local v70 = p65.dailyCommissionToken
            local v71 = tonumber(v70) or 0
            local v72 = math.floor(v71)
            u17 = math.max(0, v72)
        end
        u21()
    end
end
local v74 = u10:FindFirstChild("EquipGui")
local v75
if v74 then
    v75 = v74:FindFirstChild("EquipBox")
else
    v75 = v74
end
if u12.gui ~= v74 or u12.panel ~= v75 then
    u12.gui = v74
    u12.panel = v75
end
u32()
u21()
u10.ChildAdded:Connect(function(p76) --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u21
    --]]
    if p76 and p76.Name == "EquipGui" then
        task.defer(function() --[[ Line: 253 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u21
            --]]
            u32()
            u21()
        end)
    end
end)
v6.OnClientEvent:Connect(v73)
v5.OnClientEvent:Connect(v73)
v7.OnClientEvent:Connect(v73)
v9.OnClientEvent:Connect(function(p77) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    if type(p77) == "table" then
        u39(p77.text, p77.isError == true)
    end
end)
print("[EquipmentOptionUIController] initialized")