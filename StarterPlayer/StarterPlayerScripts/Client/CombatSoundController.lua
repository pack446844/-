local u1 = game:GetService("SoundService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.Shared.Net
local u4 = require(v2.Shared.Defs.SoundDefs)
local u5 = {}
local u6 = {}
local function u9(p7) --[[ Line: 11 ]]
    if type(p7) == "string" then
        local v8 = p7:gsub("%s+", "")
        if v8 == "" then
            return nil
        elseif v8:match("^rbxassetid://") or (v8:match("^rbxasset://") or v8:match("^https?://")) then
            return v8
        elseif v8:match("^%d+$") then
            return "rbxassetid://" .. v8
        else
            return v8
        end
    else
        return nil
    end
end
local function u16(p10, p11, p12) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u1
    --]]
    local v13 = u5[p10]
    if not v13 or v13.Parent ~= u1 then
        v13 = Instance.new("Sound")
        v13.Name = "CombatSfx_" .. tostring(p10):gsub("[^%w_]+", "_")
        v13.RollOffMaxDistance = 80
        v13.RollOffMinDistance = 5
        v13.Parent = u1
        u5[p10] = v13
    end
    v13.SoundId = p12
    local v14 = p11.volume
    v13.Volume = tonumber(v14) or 0.8
    local v15 = p11.playbackSpeed
    v13.PlaybackSpeed = tonumber(v15) or 1
    v13.Looped = false
    return v13
end
v3:WaitForChild("CombatSfx").OnClientEvent:Connect(function(p17) --[[ Name: playPayload, Line 53 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u6
        [4] = u16
    --]]
    local v18, v19
    if type(p17) == "table" then
        local v20 = p17.kind
        if v20 == "basic_attack" then
            v18 = u4.basicAttack
            v19 = "basic_attack"
        elseif v20 == "monster_hit" then
            v18 = u4.monsterHit
            v19 = "monster_hit"
        elseif v20 == "skill_cast" then
            local v21 = p17.skillId or ""
            local v22 = tostring(v21)
            v18 = u4.skills and u4.skills[v22] or u4.skillDefault
            v19 = "skill_cast_" .. ((v22 == "" or not v22) and "default" or v22)
        else
            v18 = nil
            v19 = nil
        end
    else
        v18 = nil
        v19 = nil
    end
    if type(v18) == "table" and v19 then
        local v23 = u9(v18.soundId)
        if v23 then
            local v24 = v18.reuseKey or v19
            local v25 = tostring(v24)
            local v26 = os.clock()
            local v27 = v18.minReplayGap
            local v28 = tonumber(v27) or 0
            local v29 = math.max(0, v28)
            if v29 <= 0 or v26 - (u6[v25] or 0) >= v29 then
                u6[v25] = v26
                local u30 = u16(v19, v18, v23)
                pcall(function() --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                    --]]
                    u30.TimePosition = 0
                    u30:Play()
                end)
            end
        else
            return
        end
    else
        return
    end
end)
print("[CombatSoundController] initialized")