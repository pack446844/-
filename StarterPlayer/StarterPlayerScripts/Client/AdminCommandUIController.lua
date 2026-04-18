local v1 = game:GetService("Players")
local u2 = game:GetService("StarterGui")
local v3 = game:GetService("ReplicatedStorage")
local u4 = game:GetService("UserInputService")
local u5 = game:GetService("TextService")
local v6 = v3.Shared.Net
local v7 = v6:WaitForChild("AdminCommandNotice")
local u8 = v6:WaitForChild("AdminCommandExecute")
local u9 = v6:WaitForChild("AdminCommandState")
local u10 = v1.LocalPlayer
local u11 = u10:WaitForChild("PlayerGui")
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = {}
local u19 = 0
local u20 = false
local function u32(p21, p22) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v23 = type(p21) == "table" and p21 and p21 or {
        ["message"] = p21,
        ["isError"] = p22 == true
    }
    if v23.kind == "global_announcement" then
        return
    else
        local v24 = v23.message or ""
        local u25 = tostring(v24)
        if u25 ~= "" then
            local v26 = v23.title or (v23.isError == true and "Admin Error" or "Admin")
            local u27 = tostring(v26)
            local v28 = v23.duration
            local v29 = (tonumber(v28) or (v23.isError == true and 7 or 5)) + 0.5
            local v30 = math.floor(v29)
            local u31 = math.clamp(v30, 2, 12)
            warn("[AdminCommand] " .. u27 .. " / " .. u25)
            pcall(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u27
                    [3] = u25
                    [4] = u31
                --]]
                u2:SetCore("SendNotification", {
                    ["Title"] = u27,
                    ["Text"] = u25,
                    ["Duration"] = u31
                })
            end)
        end
    end
end
local function u40() --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u5
    --]]
    if u16 and (u17 and (u16.Parent and u17.Parent)) then
        local v33 = u16.AbsoluteSize.X
        local v34 = math.floor(v33) - 20
        local u35 = math.max(140, v34)
        local v36, v37 = pcall(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u17
                [3] = u35
            --]]
            return u5:GetTextSize(u17.Text or "", u17.TextSize, u17.Font, Vector2.new(u35, 100000))
        end)
        local v38 = (v36 and (v37 and v37.Y) or 16) + 8
        local v39 = math.max(22, v38)
        u17.Size = UDim2.new(1, -20, 0, v39)
        u16.CanvasSize = UDim2.new(0, 0, 0, v39 + 16)
    end
end
local function u43(p41, p42) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u40
        [3] = u16
    --]]
    if u17 then
        u17.Text = tostring(p41 or "")
        u17.TextColor3 = p42 and Color3.fromRGB(255, 120, 120) or Color3.fromRGB(210, 210, 210)
        u40()
        if u16 then
            u16.CanvasPosition = Vector2.new(0, 0)
        end
    end
end
v7.OnClientEvent:Connect(function(p44) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    if type(p44) == "table" then
        u32(p44)
    end
end)
local function u48(p45) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
        [3] = u19
    --]]
    if #u18 > 0 and (u15 and u15:IsFocused()) then
        local v46 = u19 + p45
        local v47 = #u18 + 1
        u19 = math.clamp(v46, 1, v47)
        if u19 >= 1 and u19 <= #u18 then
            u15.Text = u18[u19]
        else
            u15.Text = ""
        end
        u15.CursorPosition = #u15.Text + 1
    end
end
local function u59(p49) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u18
        [3] = u19
        [4] = u17
        [5] = u40
        [6] = u16
        [7] = u8
        [8] = u32
    --]]
    local v50 = tostring(p49 or ""):gsub("^%s+", ""):gsub("%s+$", "")
    local u51 = v50 == "" and "" or v50
    if u51 == "" then
        u43("\235\170\133\235\160\185\236\150\180\235\165\188 \236\158\133\235\160\165\237\149\180.", true)
        return
    else
        local v52 = tostring(u51 or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if v52 ~= "" then
            if u18[#u18] ~= v52 then
                u18[#u18 + 1] = v52
            end
            u19 = #u18 + 1
        end
        if u17 then
            u17.Text = tostring("\236\139\164\237\150\137 \236\164\145...")
            u17.TextColor3 = Color3.fromRGB(210, 210, 210)
            u40()
            if u16 then
                u16.CanvasPosition = Vector2.new(0, 0)
            end
        end
        local v53, v54 = pcall(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u51
            --]]
            return u8:InvokeServer(u51)
        end)
        if v53 then
            if type(v54) == "table" then
                local v55 = v54.message or ""
                local v56 = tostring(v55)
                local v57 = v54.ok ~= true
                u43(v56, v57)
                u32(v56, v57)
            else
                if u17 then
                    u17.Text = tostring("\236\157\145\235\139\181 \237\152\149\236\139\157 \236\152\164\235\165\152")
                    u17.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(210, 210, 210)
                    u40()
                    if u16 then
                        u16.CanvasPosition = Vector2.new(0, 0)
                    end
                end
                u32("\236\157\145\235\139\181 \237\152\149\236\139\157 \236\152\164\235\165\152", true)
            end
        else
            local v58 = "\236\139\164\237\150\137 \236\139\164\237\140\168: " .. tostring(v54)
            if u17 then
                u17.Text = tostring(v58 or "")
                u17.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(210, 210, 210)
                u40()
                if u16 then
                    u16.CanvasPosition = Vector2.new(0, 0)
                end
            end
            u32(v58, true)
            return
        end
    end
end
local function u66(p60, p61, p62) --[[ Line: 125 ]]
    local v63 = Instance.new(p60)
    for v64, v65 in pairs(p61 or {}) do
        v63[v64] = v65
    end
    v63.Parent = p62
    return v63
end
local function u71() --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u66
        [3] = u11
        [4] = u14
        [5] = u13
        [6] = u15
        [7] = u16
        [8] = u17
        [9] = u59
        [10] = u40
    --]]
    u12 = u66("ScreenGui", {
        ["Name"] = "AdminCommandGui",
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 1000
    }, u11)
    u14 = u66("TextButton", {
        ["Name"] = "ToggleButton",
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.new(1, -16, 0, 120),
        ["Size"] = UDim2.new(0, 64, 0, 30),
        ["BackgroundColor3"] = Color3.fromRGB(35, 35, 35),
        ["BorderSizePixel"] = 0,
        ["Text"] = "ADM",
        ["TextColor3"] = Color3.fromRGB(255, 230, 150),
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.GothamBold,
        ["AutoButtonColor"] = true
    }, u12)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, u14)
    u13 = u66("Frame", {
        ["Name"] = "Panel",
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.new(1, -16, 0, 156),
        ["Size"] = UDim2.new(0, 520, 0, 332),
        ["BackgroundColor3"] = Color3.fromRGB(18, 18, 18),
        ["BorderSizePixel"] = 0,
        ["Visible"] = false
    }, u12)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 10)
    }, u13)
    u66("UIStroke", {
        ["Color"] = Color3.fromRGB(90, 90, 90),
        ["Thickness"] = 1,
        ["Transparency"] = 0
    }, u13)
    u66("TextLabel", {
        ["Name"] = "Title",
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 8),
        ["Size"] = UDim2.new(1, -24, 0, 22),
        ["Text"] = "Admin Command Panel",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(255, 230, 150),
        ["TextSize"] = 18,
        ["Font"] = Enum.Font.GothamBold
    }, u13)
    u66("TextLabel", {
        ["Name"] = "Hint",
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 30),
        ["Size"] = UDim2.new(1, -24, 0, 16),
        ["Text"] = "F10 \236\151\180\234\184\176/\235\139\171\234\184\176 | /adm \236\151\134\236\157\180 \236\158\133\235\160\165 \234\176\128\235\138\165 | \226\134\145\226\134\147 \236\181\156\234\183\188 \235\170\133\235\160\185\236\150\180",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(150, 150, 150),
        ["TextSize"] = 12,
        ["Font"] = Enum.Font.Gotham
    }, u13)
    u15 = u66("TextBox", {
        ["Name"] = "Input",
        ["Position"] = UDim2.new(0, 12, 0, 54),
        ["Size"] = UDim2.new(1, -126, 0, 38),
        ["BackgroundColor3"] = Color3.fromRGB(28, 28, 28),
        ["BorderSizePixel"] = 0,
        ["ClearTextOnFocus"] = false,
        ["PlaceholderText"] = "help / gold 123456 5000 / item 123456 rabbit_liver 20",
        ["Text"] = "",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["PlaceholderColor3"] = Color3.fromRGB(120, 120, 120),
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.Code,
        ["TextXAlignment"] = Enum.TextXAlignment.Left
    }, u13)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, u15)
    u66("UIPadding", {
        ["PaddingLeft"] = UDim.new(0, 10),
        ["PaddingRight"] = UDim.new(0, 10)
    }, u15)
    local v67 = u66("TextButton", {
        ["Name"] = "RunButton",
        ["Position"] = UDim2.new(1, -106, 0, 54),
        ["Size"] = UDim2.new(0, 44, 0, 38),
        ["BackgroundColor3"] = Color3.fromRGB(55, 90, 55),
        ["BorderSizePixel"] = 0,
        ["Text"] = "Run",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 15,
        ["Font"] = Enum.Font.GothamBold
    }, u13)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v67)
    local v68 = u66("TextButton", {
        ["Name"] = "HelpButton",
        ["Position"] = UDim2.new(1, -56, 0, 54),
        ["Size"] = UDim2.new(0, 44, 0, 38),
        ["BackgroundColor3"] = Color3.fromRGB(65, 65, 90),
        ["BorderSizePixel"] = 0,
        ["Text"] = "?",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 18,
        ["Font"] = Enum.Font.GothamBold
    }, u13)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v68)
    u16 = u66("ScrollingFrame", {
        ["Name"] = "OutputScroll",
        ["Position"] = UDim2.new(0, 12, 0, 102),
        ["Size"] = UDim2.new(1, -24, 1, -114),
        ["BackgroundColor3"] = Color3.fromRGB(23, 23, 23),
        ["BorderSizePixel"] = 0,
        ["CanvasSize"] = UDim2.new(0, 0, 0, 0),
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.None,
        ["ScrollBarThickness"] = 10,
        ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
        ["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
    }, u13)
    u66("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, u16)
    u17 = u66("TextLabel", {
        ["Name"] = "Output",
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 10, 0, 8),
        ["Size"] = UDim2.new(1, -20, 0, 22),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["Text"] = "ready",
        ["TextWrapped"] = true,
        ["TextYAlignment"] = Enum.TextYAlignment.Top,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(210, 210, 210),
        ["TextSize"] = 14,
        ["Font"] = Enum.Font.Code
    }, u16)
    u14.MouseButton1Click:Connect(function() --[[ Line: 269 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u15
        --]]
        local v69 = not u13.Visible
        if u13 then
            u13.Visible = v69 == true
            if u14 then
                u14.Text = u13.Visible and "ADM -" or "ADM"
            end
            if u13.Visible and u15 then
                task.defer(function() --[[ Line: 138 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                    --]]
                    if u15 and u15.Parent then
                        u15:CaptureFocus()
                    end
                end)
            end
        end
    end)
    v67.MouseButton1Click:Connect(function() --[[ Line: 272 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u15
        --]]
        u59(u15.Text)
    end)
    v68.MouseButton1Click:Connect(function() --[[ Line: 275 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        u59("help")
    end)
    u15.FocusLost:Connect(function(p70) --[[ Line: 278 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u15
        --]]
        if p70 then
            u59(u15.Text)
        end
    end)
    u16:GetPropertyChangedSignal("AbsoluteSize"):Connect(u40)
    u40()
end
(function() --[[ Name: init, Line 288 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u20
        [4] = u71
        [5] = u17
        [6] = u40
        [7] = u16
        [8] = u4
        [9] = u13
        [10] = u14
        [11] = u15
        [12] = u48
    --]]
    local v72, v73 = pcall(function() --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        return u9:InvokeServer()
    end)
    if v72 and (type(v73) == "table" and v73.isAdmin == true) then
        u20 = true
        u71()
        if u17 then
            u17.Text = tostring("ready")
            u17.TextColor3 = Color3.fromRGB(210, 210, 210)
            u40()
            if u16 then
                u16.CanvasPosition = Vector2.new(0, 0)
            end
        end
        u4.InputBegan:Connect(function(p74, p75) --[[ Line: 301 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u13
                [3] = u14
                [4] = u15
                [5] = u48
            --]]
            if p75 or not u20 then
                return
            elseif p74.KeyCode == Enum.KeyCode.F10 then
                local v76 = not u13.Visible
                if u13 then
                    u13.Visible = v76 == true
                    if u14 then
                        u14.Text = u13.Visible and "ADM -" or "ADM"
                    end
                    if u13.Visible and u15 then
                        task.defer(function() --[[ Line: 138 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                            --]]
                            if u15 and u15.Parent then
                                u15:CaptureFocus()
                            end
                        end)
                    end
                end
            elseif u13 and (u13.Visible and (u15 and u15:IsFocused())) then
                if p74.KeyCode == Enum.KeyCode.Up then
                    u48(-1)
                elseif p74.KeyCode == Enum.KeyCode.Down then
                    u48(1)
                end
            else
                return
            end
        end)
        print("[AdminCommandUIController] initialized for " .. u10.Name)
    else
        print("[AdminCommandUIController] admin panel disabled for " .. u10.Name)
    end
end)()