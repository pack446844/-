local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local u4 = v1.LocalPlayer
local u5 = u4:WaitForChild("PlayerGui")
local v6 = v2.Shared.Net
local u7 = v6:WaitForChild("DuelAction")
local v8 = v6:WaitForChild("DuelEvent")
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = {}
local u20 = nil
local u21 = false
local function u28(p22, p23, p24) --[[ Line: 60 ]]
    local v25 = Instance.new(p22)
    for v26, v27 in pairs(p23 or {}) do
        v25[v26] = v27
    end
    v25.Parent = p24
    return v25
end
local function u76() --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u21
        [4] = u19
        [5] = u28
        [6] = u7
        [7] = u16
        [8] = u3
        [9] = u76
    --]]
    if u11 then
        for _, v29 in ipairs(u11:GetChildren()) do
            if v29:IsA("Frame") then
                v29:Destroy()
            end
        end
        local v30 = u5:FindFirstChild("MainHUD_Mobile")
        local v31 = u5:FindFirstChild("MainHUD")
        local v32
        if v30 then
            if v30:IsA("ScreenGui") then
                v32 = v30.Enabled
            else
                v32 = not v30:IsA("GuiObject") and true or v30.Visible
            end
        else
            v32 = false
        end
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
        if v32 and not v33 then
            v34 = true
        elseif v33 and not v32 then
            v34 = false
        else
            v34 = u21 == true
        end
        local v35 = v34 and 40 or 46
        local v36 = u5:FindFirstChild("MainHUD_Mobile")
        local v37 = u5:FindFirstChild("MainHUD")
        local v38
        if v36 then
            if v36:IsA("ScreenGui") then
                v38 = v36.Enabled
            else
                v38 = not v36:IsA("GuiObject") and true or v36.Visible
            end
        else
            v38 = false
        end
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
        if v38 and not v39 then
            v40 = true
        elseif v39 and not v38 then
            v40 = false
        else
            v40 = u21 == true
        end
        local v41 = 0
        local v42 = v40 and 72 or 78
        for _, u43 in ipairs(u19 or {}) do
            local v44 = u28("Frame", {
                ["BackgroundColor3"] = Color3.fromRGB(30, 30, 30),
                ["BorderSizePixel"] = 0,
                ["Position"] = UDim2.new(0, 0, 0, v41),
                ["Size"] = UDim2.new(1, 0, 0, v35)
            }, u11)
            u28("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }, v44)
            local v45 = u28
            local v46 = "TextLabel"
            local v47 = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.new(0, 10, 0, 0),
                ["Size"] = UDim2.new(1, -104, 1, 0)
            }
            local v48 = string.format
            local v49 = u43.name or "Unknown"
            local v50 = tostring(v49)
            local v51 = u43.level
            local v52 = tonumber(v51) or 1
            v47.Text = v48("%s  Lv.%d", v50, (math.floor(v52)))
            v47.TextXAlignment = Enum.TextXAlignment.Left
            v47.TextColor3 = Color3.fromRGB(235, 235, 235)
            local v53 = u5:FindFirstChild("MainHUD_Mobile")
            local v54 = u5:FindFirstChild("MainHUD")
            local v55
            if v53 then
                if v53:IsA("ScreenGui") then
                    v55 = v53.Enabled
                else
                    v55 = not v53:IsA("GuiObject") and true or v53.Visible
                end
            else
                v55 = false
            end
            local v56
            if v54 then
                if v54:IsA("ScreenGui") then
                    v56 = v54.Enabled
                else
                    v56 = not v54:IsA("GuiObject") and true or v54.Visible
                end
            else
                v56 = false
            end
            local v57
            if v55 and not v56 then
                v57 = true
            elseif v56 and not v55 then
                v57 = false
            else
                v57 = u21 == true
            end
            v47.TextSize = v57 and 16 or 18
            v47.Font = Enum.Font.GothamBold
            v45(v46, v47, v44)
            local v58 = u28
            local v59 = {
                ["BackgroundColor3"] = u43.canInvite and Color3.fromRGB(70, 100, 70) or Color3.fromRGB(70, 70, 70),
                ["BorderSizePixel"] = 0
            }
            local v60 = UDim2.new
            local v61 = -(v42 + 10)
            local v62 = (v35 - 30) / 2
            v59.Position = v60(1, v61, 0, (math.floor(v62)))
            v59.Size = UDim2.new(0, v42, 0, 30)
            v59.Text = u43.canInvite and "\236\139\160\236\178\173" or "\235\182\136\234\176\128"
            v59.TextColor3 = Color3.fromRGB(255, 255, 255)
            v59.TextSize = 15
            v59.Font = Enum.Font.GothamBold
            v59.AutoButtonColor = u43.canInvite
            local v63 = v58("TextButton", v59, v44)
            u28("UICorner", {
                ["CornerRadius"] = UDim.new(0, 7)
            }, v63)
            v63.Activated:Connect(function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u43
                    [3] = u16
                    [4] = u3
                    [5] = u19
                    [6] = u76
                --]]
                local v64 = u7:InvokeServer({
                    ["action"] = "invite",
                    ["targetUserId"] = u43.userId
                })
                if type(v64) == "table" and v64.ok == true then
                    if u16 then
                        u16.Text = tostring("\234\178\176\237\136\172 \236\139\160\236\178\173\236\157\132 \235\179\180\235\131\136\236\138\181\235\139\136\235\139\164.")
                        u16.TextColor3 = Color3.fromRGB(190, 190, 190)
                    end
                    local u65 = "\234\178\176\237\136\172 \236\139\160\236\178\173\236\157\132 \235\179\180\235\131\136\236\138\181\235\139\136\235\139\164."
                    local u66 = false
                    pcall(function() --[[ Line: 41 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u65
                            [3] = u66
                        --]]
                        local v67 = u3
                        local v68 = {
                            ["Title"] = "\234\178\176\237\136\172"
                        }
                        local v69 = u65 or ""
                        v68.Text = tostring(v69)
                        v68.Duration = u66 and 5 or 3
                        v67:SetCore("SendNotification", v68)
                    end)
                    u19 = v64.payload and v64.payload.players or u19
                else
                    if v64 then
                        v64 = v64.message
                    end
                    local v70 = tostring(v64 or "")
                    local u71 = v70 == "same_party" and "\234\176\153\236\157\128 \237\140\140\237\139\176\236\155\144\236\151\144\234\178\140\235\138\148 \234\178\176\237\136\172\235\165\188 \236\139\160\236\178\173\237\149\160 \236\136\152 \236\151\134\236\138\181\235\139\136\235\139\164." or (v70 == "target_blocked" and "\236\131\129\235\140\128\234\176\128 \234\178\176\237\136\172 \236\180\136\235\140\128\235\165\188 \235\176\155\234\179\160 \236\158\136\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164." or (v70 == "send_cooldown" and "\234\178\176\237\136\172 \236\158\172\236\139\160\236\178\173 \235\140\128\234\184\176\236\139\156\234\176\132\236\157\180 \235\130\168\236\149\132 \236\158\136\236\138\181\235\139\136\235\139\164." or (v70 == "busy" and "\236\131\129\235\140\128\234\176\128 \236\157\180\235\175\184 \234\178\176\237\136\172 \236\164\145\236\158\133\235\139\136\235\139\164." or (v70 == "expired" and "\234\178\176\237\136\172 \236\139\160\236\178\173\236\157\180 \235\167\140\235\163\140\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164." or ((v70 == "from_missing" or v70 == "missing") and "\236\157\180\235\175\184 \236\178\152\235\166\172\235\144\156 \234\178\176\237\136\172 \236\139\160\236\178\173\236\158\133\235\139\136\235\139\164." or (v70 == "arena_missing" and "\234\178\176\237\136\172\236\158\165 \237\140\140\237\138\184\235\165\188 \236\176\190\236\167\128 \235\170\187\237\150\136\236\138\181\235\139\136\235\139\164." or (v70 == "teleport_failed" and "\234\178\176\237\136\172\236\158\165 \236\157\180\235\143\153\236\151\144 \236\139\164\237\140\168\237\150\136\236\138\181\235\139\136\235\139\164." or ((v70 == "" or not v70) and "\236\152\164\235\165\152" or v70))))))))
                    if u16 then
                        u16.Text = tostring(u71 or "")
                        u16.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
                    end
                    local u72 = true
                    pcall(function() --[[ Line: 41 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u71
                            [3] = u72
                        --]]
                        local v73 = u3
                        local v74 = {
                            ["Title"] = "\234\178\176\237\136\172"
                        }
                        local v75 = u71 or ""
                        v74.Text = tostring(v75)
                        v74.Duration = u72 and 5 or 3
                        v73:SetCore("SendNotification", v74)
                    end)
                end
                u76()
            end)
            v41 = v41 + v35 + 6
        end
        u11.CanvasSize = UDim2.new(0, 0, 0, v41)
    end
end
local function u119() --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u21
        [4] = u14
        [5] = u15
        [6] = u17
        [7] = u18
        [8] = u11
        [9] = u76
    --]]
    if u10 then
        local v77 = u10
        local v78 = u5:FindFirstChild("MainHUD_Mobile")
        local v79 = u5:FindFirstChild("MainHUD")
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
        if v79 then
            if v79:IsA("ScreenGui") then
                v81 = v79.Enabled
            else
                v81 = not v79:IsA("GuiObject") and true or v79.Visible
            end
        else
            v81 = false
        end
        local v82
        if v80 and not v81 then
            v82 = true
        elseif v81 and not v80 then
            v82 = false
        else
            v82 = u21 == true
        end
        local v83
        if v82 then
            v83 = UDim2.new(0, 340, 0, 360)
        else
            v83 = UDim2.new(0, 560, 0, 560)
        end
        v77.Size = v83
    end
    if u14 then
        local v84 = u14
        local v85 = u5:FindFirstChild("MainHUD_Mobile")
        local v86 = u5:FindFirstChild("MainHUD")
        local v87
        if v85 then
            if v85:IsA("ScreenGui") then
                v87 = v85.Enabled
            else
                v87 = not v85:IsA("GuiObject") and true or v85.Visible
            end
        else
            v87 = false
        end
        local v88
        if v86 then
            if v86:IsA("ScreenGui") then
                v88 = v86.Enabled
            else
                v88 = not v86:IsA("GuiObject") and true or v86.Visible
            end
        else
            v88 = false
        end
        local v89
        if v87 and not v88 then
            v89 = true
        elseif v88 and not v87 then
            v89 = false
        else
            v89 = u21 == true
        end
        local v90
        if v89 then
            v90 = UDim2.new(0, 300, 0, 120)
        else
            v90 = UDim2.new(0, 420, 0, 148)
        end
        v84.Size = v90
    end
    if u15 then
        local v91 = u15
        local v92 = u5:FindFirstChild("MainHUD_Mobile")
        local v93 = u5:FindFirstChild("MainHUD")
        local v94
        if v92 then
            if v92:IsA("ScreenGui") then
                v94 = v92.Enabled
            else
                v94 = not v92:IsA("GuiObject") and true or v92.Visible
            end
        else
            v94 = false
        end
        local v95
        if v93 then
            if v93:IsA("ScreenGui") then
                v95 = v93.Enabled
            else
                v95 = not v93:IsA("GuiObject") and true or v93.Visible
            end
        else
            v95 = false
        end
        local v96
        if v94 and not v95 then
            v96 = true
        elseif v95 and not v94 then
            v96 = false
        else
            v96 = u21 == true
        end
        v91.Size = v96 and UDim2.new(1, -24, 0, 42) or UDim2.new(1, -28, 0, 50)
        local v97 = u15
        local v98 = u5:FindFirstChild("MainHUD_Mobile")
        local v99 = u5:FindFirstChild("MainHUD")
        local v100
        if v98 then
            if v98:IsA("ScreenGui") then
                v100 = v98.Enabled
            else
                v100 = not v98:IsA("GuiObject") and true or v98.Visible
            end
        else
            v100 = false
        end
        local v101
        if v99 then
            if v99:IsA("ScreenGui") then
                v101 = v99.Enabled
            else
                v101 = not v99:IsA("GuiObject") and true or v99.Visible
            end
        else
            v101 = false
        end
        local v102
        if v100 and not v101 then
            v102 = true
        elseif v101 and not v100 then
            v102 = false
        else
            v102 = u21 == true
        end
        v97.TextSize = v102 and 16 or 18
    end
    if u17 then
        local v103 = u17
        local v104 = UDim2.new
        local v105 = 0
        local v106 = u5:FindFirstChild("MainHUD_Mobile")
        local v107 = u5:FindFirstChild("MainHUD")
        local v108
        if v106 then
            if v106:IsA("ScreenGui") then
                v108 = v106.Enabled
            else
                v108 = not v106:IsA("GuiObject") and true or v106.Visible
            end
        else
            v108 = false
        end
        local v109
        if v107 then
            if v107:IsA("ScreenGui") then
                v109 = v107.Enabled
            else
                v109 = not v107:IsA("GuiObject") and true or v107.Visible
            end
        else
            v109 = false
        end
        local v110
        if v108 and not v109 then
            v110 = true
        elseif v109 and not v108 then
            v110 = false
        else
            v110 = u21 == true
        end
        v103.Size = v104(v105, v110 and 120 or 160, 0, 30)
        u17.Position = UDim2.new(0, 18, 1, -46)
    end
    if u18 then
        local v111 = u18
        local v112 = UDim2.new
        local v113 = 0
        local v114 = u5:FindFirstChild("MainHUD_Mobile")
        local v115 = u5:FindFirstChild("MainHUD")
        local v116
        if v114 then
            if v114:IsA("ScreenGui") then
                v116 = v114.Enabled
            else
                v116 = not v114:IsA("GuiObject") and true or v114.Visible
            end
        else
            v116 = false
        end
        local v117
        if v115 then
            if v115:IsA("ScreenGui") then
                v117 = v115.Enabled
            else
                v117 = not v115:IsA("GuiObject") and true or v115.Visible
            end
        else
            v117 = false
        end
        local v118
        if v116 and not v117 then
            v118 = true
        elseif v117 and not v116 then
            v118 = false
        else
            v118 = u21 == true
        end
        v111.Size = v112(v113, v118 and 120 or 160, 0, 30)
        u18.Position = UDim2.new(1, -18, 1, -16)
    end
    if u11 and (u10 and u10.Visible) then
        u76()
    end
end
local function u132() --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u19
        [4] = u76
        [5] = u16
        [6] = u13
        [7] = u4
    --]]
    u10.Visible = not u10.Visible
    if u10.Visible then
        local v120 = u7:InvokeServer({
            ["action"] = "list"
        })
        if type(v120) == "table" and v120.ok == true then
            u19 = v120.payload and v120.payload.players or {}
            u76()
        elseif u16 then
            u16.Text = tostring("\235\170\169\235\161\157\236\157\132 \235\182\136\235\159\172\236\152\164\236\167\128 \235\170\187\237\150\136\236\138\181\235\139\136\235\139\164.")
            u16.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
        end
    end
    if u13 then
        local v121 = u4
        local v122 = tonumber(v121:GetAttribute("DuelSendCooldownUntil")) or 0
        local v123 = math.floor(v122)
        local v124 = math.max(0, v123)
        local v125 = (tonumber(v124) or 0) - os.time()
        local v126 = math.floor(v125)
        local v127 = math.max(0, v126)
        local v128 = v127 / 60
        local v129 = math.floor(v128)
        local v130 = v127 % 60
        local v131 = string.format("%02d:%02d", v129, v130)
        u13.Text = v127 > 0 and v131 and v131 or ""
    end
end
local function u137() --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u21
        [3] = u119
        [4] = u132
    --]]
    local function v136(p133, u134) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u21
            [3] = u119
            [4] = u132
        --]]
        local v135 = u5:FindFirstChild(p133)
        if v135 then
            v135 = v135:FindFirstChild("BtnFight", true)
        end
        if v135 and (v135:IsA("GuiButton") and v135:GetAttribute("DuelBound") ~= true) then
            v135:SetAttribute("DuelBound", true)
            v135.Activated:Connect(function() --[[ Line: 150 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u134
                    [3] = u119
                    [4] = u132
                --]]
                u21 = u134 == true
                u119()
                u132()
            end)
        end
    end
    v136("MainHUD", false)
    v136("MainHUD_Mobile", true)
end
local function u142(p138) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u119
        [3] = u14
        [4] = u15
    --]]
    u20 = {
        ["fromUserId"] = p138.fromUserId,
        ["expiresAt"] = p138.expiresAt
    }
    u119()
    u14.Visible = true
    local v139 = u15
    local v140 = string.format
    local v141 = p138.fromName or "Unknown"
    v139.Text = v140("%s \235\139\152\236\157\180 \234\178\176\237\136\172\235\165\188 \236\139\160\236\178\173\237\150\136\236\138\181\235\139\136\235\139\164.", (tostring(v141)))
end
(function() --[[ Name: buildGui, Line 170 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u28
        [3] = u5
        [4] = u10
        [5] = u21
        [6] = u12
        [7] = u13
        [8] = u16
        [9] = u11
        [10] = u14
        [11] = u15
        [12] = u17
        [13] = u18
        [14] = u20
        [15] = u7
        [16] = u3
        [17] = u119
    --]]
    if not u9 then
        u9 = u28("ScreenGui", {
            ["Name"] = "DuelGui",
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true,
            ["DisplayOrder"] = 260
        }, u5)
        local v143 = u28
        local v144 = "Frame"
        local v145 = {
            ["BackgroundColor3"] = Color3.fromRGB(18, 18, 18),
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
        }
        local v146 = u5:FindFirstChild("MainHUD_Mobile")
        local v147 = u5:FindFirstChild("MainHUD")
        local v148
        if v146 then
            if v146:IsA("ScreenGui") then
                v148 = v146.Enabled
            else
                v148 = not v146:IsA("GuiObject") and true or v146.Visible
            end
        else
            v148 = false
        end
        local v149
        if v147 then
            if v147:IsA("ScreenGui") then
                v149 = v147.Enabled
            else
                v149 = not v147:IsA("GuiObject") and true or v147.Visible
            end
        else
            v149 = false
        end
        local v150
        if v148 and not v149 then
            v150 = true
        elseif v149 and not v148 then
            v150 = false
        else
            v150 = u21 == true
        end
        local v151
        if v150 then
            v151 = UDim2.new(0, 340, 0, 360)
        else
            v151 = UDim2.new(0, 560, 0, 560)
        end
        v145.Size = v151
        v145.Visible = false
        u10 = v143(v144, v145, u9)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }, u10)
        u28("UIStroke", {
            ["Color"] = Color3.fromRGB(90, 90, 90),
            ["Thickness"] = 1
        }, u10)
        u12 = u28("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Position"] = UDim2.new(0, 12, 0, 10),
            ["Size"] = UDim2.new(0.7, 0, 0, 24),
            ["Text"] = "\234\178\176\237\136\172",
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(255, 230, 150),
            ["TextSize"] = 20,
            ["Font"] = Enum.Font.GothamBold
        }, u10)
        u13 = u28("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.new(1, -16, 0, 10),
            ["Size"] = UDim2.new(0, 90, 0, 24),
            ["Text"] = "",
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = Color3.fromRGB(255, 140, 140),
            ["TextSize"] = 18,
            ["Font"] = Enum.Font.Code
        }, u10)
        local v152 = u28("TextButton", {
            ["BackgroundColor3"] = Color3.fromRGB(75, 50, 50),
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.new(1, -12, 0, 40),
            ["Size"] = UDim2.new(0, 72, 0, 28),
            ["Text"] = "\235\139\171\234\184\176",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextSize"] = 15,
            ["Font"] = Enum.Font.GothamBold
        }, u10)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 7)
        }, v152)
        v152.Activated:Connect(function() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.Visible = false
        end)
        u16 = u28("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Position"] = UDim2.new(0, 12, 0, 42),
            ["Size"] = UDim2.new(1, -96, 0, 22),
            ["Text"] = "",
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = Color3.fromRGB(190, 190, 190),
            ["TextSize"] = 13,
            ["Font"] = Enum.Font.Code
        }, u10)
        u11 = u28("ScrollingFrame", {
            ["BackgroundColor3"] = Color3.fromRGB(23, 23, 23),
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.new(0, 12, 0, 74),
            ["Size"] = UDim2.new(1, -24, 1, -86),
            ["CanvasSize"] = UDim2.new(0, 0, 0, 0),
            ["ScrollBarThickness"] = 8,
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.None,
            ["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
        }, u10)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }, u11)
        local v153 = u28
        local v154 = "Frame"
        local v155 = {
            ["BackgroundColor3"] = Color3.fromRGB(22, 22, 22),
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.5, 0, 0.22, 0)
        }
        local v156 = u5:FindFirstChild("MainHUD_Mobile")
        local v157 = u5:FindFirstChild("MainHUD")
        local v158
        if v156 then
            if v156:IsA("ScreenGui") then
                v158 = v156.Enabled
            else
                v158 = not v156:IsA("GuiObject") and true or v156.Visible
            end
        else
            v158 = false
        end
        local v159
        if v157 then
            if v157:IsA("ScreenGui") then
                v159 = v157.Enabled
            else
                v159 = not v157:IsA("GuiObject") and true or v157.Visible
            end
        else
            v159 = false
        end
        local v160
        if v158 and not v159 then
            v160 = true
        elseif v159 and not v158 then
            v160 = false
        else
            v160 = u21 == true
        end
        local v161
        if v160 then
            v161 = UDim2.new(0, 300, 0, 120)
        else
            v161 = UDim2.new(0, 420, 0, 148)
        end
        v155.Size = v161
        v155.Visible = false
        u14 = v153(v154, v155, u9)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }, u14)
        u28("UIStroke", {
            ["Color"] = Color3.fromRGB(90, 90, 90),
            ["Thickness"] = 1
        }, u14)
        u15 = u28("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Position"] = UDim2.new(0, 14, 0, 14),
            ["Size"] = UDim2.new(1, -28, 0, 50),
            ["TextWrapped"] = true,
            ["Text"] = "",
            ["TextColor3"] = Color3.fromRGB(240, 240, 240),
            ["TextSize"] = 18,
            ["Font"] = Enum.Font.GothamBold
        }, u14)
        u17 = u28("TextButton", {
            ["BackgroundColor3"] = Color3.fromRGB(60, 100, 60),
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.new(0, 18, 1, -46),
            ["Size"] = UDim2.new(0, 160, 0, 30),
            ["Text"] = "\236\136\152\235\157\189",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.GothamBold
        }, u14)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }, u17)
        u18 = u28("TextButton", {
            ["BackgroundColor3"] = Color3.fromRGB(100, 60, 60),
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.new(1, -18, 1, -16),
            ["Size"] = UDim2.new(0, 160, 0, 30),
            ["Text"] = "\234\177\176\236\160\136",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.GothamBold
        }, u14)
        u28("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }, u18)
        u17.Activated:Connect(function() --[[ Line: 192 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u7
                [3] = u14
                [4] = u3
                [5] = u16
            --]]
            if u20 then
                local v162 = u7:InvokeServer({
                    ["action"] = "accept",
                    ["fromUserId"] = u20.fromUserId
                })
                if type(v162) == "table" and v162.ok == true then
                    u20 = nil
                    if u14 then
                        u14.Visible = false
                    end
                    local u163 = "\234\178\176\237\136\172\235\165\188 \236\136\152\235\157\189\237\150\136\236\138\181\235\139\136\235\139\164."
                    local u164 = false
                    pcall(function() --[[ Line: 41 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u163
                            [3] = u164
                        --]]
                        local v165 = u3
                        local v166 = {
                            ["Title"] = "\234\178\176\237\136\172"
                        }
                        local v167 = u163 or ""
                        v166.Text = tostring(v167)
                        v166.Duration = u164 and 5 or 3
                        v165:SetCore("SendNotification", v166)
                    end)
                else
                    if v162 then
                        v162 = v162.message
                    end
                    local v168 = tostring(v162 or "")
                    local u169 = v168 == "same_party" and "\234\176\153\236\157\128 \237\140\140\237\139\176\236\155\144\236\151\144\234\178\140\235\138\148 \234\178\176\237\136\172\235\165\188 \236\139\160\236\178\173\237\149\160 \236\136\152 \236\151\134\236\138\181\235\139\136\235\139\164." or (v168 == "target_blocked" and "\236\131\129\235\140\128\234\176\128 \234\178\176\237\136\172 \236\180\136\235\140\128\235\165\188 \235\176\155\234\179\160 \236\158\136\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164." or (v168 == "send_cooldown" and "\234\178\176\237\136\172 \236\158\172\236\139\160\236\178\173 \235\140\128\234\184\176\236\139\156\234\176\132\236\157\180 \235\130\168\236\149\132 \236\158\136\236\138\181\235\139\136\235\139\164." or (v168 == "busy" and "\236\131\129\235\140\128\234\176\128 \236\157\180\235\175\184 \234\178\176\237\136\172 \236\164\145\236\158\133\235\139\136\235\139\164." or (v168 == "expired" and "\234\178\176\237\136\172 \236\139\160\236\178\173\236\157\180 \235\167\140\235\163\140\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164." or ((v168 == "from_missing" or v168 == "missing") and "\236\157\180\235\175\184 \236\178\152\235\166\172\235\144\156 \234\178\176\237\136\172 \236\139\160\236\178\173\236\158\133\235\139\136\235\139\164." or (v168 == "arena_missing" and "\234\178\176\237\136\172\236\158\165 \237\140\140\237\138\184\235\165\188 \236\176\190\236\167\128 \235\170\187\237\150\136\236\138\181\235\139\136\235\139\164." or (v168 == "teleport_failed" and "\234\178\176\237\136\172\236\158\165 \236\157\180\235\143\153\236\151\144 \236\139\164\237\140\168\237\150\136\236\138\181\235\139\136\235\139\164." or ((v168 == "" or not v168) and "\236\152\164\235\165\152" or v168))))))))
                    if u16 then
                        u16.Text = tostring(u169 or "")
                        u16.TextColor3 = Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
                    end
                    local u170 = true
                    pcall(function() --[[ Line: 41 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u169
                            [3] = u170
                        --]]
                        local v171 = u3
                        local v172 = {
                            ["Title"] = "\234\178\176\237\136\172"
                        }
                        local v173 = u169 or ""
                        v172.Text = tostring(v173)
                        v172.Duration = u170 and 5 or 3
                        v171:SetCore("SendNotification", v172)
                    end)
                end
            else
                return
            end
        end)
        u18.Activated:Connect(function() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u7
                [3] = u14
            --]]
            if u20 then
                u7:InvokeServer({
                    ["action"] = "decline",
                    ["fromUserId"] = u20.fromUserId
                })
                u20 = nil
                if u14 then
                    u14.Visible = false
                end
            end
        end)
        u119()
    end
end)()
local function v177(p174, u175) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u21
        [3] = u119
        [4] = u132
    --]]
    local v176 = u5:FindFirstChild(p174)
    if v176 then
        v176 = v176:FindFirstChild("BtnFight", true)
    end
    if v176 and (v176:IsA("GuiButton") and v176:GetAttribute("DuelBound") ~= true) then
        v176:SetAttribute("DuelBound", true)
        v176.Activated:Connect(function() --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u175
                [3] = u119
                [4] = u132
            --]]
            u21 = u175 == true
            u119()
            u132()
        end)
    end
end
v177("MainHUD", false)
v177("MainHUD_Mobile", true)
u5.DescendantAdded:Connect(function(p178) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u137
    --]]
    if p178.Name == "BtnFight" and p178:IsA("GuiButton") then
        task.defer(u137)
    end
end)
task.spawn(function() --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u20
        [4] = u14
    --]]
    while true do
        task.wait(0.25)
        if u13 then
            local v179 = u4
            local v180 = tonumber(v179:GetAttribute("DuelSendCooldownUntil")) or 0
            local v181 = math.floor(v180)
            local v182 = math.max(0, v181)
            local v183 = (tonumber(v182) or 0) - os.time()
            local v184 = math.floor(v183)
            local v185 = math.max(0, v184)
            local v186 = v185 / 60
            local v187 = math.floor(v186)
            local v188 = v185 % 60
            local v189 = string.format("%02d:%02d", v187, v188)
            u13.Text = v185 > 0 and v189 and v189 or ""
        end
        if u20 then
            local v190 = u20.expiresAt or 0
            if tonumber(v190) <= os.time() then
                u20 = nil
                if u14 then
                    u14.Visible = false
                end
            end
        end
    end
end)
v8.OnClientEvent:Connect(function(p191) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u142
        [2] = u3
        [3] = u16
        [4] = u20
        [5] = u14
        [6] = u10
        [7] = u7
        [8] = u19
        [9] = u76
    --]]
    if type(p191) == "table" then
        local v192 = p191.kind or ""
        local v193 = tostring(v192)
        if v193 == "invite" then
            u142(p191)
        elseif v193 == "notice" then
            local u194 = p191.text
            local u195 = p191.isError == true
            pcall(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u194
                    [3] = u195
                --]]
                local v196 = u3
                local v197 = {
                    ["Title"] = "\234\178\176\237\136\172"
                }
                local v198 = u194 or ""
                v197.Text = tostring(v198)
                v197.Duration = u195 and 5 or 3
                v196:SetCore("SendNotification", v197)
            end)
            local v199 = p191.text
            local v200 = p191.isError == true
            if u16 then
                u16.Text = tostring(v199 or "")
                u16.TextColor3 = v200 and Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
                return
            end
        else
            if v193 == "started" then
                u20 = nil
                if u14 then
                    u14.Visible = false
                end
                local u201 = "\234\178\176\237\136\172\234\176\128 \236\139\156\236\158\145\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164."
                local u202 = false
                pcall(function() --[[ Line: 41 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u201
                        [3] = u202
                    --]]
                    local v203 = u3
                    local v204 = {
                        ["Title"] = "\234\178\176\237\136\172"
                    }
                    local v205 = u201 or ""
                    v204.Text = tostring(v205)
                    v204.Duration = u202 and 5 or 3
                    v203:SetCore("SendNotification", v204)
                end)
                if u16 then
                    u16.Text = tostring("\234\178\176\237\136\172 \236\167\132\237\150\137 \236\164\145")
                    u16.TextColor3 = Color3.fromRGB(190, 190, 190)
                end
                u10.Visible = false
                return
            end
            if v193 == "ended" then
                u20 = nil
                if u14 then
                    u14.Visible = false
                end
                local u206 = p191.text
                local u207 = p191.result ~= "win"
                pcall(function() --[[ Line: 41 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u206
                        [3] = u207
                    --]]
                    local v208 = u3
                    local v209 = {
                        ["Title"] = "\234\178\176\237\136\172"
                    }
                    local v210 = u206 or ""
                    v209.Text = tostring(v210)
                    v209.Duration = u207 and 5 or 3
                    v208:SetCore("SendNotification", v209)
                end)
                local v211 = p191.text
                local v212 = p191.result ~= "win"
                if u16 then
                    u16.Text = tostring(v211 or "")
                    u16.TextColor3 = v212 and Color3.fromRGB(255, 120, 120) or Color3.fromRGB(190, 190, 190)
                end
                u10.Visible = true
                local v213 = u7:InvokeServer({
                    ["action"] = "list"
                })
                if type(v213) == "table" and v213.ok == true then
                    u19 = v213.payload and v213.payload.players or u19
                    u76()
                end
            end
        end
    else
        return
    end
end)