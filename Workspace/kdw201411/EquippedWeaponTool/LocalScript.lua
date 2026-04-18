local u1 = script.Parent
local u2 = false
u1.Activated:Connect(function() --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    if not u2 then
        u2 = true
        local v3 = Instance.new("StringValue")
        v3.Name = "toolanim"
        v3.Value = "Slash"
        v3.Parent = u1
        task.delay(0.35, function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2 = false
        end)
    end
end)