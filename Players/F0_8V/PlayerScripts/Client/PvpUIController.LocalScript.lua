local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("StarterGui")
local u4 = v1.LocalPlayer
local u5 = u4:WaitForChild("PlayerGui")
local v6 = v2.Shared.Net
local u7 = v6:WaitForChild("PvpFetch")
local u8 = v6:WaitForChild("PvpToggle")
local v9 = v6:WaitForChild("PvpStatePush")
local u10 = Color3.fromRGB(60, 185, 85)
local u11 = Color3.fromRGB(195, 70, 70)
local u12 = Color3.fromRGB(255, 45, 45)
local u13 = {}
local u14 = 0
local u15 = 0
local u16 = nil
local u17 = 0
local function u36(p18) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v19 = type(p18) == "table" and p18 and p18 or {}
    local v20 = v19.toggleCooldownUntil
    local v21 = u4:GetAttribute("PvpToggleCooldownUntil")
    local v22 = tonumber(v21)
    local v23
    if v22 then
        local v24 = math.floor(v22)
        local v25 = v24 < 0 and 0 or v24
        v23 = v25 > 2147483647 and 2147483647 or v25
    else
        v23 = 0
    end
    local v26 = tonumber(v20)
    if v26 then
        local v27 = math.floor(v26)
        local v28 = v27 < 0 and 0 or v27
        v23 = v28 > 2147483647 and 2147483647 or v28
    end
    local v29 = v23 - os.time()
    local v30 = math.max(0, v29)
    local v31 = {
        ["enabled"] = v19.enabled == true,
        ["toggleCooldownUntil"] = v23
    }
    local v32 = v19.cooldownRemaining
    local v33 = tonumber(v32)
    if v33 then
        local v34 = math.floor(v33)
        local v35 = v34 < 0 and 0 or v34
        v30 = v35 > 2147483647 and 2147483647 or v35
    end
    v31.cooldownRemaining = v30
    return v31
end
local function u40(p37) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v38 = p37:FindFirstChild("PvpCooldownLabel")
    if v38 and v38:IsA("TextLabel") then
        return v38
    end
    local v39 = Instance.new("TextLabel")
    v39.Name = "PvpCooldownLabel"
    v39.BackgroundTransparency = 1
    v39.BorderSizePixel = 0
    v39.Position = UDim2.new(0, 0, 0, 0)
    v39.Size = UDim2.new(1, 0, 1, 0)
    v39.ZIndex = (p37.ZIndex or 1) + 5
    v39.Text = ""
    v39.TextColor3 = u12
    v39.TextStrokeColor3 = Color3.new(0, 0, 0)
    v39.TextStrokeTransparency = 0.35
    v39.TextScaled = true
    v39.Font = Enum.Font.GothamBlack
    v39.Visible = false
    v39.Parent = p37
    return v39
end
local function u56(p41, p42) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u10
        [3] = u11
        [4] = u40
    --]]
    if p41 and p41.Parent then
        local v43 = u36(p42)
        p41.BackgroundColor3 = v43.enabled and u10 or u11
        local v44 = u40(p41)
        v44.Visible = v43.cooldownRemaining > 0
        local v45
        if v43.cooldownRemaining > 0 then
            local v46 = v43.cooldownRemaining
            local v47 = 0
            local v48 = tonumber(v46)
            local v49
            if v48 then
                local v50 = math.floor(v48)
                local v51 = v50 < 0 and 0 or v50
                v49 = v51 > 2147483647 and 2147483647 or v51
            else
                v49 = 0
            end
            local v52 = math.max(v47, v49)
            local v53 = v52 / 60
            local v54 = math.floor(v53)
            local v55 = v52 % 60
            v45 = string.format("%02d:%02d", v54, v55) or ""
        else
            v45 = ""
        end
        v44.Text = v45
    end
end
local function u59(p57) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u56
    --]]
    for v58, _ in pairs(u13) do
        if v58 and v58.Parent then
            u56(v58, p57)
        else
            u13[v58] = nil
        end
    end
end
local function v62() --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u59
        [4] = u36
        [5] = u4
        [6] = u14
    --]]
    u16 = nil
    u17 = 0
    u59((u36({
        ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
        ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
    })))
    u14 = u14 + 1
    local u60 = u14
    task.spawn(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u60
            [3] = u16
            [4] = u17
            [5] = u36
            [6] = u4
            [7] = u59
        --]]
        while u14 == u60 do
            local v61
            if u16 and os.clock() < u17 then
                v61 = u36(u16)
            else
                v61 = u36({
                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                })
            end
            u59(v61)
            if v61.cooldownRemaining <= 0 then
                return
            end
            task.wait(1)
        end
    end)
end
local function v68(p63) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u36
        [3] = u17
        [4] = u59
        [5] = u14
        [6] = u4
    --]]
    u16 = u36(p63)
    local v64 = os.clock()
    local v65 = tonumber(3) or 0
    u17 = v64 + math.max(0, v65)
    u59(p63)
    u14 = u14 + 1
    local u66 = u14
    task.spawn(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u66
            [3] = u16
            [4] = u17
            [5] = u36
            [6] = u4
            [7] = u59
        --]]
        while u14 == u66 do
            local v67
            if u16 and os.clock() < u17 then
                v67 = u36(u16)
            else
                v67 = u36({
                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                })
            end
            u59(v67)
            if v67.cooldownRemaining <= 0 then
                return
            end
            task.wait(1)
        end
    end)
end
local function u113() --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u16
        [4] = u17
        [5] = u59
        [6] = u36
        [7] = u4
        [8] = u14
        [9] = u15
    --]]
    local v69, v70 = pcall(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        return u8:InvokeServer()
    end)
    if v69 and type(v70) == "table" then
        local v71 = u36(v70.state)
        u16 = u36(v71)
        local v72 = os.clock()
        local v73 = tonumber(2) or 0
        u17 = v72 + math.max(0, v73)
        u59(v71)
        u14 = u14 + 1
        local u74 = u14
        task.spawn(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u74
                [3] = u16
                [4] = u17
                [5] = u36
                [6] = u4
                [7] = u59
            --]]
            while u14 == u74 do
                local v75
                if u16 and os.clock() < u17 then
                    v75 = u36(u16)
                else
                    v75 = u36({
                        ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                        ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                    })
                end
                u59(v75)
                if v75.cooldownRemaining <= 0 then
                    return
                end
                task.wait(1)
            end
        end)
        if v70.ok == true then
            local u76 = v71.enabled and "PVP ON" or "PVP OFF"
            local u77 = false
            pcall(function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u76
                    [3] = u77
                --]]
                local v78 = u3
                local v79 = {
                    ["Title"] = "PVP"
                }
                local v80 = u76 or ""
                v79.Text = tostring(v80)
                v79.Duration = u77 and 5 or 3
                v78:SetCore("SendNotification", v79)
            end)
        else
            if v71.cooldownRemaining > 0 then
                local v81 = v71.cooldownRemaining
                local v82 = os.clock()
                if v82 >= u15 then
                    u15 = v82 + 1.5
                    local v83 = "\235\179\128\234\178\189 \236\191\168\237\131\128\236\158\132\236\157\180 \235\130\168\236\149\132\236\158\136\236\138\181\235\139\136\235\139\164. ("
                    local v84 = 0
                    local v85 = tonumber(v81)
                    local v86
                    if v85 then
                        local v87 = math.floor(v85)
                        local v88 = v87 < 0 and 0 or v87
                        v86 = v88 > 2147483647 and 2147483647 or v88
                    else
                        v86 = 0
                    end
                    local v89 = math.max(v84, v86)
                    local v90 = v89 / 60
                    local v91 = math.floor(v90)
                    local v92 = v89 % 60
                    local u93 = v83 .. string.format("%02d:%02d", v91, v92) .. ")"
                    local u94 = true
                    pcall(function() --[[ Line: 26 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u93
                            [3] = u94
                        --]]
                        local v95 = u3
                        local v96 = {
                            ["Title"] = "PVP"
                        }
                        local v97 = u93 or ""
                        v96.Text = tostring(v97)
                        v96.Duration = u94 and 5 or 3
                        v95:SetCore("SendNotification", v96)
                    end)
                end
            else
                local u98
                if v71 and v71.cooldownRemaining > 0 then
                    u98 = nil
                elseif type(v70) == "table" then
                    if v70.message == "rate_limited" then
                        u98 = "\236\158\160\236\139\156 \237\155\132 \235\139\164\236\139\156 \236\139\156\235\143\132\237\149\180."
                    else
                        local v99 = v70.message
                        local _ = type(v99) == "string" and (v70.message ~= "" and v70.message ~= "ok")
                        u98 = "PVP \236\131\129\237\131\156 \235\179\128\234\178\189 \236\139\164\237\140\168"
                    end
                else
                    u98 = "PVP \236\131\129\237\131\156 \235\179\128\234\178\189 \236\139\164\237\140\168"
                end
                local u100 = true
                pcall(function() --[[ Line: 26 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u98
                        [3] = u100
                    --]]
                    local v101 = u3
                    local v102 = {
                        ["Title"] = "PVP"
                    }
                    local v103 = u98 or ""
                    v102.Text = tostring(v103)
                    v102.Duration = u100 and 5 or 3
                    v101:SetCore("SendNotification", v102)
                end)
            end
            u16 = nil
            u17 = 0
            u59((u36({
                ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
            })))
            u14 = u14 + 1
            local u104 = u14
            task.spawn(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u104
                    [3] = u16
                    [4] = u17
                    [5] = u36
                    [6] = u4
                    [7] = u59
                --]]
                while u14 == u104 do
                    local v105
                    if u16 and os.clock() < u17 then
                        v105 = u36(u16)
                    else
                        v105 = u36({
                            ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                            ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                        })
                    end
                    u59(v105)
                    if v105.cooldownRemaining <= 0 then
                        return
                    end
                    task.wait(1)
                end
            end)
        end
    else
        local u106 = "PVP \236\131\129\237\131\156 \235\179\128\234\178\189 \236\139\164\237\140\168"
        local u107 = true
        pcall(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u106
                [3] = u107
            --]]
            local v108 = u3
            local v109 = {
                ["Title"] = "PVP"
            }
            local v110 = u106 or ""
            v109.Text = tostring(v110)
            v109.Duration = u107 and 5 or 3
            v108:SetCore("SendNotification", v109)
        end)
        u16 = nil
        u17 = 0
        u59((u36({
            ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
            ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
        })))
        u14 = u14 + 1
        local u111 = u14
        task.spawn(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u111
                [3] = u16
                [4] = u17
                [5] = u36
                [6] = u4
                [7] = u59
            --]]
            while u14 == u111 do
                local v112
                if u16 and os.clock() < u17 then
                    v112 = u36(u16)
                else
                    v112 = u36({
                        ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                        ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                    })
                end
                u59(v112)
                if v112.cooldownRemaining <= 0 then
                    return
                end
                task.wait(1)
            end
        end)
        return
    end
end
local function v124() --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u36
        [4] = u17
        [5] = u59
        [6] = u14
        [7] = u4
    --]]
    local v114, v115 = pcall(function() --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7:InvokeServer()
    end)
    if v114 and type(v115) == "table" then
        local v116 = v115.state
        if type(v116) == "table" then
            local v117 = v115.state
            u16 = u36(v117)
            local v118 = os.clock()
            local v119 = tonumber(3) or 0
            u17 = v118 + math.max(0, v119)
            u59(v117)
            u14 = u14 + 1
            local u120 = u14
            task.spawn(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u120
                    [3] = u16
                    [4] = u17
                    [5] = u36
                    [6] = u4
                    [7] = u59
                --]]
                while u14 == u120 do
                    local v121
                    if u16 and os.clock() < u17 then
                        v121 = u36(u16)
                    else
                        v121 = u36({
                            ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                            ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                        })
                    end
                    u59(v121)
                    if v121.cooldownRemaining <= 0 then
                        return
                    end
                    task.wait(1)
                end
            end)
            return
        end
    end
    u16 = nil
    u17 = 0
    u59((u36({
        ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
        ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
    })))
    u14 = u14 + 1
    local u122 = u14
    task.spawn(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u122
            [3] = u16
            [4] = u17
            [5] = u36
            [6] = u4
            [7] = u59
        --]]
        while u14 == u122 do
            local v123
            if u16 and os.clock() < u17 then
                v123 = u36(u16)
            else
                v123 = u36({
                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                })
            end
            u59(v123)
            if v123.cooldownRemaining <= 0 then
                return
            end
            task.wait(1)
        end
    end)
end
(function() --[[ Name: bindAll, Line 176 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u113
        [4] = u56
        [5] = u16
        [6] = u17
        [7] = u36
        [8] = u4
        [9] = u59
        [10] = u14
    --]]
    for _, v125 in ipairs({ "MainHUD", "MainHUD_Mobile" }) do
        local v126 = u5:FindFirstChild(v125)
        if v126 then
            for _, v127 in ipairs(v126:GetDescendants()) do
                if v127.Name == "BtnPVP" and (v127:IsA("GuiButton") and v127) then
                    if v127:IsA("GuiButton") then
                        if not u13[v127] then
                            u13[v127] = true
                            v127.Activated:Connect(u113)
                            local v128 = u56
                            local v129
                            if u16 and os.clock() < u17 then
                                v129 = u36(u16)
                            else
                                v129 = u36({
                                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                                })
                            end
                            v128(v127, v129)
                        end
                    end
                end
            end
        end
    end
    local v130 = u59
    local v131
    if u16 and os.clock() < u17 then
        v131 = u36(u16)
    else
        v131 = u36({
            ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
            ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
        })
    end
    v130(v131)
    u14 = u14 + 1
    local u132 = u14
    task.spawn(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u132
            [3] = u16
            [4] = u17
            [5] = u36
            [6] = u4
            [7] = u59
        --]]
        while u14 == u132 do
            local v133
            if u16 and os.clock() < u17 then
                v133 = u36(u16)
            else
                v133 = u36({
                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                })
            end
            u59(v133)
            if v133.cooldownRemaining <= 0 then
                return
            end
            task.wait(1)
        end
    end)
end)()
u4:GetAttributeChangedSignal("PvpEnabled"):Connect(v62)
u4:GetAttributeChangedSignal("PvpToggleCooldownUntil"):Connect(v62)
v9.OnClientEvent:Connect(v68)
u5.DescendantAdded:Connect(function(u134) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u113
        [3] = u56
        [4] = u16
        [5] = u17
        [6] = u36
        [7] = u4
        [8] = u59
    --]]
    if u134.Name == "BtnPVP" and u134:IsA("GuiButton") then
        task.defer(function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u134
                [2] = u13
                [3] = u113
                [4] = u56
                [5] = u16
                [6] = u17
                [7] = u36
                [8] = u4
                [9] = u59
            --]]
            local v135 = u134
            if v135 and (v135:IsA("GuiButton") and not u13[v135]) then
                u13[v135] = true
                v135.Activated:Connect(u113)
                local v136 = u56
                local v137
                if u16 and os.clock() < u17 then
                    v137 = u36(u16)
                else
                    v137 = u36({
                        ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                        ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                    })
                end
                v136(v135, v137)
            end
            local v138 = u59
            local v139
            if u16 and os.clock() < u17 then
                v139 = u36(u16)
            else
                v139 = u36({
                    ["enabled"] = u4:GetAttribute("PvpEnabled") == true,
                    ["toggleCooldownUntil"] = u4:GetAttribute("PvpToggleCooldownUntil")
                })
            end
            v138(v139)
        end)
    end
end)
task.defer(v124)