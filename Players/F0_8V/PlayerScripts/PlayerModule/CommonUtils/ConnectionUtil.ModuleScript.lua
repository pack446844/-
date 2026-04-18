local u1 = {}
u1.__index = u1
function u1.new() --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3._connections = {}
    return v3
end
function u1.trackConnection(p4, p5, u6) --[[ Line: 33 ]]
    if p4._connections[p5] then
        p4._connections[p5]()
    end
    p4._connections[p5] = function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6:Disconnect()
    end
end
function u1.trackBoundFunction(p7, p8, p9) --[[ Line: 41 ]]
    if p7._connections[p8] then
        p7._connections[p8]()
    end
    p7._connections[p8] = p9
end
function u1.disconnect(p10, p11) --[[ Line: 48 ]]
    if p10._connections[p11] then
        p10._connections[p11]()
        p10._connections[p11] = nil
    end
end
function u1.disconnectAll(p12) --[[ Line: 55 ]]
    for _, v13 in pairs(p12._connections) do
        v13()
    end
    p12._connections = {}
end
return u1