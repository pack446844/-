local u1 = require(script.Parent.ConnectionUtil)
local u2 = {}
u2.__index = u2
function u2.new() --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v3 = {
        ["_camera"] = game.Workspace.CurrentCamera,
        ["_callbacks"] = {},
        ["_connectionUtil"] = u1.new(),
        ["_enabled"] = false
    }
    local v4 = u2
    return setmetatable(v3, v4)
end
function u2._connectCallbacks(p5) --[[ Line: 52 ]]
    p5._camera = game.Workspace.CurrentCamera
    if p5._camera then
        for v6, v7 in p5._callbacks do
            p5._connectionUtil:trackConnection(v6, p5._camera:GetPropertyChangedSignal(v6):Connect(v7))
            v7()
        end
    end
end
function u2.Enable(u8) --[[ Line: 65 ]]
    if not u8._enabled then
        u8._enabled = true
        u8._cameraChangedConnection = game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8:_connectCallbacks()
        end)
        u8:_connectCallbacks()
    end
end
function u2.Disable(p9) --[[ Line: 79 ]]
    if p9._enabled then
        p9._enabled = false
        if p9._cameraChangedConnection then
            p9._cameraChangedConnection:Disconnect()
            p9._cameraChangedConnection = nil
        end
        p9._connectionUtil:disconnectAll()
    end
end
function u2.Connect(p10, p11, p12) --[[ Line: 94 ]]
    p10._callbacks[p11] = p12
    if p10._camera then
        p10._connectionUtil:trackConnection(p11, p10._camera:GetPropertyChangedSignal(p11):Connect(p12))
    end
end
function u2.Disconnect(p13, p14) --[[ Line: 104 ]]
    p13._connectionUtil:disconnect(p14)
    p13._callbacks[p14] = nil
end
function u2.getCamera(p15) --[[ Line: 110 ]]
    return p15._camera
end
return u2