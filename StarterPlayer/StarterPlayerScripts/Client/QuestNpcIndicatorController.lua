local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Defs.NPCDefs)
local u5 = require(v2.Shared.Defs.QuestDefs)
local _ = v1.LocalPlayer
local u6 = {
    ["NPC_VillageElder"] = "village_elder",
    ["NPC_Warrior"] = "npc_warrior",
    ["NPC_Wizard"] = "npc_wizard",
    ["NPC_WeaponMerchant"] = "npc_weapon_merchant",
    ["NPC_Priest"] = "npc_priest",
    ["NPC_Soldier"] = "npc_soldier",
    ["NPC_Loner"] = "npc_loner",
    ["NPC_Archer"] = "npc_archer",
    ["NPC_Swordsman"] = "npc_swordsman",
    ["NPC_Pirate"] = "npc_pirate",
    ["NPC_ItemSeller"] = "npc_item_seller",
    ["NPC_Notice"] = "npc_notice",
    ["NPC_MagicSword"] = "npc_dark_sword_chief"
}
local u7 = Color3.fromRGB(255, 225, 60)
local u8 = Color3.fromRGB(150, 150, 150)
local u9 = 1
local u10 = {}
local u11 = {}
local function u19(p12) --[[ Line: 51 ]]
    local v13 = workspace:FindFirstChild("FantasyVillage")
    local v14 = v13 and v13:FindFirstChild("NPCs") or nil
    local v15 = v14 and v14:FindFirstChild(p12) or nil
    if not v15 then
        return nil
    end
    for _, v16 in ipairs({
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "Torso"
    }) do
        local v17 = v15:FindFirstChild(v16, true)
        if v17 and v17:IsA("BasePart") then
            return v17
        end
    end
    if v15:IsA("Model") and v15.PrimaryPart then
        return v15.PrimaryPart
    end
    for _, v18 in ipairs(v15:GetDescendants()) do
        if v18:IsA("BasePart") then
            return v18
        end
    end
    return nil
end
local function u27(p20) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v21 = u10
    local v22 = type(v21) == "table" and u10[p20] or nil
    if type(v22) ~= "table" then
        return nil
    end
    local v23 = {
        ["accepted"] = v22.accepted == true,
        ["completed"] = v22.completed == true
    }
    local v24 = v22.progress
    local v25 = tonumber(v24) or 0
    local v26 = math.floor(v25)
    v23.progress = v26 < 0 and 0 or v26
    return v23
end
local function u46(p28) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u27
        [3] = u9
    --]]
    local v29 = u5[p28]
    if v29 then
        local v30
        if v29 then
            v30 = v29.prerequisite
        else
            v30 = v29
        end
        local v31 = type(v30) == "string" and (v29.prerequisite or "") or ""
        local v32
        if v31 == "" then
            v32 = true
        else
            local v33 = u27(v31)
            v32 = v33 and v33.completed == true and true or false
        end
        if v32 then
            local v34 = v29.minLevel
            local v35 = tonumber(v34) or 0
            local v36 = math.floor(v35)
            if u9 < (v36 < 1 and 1 or v36) then
                return "unavailable_level", v29
            else
                local v37 = u27(p28)
                if v37 and v37.accepted then
                    if v37.completed then
                        return "completed", v29
                    else
                        local v38
                        if v29 and (v37 and (v37.accepted and not v37.completed)) then
                            local v39 = v29.condition
                            if v39 then
                                v39 = v29.condition.required
                            end
                            local v40 = tonumber(v39) or 0
                            local v41 = math.floor(v40)
                            local v42 = v41 < 0 and 0 or v41
                            local v43 = v37.progress
                            local v44 = tonumber(v43) or 0
                            local v45 = math.floor(v44)
                            v38 = v42 <= (v45 < 0 and 0 or v45)
                        else
                            v38 = false
                        end
                        if v38 then
                            return "ready_to_turn_in", v29
                        else
                            return "in_progress", v29
                        end
                    end
                else
                    return "offer", v29
                end
            end
        else
            return "unavailable_prerequisite", v29
        end
    else
        return "invalid", nil
    end
end
local function u53(p47) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u46
    --]]
    local v48 = u4[p47]
    if not v48 then
        return nil, "invalid_npc", nil
    end
    for _, v49 in ipairs(v48.quests or {}) do
        local v50, v51 = u46(v49)
        if v51 and v50 ~= "completed" then
            local v52 = v51.turnInNpcId or v51.giverNpcId
            if v51.giverNpcId == p47 or v52 == p47 then
                return v49, v50, v51
            end
        end
    end
    return nil, "all_completed", nil
end
local function u59(p54) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u11
    --]]
    local v55 = u19(p54)
    if not v55 then
        return nil, nil
    end
    local v56 = u11[p54]
    if v56 and v56.Parent ~= v55 then
        v56:Destroy()
        u11[p54] = nil
        v56 = nil
    end
    if v56 and v56.Parent then
        return v56, v56:FindFirstChild("StateLabel")
    end
    local v57 = Instance.new("BillboardGui")
    v57.Name = "QuestStateIndicator"
    v57.Size = UDim2.new(0, 60, 0, 60)
    v57.StudsOffset = Vector3.new(0, 4.2, 0)
    v57.AlwaysOnTop = true
    v57.MaxDistance = 60
    v57.Parent = v55
    local v58 = Instance.new("TextLabel")
    v58.Name = "StateLabel"
    v58.BackgroundTransparency = 1
    v58.Size = UDim2.new(1, 0, 1, 0)
    v58.Font = Enum.Font.GothamBlack
    v58.TextScaled = true
    v58.TextStrokeTransparency = 0.2
    v58.TextStrokeColor3 = Color3.new(0, 0, 0)
    v58.Text = ""
    v58.Parent = v57
    u11[p54] = v57
    return v57, v58
end
local function u79(p60, p61) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u53
        [3] = u7
        [4] = u59
        [5] = u8
    --]]
    local v62 = u4[p61]
    if v62 and v62.role == "quest_giver" then
        local _, v63 = u53(p61)
        if v63 == "offer" then
            local v64 = u7
            local v65, v66 = u59(p60)
            if v65 then
                if v66 then
                    v66.Text = "!"
                    v66.TextColor3 = v64 or u7
                    v65.Enabled = true
                end
            end
        elseif v63 == "unavailable_level" or v63 == "unavailable_prerequisite" then
            local v67 = u8
            local v68, v69 = u59(p60)
            if v68 then
                if v69 then
                    v69.Text = "!"
                    v69.TextColor3 = v67 or u7
                    v68.Enabled = true
                end
            end
        elseif v63 == "in_progress" then
            local v70 = u8
            local v71, v72 = u59(p60)
            if v71 then
                if v72 then
                    v72.Text = "?"
                    v72.TextColor3 = v70 or u7
                    v71.Enabled = true
                end
            end
        elseif v63 == "ready_to_turn_in" then
            local v73 = u7
            local v74, v75 = u59(p60)
            if v74 then
                if v75 then
                    v75.Text = "!"
                    v75.TextColor3 = v73 or u7
                    v74.Enabled = true
                end
            end
        else
            local v76 = u7
            local v77, v78 = u59(p60)
            if v77 then
                if not v78 then
                    return
                end
                v78.Text = ""
                v78.TextColor3 = v76 or u7
                v77.Enabled = false
            end
        end
    end
end
local function u83() --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u79
    --]]
    for v80, v81 in pairs(u6) do
        local v82 = u4[v81]
        if v82 and v82.role == "quest_giver" then
            u79(v80, v81)
        end
    end
end
local function u89(p84) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u83
        [2] = u11
    --]]
    if p84 then
        p84.ChildAdded:Connect(function() --[[ Line: 183 ]]
            --[[
            Upvalues:
                [1] = u83
            --]]
            task.defer(u83)
        end)
        p84.ChildRemoved:Connect(function(p85) --[[ Line: 186 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u83
            --]]
            local v86 = u11[p85.Name]
            if v86 then
                v86:Destroy()
                u11[p85.Name] = nil
            end
            task.defer(u83)
        end)
        p84.DescendantAdded:Connect(function(p87) --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u83
            --]]
            if p87:IsA("BasePart") then
                task.defer(u83)
            end
        end)
        p84.DescendantRemoving:Connect(function(p88) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u83
            --]]
            if p88:IsA("BasePart") then
                task.defer(u83)
            end
        end)
    end
end
local function v91(p90) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u83
    --]]
    u10 = type(p90) == "table" and p90 and p90 or {}
    u83()
end
local function v98(p92) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u83
    --]]
    if type(p92) == "table" then
        local v93 = p92.level
        if tonumber(v93) then
            local v94 = p92.level
            local v95 = tonumber(v94) or 0
            local v96 = math.floor(v95)
            u9 = v96 < 1 and 1 or v96
        end
        local v97 = p92.questProgress
        if type(v97) == "table" then
            u10 = p92.questProgress
        end
        u83()
    end
end
v3.QuestSync.OnClientEvent:Connect(v91)
v3.DataSync.OnClientEvent:Connect(v98)
v3.HudSync.OnClientEvent:Connect(function(p99) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u83
    --]]
    if type(p99) == "table" then
        local v100 = p99.level
        if tonumber(v100) then
            local v101 = p99.level
            local v102 = tonumber(v101) or 0
            local v103 = math.floor(v102)
            u9 = v103 < 1 and 1 or v103
            u83()
        end
    end
end)
workspace.ChildAdded:Connect(function(p104) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u89
        [2] = u83
    --]]
    if p104.Name == "FantasyVillage" then
        task.defer(function() --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u89
                [2] = u83
            --]]
            local v105 = workspace:FindFirstChild("FantasyVillage")
            local v106 = v105 and v105:FindFirstChild("NPCs") or nil
            if v106 then
                u89(v106)
            end
            u83()
        end)
    end
end)
workspace.ChildRemoved:Connect(function(p107) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p107.Name == "FantasyVillage" then
        for v108, v109 in pairs(u11) do
            if v109 then
                v109:Destroy()
            end
            u11[v108] = nil
        end
    end
end)
local v110 = workspace:FindFirstChild("FantasyVillage")
local v111 = v110 and v110:FindFirstChild("NPCs") or nil
if v111 then
    u89(v111)
end
task.defer(u83)
print("[QuestNpcIndicatorController] initialized")