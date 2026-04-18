local v1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("StarterGui")
local u5 = v3.Shared.Net
local v6 = require(v3.Shared.Defs.CombatConfig)
local u7 = require(v3.Shared.Util.MobileTargeting)
local u8 = v1.LocalPlayer
local u9 = u8:WaitForChild("PlayerScripts")
local u10 = v6.CLIENT_ATTACK_REQUEST_COOLDOWN or 0.1
local u11 = 0
local u12 = nil
v4:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local function u21() --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v13 = u8
    local v14 = tonumber(v13:GetAttribute("JailedRemainingSeconds")) or 0
    local v15 = math.floor(v14)
    local v16 = math.max(0, v15)
    if v16 > 0 then
        return v16
    end
    local v17 = u8
    local v18 = tonumber(v17:GetAttribute("JailedUntil")) or 0
    local v19 = math.floor(v18)
    local v20 = math.max(0, v19) - os.time()
    return math.max(0, v20)
end
local function u28() --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
    --]]
    if u12 then
        return u12
    end
    local v22 = u9:FindFirstChild("PlayerModule")
    if not v22 then
        return nil
    end
    local v23, v24 = pcall(require, v22)
    if v23 and type(v24) == "table" then
        local v25 = v24.GetControls
        if type(v25) == "function" then
            local v26, v27 = pcall(v24.GetControls, v24)
            if not v26 then
                return nil
            end
            u12 = v27
            return u12
        end
    end
    return nil
end
local function u30() --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u8
        [3] = u21
    --]]
    local v29 = u28()
    if v29 then
        if u8:GetAttribute("IsJailed") == true and true or u21() > 0 then
            v29:Disable()
        else
            v29:Enable()
        end
    else
        return
    end
end
local function u33() --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u2
        [4] = u8
        [5] = u21
        [6] = u5
    --]]
    local v31 = os.clock()
    if v31 - u11 < u10 then
        return
    elseif u2:GetFocusedTextBox() then
        return
    elseif u8:GetAttribute("IsJailed") == true and true or u21() > 0 then
        return
    else
        local v32 = u8.Character
        if v32 then
            v32 = v32:FindFirstChildOfClass("Humanoid")
        end
        if v32 and v32.Health > 0 then
            u11 = v31
            u5.AttackRequest:FireServer()
        end
    end
end
local function u46(p34) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if type(p34) ~= "table" then
        return false
    end
    local u35 = u8:FindFirstChildOfClass("PlayerGui")
    if not u35 then
        return false
    end
    local function v37(p36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        while p36 and p36 ~= u35 do
            if p36:IsA("GuiButton") or (p36:IsA("TextBox") or p36:IsA("ScrollingFrame")) then
                return true
            end
            if p36:IsA("GuiObject") and p36.Active == true then
                return true
            end
            p36 = p36.Parent
        end
        return false
    end
    for _, v38 in ipairs(p34) do
        local v39 = v38.X
        local v40 = tonumber(v39) or -1
        local v41 = math.floor(v40)
        local v42 = v38.Y
        local v43 = tonumber(v42) or -1
        local v44 = math.floor(v43)
        if v41 >= 0 and v44 >= 0 then
            for _, v45 in ipairs(u35:GetGuiObjectsAtPosition(v41, v44)) do
                if v45.Visible and v37(v45) then
                    return true
                end
            end
        end
    end
    return false
end
u2.InputBegan:Connect(function(p47, p48) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    if not p48 then
        if p47.UserInputType == Enum.UserInputType.MouseButton1 then
            u33()
        end
    end
end)
u2.TouchTap:Connect(function(p49, p50) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u21
        [4] = u46
        [5] = u33
    --]]
    if p50 then
        return
    elseif u2:GetFocusedTextBox() then
        return
    elseif u8:GetAttribute("IsJailed") == true and true or u21() > 0 then
        return
    elseif not u46(p49) then
        u33()
    end
end)
u8:GetAttributeChangedSignal("JailedRemainingSeconds"):Connect(u30)
u8:GetAttributeChangedSignal("IsJailed"):Connect(u30)
u8:GetAttributeChangedSignal("JailedUntil"):Connect(u30)
u8.CharacterAdded:Connect(function() --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u30
    --]]
    u7.clearTarget()
    task.delay(0.15, u30)
end)
task.defer(u30)
print("[InputController] \236\180\136\234\184\176\237\153\148 \236\153\132\235\163\140")