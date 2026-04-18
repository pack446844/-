local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = v1.LocalPlayer
local u4 = v2:WaitForChild("Shared"):WaitForChild("Net"):WaitForChild("ClientReady")
local function u5() --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    if u3 and u3.Parent then
        u3:WaitForChild("PlayerGui")
        u4:FireServer()
    end
end
if game:IsLoaded() then
    task.defer(u5)
else
    game.Loaded:Wait()
    task.defer(u5)
end
u3.CharacterAdded:Connect(function() --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    task.delay(0.15, u5)
end)