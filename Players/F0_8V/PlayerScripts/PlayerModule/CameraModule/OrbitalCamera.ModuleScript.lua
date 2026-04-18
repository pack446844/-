local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
local u2 = require(v1:WaitForChild("FlagUtil")).getUserFlag("UserFixOrbitalCameraAzimuth")
local u3 = require(script.Parent:WaitForChild("CameraUtils"))
local u4 = require(script.Parent:WaitForChild("CameraInput"))
local u5 = game:GetService("Players")
local u6 = require(script.Parent:WaitForChild("BaseCamera"))
local u7 = setmetatable({}, u6)
u7.__index = u7
function u7.new() --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v8 = u6.new()
    local v9 = u7
    local v10 = setmetatable(v8, v9)
    v10.lastUpdate = tick()
    v10.changedSignalConnections = {}
    v10.refAzimuthRad = nil
    v10.curAzimuthRad = nil
    v10.minAzimuthAbsoluteRad = nil
    v10.maxAzimuthAbsoluteRad = nil
    v10.useAzimuthLimits = nil
    v10.curElevationRad = nil
    v10.minElevationRad = nil
    v10.maxElevationRad = nil
    v10.curDistance = nil
    v10.minDistance = nil
    v10.maxDistance = nil
    v10.gamepadDollySpeedMultiplier = 1
    v10.lastUserPanCamera = tick()
    v10.externalProperties = {}
    v10.externalProperties.InitialDistance = 25
    v10.externalProperties.MinDistance = 10
    v10.externalProperties.MaxDistance = 100
    v10.externalProperties.InitialElevation = 35
    v10.externalProperties.MinElevation = 35
    v10.externalProperties.MaxElevation = 35
    v10.externalProperties.ReferenceAzimuth = -45
    v10.externalProperties.CWAzimuthTravel = 90
    v10.externalProperties.CCWAzimuthTravel = 90
    v10.externalProperties.UseAzimuthLimits = false
    v10:LoadNumberValueParameters()
    return v10
end
function u7.LoadOrCreateNumberValueParameter(u11, u12, p13, u14) --[[ Line: 85 ]]
    local v15 = script:FindFirstChild(u12)
    if v15 and v15:IsA(p13) then
        u11.externalProperties[u12] = v15.Value
    else
        if u11.externalProperties[u12] == nil then
            return
        end
        v15 = Instance.new(p13)
        v15.Name = u12
        v15.Parent = script
        v15.Value = u11.externalProperties[u12]
    end
    if u14 then
        if u11.changedSignalConnections[u12] then
            u11.changedSignalConnections[u12]:Disconnect()
        end
        u11.changedSignalConnections[u12] = v15.Changed:Connect(function(p16) --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u12
                [3] = u14
            --]]
            u11.externalProperties[u12] = p16
            u14(u11)
        end)
    end
end
function u7.SetAndBoundsCheckAzimuthValues(p17) --[[ Line: 112 ]]
    local v18 = p17.externalProperties.ReferenceAzimuth
    local v19 = math.rad(v18)
    local v20 = p17.externalProperties.CWAzimuthTravel
    local v21 = math.rad(v20)
    p17.minAzimuthAbsoluteRad = v19 - math.abs(v21)
    local v22 = p17.externalProperties.ReferenceAzimuth
    local v23 = math.rad(v22)
    local v24 = p17.externalProperties.CCWAzimuthTravel
    local v25 = math.rad(v24)
    p17.maxAzimuthAbsoluteRad = v23 + math.abs(v25)
    p17.useAzimuthLimits = p17.externalProperties.UseAzimuthLimits
    if p17.useAzimuthLimits then
        local v26 = p17.curAzimuthRad
        local v27 = p17.minAzimuthAbsoluteRad
        p17.curAzimuthRad = math.max(v26, v27)
        local v28 = p17.curAzimuthRad
        local v29 = p17.maxAzimuthAbsoluteRad
        p17.curAzimuthRad = math.min(v28, v29)
    end
end
function u7.SetAndBoundsCheckElevationValues(p30) --[[ Line: 122 ]]
    local v31 = p30.externalProperties.MinElevation
    local v32 = math.max(v31, -80)
    local v33 = p30.externalProperties.MaxElevation
    local v34 = math.min(v33, 80)
    local v35 = math.min(v32, v34)
    p30.minElevationRad = math.rad(v35)
    local v36 = math.max(v32, v34)
    p30.maxElevationRad = math.rad(v36)
    local v37 = p30.curElevationRad
    local v38 = p30.minElevationRad
    p30.curElevationRad = math.max(v37, v38)
    local v39 = p30.curElevationRad
    local v40 = p30.maxElevationRad
    p30.curElevationRad = math.min(v39, v40)
end
function u7.SetAndBoundsCheckDistanceValues(p41) --[[ Line: 138 ]]
    p41.minDistance = p41.externalProperties.MinDistance
    p41.maxDistance = p41.externalProperties.MaxDistance
    local v42 = p41.curDistance
    local v43 = p41.minDistance
    p41.curDistance = math.max(v42, v43)
    local v44 = p41.curDistance
    local v45 = p41.maxDistance
    p41.curDistance = math.min(v44, v45)
end
function u7.LoadNumberValueParameters(p46) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p46:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil)
    p46:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil)
    local v47 = "ReferenceAzimuth"
    local v48 = "NumberValue"
    local v49
    if u2 then
        v49 = p46.SetAndBoundsCheckAzimuthValues
    else
        v49 = p46.SetAndBoundsCheckAzimuthValue
    end
    p46:LoadOrCreateNumberValueParameter(v47, v48, v49)
    p46:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", p46.SetAndBoundsCheckAzimuthValues)
    p46:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", p46.SetAndBoundsCheckAzimuthValues)
    p46:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", p46.SetAndBoundsCheckElevationValues)
    p46:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", p46.SetAndBoundsCheckElevationValues)
    p46:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", p46.SetAndBoundsCheckDistanceValues)
    p46:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", p46.SetAndBoundsCheckDistanceValues)
    p46:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", p46.SetAndBoundsCheckAzimuthValues)
    local v50 = p46.externalProperties.ReferenceAzimuth
    p46.curAzimuthRad = math.rad(v50)
    local v51 = p46.externalProperties.InitialElevation
    p46.curElevationRad = math.rad(v51)
    p46.curDistance = p46.externalProperties.InitialDistance
    p46:SetAndBoundsCheckAzimuthValues()
    p46:SetAndBoundsCheckElevationValues()
    p46:SetAndBoundsCheckDistanceValues()
end
function u7.GetModuleName(_) --[[ Line: 172 ]]
    return "OrbitalCamera"
end
function u7.SetInitialOrientation(p52, p53) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p53 and p53.RootPart then
        local v54 = p53.RootPart
        assert(v54, "")
        local v55 = (p53.RootPart.CFrame.LookVector - Vector3.new(0, 0.23, 0)).Unit
        local v56 = u3.GetAngleBetweenXZVectors(v55, p52:GetCameraLookVector())
        local v57 = p52:GetCameraLookVector().Y
        local v58 = math.asin(v57)
        local v59 = v55.Y
        local v60 = v58 - math.asin(v59)
        u3.IsFinite(v56)
        u3.IsFinite(v60)
    else
        warn("OrbitalCamera could not set initial orientation due to missing humanoid")
    end
end
function u7.GetCameraToSubjectDistance(p61) --[[ Line: 194 ]]
    return p61.curDistance
end
function u7.SetCameraToSubjectDistance(p62, p63) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if u5.LocalPlayer then
        local v64 = p62.minDistance
        local v65 = p62.maxDistance
        p62.currentSubjectDistance = math.clamp(p63, v64, v65)
        local v66 = p62.currentSubjectDistance
        local v67 = p62.FIRST_PERSON_DISTANCE_THRESHOLD
        p62.currentSubjectDistance = math.max(v66, v67)
    end
    p62.inFirstPerson = false
    p62:UpdateMouseBehavior()
    return p62.currentSubjectDistance
end
function u7.CalculateNewLookVector(p68, p69, p70) --[[ Line: 211 ]]
    local v71 = p69 or p68:GetCameraLookVector()
    local v72 = v71.Y
    local v73 = math.asin(v72)
    local v74 = p70.Y
    local v75 = v73 - 1.3962634015954636
    local v76 = v73 - -1.3962634015954636
    local v77 = math.clamp(v74, v75, v76)
    local v78 = Vector2.new(p70.X, v77)
    local v79 = CFrame.new(Vector3.new(0, 0, 0), v71)
    return (CFrame.Angles(0, -v78.X, 0) * v79 * CFrame.Angles(-v78.Y, 0, 0)).LookVector
end
function u7.Update(p80, p81) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v82 = tick()
    local v83 = v82 - p80.lastUpdate
    local v84 = u4.getRotation(p81) ~= Vector2.new()
    local v85 = workspace.CurrentCamera
    local v86 = v85.CFrame
    local v87 = v85.Focus
    local v88 = u5.LocalPlayer
    local v89
    if v85 then
        v89 = v85.CameraSubject
    else
        v89 = v85
    end
    local v90
    if v89 then
        v90 = v89:IsA("VehicleSeat")
    else
        v90 = v89
    end
    local v91
    if v89 then
        v91 = v89:IsA("SkateboardPlatform")
    else
        v91 = v89
    end
    if p80.lastUpdate == nil or v83 > 1 then
        p80.lastCameraTransform = nil
    end
    if v84 then
        p80.lastUserPanCamera = tick()
    end
    local v92 = p80:GetSubjectPosition()
    if v92 and (v88 and v85) then
        if p80.gamepadDollySpeedMultiplier ~= 1 then
            p80:SetCameraToSubjectDistance(p80.currentSubjectDistance * p80.gamepadDollySpeedMultiplier)
        end
        v87 = CFrame.new(v92)
        local v93 = u4.getRotation(p81)
        p80.curAzimuthRad = p80.curAzimuthRad - v93.X
        if p80.useAzimuthLimits then
            local v94 = p80.curAzimuthRad
            local v95 = p80.minAzimuthAbsoluteRad
            local v96 = p80.maxAzimuthAbsoluteRad
            p80.curAzimuthRad = math.clamp(v94, v95, v96)
        else
            local v97
            if p80.curAzimuthRad == 0 then
                v97 = 0
            else
                local v98 = p80.curAzimuthRad
                local v99 = math.sign(v98)
                local v100 = p80.curAzimuthRad
                v97 = v99 * (math.abs(v100) % 6.283185307179586) or 0
            end
            p80.curAzimuthRad = v97
        end
        local v101 = p80.curElevationRad + v93.Y
        local v102 = p80.minElevationRad
        local v103 = p80.maxElevationRad
        p80.curElevationRad = math.clamp(v101, v102, v103)
        local v104 = v92 + p80.currentSubjectDistance * (CFrame.fromEulerAnglesYXZ(-p80.curElevationRad, p80.curAzimuthRad, 0) * Vector3.new(0, 0, 1))
        v86 = CFrame.new(v104, v92)
        p80.lastCameraTransform = v86
        p80.lastCameraFocus = v87
        if (v90 or v91) and v89:IsA("BasePart") then
            p80.lastSubjectCFrame = v89.CFrame
        else
            p80.lastSubjectCFrame = nil
        end
    end
    p80.lastUpdate = v82
    return v86, v87
end
return u7