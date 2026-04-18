local v1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = v4.Shared.Net
local u6 = require(v4.Shared.Util.PlatformGui)
local u7 = require(v4.Shared.Defs.ItemDefs)
local u8 = require(v4.Shared.Defs.SpecialSkillDefs)
local u9 = v1.LocalPlayer
local u10 = u9:WaitForChild("PlayerGui")
local v11 = v5:WaitForChild("DataSync")
local v12 = v5:WaitForChild("InventorySync")
local u13 = v5:WaitForChild("SpecialSkillRequest")
local v14 = v5:WaitForChild("SpecialSkillCastAck")
local u15 = {
    ["weapon"] = "",
    ["armor"] = "",
    ["accessory"] = "",
    ["shoes"] = ""
}
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = {
    ["skillId"] = "",
    ["startedAt"] = 0,
    ["duration"] = 0
}
local function u30() --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v22 = u9
    local v23 = tonumber(v22:GetAttribute("JailedRemainingSeconds")) or 0
    local v24 = math.floor(v23)
    local v25 = math.max(0, v24)
    if v25 > 0 then
        return v25
    end
    local v26 = u9
    local v27 = tonumber(v26:GetAttribute("JailedUntil")) or 0
    local v28 = math.floor(v27)
    local v29 = math.max(0, v28) - os.time()
    return math.max(0, v29)
end
local function u36(p31) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    if type(p31) == "table" then
        local v32 = p31.equipment
        if type(v32) == "table" then
            for _, v33 in ipairs({
                "weapon",
                "armor",
                "accessory",
                "shoes"
            }) do
                local v34 = u15
                local v35 = p31.equipment[v33]
                v34[v33] = type(v35) == "string" and v35 and v35 or ""
            end
            return
        end
    end
end
local function u45() --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u18
        [4] = u15
        [5] = u7
        [6] = u8
    --]]
    u16 = nil
    u17 = nil
    u18 = nil
    local v37 = u15.accessory
    local v38 = u7[type(v37) == "string" and v37 and v37 or ""]
    local v39
    if v38 then
        v39 = v38.specialEffect
    else
        v39 = v38
    end
    local v40
    if type(v39) == "table" then
        v40 = v38.specialEffect or nil
    else
        v40 = nil
    end
    if v40 then
        local v41 = v40.type or ""
        if tostring(v41) == "active_skill" then
            local v42 = v40.id
            local v43 = type(v42) == "string" and v42 and v42 or ""
            local v44 = u8[v43]
            if v44 then
                u16 = v43
                u17 = v44
                u18 = v38
            end
        end
    end
end
local function u50(p46, p47) --[[ Line: 85 ]]
    local v48 = p46:FindFirstChild(p47)
    if v48 and v48:IsA("TextLabel") then
        return v48
    end
    if v48 then
        v48:Destroy()
    end
    local v49 = Instance.new("TextLabel")
    v49.Name = p47
    v49.BackgroundTransparency = 1
    v49.BorderSizePixel = 0
    v49.TextColor3 = Color3.fromRGB(255, 255, 255)
    v49.Parent = p46
    return v49
end
local function u55(p51) --[[ Line: 97 ]]
    local v52 = p51:FindFirstChild("SpecialSkillShade")
    if v52 and v52:IsA("Frame") then
        return v52
    end
    if v52 then
        v52:Destroy()
    end
    local v53 = Instance.new("Frame")
    v53.Name = "SpecialSkillShade"
    v53.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v53.BackgroundTransparency = 0.45
    v53.BorderSizePixel = 0
    v53.Size = UDim2.fromScale(1, 1)
    v53.ZIndex = 20
    v53.Parent = p51
    local v54 = Instance.new("UICorner")
    v54.CornerRadius = UDim.new(0, 10)
    v54.Parent = v53
    return v53
end
local function u63(p56) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u55
        [3] = u50
    --]]
    if not p56 then
        return nil, nil, nil, nil
    end
    p56.Text = ""
    local v57 = nil
    for _, v58 in ipairs(p56:GetChildren()) do
        if v58:IsA("TextLabel") then
            local v59 = v58.Name or ""
            if v59 == "UnlockLevel" or v59 == "LockIcon" then
                v58.Visible = false
            elseif v59 == "KeyLabel" then
                v58.Visible = not u6.useMobileGui()
                v58.Text = u6.useMobileGui() and "" or "[T]"
            elseif v59 ~= "SpecialSkillName" then
                if v59 ~= "SpecialSkillCooldown" then
                    if not v57 then
                        v57 = v58
                    end
                end
            end
        end
    end
    local v60 = u55(p56)
    local v61 = u50(p56, "SpecialSkillName")
    v61.AnchorPoint = Vector2.new(0.5, 1)
    v61.Position = UDim2.fromScale(0.5, 0.93)
    v61.Size = UDim2.fromScale(0.84, 0.26)
    v61.ZIndex = 21
    v61.Font = Enum.Font.GothamBold
    v61.TextScaled = true
    v61.TextWrapped = true
    local v62 = u50(p56, "SpecialSkillCooldown")
    v62.AnchorPoint = Vector2.new(0.5, 0.5)
    v62.Position = UDim2.fromScale(0.5, 0.4)
    v62.Size = UDim2.fromScale(0.8, 0.38)
    v62.ZIndex = 22
    v62.Font = Enum.Font.GothamBold
    v62.TextScaled = true
    v62.TextWrapped = true
    return v60, v61, v62, v57
end
local function u78() --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u63
        [3] = u16
        [4] = u21
        [5] = u17
        [6] = u9
        [7] = u30
    --]]
    local v64 = u19
    if v64 then
        local v65, v66, v67, v68 = u63(v64)
        if v65 then
            local v69
            if u16 and u21.skillId == u16 then
                local v70 = u21.startedAt
                local v71 = tonumber(v70) or 0
                local v72 = u21.duration
                local v73 = tonumber(v72) or 0
                if v73 <= 0 or v71 <= 0 then
                    v69 = 0
                else
                    local v74 = v71 + v73 - workspace:GetServerTimeNow()
                    v69 = math.max(0, v74)
                end
            else
                v69 = 0
            end
            local v75 = u17 ~= nil and v69 <= 0 and (u9:GetAttribute("IsJailed") ~= true and u30() <= 0)
            if v75 then
                local v76 = u9.Character
                if v76 then
                    v76 = v76:FindFirstChildOfClass("Humanoid")
                end
                v75 = v76 and v76.Health > 0 and true or false
            end
            v64.AutoButtonColor = v75
            v64.Active = true
            v64.BackgroundColor3 = v75 and Color3.fromRGB(60, 60, 72) or Color3.fromRGB(34, 34, 42)
            if u17 then
                v66.Visible = false
                if v68 then
                    v68.Visible = true
                end
            else
                v66.Visible = true
                v66.Text = "\237\138\185\236\136\152 \236\138\164\237\130\172"
                v66.TextColor3 = Color3.fromRGB(180, 180, 180)
                if v68 then
                    v68.Visible = false
                end
            end
            if u17 and v69 > 0 then
                local v77 = math.ceil(v69)
                v67.Text = tostring(v77)
                v67.TextColor3 = Color3.fromRGB(255, 255, 255)
                v65.Visible = true
                return
            elseif u17 then
                v67.Text = ""
                v65.Visible = not v75
            else
                v67.Text = "\236\158\165\236\176\169 \237\149\132\236\154\148"
                v67.TextColor3 = Color3.fromRGB(220, 220, 220)
                v65.Visible = true
            end
        else
            return
        end
    else
        return
    end
end
local function u88() --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u16
        [4] = u21
        [5] = u9
        [6] = u30
        [7] = u6
        [8] = u13
    --]]
    if not u2:GetFocusedTextBox() then
        if u17 then
            local v79
            if u16 and u21.skillId == u16 then
                local v80 = u21.startedAt
                local v81 = tonumber(v80) or 0
                local v82 = u21.duration
                local v83 = tonumber(v82) or 0
                if v83 <= 0 or v81 <= 0 then
                    v79 = 0
                else
                    local v84 = v81 + v83 - workspace:GetServerTimeNow()
                    v79 = math.max(0, v84)
                end
            else
                v79 = 0
            end
            if v79 <= 0 and (u9:GetAttribute("IsJailed") ~= true and u30() <= 0) then
                local v85 = u9.Character
                if v85 then
                    v85 = v85:FindFirstChildOfClass("Humanoid")
                end
                if v85 and v85.Health > 0 and true or false then
                    if u6.useMobileGui() then
                        u13:FireServer(nil)
                    else
                        local v86 = u13
                        local v87 = u9:GetMouse()
                        v86:FireServer(v87 and (v87.Hit and v87.Hit.Position) or nil)
                    end
                end
            end
        end
    end
end
local function u90() --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u19
        [4] = u78
        [5] = u20
        [6] = u88
    --]]
    local v89 = u6.find(u10, "MainHUD") or (u10:FindFirstChild("MainHUD") or u10:FindFirstChild("MainHUD_Mobile"))
    if v89 then
        v89 = v89:FindFirstChild("SkillBar")
    end
    if v89 then
        v89 = v89:FindFirstChild("SpecialSkillSlot")
    end
    if not (v89 and v89:IsA("GuiButton")) then
        v89 = nil
    end
    if v89 == u19 then
        u78()
    else
        if u20 then
            u20:Disconnect()
            u20 = nil
        end
        u19 = v89
        if u19 then
            u20 = u19.Activated:Connect(u88)
        end
        u78()
    end
end
v11.OnClientEvent:Connect(function(p91) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u45
        [3] = u78
    --]]
    if p91 and p91.equipment then
        u36(p91)
        u45()
        u78()
    end
end)
v12.OnClientEvent:Connect(function(p92) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u45
        [3] = u78
    --]]
    if p92 and p92.equipment then
        u36(p92)
        u45()
        u78()
    end
end)
v14.OnClientEvent:Connect(function(p93) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u78
    --]]
    if type(p93) == "table" then
        local v94 = u21
        local v95 = p93.skillId
        v94.skillId = type(v95) == "string" and v95 and v95 or ""
        local v96 = u21
        local v97 = p93.startedAt
        v96.startedAt = tonumber(v97) or 0
        local v98 = u21
        local v99 = p93.cooldown
        v98.duration = tonumber(v99) or 0
        u78()
    end
end)
u2.InputBegan:Connect(function(p100, p101) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u88
    --]]
    if not (p101 or u2:GetFocusedTextBox()) then
        if p100.KeyCode == Enum.KeyCode.T and not u6.useMobileGui() then
            u88()
        end
    end
end)
v3.RenderStepped:Connect(function() --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u78
    --]]
    u78()
end)
task.defer(function() --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u19
        [4] = u78
        [5] = u20
        [6] = u88
    --]]
    u6.waitUntilReady(5)
    local v102 = u6.find(u10, "MainHUD") or (u10:FindFirstChild("MainHUD") or u10:FindFirstChild("MainHUD_Mobile"))
    if v102 then
        v102 = v102:FindFirstChild("SkillBar")
    end
    if v102 then
        v102 = v102:FindFirstChild("SpecialSkillSlot")
    end
    if not (v102 and v102:IsA("GuiButton")) then
        v102 = nil
    end
    if v102 == u19 then
        u78()
    else
        if u20 then
            u20:Disconnect()
            u20 = nil
        end
        u19 = v102
        if u19 then
            u20 = u19.Activated:Connect(u88)
        end
        u78()
    end
end)
u6.modeChanged:Connect(function() --[[ Line: 256 ]]
    --[[
    Upvalues:
        [1] = u90
    --]]
    task.defer(u90)
end)
u10.ChildAdded:Connect(function(p103) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u90
    --]]
    if p103 and (p103.Name == "MainHUD" or p103.Name == "MainHUD_Mobile") then
        task.defer(u90)
    end
end)
u10.DescendantAdded:Connect(function(p104) --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u90
    --]]
    if p104 and (p104.Name == "SpecialSkillSlot" and p104:IsA("GuiButton")) then
        task.defer(u90)
    end
end)
u9.CharacterAdded:Connect(function() --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u90
    --]]
    task.delay(0.2, u90)
end)
print("[SpecialSkillController] initialized")