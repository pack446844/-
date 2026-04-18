local u40 = {
    ["expForLevel"] = function(p1) --[[ Name: expForLevel, Line 7 ]]
        local v2 = tonumber(p1) or 1
        local v3 = math.floor(v2)
        local v4 = math.max(1, v3)
        local v5 = v4 - 8
        local v6 = math.max(0, v5)
        local v7 = v4 - 15
        local v8 = math.max(0, v7)
        local v9 = v4 - 22
        local v10 = math.max(0, v9)
        local v11 = v4 - 30
        local v12 = math.max(0, v11)
        local v13 = v4 - 39
        local v14 = math.max(0, v13)
        local v15 = v4 - 60
        local v16 = math.max(0, v15)
        local v17 = v4 * v4 * 18 + v4 * 60 + v6 * v6 * 120 + v8 * v8 * 520 + v10 * v10 * 1000 + v10 * 830 + v12 * v12 * 1320 + v14 * v14 * 2900 + v14 * 4250 + v16 * v16 * 8500 + v16 * 17000
        return math.floor(v17)
    end,
    ["calcLevel"] = function(p18) --[[ Name: calcLevel, Line 29 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v19 = tonumber(p18) or 0
        local v20 = math.floor(v19)
        local v21 = math.max(0, v20)
        local v22 = 1
        while v22 < 65 do
            local v23 = u40.expForLevel(v22)
            if v21 < v23 then
                break
            end
            v21 = v21 - v23
            v22 = v22 + 1
        end
        return v22
    end,
    ["addExp"] = function(p24, p25) --[[ Name: addExp, Line 44 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v26 = tonumber(p25) or 0
        local v27 = math.floor(v26)
        local v28 = math.max(0, v27)
        local v29 = p24.totalExp
        local v30 = tonumber(v29) or 0
        local v31 = math.floor(v30)
        p24.totalExp = math.max(0, v31) + v28
        local v32 = p24.exp
        local v33 = tonumber(v32) or 0
        local v34 = math.floor(v33)
        p24.exp = math.max(0, v34) + v28
        local v35 = p24.level
        local v36 = tonumber(v35) or 1
        local v37 = math.floor(v36)
        p24.level = math.max(1, v37)
        local v38 = 0
        while p24.level < 65 do
            local v39 = u40.expForLevel(p24.level)
            if p24.exp < v39 then
                break
            end
            p24.exp = p24.exp - v39
            p24.level = p24.level + 1
            v38 = v38 + 1
        end
        if p24.level >= 65 then
            p24.level = 65
            p24.exp = 0
        end
        return v38
    end
}
return u40