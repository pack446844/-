local u1 = {}
u1.__index = u1
setmetatable(u1, {
    ["__call"] = function(_, ...) --[[ Name: __call, Line 10 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.new(...)
    end
})
function u1.new() --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    return setmetatable({}, v2)
end
function u1.CharacterAdded(_, _, _) --[[ Line: 21 ]] end
function u1.CharacterRemoving(_, _, _) --[[ Line: 25 ]] end
function u1.OnCameraSubjectChanged(_, _) --[[ Line: 28 ]] end
function u1.GetOcclusionMode(_) --[[ Line: 32 ]]
    warn("BaseOcclusion GetOcclusionMode must be overridden by derived classes")
    return nil
end
function u1.Enable(_, _) --[[ Line: 38 ]]
    warn("BaseOcclusion Enable must be overridden by derived classes")
end
function u1.Update(_, _, p3, p4) --[[ Line: 42 ]]
    warn("BaseOcclusion Update must be overridden by derived classes")
    return p3, p4
end
return u1