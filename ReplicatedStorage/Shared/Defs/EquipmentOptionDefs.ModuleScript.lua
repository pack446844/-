local u1 = require(script.Parent:WaitForChild("ItemDefs"))
local u2 = {
    ["REROLL_TOKEN_COST"] = 17,
    ["OPTION_REQUEST_RATE"] = 0.15,
    ["GRADE_ORDER"] = {
        "common",
        "rare",
        "epic",
        "legendary"
    }
}
local v3 = {
    ["common"] = {
        ["weight"] = 65,
        ["color"] = Color3.fromRGB(90, 90, 90)
    },
    ["rare"] = {
        ["weight"] = 25,
        ["color"] = Color3.fromRGB(90, 160, 255)
    },
    ["epic"] = {
        ["weight"] = 8,
        ["color"] = Color3.fromRGB(190, 110, 255)
    },
    ["legendary"] = {
        ["weight"] = 2,
        ["color"] = Color3.fromRGB(255, 190, 70)
    }
}
u2.GRADES = v3
u2.OPTION_ORDER = {
    "attack_pct",
    "hp_pct",
    "boss_damage_pct",
    "gold_pct",
    "exp_pct"
}
local v4 = {}
local v5 = {
    ["displayName"] = "\234\179\181\234\178\169\235\160\165",
    ["suffix"] = "%",
    ["ranges"] = {
        ["common"] = { 2, 2 },
        ["rare"] = { 4, 4 },
        ["epic"] = { 7, 7 },
        ["legendary"] = { 12, 12 }
    }
}
v4.attack_pct = v5
local v6 = {
    ["displayName"] = "\236\181\156\235\140\128 HP",
    ["suffix"] = "%",
    ["ranges"] = {
        ["common"] = { 3, 3 },
        ["rare"] = { 6, 6 },
        ["epic"] = { 9, 9 },
        ["legendary"] = { 14, 14 }
    }
}
v4.hp_pct = v6
local v7 = {
    ["displayName"] = "\235\179\180\236\138\164 \236\182\148\234\176\128 \237\148\188\237\149\180",
    ["suffix"] = "%",
    ["ranges"] = {
        ["common"] = { 4, 4 },
        ["rare"] = { 7, 7 },
        ["epic"] = { 10, 10 },
        ["legendary"] = { 15, 15 }
    }
}
v4.boss_damage_pct = v7
local v8 = {
    ["displayName"] = "\234\179\168\235\147\156 \237\154\141\235\147\157",
    ["suffix"] = "%",
    ["ranges"] = {
        ["common"] = { 4, 4 },
        ["rare"] = { 7, 7 },
        ["epic"] = { 10, 10 },
        ["legendary"] = { 13, 13 }
    }
}
v4.gold_pct = v8
local v9 = {
    ["displayName"] = "\234\178\189\237\151\152\236\185\152 \237\154\141\235\147\157",
    ["suffix"] = "%",
    ["ranges"] = {
        ["common"] = { 4, 4 },
        ["rare"] = { 7, 7 },
        ["epic"] = { 10, 10 },
        ["legendary"] = { 13, 13 }
    }
}
v4.exp_pct = v9
u2.OPTIONS = v4
function u2.isEligibleItemId(p10) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v11 = type(p10) == "string" and u1[p10] or nil
    local v12
    if type(v11) == "table" then
        v12 = v11.category == "equipment"
    else
        v12 = false
    end
    return v12
end
function u2.isValidOptionId(p13) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v14 = type(p13) == "string" and p13 and p13 or ""
    return (v14 ~= "" and u2.OPTIONS[v14] or nil) ~= nil
end
function u2.isValidGradeId(p15) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v16 = type(p15) == "string" and p15 and p15 or ""
    return (v16 ~= "" and u2.GRADES[v16] or nil) ~= nil
end
function u2.getGradeColor(p17) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v18 = type(p17) == "string" and p17 and p17 or ""
    local v19 = v18 ~= "" and u2.GRADES[v18] or nil
    return v19 and v19.color or Color3.fromRGB(255, 255, 255)
end
function u2.getValueRange(p20, p21) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v22 = type(p20) == "string" and p20 and p20 or ""
    local v23
    if v22 == "" then
        v23 = nil
    else
        v23 = u2.OPTIONS[v22] or nil
    end
    local v24
    if v23 then
        local v25 = v23.ranges
        if type(v25) == "table" then
            v24 = v23.ranges or nil
        else
            v24 = nil
        end
    else
        v24 = nil
    end
    local v26 = v24 and v24[p21] or nil
    local v27
    if type(v26) == "table" then
        v27 = v26[1]
    else
        v27 = false
    end
    local v28 = tonumber(v27)
    local v29
    if v28 then
        local v30 = math.floor(v28)
        local v31 = v30 < 0 and 0 or v30
        v29 = v31 > 999999 and 999999 or v31
    else
        v29 = nil
    end
    local v32
    if type(v26) == "table" then
        v32 = v26[2]
    else
        v32 = false
    end
    local v33 = tonumber(v32)
    local v34
    if v33 then
        local v35 = math.floor(v33)
        local v36 = v35 < 0 and 0 or v35
        v34 = v36 > 999999 and 999999 or v36
    else
        v34 = nil
    end
    if not (v29 and v34) then
        return nil, nil
    end
    if v34 < v29 then
        v34 = v29
    end
    return v29, v34
end
function u2.normalizeEntry(p37) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if type(p37) ~= "table" then
        return nil
    end
    local v38 = p37.optionId
    local v39 = type(v38) == "string" and v38 and v38 or ""
    local v40 = p37.grade
    local v41 = type(v40) == "string" and v40 and v40 or ""
    local v42 = p37.value
    local v43 = tonumber(v42)
    local v44
    if v43 then
        local v45 = math.floor(v43)
        local v46 = v45 < 0 and 0 or v45
        v44 = v46 > 999999 and 999999 or v46
    else
        v44 = nil
    end
    local v47 = type(v39) == "string" and v39 and v39 or ""
    local v48
    if v47 == "" then
        v48 = nil
    else
        v48 = u2.OPTIONS[v47] or nil
    end
    if v48 then
        local v49 = type(v41) == "string" and v41 and v41 or ""
        local v50
        if v49 == "" then
            v50 = nil
        else
            v50 = u2.GRADES[v49] or nil
        end
        if v50 and (v44 and v44 > 0) then
            local v52, v52 = u2.getValueRange(v39, v41)
            if not (v52 and v52) then
                return nil
            end
            if v44 >= v52 then
                v52 = v44
            end
            local _ = v52 < v52
            return {
                ["optionId"] = v39,
                ["grade"] = v41,
                ["value"] = v52
            }
        end
    end
    return nil
end
function u2.cloneMap(p53) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v54 = {}
    if type(p53) == "table" then
        for v55, v56 in pairs(p53) do
            local v57 = u2.normalizeEntry(v56)
            if type(v55) == "string" and (v57 and u2.isEligibleItemId(v55)) then
                v54[v55] = v57
            end
        end
    end
    return v54
end
function u2.rollGrade(p58) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v59 = p58 or Random.new()
    local v60 = 0
    for _, v61 in ipairs(u2.GRADE_ORDER) do
        local v62 = u2.GRADES[v61]
        local v63 = 0
        if v62 then
            v62 = v62.weight
        end
        local v64 = tonumber(v62)
        local v65
        if v64 then
            local v66 = math.floor(v64)
            local v67 = v66 < 0 and 0 or v66
            v65 = v67 > 1000000 and 1000000 or v67
        else
            v65 = 0
        end
        v60 = v60 + math.max(v63, v65 or 0)
    end
    if v60 <= 0 then
        return "common"
    end
    local v68 = v59:NextInteger(1, v60)
    local v69 = 0
    for _, v70 in ipairs(u2.GRADE_ORDER) do
        local v71 = u2.GRADES[v70]
        local v72 = 0
        if v71 then
            v71 = v71.weight
        end
        local v73 = tonumber(v71)
        local v74
        if v73 then
            local v75 = math.floor(v73)
            local v76 = v75 < 0 and 0 or v75
            v74 = v76 > 1000000 and 1000000 or v76
        else
            v74 = 0
        end
        v69 = v69 + math.max(v72, v74 or 0)
        if v68 <= v69 then
            return v70
        end
    end
    return "common"
end
function u2.rollOptionId(p77) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v78 = p77 or Random.new()
    local v79 = u2.OPTION_ORDER
    if #v79 <= 0 then
        return nil
    else
        return v79[v78:NextInteger(1, #v79)]
    end
end
function u2.rollValue(p80, p81, p82) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v83 = p82 or Random.new()
    local v84, v85 = u2.getValueRange(p80, p81)
    if v84 and v85 then
        return v83:NextInteger(v84, v85)
    else
        return nil
    end
end
function u2.rollEntry(p86) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v87 = p86 or Random.new()
    local v88 = u2.rollGrade(v87)
    local v89 = u2.rollOptionId(v87)
    if not v89 then
        return nil
    end
    local v90 = u2.rollValue(v89, v88, v87)
    return v90 and {
        ["optionId"] = v89,
        ["grade"] = v88,
        ["value"] = v90
    } or nil
end
function u2.formatOptionText(p91) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v92 = u2.normalizeEntry(p91)
    if not v92 then
        return "\236\152\181\236\133\152 \236\151\134\236\157\140"
    end
    local v93 = v92.optionId
    local v94 = type(v93) == "string" and v93 and v93 or ""
    local v95
    if v94 == "" then
        v95 = nil
    else
        v95 = u2.OPTIONS[v94] or nil
    end
    local v96 = v95 and v95.displayName or v92.optionId
    local v97 = v95 and v95.suffix or ""
    return string.format("%s +%d%s", v96, v92.value, v97)
end
return u2