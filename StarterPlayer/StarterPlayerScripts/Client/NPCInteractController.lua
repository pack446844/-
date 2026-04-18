local v1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("RunService")
local u5 = game:GetService("TextService")
local u6 = v3.Shared.Net
local v7 = u6:WaitForChild("WeaponShopSync")
local v8 = u6:WaitForChild("ItemSellSync")
local u9 = require(v3.Shared.Defs.NPCDefs)
local u10 = v1.LocalPlayer
local u11 = u10:WaitForChild("PlayerGui")
local u12 = require(v3.Shared.Util.PlatformGui)
local u13 = nil
local u14 = false
local u15 = 0
local function u24() --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v16 = u10
    local v17 = tonumber(v16:GetAttribute("JailedRemainingSeconds")) or 0
    local v18 = math.floor(v17)
    local v19 = math.max(0, v18)
    if v19 > 0 then
        return v19
    end
    local v20 = u10
    local v21 = tonumber(v20:GetAttribute("JailedUntil")) or 0
    local v22 = math.floor(v21)
    local v23 = math.max(0, v22) - os.time()
    return math.max(0, v23)
end
local function u27() --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
    --]]
    local v25 = u12.find(u11, "DialogueGui")
    if v25 then
        local v26 = v25:FindFirstChild("DlgBox")
        if v26 then
            return v25, v26, v26:FindFirstChild("NpcName"), v26:FindFirstChild("DialogueText"), v26:FindFirstChild("Hint")
        else
            return nil
        end
    else
        return nil
    end
end
local function u32(p28) --[[ Line: 60 ]]
    local v29 = p28:FindFirstChild("ActionRow")
    if v29 then
        return v29
    end
    local v30 = Instance.new("Frame")
    v30.Name = "ActionRow"
    v30.Size = UDim2.new(1, -36, 0, 44)
    v30.Position = UDim2.new(0, 18, 1, -66)
    v30.BackgroundTransparency = 1
    v30.Parent = p28
    local v31 = Instance.new("UIListLayout")
    v31.FillDirection = Enum.FillDirection.Horizontal
    v31.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v31.VerticalAlignment = Enum.VerticalAlignment.Center
    v31.Padding = UDim.new(0, 10)
    v31.Parent = v30
    return v30
end
local function u47(p33, u34, u35, p36, p37, p38) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local u39 = tostring(p33 or "")
    local v40 = tonumber(p36) or 120
    local v41 = math.floor(v40)
    local u42 = math.max(120, v41)
    local v43, v44 = pcall(function() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u39
            [3] = u35
            [4] = u34
            [5] = u42
        --]]
        return u5:GetTextSize(u39, u35, u34, Vector2.new(u42, 1000))
    end)
    local v45 = (v43 and (v44 and v44.Y) or u35 * 2) + 8
    if p37 then
        v45 = math.max(p37, v45)
    end
    if p38 then
        v45 = math.min(p38, v45)
    end
    local v46 = v45 + 0.5
    return math.floor(v46)
end
local function u57(p48) --[[ Line: 91 ]]
    if p48 then
        local v49 = workspace.CurrentCamera
        local v50 = v49 and v49.ViewportSize or Vector2.new(1920, 1080)
        local v51 = v50.X * 0.36
        local v52 = math.floor(v51)
        local v53 = math.clamp(v52, 600, 760)
        local v54 = v50.Y * 0.31
        local v55 = math.floor(v54)
        local v56 = math.clamp(v55, 300, 400)
        p48.AnchorPoint = Vector2.new(0.5, 0.5)
        p48.Position = UDim2.new(0.5, 0, 0.4, 0)
        p48.Size = UDim2.new(0, v53, 0, v56)
    end
end
local function u76(p58, p59, p60, p61, p62) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u47
    --]]
    if p58 then
        local v63 = p58.AbsoluteSize
        local v64 = v63.X > 0 and (v63.X or 560) or 560
        local v65 = v63.Y > 0 and v63.Y or 260
        local v66 = v64 - 36
        local v67 = math.max(180, v66)
        local v68 = v65 - 66
        local v69 = math.max(134, v68)
        if p59 then
            p59.Position = UDim2.new(0, 18, 0, 14)
            p59.Size = UDim2.new(1, -36, 0, 28)
            p59.TextXAlignment = Enum.TextXAlignment.Left
            p59.TextYAlignment = Enum.TextYAlignment.Center
        end
        local v70 = v65 - (54 + (v65 - v69 + 12 + 22) + 10)
        local v71 = math.max(52, v70)
        local v72 = p60 and (u47(p60.Text, p60.Font, p60.TextSize, v67, 52, v71) or 52) or 52
        if p60 then
            p60.TextWrapped = true
            p60.TextXAlignment = Enum.TextXAlignment.Left
            p60.TextYAlignment = Enum.TextYAlignment.Top
            p60.Position = UDim2.new(0, 18, 0, 54)
            p60.Size = UDim2.new(1, -36, 0, v72)
        end
        local v73 = 54 + v72 + 12
        local v74 = v69 - 32
        local v75 = math.max(v73, v74)
        if p61 then
            p61.Position = UDim2.new(0, 18, 0, v75)
            p61.Size = UDim2.new(1, -36, 0, 22)
            p61.TextXAlignment = Enum.TextXAlignment.Left
            p61.TextYAlignment = Enum.TextYAlignment.Center
        end
        if p62 then
            p62.Position = UDim2.new(0, 18, 0, v69)
            p62.Size = UDim2.new(1, -36, 0, 44)
        end
    end
end
local function u79(p77) --[[ Line: 137 ]]
    for _, v78 in ipairs(p77:GetChildren()) do
        if v78:IsA("TextButton") then
            v78:Destroy()
        end
    end
end
local function u90(p80, p81) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u79
        [2] = u12
        [3] = u11
        [4] = u14
        [5] = u13
        [6] = u6
    --]]
    u79(p80)
    for _, u82 in ipairs(p81 or {}) do
        local v83 = Instance.new("TextButton")
        local v84 = u82.id or "action"
        v83.Name = "Btn_" .. tostring(v84)
        v83.Size = UDim2.new(0, 116, 1, 0)
        v83.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        v83.TextColor3 = Color3.fromRGB(255, 255, 255)
        local v85 = u82.text or "\236\132\160\237\131\157"
        v83.Text = tostring(v85)
        v83.TextScaled = true
        v83.AutoButtonColor = true
        v83.Font = Enum.Font.GothamBold
        v83.Parent = p80
        local v86 = Instance.new("UICorner")
        v86.CornerRadius = UDim.new(0, 6)
        v86.Parent = v83
        v83.Activated:Connect(function() --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u12
                [3] = u11
                [4] = u14
                [5] = u13
                [6] = u6
            --]]
            local v87 = u82.id or ""
            local v88 = tostring(v87)
            if v88 == "close" then
                local v89 = u12.find(u11, "DialogueGui")
                if v89 then
                    v89.Enabled = false
                end
                u14 = false
                u13 = nil
            elseif u13 then
                if not u13.npcModelName then
                    return
                end
                u6.NPCInteractRequest:FireServer({
                    ["type"] = "action",
                    ["npcModelName"] = u13.npcModelName,
                    ["actionId"] = v88
                })
            end
        end)
    end
end
local function u98(p91) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u13
        [3] = u14
        [4] = u57
        [5] = u32
        [6] = u90
        [7] = u76
    --]]
    local v92, v93, v94, v95, v96 = u27()
    if v92 and v93 then
        u13 = p91
        u14 = true
        if v94 then
            v94.Text = p91.npcName or "NPC"
        end
        if v95 then
            v95.TextScaled = false
            v95.TextSize = 26
            v95.TextWrapped = true
            v95.TextXAlignment = Enum.TextXAlignment.Left
            v95.TextYAlignment = Enum.TextYAlignment.Top
            v95.Text = p91.questTitle and "[" .. p91.questTitle .. "]\n" .. (p91.dialogue or "") or (p91.dialogue or "")
        end
        if v96 then
            v96.Text = p91.hintText or ""
        end
        u57(v93)
        local v97 = u32(v93)
        u90(v97, p91.buttons or {})
        u76(v93, v94, v95, v96, v97)
        v92.Enabled = true
    end
end
local function u106(p99) --[[ Line: 208 ]]
    local v100 = workspace:FindFirstChild("FantasyVillage")
    local v101 = v100 and v100:FindFirstChild("NPCs") or nil
    local v102 = v101 and v101:FindFirstChild(p99) or nil
    if not v102 then
        return nil
    end
    for _, v103 in ipairs({
        "HumanoidRootPart",
        "Head",
        "UpperTorso",
        "Torso"
    }) do
        local v104 = v102:FindFirstChild(v103, true)
        if v104 and v104:IsA("BasePart") then
            return v104
        end
    end
    if v102:IsA("Model") and v102.PrimaryPart then
        return v102.PrimaryPart
    end
    for _, v105 in ipairs(v102:GetDescendants()) do
        if v105:IsA("BasePart") then
            return v105
        end
    end
    return nil
end
local function u111() --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u9
        [4] = u10
        [5] = u106
    --]]
    if u14 and (u13 and u13.npcModelName) then
        local v107 = u13.npcId
        local v108 = v107 and u9[v107] or nil
        local v109 = u10.Character
        if v109 then
            v109 = v109:FindFirstChild("HumanoidRootPart")
        end
        local v110 = u106(u13.npcModelName)
        if v108 and (v109 and v110) then
            return (v109.Position - v110.Position).Magnitude <= (v108.interactRange or 10) + 2
        else
            return false
        end
    else
        return true
    end
end
v4.Heartbeat:Connect(function(p112) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u24
        [4] = u14
        [5] = u12
        [6] = u11
        [7] = u13
        [8] = u111
    --]]
    u15 = u15 + p112
    if u15 < 0.2 then
        return
    else
        u15 = 0
        if u10:GetAttribute("IsJailed") == true and true or u24() > 0 then
            if u14 then
                local v113 = u12.find(u11, "DialogueGui")
                if v113 then
                    v113.Enabled = false
                end
                u14 = false
                u13 = nil
            end
        elseif u14 and not u111() then
            local v114 = u12.find(u11, "DialogueGui")
            if v114 then
                v114.Enabled = false
            end
            u14 = false
            u13 = nil
        end
    end
end)
u2.InputBegan:Connect(function(p115, p116) --[[ Line: 250 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u12
        [4] = u11
        [5] = u13
    --]]
    if not (p116 or u2:GetFocusedTextBox()) then
        if p115.KeyCode == Enum.KeyCode.Escape and u14 then
            local v117 = u12.find(u11, "DialogueGui")
            if v117 then
                v117.Enabled = false
            end
            u14 = false
            u13 = nil
        end
    end
end)
u10:GetAttributeChangedSignal("JailedRemainingSeconds"):Connect(function() --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u24
        [3] = u14
        [4] = u12
        [5] = u11
        [6] = u13
    --]]
    if (u10:GetAttribute("IsJailed") == true and true or u24() > 0) and u14 then
        local v118 = u12.find(u11, "DialogueGui")
        if v118 then
            v118.Enabled = false
        end
        u14 = false
        u13 = nil
    end
end)
u10:GetAttributeChangedSignal("IsJailed"):Connect(function() --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u24
        [3] = u14
        [4] = u12
        [5] = u11
        [6] = u13
    --]]
    if (u10:GetAttribute("IsJailed") == true and true or u24() > 0) and u14 then
        local v119 = u12.find(u11, "DialogueGui")
        if v119 then
            v119.Enabled = false
        end
        u14 = false
        u13 = nil
    end
end)
u10:GetAttributeChangedSignal("JailedUntil"):Connect(function() --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u24
        [3] = u14
        [4] = u12
        [5] = u11
        [6] = u13
    --]]
    if (u10:GetAttribute("IsJailed") == true and true or u24() > 0) and u14 then
        local v120 = u12.find(u11, "DialogueGui")
        if v120 then
            v120.Enabled = false
        end
        u14 = false
        u13 = nil
    end
end)
u10.CharacterAdded:Connect(function() --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u13
    --]]
    local v121 = u12.find(u11, "DialogueGui")
    if v121 then
        v121.Enabled = false
    end
    u14 = false
    u13 = nil
end)
u6.NPCDialogueSync.OnClientEvent:Connect(function(p122) --[[ Line: 271 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u13
        [5] = u98
    --]]
    if p122 then
        if p122.close == true then
            local v123 = u12.find(u11, "DialogueGui")
            if v123 then
                v123.Enabled = false
            end
            u14 = false
            u13 = nil
        else
            u98(p122)
        end
    else
        return
    end
end)
v7.OnClientEvent:Connect(function(p124) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u13
    --]]
    if p124 and p124.open == true then
        local v125 = u12.find(u11, "DialogueGui")
        if v125 then
            v125.Enabled = false
        end
        u14 = false
        u13 = nil
    end
end)
v8.OnClientEvent:Connect(function(p126) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u13
    --]]
    if p126 and p126.open == true then
        local v127 = u12.find(u11, "DialogueGui")
        if v127 then
            v127.Enabled = false
        end
        u14 = false
        u13 = nil
    end
end)
print("[NPCInteractController] initialized")