local function u4(p1) --[[ Line: 4 ]]
    local v2 = string.split(p1, "/")
    for v3 = #v2, 1, -1 do
        if v2[v3] == "" then
            table.remove(v2, v3)
        end
    end
    return v2
end
local function u11(p5, p6) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p5.instance ~= nil then
        p5.instance = nil
        local v7 = p5.connections
        if v7 then
            for _, v8 in ipairs(v7) do
                v8:Disconnect()
            end
            table.clear(v7)
        end
        if p6 and p5.alias then
            p6[p5.alias] = nil
        end
        local v9 = p5.children
        if v9 then
            for _, v10 in pairs(v9) do
                u11(v10, p6)
            end
        end
    end
end
local u12 = {}
u12.__index = u12
function u12.new(p13, p14) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
    --]]
    local v15 = {}
    local v16 = 1
    local v17 = {}
    local v18 = {}
    local v19 = {}
    local v20 = {}
    for v21, v22 in pairs(p13) do
        v15[v21] = u4(v22)
        v16 = v16 + 1
    end
    local v23 = u12
    return setmetatable({
        ["_boundFn"] = p14,
        ["_parsedManifest"] = v15,
        ["_manifestSizeTarget"] = v16,
        ["_dtorMap"] = v17,
        ["_connections"] = v18,
        ["_rootInstToRootNode"] = v19,
        ["_rootInstToManifest"] = v20
    }, v23)
end
function u12._startBoundFn(p24, p25, p26) --[[ Line: 80 ]]
    local v27 = p24._boundFn
    local v28 = p24._dtorMap
    local v29 = v28[p25]
    if v29 then
        v29()
        v28[p25] = nil
    end
    local v30 = v27(p26)
    if v30 then
        v28[p25] = v30
    end
end
function u12._stopBoundFn(p31, p32) --[[ Line: 96 ]]
    local v33 = p31._dtorMap
    local v34 = v33[p32]
    if v34 then
        v34()
        v33[p32] = nil
    end
end
function u12.bindRoot(u35, u36) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    debug.profilebegin("AtomicBinding:BindRoot")
    local v37 = u35._parsedManifest
    local v38 = u35._rootInstToRootNode
    local v39 = u35._rootInstToManifest
    local u40 = u35._manifestSizeTarget
    local v41 = v39[u36] == nil
    assert(v41)
    local u42 = {}
    v39[u36] = u42
    debug.profilebegin("BuildTree")
    local v43 = {
        ["alias"] = "root",
        ["instance"] = u36
    }
    if next(v37) then
        v43.children = {}
        v43.connections = {}
    end
    v38[u36] = v43
    for v44, v45 in pairs(v37) do
        local v46 = v43
        for v47, v48 in ipairs(v45) do
            local v49 = v47 == #v45
            local v50 = v43.children[v48] or {}
            if v49 then
                if v50.alias ~= nil then
                    error("Multiple aliases assigned to one instance")
                end
                v50.alias = v44
            else
                v50.children = v50.children or {}
                v50.connections = v50.connections or {}
            end
            v43.children[v48] = v50
            v43 = v50
        end
        v43 = v46
    end
    debug.profileend()
    local function u77(p51) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u77
            [3] = u35
            [4] = u36
            [5] = u11
            [6] = u40
        --]]
        local v52 = p51.instance
        local u53 = assert(v52)
        local u54 = p51.children
        local v55 = p51.alias
        local v56 = not u54
        if v55 then
            u42[v55] = u53
        end
        if not v56 then
            local function v59(p57) --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u77
                --]]
                local v58 = u54[p57.Name]
                if v58 and v58.instance == nil then
                    v58.instance = p57
                    u77(v58)
                end
            end
            local function v66(p60) --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u35
                    [3] = u36
                    [4] = u11
                    [5] = u42
                    [6] = u53
                    [7] = u77
                --]]
                local v61 = p60.Name
                local v62 = u54[v61]
                if v62 then
                    if v62.instance == p60 then
                        u35:_stopBoundFn(u36)
                        u11(v62, u42)
                        local v63 = v62.instance == nil
                        assert(v63)
                        local v64 = u53:FindFirstChild(v61)
                        local v65 = v64 and u54[v64.Name]
                        if v65 then
                            if v65.instance ~= nil then
                                return
                            end
                            v65.instance = v64
                            u77(v65)
                        end
                    end
                else
                    return
                end
            end
            for _, v67 in ipairs(u53:GetChildren()) do
                local v68 = u54[v67.Name]
                if v68 then
                    if v68.instance == nil then
                        v68.instance = v67
                        u77(v68)
                    end
                end
            end
            local v69 = p51.connections
            local v70 = u53.ChildAdded
            table.insert(v69, v70:Connect(v59))
            local v71 = p51.connections
            local v72 = u53.ChildRemoved
            table.insert(v71, v72:Connect(v66))
        end
        if v56 then
            local v73 = u42
            local v74 = u40
            local v75 = 0
            for _ in pairs(v73) do
                v75 = v75 + 1
            end
            local v76 = v75 <= v74
            assert(v76, v75)
            if v75 == v74 then
                u35:_startBoundFn(u36, u42)
            end
        end
    end
    debug.profilebegin("ResolveTree")
    u77(v43)
    debug.profileend()
    debug.profileend()
end
function u12.unbindRoot(p78, p79) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v80 = p78._rootInstToRootNode
    local v81 = p78._rootInstToManifest
    p78:_stopBoundFn(p79)
    local v82 = v80[p79]
    if v82 then
        local v83 = v81[p79]
        u11(v82, (assert(v83)))
        v80[p79] = nil
    end
    v81[p79] = nil
end
function u12.destroy(p84) --[[ Line: 252 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    debug.profilebegin("AtomicBinding:destroy")
    for _, v85 in pairs(p84._dtorMap) do
        v85:destroy()
    end
    table.clear(p84._dtorMap)
    for _, v86 in ipairs(p84._connections) do
        v86:Disconnect()
    end
    table.clear(p84._connections)
    local v87 = p84._rootInstToManifest
    for v88, v89 in pairs(p84._rootInstToRootNode) do
        local v90 = v87[v88]
        u11(v89, (assert(v90)))
    end
    table.clear(p84._rootInstToManifest)
    table.clear(p84._rootInstToRootNode)
    debug.profileend()
end
return u12