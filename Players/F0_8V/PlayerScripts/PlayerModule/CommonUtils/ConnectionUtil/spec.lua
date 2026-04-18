local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Dev.JestGlobals)
local v3 = v2.describe
local u4 = v2.expect
local u5 = v2.it
local u6 = require(v1.Workspace.Packages.AppCommonLib).Signal
local u7 = require(script.Parent.ConnectionUtil)
v3("ConnectionUtil", function() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u6
    --]]
    u5("should instantiate", function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
        --]]
        u4((u7.new())).never.toBeNil()
    end)
    u5("should track a connection", function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u4
        --]]
        local v8 = u7.new()
        local v9 = u6.new()
        local u10 = ""
        v8:trackConnection("Signal", v9:Connect(function(p11) --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10 = p11
        end))
        v9:fire("Testing")
        u4(u10).toBe("Testing")
    end)
    u5("should disconnect from signal", function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u4
        --]]
        local v12 = u7.new()
        local v13 = u6.new()
        local u14 = ""
        v12:trackConnection("Signal", v13:Connect(function(p15) --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14 = p15
        end))
        v12:disconnect("Signal")
        v13:fire("Testing")
        u4(u14).toBe("")
    end)
    u5("should disconnect from all", function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u4
        --]]
        local v16 = u7.new()
        local v17 = u6.new()
        local v18 = u6.new()
        local v19 = u6.new()
        local u20 = ""
        local u21 = ""
        local u22 = ""
        v16:trackConnection("Signal", v17:Connect(function(p23) --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20 = p23
        end))
        v16:trackConnection("Signal1", v18:Connect(function(p24) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            u21 = p24
        end))
        v16:trackConnection("Signal2", v19:Connect(function(p25) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22 = p25
        end))
        v16:disconnectAll()
        v17:fire("TestingPrimary")
        v17:fire("TestingSecondary")
        v17:fire("TestingTertiary")
        u4(u20).toBe("")
        u4(u21).toBe("")
        u4(u22).toBe("")
    end)
    u5("should call manual disconnect", function() --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
        --]]
        local v26 = u7.new()
        local u27 = ""
        v26:trackBoundFunction("Manual", function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27 = "Disconnected"
        end)
        v26:disconnect("Manual")
        u4(u27).toBe("Disconnected")
    end)
end)