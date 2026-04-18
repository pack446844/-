local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Defs.LogDefs)
local v6 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v7 = require(v2.Shared.Util.PlatformGui)
local v8 = v7.find(v6, "KillLogGui") or v7.wait(v6, "KillLogGui", 10)
if v8 then
    local u9 = v8:FindFirstChild("LogFrame") or v8:WaitForChild("LogFrame", 5)
    if u9 then
        local u10 = {}
        local function u24(p11) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
                [3] = u9
                [4] = u3
            --]]
            local v12 = p11.logType or "PVP"
            local v13 = u5.Display[v12] or u5.Display.PVP
            local v14 = v13.duration or 6
            while #u10 >= u5.MAX_LOG_ENTRIES do
                local v15 = table.remove(u10, 1)
                if v15 and v15.Parent then
                    v15:Destroy()
                end
            end
            local u16 = Instance.new("Frame")
            u16.Name = "LogEntry"
            u16.Size = UDim2.new(1, 0, 0, 38)
            u16.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
            u16.BackgroundTransparency = 0.2
            u16.BorderSizePixel = 0
            u16.Parent = u9
            local v17 = Instance.new("UICorner")
            v17.CornerRadius = UDim.new(0, 5)
            v17.Parent = u16
            local v18 = Instance.new("TextLabel")
            v18.Size = UDim2.new(0, 55, 1, 0)
            v18.BackgroundTransparency = 1
            v18.Text = v13.prefix
            v18.TextColor3 = v13.prefixColor
            v18.TextScaled = true
            v18.Font = Enum.Font.GothamBold
            v18.Parent = u16
            local v19 = Instance.new("TextLabel")
            v19.Size = UDim2.new(1, -60, 1, 0)
            v19.Position = UDim2.new(0, 58, 0, 0)
            v19.BackgroundTransparency = 1
            v19.Text = (p11.killerName or "?") .. " \226\154\148\239\184\143 " .. (p11.victimName or "?")
            v19.TextColor3 = Color3.fromRGB(255, 255, 255)
            v19.TextScaled = true
            v19.Font = Enum.Font.GothamBold
            v19.TextXAlignment = Enum.TextXAlignment.Left
            v19.Parent = u16
            local v20 = u10
            table.insert(v20, u16)
            task.delay(v14, function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u3
                    [3] = u10
                --]]
                if u16 and u16.Parent then
                    local v21 = u3:Create(u16, TweenInfo.new(0.5), {
                        ["BackgroundTransparency"] = 1
                    })
                    for _, v22 in ipairs(u16:GetDescendants()) do
                        if v22:IsA("TextLabel") then
                            u3:Create(v22, TweenInfo.new(0.5), {
                                ["TextTransparency"] = 1
                            }):Play()
                        end
                    end
                    v21:Play()
                    v21.Completed:Connect(function() --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u16
                        --]]
                        local v23 = table.find(u10, u16)
                        if v23 then
                            table.remove(u10, v23)
                        end
                        if u16 and u16.Parent then
                            u16:Destroy()
                        end
                    end)
                end
            end)
        end
        v4.KillLogBroadcast.OnClientEvent:Connect(function(p25) --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24(p25)
        end)
        print("[KillLogController] \236\180\136\234\184\176\237\153\148 \236\153\132\235\163\140")
    else
        warn("[KillLogController] LogFrame not found in KillLogGui")
    end
else
    warn("[KillLogController] KillLogGui not found in PlayerGui")
    return
end