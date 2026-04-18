local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local u4 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v2.Shared.Net
local u6 = v5:WaitForChild("TitleFetch")
local u7 = v5:WaitForChild("TitleAction")
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = false
local function u22(p14) --[[ Line: 35 ]]
    local v15 = type(p14) == "table" and p14 and p14 or {}
    local v16 = Color3.fromRGB
    local v17 = v15.r or v15[1]
    local v18 = tonumber(v17) or 255
    local v19 = v15.g or v15[2]
    local v20 = tonumber(v19) or 255
    local v21 = v15.b or v15[3]
    return v16(v18, v20, tonumber(v21) or 255)
end
local function u29(p23, p24, p25) --[[ Line: 50 ]]
    local v26 = Instance.new(p23)
    for v27, v28 in pairs(p24 or {}) do
        v26[v27] = v28
    end
    v26.Parent = p25
    return v26
end
local function u90() --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u13
        [4] = u12
        [5] = u29
        [6] = u22
        [7] = u7
        [8] = u11
        [9] = u90
        [10] = u3
    --]]
    if u10 then
        for _, v30 in ipairs(u10:GetChildren()) do
            if v30:IsA("Frame") then
                v30:Destroy()
            end
        end
        local v31 = u4:FindFirstChild("MainHUD_Mobile")
        local v32 = u4:FindFirstChild("MainHUD")
        local v33
        if v31 then
            if v31:IsA("ScreenGui") then
                v33 = v31.Enabled
            else
                v33 = not v31:IsA("GuiObject") and true or v31.Visible
            end
        else
            v33 = false
        end
        local v34
        if v32 then
            if v32:IsA("ScreenGui") then
                v34 = v32.Enabled
            else
                v34 = not v32:IsA("GuiObject") and true or v32.Visible
            end
        else
            v34 = false
        end
        local v35
        if v33 and not v34 then
            v35 = true
        elseif v34 and not v33 then
            v35 = false
        else
            v35 = u13 == true
        end
        local v36 = v35 and 72 or 78
        local v37 = u4:FindFirstChild("MainHUD_Mobile")
        local v38 = u4:FindFirstChild("MainHUD")
        local v39
        if v37 then
            if v37:IsA("ScreenGui") then
                v39 = v37.Enabled
            else
                v39 = not v37:IsA("GuiObject") and true or v37.Visible
            end
        else
            v39 = false
        end
        local v40
        if v38 then
            if v38:IsA("ScreenGui") then
                v40 = v38.Enabled
            else
                v40 = not v38:IsA("GuiObject") and true or v38.Visible
            end
        else
            v40 = false
        end
        local v41
        if v39 and not v40 then
            v41 = true
        elseif v40 and not v39 then
            v41 = false
        else
            v41 = u13 == true
        end
        local v42 = v41 and 6 or 8
        local v43 = u4:FindFirstChild("MainHUD_Mobile")
        local v44 = u4:FindFirstChild("MainHUD")
        local v45
        if v43 then
            if v43:IsA("ScreenGui") then
                v45 = v43.Enabled
            else
                v45 = not v43:IsA("GuiObject") and true or v43.Visible
            end
        else
            v45 = false
        end
        local v46
        if v44 then
            if v44:IsA("ScreenGui") then
                v46 = v44.Enabled
            else
                v46 = not v44:IsA("GuiObject") and true or v44.Visible
            end
        else
            v46 = false
        end
        local v47
        if v45 and not v46 then
            v47 = true
        elseif v46 and not v45 then
            v47 = false
        else
            v47 = u13 == true
        end
        local v48 = v47 and 17 or 20
        local v49 = u4:FindFirstChild("MainHUD_Mobile")
        local v50 = u4:FindFirstChild("MainHUD")
        local v51
        if v49 then
            if v49:IsA("ScreenGui") then
                v51 = v49.Enabled
            else
                v51 = not v49:IsA("GuiObject") and true or v49.Visible
            end
        else
            v51 = false
        end
        local v52
        if v50 then
            if v50:IsA("ScreenGui") then
                v52 = v50.Enabled
            else
                v52 = not v50:IsA("GuiObject") and true or v50.Visible
            end
        else
            v52 = false
        end
        local v53
        if v51 and not v52 then
            v53 = true
        elseif v52 and not v51 then
            v53 = false
        else
            v53 = u13 == true
        end
        local v54 = v53 and 13 or 15
        local v55 = u4:FindFirstChild("MainHUD_Mobile")
        local v56 = u4:FindFirstChild("MainHUD")
        local v57
        if v55 then
            if v55:IsA("ScreenGui") then
                v57 = v55.Enabled
            else
                v57 = not v55:IsA("GuiObject") and true or v55.Visible
            end
        else
            v57 = false
        end
        local v58
        if v56 then
            if v56:IsA("ScreenGui") then
                v58 = v56.Enabled
            else
                v58 = not v56:IsA("GuiObject") and true or v56.Visible
            end
        else
            v58 = false
        end
        local v59
        if v57 and not v58 then
            v59 = true
        elseif v58 and not v57 then
            v59 = false
        else
            v59 = u13 == true
        end
        local v60 = 0
        local v61 = v59 and 72 or 88
        for _, u62 in ipairs(u12 and u12.titles or {}) do
            local v63 = u29("Frame", {
                ["BackgroundColor3"] = Color3.fromRGB(25, 25, 25),
                ["BorderSizePixel"] = 0,
                ["Position"] = UDim2.new(0, 0, 0, v60),
                ["Size"] = UDim2.new(1, 0, 0, v36)
            }, u10)
            u29("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }, v63)
            local v64 = u22(u62.color)
            local v65 = Color3.fromRGB(220, 220, 220)
            if u62.owned ~= true then
                local v66 = u62.unownedVisibility or ""
                if tostring(v66) == "hidden" then
                    v64 = Color3.fromRGB(170, 170, 170)
                    v65 = Color3.fromRGB(170, 170, 170)
                end
            end
            local v67 = u29
            local v68 = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.new(0, 12, 0, 8),
                ["Size"] = UDim2.new(1, -(v61 + 34), 0, 24)
            }
            local v69 = u62.displayName or u62.titleId
            v68.Text = tostring(v69)
            v68.TextXAlignment = Enum.TextXAlignment.Left
            v68.TextColor3 = v64
            v68.TextSize = v48
            v68.Font = Enum.Font.GothamBold
            v67("TextLabel", v68, v63)
            local v70 = u29
            local v71 = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.new(0, 12, 0, 34),
                ["Size"] = UDim2.new(1, -(v61 + 34), 0, v36 - 40)
            }
            local v72 = u62.description or ""
            v71.Text = tostring(v72)
            v71.TextWrapped = true
            v71.TextXAlignment = Enum.TextXAlignment.Left
            v71.TextYAlignment = Enum.TextYAlignment.Top
            v71.TextColor3 = v65
            v71.TextSize = v54
            v71.Font = Enum.Font.Gotham
            v70("TextLabel", v71, v63)
            local v73 = u62.equipped and "\237\149\180\236\160\156" or (u62.owned and "\236\158\165\236\176\169" or "\235\175\184\235\179\180\236\156\160")
            local v74 = u29
            local v75 = "TextButton"
            local v76 = {
                ["BackgroundColor3"] = u62.owned and Color3.fromRGB(70, 100, 70) or Color3.fromRGB(70, 70, 70),
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -12, 0.5, 0),
                ["Size"] = UDim2.new(0, v61, 0, 34),
                ["Text"] = v73,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }
            local v77 = u4:FindFirstChild("MainHUD_Mobile")
            local v78 = u4:FindFirstChild("MainHUD")
            local v79
            if v77 then
                if v77:IsA("ScreenGui") then
                    v79 = v77.Enabled
                else
                    v79 = not v77:IsA("GuiObject") and true or v77.Visible
                end
            else
                v79 = false
            end
            local v80
            if v78 then
                if v78:IsA("ScreenGui") then
                    v80 = v78.Enabled
                else
                    v80 = not v78:IsA("GuiObject") and true or v78.Visible
                end
            else
                v80 = false
            end
            local v81
            if v79 and not v80 then
                v81 = true
            elseif v80 and not v79 then
                v81 = false
            else
                v81 = u13 == true
            end
            v76.TextSize = v81 and 14 or 16
            v76.Font = Enum.Font.GothamBold
            v76.AutoButtonColor = u62.owned
            local v82 = v74(v75, v76, v63)
            u29("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }, v82)
            v82.Activated:Connect(function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u7
                    [3] = u12
                    [4] = u11
                    [5] = u90
                    [6] = u3
                --]]
                if u62.owned then
                    local v83 = u7:InvokeServer({
                        ["action"] = u62.equipped and "unequip" or "equip",
                        ["titleId"] = u62.titleId
                    })
                    if type(v83) == "table" and v83.ok == true then
                        u12 = v83.payload or u12
                        local v84 = u62.equipped and "\236\185\173\237\152\184\235\165\188 \237\149\180\236\160\156\237\150\136\236\138\181\235\139\136\235\139\164." or "\236\185\173\237\152\184\235\165\188 \236\158\165\236\176\169\237\150\136\236\138\181\235\139\136\235\139\164."
                        if u11 then
                            u11.Text = tostring(v84 or "")
                            u11.TextColor3 = Color3.fromRGB(190, 190, 190)
                        end
                        u90()
                    else
                        if u11 then
                            u11.Text = tostring("\236\185\173\237\152\184 \236\178\152\235\166\172 \236\139\164\237\140\168")
                            u11.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
                        end
                        local u85 = "\236\185\173\237\152\184 \236\178\152\235\166\172 \236\139\164\237\140\168"
                        local u86 = true
                        pcall(function() --[[ Line: 40 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u85
                                [3] = u86
                            --]]
                            local v87 = u3
                            local v88 = {
                                ["Title"] = "\236\185\173\237\152\184"
                            }
                            local v89 = u85 or ""
                            v88.Text = tostring(v89)
                            v88.Duration = u86 and 5 or 3
                            v87:SetCore("SendNotification", v88)
                        end)
                    end
                else
                    return
                end
            end)
            v60 = v60 + v36 + v42
        end
        u10.CanvasSize = UDim2.new(0, 0, 0, v60)
    end
end
local function u104() --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u9
        [4] = u10
        [5] = u90
        [6] = u6
        [7] = u12
    --]]
    local function v103(p91, u92) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u9
            [4] = u10
            [5] = u90
            [6] = u6
            [7] = u12
        --]]
        local v93 = u4:FindFirstChild(p91)
        if v93 then
            v93 = v93:FindFirstChild("BtnTitle", true)
        end
        if v93 and (v93:IsA("GuiButton") and v93:GetAttribute("TitleBound") ~= true) then
            v93:SetAttribute("TitleBound", true)
            v93.Activated:Connect(function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u92
                    [3] = u9
                    [4] = u4
                    [5] = u10
                    [6] = u90
                    [7] = u6
                    [8] = u12
                --]]
                u13 = u92 == true
                if u9 then
                    local v94 = u9
                    local v95 = u4:FindFirstChild("MainHUD_Mobile")
                    local v96 = u4:FindFirstChild("MainHUD")
                    local v97
                    if v95 then
                        if v95:IsA("ScreenGui") then
                            v97 = v95.Enabled
                        else
                            v97 = not v95:IsA("GuiObject") and true or v95.Visible
                        end
                    else
                        v97 = false
                    end
                    local v98
                    if v96 then
                        if v96:IsA("ScreenGui") then
                            v98 = v96.Enabled
                        else
                            v98 = not v96:IsA("GuiObject") and true or v96.Visible
                        end
                    else
                        v98 = false
                    end
                    local v99
                    if v97 and not v98 then
                        v99 = true
                    elseif v98 and not v97 then
                        v99 = false
                    else
                        v99 = u13 == true
                    end
                    local v100
                    if v99 then
                        v100 = UDim2.new(0, 340, 0, 320)
                    else
                        v100 = UDim2.new(0, 620, 0, 500)
                    end
                    v94.Size = v100
                end
                if u10 and (u9 and u9.Visible) then
                    u90()
                end
                u9.Visible = not u9.Visible
                if u9.Visible then
                    local v101, v102 = pcall(function() --[[ Line: 103 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                        --]]
                        return u6:InvokeServer()
                    end)
                    if v101 and (type(v102) == "table" and v102.ok == true) then
                        u12 = v102.payload
                    end
                    u90()
                end
            end)
        end
    end
    v103("MainHUD", false)
    v103("MainHUD_Mobile", true)
end
(function() --[[ Name: buildGui, Line 127 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u29
        [3] = u4
        [4] = u9
        [5] = u13
        [6] = u11
        [7] = u10
        [8] = u90
    --]]
    u8 = u29("ScreenGui", {
        ["Name"] = "TitleGui",
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 256
    }, u4)
    local v105 = u29
    local v106 = "Frame"
    local v107 = {
        ["BackgroundColor3"] = Color3.fromRGB(18, 18, 18),
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    }
    local v108 = u4:FindFirstChild("MainHUD_Mobile")
    local v109 = u4:FindFirstChild("MainHUD")
    local v110
    if v108 then
        if v108:IsA("ScreenGui") then
            v110 = v108.Enabled
        else
            v110 = not v108:IsA("GuiObject") and true or v108.Visible
        end
    else
        v110 = false
    end
    local v111
    if v109 then
        if v109:IsA("ScreenGui") then
            v111 = v109.Enabled
        else
            v111 = not v109:IsA("GuiObject") and true or v109.Visible
        end
    else
        v111 = false
    end
    local v112
    if v110 and not v111 then
        v112 = true
    elseif v111 and not v110 then
        v112 = false
    else
        v112 = u13 == true
    end
    local v113
    if v112 then
        v113 = UDim2.new(0, 340, 0, 320)
    else
        v113 = UDim2.new(0, 620, 0, 500)
    end
    v107.Size = v113
    v107.Visible = false
    u9 = v105(v106, v107, u8)
    u29("UICorner", {
        ["CornerRadius"] = UDim.new(0, 10)
    }, u9)
    u29("UIStroke", {
        ["Color"] = Color3.fromRGB(90, 90, 90),
        ["Thickness"] = 1
    }, u9)
    u29("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 10),
        ["Size"] = UDim2.new(1, -24, 0, 24),
        ["Text"] = "\236\185\173\237\152\184",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(255, 230, 150),
        ["TextSize"] = 20,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u11 = u29("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.new(0, 12, 0, 36),
        ["Size"] = UDim2.new(1, -24, 0, 18),
        ["Text"] = "",
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextColor3"] = Color3.fromRGB(190, 190, 190),
        ["TextSize"] = 12,
        ["Font"] = Enum.Font.Code
    }, u9)
    u10 = u29("ScrollingFrame", {
        ["BackgroundColor3"] = Color3.fromRGB(23, 23, 23),
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.new(0, 12, 0, 62),
        ["Size"] = UDim2.new(1, -24, 1, -74),
        ["CanvasSize"] = UDim2.new(0, 0, 0, 0),
        ["ScrollBarThickness"] = 8,
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.None,
        ["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
    }, u9)
    u29("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, u10)
    local v114 = u29("TextButton", {
        ["BackgroundColor3"] = Color3.fromRGB(80, 50, 50),
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.new(1, -12, 0, 8),
        ["Size"] = UDim2.new(0, 72, 0, 30),
        ["Text"] = "\235\139\171\234\184\176",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.GothamBold
    }, u9)
    u29("UICorner", {
        ["CornerRadius"] = UDim.new(0, 8)
    }, v114)
    v114.Activated:Connect(function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.Visible = false
    end)
    if u9 then
        local v115 = u9
        local v116 = u4:FindFirstChild("MainHUD_Mobile")
        local v117 = u4:FindFirstChild("MainHUD")
        local v118
        if v116 then
            if v116:IsA("ScreenGui") then
                v118 = v116.Enabled
            else
                v118 = not v116:IsA("GuiObject") and true or v116.Visible
            end
        else
            v118 = false
        end
        local v119
        if v117 then
            if v117:IsA("ScreenGui") then
                v119 = v117.Enabled
            else
                v119 = not v117:IsA("GuiObject") and true or v117.Visible
            end
        else
            v119 = false
        end
        local v120
        if v118 and not v119 then
            v120 = true
        elseif v119 and not v118 then
            v120 = false
        else
            v120 = u13 == true
        end
        local v121
        if v120 then
            v121 = UDim2.new(0, 340, 0, 320)
        else
            v121 = UDim2.new(0, 620, 0, 500)
        end
        v115.Size = v121
    end
    if u10 and (u9 and u9.Visible) then
        u90()
    end
end)()
local function v134(p122, u123) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u9
        [4] = u10
        [5] = u90
        [6] = u6
        [7] = u12
    --]]
    local v124 = u4:FindFirstChild(p122)
    if v124 then
        v124 = v124:FindFirstChild("BtnTitle", true)
    end
    if v124 and (v124:IsA("GuiButton") and v124:GetAttribute("TitleBound") ~= true) then
        v124:SetAttribute("TitleBound", true)
        v124.Activated:Connect(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u123
                [3] = u9
                [4] = u4
                [5] = u10
                [6] = u90
                [7] = u6
                [8] = u12
            --]]
            u13 = u123 == true
            if u9 then
                local v125 = u9
                local v126 = u4:FindFirstChild("MainHUD_Mobile")
                local v127 = u4:FindFirstChild("MainHUD")
                local v128
                if v126 then
                    if v126:IsA("ScreenGui") then
                        v128 = v126.Enabled
                    else
                        v128 = not v126:IsA("GuiObject") and true or v126.Visible
                    end
                else
                    v128 = false
                end
                local v129
                if v127 then
                    if v127:IsA("ScreenGui") then
                        v129 = v127.Enabled
                    else
                        v129 = not v127:IsA("GuiObject") and true or v127.Visible
                    end
                else
                    v129 = false
                end
                local v130
                if v128 and not v129 then
                    v130 = true
                elseif v129 and not v128 then
                    v130 = false
                else
                    v130 = u13 == true
                end
                local v131
                if v130 then
                    v131 = UDim2.new(0, 340, 0, 320)
                else
                    v131 = UDim2.new(0, 620, 0, 500)
                end
                v125.Size = v131
            end
            if u10 and (u9 and u9.Visible) then
                u90()
            end
            u9.Visible = not u9.Visible
            if u9.Visible then
                local v132, v133 = pcall(function() --[[ Line: 103 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                    --]]
                    return u6:InvokeServer()
                end)
                if v132 and (type(v133) == "table" and v133.ok == true) then
                    u12 = v133.payload
                end
                u90()
            end
        end)
    end
end
v134("MainHUD", false)
v134("MainHUD_Mobile", true)
u4.DescendantAdded:Connect(function(p135) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u104
    --]]
    if p135.Name == "BtnTitle" and p135:IsA("GuiButton") then
        task.defer(u104)
    end
end)