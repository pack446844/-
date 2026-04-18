local v1 = {}
local u2 = {}
local u3 = {
    ["minInterval"] = 0,
    ["burstCapacity"] = 1,
    ["refillTime"] = 0,
    ["violationWindow"] = 3,
    ["maxViolations"] = 5,
    ["blockDuration"] = 2
}
local u4 = {
    ["attack"] = {
        ["minInterval"] = 0.4,
        ["burstCapacity"] = 2,
        ["refillTime"] = 0.9,
        ["violationWindow"] = 4,
        ["maxViolations"] = 8,
        ["blockDuration"] = 2
    },
    ["skill_request"] = {
        ["minInterval"] = 0.2,
        ["burstCapacity"] = 3,
        ["refillTime"] = 0.9,
        ["violationWindow"] = 4,
        ["maxViolations"] = 10,
        ["blockDuration"] = 2
    },
    ["party_invite"] = {
        ["minInterval"] = 0.35,
        ["burstCapacity"] = 2,
        ["refillTime"] = 2.2,
        ["violationWindow"] = 6,
        ["maxViolations"] = 6,
        ["blockDuration"] = 4
    },
    ["party_accept"] = {
        ["minInterval"] = 0.2,
        ["burstCapacity"] = 2,
        ["refillTime"] = 0.6,
        ["violationWindow"] = 4,
        ["maxViolations"] = 8,
        ["blockDuration"] = 2
    },
    ["party_decline"] = {
        ["minInterval"] = 0.2,
        ["burstCapacity"] = 2,
        ["refillTime"] = 0.6,
        ["violationWindow"] = 4,
        ["maxViolations"] = 8,
        ["blockDuration"] = 2
    },
    ["equip_weapon"] = {
        ["minInterval"] = 0.08,
        ["burstCapacity"] = 6,
        ["refillTime"] = 0.9,
        ["violationWindow"] = 3,
        ["maxViolations"] = 12,
        ["blockDuration"] = 1
    },
    ["weapon_shop_buy"] = {
        ["minInterval"] = 0.15,
        ["burstCapacity"] = 4,
        ["refillTime"] = 1.2,
        ["violationWindow"] = 4,
        ["maxViolations"] = 10,
        ["blockDuration"] = 2
    },
    ["npc_interact"] = {
        ["minInterval"] = 0.12,
        ["burstCapacity"] = 4,
        ["refillTime"] = 0.8,
        ["violationWindow"] = 4,
        ["maxViolations"] = 10,
        ["blockDuration"] = 2
    },
    ["npc_action"] = {
        ["minInterval"] = 0.08,
        ["burstCapacity"] = 5,
        ["refillTime"] = 0.8,
        ["violationWindow"] = 4,
        ["maxViolations"] = 12,
        ["blockDuration"] = 2
    },
    ["change_job"] = {
        ["minInterval"] = 0.15,
        ["burstCapacity"] = 2,
        ["refillTime"] = 0.8,
        ["violationWindow"] = 4,
        ["maxViolations"] = 8,
        ["blockDuration"] = 2
    },
    ["set_name"] = {
        ["minInterval"] = 0.4,
        ["burstCapacity"] = 1,
        ["refillTime"] = 1.6,
        ["violationWindow"] = 8,
        ["maxViolations"] = 4,
        ["blockDuration"] = 6
    }
}
local function u13(p5) --[[ Line: 52 ]]
    local v6 = {}
    local v7
    if p5 then
        v7 = p5.lastAllowedAt
    else
        v7 = p5
    end
    v6.lastAllowedAt = tonumber(v7) or 0
    local v8
    if p5 then
        v8 = p5.lastRefillAt
    else
        v8 = p5
    end
    v6.lastRefillAt = tonumber(v8) or 0
    local v9
    if p5 then
        local v10 = p5.tokens
        v9 = tonumber(v10) or nil
    else
        v9 = nil
    end
    v6.tokens = v9
    local v11
    if p5 then
        v11 = p5.violationCount
    else
        v11 = p5
    end
    v6.violationCount = tonumber(v11) or 0
    local v12
    if p5 then
        v12 = p5.lastViolationAt
    else
        v12 = p5
    end
    v6.lastViolationAt = tonumber(v12) or 0
    if p5 then
        p5 = p5.blockedUntil
    end
    v6.blockedUntil = tonumber(p5) or 0
    return v6
end
local function u21(p14, p15) --[[ Line: 63 ]]
    local v16 = {}
    if type(p14) == "table" then
        for v17, v18 in pairs(p14) do
            v16[v17] = v18
        end
    elseif p14 ~= nil then
        v16.minInterval = tonumber(p14) or 0
    end
    if type(p15) == "table" then
        for v19, v20 in pairs(p15) do
            v16[v19] = v20
        end
    end
    return v16
end
local function u67(p22, p23, p24) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v25 = {}
    for v26, v27 in pairs(u3) do
        v25[v26] = v27
    end
    local v28 = u4[p22]
    if type(v28) == "table" then
        for v29, v30 in pairs(v28) do
            v25[v29] = v30
        end
    end
    local v31
    if p24 then
        local v32 = p23.familyMinInterval
        v31 = tonumber(v32) or nil
    else
        local v33 = p23.minInterval
        v31 = tonumber(v33) or nil
    end
    if v31 then
        local v34 = v25.minInterval
        local v35 = tonumber(v34) or 0
        v25.minInterval = math.max(v35, v31)
    end
    if not p24 then
        local v36 = p23.burstCapacity
        if tonumber(v36) then
            local v37 = p23.burstCapacity
            local v38 = math.floor(v37)
            v25.burstCapacity = math.max(1, v38)
        end
        local v39 = p23.refillTime
        if tonumber(v39) then
            local v40 = p23.refillTime
            local v41 = tonumber(v40)
            v25.refillTime = math.max(0, v41)
        end
        local v42 = p23.violationWindow
        if tonumber(v42) then
            local v43 = p23.violationWindow
            local v44 = tonumber(v43)
            v25.violationWindow = math.max(0, v44)
        end
        local v45 = p23.maxViolations
        if tonumber(v45) then
            local v46 = p23.maxViolations
            local v47 = math.floor(v46)
            v25.maxViolations = math.max(1, v47)
        end
        local v48 = p23.blockDuration
        if tonumber(v48) then
            local v49 = p23.blockDuration
            local v50 = tonumber(v49)
            v25.blockDuration = math.max(0, v50)
        end
    end
    local v51 = v25.burstCapacity
    local v52 = tonumber(v51) or 1
    local v53 = math.floor(v52)
    v25.burstCapacity = math.max(1, v53)
    local v54 = v25.refillTime
    if tonumber(v54) and v25.refillTime <= 0 then
        local v55 = v25.minInterval
        v25.refillTime = tonumber(v55) or 0
    end
    local v56 = v25.refillTime
    local v57 = tonumber(v56) or 0
    v25.refillTime = math.max(0, v57)
    local v58 = v25.minInterval
    local v59 = tonumber(v58) or 0
    v25.minInterval = math.max(0, v59)
    local v60 = v25.violationWindow
    local v61 = tonumber(v60) or 0
    v25.violationWindow = math.max(0, v61)
    local v62 = v25.maxViolations
    local v63 = tonumber(v62) or 1
    local v64 = math.floor(v63)
    v25.maxViolations = math.max(1, v64)
    local v65 = v25.blockDuration
    local v66 = tonumber(v65) or 0
    v25.blockDuration = math.max(0, v66)
    return v25
end
local function u74(p68, p69, p70, p71) --[[ Line: 131 ]]
    if p70 < p68.blockedUntil then
        local v72 = p68.blockedUntil - p70
        return false, "blocked", math.max(0, v72), p68
    end
    if p69.violationWindow <= 0 or p70 - p68.lastViolationAt > p69.violationWindow then
        p68.violationCount = 1
    else
        p68.violationCount = p68.violationCount + 1
    end
    p68.lastViolationAt = p70
    if p68.violationCount < p69.maxViolations or p69.blockDuration <= 0 then
        return false, "rate_limited", math.max(0, p71 or 0), p68
    end
    p68.blockedUntil = p70 + p69.blockDuration
    local v73 = p69.blockDuration
    return false, "blocked", math.max(p71 or 0, v73), p68
end
local function u101(p75, p76, p77) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u74
    --]]
    local v78 = u13(p75)
    local v79 = v78.blockedUntil - p77
    if v79 > 0 then
        return false, "blocked", v79, v78
    end
    if p76.minInterval <= 0 and p76.refillTime <= 0 then
        v78.lastAllowedAt = p77
        v78.lastRefillAt = p77
        v78.tokens = nil
        return true, "ok", 0, v78
    end
    local v80 = p76.burstCapacity
    local v81 = tonumber(v80) or 1
    local v82 = math.max(1, v81)
    if v78.tokens == nil then
        v78.tokens = v82
    end
    if v78.lastRefillAt <= 0 then
        v78.lastRefillAt = p77
    end
    local v83 = p76.refillTime
    local v84 = tonumber(v83) or 0
    if v84 > 0 and v78.tokens < v82 then
        local v85 = p77 - v78.lastRefillAt
        local v86 = math.max(0, v85)
        if v86 > 0 then
            local v87 = v82 / v84
            local v88 = v78.tokens + v86 * v87
            v78.tokens = math.min(v82, v88)
            v78.lastRefillAt = p77
        end
    else
        local v89 = v78.tokens
        v78.tokens = math.min(v82, v89)
        v78.lastRefillAt = p77
    end
    local v90 = p77 - v78.lastAllowedAt
    if v78.lastAllowedAt > 0 and v90 < p76.minInterval then
        return u74(v78, p76, p77, p76.minInterval - v90)
    end
    if v78.tokens >= 1 then
        v78.tokens = v78.tokens - 1
        v78.lastAllowedAt = p77
        return true, "ok", 0, v78
    end
    local v91 = u74
    local v92 = v78.tokens
    local v93
    if v92 == nil or v92 >= 1 then
        v93 = 0
    else
        local v94 = p76.refillTime
        local v95 = tonumber(v94) or 0
        local v96 = p76.burstCapacity
        local v97 = tonumber(v96) or 1
        local v98 = math.max(1, v97)
        if v95 <= 0 then
            v93 = 0
        else
            local v99 = v98 / v95
            if v99 <= 0 then
                v93 = 0
            else
                local v100 = (1 - v92) / v99
                v93 = math.max(0, v100)
            end
        end
    end
    return v91(v78, p76, p77, v93)
end
function v1.check(p102, p103, p104, p105) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u67
        [3] = u2
        [4] = u101
    --]]
    local v106
    if typeof(p102) == "Instance" and p102:IsA("Player") then
        v106 = p102.UserId
    else
        v106 = nil
    end
    local v107 = tostring(p103 or "")
    if not v106 or v107 == "" then
        return false, "invalid_request", 0
    end
    local v108 = u21(p104, p105)
    local v109 = u67(v107, v108, false)
    local v110 = v108.familyAction ~= nil or (type(v107) ~= "string" or v107 == "" or v107:match("^(party_invite)_%d+$"))
    if not v110 then
        v110 = v107:match("^(.-)_%d+$")
        if not v110 or v110 == "" then
            v110 = nil
        end
    end
    if type(v110) ~= "string" or (v110 == "" or not v110) then
        v110 = nil
    end
    local v111
    if v110 and v110 ~= v107 then
        v111 = u67(v110, v108, true)
    else
        v111 = nil
    end
    local v112 = os.clock()
    local v113 = u2[v106]
    if not v113 then
        v113 = {}
        u2[v106] = v113
    end
    local v114 = v113[v107]
    if not v114 then
        v114 = {
            ["lastAllowedAt"] = 0,
            ["lastRefillAt"] = 0,
            ["tokens"] = nil,
            ["violationCount"] = 0,
            ["lastViolationAt"] = 0,
            ["blockedUntil"] = 0
        }
        v113[v107] = v114
    end
    local v115, v116, v117, v118 = u101(v114, v109, v112)
    if not v115 then
        local v119 = u2[v106]
        if not v119 then
            v119 = {}
            u2[v106] = v119
        end
        local v120 = v119[v107]
        if not v120 then
            v120 = {
                ["lastAllowedAt"] = 0,
                ["lastRefillAt"] = 0,
                ["tokens"] = nil,
                ["violationCount"] = 0,
                ["lastViolationAt"] = 0,
                ["blockedUntil"] = 0
            }
            v119[v107] = v120
        end
        for v121, v122 in pairs(v118) do
            v120[v121] = v122
        end
        return false, v116, v117
    end
    if v111 then
        local v123 = u2[v106]
        if not v123 then
            v123 = {}
            u2[v106] = v123
        end
        local v124 = v123[v110]
        if not v124 then
            v124 = {
                ["lastAllowedAt"] = 0,
                ["lastRefillAt"] = 0,
                ["tokens"] = nil,
                ["violationCount"] = 0,
                ["lastViolationAt"] = 0,
                ["blockedUntil"] = 0
            }
            v123[v110] = v124
        end
        local v125, v126, v127, v128 = u101(v124, v111, v112)
        if not v125 then
            local v129 = u2[v106]
            if not v129 then
                v129 = {}
                u2[v106] = v129
            end
            local v130 = v129[v110]
            if not v130 then
                v130 = {
                    ["lastAllowedAt"] = 0,
                    ["lastRefillAt"] = 0,
                    ["tokens"] = nil,
                    ["violationCount"] = 0,
                    ["lastViolationAt"] = 0,
                    ["blockedUntil"] = 0
                }
                v129[v110] = v130
            end
            for v131, v132 in pairs(v128) do
                v130[v131] = v132
            end
            return false, v126, v127
        end
        local v133 = u2[v106]
        if not v133 then
            v133 = {}
            u2[v106] = v133
        end
        local v134 = v133[v110]
        if not v134 then
            v134 = {
                ["lastAllowedAt"] = 0,
                ["lastRefillAt"] = 0,
                ["tokens"] = nil,
                ["violationCount"] = 0,
                ["lastViolationAt"] = 0,
                ["blockedUntil"] = 0
            }
            v133[v110] = v134
        end
        for v135, v136 in pairs(v128) do
            v134[v135] = v136
        end
    end
    local v137 = u2[v106]
    if not v137 then
        v137 = {}
        u2[v106] = v137
    end
    local v138 = v137[v107]
    if not v138 then
        v138 = {
            ["lastAllowedAt"] = 0,
            ["lastRefillAt"] = 0,
            ["tokens"] = nil,
            ["violationCount"] = 0,
            ["lastViolationAt"] = 0,
            ["blockedUntil"] = 0
        }
        v137[v107] = v138
    end
    for v139, v140 in pairs(v118) do
        v138[v139] = v140
    end
    return true, "ok", 0
end
function v1.cleanup(p141) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v142
    if typeof(p141) == "Instance" and p141:IsA("Player") then
        v142 = p141.UserId
    else
        v142 = nil
    end
    if v142 then
        u2[v142] = nil
    end
end
return v1