local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local v4 = v3:WaitForChild("InventorySync")
local u5 = require(v2.Shared.Defs.ItemDefs)
local u6 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u7 = require(v2.Shared.Util.PlatformGui)
local u8 = {
    ["gui"] = nil,
    ["invBox"] = nil,
    ["root"] = nil,
    ["section"] = nil
}
local u9 = nil
local function u24(p10) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v11 = {}
    for v20, v13 in pairs(p10 or {}) do
        local v14 = tonumber(v13) or 0
        if v14 > 0 then
            local v15 = u5[v20]
            if (v15 and ((v15.category == "equipment" or v15.inventorySection == "weapon") and "equipment" or "other") or "other") == "other" then
                local v16 = u5[v20]
                local v17 = #v11 + 1
                local v18 = {
                    ["itemId"] = v20,
                    ["count"] = math.floor(v14)
                }
                local v19 = u5[v20]
                if v19 then
                    local v20 = v19.displayName or v20
                end
                v18.displayName = v20
                local v21
                if v16 then
                    v21 = v16.category
                else
                    v21 = v16
                end
                v18.category = type(v21) == "string" and (v16.category or "other") or "other"
                v11[v17] = v18
            end
        end
    end
    table.sort(v11, function(p22, p23) --[[ Line: 43 ]]
        if p22.displayName == p23.displayName then
            return p22.itemId < p23.itemId
        else
            return p22.displayName < p23.displayName
        end
    end)
    return v11
end
local function u28(u25, p26) --[[ Line: 49 ]]
    local u27 = p26:FindFirstChildOfClass("UIListLayout")
    if u27 then
        u27:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Name: updateCanvas, Line 52 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u27
            --]]
            u25.CanvasSize = UDim2.new(0, 0, 0, u27.AbsoluteContentSize.Y + 8)
        end)
        u25.CanvasSize = UDim2.new(0, 0, 0, u27.AbsoluteContentSize.Y + 8)
    end
end
local function u37(p29) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v30 = Instance.new("Frame")
    v30.Name = "other"
    v30.Size = UDim2.new(1, 0, 1, 0)
    v30.BackgroundTransparency = 1
    v30.Parent = p29
    local v31 = Instance.new("TextLabel")
    v31.Name = "Header"
    v31.Size = UDim2.new(1, 0, 0, 26)
    v31.BackgroundTransparency = 1
    v31.Parent = v30
    v31.Text = "Items"
    v31.TextColor3 = Color3.fromRGB(35, 31, 19)
    v31.TextSize = 18
    v31.Font = Enum.Font.GothamBold
    v31.TextXAlignment = Enum.TextXAlignment.Left
    local v32 = Instance.new("ScrollingFrame")
    v32.Name = "Scroll"
    v32.Parent = v30
    v32.Position = UDim2.new(0, 0, 0, 30)
    v32.Size = UDim2.new(1, 0, 1, -30)
    v32.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    v32.BorderSizePixel = 0
    v32.ScrollBarThickness = 6
    v32.CanvasSize = UDim2.new(0, 0, 0, 0)
    local v33 = Instance.new("UICorner")
    v33.CornerRadius = UDim.new(0, 6)
    v33.Parent = v32
    local v34 = Instance.new("Frame")
    v34.Name = "List"
    v34.Parent = v32
    v34.BackgroundTransparency = 1
    v34.Size = UDim2.new(1, -6, 0, 0)
    v34.Position = UDim2.new(0, 3, 0, 4)
    local v35 = Instance.new("UIListLayout")
    v35.Padding = UDim.new(0, 6)
    v35.Parent = v34
    local v36 = Instance.new("TextLabel")
    v36.Name = "EmptyLabel"
    v36.Parent = v32
    v36.Size = UDim2.new(1, -12, 0, 24)
    v36.Position = UDim2.new(0, 6, 0, 8)
    v36.BackgroundTransparency = 1
    v36.Text = "Empty"
    v36.TextColor3 = Color3.fromRGB(150, 150, 170)
    v36.TextSize = 16
    v36.Font = Enum.Font.Gotham
    v36.Visible = false
    u28(v32, v34)
    return {
        ["pane"] = v30,
        ["scroll"] = v32,
        ["list"] = v34,
        ["empty"] = v36
    }
end
local function u49(p38, p39, p40) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v41 = u5[p39]
    local v42
    if v41 then
        v42 = v41.displayName or p39
    else
        v42 = p39
    end
    local v43 = v41 and v41.category or "?"
    local v44 = Instance.new("Frame")
    v44.Name = "ItemSlot_" .. p39
    v44.Size = UDim2.new(1, -8, 0, 58)
    v44.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
    v44.BorderSizePixel = 0
    v44.Parent = p38
    local v45 = Instance.new("UICorner")
    v45.CornerRadius = UDim.new(0, 6)
    v45.Parent = v44
    local v46 = Instance.new("TextLabel")
    v46.Parent = v44
    v46.Size = UDim2.new(0.6, 0, 1, 0)
    v46.Position = UDim2.new(0, 12, 0, 0)
    v46.BackgroundTransparency = 1
    v46.Text = v42
    v46.TextColor3 = Color3.fromRGB(255, 255, 255)
    v46.TextScaled = false
    v46.TextSize = 18
    v46.Font = Enum.Font.GothamBold
    v46.TextXAlignment = Enum.TextXAlignment.Left
    v46.TextYAlignment = Enum.TextYAlignment.Center
    local v47 = Instance.new("TextLabel")
    v47.Parent = v44
    v47.Size = UDim2.new(0.25, 0, 0.5, 0)
    v47.Position = UDim2.new(0.6, 0, 0.1, 0)
    v47.BackgroundTransparency = 1
    v47.Text = "[" .. v43 .. "]"
    v47.TextColor3 = Color3.fromRGB(160, 160, 180)
    v47.TextScaled = false
    v47.TextSize = 14
    v47.Font = Enum.Font.Gotham
    local v48 = Instance.new("TextLabel")
    v48.Parent = v44
    v48.Size = UDim2.new(0.15, 0, 1, 0)
    v48.Position = UDim2.new(0.85, 0, 0, 0)
    v48.BackgroundTransparency = 1
    v48.Text = "x" .. tostring(p40)
    v48.TextColor3 = Color3.fromRGB(223, 189, 52)
    v48.TextScaled = false
    v48.TextSize = 18
    v48.Font = Enum.Font.GothamBold
    return v44
end
local function u55() --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u8
        [4] = u37
    --]]
    local v50 = u7.find(u6, "InventoryGui")
    if not v50 then
        return false
    end
    local v51 = v50:FindFirstChild("InvBox")
    if not v51 then
        return false
    end
    u8.gui = v50
    u8.invBox = v51
    if u8.root and u8.root.Parent == v51 then
        return true
    end
    local v52 = v51:FindFirstChild("ItemList")
    if v52 then
        v52.Visible = false
    end
    local v53 = v51:FindFirstChild("SectionsRoot")
    if not v53 then
        v53 = Instance.new("Frame")
        v53.Name = "SectionsRoot"
        v53.BackgroundTransparency = 1
        if v52 then
            v53.Position = v52.Position
            v53.Size = v52.Size
        else
            v53.Position = UDim2.new(0, 14, 0, 74)
            v53.Size = UDim2.new(1, -28, 1, -88)
        end
        v53.Parent = v51
    end
    u8.root = v53
    for _, v54 in ipairs(v53:GetChildren()) do
        if v54:IsA("Frame") then
            v54:Destroy()
        end
    end
    u8.section = u37(v53)
    return true
end
local function u58(p56) --[[ Line: 179 ]]
    for _, v57 in ipairs(p56:GetChildren()) do
        if v57:IsA("Frame") then
            v57:Destroy()
        end
    end
end
local function u62(p59, p60) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u58
        [2] = u49
    --]]
    u58(p59.list)
    p59.empty.Visible = #p60 == 0
    for _, v61 in ipairs(p60) do
        u49(p59.list, v61.itemId, v61.count)
    end
end
local function u64(p63) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u55
        [3] = u62
        [4] = u8
        [5] = u24
    --]]
    if p63 ~= nil then
        u9 = p63 or {}
    end
    if u55() then
        u62(u8.section, (u24(u9 or {})))
    end
end
local function u68(p65) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u9
        [4] = u64
    --]]
    if p65 then
        local v66 = p65:FindFirstChild("BtnInventory", true)
        if v66 and v66:IsA("GuiButton") then
            if v66:GetAttribute("InventoryBound") ~= true then
                v66:SetAttribute("InventoryBound", true)
                v66.Activated:Connect(function() --[[ Line: 198 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u6
                        [3] = u9
                        [4] = u64
                    --]]
                    local v67 = u7.find(u6, "InventoryGui")
                    if v67 then
                        v67.Enabled = not v67.Enabled
                        if v67.Enabled and u9 then
                            u64(u9)
                        end
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
local function u71(u69) --[[ Line: 206 ]]
    if u69 then
        local v70 = u69:FindFirstChild("InvBox")
        if v70 then
            v70 = u69.InvBox:FindFirstChild("CloseBtn")
        end
        if v70 and v70:IsA("GuiButton") then
            if v70:GetAttribute("InventoryCloseBound") ~= true then
                v70:SetAttribute("InventoryCloseBound", true)
                v70.Activated:Connect(function() --[[ Line: 212 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                    --]]
                    u69.Enabled = false
                end)
            end
        else
            return
        end
    else
        return
    end
end
local function u72() --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u68
        [2] = u6
        [3] = u71
        [4] = u9
        [5] = u64
    --]]
    u68(u6:FindFirstChild("MainHUD"))
    u68(u6:FindFirstChild("MainHUD_Mobile"))
    u71(u6:FindFirstChild("InventoryGui"))
    u71(u6:FindFirstChild("InventoryGui_Mobile"))
    if u9 then
        u64(u9)
    end
end
task.defer(function() --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u72
    --]]
    u7.waitUntilReady(5)
    u72()
end)
u7.modeChanged:Connect(function() --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u72
        [2] = u9
        [3] = u64
    --]]
    task.defer(u72)
    if u9 then
        task.defer(function() --[[ Line: 230 ]]
            --[[
            Upvalues:
                [1] = u64
                [2] = u9
            --]]
            u64(u9)
        end)
    end
end)
u6.ChildAdded:Connect(function(p73) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u72
    --]]
    if p73 then
        if p73.Name == "MainHUD" or (p73.Name == "MainHUD_Mobile" or (p73.Name == "InventoryGui" or p73.Name == "InventoryGui_Mobile")) then
            task.defer(u72)
        end
    end
end)
v3.DataSync.OnClientEvent:Connect(function(p74) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u64
    --]]
    if p74 and p74.inventory then
        u64(p74.inventory)
    end
end)
v4.OnClientEvent:Connect(function(p75) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u64
    --]]
    if p75 then
        if p75.inventory then
            u64(p75.inventory)
        end
    end
end)
print("[InventoryUIController] \236\180\136\234\184\176\237\153\148 \236\153\132\235\163\140")