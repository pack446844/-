local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = v2.Shared.Net
local v5 = v4:WaitForChild("WeaponShopSync")
local u6 = v4:WaitForChild("WeaponShopRequest")
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
    u18.Name = "WeaponShopGui"
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
    v20.Text = "Weapon Shop"
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
    u31.SortOrder = Enum.SortOrder.LayoutOrder
    u31.Padding = UDim.new(0, 6)
    u31.Parent = v30
    u31:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u31
        --]]
        u29.CanvasSize = UDim2.new(0, 0, 0, u31.AbsoluteContentSize.Y + 8)
    end)
    v22.Activated:Connect(function() --[[ Line: 179 ]]
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
local function u39(p33, p34) --[[ Line: 188 ]]
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
local function u53(u40, p41) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u39
        [3] = u15
        [4] = u6
    --]]
    local v42 = Instance.new("Frame")
    local v43 = tostring(p41 or 0)
    local v44 = u40.itemId or "item"
    v42.Name = "Row_" .. v43 .. "_" .. tostring(v44)
    v42.LayoutOrder = tonumber(p41) or 0
    v42.Size = UDim2.new(1, -4, 0, 70)
    v42.BackgroundColor3 = Color3.fromRGB(25, 27, 34)
    v42.BorderSizePixel = 1
    v42.BorderColor3 = Color3.fromRGB(68, 72, 84)
    v42.Parent = u9.list
    u39(v42, u40)
    local v45 = Instance.new("TextLabel")
    v45.Size = UDim2.new(0, 250, 1, 0)
    v45.Position = UDim2.new(0, 76, 0, 0)
    v45.BackgroundTransparency = 1
    local v46 = u40.name or (u40.itemId or "Item")
    v45.Text = tostring(v46)
    v45.TextColor3 = Color3.fromRGB(255, 255, 255)
    v45.TextSize = 24
    v45.TextXAlignment = Enum.TextXAlignment.Left
    v45.TextYAlignment = Enum.TextYAlignment.Center
    u15(v45, Enum.FontWeight.Bold)
    v45.Parent = v42
    local v47 = Instance.new("TextLabel")
    v47.Size = UDim2.new(0, 110, 1, 0)
    v47.Position = UDim2.new(1, -226, 0, 0)
    v47.BackgroundTransparency = 1
    local v48 = u40.price
    local v49 = tonumber(v48) or 0
    local v50 = math.floor(v49)
    local v51 = math.max(0, v50)
    v47.Text = tostring(v51)
    v47.TextColor3 = Color3.fromRGB(255, 220, 90)
    v47.TextSize = 22
    v47.TextXAlignment = Enum.TextXAlignment.Right
    u15(v47, Enum.FontWeight.Bold)
    v47.Parent = v42
    local v52 = Instance.new("TextButton")
    v52.Size = UDim2.new(0, 90, 0, 40)
    v52.Position = UDim2.new(1, -100, 0.5, -20)
    v52.BorderSizePixel = 1
    v52.Parent = v42
    u15(v52, Enum.FontWeight.Bold)
    if u40.equipped then
        v52.Text = "\236\158\165\236\176\169\236\164\145"
        v52.BackgroundColor3 = Color3.fromRGB(80, 65, 35)
        v52.BorderColor3 = Color3.fromRGB(150, 125, 70)
        v52.TextColor3 = Color3.fromRGB(255, 230, 140)
        v52.AutoButtonColor = false
        v52.Active = false
        return
    elseif u40.owned then
        v52.Text = "\235\179\180\236\156\160\236\164\145"
        v52.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
        v52.BorderColor3 = Color3.fromRGB(80, 95, 125)
        v52.TextColor3 = Color3.fromRGB(190, 205, 255)
        v52.AutoButtonColor = false
        v52.Active = false
    else
        v52.Text = "\236\130\172\234\184\176"
        v52.BackgroundColor3 = Color3.fromRGB(50, 72, 48)
        v52.BorderColor3 = Color3.fromRGB(95, 140, 90)
        v52.TextColor3 = Color3.fromRGB(255, 255, 255)
        v52.AutoButtonColor = true
        v52.Active = true
        v52.Activated:Connect(function() --[[ Line: 281 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u40
            --]]
            u6:FireServer({
                ["type"] = "buy",
                ["itemId"] = u40.itemId
            })
        end)
    end
end
local function u69(p54) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u9
        [3] = u8
        [4] = u7
        [5] = u17
        [6] = u53
    --]]
    u32()
    u9.gui.Enabled = true
    local v55 = u8.find(u7, "DialogueGui")
    if v55 then
        v55.Enabled = false
    end
    local v56 = u9.title
    local v57 = p54.npcName or "Weapon Shop"
    v56.Text = tostring(v57)
    local v58 = u9.gold
    local v59 = p54.gold
    local v60 = tonumber(v59) or 0
    local v61 = math.floor(v60)
    local v62 = math.max(0, v61)
    v58.Text = "Gold: " .. tostring(v62)
    local v63 = u9.message
    local v64 = p54.message or ""
    v63.Text = tostring(v64)
    u17()
    local v65 = ipairs
    local v66 = p54.items
    for v67, v68 in v65(type(v66) == "table" and (p54.items or {}) or {}) do
        u53(v68, v67)
    end
end
v5.OnClientEvent:Connect(function(p70) --[[ Line: 301 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u69
    --]]
    if p70 then
        if p70.open == false then
            if u9.gui then
                u9.gui.Enabled = false
            end
        else
            u69(p70)
        end
    else
        return
    end
end)
u3.InputBegan:Connect(function(p71, p72) --[[ Line: 310 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u6
    --]]
    if not (p72 or u3:GetFocusedTextBox()) then
        if p71.KeyCode == Enum.KeyCode.Escape and (u9.gui and u9.gui.Enabled) then
            u9.gui.Enabled = false
            u6:FireServer({
                ["type"] = "close"
            })
        end
    end
end)