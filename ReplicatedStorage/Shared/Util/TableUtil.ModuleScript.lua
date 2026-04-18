local u15 = {
    ["shallowCopy"] = function(p1) --[[ Name: shallowCopy, Line 2 ]]
        local v2 = {}
        for v3, v4 in pairs(p1) do
            v2[v3] = v4
        end
        return v2
    end,
    ["deepCopy"] = function(p5) --[[ Name: deepCopy, Line 7 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        if type(p5) ~= "table" then
            return p5
        end
        local v6 = {}
        for v7, v8 in pairs(p5) do
            v6[v7] = u15.deepCopy(v8)
        end
        local v9 = getmetatable(p5)
        return setmetatable(v6, v9)
    end,
    ["merge"] = function(p10, p11) --[[ Name: merge, Line 13 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        local v12 = u15.deepCopy(p10)
        for v13, v14 in pairs(p11) do
            v12[v13] = v14
        end
        return v12
    end
}
return u15