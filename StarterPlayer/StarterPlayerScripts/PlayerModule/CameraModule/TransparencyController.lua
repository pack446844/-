local u1 = game:GetService("VRService")
local u2 = {
    "BasePart",
    "Decal",
    "Beam",
    "ParticleEmitter",
    "Trail",
    "Fire",
    "Smoke",
    "Sparkles",
    "Explosion"
}
local u3 = require(script.Parent:WaitForChild("CameraUtils"))
local v4, v5 = pcall(function() --[[ Line: 27 ]]
    return UserSettings():IsUserFeatureEnabled("UserHideCharacterParticlesInFirstPerson")
end)
local u6 = v4 and v5
local u7 = {}
u7.__index = u7
function u7.new() --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    v9.transparencyDirty = false
    v9.enabled = false
    v9.lastTransparency = nil
    v9.descendantAddedConn = nil
    v9.descendantRemovingConn = nil
    v9.toolDescendantAddedConns = {}
    v9.toolDescendantRemovingConns = {}
    v9.cachedParts = {}
    return v9
end
function u7.HasToolAncestor(p10, p11) --[[ Line: 54 ]]
    if p11.Parent == nil then
        return false
    end
    local v12 = p11.Parent
    assert(v12, "")
    return p11.Parent:IsA("Tool") or p10:HasToolAncestor(p11.Parent)
end
function u7.IsValidPartToModify(p13, p14) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    if u6 then
        for _, v15 in u2 do
            if p14:IsA(v15) then
                return not p13:HasToolAncestor(p14)
            end
        end
    elseif p14:IsA("BasePart") or p14:IsA("Decal") then
        return not p13:HasToolAncestor(p14)
    end
    return false
end
function u7.CachePartsRecursive(p16, p17) --[[ Line: 76 ]]
    if p17 then
        if p16:IsValidPartToModify(p17) then
            p16.cachedParts[p17] = true
            p16.transparencyDirty = true
        end
        for _, v18 in pairs(p17:GetChildren()) do
            p16:CachePartsRecursive(v18)
        end
    end
end
function u7.TeardownTransparency(p19) --[[ Line: 88 ]]
    for v20, _ in pairs(p19.cachedParts) do
        v20.LocalTransparencyModifier = 0
    end
    p19.cachedParts = {}
    p19.transparencyDirty = true
    p19.lastTransparency = nil
    if p19.descendantAddedConn then
        p19.descendantAddedConn:disconnect()
        p19.descendantAddedConn = nil
    end
    if p19.descendantRemovingConn then
        p19.descendantRemovingConn:disconnect()
        p19.descendantRemovingConn = nil
    end
    for v21, v22 in pairs(p19.toolDescendantAddedConns) do
        v22:Disconnect()
        p19.toolDescendantAddedConns[v21] = nil
    end
    for v23, v24 in pairs(p19.toolDescendantRemovingConns) do
        v24:Disconnect()
        p19.toolDescendantRemovingConns[v23] = nil
    end
end
function u7.SetupTransparency(u25, u26) --[[ Line: 114 ]]
    u25:TeardownTransparency()
    if u25.descendantAddedConn then
        u25.descendantAddedConn:disconnect()
    end
    u25.descendantAddedConn = u26.DescendantAdded:Connect(function(p27) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u26
        --]]
        if u25:IsValidPartToModify(p27) then
            u25.cachedParts[p27] = true
            u25.transparencyDirty = true
        elseif p27:IsA("Tool") then
            if u25.toolDescendantAddedConns[p27] then
                u25.toolDescendantAddedConns[p27]:Disconnect()
            end
            u25.toolDescendantAddedConns[p27] = p27.DescendantAdded:Connect(function(p28) --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25.cachedParts[p28] = nil
                if p28:IsA("BasePart") or p28:IsA("Decal") then
                    p28.LocalTransparencyModifier = 0
                end
            end)
            if u25.toolDescendantRemovingConns[p27] then
                u25.toolDescendantRemovingConns[p27]:disconnect()
            end
            u25.toolDescendantRemovingConns[p27] = p27.DescendantRemoving:Connect(function(p29) --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u25
                --]]
                wait()
                if u26 and (p29 and (p29:IsDescendantOf(u26) and u25:IsValidPartToModify(p29))) then
                    u25.cachedParts[p29] = true
                    u25.transparencyDirty = true
                end
            end)
        end
    end)
    if u25.descendantRemovingConn then
        u25.descendantRemovingConn:disconnect()
    end
    u25.descendantRemovingConn = u26.DescendantRemoving:connect(function(p30) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        if u25.cachedParts[p30] then
            u25.cachedParts[p30] = nil
            p30.LocalTransparencyModifier = 0
        end
    end)
    u25:CachePartsRecursive(u26)
end
function u7.Enable(p31, p32) --[[ Line: 157 ]]
    if p31.enabled ~= p32 then
        p31.enabled = p32
    end
end
function u7.SetSubject(p33, p34) --[[ Line: 163 ]]
    local v35
    if p34 and p34:IsA("Humanoid") then
        v35 = p34.Parent
    else
        v35 = nil
    end
    if p34 and (p34:IsA("VehicleSeat") and p34.Occupant) then
        v35 = p34.Occupant.Parent
    end
    if v35 then
        p33:SetupTransparency(v35)
    else
        p33:TeardownTransparency()
    end
end
function u7.Update(p36, p37) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v38 = workspace.CurrentCamera
    if v38 and p36.enabled then
        local v39 = (v38.Focus.p - v38.CoordinateFrame.p).magnitude
        local v40 = v39 < 2 and 1 - (v39 - 0.5) / 1.5 or 0
        local v41 = v40 < 0.5 and 0 or v40
        if p36.lastTransparency and (v41 < 1 and p36.lastTransparency < 0.95) then
            local v42 = v41 - p36.lastTransparency
            local v43 = 2.8 * p37
            local v44 = -v43
            local v45 = math.clamp(v42, v44, v43)
            v41 = p36.lastTransparency + v45
        else
            p36.transparencyDirty = true
        end
        local v46 = u3.Round(v41, 2)
        local v47 = math.clamp(v46, 0, 1)
        if p36.transparencyDirty or p36.lastTransparency ~= v47 then
            for v48, _ in pairs(p36.cachedParts) do
                if u1.VREnabled and u1.AvatarGestures then
                    local v49 = {
                        [Enum.AccessoryType.Hat] = true,
                        [Enum.AccessoryType.Hair] = true,
                        [Enum.AccessoryType.Face] = true,
                        [Enum.AccessoryType.Eyebrow] = true,
                        [Enum.AccessoryType.Eyelash] = true
                    }
                    if v48.Parent:IsA("Accessory") and v49[v48.Parent.AccessoryType] or v48.Name == "Head" then
                        v48.LocalTransparencyModifier = v47
                    else
                        v48.LocalTransparencyModifier = 0
                    end
                else
                    v48.LocalTransparencyModifier = v47
                end
            end
            p36.transparencyDirty = false
            p36.lastTransparency = v47
        end
    end
end
return u7