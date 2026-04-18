local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
local u2 = require(v1:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI2")
local u3 = RaycastParams.new()
u3.FilterType = Enum.RaycastFilterType.Exclude
local u4 = {
    ["spacing"] = 8,
    ["image"] = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
    ["imageSize"] = Vector2.new(2, 2)
}
local u5 = Instance.new("Model")
u5.Name = "PathDisplayPoints"
local v6 = Instance.new("Part")
v6.Anchored = true
v6.CanCollide = false
v6.Transparency = 1
v6.Name = "PathDisplayAdornee"
v6.CFrame = CFrame.new(0, 0, 0)
v6.Parent = u5
local u7 = 30
local u8 = {}
local u9 = {}
local u10 = {}
for v11 = 1, u7 do
    local v12 = Instance.new("ImageHandleAdornment")
    v12.Archivable = false
    v12.Adornee = v6
    v12.Image = u4.image
    v12.Size = u4.imageSize
    u8[v11] = v12
end
local function u22(p13, _) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u2
        [4] = u3
        [5] = u5
    --]]
    if u7 == 0 then
        return nil
    else
        local v14 = u8[1]
        if v14 then
            local v15 = u8
            local v16 = u7
            u8[1] = u8[u7]
            v15[v16] = nil
            u7 = u7 - 1
        else
            v14 = nil
        end
        if u2 then
            u3.FilterDescendantsInstances = { game.Players.LocalPlayer.Character, workspace.CurrentCamera }
            local v17 = workspace:Raycast(p13 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), u3)
            if not v17 then
                return nil
            end
            v14.CFrame = CFrame.lookAlong(v17.Position, v17.Normal)
            v14.Parent = u5
            return v14
        else
            local v18 = Ray.new(p13 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0))
            local v19, v20, v21 = workspace:FindPartOnRayWithIgnoreList(v18, { game.Players.LocalPlayer.Character, workspace.CurrentCamera })
            if not v19 then
                return nil
            end
            v14.CFrame = CFrame.new(v20, v20 + v21)
            v14.Parent = u5
            return v14
        end
    end
end
function u4.setCurrentPoints(p23) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if typeof(p23) == "table" then
        u9 = p23
    else
        u9 = {}
    end
end
function u4.clearRenderedPath() --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u8
        [4] = u5
    --]]
    for _, v24 in ipairs(u10) do
        v24.Parent = nil
        u7 = u7 + 1
        u8[u7] = v24
    end
    u10 = {}
    u5.Parent = nil
end
function u4.renderPath() --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u10
        [4] = u22
        [5] = u5
    --]]
    u4.clearRenderedPath()
    if u9 and #u9 ~= 0 then
        local v25 = #u9
        u10[1] = u22(u9[v25], true)
        if u10[1] then
            local v26 = 0
            while true do
                local v27 = u9[v25]
                local v28 = u9[v25 - 1]
                if v25 < 2 then
                    break
                end
                local v29 = v28 - v27
                local v30 = v29.magnitude
                if v30 < v26 then
                    v26 = v26 - v30
                    v25 = v25 - 1
                else
                    local v31 = u22(v27 + v29.unit * v26, false)
                    if v31 then
                        u10[#u10 + 1] = v31
                    end
                    v26 = v26 + u4.spacing
                end
            end
            u5.Parent = workspace.CurrentCamera
        end
    else
        return
    end
end
return u4