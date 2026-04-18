local v1 = script.Parent.Parent:WaitForChild("CommonUtils")
if require(v1:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC") then
    local v2 = game:GetService("Players")
    local v3 = {}
    local u4 = nil
    local u5 = nil
    local u6 = Instance.new("BindableEvent")
    local u7 = nil
    local function v9(p8) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
            [3] = u6
            [4] = u7
        --]]
        u4 = p8:FindFirstChild("AbilityManagerActor")
        u5 = p8:FindFirstChildOfClass("Humanoid")
        while not u5 do
            p8.ChildAdded:wait()
            u5 = p8:FindFirstChildOfClass("Humanoid")
        end
        u6:Fire()
        if u7 then
            u7:Disconnect()
            u7 = nil
        end
        u7 = u5:GetPropertyChangedSignal("EvaluateStateMachine"):Connect(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6:Fire()
        end)
    end
    local v10 = v2.LocalPlayer
    v10.CharacterAdded:Connect(v9)
    if v10.Character then
        v9(v10.Character)
    end
    function v3.isEnabled(_) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
        --]]
        local v11 = u4 ~= nil and u5
        if v11 then
            v11 = not u5.EvaluateStateMachine
        end
        return v11
    end
    function v3.GetEnabledChangedSignal(_) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6.Event
    end
    return v3
end