local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local u4 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v2.Shared.Net
local u6 = v5:WaitForChild("SettingsFetch")
local u7 = v5:WaitForChild("SettingsUpdate")
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = {
    ["bgmVolume"] = 1,
    ["blockPartyInvite"] = false,
    ["blockDuelInvite"] = false
}
local function u20(p14, p15, p16) --[[ Line: 26 ]]
    local v17 = Instance.new(p14)
    for v18, v19 in pairs(p15 or {}) do
        v17[v18] = v19
    end
    v17.Parent = p16
    return v17
end
local function u28() --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u11
        [4] = u12
    --]]
    local v21, v22 = pcall(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6:InvokeServer()
    end)
    if v21 and (type(v22) == "table" and v22.ok == true) then
        local v23 = v22.settings
        if type(v23) == "table" then
            u13 = v22.settings
        end
    end
    if u11 then
        local v24 = u11
        local v25 = string.format
        local v26 = u13.bgmVolume
        local v27 = (tonumber(v26) or 1) * 100 + 0.5
        v24.Text = v25("\235\176\176\234\178\189\236\157\140 \235\179\188\235\165\168 : %d%%", (math.floor(v27)))
    end
    if u12 then
        u12.Text = string.format("\237\140\140\237\139\176 \236\180\136\235\140\128 \235\176\155\234\184\176 : %s", u13.blockPartyInvite and "\236\176\168\235\139\168" or "\237\151\136\236\154\169")
    end
end
local function u41(u29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u3
        [4] = u13
        [5] = u11
        [6] = u12
    --]]
    local v30, v31 = pcall(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u29
        --]]
        return u7:InvokeServer(u29)
    end)
    if v30 and (type(v31) == "table" and v31.ok == true) then
        u13 = v31.settings or u13
        if u11 then
            local v32 = u11
            local v33 = string.format
            local v34 = u13.bgmVolume
            local v35 = (tonumber(v34) or 1) * 100 + 0.5
            v32.Text = v33("\235\176\176\234\178\189\236\157\140 \235\179\188\235\165\168 : %d%%", (math.floor(v35)))
        end
        if u12 then
            u12.Text = string.format("\237\140\140\237\139\176 \236\180\136\235\140\128 \235\176\155\234\184\176 : %s", u13.blockPartyInvite and "\236\176\168\235\139\168" or "\237\151\136\236\154\169")
        end
        if u10 then
            u10.Text = tostring("\236\132\164\236\160\149\236\157\132 \236\160\128\236\158\165\237\150\136\236\138\181\235\139\136\235\139\164.")
            u10.TextColor3 = Color3.fromRGB(190, 190, 190)
        end
    else
        if u10 then
            u10.Text = tostring("\236\132\164\236\160\149 \236\160\128\236\158\165 \236\139\164\237\140\168")
            u10.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
        end
        local u36 = "\236\132\164\236\160\149 \236\160\128\236\158\165 \236\139\164\237\140\168"
        local u37 = true
        pcall(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u36
                [3] = u37
            --]]
            local v38 = u3
            local v39 = {
                ["Title"] = "\236\132\164\236\160\149"
            }
            local v40 = u36 or ""
            v39.Text = tostring(v40)
            v39.Duration = u37 and 5 or 3
            v38:SetCore("SendNotification", v39)
        end)
    end
end
local function u42() --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u28
    --]]
    u9.Visible = not u9.Visible
    if u9.Visible then
        u28()
    end
end
local function u45() --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u42
    --]]
    for _, v43 in ipairs({ "MainHUD", "MainHUD_Mobile" }) do
        local v44 = u4:FindFirstChild(v43)
        if v44 then
            v44 = v44:FindFirstChild("BtnSetting", true)
        end
        if v44 and (v44:IsA("GuiButton") and v44:GetAttribute("SettingsBound") ~= true) then
            v44:SetAttribute("SettingsBound", true)
            v44.Activated:Connect(u42)
        end
    end
end
(function() --[[ Name: buildGui, Line 62 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
        [3] = u4
        [4] = u9
        [5] = u10
        [6] = u11
        [7] = u12
        [8] = u41
        [9] = u13
    --]]
    u8 = u20("ScreenGui", {
        ["Name"] = "SettingsGui",
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 255
    }, u4)
    u9 = u20("Frame", {
        ["BackgroundColor3"] = Color3.fromRGB(18, 18, 18),
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
        ["Size"] = UDim2.new(0, 420, 0, 210),
        ["Visible"] = false
    }, u8)
    u20("UICorner", {
        ["CornerRadius"] = UDim.new(0, 10)
    }, u9)
    u20("UIStroke", {
        ["Color"] = Color3.fromRGB(90, 90, 90),
        ["Thickness"] = 1
    }, u9)
    u20("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 12),
        ["Size"] = UDim2.new(1, -24, 0, 26),
        ["Text"] = "\236\132\164\236\160\149",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(255, 230, 150),
        ["TextSize"] = 20,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u10 = u20("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 40),
        ["Size"] = UDim2.new(1, -24, 0, 18),
        ["Text"] = "",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(190, 190, 190),
        ["TextSize"] = 12,
        ["Font"] = Enum.Font.Code
    }, u9)
    u11 = u20("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 18, 0, 78),
        ["Size"] = UDim2.new(0, 220, 0, 24),
        ["Text"] = "",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(240, 240, 240),
        ["TextSize"] = 18,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    local v46 = u20("TextButton", {
        ["BackgroundColor3"] = Color3.fromRGB(65, 65, 65),
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.new(1, -122, 0, 74),
        ["Size"] = UDim2.new(0, 46, 0, 32),
        ["Text"] = "-",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 20,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u20("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v46)
    local v47 = u20("TextButton", {
        ["BackgroundColor3"] = Color3.fromRGB(65, 65, 65),
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.new(1, -68, 0, 74),
        ["Size"] = UDim2.new(0, 46, 0, 32),
        ["Text"] = "+",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 20,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u20("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v47)
    u12 = u20("TextButton", {
        ["BackgroundColor3"] = Color3.fromRGB(40, 40, 40),
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.new(0, 18, 0, 126),
        ["Size"] = UDim2.new(1, -36, 0, 40),
        ["Text"] = "",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u20("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, u12)
    local v48 = u20("TextButton", {
        ["BackgroundColor3"] = Color3.fromRGB(80, 50, 50),
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(1, 1),
        ["Position"] = UDim2.new(1, -18, 1, -16),
        ["Size"] = UDim2.new(0, 80, 0, 32),
        ["Text"] = "\235\139\171\234\184\176",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u20("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v48)
    v46.Activated:Connect(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u13
        --]]
        local v49 = u41
        local v50 = {}
        local v51 = u13.bgmVolume
        local v52 = (tonumber(v51) or 1) - 0.1
        v50.bgmVolume = math.max(0, v52)
        v49(v50)
    end)
    v47.Activated:Connect(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u13
        --]]
        local v53 = u41
        local v54 = {}
        local v55 = u13.bgmVolume
        local v56 = (tonumber(v55) or 1) + 0.1
        v54.bgmVolume = math.min(1, v56)
        v53(v54)
    end)
    u12.Activated:Connect(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u13
        --]]
        u41({
            ["blockPartyInvite"] = not u13.blockPartyInvite
        })
    end)
    v48.Activated:Connect(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.Visible = false
    end)
    if u11 then
        local v57 = u11
        local v58 = string.format
        local v59 = u13.bgmVolume
        local v60 = (tonumber(v59) or 1) * 100 + 0.5
        v57.Text = v58("\235\176\176\234\178\189\236\157\140 \235\179\188\235\165\168 : %d%%", (math.floor(v60)))
    end
    if u12 then
        u12.Text = string.format("\237\140\140\237\139\176 \236\180\136\235\140\128 \235\176\155\234\184\176 : %s", u13.blockPartyInvite and "\236\176\168\235\139\168" or "\237\151\136\236\154\169")
    end
end)()
u45()
u4.DescendantAdded:Connect(function(p61) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    if p61.Name == "BtnSetting" and p61:IsA("GuiButton") then
        task.defer(u45)
    end
end)