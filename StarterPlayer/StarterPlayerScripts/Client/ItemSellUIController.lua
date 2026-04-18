local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = v2.Shared.Net
local v5 = v4:WaitForChild("ItemSellSync")
local u6 = v4:WaitForChild("ItemSellRequest")
local u7 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u8 = require(v2.Shared.Util.PlatformGui)
local u9 = {
    ["gui"] = nil,
    ["root"] = nil,
    ["title"] = nil,
    ["gold"] = nil,
    ["message"] = nil,
    ["scroll"] = nil,
    ["list"] = nil,
    ["closeBtn"] = nil
}
local function u15(p10, p11) --[[ Line: 17 ]]
    local v12 = p11 or Enum.FontWeight.Regular
    local v13, v14 = pcall(Font.new, "rbxasset://fonts/families/SourceSansPro.json", v12, Enum.FontStyle.Normal)
    if v13 and v14 then
        p10.FontFace = v14
    end
    p10.Font = v12 == Enum.FontWeight.Bold and Enum.Font.SourceSansBold or Enum.Font.SourceSans
end
local function u17() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if u9.list then
        for _, v16 in ipairs(u9.list:GetChildren()) do
            if v16:IsA("Frame") then
                v16:Destroy()
            end
        end
    end
end
local function u32() --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u15
        [4] = u6
    --]]
    if u9.gui and u9.gui.Parent then
        return u9.gui
    end
    local u18 = Instance.new("ScreenGui")
    u18.Name = "ItemSellGui"
    u18.ResetOnSpawn = false
    u18.Enabled = false
    u18.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    u18.Parent = u7
    local v19 = Instance.new("Frame")
    v19.Name = "Root"
    v19.Size = UDim2.new(0, 560, 0, 430)
    v19.Position = UDim2.new(0.5, -280, 0.5, -215)
    v19.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
    v19.BorderSizePixel = 1
    v19.BorderColor3 = Color3.fromRGB(95, 95, 110)
    v19.Parent = u18
    local v20 = Instance.new("TextLabel")
    v20.Name = "Title"
    v20.Size = UDim2.new(1, -110, 0, 40)
    v20.Position = UDim2.new(0, 14, 0, 8)
    v20.BackgroundTransparency = 1
    v20.Text = "Item Seller"
    v20.TextColor3 = Color3.fromRGB(255, 255, 255)
    v20.TextSize = 28
    v20.TextXAlignment = Enum.TextXAlignment.Left
    u15(v20, Enum.FontWeight.Bold)
    v20.Parent = v19
    local v21 = Instance.new("TextLabel")
    v21.Name = "Gold"
    v21.Size = UDim2.new(0, 170, 0, 28)
    v21.Position = UDim2.new(1, -184, 0, 14)
    v21.BackgroundTransparency = 1
    v21.Text = "Gold: 0"
    v21.TextColor3 = Color3.fromRGB(255, 220, 90)
    v21.TextSize = 22
    v21.TextXAlignment = Enum.TextXAlignment.Right
    u15(v21, Enum.FontWeight.Bold)
    v21.Parent = v19
    local v22 = Instance.new("TextButton")
    v22.Name = "CloseBtn"
    v22.Size = UDim2.new(0, 34, 0, 34)
    v22.Position = UDim2.new(1, -42, 0, 10)
    v22.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
    v22.BorderSizePixel = 1
    v22.BorderColor3 = Color3.fromRGB(120, 75, 75)
    v22.Text = "X"
    v22.TextColor3 = Color3.fromRGB(255, 255, 255)
    v22.TextSize = 22
    u15(v22, Enum.FontWeight.Bold)
    v22.Parent = v19
    local v23 = Instance.new("TextLabel")
    v23.Name = "Message"
    v23.Size = UDim2.new(1, -28, 0, 26)
    v23.Position = UDim2.new(0, 14, 0, 48)
    v23.BackgroundTransparency = 1
    v23.Text = ""
    v23.TextColor3 = Color3.fromRGB(180, 200, 255)
    v23.TextSize = 18
    v23.TextXAlignment = Enum.TextXAlignment.Left
    u15(v23, Enum.FontWeight.Regular)
    v23.Parent = v19
    local v24 = Instance.new("Frame")
    v24.Name = "Header"
    v24.Size = UDim2.new(1, -28, 0, 34)
    v24.Position = UDim2.new(0, 14, 0, 82)
    v24.BackgroundColor3 = Color3.fromRGB(33, 36, 44)
    v24.BorderSizePixel = 1
    v24.BorderColor3 = Color3.fromRGB(80, 84, 96)
    v24.Parent = v19
    local v25 = Instance.new("TextLabel")
    v25.Size = UDim2.new(0, 70, 1, 0)
    v25.Position = UDim2.new(0, 0, 0, 0)
    v25.BackgroundTransparency = 1
    v25.Text = "Image"
    v25.TextColor3 = Color3.fromRGB(230, 230, 230)
    v25.TextSize = 18
    u15(v25, Enum.FontWeight.Bold)
    v25.Parent = v24
    local v26 = Instance.new("TextLabel")
    v26.Size = UDim2.new(0, 220, 1, 0)
    v26.Position = UDim2.new(0, 82, 0, 0)
    v26.BackgroundTransparency = 1
    v26.Text = "Name"
    v26.TextColor3 = Color3.fromRGB(230, 230, 230)
    v26.TextSize = 18
    v26.TextXAlignment = Enum.TextXAlignment.Left
    u15(v26, Enum.FontWeight.Bold)
    v26.Parent = v24
    local v27 = Instance.new("TextLabel")
    v27.Size = UDim2.new(0, 110, 1, 0)
    v27.Position = UDim2.new(1, -226, 0, 0)
    v27.BackgroundTransparency = 1
    v27.Text = "Price"
    v27.TextColor3 = Color3.fromRGB(230, 230, 230)
    v27.TextSize = 18
    v27.TextXAlignment = Enum.TextXAlignment.Right
    u15(v27, Enum.FontWeight.Bold)
    v27.Parent = v24
    local v28 = Instance.new("TextLabel")
    v28.Size = UDim2.new(0, 90, 1, 0)
    v28.Position = UDim2.new(1, -98, 0, 0)
    v28.BackgroundTransparency = 1
    v28.Text = "Action"
    v28.TextColor3 = Color3.fromRGB(230, 230, 230)
    v28.TextSize = 18
    v28.TextXAlignment = Enum.TextXAlignment.Center
    u15(v28, Enum.FontWeight.Bold)
    v28.Parent = v24
    local u29 = Instance.new("ScrollingFrame")
    u29.Name = "Scroll"
    u29.Size = UDim2.new(1, -28, 1, -128)
    u29.Position = UDim2.new(0, 14, 0, 122)
    u29.BackgroundColor3 = Color3.fromRGB(15, 17, 22)
    u29.BorderSizePixel = 1
    u29.BorderColor3 = Color3.fromRGB(80, 84, 96)
    u29.ScrollBarThickness = 8
    u29.CanvasSize = UDim2.new(0, 0, 0, 0)
    u29.Parent = v19
    local v30 = Instance.new("Frame")
    v30.Name = "List"
    v30.Size = UDim2.new(1, -8, 0, 0)
    v30.Position = UDim2.new(0, 4, 0, 4)
    v30.BackgroundTransparency = 1
    v30.Parent = u29
    local u31 = Instance.new("UIListLayout")
    u31.Padding = UDim.new(0, 6)
    u31.Parent = v30
    u31:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u31
        --]]
        u29.CanvasSize = UDim2.new(0, 0, 0, u31.AbsoluteContentSize.Y + 8)
    end)
    v22.Activated:Connect(function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
        --]]
        u18.Enabled = false
        u6:FireServer({
            ["type"] = "close"
        })
    end)
    u9.gui = u18
    u9.root = v19
    u9.title = v20
    u9.gold = v21
    u9.message = v23
    u9.scroll = u29
    u9.list = v30
    u9.closeBtn = v22
    return u18
end
local function u39(p33, p34) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v35 = Instance.new("Frame")
    v35.Size = UDim2.new(0, 54, 0, 54)
    v35.Position = UDim2.new(0, 8, 0.5, -27)
    v35.BackgroundColor3 = Color3.fromRGB(42, 45, 55)
    v35.BorderSizePixel = 1
    v35.BorderColor3 = Color3.fromRGB(80, 84, 96)
    v35.Parent = p33
    local v36 = Instance.new("ImageLabel")
    v36.Size = UDim2.new(1, -6, 1, -6)
    v36.Position = UDim2.new(0, 3, 0, 3)
    v36.BackgroundTransparency = 1
    v36.BorderSizePixel = 0
    local v37 = p34.icon
    v36.Image = type(v37) == "string" and (p34.icon or "") or ""
    v36.ScaleType = Enum.ScaleType.Fit
    v36.Parent = v35
    if v36.Image == "" then
        local v38 = Instance.new("TextLabel")
        v38.Size = UDim2.new(1, 0, 1, 0)
        v38.BackgroundTransparency = 1
        v38.Text = "IMG"
        v38.TextColor3 = Color3.fromRGB(170, 175, 190)
        v38.TextSize = 16
        u15(v38, Enum.FontWeight.Bold)
        v38.Parent = v35
    end
end
local function u54(p40) --[[ Line: 217 ]]
    local v41 = p40.qty
    local v42 = tonumber(v41) or 0
    local v43 = math.floor(v42)
    local v44 = math.max(0, v43)
    local v45 = p40.price
    local v46 = tonumber(v45) or 0
    local v47 = math.floor(v46)
    local v48 = math.max(0, v47)
    if not p40.isWeapon then
        local v49 = p40.category or "item"
        return tostring(v49) .. " | \234\176\156\235\139\185 " .. tostring(v48) .. " | \235\179\180\236\156\160 x" .. tostring(v44)
    end
    local v50 = p40.attackPower
    local v51 = tonumber(v50) or 0
    local v52 = math.floor(v51)
    local v53 = math.max(0, v52)
    return "ATK +" .. tostring(v53) .. " | \235\179\180\236\156\160 x" .. tostring(v44)
end
local function u67(u55) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u39
        [3] = u15
        [4] = u54
        [5] = u6
    --]]
    local v56 = Instance.new("Frame")
    local v57 = u55.itemId or "item"
    v56.Name = "Row_" .. tostring(v57)
    v56.Size = UDim2.new(1, -4, 0, 70)
    v56.BackgroundColor3 = Color3.fromRGB(25, 27, 34)
    v56.BorderSizePixel = 1
    v56.BorderColor3 = Color3.fromRGB(68, 72, 84)
    v56.Parent = u9.list
    u39(v56, u55)
    local v58 = Instance.new("TextLabel")
    v58.Size = UDim2.new(0, 220, 0, 28)
    v58.Position = UDim2.new(0, 76, 0, 10)
    v58.BackgroundTransparency = 1
    local v59 = u55.name or (u55.itemId or "Item")
    v58.Text = tostring(v59)
    v58.TextColor3 = Color3.fromRGB(255, 255, 255)
    v58.TextSize = 24
    v58.TextXAlignment = Enum.TextXAlignment.Left
    u15(v58, Enum.FontWeight.Bold)
    v58.Parent = v56
    local v60 = Instance.new("TextLabel")
    v60.Size = UDim2.new(0, 220, 0, 22)
    v60.Position = UDim2.new(0, 76, 0, 40)
    v60.BackgroundTransparency = 1
    v60.Text = u54(u55)
    v60.TextColor3 = Color3.fromRGB(170, 205, 255)
    v60.TextSize = 18
    v60.TextXAlignment = Enum.TextXAlignment.Left
    u15(v60, Enum.FontWeight.Regular)
    v60.Parent = v56
    local v61 = Instance.new("TextLabel")
    v61.Size = UDim2.new(0, 110, 1, 0)
    v61.Position = UDim2.new(1, -226, 0, 0)
    v61.BackgroundTransparency = 1
    local v62 = u55.totalPrice
    local v63 = tonumber(v62) or 0
    local v64 = math.floor(v63)
    local v65 = math.max(0, v64)
    v61.Text = tostring(v65)
    v61.TextColor3 = Color3.fromRGB(255, 220, 90)
    v61.TextSize = 22
    v61.TextXAlignment = Enum.TextXAlignment.Right
    u15(v61, Enum.FontWeight.Bold)
    v61.Parent = v56
    local v66 = Instance.new("TextButton")
    v66.Size = UDim2.new(0, 90, 0, 40)
    v66.Position = UDim2.new(1, -100, 0.5, -20)
    v66.BorderSizePixel = 1
    v66.Parent = v56
    u15(v66, Enum.FontWeight.Bold)
    if u55.equipped then
        v66.Text = "\236\158\165\236\176\169\236\164\145"
        v66.BackgroundColor3 = Color3.fromRGB(80, 65, 35)
        v66.BorderColor3 = Color3.fromRGB(150, 125, 70)
        v66.TextColor3 = Color3.fromRGB(255, 230, 140)
        v66.AutoButtonColor = false
        v66.Active = false
    else
        v66.Text = "\237\140\148\234\184\176"
        v66.BackgroundColor3 = Color3.fromRGB(72, 48, 48)
        v66.BorderColor3 = Color3.fromRGB(140, 90, 90)
        v66.TextColor3 = Color3.fromRGB(255, 255, 255)
        v66.AutoButtonColor = true
        v66.Active = true
        v66.Activated:Connect(function() --[[ Line: 289 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u55
            --]]
            u6:FireServer({
                ["type"] = "sell",
                ["itemId"] = u55.itemId
            })
        end)
    end
end
local function u82(p68) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u9
        [3] = u8
        [4] = u7
        [5] = u17
        [6] = u67
    --]]
    u32()
    u9.gui.Enabled = true
    local v69 = u8.find(u7, "DialogueGui")
    if v69 then
        v69.Enabled = false
    end
    local v70 = u9.title
    local v71 = p68.npcName or "Item Seller"
    v70.Text = tostring(v71)
    local v72 = u9.gold
    local v73 = p68.gold
    local v74 = tonumber(v73) or 0
    local v75 = math.floor(v74)
    local v76 = math.max(0, v75)
    v72.Text = "Gold: " .. tostring(v76)
    local v77 = u9.message
    local v78 = p68.message or ""
    v77.Text = tostring(v78)
    u17()
    local v79 = ipairs
    local v80 = p68.items
    for _, v81 in v79(type(v80) == "table" and (p68.items or {}) or {}) do
        u67(v81)
    end
end
v5.OnClientEvent:Connect(function(p83) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u82
    --]]
    if p83 then
        if p83.open == false then
            if u9.gui then
                u9.gui.Enabled = false
            end
        else
            u82(p83)
        end
    else
        return
    end
end)
u3.InputBegan:Connect(function(p84, p85) --[[ Line: 316 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u6
    --]]
    if not (p85 or u3:GetFocusedTextBox()) then
        if p84.KeyCode == Enum.KeyCode.Escape and (u9.gui and u9.gui.Enabled) then
            u9.gui.Enabled = false
            u6:FireServer({
                ["type"] = "close"
            })
        end
    end
end)