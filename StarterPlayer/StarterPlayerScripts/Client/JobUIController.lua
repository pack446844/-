local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = game:GetService("RunService")
local u5 = v2.Shared.Net
local u6 = require(v2.Shared.Defs.JobDefs)
local u7 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u8 = require(v2.Shared.Util.PlatformGui)
local v9 = u5:WaitForChild("DataSync")
local v10 = u5:WaitForChild("HudSync")
local u11 = u5:WaitForChild("RobuxShopRequest")
local u12 = {
    ["gui"] = nil,
    ["box"] = nil,
    ["grid"] = nil,
    ["gridLayout"] = nil,
    ["statusLbl"] = nil,
    ["currentLbl"] = nil,
    ["cooldownLbl"] = nil,
    ["resetBtn"] = nil,
    ["closeBtn"] = nil,
    ["slots"] = {}
}
local u13 = {
    ["jobId"] = "novice",
    ["unlockedJobs"] = {
        ["novice"] = true
    },
    ["jobSwapCooldownUntil"] = 0
}
local u14 = setmetatable({}, {
    ["__mode"] = "k"
})
local u15 = 0
local function u25() --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    local v16 = {}
    for v17, v18 in pairs(u13.unlockedJobs or {}) do
        if v18 == true and u6[v17] then
            table.insert(v16, v17)
        end
    end
    table.sort(v16, function(p19, p20) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v21 = u6[p19]
        if v21 then
            v21 = u6[p19].uiOrder
        end
        local v22 = tonumber(v21) or 999
        local v23 = u6[p20]
        if v23 then
            v23 = u6[p20].uiOrder
        end
        local v24 = tonumber(v23) or 999
        if v22 == v24 then
            return p19 < p20
        else
            return v22 < v24
        end
    end)
    return v16
end
local function u43() --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    if u12.cooldownLbl then
        local v26 = 0
        local v27 = u13.jobSwapCooldownUntil
        local v28 = tonumber(v27)
        local v29
        if v28 then
            local v30 = math.floor(v28)
            v29 = v30 < 0 and 0 or v30
        else
            v29 = 0
        end
        local v31, v32 = pcall(function() --[[ Line: 48 ]]
            return workspace:GetServerTimeNow()
        end)
        if not v31 then
            v32 = os.clock()
        end
        local v33 = v29 - math.floor(v32)
        local v34 = math.max(v26, v33)
        local v35 = u12.cooldownLbl
        local v36 = tonumber(v34) or 0
        local v37 = math.floor(v36)
        local v38 = math.max(0, v37)
        local v39 = v38 / 60
        local v40 = math.floor(v39)
        local v41 = v38 % 60
        v35.Text = string.format("%02d:%02d", v40, v41)
        if u12.resetBtn then
            local v42 = v34 > 0
            u12.resetBtn.Active = v42
            u12.resetBtn.AutoButtonColor = v42
            u12.resetBtn.TextTransparency = v42 and 0 or 0.45
            u12.resetBtn.BackgroundColor3 = v42 and Color3.fromRGB(225, 225, 225) or Color3.fromRGB(240, 240, 240)
        end
    end
end
local function u68() --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
    --]]
    if u12.grid and u12.gridLayout then
        local v44 = u12.grid.AbsoluteSize
        if v44.X > 0 and v44.Y > 0 then
            local v45 = u12.gridLayout.FillDirectionMaxCells
            local v46 = tonumber(v45) or 6
            local v47 = math.max(1, v46)
            local v48 = 12 / v47
            local v49 = math.ceil(v48)
            local v50 = math.max(1, v49)
            local v51 = workspace.CurrentCamera
            local v52 = v51 and v51.ViewportSize or Vector2.new(1920, 1080)
            if v52.X <= 0 or v52.Y <= 0 then
                v52 = Vector2.new(1920, 1080)
            end
            local v53 = u3.TouchEnabled
            if v53 then
                local v54 = v52.X
                local v55 = v52.Y
                v53 = math.min(v54, v55) <= 900
            end
            local v56 = v53 and 8 or 10
            local v57 = (v44.X - v56 * (v47 - 1)) / v47
            local v58 = math.floor(v57)
            local v59 = (v44.Y - v56 * (v50 - 1)) / v50
            local v60 = math.floor(v59)
            local v61 = workspace.CurrentCamera
            local v62 = v61 and v61.ViewportSize or Vector2.new(1920, 1080)
            if v62.X <= 0 or v62.Y <= 0 then
                v62 = Vector2.new(1920, 1080)
            end
            local v63 = u3.TouchEnabled
            if v63 then
                local v64 = v62.X
                local v65 = v62.Y
                v63 = math.min(v64, v65) <= 900
            end
            local v66 = math.min(v58, v60)
            local v67 = math.max(v63 and 40 or 48, v66)
            u12.gridLayout.CellPadding = UDim2.fromOffset(v56, v56)
            u12.gridLayout.CellSize = UDim2.fromOffset(v67, v67)
        end
    else
        return
    end
end
local function u84() --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u68
    --]]
    if u12.box then
        local v69 = u12.box:FindFirstChild("Header")
        if v69 then
            local v70 = v69:FindFirstChild("Title")
            local v71 = workspace.CurrentCamera
            local v72 = v71 and v71.ViewportSize or Vector2.new(1920, 1080)
            if v72.X <= 0 or v72.Y <= 0 then
                v72 = Vector2.new(1920, 1080)
            end
            local v73 = u3.TouchEnabled
            if v73 then
                local v74 = v72.X
                local v75 = v72.Y
                v73 = math.min(v74, v75) <= 900
            end
            if v73 then
                local v76 = workspace.CurrentCamera
                local v77 = v76 and v76.ViewportSize or Vector2.new(1920, 1080)
                if v77.X <= 0 or v77.Y <= 0 then
                    v77 = Vector2.new(1920, 1080)
                end
                local v78 = v77.X - 32
                local v79 = math.clamp(v78, 360, 620)
                local v80 = v77.Y - 140
                local v81 = math.clamp(v80, 330, 390)
                local v82 = v81 - 84 - 14 - 26 - 8
                local v83 = math.max(150, v82)
                u12.box.Size = UDim2.fromOffset(v79, v81)
                u12.box.Position = UDim2.new(0.5, 0, 0.5, 0)
                v69.Size = UDim2.new(1, 0, 0, 44)
                if v70 then
                    v70.Size = UDim2.new(0, 110, 1, 0)
                    v70.Position = UDim2.new(0, 12, 0, 0)
                end
                if u12.cooldownLbl then
                    u12.cooldownLbl.Size = UDim2.fromOffset(70, 24)
                    u12.cooldownLbl.Position = UDim2.new(1, -96, 0.5, 0)
                end
                if u12.resetBtn then
                    u12.resetBtn.Size = UDim2.fromOffset(76, 24)
                    u12.resetBtn.Position = UDim2.new(1, -12, 0.5, 0)
                end
                if u12.currentLbl then
                    u12.currentLbl.Size = UDim2.new(1, -24, 0, 24)
                    u12.currentLbl.Position = UDim2.new(0, 12, 0, 52)
                end
                if u12.grid then
                    u12.grid.Size = UDim2.new(1, -24, 0, v83)
                    u12.grid.Position = UDim2.new(0, 12, 0, 84)
                end
                u12.gridLayout.FillDirectionMaxCells = 4
                if u12.closeBtn then
                    u12.closeBtn.Size = UDim2.fromOffset(78, 26)
                    u12.closeBtn.Position = UDim2.new(1, -90, 1, -38)
                end
                if u12.statusLbl then
                    u12.statusLbl.Size = UDim2.new(1, -114, 0, 22)
                    u12.statusLbl.Position = UDim2.new(0, 12, 1, -34)
                end
                u68()
            else
                u12.box.Size = UDim2.fromOffset(760, 400)
                u12.box.Position = UDim2.new(0.5, 0, 0.5, 0)
                v69.Size = UDim2.new(1, 0, 0, 46)
                if v70 then
                    v70.Size = UDim2.new(0, 140, 1, 0)
                    v70.Position = UDim2.new(0, 14, 0, 0)
                end
                if u12.cooldownLbl then
                    u12.cooldownLbl.Size = UDim2.fromOffset(84, 28)
                    u12.cooldownLbl.Position = UDim2.new(1, -116, 0.5, 0)
                end
                if u12.resetBtn then
                    u12.resetBtn.Size = UDim2.fromOffset(88, 28)
                    u12.resetBtn.Position = UDim2.new(1, -14, 0.5, 0)
                end
                if u12.currentLbl then
                    u12.currentLbl.Size = UDim2.new(1, -28, 0, 26)
                    u12.currentLbl.Position = UDim2.new(0, 14, 0, 58)
                end
                if u12.grid then
                    u12.grid.Size = UDim2.new(1, -28, 0, 248)
                    u12.grid.Position = UDim2.new(0, 14, 0, 94)
                end
                u12.gridLayout.FillDirectionMaxCells = 6
                if u12.closeBtn then
                    u12.closeBtn.Size = UDim2.fromOffset(86, 28)
                    u12.closeBtn.Position = UDim2.new(1, -100, 1, -38)
                end
                if u12.statusLbl then
                    u12.statusLbl.Size = UDim2.new(1, -130, 0, 24)
                    u12.statusLbl.Position = UDim2.new(0, 14, 1, -36)
                end
                u68()
            end
        else
            return
        end
    else
        return
    end
end
local function u85() --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u43
    --]]
    if u12.gui then
        u12.gui.Enabled = not u12.gui.Enabled
        if u12.gui.Enabled then
            if u12.statusLbl then
                u12.statusLbl.Text = ""
                u12.statusLbl.TextColor3 = Color3.fromRGB(75, 75, 75)
            end
            u43()
        end
    end
end
local function u112(p86, p87) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u13
        [4] = u6
        [5] = u43
    --]]
    local u88 = Instance.new("TextButton")
    u88.Name = "JobSlot" .. p87
    u88.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    u88.BorderSizePixel = 1
    u88.BorderColor3 = Color3.fromRGB(190, 190, 190)
    u88.Text = ""
    u88.AutoButtonColor = true
    u88.Parent = p86
    local v89 = Instance.new("TextLabel")
    v89.Name = "NameLabel"
    v89.BackgroundTransparency = 1
    v89.Size = UDim2.new(1, -12, 0, 34)
    v89.Position = UDim2.new(0, 6, 0, 10)
    v89.Text = ""
    v89.TextColor3 = Color3.fromRGB(45, 45, 45)
    v89.TextWrapped = true
    v89.TextScaled = true
    v89.Font = Enum.Font.GothamBold
    v89.Parent = u88
    local v90 = Instance.new("TextLabel")
    v90.Name = "StateLabel"
    v90.BackgroundTransparency = 1
    v90.Size = UDim2.new(1, -10, 0, 20)
    v90.Position = UDim2.new(0, 5, 1, -26)
    v90.Text = ""
    v90.TextColor3 = Color3.fromRGB(90, 90, 90)
    v90.TextScaled = true
    v90.Font = Enum.Font.Gotham
    v90.Parent = u88
    u88.Activated:Connect(function() --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u5
            [3] = u12
            [4] = u13
            [5] = u6
            [6] = u43
        --]]
        local u91 = u88:GetAttribute("JobId")
        if type(u91) == "string" and u91 ~= "" then
            local u92 = u5:WaitForChild("ChangeJobRequest", 10)
            if u92 and u92:IsA("RemoteFunction") then
                local v93, v94 = pcall(function() --[[ Line: 203 ]]
                    --[[
                    Upvalues:
                        [1] = u92
                        [2] = u91
                    --]]
                    return u92:InvokeServer(u91)
                end)
                if v93 and type(v94) == "table" then
                    if v94.unlockedJobs then
                        u13.unlockedJobs = v94.unlockedJobs
                    end
                    if v94.jobId and v94.jobId ~= "" then
                        u13.jobId = v94.jobId
                    end
                    if v94.jobSwapCooldownUntil ~= nil then
                        local v95 = u13
                        local v96 = v94.jobSwapCooldownUntil
                        local v97 = tonumber(v96)
                        local v98
                        if v97 then
                            local v99 = math.floor(v97)
                            v98 = v99 < 0 and 0 or v99
                        else
                            v98 = 0
                        end
                        v95.jobSwapCooldownUntil = v98
                    end
                    if v94.ok then
                        local v100 = v94.reason == "already_equipped" and "\236\157\180\235\175\184 \236\130\172\236\154\169 \236\164\145\236\157\184 \236\167\129\236\151\133\236\157\180\236\149\188." or "\236\167\129\236\151\133\236\157\180 \235\179\128\234\178\189\235\144\144\236\150\180."
                        local v101 = Color3.fromRGB(60, 140, 75)
                        if u12.statusLbl then
                            u12.statusLbl.Text = v100 or ""
                            u12.statusLbl.TextColor3 = v101 or Color3.fromRGB(75, 75, 75)
                        end
                    else
                        local v102 = v94.reason or "failed"
                        local v103 = tostring(v102)
                        local v104 = v103 == "locked" and "\237\149\180\234\184\136\235\144\152\236\167\128 \236\149\138\236\157\128 \236\167\129\236\151\133\236\157\180\236\149\188." or (v103 == "rate_limited" and "\235\132\136\235\172\180 \235\185\160\235\165\180\234\178\140 \235\136\132\235\165\180\234\179\160 \236\158\136\236\150\180." or (v103 == "cooldown_active" and "\236\167\129\236\151\133 \235\179\128\234\178\189 \235\140\128\234\184\176\236\139\156\234\176\132\236\157\180 \235\130\168\236\149\132 \236\158\136\236\150\180." or "\236\167\129\236\151\133 \235\179\128\234\178\189\236\151\144 \236\139\164\237\140\168\237\150\136\236\150\180."))
                        local v105 = Color3.fromRGB(220, 80, 80)
                        if u12.statusLbl then
                            u12.statusLbl.Text = v104 or ""
                            u12.statusLbl.TextColor3 = v105 or Color3.fromRGB(75, 75, 75)
                        end
                    end
                    if u12.currentLbl then
                        local v106 = u12.currentLbl
                        local v107 = u6[u13.jobId] and u6[u13.jobId].displayName or "\236\180\136\235\179\180\236\158\144"
                        v106.Text = "\237\152\132\236\158\172 \236\167\129\236\151\133: " .. tostring(v107)
                    end
                    u43()
                    for v108 = 1, #u12.slots do
                        local v109 = u12.slots[v108]
                        if v109 and v109.refresh then
                            v109.refresh()
                        end
                    end
                    return
                else
                    local v110 = Color3.fromRGB(220, 80, 80)
                    if u12.statusLbl then
                        u12.statusLbl.Text = "\236\167\129\236\151\133 \235\179\128\234\178\189 \236\154\148\236\178\173\236\151\144 \236\139\164\237\140\168\237\150\136\236\150\180."
                        u12.statusLbl.TextColor3 = v110 or Color3.fromRGB(75, 75, 75)
                    end
                end
            else
                local v111 = Color3.fromRGB(220, 80, 80)
                if u12.statusLbl then
                    u12.statusLbl.Text = "\236\167\129\236\151\133 \235\179\128\234\178\189 \235\166\172\235\170\168\237\138\184\234\176\128 \236\149\132\236\167\129 \236\164\128\235\185\132\235\144\152\236\167\128 \236\149\138\236\149\152\236\150\180."
                    u12.statusLbl.TextColor3 = v111 or Color3.fromRGB(75, 75, 75)
                end
            end
        else
            return
        end
    end)
    return {
        ["button"] = u88,
        ["nameLbl"] = v89,
        ["stateLbl"] = v90,
        ["jobId"] = "",
        ["refresh"] = nil
    }
end
local function u137() --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u13
        [4] = u43
        [5] = u11
        [6] = u68
        [7] = u112
        [8] = u84
    --]]
    if not (u12.gui and u12.gui.Parent) then
        local u113 = u7:FindFirstChild("JobGui")
        if not u113 then
            u113 = Instance.new("ScreenGui")
            u113.Name = "JobGui"
            u113.ResetOnSpawn = false
            u113.IgnoreGuiInset = true
            u113.Enabled = false
            u113.Parent = u7
        end
        u12.gui = u113
        if not u113:FindFirstChild("Dim") then
            local v114 = Instance.new("Frame")
            v114.Name = "Dim"
            v114.Size = UDim2.new(1, 0, 1, 0)
            v114.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            v114.BackgroundTransparency = 0.35
            v114.BorderSizePixel = 0
            v114.Parent = u113
        end
        local v115 = u113:FindFirstChild("JobBox")
        if not v115 then
            v115 = Instance.new("Frame")
            v115.Name = "JobBox"
            v115.Size = UDim2.new(0, 760, 0, 400)
            v115.AnchorPoint = Vector2.new(0.5, 0.5)
            v115.Position = UDim2.new(0.5, 0, 0.5, 0)
            v115.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
            v115.BorderSizePixel = 1
            v115.BorderColor3 = Color3.fromRGB(170, 170, 170)
            v115.Parent = u113
        end
        u12.box = v115
        local v116 = v115:FindFirstChild("Header")
        if not v116 then
            v116 = Instance.new("Frame")
            v116.Name = "Header"
            v116.Size = UDim2.new(1, 0, 0, 46)
            v116.BackgroundColor3 = Color3.fromRGB(185, 185, 185)
            v116.BorderSizePixel = 0
            v116.Parent = v115
        end
        if not v116:FindFirstChild("Title") then
            local v117 = Instance.new("TextLabel")
            v117.Name = "Title"
            v117.Size = UDim2.new(0, 140, 1, 0)
            v117.Position = UDim2.new(0, 14, 0, 0)
            v117.BackgroundTransparency = 1
            v117.Text = "\236\167\129\236\151\133"
            v117.TextColor3 = Color3.fromRGB(40, 40, 40)
            v117.TextScaled = true
            v117.Font = Enum.Font.GothamBold
            v117.TextXAlignment = Enum.TextXAlignment.Left
            v117.Parent = v116
        end
        local v118 = v116:FindFirstChild("CooldownLabel")
        if not v118 then
            v118 = Instance.new("TextLabel")
            v118.Name = "CooldownLabel"
            v118.Size = UDim2.new(0, 84, 0, 28)
            v118.AnchorPoint = Vector2.new(1, 0.5)
            v118.Position = UDim2.new(1, -116, 0.5, 0)
            v118.BackgroundTransparency = 1
            v118.Text = "00:00"
            v118.TextColor3 = Color3.fromRGB(55, 55, 55)
            v118.TextScaled = true
            v118.Font = Enum.Font.GothamBold
            v118.TextXAlignment = Enum.TextXAlignment.Right
            v118.Parent = v116
        end
        u12.cooldownLbl = v118
        local v119 = v116:FindFirstChild("ResetBtn")
        if not v119 then
            v119 = Instance.new("TextButton")
            v119.Name = "ResetBtn"
            v119.Size = UDim2.new(0, 88, 0, 28)
            v119.AnchorPoint = Vector2.new(1, 0.5)
            v119.Position = UDim2.new(1, -14, 0.5, 0)
            v119.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            v119.BorderSizePixel = 1
            v119.BorderColor3 = Color3.fromRGB(150, 150, 150)
            v119.Text = "\236\180\136\234\184\176\237\153\148"
            v119.TextColor3 = Color3.fromRGB(40, 40, 40)
            v119.TextScaled = true
            v119.Font = Enum.Font.GothamBold
            v119.Parent = v116
            v119.Activated:Connect(function() --[[ Line: 326 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u12
                    [3] = u43
                    [4] = u11
                --]]
                local v120 = 0
                local v121 = u13.jobSwapCooldownUntil
                local v122 = tonumber(v121)
                local v123
                if v122 then
                    local v124 = math.floor(v122)
                    v123 = v124 < 0 and 0 or v124
                else
                    v123 = 0
                end
                local v125, v126 = pcall(function() --[[ Line: 48 ]]
                    return workspace:GetServerTimeNow()
                end)
                if not v125 then
                    v126 = os.clock()
                end
                local v127 = v123 - math.floor(v126)
                if math.max(v120, v127) <= 0 then
                    local v128 = Color3.fromRGB(220, 80, 80)
                    if u12.statusLbl then
                        u12.statusLbl.Text = "\236\180\136\234\184\176\237\153\148\237\149\160 \236\167\129\236\151\133 \235\179\128\234\178\189 \235\140\128\234\184\176\236\139\156\234\176\132\236\157\180 \236\151\134\236\150\180."
                        u12.statusLbl.TextColor3 = v128 or Color3.fromRGB(75, 75, 75)
                    end
                    u43()
                    return
                else
                    u11:FireServer({
                        ["action"] = "purchaseProduct",
                        ["productKey"] = "jobSwapReset"
                    })
                    local v129 = Color3.fromRGB(85, 85, 85)
                    if u12.statusLbl then
                        u12.statusLbl.Text = "\234\178\176\236\160\156 \236\176\189\236\157\132 \236\151\180\234\179\160 \236\158\136\236\150\180."
                        u12.statusLbl.TextColor3 = v129 or Color3.fromRGB(75, 75, 75)
                    end
                end
            end)
        end
        u12.resetBtn = v119
        local v130 = v115:FindFirstChild("CurrentJob")
        if not v130 then
            v130 = Instance.new("TextLabel")
            v130.Name = "CurrentJob"
            v130.Size = UDim2.new(1, -28, 0, 26)
            v130.Position = UDim2.new(0, 14, 0, 58)
            v130.BackgroundTransparency = 1
            v130.TextColor3 = Color3.fromRGB(45, 45, 45)
            v130.TextScaled = true
            v130.Font = Enum.Font.GothamBold
            v130.TextXAlignment = Enum.TextXAlignment.Left
            v130.Parent = v115
        end
        u12.currentLbl = v130
        local v131 = v115:FindFirstChild("Grid")
        if not v131 then
            v131 = Instance.new("Frame")
            v131.Name = "Grid"
            v131.Size = UDim2.new(1, -28, 0, 248)
            v131.Position = UDim2.new(0, 14, 0, 94)
            v131.BackgroundTransparency = 1
            v131.Parent = v115
        end
        u12.grid = v131
        local v132 = v131:FindFirstChild("GridLayout")
        if not v132 then
            v132 = Instance.new("UIGridLayout")
            v132.Name = "GridLayout"
            v132.FillDirectionMaxCells = 6
            v132.HorizontalAlignment = Enum.HorizontalAlignment.Left
            v132.VerticalAlignment = Enum.VerticalAlignment.Top
            v132.SortOrder = Enum.SortOrder.LayoutOrder
            v132.Parent = v131
            v131:GetPropertyChangedSignal("AbsoluteSize"):Connect(u68)
        end
        u12.gridLayout = v132
        local v133 = v115:FindFirstChild("CloseBtn")
        if not v133 then
            v133 = Instance.new("TextButton")
            v133.Name = "CloseBtn"
            v133.Size = UDim2.new(0, 86, 0, 28)
            v133.Position = UDim2.new(1, -100, 1, -38)
            v133.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            v133.BorderSizePixel = 1
            v133.BorderColor3 = Color3.fromRGB(150, 150, 150)
            v133.Text = "\235\139\171\234\184\176"
            v133.TextColor3 = Color3.fromRGB(40, 40, 40)
            v133.TextScaled = true
            v133.Font = Enum.Font.GothamBold
            v133.Parent = v115
            v133.Activated:Connect(function() --[[ Line: 391 ]]
                --[[
                Upvalues:
                    [1] = u113
                --]]
                u113.Enabled = false
            end)
        end
        u12.closeBtn = v133
        local v134 = v115:FindFirstChild("Status")
        if not v134 then
            v134 = Instance.new("TextLabel")
            v134.Name = "Status"
            v134.Size = UDim2.new(1, -130, 0, 24)
            v134.Position = UDim2.new(0, 14, 1, -36)
            v134.BackgroundTransparency = 1
            v134.Text = ""
            v134.TextScaled = true
            v134.Font = Enum.Font.Gotham
            v134.TextXAlignment = Enum.TextXAlignment.Left
            v134.Parent = v115
        end
        u12.statusLbl = v134
        for v135 = #u12.slots + 1, 12 do
            local v136 = u112(v131, v135)
            u12.slots[v135] = v136
        end
        u84()
        u43()
    end
end
local function u147() --[[ Line: 422 ]]
    --[[
    Upvalues:
        [1] = u137
        [2] = u12
        [3] = u6
        [4] = u13
        [5] = u25
        [6] = u68
        [7] = u43
    --]]
    u137()
    if u12.currentLbl then
        local v138 = u12.currentLbl
        local v139 = u6[u13.jobId] and u6[u13.jobId].displayName or "\236\180\136\235\179\180\236\158\144"
        v138.Text = "\237\152\132\236\158\172 \236\167\129\236\151\133: " .. tostring(v139)
    end
    local u140 = u25()
    for u141 = 1, 12 do
        local u142 = u12.slots[u141]
        local u143
        if u142 then
            u143 = u142.button
        else
            u143 = u142
        end
        if u142 and u143 then
            function u142.refresh() --[[ Line: 432 ]]
                --[[
                Upvalues:
                    [1] = u140
                    [2] = u141
                    [3] = u6
                    [4] = u143
                    [5] = u142
                    [6] = u13
                --]]
                local v144 = u140[u141]
                if v144 and u6[v144] then
                    local v145 = u6[v144]
                    u143:SetAttribute("JobId", v144)
                    u142.nameLbl.Text = v145.displayName or v144
                    local v146 = u13.jobId == v144
                    u142.stateLbl.Text = v146 and "\236\130\172\236\154\169 \236\164\145" or "\235\179\128\234\178\189"
                    u143.Active = true
                    u143.AutoButtonColor = true
                    u143.BackgroundColor3 = v146 and Color3.fromRGB(255, 241, 198) or Color3.fromRGB(255, 255, 255)
                    u143.BorderColor3 = v146 and Color3.fromRGB(204, 164, 76) or Color3.fromRGB(190, 190, 190)
                    u142.nameLbl.TextColor3 = Color3.fromRGB(45, 45, 45)
                    u142.stateLbl.TextColor3 = v146 and Color3.fromRGB(160, 110, 20) or Color3.fromRGB(90, 90, 90)
                else
                    u143:SetAttribute("JobId", "")
                    u142.nameLbl.Text = ""
                    u142.stateLbl.Text = ""
                    u143.Active = false
                    u143.AutoButtonColor = false
                    u143.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
                    u143.BorderColor3 = Color3.fromRGB(220, 220, 220)
                end
            end
            u142.refresh()
        end
    end
    u68()
    u43()
end
local function u152() --[[ Line: 465 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local v148 = {}
    local v149 = u8.find(u7, "MainHUD")
    if v149 then
        table.insert(v148, v149)
    end
    local v150 = u7:FindFirstChild("MainHUD")
    local v151 = u7:FindFirstChild("MainHUD_Mobile")
    if v150 and v150 ~= v149 then
        table.insert(v148, v150)
    end
    if v151 and v151 ~= v149 then
        table.insert(v148, v151)
    end
    return v148
end
local function u156() --[[ Line: 475 ]]
    --[[
    Upvalues:
        [1] = u152
        [2] = u14
        [3] = u85
    --]]
    local v153 = false
    for _, v155 in ipairs((u152())) do
        if v155 then
            local v155 = v155:FindFirstChild("BtnJob", true)
        end
        if v155 and v155:IsA("GuiButton") then
            v153 = true
            if not u14[v155] then
                u14[v155] = true
                v155.Activated:Connect(u85)
            end
        end
    end
    return v153
end
v9.OnClientEvent:Connect(function(p157) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u147
    --]]
    if p157 then
        local v158 = p157.jobId
        if type(v158) == "string" and p157.jobId ~= "" then
            u13.jobId = p157.jobId
        end
        local v159 = p157.unlockedJobs
        if type(v159) == "table" then
            u13.unlockedJobs = p157.unlockedJobs
        end
        if p157.jobSwapCooldownUntil ~= nil then
            local v160 = u13
            local v161 = p157.jobSwapCooldownUntil
            local v162 = tonumber(v161)
            local v163
            if v162 then
                local v164 = math.floor(v162)
                v163 = v164 < 0 and 0 or v164
            else
                v163 = 0
            end
            v160.jobSwapCooldownUntil = v163
        end
        u147()
    end
end)
v10.OnClientEvent:Connect(function(p165) --[[ Line: 498 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u147
    --]]
    if p165 then
        local v166 = p165.jobId
        local v167
        if type(v166) == "string" and p165.jobId ~= "" then
            u13.jobId = p165.jobId
            v167 = true
        else
            v167 = false
        end
        if p165.jobSwapCooldownUntil ~= nil then
            local v168 = u13
            local v169 = p165.jobSwapCooldownUntil
            local v170 = tonumber(v169)
            local v171
            if v170 then
                local v172 = math.floor(v170)
                v171 = v172 < 0 and 0 or v172
            else
                v171 = 0
            end
            v168.jobSwapCooldownUntil = v171
            v167 = true
        end
        if v167 then
            u147()
        end
    end
end)
u3.InputBegan:Connect(function(p173, p174) --[[ Line: 506 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
    --]]
    if not (p174 or u3:GetFocusedTextBox()) then
        if p173.KeyCode == Enum.KeyCode.Escape and (u12.gui and u12.gui.Enabled) then
            u12.gui.Enabled = false
        end
    end
end)
v4.RenderStepped:Connect(function(p175) --[[ Line: 511 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u43
    --]]
    u15 = u15 + p175
    if u15 >= 0.2 then
        u15 = 0
        if u12.gui and u12.gui.Parent then
            u43()
        end
    end
end);
(function() --[[ Name: bindViewportListener, Line 518 ]]
    --[[
    Upvalues:
        [1] = u84
    --]]
    local v176 = workspace.CurrentCamera
    if v176 then
        v176:GetPropertyChangedSignal("ViewportSize"):Connect(u84)
    else
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 524 ]]
            --[[
            Upvalues:
                [1] = u84
            --]]
            local v177 = workspace.CurrentCamera
            if v177 then
                v177:GetPropertyChangedSignal("ViewportSize"):Connect(u84)
                u84()
            end
        end)
    end
end)()
u137()
u147()
u156()
u7.DescendantAdded:Connect(function(p178) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u156
    --]]
    if p178.Name == "BtnJob" and p178:IsA("GuiButton") then
        task.defer(u156)
    elseif p178.Name == "MainHUD" or p178.Name == "MainHUD_Mobile" then
        task.defer(u156)
    end
end)
print("[JobUIController] initialized")