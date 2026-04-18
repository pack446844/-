local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
local v2 = require(v1:WaitForChild("FlagUtil"))
local u3 = require(script.Parent:WaitForChild("ZoomController"))
local u4 = v2.getUserFlag("UserFixCameraFPError")
local u5 = {}
u5.__index = u5
local u6 = CFrame.new()
function u5.new() --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v7 = u5
    return setmetatable({
        ["lastCFrame"] = nil
    }, v7)
end
function u5.Step(p8, p9, p10) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v11 = p8.lastCFrame or p10
    p8.lastCFrame = p10
    local u12 = p10.Position
    local _, _, _, v13, v14, v15, v16, v17, v18, v19, v20, v21 = p10:GetComponents()
    local u22 = CFrame.new(0, 0, 0, v13, v14, v15, v16, v17, v18, v19, v20, v21)
    local v23 = v11.p
    local _, _, _, v24, v25, v26, v27, v28, v29, v30, v31, v32 = v11:GetComponents()
    local v33 = CFrame.new(0, 0, 0, v24, v25, v26, v27, v28, v29, v30, v31, v32)
    local u34 = (u12 - v23) / p9
    local v35, v36 = (u22 * v33:inverse()):ToAxisAngle()
    local u37 = v35 * v36 / p9
    return {
        ["extrapolate"] = function(p38) --[[ Name: extrapolate, Line 56 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u12
                [3] = u37
                [4] = u6
                [5] = u22
            --]]
            local v39 = u34 * p38 + u12
            local v40 = u37 * p38
            local v41 = v40.Magnitude
            local v42
            if v41 > 0.00001 then
                v42 = CFrame.fromAxisAngle(v40, v41)
            else
                v42 = u6
            end
            return v42 * u22 + v39
        end,
        ["posVelocity"] = u34,
        ["rotVelocity"] = u37
    }
end
function u5.Reset(p43) --[[ Line: 69 ]]
    p43.lastCFrame = nil
end
local u44 = require(script.Parent:WaitForChild("BaseOcclusion"))
local u45 = setmetatable({}, u44)
u45.__index = u45
function u45.new() --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u45
        [3] = u5
    --]]
    local v46 = u44.new()
    local v47 = u45
    local v48 = setmetatable(v46, v47)
    v48.focusExtrapolator = u5.new()
    return v48
end
function u45.GetOcclusionMode(_) --[[ Line: 85 ]]
    return Enum.DevCameraOcclusionMode.Zoom
end
function u45.Enable(p49, _) --[[ Line: 89 ]]
    p49.focusExtrapolator:Reset()
end
function u45.Update(p50, p51, p52, p53, _) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    local v54
    if u4 then
        v54 = CFrame.lookAlong(p53.p, -p52.LookVector) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    else
        v54 = CFrame.new(p53.p, p52.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    end
    local v55 = p50.focusExtrapolator:Step(p51, v54)
    local v56 = u3.Update(p51, v54, v55)
    return v54 * CFrame.new(0, 0, v56), p53
end
function u45.CharacterAdded(_, _, _) --[[ Line: 117 ]] end
function u45.CharacterRemoving(_, _, _) --[[ Line: 121 ]] end
function u45.OnCameraSubjectChanged(_, _) --[[ Line: 124 ]] end
return u45