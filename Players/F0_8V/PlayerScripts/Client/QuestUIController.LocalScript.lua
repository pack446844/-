local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Defs.QuestDefs)
local u5 = require(v2.Shared.Defs.ItemDefs)
local u6 = require(v2.Shared.Defs.NPCDefs)
local u7 = require(v2.Shared.Defs.MonsterDefs)
local u8 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u9 = require(v2.Shared.Util.PlatformGui)
local u10 = nil
local function u16(p11, p12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
    --]]
    local v13 = p11.condition or {}
    local v14
    if p12 then
        local v15 = p12.progress
        v14 = tonumber(v15) or 0
    else
        v14 = 0
    end
    if v13.type == "collect_item" then
        return (u5[v13.itemId] and u5[v13.itemId].displayName or v13.itemId) .. ": " .. v14 .. " / " .. (v13.required or 0)
    elseif v13.type == "kill" then
        return (u7[v13.target] and u7[v13.target].displayName or v13.target) .. " \236\178\152\236\185\152: " .. v14 .. " / " .. (v13.required or 0)
    elseif v13.type == "reach_level" then
        return "\235\160\136\235\178\168: " .. v14 .. " / " .. (v13.required or 0)
    else
        return v13.type ~= "talk_npc" and "\236\167\132\237\150\137 \236\164\145" or "\235\140\128\237\153\148 \237\154\159\236\136\152: " .. v14 .. " / " .. (v13.required or 0)
    end
end
local function u35(p17, p18, p19) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
    --]]
    local v20 = Instance.new("Frame")
    v20.Name = "Quest_" .. p18.questId
    v20.LayoutOrder = p18.sortOrder or 999
    v20.Size = UDim2.new(1, -8, 0, 118)
    v20.BackgroundColor3 = Color3.fromRGB(18, 22, 38)
    v20.BorderSizePixel = 0
    v20.Parent = p17
    local v21 = Instance.new("UICorner")
    v21.CornerRadius = UDim.new(0, 8)
    v21.Parent = v20
    local v22 = Instance.new("TextLabel")
    v22.Parent = v20
    v22.Size = UDim2.new(1, -16, 0, 26)
    v22.Position = UDim2.new(0, 10, 0, 6)
    v22.BackgroundTransparency = 1
    v22.Text = p18.title
    v22.TextColor3 = Color3.fromRGB(255, 210, 60)
    v22.TextScaled = true
    v22.Font = Enum.Font.GothamBold
    v22.TextXAlignment = Enum.TextXAlignment.Left
    local v23 = Instance.new("TextLabel")
    v23.Parent = v20
    v23.Size = UDim2.new(1, -16, 0, 24)
    v23.Position = UDim2.new(0, 10, 0, 32)
    v23.BackgroundTransparency = 1
    v23.Text = p18.description
    v23.TextColor3 = Color3.fromRGB(200, 200, 210)
    v23.TextScaled = true
    v23.Font = Enum.Font.Gotham
    v23.TextXAlignment = Enum.TextXAlignment.Left
    v23.TextWrapped = true
    local v24 = Instance.new("TextLabel")
    v24.Parent = v20
    v24.Size = UDim2.new(1, -16, 0, 22)
    v24.Position = UDim2.new(0, 10, 0, 58)
    v24.BackgroundTransparency = 1
    v24.Text = "\235\170\169\237\145\156: " .. u16(p18, p19)
    v24.TextColor3 = Color3.fromRGB(150, 220, 150)
    v24.TextScaled = true
    v24.Font = Enum.Font.Gotham
    v24.TextXAlignment = Enum.TextXAlignment.Left
    local v25 = Instance.new("TextLabel")
    v25.Parent = v20
    v25.Size = UDim2.new(1, -16, 0, 18)
    v25.Position = UDim2.new(0, 10, 0, 82)
    v25.BackgroundTransparency = 1
    v25.TextScaled = true
    v25.Font = Enum.Font.GothamBold
    v25.TextXAlignment = Enum.TextXAlignment.Left
    local v26 = p18.condition
    if v26 then
        v26 = p18.condition.required
    end
    local v27 = tonumber(v26) or 0
    local v28
    if p19 then
        local v29 = p19.progress
        v28 = tonumber(v29) or 0
    else
        v28 = 0
    end
    if v27 <= v28 then
        local v30 = "\236\131\129\237\131\156: \236\153\132\235\163\140 \234\176\128\235\138\165 - "
        local v31 = p18.turnInNpcId or p18.giverNpcId
        local v32
        if v31 then
            v32 = u6[v31] or nil
        else
            v32 = nil
        end
        v25.Text = v30 .. (v32 and v32.displayName or tostring(v31 or "NPC")) .. "\236\151\144\234\178\140 \235\143\140\236\149\132\234\176\128\236\132\184\236\154\148"
        v25.TextColor3 = Color3.fromRGB(80, 255, 120)
    else
        v25.Text = "\236\131\129\237\131\156: \236\167\132\237\150\137 \236\164\145"
        v25.TextColor3 = Color3.fromRGB(190, 190, 210)
    end
    local v33 = "\235\179\180\236\131\129: "
    if p18.reward and p18.reward.exp then
        v33 = v33 .. "EXP +" .. p18.reward.exp .. "  "
    end
    if p18.reward and p18.reward.gold then
        v33 = v33 .. "Gold +" .. p18.reward.gold
    end
    local v34 = Instance.new("TextLabel")
    v34.Parent = v20
    v34.Size = UDim2.new(1, -16, 0, 18)
    v34.Position = UDim2.new(0, 10, 0, 98)
    v34.BackgroundTransparency = 1
    v34.Text = v33
    v34.TextColor3 = Color3.fromRGB(255, 200, 50)
    v34.TextScaled = true
    v34.Font = Enum.Font.Gotham
    v34.TextXAlignment = Enum.TextXAlignment.Left
end
local function u46(p36, p37) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u35
    --]]
    if p36 then
        local u38 = p36:FindFirstChild("QuestBox")
        if u38 then
            u38 = u38:FindFirstChild("QuestScroll")
        end
        if u38 then
            local u39 = u38:FindFirstChild("QuestListLayout")
            if not u39 then
                u39 = Instance.new("UIListLayout")
                u39.Name = "QuestListLayout"
                u39.Padding = UDim.new(0, 8)
                u39.SortOrder = Enum.SortOrder.LayoutOrder
                u39.Parent = u38
            end
            for _, v40 in ipairs(u38:GetChildren()) do
                if v40:IsA("Frame") and v40.Name:match("^Quest_") then
                    v40:Destroy()
                end
            end
            local v41 = u38:FindFirstChild("EmptyLabel")
            local v42 = false
            for v43, v44 in pairs(p37 or {}) do
                if v44.accepted and not v44.completed then
                    local v45 = u4[v43]
                    if v45 then
                        u35(u38, v45, v44)
                        v42 = true
                    end
                end
            end
            if v41 then
                v41.Visible = not v42
            end
            task.defer(function() --[[ Line: 175 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u39
                --]]
                if u38 and (u38.Parent and (u38:IsA("ScrollingFrame") and u39)) then
                    u38.CanvasSize = UDim2.new(0, 0, 0, u39.AbsoluteContentSize.Y + 8)
                end
            end)
        end
    else
        return
    end
end
local function u48(p47) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u46
        [3] = u8
    --]]
    if p47 ~= nil then
        u10 = p47 or {}
    end
    u46(u8:FindFirstChild("QuestGui"), u10)
    u46(u8:FindFirstChild("QuestGui_Mobile"), u10)
end
local function u51(p49) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    if p49 then
        local v50 = p49:FindFirstChild("BtnQuest", true)
        if v50 and v50:IsA("GuiButton") then
            if v50:GetAttribute("QuestBound") ~= true then
                v50:SetAttribute("QuestBound", true)
                v50.Activated:Connect(function() --[[ Line: 197 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u8
                    --]]
                    if u9.find(u8, "QuestGui") then
                        u9.toggle(u8, "QuestGui")
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
local function u54(u52) --[[ Line: 203 ]]
    if u52 then
        local v53 = u52:FindFirstChild("QuestBox")
        if v53 then
            v53 = v53:FindFirstChild("CloseBtn")
        end
        if v53 and v53:IsA("GuiButton") then
            if v53:GetAttribute("QuestCloseBound") ~= true then
                v53:SetAttribute("QuestCloseBound", true)
                v53.Activated:Connect(function() --[[ Line: 210 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                    --]]
                    u52.Enabled = false
                end)
            end
        else
            return
        end
    else
        return
    end
end
local function u55() --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u51
        [2] = u8
        [3] = u54
        [4] = u10
        [5] = u48
    --]]
    u51(u8:FindFirstChild("MainHUD"))
    u51(u8:FindFirstChild("MainHUD_Mobile"))
    u54(u8:FindFirstChild("QuestGui"))
    u54(u8:FindFirstChild("QuestGui_Mobile"))
    if u10 then
        u48(u10)
    end
end
task.defer(function() --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u55
    --]]
    u9.waitUntilReady(5)
    u55()
end)
u9.modeChanged:Connect(function() --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u55
    --]]
    task.defer(u55)
end)
u8.ChildAdded:Connect(function(p56) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u55
    --]]
    if p56 then
        if p56.Name == "MainHUD" or (p56.Name == "MainHUD_Mobile" or (p56.Name == "QuestGui" or p56.Name == "QuestGui_Mobile")) then
            task.defer(u55)
        end
    end
end)
v3.QuestSync.OnClientEvent:Connect(function(p57) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    u48(p57)
end)
v3.DataSync.OnClientEvent:Connect(function(p58) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    if p58 and p58.questProgress then
        u48(p58.questProgress)
    end
end)
print("[QuestUIController] initialized")