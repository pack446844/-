local u1 = game:GetService("UserInputService")
local u2 = game:GetService("GuiService")
local u3 = {}
local u4 = Instance.new("BindableEvent")
local u5 = nil
local u6 = setmetatable({}, {
    ["__mode"] = "k"
})
local function u10(p7) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if not p7 then
        return nil
    end
    local v8 = u6[p7]
    if v8 then
        return v8
    end
    local v9 = {
        ["intentByBaseName"] = {},
        ["intentSourceByBaseName"] = {},
        ["forcedDefaultByBaseName"] = {},
        ["forcedDefaultValueByBaseName"] = {},
        ["watchByBaseName"] = {},
        ["applyDepth"] = 0
    }
    u6[p7] = v9
    return v9
end
local function u19(p11, p12, p13) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v14 = u10(p11)
    if not v14 then
        return false, false
    end
    local v15 = type(p13) == "table" and p13[p12] ~= nil and true or p12 == "MainHUD"
    v14.forcedDefaultByBaseName[p12] = v15 == true
    local v16 = v14.forcedDefaultValueByBaseName
    local v17
    if v15 then
        v17 = true
        local v18
        if type(p13) == "table" and p13[p12] ~= nil then
            v18 = p13[p12] == true
        else
            v18 = p12 == "MainHUD"
        end
        if v18 ~= true then
            v17 = nil
        end
    else
        v17 = nil
    end
    v16[p12] = v17
    return v15 == true, v14.forcedDefaultValueByBaseName[p12] == true
end
local function u37(p20, p21, p22) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u19
        [3] = u3
    --]]
    local v23 = u10(p20)
    if not v23 then
        return false
    end
    local v24 = v23.intentByBaseName[p21]
    if v24 ~= nil then
        return v24 == true
    end
    local v25, v26 = u19(p20, p21, p22)
    if v25 then
        v23.intentByBaseName[p21] = v26 == true
        v23.intentSourceByBaseName[p21] = "forced"
        return v26 == true
    end
    local v27 = u10(p20)
    local v28
    if v27 and v27.applyDepth <= 0 then
        local v30, v30 = u3.getPair(p20, p21)
        local v31 = v30 and v30.Enabled == true and true or false
        local v32 = v30 and v30.Enabled == true and true or false
        local v33, v34
        if v31 == v32 then
            v33 = nil
            v34 = nil
        elseif v32 then
            v34 = v30
            v33 = v34
            local v35 = v34
            v34 = v33
            v35 = v33
        else
            v34 = v30
            v33 = v34
            local v36 = v34
            v34 = v33
            v36 = v33
        end
        if v33 then
            v30 = v33
        elseif u3.useMobileGui() then
            if v30 then
                v34 = v30
            else
                v34 = nil
            end
        elseif v30 then
            v34 = v30
        else
            v34 = nil
        end
        if v30 then
            v28 = v30.Enabled == true
        elseif v34 then
            v28 = v34.Enabled == true
        else
            v28 = nil
        end
    else
        v28 = nil
    end
    if v28 == nil then
        v28 = false
    end
    v23.intentByBaseName[p21] = v28 == true
    v23.intentSourceByBaseName[p21] = "instance"
    return v28 == true
end
local function u51(p38, p39) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
    --]]
    local v40 = u10(p38)
    if v40 and v40.applyDepth <= 0 then
        if v40.intentSourceByBaseName[p39] == "explicit" then
            return
        elseif v40.forcedDefaultByBaseName[p39] == true then
            v40.intentByBaseName[p39] = v40.forcedDefaultValueByBaseName[p39] == true
            v40.intentSourceByBaseName[p39] = "forced"
        else
            local v41 = u10(p38)
            local v42
            if v41 and v41.applyDepth <= 0 then
                local v44, v44 = u3.getPair(p38, p39)
                local v45 = v44 and v44.Enabled == true and true or false
                local v46 = v44 and v44.Enabled == true and true or false
                local v47, v48
                if v45 == v46 then
                    v47 = nil
                    v48 = nil
                elseif v46 then
                    v48 = v44
                    v47 = v48
                    local v49 = v48
                    v48 = v47
                    v49 = v47
                else
                    v48 = v44
                    v47 = v48
                    local v50 = v48
                    v48 = v47
                    v50 = v47
                end
                if v47 then
                    v44 = v47
                elseif u3.useMobileGui() then
                    if v44 then
                        v48 = v44
                    else
                        v48 = nil
                    end
                elseif v44 then
                    v48 = v44
                else
                    v48 = nil
                end
                if v44 then
                    v42 = v44.Enabled == true
                elseif v48 then
                    v42 = v48.Enabled == true
                else
                    v42 = nil
                end
            else
                v42 = nil
            end
            if v42 ~= nil then
                v40.intentByBaseName[p39] = v42 == true
                v40.intentSourceByBaseName[p39] = "instance"
            end
        end
    else
        return
    end
end
local function u58(u52, u53) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u51
    --]]
    local v54 = u10(u52)
    if v54 then
        local v55 = v54.watchByBaseName[u53]
        if not v55 then
            v55 = {}
            v54.watchByBaseName[u53] = v55
        end
        local v56, v57 = u3.getPair(u52, u53)
        if v55.baseGui ~= v56 then
            if v55.baseConn then
                v55.baseConn:Disconnect()
                v55.baseConn = nil
            end
            v55.baseGui = v56
            if v56 then
                v55.baseConn = v56:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 154 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u52
                        [3] = u53
                    --]]
                    u51(u52, u53)
                end)
            end
        end
        if v55.mobileGui ~= v57 then
            if v55.mobileConn then
                v55.mobileConn:Disconnect()
                v55.mobileConn = nil
            end
            v55.mobileGui = v57
            if v57 then
                v55.mobileConn = v57:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 163 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u52
                        [3] = u53
                    --]]
                    u51(u52, u53)
                end)
            end
        end
        if (v56 or v57) and v54.intentSourceByBaseName[u53] ~= "explicit" then
            u51(u52, u53)
        end
    end
end
function u3.computeMode() --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    return u2:IsTenFootInterface() and "desktop" or (u1.TouchEnabled and "mobile" or "desktop")
end
function u3.setResolvedMode(p59) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v60 = p59 == "mobile" and "mobile" or "desktop"
    if u5 == v60 then
        return u5
    end
    u5 = v60
    u4:Fire(u5)
    return u5
end
function u3.getResolvedMode() --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5
end
function u3.isReady() --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5 ~= nil
end
function u3.waitUntilReady(p61) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v62 = tonumber(p61) or 5
    if u3.isReady() then
        return true
    end
    local u63 = false
    local u64 = nil
    u64 = u4.Event:Connect(function() --[[ Line: 201 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u64
        --]]
        u63 = true
        if u64 then
            u64:Disconnect()
            u64 = nil
        end
    end)
    local v65 = os.clock() + math.max(0, v62)
    local v66 = u64
    while not u63 and (not u3.isReady() and os.clock() < v65) do
        task.wait()
    end
    if v66 then
        v66:Disconnect()
        u64 = nil
    end
    return u3.isReady()
end
u3.modeChanged = u4.Event
function u3.useMobileGui() --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    return (u5 or u3.computeMode()) == "mobile"
end
function u3.getName(p67) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if type(p67) ~= "string" or p67 == "" then
        return nil
    end
    if u3.useMobileGui() then
        p67 = p67 .. "_Mobile" or p67
    end
    return p67
end
function u3.getPair(p68, p69) --[[ Line: 226 ]]
    if p68 and p69 then
        return p68:FindFirstChild(p69), p68:FindFirstChild(p69 .. "_Mobile")
    else
        return nil, nil
    end
end
function u3.find(p70, p71) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not (p70 and p71) then
        return nil
    end
    if not u3.isReady() then
        u3.waitUntilReady(1.5)
    end
    local v73, v73 = u3.getPair(p70, p71)
    local v74 = v73 and v73.Enabled == true and true or false
    local v75 = v73 and v73.Enabled == true and true or false
    local v76, v77
    if v74 == v75 then
        v76 = nil
        v77 = nil
    elseif v75 then
        v77 = v73
        v76 = v77
        local v78 = v77
        v77 = v76
        v78 = v76
    else
        v77 = v73
        v76 = v77
        local v79 = v77
        v77 = v76
        v79 = v76
    end
    if v76 then
        v73 = v76
    elseif u3.useMobileGui() then
        if v73 then
            v77 = v73
        else
            v77 = nil
        end
    elseif v73 then
        v77 = v73
    else
        v77 = nil
    end
    return v73 or v77
end
function u3.wait(p80, p81, p82) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not (p80 and p81) then
        return nil
    end
    local v83 = tonumber(p82) or 10
    if not u3.isReady() then
        u3.waitUntilReady((math.min(v83, 1.5)))
    end
    local v84, v85 = u3.getPair(p80, p81)
    local v86 = v84 and v84.Enabled == true and true or false
    local v87 = v85 and v85.Enabled == true and true or false
    local v88, v89
    if v86 == v87 then
        v88 = nil
        v89 = nil
    elseif v87 then
        v89 = v84
        v88 = v85
    else
        v89 = v85
        v88 = v84
    end
    if not v88 then
        if u3.useMobileGui() then
            v88 = v85 or v84
        else
            v88 = v84 or v85
        end
    end
    if v88 then
        return v88
    end
    local v90 = u3.getName(p81)
    local v91 = p80:FindFirstChild(v90)
    if v91 then
        return v91
    end
    local v92 = p80:WaitForChild(v90, v83)
    if v92 then
        return v92
    end
    local v94, v94 = u3.getPair(p80, p81)
    local v95 = v94 and v94.Enabled == true and true or false
    local v96 = v94 and v94.Enabled == true and true or false
    local v97, v98
    if v95 == v96 then
        v97 = nil
        v98 = nil
    elseif v96 then
        v98 = v94
        v97 = v98
        local v99 = v98
        v98 = v97
        v99 = v97
    else
        v98 = v94
        v97 = v98
        local v100 = v98
        v98 = v97
        v100 = v97
    end
    if v97 then
        v94 = v97
    elseif u3.useMobileGui() then
        if v94 then
            v98 = v94
        else
            v98 = nil
        end
    elseif v94 then
        v98 = v94
    else
        v98 = nil
    end
    return v94 or v98
end
function u3.bootstrapIntents(p101, p102, p103) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u58
        [3] = u37
    --]]
    if p101 then
        for _, v104 in ipairs(p102 or {}) do
            if type(v104) == "string" and v104 ~= "" then
                u19(p101, v104, p103)
                u58(p101, v104)
                u37(p101, v104, p103)
            end
        end
    end
end
function u3.getIntent(p105, p106, p107) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u37
    --]]
    if p105 and (type(p106) == "string" and p106 ~= "") then
        local v108 = u10(p105)
        if v108 then
            local v109 = v108.intentByBaseName[p106]
            if v109 == nil then
                return u37(p105, p106, p107)
            else
                return v109 == true
            end
        else
            return false
        end
    else
        return false
    end
end
function u3.setEnabled(p110, p111, p112, p113) --[[ Line: 275 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u58
        [3] = u10
        [4] = u3
    --]]
    if not p110 or (type(p111) ~= "string" or p111 == "") then
        return nil
    end
    u19(p110, p111, p113)
    u58(p110, p111)
    local v114 = p112 == true
    local v115 = u10(p110)
    local v116
    if v115 then
        v115.intentByBaseName[p111] = v114 == true
        v115.intentSourceByBaseName[p111] = "explicit"
        v116 = v114 == true
    else
        v116 = v114 == true
    end
    local v118, v118 = u3.getPair(p110, p111)
    local v119
    if u3.useMobileGui() then
        if v118 then
            v119 = v118
        else
            v119 = nil
        end
    elseif v118 then
        v119 = v118
    else
        v119 = nil
    end
    if v119 and v119 ~= v118 then
        local v120 = false
        if v119 then
            local v121 = v120 == true
            if v119.Enabled ~= v121 then
                local v122 = u10(p110)
                if v122 then
                    v122.applyDepth = v122.applyDepth + 1
                end
                v119.Enabled = v121
                if v122 then
                    local v123 = v122.applyDepth - 1
                    v122.applyDepth = math.max(0, v123)
                end
            end
        end
    end
    if v118 then
        local v124 = v116 == true
        if v118.Enabled ~= v124 then
            local v125 = u10(p110)
            if v125 then
                v125.applyDepth = v125.applyDepth + 1
            end
            v118.Enabled = v124
            if v125 then
                local v126 = v125.applyDepth - 1
                v125.applyDepth = math.max(0, v126)
            end
        end
    end
    return v118 or v119
end
function u3.toggle(p127, p128, p129) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u37
        [3] = u3
    --]]
    if not p127 or (type(p128) ~= "string" or p128 == "") then
        return nil
    end
    local v130 = u10(p127)
    local v131
    if v130 then
        local v132 = v130.intentByBaseName[p128]
        if v132 == nil then
            v131 = u37(p127, p128, p129)
        else
            v131 = v132 == true
        end
    else
        v131 = false
    end
    return u3.setEnabled(p127, p128, not v131, p129)
end
function u3.applyPair(p133, p134, p135) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u58
        [3] = u10
        [4] = u37
        [5] = u3
    --]]
    if not p133 or (type(p134) ~= "string" or p134 == "") then
        return nil
    end
    u19(p133, p134, p135)
    u58(p133, p134)
    local v136 = u10(p133)
    local v137
    if v136 then
        local v138 = v136.intentByBaseName[p134]
        if v138 == nil then
            v137 = u37(p133, p134, p135)
        else
            v137 = v138 == true
        end
    else
        v137 = false
    end
    local v140, v140 = u3.getPair(p133, p134)
    if not (v140 or v140) then
        return nil
    end
    local v141
    if u3.useMobileGui() then
        if v140 then
            v141 = v140
        else
            v141 = nil
        end
    elseif v140 then
        v141 = v140
    else
        v141 = nil
    end
    if v141 and v141 ~= v140 then
        local v142 = false
        if v141 then
            local v143 = v142 == true
            if v141.Enabled ~= v143 then
                local v144 = u10(p133)
                if v144 then
                    v144.applyDepth = v144.applyDepth + 1
                end
                v141.Enabled = v143
                if v144 then
                    local v145 = v144.applyDepth - 1
                    v144.applyDepth = math.max(0, v145)
                end
            end
        end
    end
    if v140 then
        local v146 = v137 == true
        if v140.Enabled ~= v146 then
            local v147 = u10(p133)
            if v147 then
                v147.applyDepth = v147.applyDepth + 1
            end
            v140.Enabled = v146
            if v147 then
                local v148 = v147.applyDepth - 1
                v147.applyDepth = math.max(0, v148)
            end
        end
    end
    return v140 or v141
end
function u3.applyAll(p149, p150, p151) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p149 then
        u3.bootstrapIntents(p149, p150, p151)
        for _, v152 in ipairs(p150 or {}) do
            u3.applyPair(p149, v152, p151)
        end
    end
end
return u3