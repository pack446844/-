local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = game:GetService("RunService")
local v5 = v2.Shared.Net
local u6 = require(v2.Shared.Defs.PotionConfig)
local u7 = v5:WaitForChild("PotionUseRequest")
local v8 = v5:WaitForChild("PotionUseAck")
local u9 = v1.LocalPlayer
local u10 = u9:WaitForChild("PlayerGui")
local u11 = require(v2.Shared.Util.PlatformGui)
local u12 = {
    ["hud"] = nil,
    ["slot"] = nil
}
local u13 = nil
local u14 = 0
local function u23() --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v15 = u9
    local v16 = tonumber(v15:GetAttribute("JailedRemainingSeconds")) or 0
    local v17 = math.floor(v16)
    local v18 = math.max(0, v17)
    if v18 > 0 then
        return v18
    end
    local v19 = u9
    local v20 = tonumber(v19:GetAttribute("JailedUntil")) or 0
    local v21 = math.floor(v20)
    local v22 = math.max(0, v21) - os.time()
    return math.max(0, v22)
end
local function u27(p24) --[[ Line: 33 ]]
    if not p24 then
        return nil
    end
    local v25 = p24:FindFirstChild("CooldownLabel")
    if v25 and v25:IsA("TextLabel") then
        return v25
    end
    local v26 = Instance.new("TextLabel")
    v26.Name = "CooldownLabel"
    v26.BackgroundTransparency = 1
    v26.Size = UDim2.new(1, 0, 1, 0)
    v26.Position = UDim2.new(0, 0, 0, 0)
    v26.ZIndex = (p24.ZIndex or 1) + 5
    v26.Font = Enum.Font.GothamBold
    v26.TextColor3 = Color3.fromRGB(255, 255, 255)
    v26.TextStrokeTransparency = 0
    v26.TextScaled = true
    v26.Visible = false
    v26.Parent = p24
    return v26
end
local function u35() --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u27
        [3] = u13
    --]]
    local v28 = u12.slot
    if v28 then
        local v29 = u27(v28)
        if u13 then
            local v30 = u13.finishAt - workspace:GetServerTimeNow()
            if v30 <= 0.05 then
                u13 = nil
                local v31 = u12.slot
                if v31 then
                    local v32 = u27(v31)
                    if v32 then
                        v32.Visible = false
                        v32.Text = ""
                    end
                    if v31:IsA("GuiButton") then
                        v31.AutoButtonColor = true
                    end
                end
            else
                local v33 = string.format
                local v34 = v30 * 10
                v29.Text = v33("%.1fs", math.ceil(v34) / 10)
                v29.Visible = true
                if v28:IsA("GuiButton") then
                    v28.AutoButtonColor = false
                end
                if v28:IsA("TextButton") or v28:IsA("ImageButton") then
                    v28.Active = true
                end
                return
            end
        else
            if v29 then
                v29.Visible = false
                v29.Text = ""
            end
            if v28:IsA("GuiButton") then
                v28.AutoButtonColor = true
            end
            return
        end
    else
        return
    end
end
local function u42(p36, p37) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u27
        [4] = u35
    --]]
    local v38 = tonumber(p36) or 0
    local v39 = tonumber(p37) or workspace:GetServerTimeNow()
    if v38 <= 0 then
        u13 = nil
        local v40 = u12.slot
        if v40 then
            local v41 = u27(v40)
            if v41 then
                v41.Visible = false
                v41.Text = ""
            end
            if v40:IsA("GuiButton") then
                v40.AutoButtonColor = true
            end
        end
    else
        u13 = {
            ["finishAt"] = v39 + v38
        }
        u35()
        return
    end
end
local function u45() --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u3
        [4] = u9
        [5] = u23
        [6] = u7
    --]]
    local v43 = os.clock()
    if v43 - u14 < u6.CLIENT_REQUEST_COOLDOWN then
        return
    elseif u3:GetFocusedTextBox() then
        return
    elseif u9:GetAttribute("IsJailed") == true and true or u23() > 0 then
        return
    else
        local v44 = u9.Character
        if v44 then
            v44 = v44:FindFirstChildOfClass("Humanoid")
        end
        if v44 and v44.Health > 0 then
            u14 = v43
            u7:FireServer()
        end
    end
end
local function u47(p46) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u45
    --]]
    if p46 and p46:IsA("GuiButton") then
        u27(p46)
        if p46:GetAttribute("PotionBound") ~= true then
            p46:SetAttribute("PotionBound", true)
            p46.Activated:Connect(function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                u45()
            end)
        end
    end
end
local function u49() --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u12
        [4] = u47
        [5] = u35
    --]]
    local v48 = u11.wait(u10, "MainHUD", 2) or u11.find(u10, "MainHUD") or (u10:FindFirstChild("MainHUD") or u10:FindFirstChild("MainHUD_Mobile"))
    if not v48 then
        u12.hud = nil
        u12.slot = nil
        return false
    end
    u12.hud = v48
    u12.slot = v48:FindFirstChild("PotionSlot", true)
    if not u12.slot then
        warn("[PotionController] active HUD PotionSlot button not found")
        return false
    end
    u47(u12.slot)
    u35()
    return true
end
task.defer(function() --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u49
    --]]
    if not u11.waitUntilReady(5) then
        warn("[PotionController] platform ready timeout, using fallback HUD bind")
    end
    u49()
end)
u11.modeChanged:Connect(function() --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u49
    --]]
    task.defer(u49)
end)
u10.ChildAdded:Connect(function(p50) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u49
    --]]
    if p50 and (p50.Name == "MainHUD" or p50.Name == "MainHUD_Mobile") then
        task.defer(u49)
    end
end)
u3.InputBegan:Connect(function(p51, p52) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u45
    --]]
    if not (p52 or u3:GetFocusedTextBox()) then
        if p51.KeyCode == Enum.KeyCode.R then
            u45()
        end
    end
end)
v8.OnClientEvent:Connect(function(p53) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    if p53 then
        u42(p53.cooldown, p53.startedAt)
    end
end)
v4.RenderStepped:Connect(function() --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u35
    --]]
    if u13 then
        u35()
    end
end)
print("[PotionController] initialized")