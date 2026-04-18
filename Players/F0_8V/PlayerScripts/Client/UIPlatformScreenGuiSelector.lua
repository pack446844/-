local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("Workspace")
local u4 = game:GetService("RunService")
local u5 = require(v2.Shared.Util.PlatformGui)
local v6 = v1.LocalPlayer
local u7 = v6:WaitForChild("PlayerGui")
local u8 = {
    "MainHUD",
    "DialogueGui",
    "KillLogGui",
    "InventoryGui",
    "QuestGui",
    "NameInputGui",
    "GuildGui",
    "GuildListGui",
    "RobuxShopGui",
    "CommissionBoardGui",
    "CodexGui"
}
local u9 = {}
local u10 = nil
local u11 = {
    ["MainHUD"] = true,
    ["DialogueGui"] = false,
    ["KillLogGui"] = true,
    ["InventoryGui"] = false,
    ["QuestGui"] = false,
    ["NameInputGui"] = false,
    ["GuildGui"] = false,
    ["GuildListGui"] = false,
    ["RobuxShopGui"] = true,
    ["CommissionBoardGui"] = false,
    ["CodexGui"] = false
}
local u12 = false
for _, v13 in ipairs(u8) do
    u9[v13] = true
end
local function u23(p14) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    local v15 = tonumber(p14) or 3
    local v16 = os.clock()
    local v17 = nil
    local v18 = 0
    while os.clock() - v16 < v15 do
        local v19 = u3.CurrentCamera
        local v20 = v19 and v19.ViewportSize or Vector2.new(0, 0)
        local v21
        if v20.X > 0 then
            v21 = v20.Y > 0
        else
            v21 = false
        end
        if v21 then
            local v22 = u5.computeMode()
            if v22 == v17 then
                v18 = v18 + 1
            else
                v17 = v22
                v18 = 1
            end
            if v18 >= 2 then
                return v22
            end
        end
        u4.RenderStepped:Wait()
    end
    return u5.computeMode()
end
local function u26() --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u23
        [3] = u5
        [4] = u8
        [5] = u7
        [6] = u11
    --]]
    if not u12 then
        u12 = true
        task.defer(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u23
                [3] = u5
                [4] = u8
                [5] = u7
                [6] = u11
            --]]
            u12 = false
            local v24 = u23(2.5)
            u5.setResolvedMode(v24)
            local v25 = u8
            u5.bootstrapIntents(u7, v25, u11)
            u5.applyAll(u7, v25, u11)
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end)
    end
end
local function u33(u27) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u7
        [4] = u11
    --]]
    if u9[u27] == true then
        u5.bootstrapIntents(u7, { u27 }, u11)
        u5.applyPair(u7, u27, u11)
    end
    if u27 == "MainHUD" then
        u5.setEnabled(u7, "MainHUD", true, u11)
        u5.applyPair(u7, "MainHUD", u11)
    end
    task.delay(0.1, function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u5
            [4] = u7
            [5] = u11
        --]]
        local v28 = u27
        if u9[v28] == true then
            u5.bootstrapIntents(u7, { v28 }, u11)
            u5.applyPair(u7, v28, u11)
        end
        if u27 == "MainHUD" then
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end
    end)
    task.delay(0.35, function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u5
            [4] = u7
            [5] = u11
        --]]
        local v29 = u27
        if u9[v29] == true then
            u5.bootstrapIntents(u7, { v29 }, u11)
            u5.applyPair(u7, v29, u11)
        end
        if u27 == "MainHUD" then
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end
    end)
    task.delay(0.8, function() --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u5
            [4] = u7
            [5] = u11
        --]]
        local v30 = u27
        if u9[v30] == true then
            u5.bootstrapIntents(u7, { v30 }, u11)
            u5.applyPair(u7, v30, u11)
        end
        if u27 == "MainHUD" then
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end
    end)
    task.delay(1.6, function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u5
            [4] = u7
            [5] = u11
        --]]
        local v31 = u27
        if u9[v31] == true then
            u5.bootstrapIntents(u7, { v31 }, u11)
            u5.applyPair(u7, v31, u11)
        end
        if u27 == "MainHUD" then
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end
    end)
    task.delay(3, function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u9
            [3] = u5
            [4] = u7
            [5] = u11
        --]]
        local v32 = u27
        if u9[v32] == true then
            u5.bootstrapIntents(u7, { v32 }, u11)
            u5.applyPair(u7, v32, u11)
        end
        if u27 == "MainHUD" then
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end
    end)
end
local function u42() --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u23
        [3] = u5
        [4] = u8
        [5] = u7
        [6] = u11
        [7] = u26
    --]]
    if not u12 then
        u12 = true
        task.defer(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u23
                [3] = u5
                [4] = u8
                [5] = u7
                [6] = u11
            --]]
            u12 = false
            local v34 = u23(2.5)
            u5.setResolvedMode(v34)
            local v35 = u8
            u5.bootstrapIntents(u7, v35, u11)
            u5.applyAll(u7, v35, u11)
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
        end)
    end
    task.delay(0.1, u26)
    task.delay(0.35, u26)
    task.delay(0.8, u26)
    task.delay(1.6, u26)
    task.delay(3, u26)
    local v36 = tonumber(8) or 8
    local u37 = math.max(1, v36)
    task.spawn(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u5
            [3] = u7
            [4] = u11
        --]]
        local v38 = os.clock() + u37
        while os.clock() < v38 do
            u5.setEnabled(u7, "MainHUD", true, u11)
            u5.applyPair(u7, "MainHUD", u11)
            local v39 = u5.getResolvedMode() or u5.computeMode()
            local v40 = u7:FindFirstChild("MainHUD")
            local v41 = u7:FindFirstChild("MainHUD_Mobile")
            if v39 == "mobile" then
                if v41 and v41.Enabled == true then
                    break
                end
            elseif v40 and v40.Enabled == true then
                break
            end
            task.wait(0.25)
        end
    end)
end
local v43 = u5.computeMode()
u5.setResolvedMode(v43)
u5.bootstrapIntents(u7, u8, u11)
u5.applyAll(u7, u8, u11)
u5.setEnabled(u7, "MainHUD", true, u11)
u5.applyPair(u7, "MainHUD", u11)
local v44 = tonumber(8) or 8
local u45 = math.max(1, v44)
task.spawn(function() --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u5
        [3] = u7
        [4] = u11
    --]]
    local v46 = os.clock() + u45
    while os.clock() < v46 do
        u5.setEnabled(u7, "MainHUD", true, u11)
        u5.applyPair(u7, "MainHUD", u11)
        local v47 = u5.getResolvedMode() or u5.computeMode()
        local v48 = u7:FindFirstChild("MainHUD")
        local v49 = u7:FindFirstChild("MainHUD_Mobile")
        if v47 == "mobile" then
            if v49 and v49.Enabled == true then
                break
            end
        elseif v48 and v48.Enabled == true then
            break
        end
        task.wait(0.25)
    end
end)
local v50 = u3.CurrentCamera
if u10 then
    u10:Disconnect()
    u10 = nil
end
if v50 then
    u10 = v50:GetPropertyChangedSignal("ViewportSize"):Connect(u26)
end
u42()
u3:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u26
        [4] = u42
    --]]
    local v51 = u3.CurrentCamera
    if u10 then
        u10:Disconnect()
        u10 = nil
    end
    if v51 then
        u10 = v51:GetPropertyChangedSignal("ViewportSize"):Connect(u26)
    end
    u42()
end)
u7.ChildAdded:Connect(function(p52) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u33
        [3] = u12
        [4] = u23
        [5] = u5
        [6] = u8
        [7] = u7
        [8] = u11
    --]]
    local v53 = p52 and p52.Name or ""
    if type(v53) == "string" and v53 ~= "" then
        if not u9[v53] then
            if #v53 > 7 and v53:sub(-7) == "_Mobile" then
                v53 = v53:sub(1, -8)
                if not u9[v53] then
                    v53 = nil
                end
            else
                v53 = nil
            end
        end
    else
        v53 = nil
    end
    if v53 then
        u33(v53)
        if not u12 then
            u12 = true
            task.defer(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u23
                    [3] = u5
                    [4] = u8
                    [5] = u7
                    [6] = u11
                --]]
                u12 = false
                local v54 = u23(2.5)
                u5.setResolvedMode(v54)
                local v55 = u8
                u5.bootstrapIntents(u7, v55, u11)
                u5.applyAll(u7, v55, u11)
                u5.setEnabled(u7, "MainHUD", true, u11)
                u5.applyPair(u7, "MainHUD", u11)
            end)
        end
    else
        return
    end
end)
u7.ChildRemoved:Connect(function(p56) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u33
        [3] = u12
        [4] = u23
        [5] = u5
        [6] = u8
        [7] = u7
        [8] = u11
    --]]
    local v57 = p56 and p56.Name or ""
    if type(v57) == "string" and v57 ~= "" then
        if not u9[v57] then
            if #v57 > 7 and v57:sub(-7) == "_Mobile" then
                v57 = v57:sub(1, -8)
                if not u9[v57] then
                    v57 = nil
                end
            else
                v57 = nil
            end
        end
    else
        v57 = nil
    end
    if v57 then
        u33(v57)
        if not u12 then
            u12 = true
            task.defer(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u23
                    [3] = u5
                    [4] = u8
                    [5] = u7
                    [6] = u11
                --]]
                u12 = false
                local v58 = u23(2.5)
                u5.setResolvedMode(v58)
                local v59 = u8
                u5.bootstrapIntents(u7, v59, u11)
                u5.applyAll(u7, v59, u11)
                u5.setEnabled(u7, "MainHUD", true, u11)
                u5.applyPair(u7, "MainHUD", u11)
            end)
        end
    else
        return
    end
end)
v6.CharacterAdded:Connect(function() --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    u42()
end)