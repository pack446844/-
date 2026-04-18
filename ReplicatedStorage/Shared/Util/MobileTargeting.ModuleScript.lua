local u1 = game:GetService("CollectionService")
local u2 = game:GetService("Workspace")
local u3 = require(script.Parent:WaitForChild("PlatformGui"))
local u4 = {}
local u5 = nil
local u6 = 0
local function u9(p7) --[[ Line: 21 ]]
    if not p7 then
        return nil
    end
    for _, v8 in ipairs(p7:GetDescendants()) do
        if v8:IsA("BasePart") then
            return v8
        end
    end
    return nil
end
local function u28(p10, p11, p12) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    if p10 then
        p10 = p10.Character
    end
    if p10 then
        p10 = p10:FindFirstChild("HumanoidRootPart")
    end
    if not (p10 and (p10:IsA("BasePart") and p10)) then
        p10 = nil
    end
    if not p10 then
        return {}
    end
    local v13 = tonumber(p11) or 90
    local v14 = math.max(4, v13)
    local v15 = {}
    for _, v16 in ipairs(u1:GetTagged("Monster_Active")) do
        if v16 ~= p12 and u4.isMonsterModel(v16) then
            local v17 = u4.getRoot(v16)
            if v17 then
                local v18 = (v17.Position - p10.Position).Magnitude
                if v18 <= v14 then
                    local v19 = #v15 + 1
                    local v20 = {
                        ["model"] = v16,
                        ["distance"] = v18
                    }
                    local v21 = v16.Name
                    v20.name = tostring(v21)
                    v15[v19] = v20
                end
            end
        end
    end
    table.sort(v15, function(p22, p23) --[[ Line: 51 ]]
        local v24 = p22.distance - p23.distance
        if math.abs(v24) > 0.01 then
            return p22.distance < p23.distance
        else
            return p22.name < p23.name
        end
    end)
    local v25 = {}
    for v26, v27 in ipairs(v15) do
        v25[v26] = v27.model
    end
    return v25
end
function u4.useMobileTargeting() --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.useMobileGui() == true
end
function u4.getAutoAcquireDistance() --[[ Line: 64 ]]
    return 90
end
function u4.getCycleDistance() --[[ Line: 68 ]]
    return 90
end
function u4.getBreakDistance() --[[ Line: 72 ]]
    return 120
end
function u4.getRoot(p29) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p29 then
        local v30 = p29:FindFirstChild("HumanoidRootPart")
        if v30 and v30:IsA("BasePart") then
            return v30
        elseif p29.PrimaryPart and p29.PrimaryPart:IsA("BasePart") then
            return p29.PrimaryPart
        else
            return u9(p29)
        end
    else
        return nil
    end
end
function u4.getAttachPart(p31) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p31 then
        local v32 = p31:GetAttribute("MonsterAttachPartName")
        if type(v32) == "string" and v32 ~= "" then
            local v33 = p31:FindFirstChild(v32, true)
            if v33 and v33:IsA("BasePart") then
                return v33
            end
        end
        local v34 = p31:FindFirstChild("Head")
        if v34 and v34:IsA("BasePart") then
            return v34
        else
            return u4.getRoot(p31)
        end
    else
        return nil
    end
end
function u4.isMonsterModel(p35) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    if not (p35 and (p35:IsA("Model") and p35:IsDescendantOf(u2))) then
        return false
    end
    if u1:HasTag(p35, "Monster_Active") ~= true then
        return false
    end
    local v36 = p35 and p35:FindFirstChildOfClass("Humanoid") or nil
    local v37
    if v36 == nil then
        v37 = false
    else
        v37 = v36.Health > 0
    end
    return v37
end
function u4.getTarget() --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    if not u4.isMonsterModel(u5) then
        u5 = nil
    end
    return u5
end
function u4.clearTarget() --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5 = nil
    u6 = 0
    return nil
end
function u4.setTarget(p38) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
    --]]
    if not u4.useMobileTargeting() then
        return nil
    end
    if not u4.isMonsterModel(p38) then
        return nil
    end
    u5 = p38
    u6 = 0
    return u5
end
function u4.getCycleCandidates(p39, p40, p41) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u28
    --]]
    return not u4.useMobileTargeting() and {} or u28(p39, p40 or 90, p41)
end
function u4.findNearestTarget(p42, p43, p44) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.getCycleCandidates(p42, p43 or 90, p44)[1]
end
function u4.ensureTarget(p45, p46) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
    --]]
    if not u4.useMobileTargeting() then
        return u4.clearTarget()
    end
    local v47 = u4.getTarget()
    if v47 then
        return v47
    end
    local v48 = os.clock()
    if v48 < u6 then
        return nil
    end
    u6 = v48 + 0.15
    local v49 = u4.findNearestTarget(p45, p46 or 90, nil)
    if not v49 then
        return nil
    end
    u5 = v49
    u6 = 0
    return u5
end
function u4.cycleTarget(p50, p51) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
    --]]
    if not u4.useMobileTargeting() then
        return u4.clearTarget()
    end
    local v52 = u4.getCycleCandidates(p50, p51 or 90, nil)
    if #v52 <= 0 then
        return u4.clearTarget()
    end
    local v53 = u4.getTarget()
    if not v53 then
        u5 = v52[1]
        u6 = 0
        return u5
    end
    for v54, v55 in ipairs(v52) do
        if v55 == v53 then
            u5 = v52[v54 % #v52 + 1]
            u6 = 0
            return u5
        end
    end
    u5 = v52[1]
    u6 = 0
    return u5
end
function u4.maintain(p56) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if u4.useMobileTargeting() then
        local v57 = u4.getTarget()
        if v57 then
            if p56 then
                p56 = p56.Character
            end
            if p56 then
                p56 = p56:FindFirstChild("HumanoidRootPart")
            end
            if not (p56 and (p56:IsA("BasePart") and p56)) then
                p56 = nil
            end
            local v58 = u4.getRoot(v57)
            local v59
            if v57 then
                v59 = v57:FindFirstChildOfClass("Humanoid") or nil
            else
                v59 = nil
            end
            if p56 and (v58 and (v59 and v59.Health > 0)) then
                if (v58.Position - p56.Position).Magnitude > 120 then
                    return u4.clearTarget()
                else
                    return v57
                end
            else
                return u4.clearTarget()
            end
        else
            return nil
        end
    else
        return u4.clearTarget()
    end
end
function u4.pickTargetFromScreenPosition() --[[ Line: 186 ]]
    return nil
end
return u4