local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("UserInputService")
local v5 = v2.Shared.Net:WaitForChild("AdminCommandNotice")
local u6 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u7 = nil
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = {}
local u13 = false
local u14 = nil
local function u21(p15, p16, p17) --[[ Line: 49 ]]
    local v18 = Instance.new(p15)
    for v19, v20 in pairs(p16 or {}) do
        v18[v19] = v20
    end
    v18.Parent = p17
    return v18
end
local function u30() --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u10
        [4] = u11
        [5] = u4
    --]]
    if u8 and (u9 and (u10 and u11)) then
        local v22 = workspace.CurrentCamera
        local v23 = v22 and v22.ViewportSize or Vector2.new(1280, 720)
        local v24 = v23.X
        local v25 = v23.Y
        local v26 = math.min(v24, v25)
        local v27 = u4.TouchEnabled and not u4.KeyboardEnabled and true or v26 <= 820
        local v28 = v27 and 116 or 100
        local v29 = -(v28 + 24)
        u8.Size = UDim2.new(v27 and 0.94 or 0.72, 0, 0, v28)
        u8.Position = UDim2.new(0.5, 0, 0, v29)
        u8:SetAttribute("ShownY", v27 and 8 or 10)
        u8:SetAttribute("HiddenY", v29)
        u11.Size = UDim2.new(0, v27 and 10 or 12, 1, 0)
        u9.Position = UDim2.new(0, v27 and 28 or 32, 0, v27 and 10 or 9)
        u9.Size = UDim2.new(1, v27 and -52 or -58, 0, v27 and 24 or 22)
        u9.TextSize = v27 and 18 or 17
        u10.Position = UDim2.new(0, v27 and 28 or 32, 0, v27 and 36 or 30)
        u10.Size = UDim2.new(1, v27 and -56 or -64, 1, v27 and -46 or -38)
        u10.TextSize = v27 and 25 or 31
    end
end
local function u31() --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u6
        [4] = u8
        [5] = u11
        [6] = u9
        [7] = u10
        [8] = u30
    --]]
    if not (u7 and u7.Parent) then
        u7 = u21("ScreenGui", {
            ["Name"] = "GlobalAnnouncementGui",
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = false,
            ["DisplayOrder"] = 2000,
            ["ClipToDeviceSafeArea"] = true,
            ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
        }, u6)
        u8 = u21("Frame", {
            ["Name"] = "Banner",
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["BackgroundColor3"] = Color3.fromRGB(15, 20, 34),
            ["BackgroundTransparency"] = 0.04,
            ["BorderSizePixel"] = 0,
            ["Visible"] = false,
            ["ZIndex"] = 10
        }, u7)
        u21("UICorner", {
            ["CornerRadius"] = UDim.new(0, 16)
        }, u8)
        u21("UIStroke", {
            ["Color"] = Color3.fromRGB(226, 184, 79),
            ["Thickness"] = 2,
            ["Transparency"] = 0
        }, u8)
        u21("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 36, 60)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 14, 25)) })
        }, u8)
        u11 = u21("Frame", {
            ["Name"] = "Accent",
            ["BackgroundColor3"] = Color3.fromRGB(226, 184, 79),
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 11
        }, u8)
        u21("UICorner", {
            ["CornerRadius"] = UDim.new(0, 16)
        }, u11)
        u21("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 222, 120)), ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 141, 44)) })
        }, u11)
        u9 = u21("TextLabel", {
            ["Name"] = "Title",
            ["BackgroundTransparency"] = 1,
            ["Text"] = "\236\160\132\236\178\180 \234\179\181\236\167\128",
            ["TextColor3"] = Color3.fromRGB(255, 225, 150),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["Font"] = Enum.Font.GothamBold,
            ["ZIndex"] = 12
        }, u8)
        u10 = u21("TextLabel", {
            ["Name"] = "Message",
            ["BackgroundTransparency"] = 1,
            ["Text"] = "",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextWrapped"] = true,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["Font"] = Enum.Font.GothamBold,
            ["ZIndex"] = 12
        }, u8)
        u30()
    end
end
local function u34(p32, p33) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u3
        [3] = u8
    --]]
    if u14 then
        u14:Cancel()
        u14 = nil
    end
    u14 = u3:Create(u8, TweenInfo.new(p33, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        ["Position"] = UDim2.new(0.5, 0, 0, p32)
    })
    u14:Play()
    u14.Completed:Wait()
    u14 = nil
end
local function u52(p35) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u31
        [4] = u30
        [5] = u8
        [6] = u9
        [7] = u10
        [8] = u34
    --]]
    local v36
    if p35 then
        v36 = p35.message
    else
        v36 = p35
    end
    local v37 = tostring(v36 or ""):gsub("[%c\r\n\t]+", " "):gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
    if v37 ~= "" then
        local v38 = u12
        local v39 = #u12 + 1
        local v40 = {}
        local v41 = p35.title or ""
        v40.title = tostring(v41):gsub("[%c\r\n\t]+", " "):gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
        v40.message = v37
        local v42 = p35.duration
        local v43 = tonumber(v42)
        local v44
        if v43 then
            local v45 = v43 + 0.5
            local v46 = math.floor(v45)
            v44 = math.clamp(v46, 3, 12)
        else
            v44 = 8
        end
        v40.duration = v44
        v38[v39] = v40
        if not u13 then
            task.spawn(function() --[[ Line: 174 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u31
                    [3] = u12
                    [4] = u30
                    [5] = u8
                    [6] = u9
                    [7] = u10
                    [8] = u34
                --]]
                if not u13 then
                    u13 = true
                    u31()
                    while #u12 > 0 do
                        local v47 = table.remove(u12, 1)
                        u30()
                        u8.Visible = true
                        u9.Text = v47.title == "" and "\236\160\132\236\178\180 \234\179\181\236\167\128" or (v47.title or "\236\160\132\236\178\180 \234\179\181\236\167\128")
                        u10.Text = v47.message
                        local v48 = u8
                        local v49 = tonumber(v48:GetAttribute("ShownY")) or 10
                        local v50 = u8
                        local v51 = tonumber(v50:GetAttribute("HiddenY")) or -140
                        u8.Position = UDim2.new(0.5, 0, 0, v51)
                        u34(v49, 0.28)
                        task.wait(v47.duration)
                        u34(v51, 0.24)
                        u8.Visible = false
                        task.wait(0.08)
                    end
                    u13 = false
                end
            end)
        end
    end
end
local u53 = nil
local function u55() --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u53
        [2] = u7
        [3] = u30
    --]]
    if u53 then
        u53:Disconnect()
        u53 = nil
    end
    local v54 = workspace.CurrentCamera
    if v54 then
        u53 = v54:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 206 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u30
            --]]
            if u7 and u7.Parent then
                u30()
            end
        end)
    end
end
u4:GetPropertyChangedSignal("TouchEnabled"):Connect(function() --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u30
    --]]
    if u7 and u7.Parent then
        u30()
    end
end)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u55
        [2] = u7
        [3] = u30
    --]]
    u55()
    task.defer(function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u30
        --]]
        if u7 and u7.Parent then
            u30()
        end
    end)
end)
u55()
v5.OnClientEvent:Connect(function(p56) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u52
    --]]
    if type(p56) == "table" and p56.kind == "global_announcement" then
        u52(p56)
    end
end)
u31()