local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Dev.JestGlobals)
local v3 = v2.describe
local u4 = v2.expect
local u5 = v2.it
local u6 = require(v1.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
local u7 = require(script.Parent.CameraWrapper)
v3("CameraWrapper", function() --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u6
    --]]
    u5("should instantiate", function() --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
        --]]
        u4((u7.new())).never.toBeNil()
    end)
    u5("should return updated camera", function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u6
        --]]
        local v8 = u7.new()
        v8:Enable()
        local v9 = Instance.new("Camera")
        v9.Parent = game.Workspace
        u4(v8:getCamera()).toBe(game.Workspace.CurrentCamera)
        u4(v8:getCamera()).never.toBe(v9)
        game.Workspace.CurrentCamera = v9
        u6()
        u4(v8:getCamera()).toBe(game.Workspace.CurrentCamera)
        u4(v8:getCamera()).toBe(v9)
    end)
end)