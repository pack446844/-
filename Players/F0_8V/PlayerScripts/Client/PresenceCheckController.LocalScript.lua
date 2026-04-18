local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("Workspace")
local u4 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v2:WaitForChild("Shared"):WaitForChild("Net")
local v6 = v5:WaitForChild("PresenceCheckOpen")
local u7 = v5:WaitForChild("PresenceCheckSubmit")
local v8 = v5:WaitForChild("PresenceCheckClose")
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = {}
local u18 = nil
local u19 = 0
local u20 = 0
local u21 = {}
local u22 = {}
local u23 = false
local function u25() --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
        [3] = u23
        [4] = u17
    --]]
    u21 = {}
    u22 = {}
    u23 = false
    for _, v24 in ipairs(u17) do
        v24.AutoButtonColor = true
        v24.Active = true
        v24.BackgroundTransparency = 0.1
    end
end
local function u31(p26) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u18
        [3] = u22
        [4] = u21
        [5] = u20
        [6] = u7
    --]]
    if p26 and (not u23 and u18 ~= nil) then
        local v27 = p26:GetAttribute("ItemId")
        if type(v27) == "string" and (v27 ~= "" and u22[v27] ~= true) then
            u22[v27] = true
            u21[#u21 + 1] = v27
            p26.AutoButtonColor = false
            p26.Active = false
            p26.BackgroundTransparency = 0.45
            local v28 = #u21
            local v29 = u20
            local v30 = tonumber(v29) or 3
            if math.max(1, v30) <= v28 and not u23 then
                if u18 == nil then
                    return
                end
                u23 = true
                u7:FireServer({
                    ["challengeId"] = u18,
                    ["answer"] = u21
                })
            end
        end
    else
        return
    end
end
local function u35(p32, p33) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local u34 = Instance.new("TextButton")
    u34.Name = "Choice" .. tostring(p33)
    u34.BackgroundColor3 = Color3.fromRGB(39, 44, 58)
    u34.BackgroundTransparency = 0.1
    u34.BorderSizePixel = 0
    u34.AutoButtonColor = true
    u34.TextColor3 = Color3.fromRGB(255, 255, 255)
    u34.Font = Enum.Font.GothamBold
    u34.TextScaled = true
    u34.Text = ""
    u34.Parent = p32
    u34.MouseButton1Click:Connect(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u34
        --]]
        u31(u34)
    end)
    return u34
end
local function u40() --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u10
        [4] = u11
        [5] = u12
        [6] = u14
        [7] = u13
        [8] = u15
        [9] = u16
        [10] = u17
        [11] = u35
    --]]
    if not (u9 and u9.Parent) then
        u9 = Instance.new("ScreenGui")
        u9.Name = "PresenceCheckGui"
        u9.ResetOnSpawn = false
        u9.IgnoreGuiInset = true
        u9.DisplayOrder = 1000
        u9.Enabled = false
        u9.Parent = u4
        u10 = Instance.new("Frame")
        u10.Name = "Blocker"
        u10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        u10.BackgroundTransparency = 0.35
        u10.BorderSizePixel = 0
        u10.Size = UDim2.fromScale(1, 1)
        u10.Parent = u9
        u11 = Instance.new("Frame")
        u11.Name = "Panel"
        u11.AnchorPoint = Vector2.new(0.5, 0.5)
        u11.Position = UDim2.fromScale(0.5, 0.5)
        u11.Size = UDim2.new(0, 460, 0, 300)
        u11.BackgroundColor3 = Color3.fromRGB(24, 28, 38)
        u11.BorderSizePixel = 0
        u11.Parent = u10
        local v36 = Instance.new("UICorner")
        v36.CornerRadius = UDim.new(0, 16)
        v36.Parent = u11
        local v37 = Instance.new("UISizeConstraint")
        v37.MinSize = Vector2.new(320, 240)
        v37.MaxSize = Vector2.new(540, 340)
        v37.Parent = u11
        u12 = Instance.new("TextLabel")
        u12.Name = "Title"
        u12.BackgroundTransparency = 1
        u12.Size = UDim2.new(1, -28, 0, 34)
        u12.Position = UDim2.new(0, 14, 0, 12)
        u12.TextXAlignment = Enum.TextXAlignment.Left
        u12.Font = Enum.Font.GothamBold
        u12.TextSize = 22
        u12.TextColor3 = Color3.fromRGB(255, 255, 255)
        u12.Text = "\236\130\172\235\131\165 \237\153\149\236\157\184"
        u12.Parent = u11
        u14 = Instance.new("TextLabel")
        u14.Name = "Timer"
        u14.BackgroundTransparency = 1
        u14.Size = UDim2.new(0, 150, 0, 28)
        u14.Position = UDim2.new(1, -164, 0, 16)
        u14.TextXAlignment = Enum.TextXAlignment.Right
        u14.Font = Enum.Font.GothamBold
        u14.TextSize = 18
        u14.TextColor3 = Color3.fromRGB(255, 220, 120)
        u14.Text = "\235\130\168\236\157\128 \236\139\156\234\176\132  00:00"
        u14.Parent = u11
        u13 = Instance.new("TextLabel")
        u13.Name = "Prompt"
        u13.BackgroundTransparency = 1
        u13.Size = UDim2.new(1, -28, 0, 54)
        u13.Position = UDim2.new(0, 14, 0, 56)
        u13.TextWrapped = true
        u13.TextXAlignment = Enum.TextXAlignment.Left
        u13.TextYAlignment = Enum.TextYAlignment.Top
        u13.Font = Enum.Font.Gotham
        u13.TextSize = 18
        u13.TextColor3 = Color3.fromRGB(225, 230, 240)
        u13.Text = "\236\149\132\235\158\152 \236\136\156\236\132\156\235\140\128\235\161\156 \235\136\140\235\159\172\236\163\188\236\132\184\236\154\148."
        u13.Parent = u11
        u15 = Instance.new("TextLabel")
        u15.Name = "Attempts"
        u15.BackgroundTransparency = 1
        u15.Size = UDim2.new(1, -28, 0, 24)
        u15.Position = UDim2.new(0, 14, 0, 112)
        u15.TextXAlignment = Enum.TextXAlignment.Left
        u15.Font = Enum.Font.GothamSemibold
        u15.TextSize = 16
        u15.TextColor3 = Color3.fromRGB(255, 160, 160)
        u15.Text = "\236\139\164\237\140\168 0/3"
        u15.Parent = u11
        u16 = Instance.new("TextLabel")
        u16.Name = "Hint"
        u16.BackgroundTransparency = 1
        u16.Size = UDim2.new(1, -28, 0, 22)
        u16.Position = UDim2.new(0, 14, 1, -32)
        u16.TextXAlignment = Enum.TextXAlignment.Left
        u16.Font = Enum.Font.Gotham
        u16.TextSize = 14
        u16.TextColor3 = Color3.fromRGB(160, 168, 180)
        u16.Text = "3\235\178\136 \237\139\128\235\166\172\234\177\176\235\130\152 \236\139\156\234\176\132\236\157\180 \236\167\128\235\130\152\235\169\180 \235\167\136\236\157\132\235\161\156 \236\157\180\235\143\153\237\149\169\235\139\136\235\139\164."
        u16.Parent = u11
        local v38 = Instance.new("Frame")
        v38.Name = "ButtonArea"
        v38.BackgroundTransparency = 1
        v38.Size = UDim2.new(1, -28, 0, 126)
        v38.Position = UDim2.new(0, 14, 0, 144)
        v38.Parent = u11
        local v39 = Instance.new("UIGridLayout")
        v39.CellPadding = UDim2.new(0, 10, 0, 10)
        v39.CellSize = UDim2.new(0.5, -5, 0.5, -5)
        v39.FillDirectionMaxCells = 2
        v39.SortOrder = Enum.SortOrder.LayoutOrder
        v39.Parent = v38
        u17 = {
            u35(v38, 1),
            u35(v38, 2),
            u35(v38, 3),
            u35(v38, 4)
        }
    end
end
local function u83(p41) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u18
        [3] = u9
        [4] = u19
        [5] = u20
        [6] = u25
        [7] = u12
        [8] = u13
        [9] = u15
        [10] = u17
        [11] = u3
        [12] = u14
    --]]
    u40()
    local v42 = p41 and (p41.challengeId or "") or ""
    u18 = tostring(v42)
    if u18 == "" then
        u18 = nil
        u9.Enabled = false
    else
        local v43
        if p41 then
            v43 = p41.expireAt
        else
            v43 = p41
        end
        u19 = tonumber(v43) or 0
        local v44 = 1
        local v45
        if p41 then
            v45 = p41.promptCount
        else
            v45 = p41
        end
        local v46 = tonumber(v45) or 3
        local v47 = math.floor(v46)
        u20 = math.max(v44, v47)
        u25()
        u12.Text = "\236\130\172\235\131\165 \237\153\149\236\157\184"
        local v48 = u13
        local v49 = p41 and (p41.promptText or "") or ""
        v48.Text = "\236\149\132\235\158\152 \236\136\156\236\132\156\235\140\128\235\161\156 \235\136\140\235\159\172\236\163\188\236\132\184\236\154\148: " .. tostring(v49)
        local v50 = u15
        local v51 = string.format
        local v52 = "\236\139\164\237\140\168 %d/%d"
        local v53 = 0
        local v54
        if p41 then
            v54 = p41.attemptsUsed
        else
            v54 = p41
        end
        local v55 = tonumber(v54) or 0
        local v56 = math.floor(v55)
        local v57 = math.max(v53, v56)
        local v58 = 1
        local v59
        if p41 then
            v59 = p41.maxAttempts
        else
            v59 = p41
        end
        local v60 = tonumber(v59) or 3
        local v61 = math.floor(v60)
        v50.Text = v51(v52, v57, (math.max(v58, v61)))
        local v62 = type(p41) == "table" and p41.items or nil
        for v63, v64 in ipairs(u17) do
            local v65
            if type(v62) == "table" then
                v65 = v62[v63] or nil
            else
                v65 = nil
            end
            if type(v65) == "table" then
                v64.Visible = true
                local v66 = v65.label or (v65.id or "\236\132\160\237\131\157\236\167\128 " .. tostring(v63))
                v64.Text = tostring(v66)
                local v67 = v65.id or ""
                v64:SetAttribute("ItemId", (tostring(v67)))
                v64.LayoutOrder = v63
            else
                v64.Visible = false
                v64.Text = ""
                v64:SetAttribute("ItemId", "")
            end
        end
        u9.Enabled = true
        if u9 then
            if not u9.Enabled then
                return
            end
            local v68 = 0
            local v69 = u19
            local v70 = tonumber(v69) or 0
            local v71, v72 = pcall(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u3
                --]]
                return u3:GetServerTimeNow()
            end)
            if not v71 or type(v72) ~= "number" then
                v72 = os.time()
            end
            local v73 = v70 - v72
            local v74 = math.floor(v73)
            local v75 = math.max(v68, v74)
            if u14 then
                local v76 = u14
                local v77 = tonumber(v75) or 0
                local v78 = math.floor(v77)
                local v79 = math.max(0, v78)
                local v80 = v79 / 60
                local v81 = math.floor(v80)
                local v82 = v79 % 60
                v76.Text = "\235\130\168\236\157\128 \236\139\156\234\176\132  " .. string.format("%02d:%02d", v81, v82)
            end
        end
    end
end
v6.OnClientEvent:Connect(function(p84) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u83
    --]]
    u83(p84)
end)
v8.OnClientEvent:Connect(function() --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
        [3] = u20
        [4] = u21
        [5] = u22
        [6] = u23
        [7] = u40
        [8] = u9
    --]]
    u18 = nil
    u19 = 0
    u20 = 0
    u21 = {}
    u22 = {}
    u23 = false
    u40()
    u9.Enabled = false
end)
task.spawn(function() --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u19
        [3] = u3
        [4] = u14
    --]]
    while true do
        repeat
            task.wait(0.2)
        until u9 and u9.Enabled
        local v85 = 0
        local v86 = u19
        local v87 = tonumber(v86) or 0
        local v88, v89 = pcall(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            return u3:GetServerTimeNow()
        end)
        if not v88 or type(v89) ~= "number" then
            v89 = os.time()
        end
        local v90 = v87 - v89
        local v91 = math.floor(v90)
        local v92 = math.max(v85, v91)
        if u14 then
            local v93 = u14
            local v94 = tonumber(v92) or 0
            local v95 = math.floor(v94)
            local v96 = math.max(0, v95)
            local v97 = v96 / 60
            local v98 = math.floor(v97)
            local v99 = v96 % 60
            v93.Text = "\235\130\168\236\157\128 \236\139\156\234\176\132  " .. string.format("%02d:%02d", v98, v99)
        end
    end
end)
u40()