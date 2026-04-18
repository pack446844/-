local u1 = game:GetService("Players")
local v2 = script.Parent
local u3 = {
    ["LOCAL_PLAYER"] = "LOCAL_PLAYER",
    ["ON_LOCAL_PLAYER"] = "ON_LOCAL_PLAYER",
    ["CHARACTER_ADDED"] = "CHARACTER_ADDED",
    ["ON_CHARACTER"] = "ON_CHARACTER",
    ["CHARACTER_CHILD_ADDED"] = "CHARACTER_CHILD_ADDED"
}
local u23 = {
    ["_connectionUtil"] = require(v2:WaitForChild("ConnectionUtil")).new(),
    ["_boundEvents"] = {},
    ["getLocalPlayer"] = function() --[[ Name: getLocalPlayer, Line 53 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.LocalPlayer
    end,
    ["onLocalPlayer"] = function(p4) --[[ Name: onLocalPlayer, Line 57 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u3
            [3] = u1
        --]]
        local v5 = u23.getLocalPlayer()
        if v5 then
            p4(v5)
        end
        u23._connectionUtil:trackConnection(u3.LOCAL_PLAYER, u1:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u3
            --]]
            local v6 = u23.getLocalPlayer()
            assert(v6)
            u23._getOrCreateBoundEvent(u3.LOCAL_PLAYER):Fire(v6)
        end))
        return u23._getOrCreateBoundEvent(u3.LOCAL_PLAYER).Event:Connect(p4)
    end,
    ["getCharacter"] = function() --[[ Name: getCharacter, Line 77 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v7 = u23.getLocalPlayer()
        if v7 then
            return v7.Character
        else
            return nil
        end
    end,
    ["onCharacter"] = function(u8) --[[ Name: onCharacter, Line 85 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u3
        --]]
        u23._connectionUtil:trackConnection(u3.ON_LOCAL_PLAYER, u23.onLocalPlayer(function(p9) --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u8
                [3] = u3
            --]]
            local v10 = u23.getCharacter()
            if v10 then
                u8(v10)
            end
            u23._connectionUtil:trackConnection(u3.CHARACTER_ADDED, p9.CharacterAdded:Connect(function(p11) --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u3
                --]]
                assert(p11)
                u23._getOrCreateBoundEvent(u3.CHARACTER_ADDED):Fire(p11)
            end))
        end))
        return u23._getOrCreateBoundEvent(u3.CHARACTER_ADDED).Event:Connect(u8)
    end,
    ["getChild"] = function(p12, p13) --[[ Name: getChild, Line 110 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v14 = u23.getCharacter()
        if v14 then
            local v15 = v14:FindFirstChild(p12)
            if v15 and v15:IsA(p13) then
                return v15
            else
                return nil
            end
        else
            return nil
        end
    end,
    ["onChild"] = function(u16, u17, u18) --[[ Name: onChild, Line 122 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u3
        --]]
        u23._connectionUtil:trackConnection(u3.ON_CHARACTER, u23.onCharacter(function(p19) --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u16
                [3] = u17
                [4] = u18
                [5] = u3
            --]]
            local v20 = u23.getChild(u16, u17)
            if v20 then
                u18(v20)
            end
            u23._connectionUtil:trackConnection(u3.CHARACTER_CHILD_ADDED, p19.ChildAdded:Connect(function(p21) --[[ Line: 135 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u17
                    [3] = u23
                    [4] = u3
                --]]
                if p21.Name == u16 and p21:IsA(u17) then
                    u23._getOrCreateBoundEvent(u3.CHARACTER_CHILD_ADDED .. u16 .. u17):Fire(p21)
                end
            end))
        end))
        return u23._getOrCreateBoundEvent(u3.CHARACTER_CHILD_ADDED .. u16 .. u17).Event:Connect(u18)
    end,
    ["_getOrCreateBoundEvent"] = function(p22) --[[ Name: _getOrCreateBoundEvent, Line 149 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if not u23._boundEvents[p22] then
            u23._boundEvents[p22] = Instance.new("BindableEvent")
        end
        return u23._boundEvents[p22]
    end
}
return u23