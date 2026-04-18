local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("UserInputService")
local v4 = v2.Shared.Net
local u5 = require(v2.Shared.Defs.GuildConfig)
local u6 = v4:WaitForChild("GuildActionRequest")
local v7 = v4:WaitForChild("GuildSync")
local v8 = v4:WaitForChild("GuildNotice")
local u9 = v1.LocalPlayer:WaitForChild("PlayerGui")
local u10 = require(v2.Shared.Util.PlatformGui)
local u11 = u5.ACTION_SEARCH or "search"
local u12 = {
    ["guildListGui"] = nil,
    ["guildListBox"] = nil,
    ["guildListHeader"] = nil,
    ["guildListTitle"] = nil,
    ["guildListClose"] = nil,
    ["guildListCreate"] = nil,
    ["guildListSearchInput"] = nil,
    ["guildListSearchBtn"] = nil,
    ["guildListScroll"] = nil,
    ["guildListEmpty"] = nil,
    ["guildRowTemplate"] = nil,
    ["createModal"] = nil,
    ["createTitle"] = nil,
    ["createCost"] = nil,
    ["createInput"] = nil,
    ["createConfirm"] = nil,
    ["createCancel"] = nil,
    ["guildGui"] = nil,
    ["guildBox"] = nil,
    ["guildHeader"] = nil,
    ["guildTitle"] = nil,
    ["guildCount"] = nil,
    ["guildClose"] = nil,
    ["guildExit"] = nil,
    ["guildApprove"] = nil,
    ["guildMemberScroll"] = nil,
    ["guildMemberEmpty"] = nil,
    ["guildMemberTemplate"] = nil,
    ["approveModal"] = nil,
    ["approveTitle"] = nil,
    ["approveClose"] = nil,
    ["applicantScroll"] = nil,
    ["applicantEmpty"] = nil,
    ["applicantTemplate"] = nil,
    ["roleModal"] = nil,
    ["roleTitle"] = nil,
    ["roleMaster"] = nil,
    ["roleVice"] = nil,
    ["roleClear"] = nil,
    ["roleCancel"] = nil,
    ["toastGui"] = nil,
    ["toastLabel"] = nil,
    ["toastToken"] = 0,
    ["button"] = nil
}
local u13 = {
    ["payload"] = nil,
    ["roleTarget"] = nil,
    ["uiOpen"] = false,
    ["openRequested"] = false,
    ["openBusy"] = false,
    ["openToken"] = 0
}
local u14 = false
local u15 = nil
local function u20(p16, p17) --[[ Line: 33 ]]
    local v18 = p16:FindFirstChildOfClass("UICorner")
    if v18 then
        v18.CornerRadius = UDim.new(0, p17 or 6)
        return v18
    end
    local v19 = Instance.new("UICorner")
    v19.CornerRadius = UDim.new(0, p17 or 6)
    v19.Parent = p16
    return v19
end
local function u26(p21, p22, p23) --[[ Line: 41 ]]
    local v24 = p21:FindFirstChildOfClass("UIStroke")
    if v24 then
        v24.Color = p22 or Color3.fromRGB(120, 120, 140)
        v24.Thickness = p23 or 1
        return v24
    end
    local v25 = Instance.new("UIStroke")
    v25.Color = p22 or Color3.fromRGB(120, 120, 140)
    v25.Thickness = p23 or 1
    v25.Parent = p21
    return v25
end
local function u31(p27, p28, p29) --[[ Line: 50 ]]
    if not p27 then
        return nil
    end
    for _, v30 in ipairs(p27:GetDescendants()) do
        if v30.Name == p28 and (not p29 or (v30.ClassName == p29 or v30:IsA(p29))) then
            return v30
        end
    end
    return nil
end
local function u36(p32, p33) --[[ Line: 57 ]]
    if p32 then
        local v34 = p33 or {}
        for _, v35 in ipairs(p32:GetChildren()) do
            if not v34[v35.Name] then
                if not v35:IsA("UIListLayout") then
                    if not v35:IsA("UIPadding") then
                        v35:Destroy()
                    end
                end
            end
        end
    end
end
local function u39(p37, p38) --[[ Line: 68 ]]
    if p37 and p37:IsA("GuiButton") then
        if p37:GetAttribute("GuildBound") ~= true then
            p37:SetAttribute("GuildBound", true)
            p37.Activated:Connect(p38)
        end
    else
        return
    end
end
local function u47(p40, p41, p42, p43, p44, p45) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
    --]]
    local v46 = Instance.new("Frame")
    v46.Name = p40
    v46.Size = p42
    v46.Position = p43
    v46.BackgroundColor3 = p44 or Color3.fromRGB(24, 28, 40)
    v46.BorderSizePixel = 0
    v46.ZIndex = p45 or 1
    v46.Parent = p41
    u20(v46, 8)
    u26(v46, Color3.fromRGB(90, 96, 118), 1)
    return v46
end
local function u57(p48, p49, p50, p51, p52, p53, p54, p55) --[[ Line: 87 ]]
    local v56 = Instance.new("TextLabel")
    v56.Name = p48
    v56.Size = p50
    v56.Position = p51
    v56.BackgroundTransparency = 1
    v56.Text = tostring(p52 or "")
    v56.TextColor3 = p54 or Color3.fromRGB(255, 255, 255)
    v56.TextSize = p53 or 18
    v56.Font = Enum.Font.GothamBold
    v56.TextXAlignment = Enum.TextXAlignment.Left
    v56.TextYAlignment = Enum.TextYAlignment.Center
    v56.ZIndex = p55 or 2
    v56.Parent = p49
    return v56
end
local function u67(p58, p59, p60, p61, p62, p63, p64, p65) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
    --]]
    local v66 = Instance.new("TextButton")
    v66.Name = p58
    v66.Size = p60
    v66.Position = p61
    v66.BackgroundColor3 = p64 or Color3.fromRGB(54, 62, 82)
    v66.BorderSizePixel = 0
    v66.Text = tostring(p62 or "")
    v66.TextColor3 = Color3.fromRGB(255, 255, 255)
    v66.TextSize = p63 or 18
    v66.Font = Enum.Font.GothamBold
    v66.AutoButtonColor = true
    v66.ZIndex = p65 or 2
    v66.Parent = p59
    u20(v66, 6)
    u26(v66, Color3.fromRGB(90, 96, 118), 1)
    return v66
end
local function u75(p68, p69, p70, p71, p72, p73) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
    --]]
    local v74 = Instance.new("TextBox")
    v74.Name = p68
    v74.Size = p70
    v74.Position = p71
    v74.BackgroundColor3 = Color3.fromRGB(18, 22, 32)
    v74.BorderSizePixel = 0
    v74.Text = ""
    v74.PlaceholderText = p72 or ""
    v74.TextColor3 = Color3.fromRGB(255, 255, 255)
    v74.PlaceholderColor3 = Color3.fromRGB(140, 145, 160)
    v74.TextSize = 18
    v74.Font = Enum.Font.Gotham
    v74.ClearTextOnFocus = false
    v74.ZIndex = p73 or 2
    v74.Parent = p69
    u20(v74, 6)
    u26(v74, Color3.fromRGB(90, 96, 118), 1)
    return v74
end
local function u79(p76) --[[ Line: 141 ]]
    local v77 = p76:FindFirstChildOfClass("UIListLayout")
    if not v77 then
        v77 = Instance.new("UIListLayout")
        v77.FillDirection = Enum.FillDirection.Vertical
        v77.HorizontalAlignment = Enum.HorizontalAlignment.Center
        v77.SortOrder = Enum.SortOrder.LayoutOrder
        v77.Padding = UDim.new(0, 6)
        v77.Parent = p76
    end
    local v78 = p76:FindFirstChildOfClass("UIPadding")
    if not v78 then
        v78 = Instance.new("UIPadding")
        v78.PaddingTop = UDim.new(0, 6)
        v78.PaddingBottom = UDim.new(0, 6)
        v78.PaddingLeft = UDim.new(0, 6)
        v78.PaddingRight = UDim.new(0, 6)
        v78.Parent = p76
    end
    p76.AutomaticCanvasSize = Enum.AutomaticSize.Y
    p76.CanvasSize = UDim2.new(0, 0, 0, 0)
    p76.ScrollingDirection = Enum.ScrollingDirection.Y
    p76.BorderSizePixel = 0
    return v77, v78
end
local function u85(p80, p81, p82) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u57
    --]]
    local v83 = u31(p80, p81, "TextLabel")
    if v83 then
        return v83
    end
    local v84 = u57(p81, p80, UDim2.new(1, -12, 0, 28), UDim2.new(0, 6, 0, 6), p82 or "", 16, Color3.fromRGB(170, 175, 190), 2)
    v84.TextXAlignment = Enum.TextXAlignment.Center
    v84.Visible = false
    return v84
end
local function u86() --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u12
    --]]
    u13.uiOpen = false
    u13.openRequested = false
    u15()
    if u12.createModal then
        u12.createModal.Visible = false
    end
    if u12.approveModal then
        u12.approveModal.Visible = false
    end
    if u12.roleModal then
        u12.roleModal.Visible = false
    end
    if u12.guildListGui then
        u12.guildListGui.Enabled = false
    end
    if u12.guildGui then
        u12.guildGui.Enabled = false
    end
end
local function u89() --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u20
        [4] = u26
    --]]
    if not (u12.toastGui and u12.toastGui.Parent) then
        local v87 = u9:FindFirstChild("GuildToastGui")
        if not v87 then
            v87 = Instance.new("ScreenGui")
            v87.Name = "GuildToastGui"
            v87.ResetOnSpawn = false
            v87.IgnoreGuiInset = true
            v87.DisplayOrder = 260
            v87.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v87.Parent = u9
        end
        u12.toastGui = v87
        local v88 = v87:FindFirstChild("ToastLabel")
        if not v88 then
            v88 = Instance.new("TextLabel")
            v88.Name = "ToastLabel"
            v88.AnchorPoint = Vector2.new(0.5, 0)
            v88.Position = UDim2.new(0.5, 0, 0, 24)
            v88.Size = UDim2.new(0, 480, 0, 34)
            v88.BackgroundColor3 = Color3.fromRGB(18, 22, 32)
            v88.BackgroundTransparency = 0.15
            v88.BorderSizePixel = 0
            v88.Text = ""
            v88.TextColor3 = Color3.fromRGB(255, 255, 255)
            v88.TextSize = 18
            v88.Font = Enum.Font.GothamBold
            v88.Visible = false
            v88.Parent = v87
            u20(v88, 8)
            u26(v88, Color3.fromRGB(90, 96, 118), 1)
        end
        u12.toastLabel = v88
    end
end
local function u93(p90) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u89
        [2] = u12
        [3] = u5
    --]]
    local v91 = tostring(p90 or "")
    if v91 ~= "" then
        u89()
        u12.toastToken = u12.toastToken + 1
        local u92 = u12.toastToken
        u12.toastLabel.Text = v91
        u12.toastLabel.Visible = true
        task.delay(u5.NOTICE_TIME or 3.5, function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u92
            --]]
            if u12.toastToken == u92 then
                if u12.toastLabel then
                    u12.toastLabel.Visible = false
                end
            end
        end)
    end
end
u15 = function() --[[ Name: finishOpenBusy, Line 257 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
    --]]
    if u13.openBusy then
        u13.openBusy = false
        u13.openToken = u13.openToken + 1
        if u12.button and u12.button:IsA("GuiButton") then
            u12.button.Active = true
            u12.button.AutoButtonColor = true
        end
    end
end
local function u96() --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u36
    --]]
    if not (u12.guildListGui and u12.guildListGui.Parent) then
        local v94, v95 = pcall(ensureGuildListGui)
        if not v94 then
            warn("[GuildUIController] showGuildListLoading failed:", v95)
            return
        end
    end
    u13.uiOpen = true
    if u12.createModal then
        u12.createModal.Visible = false
    end
    if u12.approveModal then
        u12.approveModal.Visible = false
    end
    if u12.roleModal then
        u12.roleModal.Visible = false
    end
    if u12.guildListScroll then
        u36(u12.guildListScroll, {
            ["UIListLayout"] = true,
            ["UIPadding"] = true,
            ["EmptyLabel"] = true,
            ["GuildRowTemplate"] = true
        })
        u12.guildListScroll.CanvasPosition = Vector2.zero
    end
    if u12.guildListTitle then
        u12.guildListTitle.Text = "\234\184\184\235\147\156 \235\170\169\235\161\157"
    end
    if u12.guildListSearchInput then
        u12.guildListSearchInput.Text = ""
    end
    if u12.guildListEmpty then
        u12.guildListEmpty.Text = "\234\184\184\235\147\156 \235\170\169\235\161\157 \235\182\136\235\159\172\236\152\164\235\138\148 \236\164\145..."
        u12.guildListEmpty.Visible = true
    end
    if u12.guildListGui then
        u12.guildListGui.Enabled = true
    end
    if u12.guildGui then
        u12.guildGui.Enabled = false
    end
end
local function u109() --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u9
        [4] = u31
        [5] = u47
        [6] = u57
        [7] = u67
        [8] = u75
        [9] = u79
        [10] = u85
        [11] = u5
    --]]
    if not (u12.guildListGui and u12.guildListGui.Parent) then
        local v97 = u10.wait(u9, "GuildListGui", 10)
        if not v97 then
            error("GuildListGui not found")
        end
        v97.Enabled = false
        u12.guildListGui = v97
        local v98 = v97:FindFirstChild("GuildBox") or u31(v97, "GuildBox", "Frame") or u47("GuildBox", v97, UDim2.new(0, 560, 0, 420), UDim2.new(0.5, -280, 0.5, -210), Color3.fromRGB(24, 28, 40), 2)
        u12.guildListBox = v98
        local v99 = v98:FindFirstChild("Header") or u31(v98, "Header", "Frame")
        if not v99 then
            v99 = Instance.new("Frame")
            v99.Name = "Header"
            v99.Size = UDim2.new(1, 0, 0, 44)
            v99.BackgroundTransparency = 1
            v99.Parent = v98
        end
        u12.guildListHeader = v99
        local v100 = v99:FindFirstChild("Title") or u31(v99, "Title", "TextLabel") or u57("Title", v99, UDim2.new(1, -56, 1, 0), UDim2.new(0, 12, 0, 0), "\234\184\184\235\147\156 \235\170\169\235\161\157", 22, Color3.fromRGB(255, 255, 255), 3)
        v100.Text = "\234\184\184\235\147\156 \235\170\169\235\161\157"
        u12.guildListTitle = v100
        u12.guildListClose = v99:FindFirstChild("CloseBtn") or u31(v99, "CloseBtn", "TextButton") or u67("CloseBtn", v99, UDim2.new(0, 36, 0, 32), UDim2.new(1, -44, 0.5, -16), "X", 18, Color3.fromRGB(92, 58, 58), 3)
        local v101 = v98:FindFirstChild("CreateBtn") or u31(v98, "CreateBtn", "TextButton") or u67("CreateBtn", v98, UDim2.new(0, 120, 0, 34), UDim2.new(0, 12, 0, 52), "\234\184\184\235\147\156 \236\131\157\236\132\177", 18, Color3.fromRGB(60, 82, 112), 2)
        v101.Size = UDim2.new(0, 120, 0, 34)
        v101.Position = UDim2.new(0, 12, 0, 52)
        v101.Text = "\234\184\184\235\147\156 \236\131\157\236\132\177"
        u12.guildListCreate = v101
        local v102 = v98:FindFirstChild("SearchBtn") or u31(v98, "SearchBtn", "TextButton") or u67("SearchBtn", v98, UDim2.new(0, 74, 0, 34), UDim2.new(1, -86, 0, 52), "\234\178\128\236\131\137", 18, Color3.fromRGB(60, 82, 112), 2)
        v102.Size = UDim2.new(0, 74, 0, 34)
        v102.Position = UDim2.new(1, -86, 0, 52)
        v102.Text = "\234\178\128\236\131\137"
        u12.guildListSearchBtn = v102
        local v103 = v98:FindFirstChild("SearchInput") or u31(v98, "SearchInput", "TextBox") or u75("SearchInput", v98, UDim2.new(1, -238, 0, 34), UDim2.new(0, 144, 0, 52), "\234\184\184\235\147\156 \236\157\180\235\166\132 \236\160\149\237\153\149\237\158\136 \236\158\133\235\160\165", 2)
        v103.Size = UDim2.new(1, -238, 0, 34)
        v103.Position = UDim2.new(0, 144, 0, 52)
        v103.PlaceholderText = "\234\184\184\235\147\156 \236\157\180\235\166\132 \236\160\149\237\153\149\237\158\136 \236\158\133\235\160\165"
        u12.guildListSearchInput = v103
        local v104 = v98:FindFirstChild("GuildList") or u31(v98, "GuildList", "ScrollingFrame")
        if not v104 then
            v104 = Instance.new("ScrollingFrame")
            v104.Name = "GuildList"
            v104.Size = UDim2.new(1, -24, 1, -102)
            v104.Position = UDim2.new(0, 12, 0, 92)
            v104.BackgroundTransparency = 1
            v104.ScrollBarThickness = 8
            v104.Parent = v98
        end
        v104.Size = UDim2.new(1, -24, 1, -102)
        v104.Position = UDim2.new(0, 12, 0, 92)
        u79(v104)
        u12.guildListScroll = v104
        u12.guildListEmpty = v104:FindFirstChild("EmptyLabel") or u85(v104, "EmptyLabel", "\235\147\177\235\161\157\235\144\156 \234\184\184\235\147\156\234\176\128 \236\151\134\236\150\180.")
        u12.guildRowTemplate = v104:FindFirstChild("GuildRowTemplate")
        local v105 = v98:FindFirstChild("CreateModal") or u31(v98, "CreateModal", "Frame") or u47("CreateModal", v98, UDim2.new(0, 320, 0, 176), UDim2.new(0.5, -160, 0.5, -88), Color3.fromRGB(24, 28, 40), 20)
        v105.Visible = false
        v105.ZIndex = 20
        u12.createModal = v105
        local v106 = v105:FindFirstChild("TitleLabel") or u31(v105, "TitleLabel", "TextLabel") or u57("TitleLabel", v105, UDim2.new(1, -24, 0, 28), UDim2.new(0, 12, 0, 10), "\234\184\184\235\147\156 \236\131\157\236\132\177", 22, Color3.fromRGB(255, 255, 255), 21)
        v106.Text = "\234\184\184\235\147\156 \236\131\157\236\132\177"
        u12.createTitle = v106
        local v107 = v105:FindFirstChild("CostLabel") or u31(v105, "CostLabel", "TextLabel") or u57("CostLabel", v105, UDim2.new(1, -24, 0, 24), UDim2.new(0, 12, 0, 46), "\237\149\132\236\154\148 \234\179\168\235\147\156 : 10000", 18, Color3.fromRGB(255, 210, 90), 21)
        local v108 = u5.CREATE_COST
        v107.Text = "\237\149\132\236\154\148 \234\179\168\235\147\156 : " .. tostring(v108)
        u12.createCost = v107
        u12.createInput = v105:FindFirstChild("NameInput") or u31(v105, "NameInput", "TextBox") or u75("NameInput", v105, UDim2.new(1, -24, 0, 36), UDim2.new(0, 12, 0, 78), "\234\184\184\235\147\156 \236\157\180\235\166\132 \236\158\133\235\160\165", 21)
        u12.createConfirm = v105:FindFirstChild("ConfirmBtn") or u31(v105, "ConfirmBtn", "TextButton") or u67("ConfirmBtn", v105, UDim2.new(0.48, -6, 0, 34), UDim2.new(0, 12, 1, -46), "\236\131\157\236\132\177", 18, Color3.fromRGB(60, 102, 72), 21)
        u12.createCancel = v105:FindFirstChild("CancelBtn") or u31(v105, "CancelBtn", "TextButton") or u67("CancelBtn", v105, UDim2.new(0.48, -6, 0, 34), UDim2.new(0.52, 0, 1, -46), "\236\183\168\236\134\140", 18, Color3.fromRGB(92, 58, 58), 21)
    end
end
local function u114(p110) --[[ Line: 387 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
        [3] = u57
        [4] = u67
    --]]
    local v111 = p110:FindFirstChild("GuildMemberRowTemplate")
    if v111 then
        return v111
    end
    local v112 = Instance.new("Frame")
    v112.Name = "GuildMemberRowTemplate"
    v112.Size = UDim2.new(1, -12, 0, 44)
    v112.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
    v112.BorderSizePixel = 0
    v112.Visible = false
    v112.Parent = p110
    u20(v112, 6)
    u26(v112, Color3.fromRGB(90, 96, 118), 1)
    u57("MemberLabel", v112, UDim2.new(1, -214, 1, 0), UDim2.new(0, 12, 0, 0), "\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176 \237\153\141\234\184\184\235\143\153", 18, Color3.fromRGB(255, 255, 255), 3).TextXAlignment = Enum.TextXAlignment.Left
    local v113 = Instance.new("Frame")
    v113.Name = "ActionHolder"
    v113.Size = UDim2.new(0, 190, 1, 0)
    v113.Position = UDim2.new(1, -198, 0, 0)
    v113.BackgroundTransparency = 1
    v113.Parent = v112
    u67("RoleBtn", v113, UDim2.new(0, 88, 0, 28), UDim2.new(0, 0, 0.5, -14), "\236\151\173\237\149\160 \236\163\188\234\184\176", 14, Color3.fromRGB(60, 82, 112), 3)
    u67("KickBtn", v113, UDim2.new(0, 88, 0, 28), UDim2.new(0, 96, 0.5, -14), "\234\184\184\235\147\156 \236\182\148\235\176\169", 14, Color3.fromRGB(112, 66, 66), 3)
    return v112
end
local function u118(p115) --[[ Line: 412 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u26
        [3] = u57
        [4] = u67
    --]]
    local v116 = p115:FindFirstChild("ApplicantRowTemplate")
    if v116 then
        return v116
    end
    local v117 = Instance.new("Frame")
    v117.Name = "ApplicantRowTemplate"
    v117.Size = UDim2.new(1, -12, 0, 44)
    v117.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
    v117.BorderSizePixel = 0
    v117.Visible = false
    v117.Parent = p115
    u20(v117, 6)
    u26(v117, Color3.fromRGB(90, 96, 118), 1)
    u57("LevelLabel", v117, UDim2.new(0, 60, 1, 0), UDim2.new(0, 8, 0, 0), "Lv.1", 16, Color3.fromRGB(255, 220, 120), 3)
    u57("NameLabel", v117, UDim2.new(1, -220, 1, 0), UDim2.new(0, 70, 0, 0), "\237\153\141\234\184\184\235\143\153", 16, Color3.fromRGB(255, 255, 255), 3).TextXAlignment = Enum.TextXAlignment.Left
    u67("ApproveRowBtn", v117, UDim2.new(0, 60, 0, 28), UDim2.new(1, -132, 0.5, -14), "\236\138\185\236\157\184", 14, Color3.fromRGB(60, 102, 72), 3)
    u67("RejectRowBtn", v117, UDim2.new(0, 60, 0, 28), UDim2.new(1, -66, 0.5, -14), "\234\177\176\236\160\136", 14, Color3.fromRGB(112, 66, 66), 3)
    return v117
end
local function u129() --[[ Line: 431 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u9
        [4] = u31
        [5] = u47
        [6] = u57
        [7] = u67
        [8] = u79
        [9] = u85
        [10] = u114
        [11] = u118
    --]]
    if not (u12.guildGui and u12.guildGui.Parent) then
        local v119 = u10.wait(u9, "GuildGui", 10)
        if not v119 then
            error("GuildGui not found")
        end
        v119.Enabled = false
        u12.guildGui = v119
        local v120 = v119:FindFirstChild("GuildBox") or u31(v119, "GuildBox", "Frame") or u47("GuildBox", v119, UDim2.new(0, 620, 0, 440), UDim2.new(0.5, -310, 0.5, -220), Color3.fromRGB(24, 28, 40), 2)
        u12.guildBox = v120
        local v121 = v120:FindFirstChild("Header") or u31(v120, "Header", "Frame")
        if not v121 then
            v121 = Instance.new("Frame")
            v121.Name = "Header"
            v121.Size = UDim2.new(1, 0, 0, 44)
            v121.BackgroundTransparency = 1
            v121.Parent = v120
        end
        u12.guildHeader = v121
        u12.guildTitle = v121:FindFirstChild("Title") or u31(v121, "Title", "TextLabel") or u57("Title", v121, UDim2.new(0.46, 0, 1, 0), UDim2.new(0, 12, 0, 0), "\234\184\184\235\147\156", 22, Color3.fromRGB(255, 255, 255), 3)
        local v122 = v121:FindFirstChild("CountLabel") or u31(v121, "CountLabel", "TextLabel")
        if not v122 then
            v122 = u57("CountLabel", v121, UDim2.new(0, 90, 1, 0), UDim2.new(0.46, 0, 0, 0), "0/20", 18, Color3.fromRGB(255, 210, 90), 3)
            v122.TextXAlignment = Enum.TextXAlignment.Left
        end
        u12.guildCount = v122
        local v123 = v121:FindFirstChild("ApproveBtn") or (v120:FindFirstChild("ApproveBtn") or u31(v120, "ApproveBtn", "TextButton")) or u67("ApproveBtn", v121, UDim2.new(0, 110, 0, 30), UDim2.new(1, -246, 0.5, -15), "\236\139\160\236\178\173\235\170\169\235\161\157", 16, Color3.fromRGB(60, 82, 112), 3)
        v123.Parent = v121
        v123.Position = UDim2.new(1, -246, 0.5, -15)
        v123.Size = UDim2.new(0, 110, 0, 30)
        u12.guildApprove = v123
        local v124 = v121:FindFirstChild("ExitBtn") or (v120:FindFirstChild("ExitBtn") or u31(v120, "ExitBtn", "TextButton")) or u67("ExitBtn", v121, UDim2.new(0, 70, 0, 30), UDim2.new(1, -130, 0.5, -15), "\237\131\136\237\135\180", 16, Color3.fromRGB(112, 66, 66), 3)
        v124.Parent = v121
        v124.Position = UDim2.new(1, -130, 0.5, -15)
        v124.Size = UDim2.new(0, 70, 0, 30)
        u12.guildExit = v124
        u12.guildClose = v121:FindFirstChild("CloseBtn") or u31(v121, "CloseBtn", "TextButton") or u67("CloseBtn", v121, UDim2.new(0, 36, 0, 30), UDim2.new(1, -44, 0.5, -15), "X", 16, Color3.fromRGB(92, 58, 58), 3)
        local v125 = v120:FindFirstChild("GuildList") or u31(v120, "GuildList", "ScrollingFrame")
        if not v125 then
            v125 = Instance.new("ScrollingFrame")
            v125.Name = "GuildList"
            v125.Size = UDim2.new(1, -24, 1, -64)
            v125.Position = UDim2.new(0, 12, 0, 52)
            v125.BackgroundTransparency = 1
            v125.ScrollBarThickness = 8
            v125.Parent = v120
        end
        u79(v125)
        u12.guildMemberScroll = v125
        u12.guildMemberEmpty = v125:FindFirstChild("EmptyLabel") or u85(v125, "EmptyLabel", "\234\184\184\235\147\156\236\155\144\236\157\180 \236\151\134\236\150\180.")
        u12.guildMemberTemplate = u114(v125)
        local v126 = v120:FindFirstChild("ApproveModal") or u31(v120, "ApproveModal", "Frame") or u47("ApproveModal", v120, UDim2.new(0, 420, 0, 300), UDim2.new(0.5, -210, 0.5, -150), Color3.fromRGB(24, 28, 40), 20)
        v126.Visible = false
        v126.ZIndex = 20
        u12.approveModal = v126
        u12.approveTitle = v126:FindFirstChild("TitleLabel") or u31(v126, "TitleLabel", "TextLabel") or u57("TitleLabel", v126, UDim2.new(1, -54, 0, 28), UDim2.new(0, 12, 0, 10), "\234\176\128\236\158\133 \236\139\160\236\178\173 \235\170\169\235\161\157", 22, Color3.fromRGB(255, 255, 255), 21)
        u12.approveClose = v126:FindFirstChild("CloseApproveBtn") or u31(v126, "CloseApproveBtn", "TextButton") or u67("CloseApproveBtn", v126, UDim2.new(0, 36, 0, 30), UDim2.new(1, -44, 0, 8), "X", 16, Color3.fromRGB(92, 58, 58), 21)
        local v127 = v126:FindFirstChild("ApplicantList") or u31(v126, "ApplicantList", "ScrollingFrame")
        if not v127 then
            v127 = Instance.new("ScrollingFrame")
            v127.Name = "ApplicantList"
            v127.Size = UDim2.new(1, -24, 1, -56)
            v127.Position = UDim2.new(0, 12, 0, 44)
            v127.BackgroundTransparency = 1
            v127.ScrollBarThickness = 8
            v127.Parent = v126
        end
        u79(v127)
        u12.applicantScroll = v127
        u12.applicantEmpty = v127:FindFirstChild("EmptyLabel") or u85(v127, "EmptyLabel", "\234\176\128\236\158\133 \236\139\160\236\178\173\236\157\180 \236\151\134\236\150\180.")
        u12.applicantTemplate = u118(v127)
        local v128 = v120:FindFirstChild("RoleModal") or u31(v120, "RoleModal", "Frame") or u47("RoleModal", v120, UDim2.new(0, 320, 0, 220), UDim2.new(0.5, -160, 0.5, -110), Color3.fromRGB(24, 28, 40), 20)
        v128.Visible = false
        v128.ZIndex = 20
        u12.roleModal = v128
        u12.roleTitle = v128:FindFirstChild("TitleLabel") or u31(v128, "TitleLabel", "TextLabel") or u57("TitleLabel", v128, UDim2.new(1, -24, 0, 28), UDim2.new(0, 12, 0, 10), "\236\151\173\237\149\160 \236\132\164\236\160\149", 22, Color3.fromRGB(255, 255, 255), 21)
        u12.roleMaster = v128:FindFirstChild("GiveMasterBtn") or u31(v128, "GiveMasterBtn", "TextButton") or u67("GiveMasterBtn", v128, UDim2.new(1, -24, 0, 34), UDim2.new(0, 12, 0, 54), "\234\184\184\235\147\156 \235\167\136\236\138\164\237\132\176 \236\163\188\234\184\176", 16, Color3.fromRGB(60, 82, 112), 21)
        u12.roleVice = v128:FindFirstChild("GiveViceBtn") or u31(v128, "GiveViceBtn", "TextButton") or u67("GiveViceBtn", v128, UDim2.new(1, -24, 0, 34), UDim2.new(0, 12, 0, 96), "\235\182\128\234\184\184\235\147\156 \235\167\136\236\138\164\237\132\176 \236\163\188\234\184\176", 16, Color3.fromRGB(60, 82, 112), 21)
        u12.roleClear = v128:FindFirstChild("ClearRoleBtn") or u31(v128, "ClearRoleBtn", "TextButton") or u67("ClearRoleBtn", v128, UDim2.new(1, -24, 0, 34), UDim2.new(0, 12, 0, 138), "\236\151\173\237\149\160 \237\149\180\236\160\156", 16, Color3.fromRGB(112, 88, 52), 21)
        u12.roleCancel = v128:FindFirstChild("CancelBtn") or u31(v128, "CancelBtn", "TextButton") or u67("CancelBtn", v128, UDim2.new(1, -24, 0, 34), UDim2.new(0, 12, 1, -46), "\236\183\168\236\134\140", 16, Color3.fromRGB(92, 58, 58), 21)
    end
end
local function u133() --[[ Line: 555 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u20
        [3] = u26
        [4] = u57
        [5] = u67
    --]]
    local v130 = u12.guildRowTemplate
    if v130 and v130:IsA("Frame") then
        local v131 = v130:Clone()
        v131.Visible = true
        v131.Parent = u12.guildListScroll
        return v131
    end
    local v132 = Instance.new("Frame")
    v132.Name = "GuildRow"
    v132.Size = UDim2.new(1, -12, 0, 44)
    v132.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
    v132.BorderSizePixel = 0
    v132.Parent = u12.guildListScroll
    u20(v132, 6)
    u26(v132, Color3.fromRGB(90, 96, 118), 1)
    u57("NameLabel", v132, UDim2.new(0.55, 0, 1, 0), UDim2.new(0, 12, 0, 0), "Guild Name", 18, Color3.fromRGB(255, 255, 255), 3)
    u57("CountLabel", v132, UDim2.new(0, 70, 1, 0), UDim2.new(1, -170, 0, 0), "1/20", 16, Color3.fromRGB(255, 210, 90), 3).TextXAlignment = Enum.TextXAlignment.Right
    u67("ApplyBtn", v132, UDim2.new(0, 84, 0, 28), UDim2.new(1, -90, 0.5, -14), "\234\176\128\236\158\133\236\139\160\236\178\173", 14, Color3.fromRGB(60, 82, 112), 3)
    return v132
end
local function u153(p134) --[[ Line: 597 ]]
    --[[
    Upvalues:
        [1] = u109
        [2] = u36
        [3] = u12
        [4] = u133
        [5] = u5
        [6] = u39
        [7] = u6
    --]]
    u109()
    u36(u12.guildListScroll, {
        ["UIListLayout"] = true,
        ["UIPadding"] = true,
        ["EmptyLabel"] = true,
        ["GuildRowTemplate"] = true
    })
    local v135
    if p134 then
        v135 = p134.guilds
    else
        v135 = p134
    end
    local v136 = type(v135) == "table" and (p134.guilds or {}) or {}
    local v137
    if p134 then
        v137 = p134.searchActive == true
    else
        v137 = p134
    end
    if u12.guildListTitle then
        u12.guildListTitle.Text = v137 and "\234\184\184\235\147\156 \234\178\128\236\131\137 \234\178\176\234\179\188" or "\234\184\184\235\147\156 \235\170\169\235\161\157"
    end
    if u12.guildListSearchInput then
        local v138 = u12.guildListSearchInput
        local v139 = p134 and (p134.searchName or "") or ""
        v138.Text = tostring(v139)
    end
    if u12.guildListEmpty then
        u12.guildListEmpty.Text = v137 and "\236\157\188\236\185\152\237\149\152\235\138\148 \234\184\184\235\147\156\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164." or "\235\147\177\235\161\157\235\144\156 \234\184\184\235\147\156\234\176\128 \236\151\134\236\150\180."
        u12.guildListEmpty.Visible = #v136 == 0
    end
    for v140, u141 in ipairs(v136) do
        local v142 = u133()
        local v143 = u141.guildId or "0"
        v142.Name = "GuildRow_" .. tostring(v143)
        v142.LayoutOrder = v140
        local v144 = v142:FindFirstChild("NameLabel", true)
        local v145 = v142:FindFirstChild("CountLabel", true)
        local v146 = v142:FindFirstChild("ApplyBtn", true)
        if v144 then
            local v147 = u141.name or "Unknown"
            v144.Text = tostring(v147)
        end
        if v145 then
            local v148 = u141.memberCount or 0
            local v149 = tostring(v148)
            local v150 = u141.maxMembers or u5.MAX_MEMBERS
            v145.Text = v149 .. "/" .. tostring(v150)
        end
        if v146 then
            v146.Text = u141.full and "\234\176\128\235\147\157\236\176\184" or (u141.applied and "\236\139\160\236\178\173\236\164\145" or "\234\176\128\236\158\133\236\139\160\236\178\173")
            v146.AutoButtonColor = u141.canApply and true or false
            v146.Active = u141.canApply and true or false
            v146.BackgroundColor3 = u141.canApply and Color3.fromRGB(60, 82, 112) or Color3.fromRGB(72, 72, 82)
            u39(v146, function() --[[ Line: 622 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u141
                --]]
                u6:FireServer(u5.ACTION_APPLY, {
                    ["guildId"] = u141.guildId
                })
            end)
        end
    end
    if u12.createCost then
        local v151 = u12.createCost
        local v152 = p134 and p134.createCost or u5.CREATE_COST
        v151.Text = "\237\149\132\236\154\148 \234\179\168\235\147\156 : " .. tostring(v152)
    end
    u12.guildListGui.Enabled = true
    if u12.guildGui then
        u12.guildGui.Enabled = false
    end
end
local function u166(p154) --[[ Line: 632 ]]
    --[[
    Upvalues:
        [1] = u129
        [2] = u36
        [3] = u12
        [4] = u118
        [5] = u39
        [6] = u6
        [7] = u5
    --]]
    u129()
    u36(u12.applicantScroll, {
        ["UIListLayout"] = true,
        ["UIPadding"] = true,
        ["EmptyLabel"] = true,
        ["ApplicantRowTemplate"] = true
    })
    local v155 = type(p154) == "table" and p154 and p154 or {}
    u12.applicantEmpty.Visible = #v155 == 0
    for v156, u157 in ipairs(v155) do
        local v158 = u12.applicantTemplate and u12.applicantTemplate:Clone() or nil
        if v158 then
            v158.Visible = true
            v158.Parent = u12.applicantScroll
        else
            v158 = u118(u12.applicantScroll):Clone()
            v158.Visible = true
            v158.Parent = u12.applicantScroll
        end
        local v159 = u157.userId or 0
        v158.Name = "ApplicantRow_" .. tostring(v159)
        v158.LayoutOrder = v156
        local v160 = v158:FindFirstChild("LevelLabel", true)
        local v161 = v158:FindFirstChild("NameLabel", true)
        local v162 = v158:FindFirstChild("ApproveRowBtn", true)
        local v163 = v158:FindFirstChild("RejectRowBtn", true)
        if v160 then
            local v164 = u157.level or 1
            v160.Text = "Lv." .. tostring(v164)
        end
        if v161 then
            local v165 = u157.name or "Unknown"
            v161.Text = tostring(v165)
        end
        if v162 then
            u39(v162, function() --[[ Line: 647 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u157
                --]]
                u6:FireServer(u5.ACTION_APPROVE, {
                    ["userId"] = u157.userId
                })
            end)
        end
        if v163 then
            u39(v163, function() --[[ Line: 648 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u157
                --]]
                u6:FireServer(u5.ACTION_REJECT, {
                    ["userId"] = u157.userId
                })
            end)
        end
    end
end
local function u191(p167) --[[ Line: 652 ]]
    --[[
    Upvalues:
        [1] = u129
        [2] = u12
        [3] = u5
        [4] = u36
        [5] = u114
        [6] = u39
        [7] = u13
        [8] = u6
        [9] = u166
    --]]
    u129()
    local v168
    if p167 then
        v168 = p167.guild
    else
        v168 = p167
    end
    local v169 = type(v168) == "table" and p167.guild or {}
    local v170 = v169.members
    local v171 = type(v170) == "table" and (v169.members or {}) or {}
    local v172 = u12.guildTitle
    local v173 = v169.name or "\234\184\184\235\147\156"
    v172.Text = tostring(v173)
    local v174 = u12.guildCount
    local v175 = v169.memberCount or 0
    local v176 = tostring(v175)
    local v177 = v169.maxMembers or u5.MAX_MEMBERS
    v174.Text = v176 .. "/" .. tostring(v177)
    u12.guildApprove.Visible = v169.canApprove == true
    u36(u12.guildMemberScroll, {
        ["UIListLayout"] = true,
        ["UIPadding"] = true,
        ["EmptyLabel"] = true,
        ["GuildMemberRowTemplate"] = true
    })
    u12.guildMemberEmpty.Visible = #v171 == 0
    for v178, u179 in ipairs(v171) do
        local v180 = u12.guildMemberTemplate and u12.guildMemberTemplate:Clone() or nil
        if v180 then
            v180.Visible = true
            v180.Parent = u12.guildMemberScroll
        else
            v180 = u114(u12.guildMemberScroll):Clone()
            v180.Visible = true
            v180.Parent = u12.guildMemberScroll
        end
        local v181 = u179.userId or 0
        v180.Name = "GuildMemberRow_" .. tostring(v181)
        v180.LayoutOrder = v178
        local v182 = v180:FindFirstChild("MemberLabel", true)
        local v183 = v180:FindFirstChild("ActionHolder", true)
        local v184 = v180:FindFirstChild("RoleBtn", true)
        local v185 = v180:FindFirstChild("KickBtn", true)
        if v182 then
            local v186 = u179.label
            if not v186 then
                local v187 = u179.roleDisplay or "\234\184\184\235\147\156\236\155\144"
                local v188 = u179.name or "Unknown"
                v186 = v187 .. " " .. tostring(v188)
            end
            v182.Text = tostring(v186)
        end
        if v183 then
            v183.Visible = u179.canRole == true and true or u179.canKick == true
        end
        if v184 then
            v184.Visible = u179.canRole == true
            u39(v184, function() --[[ Line: 674 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u179
                    [3] = u12
                --]]
                u13.roleTarget = {
                    ["userId"] = u179.userId,
                    ["name"] = u179.name
                }
                local v189 = u12.roleTitle
                local v190 = u179.name or "Unknown"
                v189.Text = "\236\151\173\237\149\160 \236\132\164\236\160\149 - " .. tostring(v190)
                u12.roleModal.Visible = true
            end)
        end
        if v185 then
            v185.Visible = u179.canKick == true
            u39(v185, function() --[[ Line: 682 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u179
                --]]
                u6:FireServer(u5.ACTION_KICK, {
                    ["userId"] = u179.userId
                })
            end)
        end
    end
    u166(v169.applications or {})
    u12.guildGui.Enabled = true
    if u12.guildListGui then
        u12.guildListGui.Enabled = false
    end
end
local function u193() --[[ Line: 694 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u93
        [3] = u6
        [4] = u5
    --]]
    if u12.createInput then
        local v192 = (u12.createInput.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if v192 == "" then
            u93("\234\184\184\235\147\156 \236\157\180\235\166\132\236\157\132 \236\158\133\235\160\165\237\149\180.")
        else
            u6:FireServer(u5.ACTION_CREATE, {
                ["name"] = v192
            })
        end
    else
        return
    end
end
local function u196() --[[ Line: 701 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u96
        [4] = u6
        [5] = u5
        [6] = u11
    --]]
    if u13.openBusy then
        return
    elseif u12.guildListSearchInput then
        local v194 = (u12.guildListSearchInput.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if v194 == "" then
            u13.openRequested = true
            u96()
            u13.openToken = u13.openToken + 1
            u13.openBusy = true
            if u12.button and u12.button:IsA("GuiButton") then
                u12.button.Active = false
                u12.button.AutoButtonColor = false
            end
            local u195 = u13.openToken
            task.delay(4, function() --[[ Line: 246 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u195
                    [3] = u12
                --]]
                if u13.openBusy and u13.openToken == u195 then
                    u13.openBusy = false
                    if u12.button and u12.button:IsA("GuiButton") then
                        u12.button.Active = true
                        u12.button.AutoButtonColor = true
                    end
                    if u12.guildListGui and (u12.guildListGui.Enabled and u12.guildListEmpty) then
                        u12.guildListEmpty.Text = "\235\182\136\235\159\172\236\152\164\234\184\176\234\176\128 \236\167\128\236\151\176\235\144\152\234\179\160 \236\158\136\236\138\181\235\139\136\235\139\164. \235\139\164\236\139\156 \235\136\140\235\159\172\236\163\188\236\132\184\236\154\148."
                        u12.guildListEmpty.Visible = true
                    end
                end
            end)
            task.defer(function() --[[ Line: 710 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                    [3] = u5
                --]]
                if u13.openBusy and u13.openRequested then
                    u6:FireServer(u5.ACTION_OPEN)
                end
            end)
        else
            u6:FireServer(u11, {
                ["name"] = v194
            })
        end
    else
        return
    end
end
local function u198() --[[ Line: 718 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u13
        [3] = u12
        [4] = u15
        [5] = u96
        [6] = u6
        [7] = u5
    --]]
    if u3:GetFocusedTextBox() then
        return
    elseif not u13.openBusy then
        if u12.guildListGui and u12.guildListGui.Enabled or u12.guildGui and u12.guildGui.Enabled then
            u13.uiOpen = false
            u13.openRequested = false
            u15()
            if u12.createModal then
                u12.createModal.Visible = false
            end
            if u12.approveModal then
                u12.approveModal.Visible = false
            end
            if u12.roleModal then
                u12.roleModal.Visible = false
            end
            if u12.guildListGui then
                u12.guildListGui.Enabled = false
            end
            if u12.guildGui then
                u12.guildGui.Enabled = false
                return
            end
        else
            u13.openRequested = true
            u96()
            u13.openToken = u13.openToken + 1
            u13.openBusy = true
            if u12.button and u12.button:IsA("GuiButton") then
                u12.button.Active = false
                u12.button.AutoButtonColor = false
            end
            local u197 = u13.openToken
            task.delay(4, function() --[[ Line: 246 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u197
                    [3] = u12
                --]]
                if u13.openBusy and u13.openToken == u197 then
                    u13.openBusy = false
                    if u12.button and u12.button:IsA("GuiButton") then
                        u12.button.Active = true
                        u12.button.AutoButtonColor = true
                    end
                    if u12.guildListGui and (u12.guildListGui.Enabled and u12.guildListEmpty) then
                        u12.guildListEmpty.Text = "\235\182\136\235\159\172\236\152\164\234\184\176\234\176\128 \236\167\128\236\151\176\235\144\152\234\179\160 \236\158\136\236\138\181\235\139\136\235\139\164. \235\139\164\236\139\156 \235\136\140\235\159\172\236\163\188\236\132\184\236\154\148."
                        u12.guildListEmpty.Visible = true
                    end
                end
            end)
            task.defer(function() --[[ Line: 727 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                    [3] = u5
                --]]
                if u13.openBusy and u13.openRequested then
                    u6:FireServer(u5.ACTION_OPEN)
                end
            end)
        end
    end
end
local function u202() --[[ Line: 733 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    local v199 = { u10.find(u9, "MainHUD"), u9:FindFirstChild("MainHUD"), u9:FindFirstChild("MainHUD_Mobile") }
    for _, v200 in ipairs(v199) do
        local v201 = v200 and v200:FindFirstChild("BtnGuild", true) or nil
        if v201 and v201:IsA("GuiButton") then
            return v201
        end
    end
    return nil
end
local function u207() --[[ Line: 741 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u39
        [3] = u198
        [4] = u13
        [5] = u202
    --]]
    if u12.button and (u12.button.Parent and u12.button:IsA("GuiButton")) then
        u39(u12.button, u198)
        local v203 = u13.openBusy
        if u12.button and u12.button:IsA("GuiButton") then
            u12.button.Active = not v203
            u12.button.AutoButtonColor = not v203
        end
        return
    else
        u12.button = u202()
        if u12.button then
            u39(u12.button, u198)
            local v204 = u13.openBusy
            if u12.button and u12.button:IsA("GuiButton") then
                u12.button.Active = not v204
                u12.button.AutoButtonColor = not v204
            end
        else
            task.spawn(function() --[[ Line: 753 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u202
                    [3] = u39
                    [4] = u198
                    [5] = u13
                --]]
                while not (u12.button and u12.button.Parent) do
                    local v205 = u202()
                    if v205 then
                        u12.button = v205
                        u39(u12.button, u198)
                        local v206 = u13.openBusy
                        if u12.button and u12.button:IsA("GuiButton") then
                            u12.button.Active = not v206
                            u12.button.AutoButtonColor = not v206
                            return
                        end
                        break
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
end
local function u213() --[[ Line: 771 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u207
        [3] = u109
        [4] = u129
        [5] = u39
        [6] = u12
        [7] = u86
        [8] = u196
        [9] = u193
        [10] = u6
        [11] = u5
        [12] = u13
    --]]
    if not u14 then
        u14 = true
        u207()
        local v208, v209 = pcall(u109)
        if not v208 then
            warn("[GuildUIController] ensureGuildListGui failed:", v209)
        end
        local v210, v211 = pcall(u129)
        if not v210 then
            warn("[GuildUIController] ensureGuildGui failed:", v211)
        end
        if v208 then
            u39(u12.guildListClose, u86)
            u39(u12.guildListCreate, function() --[[ Line: 782 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if u12.createModal then
                    u12.createModal.Visible = true
                end
            end)
            u39(u12.guildListSearchBtn, u196)
            if u12.guildListSearchInput and u12.guildListSearchInput:GetAttribute("GuildSearchBound") ~= true then
                u12.guildListSearchInput:SetAttribute("GuildSearchBound", true)
                u12.guildListSearchInput.FocusLost:Connect(function(p212) --[[ Line: 786 ]]
                    --[[
                    Upvalues:
                        [1] = u196
                    --]]
                    if p212 then
                        u196()
                    end
                end)
            end
            u39(u12.createCancel, function() --[[ Line: 790 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if u12.createModal then
                    u12.createModal.Visible = false
                end
            end)
            u39(u12.createConfirm, u193)
        end
        if v210 then
            u39(u12.guildClose, u86)
            u39(u12.guildExit, function() --[[ Line: 796 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                --]]
                u6:FireServer(u5.ACTION_LEAVE)
            end)
            u39(u12.guildApprove, function() --[[ Line: 797 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if u12.approveModal then
                    u12.approveModal.Visible = not u12.approveModal.Visible
                end
            end)
            u39(u12.approveClose, function() --[[ Line: 798 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if u12.approveModal then
                    u12.approveModal.Visible = false
                end
            end)
            u39(u12.roleCancel, function() --[[ Line: 799 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if u12.roleModal then
                    u12.roleModal.Visible = false
                end
            end)
            u39(u12.roleMaster, function() --[[ Line: 800 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                    [3] = u5
                    [4] = u12
                --]]
                if u13.roleTarget then
                    u6:FireServer(u5.ACTION_SET_ROLE, {
                        ["userId"] = u13.roleTarget.userId,
                        ["role"] = u5.SET_ROLE_MASTER
                    })
                    if u12.roleModal then
                        u12.roleModal.Visible = false
                    end
                end
            end)
            u39(u12.roleVice, function() --[[ Line: 805 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                    [3] = u5
                    [4] = u12
                --]]
                if u13.roleTarget then
                    u6:FireServer(u5.ACTION_SET_ROLE, {
                        ["userId"] = u13.roleTarget.userId,
                        ["role"] = u5.SET_ROLE_VICE
                    })
                    if u12.roleModal then
                        u12.roleModal.Visible = false
                    end
                end
            end)
            u39(u12.roleClear, function() --[[ Line: 810 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                    [3] = u5
                    [4] = u12
                --]]
                if u13.roleTarget then
                    u6:FireServer(u5.ACTION_SET_ROLE, {
                        ["userId"] = u13.roleTarget.userId,
                        ["role"] = u5.SET_ROLE_MEMBER
                    })
                    if u12.roleModal then
                        u12.roleModal.Visible = false
                    end
                end
            end)
        end
    end
end
v7.OnClientEvent:Connect(function(p214) --[[ Line: 818 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u12
        [4] = u129
        [5] = u191
        [6] = u109
        [7] = u153
    --]]
    u13.payload = type(p214) == "table" and p214 and p214 or nil
    if u13.payload then
        if u13.uiOpen or u13.openRequested then
            u15()
            u13.uiOpen = true
            u13.openRequested = false
            if u12.createModal then
                u12.createModal.Visible = false
            end
            if u12.approveModal then
                u12.approveModal.Visible = false
            end
            if u12.roleModal then
                u12.roleModal.Visible = false
            end
            if u13.payload.mode == "guild" then
                local v215, v216 = pcall(u129)
                if not v215 then
                    warn("[GuildUIController] ensureGuildGui failed:", v216)
                end
                u191(u13.payload)
                return
            elseif u13.payload.mode == "list" then
                local v217, v218 = pcall(u109)
                if not v217 then
                    warn("[GuildUIController] ensureGuildListGui failed:", v218)
                end
                u153(u13.payload)
            else
                u13.uiOpen = false
                u13.openRequested = false
                u15()
                if u12.createModal then
                    u12.createModal.Visible = false
                end
                if u12.approveModal then
                    u12.approveModal.Visible = false
                end
                if u12.roleModal then
                    u12.roleModal.Visible = false
                end
                if u12.guildListGui then
                    u12.guildListGui.Enabled = false
                end
                if u12.guildGui then
                    u12.guildGui.Enabled = false
                end
            end
        else
            return
        end
    else
        u13.uiOpen = false
        u13.openRequested = false
        u15()
        if u12.createModal then
            u12.createModal.Visible = false
        end
        if u12.approveModal then
            u12.approveModal.Visible = false
        end
        if u12.roleModal then
            u12.roleModal.Visible = false
        end
        if u12.guildListGui then
            u12.guildListGui.Enabled = false
        end
        if u12.guildGui then
            u12.guildGui.Enabled = false
        end
        return
    end
end)
v8.OnClientEvent:Connect(function(p219) --[[ Line: 837 ]]
    --[[
    Upvalues:
        [1] = u93
    --]]
    u93((type(p219) == "table" and p219 and p219 or {}).text or "")
end)
u3.InputBegan:Connect(function(p220, p221) --[[ Line: 842 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u198
        [3] = u12
        [4] = u13
        [5] = u15
    --]]
    if p221 then
        return
    elseif u3:GetFocusedTextBox() and p220.KeyCode ~= Enum.KeyCode.Escape then
        return
    elseif p220.KeyCode == Enum.KeyCode.G then
        u198()
    elseif p220.KeyCode == Enum.KeyCode.Escape then
        if u12.roleModal and u12.roleModal.Visible then
            u12.roleModal.Visible = false
            return
        end
        if u12.approveModal and u12.approveModal.Visible then
            u12.approveModal.Visible = false
            return
        end
        if u12.createModal and u12.createModal.Visible then
            u12.createModal.Visible = false
            return
        end
        u13.uiOpen = false
        u13.openRequested = false
        u15()
        if u12.createModal then
            u12.createModal.Visible = false
        end
        if u12.approveModal then
            u12.approveModal.Visible = false
        end
        if u12.roleModal then
            u12.roleModal.Visible = false
        end
        if u12.guildListGui then
            u12.guildListGui.Enabled = false
        end
        if u12.guildGui then
            u12.guildGui.Enabled = false
        end
    end
end)
task.defer(function() --[[ Line: 855 ]]
    --[[
    Upvalues:
        [1] = u213
        [2] = u13
        [3] = u15
        [4] = u12
    --]]
    u213()
    u13.uiOpen = false
    u13.openRequested = false
    u15()
    if u12.createModal then
        u12.createModal.Visible = false
    end
    if u12.approveModal then
        u12.approveModal.Visible = false
    end
    if u12.roleModal then
        u12.roleModal.Visible = false
    end
    if u12.guildListGui then
        u12.guildListGui.Enabled = false
    end
    if u12.guildGui then
        u12.guildGui.Enabled = false
    end
end)
print("[GuildUIController] initialized")