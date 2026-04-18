local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Debris")
local v4 = v1.Shared.Net
local u5 = require(v1.Shared.Defs.ItemDefs)
local v6 = v4:WaitForChild("RewardPopup")
local v7 = v4:WaitForChild("DamagePopup")
local u8 = Color3.fromRGB(100, 220, 255)
local u9 = Color3.fromRGB(255, 210, 50)
local u10 = Color3.fromRGB(160, 255, 160)
local u11 = Color3.fromRGB(255, 70, 70)
local function u18(p12, p13, p14, p15, p16) --[[ Line: 48 ]]
    local v17 = Instance.new("TextLabel")
    v17.BackgroundTransparency = 1
    v17.Size = UDim2.new(1, 0, 0, p16)
    v17.Position = UDim2.new(0, 0, 0, p13)
    v17.Text = p14
    v17.TextColor3 = p15
    v17.TextScaled = true
    v17.Font = Enum.Font.GothamBold
    v17.TextStrokeTransparency = 0.25
    v17.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v17.Parent = p12
    return v17
end
local function u25(u19, u20, u21, p22) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v23 = u2:Create(u19, TweenInfo.new(u21, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Position"] = u19.Position + Vector3.new(0, p22, 0)
    })
    v23:Play()
    task.delay(u21 * 0.45, function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u2
            [3] = u21
        --]]
        if u20.Parent then
            for _, v24 in ipairs(u20:GetChildren()) do
                if v24:IsA("TextLabel") then
                    u2:Create(v24, TweenInfo.new(u21 * 0.55), {
                        ["TextTransparency"] = 1,
                        ["TextStrokeTransparency"] = 1
                    }):Play()
                end
            end
        end
    end)
    v23.Completed:Connect(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if u19 and u19.Parent then
            u19:Destroy()
        end
    end)
end
local function u45(p26, p27, p28, p29) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
        [4] = u10
        [5] = u3
        [6] = u18
        [7] = u25
    --]]
    local v30 = {}
    if tonumber(p27) and p27 > 0 then
        v30[#v30 + 1] = {
            ["text"] = "\234\178\189\237\151\152\236\185\152 +" .. math.floor(p27),
            ["color"] = u8
        }
    end
    if tonumber(p28) and p28 > 0 then
        v30[#v30 + 1] = {
            ["text"] = "\234\179\168\235\147\156 +" .. math.floor(p28),
            ["color"] = u9
        }
    end
    for _, v31 in ipairs(p29 or {}) do
        local v32
        if v31.itemId then
            v32 = u5[v31.itemId] or nil
        else
            v32 = nil
        end
        local v33 = v32 and v32.displayName
        if not v33 then
            local v34 = v31.itemId or "item"
            v33 = tostring(v34)
        end
        local v35 = #v30 + 1
        local v36 = {}
        local v37 = v31.qty or 1
        v36.text = v33 .. " x" .. tostring(v37)
        v36.color = u10
        v30[v35] = v36
    end
    if #v30 > 0 then
        local v38 = p26 + Vector3.new(0, 3, 0)
        local v39 = Instance.new("Part")
        v39.Name = "FloatingPopupAnchor"
        v39.Anchored = true
        v39.CanCollide = false
        v39.CanQuery = false
        v39.CanTouch = false
        v39.CastShadow = false
        v39.Transparency = 1
        v39.Size = Vector3.new(0.1, 0.1, 0.1)
        v39.Position = v38
        v39.Parent = workspace
        u3:AddItem(v39, 3)
        local v40 = #v30 * 24
        local v41 = math.max(28, v40)
        local v42 = Instance.new("BillboardGui")
        v42.Name = "FloatingPopup"
        v42.Size = UDim2.new(0, 170, 0, v41)
        v42.AlwaysOnTop = true
        v42.LightInfluence = 0
        v42.MaxDistance = 85
        v42.Parent = v39
        local v43 = 0
        for _, v44 in ipairs(v30) do
            u18(v42, v43, v44.text, v44.color, 24)
            v43 = v43 + 24
        end
        u25(v39, v42, 1.8, 6)
    end
end
local function u56(p46, p47) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
        [3] = u11
        [4] = u25
    --]]
    local v48 = tonumber(p47) or 0
    local v49 = math.floor(v48)
    local v50 = math.max(0, v49)
    if v50 > 0 then
        local v51 = math.random(-35, 35) / 100
        local v52 = math.random(-35, 35) / 100
        local v53 = p46 + Vector3.new(v51, 0, v52)
        local v54 = Instance.new("Part")
        v54.Name = "FloatingPopupAnchor"
        v54.Anchored = true
        v54.CanCollide = false
        v54.CanQuery = false
        v54.CanTouch = false
        v54.CastShadow = false
        v54.Transparency = 1
        v54.Size = Vector3.new(0.1, 0.1, 0.1)
        v54.Position = v53
        v54.Parent = workspace
        u3:AddItem(v54, 3)
        local v55 = Instance.new("BillboardGui")
        v55.Name = "FloatingPopup"
        v55.Size = UDim2.new(0, 90, 0, 34)
        v55.AlwaysOnTop = true
        v55.LightInfluence = 0
        v55.MaxDistance = 85
        v55.Parent = v54
        u18(v55, 0, tostring(v50), u11, 34)
        u25(v54, v55, 0.75, 3.8)
    end
end
v6.OnClientEvent:Connect(function(p57) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    if p57 then
        local v58 = p57.position
        if typeof(v58) == "Vector3" then
            u45(p57.position, p57.exp, p57.gold, p57.drops)
            return
        end
    end
end)
v7.OnClientEvent:Connect(function(p59) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u56
    --]]
    if p59 then
        local v60 = p59.position
        if typeof(v60) == "Vector3" then
            u56(p59.position, p59.damage)
            return
        end
    end
end)
print("[RewardPopupUIController] initialized")