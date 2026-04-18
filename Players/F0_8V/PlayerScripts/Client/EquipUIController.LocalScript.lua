local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Defs.ItemDefs)
require(v2.Shared.Util.PlatformGui)
local v6 = v4:WaitForChild("InventorySync")
local u7 = v4:WaitForChild("EquipItemRequest")
local u8 = v4:WaitForChild("UnequipItemRequest")
local u9 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = {}
local u21 = {}
local u22 = {
    ["weapon"] = "",
    ["armor"] = "",
    ["accessory"] = "",
    ["shoes"] = ""
}
local u23 = nil
local u24 = setmetatable({}, {
    ["__mode"] = "k"
})
local u25 = nil
local u26 = {
    "weapon",
    "armor",
    "accessory",
    "shoes"
}
local u27 = {
    ["weapon"] = "\235\172\180\234\184\176 ->",
    ["armor"] = "\235\176\169\236\150\180\234\181\172 ->",
    ["accessory"] = "\236\149\133\236\132\184\236\130\172\235\166\172 ->",
    ["shoes"] = "\236\139\160\235\176\156 ->"
}
local u28 = {
    ["weapon"] = "\235\172\180\234\184\176 \236\132\160\237\131\157",
    ["armor"] = "\235\176\169\236\150\180\234\181\172 \236\132\160\237\131\157",
    ["accessory"] = "\236\149\133\236\132\184\236\130\172\235\166\172 \236\132\160\237\131\157",
    ["shoes"] = "\236\139\160\235\176\156 \236\132\160\237\131\157"
}
local function u36(p29) --[[ Line: 57 ]]
    local v30 = type(p29) == "table" and p29 and p29 or {}
    local v31 = {}
    local v32 = v30.weapon
    v31.weapon = type(v32) == "string" and (v30.weapon or "") or ""
    local v33 = v30.armor
    v31.armor = type(v33) == "string" and (v30.armor or "") or ""
    local v34 = v30.accessory
    v31.accessory = type(v34) == "string" and (v30.accessory or "") or ""
    local v35 = v30.shoes
    v31.shoes = type(v35) == "string" and (v30.shoes or "") or ""
    return v31
end
local function u51(p37) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u5
    --]]
    local v38 = {}
    for v48, v40 in pairs(u21 or {}) do
        local v41 = tonumber(v40) or 0
        local v42 = math.floor(v41)
        if math.max(0, v42) > 0 then
            local v43
            if type(v48) == "string" then
                v43 = u5[v48] or nil
            else
                v43 = nil
            end
            local v44
            if v43 then
                v44 = v43.equipSlot or nil
            else
                v44 = nil
            end
            if v43 and (v43.category == "equipment" and (v44 == p37 or p37 == "weapon" and (not v44 and v43.inventorySection == "weapon"))) then
                local v45 = #v38 + 1
                local v46 = {
                    ["itemId"] = v48
                }
                local v47
                if type(v48) == "string" then
                    v47 = u5[v48] or nil
                else
                    v47 = nil
                end
                if v47 then
                    local v48 = v47.displayName or v48
                end
                v46.displayName = v48
                v38[v45] = v46
            end
        end
    end
    table.sort(v38, function(p49, p50) --[[ Line: 102 ]]
        if p49.displayName == p50.displayName then
            return p49.itemId < p50.itemId
        else
            return p49.displayName < p50.displayName
        end
    end)
    return v38
end
local function u62(p52) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u5
    --]]
    local v53 = u20[p52]
    if v53 then
        local v54 = u22[p52] or ""
        local v55
        if type(v54) == "string" then
            v55 = u5[v54] or nil
        else
            v55 = nil
        end
        local v56 = v55 and v55.icon or ""
        local v57 = type(v56) == "string" and v56 and v56 or ""
        local v58 = v54 ~= ""
        v53.icon.Image = (v57 == "" or not v57) and "" or v57
        v53.icon.BackgroundColor3 = v58 and Color3.fromRGB(240, 240, 240) or Color3.fromRGB(230, 230, 230)
        local v59 = v53.placeholder
        local v60
        if v58 then
            if v57 == "" then
                local v61
                if type(v54) == "string" then
                    v61 = u5[v54] or nil
                else
                    v61 = nil
                end
                if v61 then
                    v54 = v61.displayName or v54
                end
                v60 = v54 or ""
            else
                v60 = ""
            end
        else
            v60 = "\235\185\132\236\150\180 \236\158\136\236\157\140"
        end
        v59.Text = v60
        v53.placeholder.TextColor3 = v58 and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(120, 120, 120)
        v53.clear.Visible = v58
    end
end
local function u64() --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
    --]]
    local v63 = u19:FindFirstChildOfClass("UIListLayout")
    if v63 then
        u18.CanvasSize = UDim2.new(0, 0, 0, v63.AbsoluteContentSize.Y + 8)
    end
end
local function u65() --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u16
    --]]
    u23 = nil
    u16.Visible = false
end
local function u77(u66) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u17
        [3] = u28
        [4] = u19
        [5] = u51
        [6] = u64
        [7] = u7
        [8] = u16
        [9] = u18
    --]]
    u23 = u66
    u17.Text = u28[u66] or "\236\158\165\235\185\132 \236\132\160\237\131\157"
    local v67 = u19
    for _, v68 in ipairs(v67:GetChildren()) do
        v68:Destroy()
    end
    local v69 = u51(u66)
    local v70 = Instance.new("UIListLayout")
    v70.Padding = UDim.new(0, 6)
    v70.SortOrder = Enum.SortOrder.LayoutOrder
    v70.Parent = u19
    v70:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(u64)
    if #v69 == 0 then
        local v71 = Instance.new("TextLabel")
        v71.Size = UDim2.new(1, -4, 0, 34)
        v71.BackgroundTransparency = 1
        v71.Text = "\236\158\165\236\176\169 \234\176\128\235\138\165\237\149\156 \236\149\132\236\157\180\237\133\156\236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164."
        v71.TextSize = 18
        v71.Font = Enum.Font.SourceSansBold
        v71.TextColor3 = Color3.fromRGB(80, 80, 80)
        v71.ZIndex = 42
        v71.Parent = u19
    else
        for _, u72 in ipairs(v69) do
            local v73 = Instance.new("TextButton")
            v73.Name = "Item_" .. u72.itemId
            v73.Size = UDim2.new(1, -4, 0, 36)
            v73.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
            v73.BorderSizePixel = 0
            v73.Text = u72.displayName
            v73.TextSize = 20
            v73.Font = Enum.Font.SourceSansBold
            v73.TextColor3 = Color3.fromRGB(35, 35, 35)
            v73.ZIndex = 42
            v73.Parent = u19
            local v74 = Instance.new("UICorner")
            v74.CornerRadius = UDim.new(0, 6)
            v74.Parent = v73
            local v75 = Instance.new("UIStroke")
            v75.Color = Color3.new(0, 0, 0)
            v75.Thickness = 1
            v75.Parent = v73
            v73.Activated:Connect(function() --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u66
                    [3] = u72
                    [4] = u23
                    [5] = u16
                --]]
                u7:FireServer(u66, u72.itemId)
                u23 = nil
                u16.Visible = false
            end)
        end
    end
    local v76 = u19:FindFirstChildOfClass("UIListLayout")
    if v76 then
        u18.CanvasSize = UDim2.new(0, 0, 0, v76.AbsoluteContentSize.Y + 8)
    end
    u16.Visible = true
end
local function u97(p78, u79) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u22
        [3] = u14
        [4] = u5
        [5] = u15
        [6] = u77
        [7] = u8
        [8] = u23
        [9] = u16
        [10] = u20
    --]]
    local v80 = Instance.new("Frame")
    v80.Name = u79 .. "Slot"
    v80.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v80.BorderSizePixel = 0
    v80.Parent = p78
    local v81 = Instance.new("UICorner")
    v81.CornerRadius = UDim.new(0, 8)
    v81.Parent = v80
    local v82 = Instance.new("UIStroke")
    v82.Color = Color3.new(0, 0, 0)
    v82.Thickness = 1
    v82.Parent = v80
    local v83 = Instance.new("TextLabel")
    v83.Name = "Label"
    v83.BackgroundTransparency = 1
    v83.Text = u27[u79]
    v83.TextColor3 = Color3.fromRGB(35, 35, 35)
    v83.TextSize = 24
    v83.Font = Enum.Font.SourceSansBold
    v83.TextXAlignment = Enum.TextXAlignment.Left
    v83.Parent = v80
    local v84 = Instance.new("ImageButton")
    v84.Name = "IconButton"
    v84.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    v84.BorderSizePixel = 0
    v84.AutoButtonColor = true
    v84.ScaleType = Enum.ScaleType.Fit
    v84.Parent = v80
    local v85 = Instance.new("UICorner")
    v85.CornerRadius = UDim.new(0, 6)
    v85.Parent = v84
    local v86 = Instance.new("UIStroke")
    v86.Color = Color3.new(0, 0, 0)
    v86.Thickness = 1
    v86.Parent = v84
    local v87 = Instance.new("TextLabel")
    v87.Name = "Placeholder"
    v87.BackgroundTransparency = 1
    v87.Size = UDim2.new(1, -8, 1, -8)
    v87.Position = UDim2.new(0, 4, 0, 4)
    v87.Text = "\235\185\132\236\150\180 \236\158\136\236\157\140"
    v87.TextWrapped = true
    v87.TextColor3 = Color3.fromRGB(120, 120, 120)
    v87.TextSize = 18
    v87.Font = Enum.Font.SourceSansBold
    v87.Parent = v84
    local v88 = Instance.new("TextButton")
    v88.Name = "ClearButton"
    v88.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
    v88.BorderSizePixel = 0
    v88.Text = "\237\149\180\236\160\156"
    v88.TextSize = 20
    v88.Font = Enum.Font.SourceSansBold
    v88.TextColor3 = Color3.fromRGB(35, 35, 35)
    v88.Parent = v80
    local v89 = Instance.new("UICorner")
    v89.CornerRadius = UDim.new(0, 6)
    v89.Parent = v88
    v84.Activated:Connect(function() --[[ Line: 228 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u79
            [3] = u14
            [4] = u5
            [5] = u15
            [6] = u77
        --]]
        local v90 = u22[u79] or ""
        if v90 == "" then
            u77(u79)
            return
        elseif type(v90) == "string" and v90 ~= "" then
            local v91 = u14
            local v92
            if type(v90) == "string" then
                v92 = u5[v90] or nil
            else
                v92 = nil
            end
            local v93
            if v92 then
                v93 = v92.displayName or v90
            else
                v93 = v90
            end
            v91.Text = v93
            local v94 = u15
            local v95
            if type(v90) == "string" then
                v95 = u5[v90] or nil
            else
                v95 = nil
            end
            local v96 = v95 and v95.description or ""
            v94.Text = (type(v96) ~= "string" or v96 == "") and "\236\132\164\235\170\133\236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164." or v96
        else
            u14.Text = "\236\149\132\236\157\180\237\133\156 \236\132\164\235\170\133"
            u15.Text = "\236\158\165\236\176\169\235\144\156 \236\149\132\236\157\180\237\133\156 \236\157\180\235\175\184\236\167\128\235\165\188 \235\136\132\235\165\180\235\169\180 \236\132\164\235\170\133\236\157\180 \237\145\156\236\139\156\235\144\169\235\139\136\235\139\164. \235\185\136 \236\185\184\236\157\132 \235\136\132\235\165\180\235\169\180 \236\158\165\236\176\169 \234\176\128\235\138\165\237\149\156 \236\149\132\236\157\180\237\133\156 \235\170\169\235\161\157\236\157\180 \236\151\180\235\166\189\235\139\136\235\139\164."
        end
    end)
    v88.Activated:Connect(function() --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u79
            [3] = u23
            [4] = u16
            [5] = u14
            [6] = u15
            [7] = u22
        --]]
        u8:FireServer(u79)
        u23 = nil
        u16.Visible = false
        if u79 == "weapon" then
            u14.Text = "\236\149\132\236\157\180\237\133\156 \236\132\164\235\170\133"
            u15.Text = "\236\158\165\236\176\169\235\144\156 \236\149\132\236\157\180\237\133\156 \236\157\180\235\175\184\236\167\128\235\165\188 \235\136\132\235\165\180\235\169\180 \236\132\164\235\170\133\236\157\180 \237\145\156\236\139\156\235\144\169\235\139\136\235\139\164. \235\185\136 \236\185\184\236\157\132 \235\136\132\235\165\180\235\169\180 \236\158\165\236\176\169 \234\176\128\235\138\165\237\149\156 \236\149\132\236\157\180\237\133\156 \235\170\169\235\161\157\236\157\180 \236\151\180\235\166\189\235\139\136\235\139\164."
        elseif (u22[u79] or "") ~= "" then
            u14.Text = "\236\149\132\236\157\180\237\133\156 \236\132\164\235\170\133"
            u15.Text = "\236\158\165\236\176\169\235\144\156 \236\149\132\236\157\180\237\133\156 \236\157\180\235\175\184\236\167\128\235\165\188 \235\136\132\235\165\180\235\169\180 \236\132\164\235\170\133\236\157\180 \237\145\156\236\139\156\235\144\169\235\139\136\235\139\164. \235\185\136 \236\185\184\236\157\132 \235\136\132\235\165\180\235\169\180 \236\158\165\236\176\169 \234\176\128\235\138\165\237\149\156 \236\149\132\236\157\180\237\133\156 \235\170\169\235\161\157\236\157\180 \236\151\180\235\166\189\235\139\136\235\139\164."
        end
    end)
    u20[u79] = {
        ["frame"] = v80,
        ["label"] = v83,
        ["icon"] = v84,
        ["placeholder"] = v87,
        ["clear"] = v88
    }
    return v80
end
local function u125() --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u3
        [3] = u12
        [4] = u13
        [5] = u26
        [6] = u20
        [7] = u14
        [8] = u15
        [9] = u16
        [10] = u17
        [11] = u18
        [12] = u19
    --]]
    if not u11 then
        return
    end
    local v98
    if u3.TouchEnabled then
        local v99 = workspace.CurrentCamera
        local v100 = v99 and v99.ViewportSize or Vector2.new(1920, 1080)
        local v101 = v100.X
        local v102 = v100.Y
        v98 = math.min(v101, v102) <= 900
    else
        v98 = false
    end
    local v103 = v98 and 350 or 520
    local v104 = v98 and 310 or 430
    u11.Size = UDim2.new(0, v103, 0, v104)
    local v105 = u11
    if v98 then
        local v106 = UDim2.new
        local v107 = v103 * 0.5
        v124 = v106(0.5, -math.floor(v107), 0.18, 0)
        if v124 then
            ::l19::
            v105.Position = v124
            u12.Position = UDim2.new(0, 12, 0, 8)
            u12.Size = UDim2.new(1, -90, 0, 34)
            u13.Size = UDim2.new(0, 64, 0, 30)
            u13.Position = UDim2.new(1, -76, 0, 10)
            local v108 = v98 and 78 or 92
            local v109 = v104 - 48 - v108 - 18
            local v110 = v109 < 160 and 160 or v109
            if v98 then
                local v111 = (v103 - 36) / 2
                local v112 = (v110 - 10) / 2
                local v113 = {
                    ["weapon"] = {
                        ["x"] = 12,
                        ["y"] = 48
                    },
                    ["armor"] = {
                        ["x"] = 24 + v111,
                        ["y"] = 48
                    },
                    ["accessory"] = {
                        ["x"] = 12,
                        ["y"] = 48 + v112 + 10
                    },
                    ["shoes"] = {
                        ["x"] = 24 + v111,
                        ["y"] = 48 + v112 + 10
                    }
                }
                for _, v114 in ipairs(u26) do
                    local v115 = u20[v114]
                    local v116 = v113[v114]
                    v115.frame.Size = UDim2.new(0, v111, 0, v112)
                    v115.frame.Position = UDim2.new(0, v116.x, 0, v116.y)
                    v115.label.Size = UDim2.new(0, 74, 0, 24)
                    v115.label.Position = UDim2.new(0, 8, 0, 8)
                    v115.label.TextSize = 20
                    v115.icon.Size = UDim2.new(0, 42, 0, 42)
                    v115.icon.Position = UDim2.new(0, 88, 0, 8)
                    v115.placeholder.TextSize = 14
                    v115.clear.Size = UDim2.new(0, 48, 0, 22)
                    v115.clear.Position = UDim2.new(1, -56, 1, -28)
                    v115.clear.TextSize = 16
                end
                u14.Position = UDim2.new(0, 12, 1, -v108 - 4)
                u14.Size = UDim2.new(1, -24, 0, 24)
                u14.TextSize = 21
                u15.Position = UDim2.new(0, 12, 1, -v108 + 24)
                u15.Size = UDim2.new(1, -24, 0, v108 - 30)
                u15.TextSize = 16
                u16.Size = UDim2.new(1, -20, 0, v110 + 20)
                u16.Position = UDim2.new(0, 10, 0, 42)
            else
                for v117, v118 in ipairs(u26) do
                    local v119 = u20[v118]
                    v119.frame.Size = UDim2.new(1, -24, 0, 68)
                    v119.frame.Position = UDim2.new(0, 12, 0, 48 + (v117 - 1) * 76)
                    v119.label.Size = UDim2.new(0, 130, 1, 0)
                    v119.label.Position = UDim2.new(0, 12, 0, 0)
                    v119.label.TextSize = 24
                    v119.icon.Size = UDim2.new(0, 58, 0, 58)
                    v119.icon.Position = UDim2.new(0, 138, 0, 5)
                    v119.placeholder.TextSize = 16
                    v119.clear.Size = UDim2.new(0, 72, 0, 34)
                    v119.clear.Position = UDim2.new(1, -84, 0.5, -17)
                    v119.clear.TextSize = 20
                end
                u14.Position = UDim2.new(0, 12, 1, -v108)
                u14.Size = UDim2.new(1, -24, 0, 26)
                u14.TextSize = 23
                u15.Position = UDim2.new(0, 12, 1, -v108 + 26)
                u15.Size = UDim2.new(1, -24, 0, v108 - 34)
                u15.TextSize = 18
                u16.Size = UDim2.new(1, -28, 1, -56)
                u16.Position = UDim2.new(0, 14, 0, 44)
            end
            u17.Position = UDim2.new(0, 12, 0, 8)
            u17.Size = UDim2.new(1, -88, 0, 28)
            u17.TextSize = 24
            local v120 = u16:FindFirstChild("OverlayClose")
            if v120 then
                v120.Position = UDim2.new(1, -72, 0, 8)
            end
            u18.Position = UDim2.new(0, 12, 0, 44)
            u18.Size = UDim2.new(1, -24, 1, -56)
            local v121 = u19:FindFirstChildOfClass("UIListLayout")
            if v121 then
                u18.CanvasSize = UDim2.new(0, 0, 0, v121.AbsoluteContentSize.Y + 8)
            end
        end
    end
    local v122 = UDim2.new
    local v123 = v103 * 0.5
    local v124 = v122(0.5, -math.floor(v123), 0.16, 0)
    goto l19
end
local function u143() --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u11
        [4] = u12
        [5] = u13
        [6] = u23
        [7] = u16
        [8] = u26
        [9] = u97
        [10] = u14
        [11] = u15
        [12] = u17
        [13] = u65
        [14] = u18
        [15] = u19
        [16] = u125
    --]]
    if not (u10 and u10.Parent) then
        u10 = Instance.new("ScreenGui")
        u10.Name = "EquipGui"
        u10.ResetOnSpawn = false
        u10.IgnoreGuiInset = true
        u10.DisplayOrder = 215
        u10.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        u10.Enabled = false
        u10.Parent = u9
        u11 = Instance.new("Frame")
        u11.Name = "EquipBox"
        u11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        u11.BorderSizePixel = 0
        u11.Parent = u10
        local v126 = u11
        local v127 = Instance.new("UICorner")
        v127.CornerRadius = UDim.new(0, 8)
        v127.Parent = v126
        local v128 = u11
        local v129 = Instance.new("UIStroke")
        v129.Color = Color3.new(0, 0, 0)
        v129.Thickness = 1
        v129.Parent = v128
        u12 = Instance.new("TextLabel")
        u12.Name = "Title"
        u12.BackgroundTransparency = 1
        u12.Text = "\236\158\165\235\185\132"
        u12.TextColor3 = Color3.fromRGB(35, 35, 35)
        u12.TextXAlignment = Enum.TextXAlignment.Left
        u12.TextSize = 28
        u12.Font = Enum.Font.SourceSansBold
        u12.Parent = u11
        u13 = Instance.new("TextButton")
        u13.Name = "CloseBtn"
        u13.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
        u13.BorderSizePixel = 0
        u13.Text = "\235\139\171\234\184\176"
        u13.TextColor3 = Color3.fromRGB(35, 35, 35)
        u13.TextSize = 20
        u13.Font = Enum.Font.SourceSansBold
        u13.Parent = u11
        local v130 = u13
        local v131 = Instance.new("UICorner")
        v131.CornerRadius = UDim.new(0, 6)
        v131.Parent = v130
        u13.Activated:Connect(function() --[[ Line: 360 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u23
                [3] = u16
            --]]
            u10.Enabled = false
            u23 = nil
            u16.Visible = false
        end)
        for _, v132 in ipairs(u26) do
            u97(u11, v132)
        end
        u14 = Instance.new("TextLabel")
        u14.Name = "DescTitle"
        u14.BackgroundTransparency = 1
        u14.TextColor3 = Color3.fromRGB(35, 35, 35)
        u14.TextXAlignment = Enum.TextXAlignment.Left
        u14.Font = Enum.Font.SourceSansBold
        u14.Parent = u11
        u15 = Instance.new("TextLabel")
        u15.Name = "DescBody"
        u15.BackgroundTransparency = 1
        u15.TextColor3 = Color3.fromRGB(60, 60, 60)
        u15.TextWrapped = true
        u15.TextYAlignment = Enum.TextYAlignment.Top
        u15.TextXAlignment = Enum.TextXAlignment.Left
        u15.Font = Enum.Font.SourceSans
        u15.Parent = u11
        u16 = Instance.new("Frame")
        u16.Name = "SelectOverlay"
        u16.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
        u16.BorderSizePixel = 0
        u16.ZIndex = 40
        u16.Visible = false
        u16.Parent = u11
        local v133 = u16
        local v134 = Instance.new("UICorner")
        v134.CornerRadius = UDim.new(0, 8)
        v134.Parent = v133
        local v135 = u16
        local v136 = Instance.new("UIStroke")
        v136.Color = Color3.new(0, 0, 0)
        v136.Thickness = 1
        v136.Parent = v135
        u17 = Instance.new("TextLabel")
        u17.Name = "OverlayTitle"
        u17.BackgroundTransparency = 1
        u17.TextColor3 = Color3.fromRGB(35, 35, 35)
        u17.TextXAlignment = Enum.TextXAlignment.Left
        u17.Font = Enum.Font.SourceSansBold
        u17.ZIndex = 41
        u17.Parent = u16
        local v137 = Instance.new("TextButton")
        v137.Name = "OverlayClose"
        v137.Size = UDim2.new(0, 60, 0, 28)
        v137.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
        v137.BorderSizePixel = 0
        v137.Text = "\235\139\171\234\184\176"
        v137.TextColor3 = Color3.fromRGB(35, 35, 35)
        v137.TextSize = 18
        v137.Font = Enum.Font.SourceSansBold
        v137.ZIndex = 41
        v137.Parent = u16
        local v138 = Instance.new("UICorner")
        v138.CornerRadius = UDim.new(0, 6)
        v138.Parent = v137
        v137.Activated:Connect(u65)
        u18 = Instance.new("ScrollingFrame")
        u18.Name = "OverlayScroll"
        u18.BackgroundColor3 = Color3.fromRGB(242, 242, 242)
        u18.BorderSizePixel = 0
        u18.ScrollBarThickness = 8
        u18.CanvasSize = UDim2.new(0, 0, 0, 0)
        u18.ZIndex = 41
        u18.Parent = u16
        local v139 = u18
        local v140 = Instance.new("UICorner")
        v140.CornerRadius = UDim.new(0, 6)
        v140.Parent = v139
        local v141 = u18
        local v142 = Instance.new("UIStroke")
        v142.Color = Color3.new(0, 0, 0)
        v142.Thickness = 1
        v142.Parent = v141
        u19 = Instance.new("Frame")
        u19.Name = "OverlayList"
        u19.BackgroundTransparency = 1
        u19.Size = UDim2.new(1, -8, 0, 0)
        u19.Position = UDim2.new(0, 4, 0, 4)
        u19.ZIndex = 42
        u19.Parent = u18
        u14.Text = "\236\149\132\236\157\180\237\133\156 \236\132\164\235\170\133"
        u15.Text = "\236\158\165\236\176\169\235\144\156 \236\149\132\236\157\180\237\133\156 \236\157\180\235\175\184\236\167\128\235\165\188 \235\136\132\235\165\180\235\169\180 \236\132\164\235\170\133\236\157\180 \237\145\156\236\139\156\235\144\169\235\139\136\235\139\164. \235\185\136 \236\185\184\236\157\132 \235\136\132\235\165\180\235\169\180 \236\158\165\236\176\169 \234\176\128\235\138\165\237\149\156 \236\149\132\236\157\180\237\133\156 \235\170\169\235\161\157\236\157\180 \236\151\180\235\166\189\235\139\136\235\139\164."
        u125()
    end
end
local function u147() --[[ Line: 451 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u24
        [3] = u143
        [4] = u10
        [5] = u125
        [6] = u26
        [7] = u62
        [8] = u23
        [9] = u16
    --]]
    for _, v144 in ipairs({ "MainHUD", "MainHUD_Mobile" }) do
        local v145 = u9:FindFirstChild(v144)
        if v145 then
            v145 = v145:FindFirstChild("BtnEquip")
        end
        if v145 and (v145:IsA("GuiButton") and v145) then
            if not u24[v145] then
                u24[v145] = true
                v145.Activated:Connect(function() --[[ Line: 440 ]]
                    --[[
                    Upvalues:
                        [1] = u143
                        [2] = u10
                        [3] = u125
                        [4] = u26
                        [5] = u62
                        [6] = u23
                        [7] = u16
                    --]]
                    u143()
                    u10.Enabled = not u10.Enabled
                    if u10.Enabled then
                        u125()
                        for _, v146 in ipairs(u26) do
                            u62(v146)
                        end
                    else
                        u23 = nil
                        u16.Visible = false
                    end
                end)
            end
        end
    end
end
local function v154(p148) --[[ Line: 458 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
        [3] = u36
        [4] = u10
        [5] = u26
        [6] = u62
        [7] = u23
        [8] = u16
        [9] = u77
    --]]
    if type(p148) == "table" then
        local v149 = p148.inventory
        if type(v149) == "table" then
            u21 = p148.inventory
        end
        local v150 = p148.equipment
        if type(v150) == "table" then
            u22 = u36(p148.equipment)
        elseif p148.equippedWeapon ~= nil then
            local v151 = u22
            local v152 = p148.equippedWeapon
            v151.weapon = type(v152) == "string" and (p148.equippedWeapon or "") or ""
        end
        if u10 and u10.Enabled then
            for _, v153 in ipairs(u26) do
                u62(v153)
            end
        end
        if u23 and u16.Visible then
            u77(u23)
        end
    end
end
u143()
u147()
local v155 = workspace.CurrentCamera
if u25 then
    u25:Disconnect()
    u25 = nil
end
if v155 then
    u25 = v155:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 473 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u125
        --]]
        if u10 and u10.Enabled then
            u125()
        end
    end)
end
u9.ChildAdded:Connect(function(p156) --[[ Line: 482 ]]
    --[[
    Upvalues:
        [1] = u147
    --]]
    if p156 and (p156.Name == "MainHUD" or p156.Name == "MainHUD_Mobile") then
        task.defer(u147)
    end
end)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u10
        [3] = u125
    --]]
    local v157 = workspace.CurrentCamera
    if u25 then
        u25:Disconnect()
        u25 = nil
    end
    if v157 then
        u25 = v157:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 473 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u125
            --]]
            if u10 and u10.Enabled then
                u125()
            end
        end)
    end
    if u10 and u10.Enabled then
        u125()
    end
end)
v4.DataSync.OnClientEvent:Connect(v154)
v6.OnClientEvent:Connect(v154)
u3.InputBegan:Connect(function(p158, p159) --[[ Line: 492 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u143
        [3] = u10
        [4] = u125
        [5] = u26
        [6] = u62
        [7] = u23
        [8] = u16
    --]]
    if p159 then
        return
    elseif u3:GetFocusedTextBox() then
        return
    elseif p158.UserInputType == Enum.UserInputType.Keyboard then
        if p158.KeyCode == Enum.KeyCode.U then
            u143()
            u10.Enabled = not u10.Enabled
            if u10.Enabled then
                u125()
                for _, v160 in ipairs(u26) do
                    u62(v160)
                end
            else
                u23 = nil
                u16.Visible = false
            end
        else
            return
        end
    else
        return
    end
end)
print("[EquipUIController] initialized")