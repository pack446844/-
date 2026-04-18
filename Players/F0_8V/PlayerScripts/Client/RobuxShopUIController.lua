local u1 = game:GetService("Players")
local u2 = game:GetService("StarterGui")
local v3 = game:GetService("ReplicatedStorage")
local u4 = game:GetService("UserInputService")
local v5 = v3.Shared.Net
local u6 = u1.LocalPlayer
local u7 = u6:WaitForChild("PlayerGui")
local u8 = require(v3.Shared.Util.PlatformGui)
local u9 = v5:WaitForChild("RobuxShopRequest")
local v10 = v5:WaitForChild("RobuxShopSync")
local v11 = v5:WaitForChild("RobuxShopNotice")
local u12 = v5:WaitForChild("RobuxShopState")
local u13 = {}
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = {
    "autoAttack",
    "autoPotion",
    "autoSkill",
    "vip",
    "goldPass",
    "commissionToken",
    "codexPass"
}
local u18 = {
    ["autoAttack"] = {
        ["frameName"] = "Product_AutoAttack",
        ["title"] = "\236\158\144\235\143\153 \234\179\181\234\178\169",
        ["desc"] = "\237\143\137\237\131\128\235\165\188 \236\158\144\235\143\153\236\156\188\235\161\156 \236\130\172\236\154\169\237\149\169\235\139\136\235\139\164."
    },
    ["autoPotion"] = {
        ["frameName"] = "Product_AutoPotion",
        ["title"] = "\236\158\144\235\143\153 \235\172\188\236\149\189",
        ["desc"] = "\236\178\180\235\160\165\236\157\180 \235\130\174\236\157\132 \235\149\140 \236\158\144\235\143\153\236\156\188\235\161\156 \235\172\188\236\149\189\236\157\132 \236\130\172\236\154\169\237\149\169\235\139\136\235\139\164."
    },
    ["autoSkill"] = {
        ["frameName"] = "Product_AutoSkill",
        ["title"] = "\236\158\144\235\143\153 \236\138\164\237\130\172",
        ["desc"] = "\236\188\156 \235\145\148 \236\138\172\235\161\175\235\167\140 1\226\134\1462\226\134\1463\226\134\1464 \236\136\156\236\132\156\235\161\156 \236\158\144\235\143\153 \236\139\156\236\160\132\237\149\169\235\139\136\235\139\164."
    },
    ["vip"] = {
        ["frameName"] = "Product_VIP",
        ["title"] = "VIP",
        ["desc"] = "\236\182\148\234\176\128 \234\178\189\237\151\152\236\185\152\236\153\128 \234\179\168\235\147\156 \235\179\180\235\132\136\236\138\164 +50%\235\165\188 \236\160\156\234\179\181\237\149\169\235\139\136\235\139\164."
    },
    ["goldPass"] = {
        ["frameName"] = "Product_GoldPass",
        ["title"] = "\234\179\168\235\147\156 \237\140\168\236\138\164",
        ["desc"] = "\234\179\168\235\147\156\236\157\152 +100%\235\165\188 \236\182\148\234\176\128 \236\167\128\234\184\137\237\149\169\235\139\136\235\139\164."
    },
    ["commissionToken"] = {
        ["frameName"] = "Product_CommissionToken",
        ["title"] = "\236\157\152\235\162\176 \236\166\157\237\145\156 \237\140\168\236\138\164",
        ["desc"] = "\236\157\152\235\162\176 \236\166\157\237\145\156 \235\179\180\236\131\129\236\157\132 1.5\235\176\176\235\161\156 \236\166\157\234\176\128\236\139\156\237\130\181\235\139\136\235\139\164."
    },
    ["codexPass"] = {
        ["frameName"] = "Product_CodexPass",
        ["title"] = "\235\143\132\234\176\144 \237\140\168\236\138\164",
        ["desc"] = "\235\143\132\234\176\144 \236\178\152\236\185\152 \236\185\180\236\154\180\237\138\184\235\165\188 2\235\176\176\235\161\156 \236\166\157\234\176\128\236\139\156\237\130\181\235\139\136\235\139\164."
    }
}
local u19 = {
    ["trollJailTicket"] = {
        ["frameName"] = "Product_Troll",
        ["title"] = "\237\138\184\235\161\164 \234\184\176\235\138\165",
        ["desc"] = "\236\132\160\237\131\157\237\149\156 \237\148\140\235\160\136\236\157\180\236\150\180\235\165\188 \236\157\188\236\160\149 \236\139\156\234\176\132 \234\176\144\236\152\165\236\151\144 \234\176\128\235\145\161\235\139\136\235\139\164."
    },
    ["renameTicket"] = {
        ["frameName"] = "Product_Rename",
        ["title"] = "\235\139\137\235\132\164\236\158\132 \235\179\128\234\178\189\234\182\140",
        ["desc"] = "\237\148\140\235\160\136\236\157\180\236\150\180 \235\139\137\235\132\164\236\158\132\236\157\132 1\237\154\140 \235\179\128\234\178\189\237\149\169\235\139\136\235\139\164."
    },
    ["guildRenameTicket"] = {
        ["frameName"] = "Product_GuildRename",
        ["title"] = "\234\184\184\235\147\156 \236\157\180\235\166\132 \235\179\128\234\178\189\234\182\140",
        ["desc"] = "\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176\234\176\128 \234\184\184\235\147\156 \236\157\180\235\166\132\236\157\132 1\237\154\140 \235\179\128\234\178\189\237\149\169\235\139\136\235\139\164."
    },
    ["donateBronze"] = {
        ["frameName"] = "Product_DonateBronze",
        ["title"] = "\234\184\176\235\182\128 \235\184\140\235\161\160\236\166\136",
        ["desc"] = "\234\178\140\236\158\132\236\157\132 \236\157\145\236\155\144\237\149\152\235\138\148 \234\184\176\235\182\128 \236\131\129\237\146\136\236\158\133\235\139\136\235\139\164."
    },
    ["donateSilver"] = {
        ["frameName"] = "Product_DonateSilver",
        ["title"] = "\234\184\176\235\182\128 \236\139\164\235\178\132",
        ["desc"] = "\234\178\140\236\158\132\236\157\132 \236\157\145\236\155\144\237\149\152\235\138\148 \234\184\176\235\182\128 \236\131\129\237\146\136\236\158\133\235\139\136\235\139\164. \234\181\172\235\167\164 \236\139\156 [\236\157\128\235\185\155 \237\155\132\236\155\144\236\158\144] \236\185\173\237\152\184\235\165\188 \236\167\128\234\184\137\237\149\169\235\139\136\235\139\164."
    },
    ["donateGold"] = {
        ["frameName"] = "Product_DonateGold",
        ["title"] = "\234\184\176\235\182\128 \234\179\168\235\147\156",
        ["desc"] = "\234\178\140\236\158\132\236\157\132 \236\157\145\236\155\144\237\149\152\235\138\148 \234\184\176\235\182\128 \236\131\129\237\146\136\236\158\133\235\139\136\235\139\164. \234\181\172\235\167\164 \236\139\156 [\234\184\136\235\185\155 \237\155\132\236\155\144\236\158\144] \236\185\173\237\152\184\235\165\188 \236\167\128\234\184\137\237\149\169\235\139\136\235\139\164."
    },
    ["donateGod"] = {
        ["frameName"] = "Product_DonateGod",
        ["title"] = "\234\184\176\235\182\128 \234\176\147",
        ["desc"] = "\234\178\140\236\158\132\236\157\132 \236\157\145\236\155\144\237\149\152\235\138\148 \234\184\176\235\182\128 \236\131\129\237\146\136\236\158\133\235\139\136\235\139\164. \234\181\172\235\167\164 \236\139\156 [\236\176\172\235\158\128\237\149\156 \237\155\132\236\155\144\236\158\144] \236\185\173\237\152\184\235\165\188 \236\167\128\234\184\137\237\149\169\235\139\136\235\139\164."
    }
}
local u20 = {
    "trollJailTicket",
    "renameTicket",
    "guildRenameTicket",
    "donateBronze",
    "donateSilver",
    "donateGold",
    "donateGod"
}
local u21 = {
    "donateBronze",
    "donateSilver",
    "donateGold",
    "donateGod"
}
local u22 = {
    ["autoAttack"] = "giftTicket_autoAttack",
    ["autoPotion"] = "giftTicket_autoPotion",
    ["autoSkill"] = "giftTicket_autoSkill",
    ["vip"] = "giftTicket_vip",
    ["goldPass"] = "giftTicket_goldPass",
    ["commissionToken"] = "giftTicket_commissionToken",
    ["codexPass"] = "giftTicket_codexPass"
}
local u23 = {
    ["RobuxShopGui"] = true
}
local u24 = false
local function u28(p25, u26) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local u27 = tostring(p25 or "")
    if u27 ~= "" then
        pcall(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u26
                [3] = u27
            --]]
            u2:SetCore("SendNotification", {
                ["Title"] = u26 and "\235\161\156\235\178\133\236\138\164 \236\131\129\236\160\144" or "\236\149\140\235\166\188",
                ["Text"] = u27,
                ["Duration"] = u26 and 6 or 4
            })
        end)
    end
end
local u29 = nil
local u30 = nil
local u31 = nil
local function u34() --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u13
    --]]
    local v32 = u8.find(u7, "RobuxShopGui")
    if v32 and v32.Parent then
        u13.gui = v32
        return v32
    end
    u8.waitUntilReady(5)
    local v33 = u8.find(u7, "RobuxShopGui") or u8.wait(u7, "RobuxShopGui", 10)
    u13.gui = v33
    return v33
end
local function u40() --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local v35 = {}
    local v36 = {}
    local v37 = u8.find(u7, "MainHUD")
    if v37 and (v37.Parent and not v36[v37]) then
        v36[v37] = true
        v35[#v35 + 1] = v37
    end
    local v38 = u7:FindFirstChild("MainHUD")
    if v38 and (v38.Parent and not v36[v38]) then
        v36[v38] = true
        v35[#v35 + 1] = v38
    end
    local v39 = u7:FindFirstChild("MainHUD_Mobile")
    if v39 and v39.Parent then
        if v36[v39] then
            return v35
        end
        v36[v39] = true
        v35[#v35 + 1] = v39
    end
    return v35
end
local function u42(p41) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u8
        [3] = u7
        [4] = u23
        [5] = u29
        [6] = u30
        [7] = u13
        [8] = u31
        [9] = u9
    --]]
    u24 = p41 == true
    u8.applyPair(u7, "RobuxShopGui", u23)
    if u29() then
        if u13.shopRoot then
            u13.shopRoot.Visible = u24 == true
        end
        if u24 == true then
            u31(u13.productList)
            u9:FireServer({
                ["action"] = "requestSync"
            })
        else
            u30()
        end
    else
        if u24 ~= true then
            u30()
        end
        return
    end
end
local function u46(p43, p44) --[[ Line: 142 ]]
    if p43 then
        for _, v45 in ipairs(p43:GetChildren()) do
            if v45:IsA("GuiButton") and v45 ~= p44 then
                v45:Destroy()
            end
        end
    end
end
u31 = function(u47) --[[ Name: refreshScrollCanvas, Line 149 ]]
    if u47 and u47:IsA("ScrollingFrame") then
        u47.AutomaticCanvasSize = Enum.AutomaticSize.Y
        u47.ScrollingDirection = Enum.ScrollingDirection.Y
        u47.CanvasSize = UDim2.new(0, 0, 0, 0)
        task.defer(function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            if u47 and u47.Parent then
                u47.CanvasSize = UDim2.new(0, 0, 0, 0)
            end
        end)
    end
end
local function u50(u48) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if u48 and u48:IsA("ScrollingFrame") then
        u31(u48)
        if u48:GetAttribute("ScrollCanvasBound") ~= true then
            u48:SetAttribute("ScrollCanvasBound", true)
            local v49 = u48:FindFirstChildOfClass("UIListLayout")
            if v49 then
                v49:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 167 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                        [2] = u48
                    --]]
                    u31(u48)
                end)
            end
            u48.ChildAdded:Connect(function() --[[ Line: 171 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u48
                --]]
                u31(u48)
            end)
            u48.ChildRemoved:Connect(function() --[[ Line: 174 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u48
                --]]
                u31(u48)
            end)
        end
    else
        return
    end
end
local function u56(p51, p52, p53) --[[ Line: 179 ]]
    if p51 and (p52 and p53) then
        p52.AnchorPoint = Vector2.new(1, 0.5)
        p53.AnchorPoint = Vector2.new(1, 0.5)
        p52.Position = UDim2.new(1, -96, 0.5, 0)
        p53.Position = UDim2.new(1, -8, 0.5, 0)
        p52.Size = UDim2.new(0, 82, 0, 34)
        p53.Size = UDim2.new(0, 82, 0, 34)
        local v54 = p51:FindFirstChild("DescLabel")
        if v54 and v54:IsA("TextLabel") then
            v54.Size = UDim2.new(1, -232, 1, -8)
            v54.Position = UDim2.new(0, 10, 0, 4)
            v54.TextWrapped = true
            v54.TextYAlignment = Enum.TextYAlignment.Center
        end
        local v55 = p51:FindFirstChild("OwnedLabel")
        if v55 and v55:IsA("TextLabel") then
            v55.Position = UDim2.new(1, -232, 1, -22)
            v55.Size = UDim2.new(0, 120, 0, 18)
            v55.TextXAlignment = Enum.TextXAlignment.Left
        end
    end
end
local function u62(p57) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u56
    --]]
    if not p57 then
        return nil
    end
    local v58 = p57:FindFirstChild("GiftButton")
    if v58 and v58:IsA("GuiButton") then
        local v59 = p57:FindFirstChild("BuyButton")
        if v59 and v59:IsA("GuiButton") then
            u56(p57, v59, v58)
        end
        return v58
    end
    local v60 = p57:FindFirstChild("BuyButton")
    if not (v60 and v60:IsA("GuiButton")) then
        return nil
    end
    local v61 = v60:Clone()
    v61.Name = "GiftButton"
    v61.Text = "\236\132\160\235\172\188"
    v61.Parent = p57
    u56(p57, v60, v61)
    return v61
end
local function u79(p63, p64, p65, p66, p67, p68, p69) --[[ Line: 220 ]]
    if not p63 then
        return nil
    end
    local v70 = p63:FindFirstChild(p65)
    local v71 = p63:FindFirstChild(p64)
    if v70 and v70:IsA("Frame") then
        local v72 = v70:FindFirstChild("DescLabel")
        if v72 and v72:IsA("TextLabel") then
            v72.Text = p66 .. " : " .. p67
        end
        if p68 ~= nil then
            v70.LayoutOrder = p68
        end
        local v73 = v70:FindFirstChild("OwnedLabel")
        if v73 and v73:IsA("TextLabel") then
            v73.Text = ""
            v73.Visible = false
        end
        local v74 = v70:FindFirstChild("BuyButton")
        if v74 and v74:IsA("GuiButton") then
            v74.Text = p69 or "\234\181\172\235\167\164"
        end
        return v70
    end
    if not (v71 and v71:IsA("Frame")) then
        return nil
    end
    local v75 = v71:Clone()
    v75.Name = p65
    v75.Visible = true
    if p68 == nil or not p68 then
        p68 = (v71.LayoutOrder or 0) + 10
    end
    v75.LayoutOrder = p68
    local v76 = v75:FindFirstChild("DescLabel")
    if v76 and v76:IsA("TextLabel") then
        v76.Text = p66 .. " : " .. p67
    end
    local v77 = v75:FindFirstChild("OwnedLabel")
    if v77 and v77:IsA("TextLabel") then
        v77.Text = ""
        v77.Visible = false
    end
    local v78 = v75:FindFirstChild("BuyButton")
    if v78 and v78:IsA("GuiButton") then
        v78.Text = p69 or "\234\181\172\235\167\164"
    end
    v75.Parent = p63
    return v75
end
local function u92(p80, p81, p82, p83, p84, p85) --[[ Line: 252 ]]
    local v86
    if p80 then
        v86 = p80:FindFirstChild(p82)
    else
        v86 = p80
    end
    if v86 and v86:IsA("Frame") then
        return v86
    end
    local v87
    if p80 then
        v87 = p80:FindFirstChild(p81)
    else
        v87 = p80
    end
    if not (v87 and v87:IsA("Frame")) then
        return nil
    end
    local v88 = v87:Clone()
    v88.Name = p82
    local v89
    if v88 then
        v89 = v88:FindFirstChild("TitleLabel", true)
    else
        v89 = nil
    end
    local v90
    if v88 then
        v90 = v88:FindFirstChild("WarningLabel", true)
    else
        v90 = nil
    end
    local v91
    if v88 then
        v91 = v88:FindFirstChild("InputBox", true)
    else
        v91 = nil
    end
    if v89 and v89:IsA("TextLabel") then
        v89.Text = p83
    end
    if v90 and v90:IsA("TextLabel") then
        v90.Text = p84
    end
    if v91 and v91:IsA("TextBox") then
        v91.Text = ""
        if p85 and p85 ~= "" then
            v91.PlaceholderText = p85
        end
    end
    v88.Visible = false
    v88.Parent = p80
    return v88
end
local function u99(p93) --[[ Line: 273 ]]
    local v94
    if p93 then
        v94 = p93:FindFirstChild("GiftTargetModal")
    else
        v94 = p93
    end
    if v94 and v94:IsA("Frame") then
        return v94
    end
    local v95
    if p93 then
        v95 = p93:FindFirstChild("TrollTargetModal")
    else
        v95 = p93
    end
    if not (v95 and v95:IsA("Frame")) then
        return nil
    end
    local v96 = v95:Clone()
    v96.Name = "GiftTargetModal"
    local v97
    if v96 then
        v97 = v96:FindFirstChild("TitleLabel", true)
    else
        v97 = nil
    end
    local v98
    if v96 then
        v98 = v96:FindFirstChild("BottomHint", true)
    else
        v98 = nil
    end
    if v97 and v97:IsA("TextLabel") then
        v97.Text = "\237\140\168\236\138\164 \236\132\160\235\172\188 \235\140\128\236\131\129 \236\132\160\237\131\157"
    end
    if v98 and v98:IsA("TextLabel") then
        v98.Text = "\237\152\132\236\158\172 \236\132\156\235\178\132\236\151\144 \236\160\145\236\134\141 \236\164\145\236\157\184 \237\148\140\235\160\136\236\157\180\236\150\180\235\167\140 \236\132\160\235\172\188\237\149\160 \236\136\152 \236\158\136\236\138\181\235\139\136\235\139\164."
    end
    v96.Visible = false
    v96.Parent = p93
    return v96
end
local function u127(p100) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u50
        [2] = u79
        [3] = u62
        [4] = u21
        [5] = u19
        [6] = u17
        [7] = u18
        [8] = u22
        [9] = u31
        [10] = u99
        [11] = u92
    --]]
    if p100 then
        local v101
        if p100 then
            v101 = p100:FindFirstChild("ShopRoot", true)
        else
            v101 = nil
        end
        local v102
        if v101 then
            local v103
            if v101 then
                v103 = v101:FindFirstChild("ProductList", true)
            else
                v103 = nil
            end
            v102 = v103 or nil
        else
            v102 = nil
        end
        if v102 then
            u50(v102)
            local v104 = v102:FindFirstChild("Product_AutoAttack")
            local v105 = v102:FindFirstChild("Product_Rename")
            local v106 = (v104 and v104.LayoutOrder or 0) + 10
            local v107 = (v105 and v105.LayoutOrder or 0) + 10
            local v108 = u79(v102, "Product_AutoAttack", "Product_AutoSkill", "\236\158\144\235\143\153 \236\138\164\237\130\172", "\236\188\156 \235\145\148 \236\138\172\235\161\175\235\167\140 \236\136\156\236\132\156\235\140\128\235\161\156 \236\158\144\235\143\153 \236\139\156\236\160\132\237\149\169\235\139\136\235\139\164.", v106, "\234\181\172\235\167\164")
            if v108 then
                u62(v108)
            end
            local v109 = v102:FindFirstChild("Product_VIP")
            if v109 then
                v106 = v109.LayoutOrder or v106
            end
            local v110 = v106 + 1
            local v111 = v106 + 2
            local v112 = v106 + 3
            local v113 = u79(v102, "Product_VIP", "Product_GoldPass", "\234\179\168\235\147\156 \237\140\168\236\138\164", "\234\184\176\235\179\184 \234\179\168\235\147\156\236\157\152 100%\235\165\188 \236\182\148\234\176\128 \236\167\128\234\184\137\237\149\169\235\139\136\235\139\164.", v110, "\234\181\172\235\167\164")
            if v113 then
                u62(v113)
            end
            local v114 = u79(v102, "Product_VIP", "Product_CommissionToken", "\236\157\152\235\162\176 \236\166\157\237\145\156 \237\140\168\236\138\164", "\236\157\152\235\162\176 \236\166\157\237\145\156 \235\179\180\236\131\129\236\157\132 1.5\235\176\176\235\161\156 \236\166\157\234\176\128\236\139\156\237\130\181\235\139\136\235\139\164.", v111, "\234\181\172\235\167\164")
            if v114 then
                u62(v114)
            end
            local v115 = u79(v102, "Product_VIP", "Product_CodexPass", "\235\143\132\234\176\144 \237\140\168\236\138\164", "\235\143\132\234\176\144 \236\178\152\236\185\152 \236\185\180\236\154\180\237\138\184\235\165\188 2\235\176\176\235\161\156 \236\166\157\234\176\128\236\139\156\237\130\181\235\139\136\235\139\164.", v112, "\234\181\172\235\167\164")
            if v115 then
                u62(v115)
            end
            local v116 = u79(v102, "Product_Rename", "Product_GuildRename", "\234\184\184\235\147\156 \236\157\180\235\166\132 \235\179\128\234\178\189\234\182\140", "\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176\234\176\128 \234\184\184\235\147\156 \236\157\180\235\166\132\236\157\132 1\237\154\140 \235\179\128\234\178\189\237\149\169\235\139\136\235\139\164.", v107, "\234\181\172\235\167\164")
            if v116 then
                local v117 = v116:FindFirstChild("GiftButton")
                if v117 then
                    v117:Destroy()
                end
                local v118 = v116:FindFirstChild("BuyButton")
                if v118 and v118:IsA("GuiButton") then
                    v118.Text = "\234\181\172\235\167\164"
                end
            end
            for v119, v120 in ipairs(u21) do
                local v121 = u19[v120]
                u79(v102, "Product_Rename", v121.frameName, v121.title, v121.desc, v107 + v119, "\234\184\176\235\182\128")
            end
            for _, v122 in ipairs(u17) do
                local v123 = u18[v122]
                local v124 = v102:FindFirstChild(v123.frameName)
                if v124 and v124:IsA("Frame") then
                    local v125 = v124:FindFirstChild("DescLabel")
                    if v125 and v125:IsA("TextLabel") then
                        v125.Text = v123.title .. " : " .. v123.desc
                    end
                    if u22[v122] then
                        u62(v124)
                    else
                        local v126 = v124:FindFirstChild("GiftButton")
                        if v126 then
                            v126:Destroy()
                        end
                    end
                end
            end
            u31(v102)
        end
        u99(p100)
        u92(p100, "RenameModal", "GuildRenameModal", "\234\184\184\235\147\156 \236\157\180\235\166\132 \235\179\128\234\178\189", "\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176\235\167\140 \236\130\172\236\154\169\237\149\160 \236\136\152 \236\158\136\236\138\181\235\139\136\235\139\164.", "\236\131\136 \234\184\184\235\147\156 \236\157\180\235\166\132 \236\158\133\235\160\165")
    end
end
u29 = function() --[[ Line: 346 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u13
        [3] = u127
        [4] = u24
        [5] = u50
        [6] = u18
        [7] = u20
        [8] = u19
        [9] = u8
        [10] = u7
    --]]
    local v128 = u34()
    if not v128 then
        return false
    end
    u13.gui = v128
    u127(v128)
    local v129 = u13
    local v130
    if v128 then
        v130 = v128:FindFirstChild("ShopRoot", true)
    else
        v130 = nil
    end
    v129.shopRoot = v130
    if u13.shopRoot then
        u13.shopRoot.Visible = u24 == true
    end
    local v131 = u13
    local v132
    if u13.shopRoot then
        local v133 = u13.shopRoot
        local v134
        if v133 then
            v134 = v133:FindFirstChild("CloseButton", true)
        else
            v134 = nil
        end
        v132 = v134 or nil
    else
        v132 = nil
    end
    v131.shopClose = v132
    local v135 = u13
    local v136
    if u13.shopRoot then
        local v137 = u13.shopRoot
        local v138
        if v137 then
            v138 = v137:FindFirstChild("ProductList", true)
        else
            v138 = nil
        end
        v136 = v138 or nil
    else
        v136 = nil
    end
    v135.productList = v136
    u50(u13.productList)
    u13.passRows = {}
    u13.buyButtons = {}
    u13.ownedLabels = {}
    u13.giftButtons = {}
    for v139, v140 in pairs(u18) do
        local v141 = u13.productList and u13.productList:FindFirstChild(v140.frameName) or nil
        u13.passRows[v139] = v141
        local v142 = u13.buyButtons
        local v143
        if v141 then
            v143 = v141:FindFirstChild("BuyButton") or nil
        else
            v143 = nil
        end
        v142[v139] = v143
        local v144 = u13.ownedLabels
        local v145
        if v141 then
            v145 = v141:FindFirstChild("OwnedLabel") or nil
        else
            v145 = nil
        end
        v144[v139] = v145
        u13.giftButtons[v139] = v141 and v141:FindFirstChild("GiftButton") or nil
    end
    u13.consumableRows = {}
    u13.consumableButtons = {}
    u13.consumableOwnedLabels = {}
    for _, v146 in ipairs(u20) do
        local v147 = u19[v146]
        local v148 = u13.productList and u13.productList:FindFirstChild(v147.frameName) or nil
        u13.consumableRows[v146] = v148
        local v149 = u13.consumableButtons
        local v150
        if v148 then
            v150 = v148:FindFirstChild("BuyButton") or nil
        else
            v150 = nil
        end
        v149[v146] = v150
        u13.consumableOwnedLabels[v146] = v148 and v148:FindFirstChild("OwnedLabel") or nil
    end
    local v151 = u13
    local v152
    if v128 then
        v152 = v128:FindFirstChild("TrollTargetModal", true)
    else
        v152 = nil
    end
    v151.trollModal = v152
    local v153 = u13
    local v154
    if u13.trollModal then
        local v155 = u13.trollModal
        local v156
        if v155 then
            v156 = v155:FindFirstChild("CloseButton", true)
        else
            v156 = nil
        end
        v154 = v156 or nil
    else
        v154 = nil
    end
    v153.trollClose = v154
    local v157 = u13
    local v158
    if u13.trollModal then
        local v159 = u13.trollModal
        local v160
        if v159 then
            v160 = v159:FindFirstChild("PlayerList", true)
        else
            v160 = nil
        end
        v158 = v160 or nil
    else
        v158 = nil
    end
    v157.playerList = v158
    u13.playerTemplate = u13.playerList and u13.playerList:FindFirstChild("PlayerTemplate") or nil
    u50(u13.playerList)
    local v161 = u13
    local v162
    if v128 then
        v162 = v128:FindFirstChild("GiftTargetModal", true)
    else
        v162 = nil
    end
    v161.giftModal = v162
    local v163 = u13
    local v164
    if u13.giftModal then
        local v165 = u13.giftModal
        local v166
        if v165 then
            v166 = v165:FindFirstChild("CloseButton", true)
        else
            v166 = nil
        end
        v164 = v166 or nil
    else
        v164 = nil
    end
    v163.giftClose = v164
    local v167 = u13
    local v168
    if u13.giftModal then
        local v169 = u13.giftModal
        local v170
        if v169 then
            v170 = v169:FindFirstChild("PlayerList", true)
        else
            v170 = nil
        end
        v168 = v170 or nil
    else
        v168 = nil
    end
    v167.giftPlayerList = v168
    u13.giftPlayerTemplate = u13.giftPlayerList and u13.giftPlayerList:FindFirstChild("PlayerTemplate") or nil
    u50(u13.giftPlayerList)
    local v171 = u13
    local v172
    if v128 then
        v172 = v128:FindFirstChild("RenameModal", true)
    else
        v172 = nil
    end
    v171.renameModal = v172
    local v173 = u13
    local v174
    if u13.renameModal then
        local v175 = u13.renameModal
        local v176
        if v175 then
            v176 = v175:FindFirstChild("CloseButton", true)
        else
            v176 = nil
        end
        v174 = v176 or nil
    else
        v174 = nil
    end
    v173.renameClose = v174
    local v177 = u13
    local v178
    if u13.renameModal then
        local v179 = u13.renameModal
        local v180
        if v179 then
            v180 = v179:FindFirstChild("InputBox", true)
        else
            v180 = nil
        end
        v178 = v180 or nil
    else
        v178 = nil
    end
    v177.renameInput = v178
    local v181 = u13
    local v182
    if u13.renameModal then
        local v183 = u13.renameModal
        local v184
        if v183 then
            v184 = v183:FindFirstChild("ConfirmButton", true)
        else
            v184 = nil
        end
        v182 = v184 or nil
    else
        v182 = nil
    end
    v181.renameConfirm = v182
    local v185 = u13
    local v186
    if u13.renameModal then
        local v187 = u13.renameModal
        local v188
        if v187 then
            v188 = v187:FindFirstChild("CancelButton", true)
        else
            v188 = nil
        end
        v186 = v188 or nil
    else
        v186 = nil
    end
    v185.renameCancel = v186
    local v189 = u13
    local v190
    if v128 then
        v190 = v128:FindFirstChild("GuildRenameModal", true)
    else
        v190 = nil
    end
    v189.guildRenameModal = v190
    local v191 = u13
    local v192
    if u13.guildRenameModal then
        local v193 = u13.guildRenameModal
        local v194
        if v193 then
            v194 = v193:FindFirstChild("CloseButton", true)
        else
            v194 = nil
        end
        v192 = v194 or nil
    else
        v192 = nil
    end
    v191.guildRenameClose = v192
    local v195 = u13
    local v196
    if u13.guildRenameModal then
        local v197 = u13.guildRenameModal
        local v198
        if v197 then
            v198 = v197:FindFirstChild("InputBox", true)
        else
            v198 = nil
        end
        v196 = v198 or nil
    else
        v196 = nil
    end
    v195.guildRenameInput = v196
    local v199 = u13
    local v200
    if u13.guildRenameModal then
        local v201 = u13.guildRenameModal
        local v202
        if v201 then
            v202 = v201:FindFirstChild("ConfirmButton", true)
        else
            v202 = nil
        end
        v200 = v202 or nil
    else
        v200 = nil
    end
    v199.guildRenameConfirm = v200
    local v203 = u13
    local v204
    if u13.guildRenameModal then
        local v205 = u13.guildRenameModal
        local v206
        if v205 then
            v206 = v205:FindFirstChild("CancelButton", true)
        else
            v206 = nil
        end
        v204 = v206 or nil
    else
        v204 = nil
    end
    v203.guildRenameCancel = v204
    local v207 = u13
    local v208
    if v128 then
        v208 = v128:FindFirstChild("LeftExtraButtons", true)
    else
        v208 = nil
    end
    v207.leftExtra = v208
    local v209 = u8.find(u7, "MainHUD") or (u7:FindFirstChild("MainHUD") or u7:FindFirstChild("MainHUD_Mobile"))
    local v210 = u13.leftExtra and u13.leftExtra:FindFirstChild("AutoAttackButton")
    if not v210 then
        if v128 then
            v210 = v128:FindFirstChild("AutoAttackButton", true)
        else
            v210 = nil
        end
        if not v210 then
            if v209 then
                if v209 then
                    v210 = v209:FindFirstChild("AutoAttackButton", true)
                else
                    v210 = nil
                end
            else
                v210 = v209
            end
        end
    end
    local v211 = u13.leftExtra and u13.leftExtra:FindFirstChild("AutoPotionButton")
    if not v211 then
        if v128 then
            v211 = v128:FindFirstChild("AutoPotionButton", true)
        else
            v211 = nil
        end
        if not v211 then
            if v209 then
                if v209 then
                    v211 = v209:FindFirstChild("AutoPotionButton", true)
                else
                    v211 = nil
                end
            else
                v211 = v209
            end
        end
    end
    local v212 = u13
    if not (v210 and (v210:IsA("GuiButton") and v210)) then
        v210 = nil
    end
    v212.autoAttackButton = v210
    local v213 = u13
    if not (v211 and (v211:IsA("GuiButton") and v211)) then
        v211 = nil
    end
    v213.autoPotionButton = v211
    u13.autoSkillHudButtons = {}
    for v214 = 1, 4 do
        local v215 = u13.leftExtra and u13.leftExtra:FindFirstChild("AutoSkill" .. tostring(v214) .. "Button")
        if not v215 then
            local v216 = "AutoSkill" .. tostring(v214) .. "Button"
            if v128 then
                v215 = v128:FindFirstChild(v216, true)
            else
                v215 = nil
            end
            if not v215 then
                if v209 then
                    local v217 = "AutoSkill" .. tostring(v214) .. "Button"
                    if v209 then
                        v215 = v209:FindFirstChild(v217, true)
                    else
                        v215 = nil
                    end
                else
                    v215 = v209
                end
            end
        end
        local v218 = u13.autoSkillHudButtons
        if not (v215 and (v215:IsA("GuiButton") and v215)) then
            v215 = nil
        end
        v218[v214] = v215
    end
    return u13.shopRoot ~= nil
end
u30 = function() --[[ Line: 441 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v219 = u13.trollModal
    if v219 then
        v219.Visible = false
    end
    local v220 = u13.giftModal
    if v220 then
        v220.Visible = false
    end
    local v221 = u13.renameModal
    if v221 then
        v221.Visible = false
    end
    local v222 = u13.guildRenameModal
    if v222 then
        v222.Visible = false
    end
end
local function u223() --[[ Line: 448 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u24
    --]]
    u42(u24 ~= true)
end
local function u236(p224, p225, u226) --[[ Line: 455 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u1
        [3] = u6
        [4] = u9
        [5] = u13
        [6] = u31
    --]]
    if p224 and p225 then
        u46(p224, p225)
        p225.Visible = false
        local v227 = {}
        for _, v228 in ipairs(u1:GetPlayers()) do
            if v228 and (v228.Parent and (u226 == nil or v228 ~= u6)) then
                v227[#v227 + 1] = v228
            end
        end
        table.sort(v227, function(p229, p230) --[[ Line: 465 ]]
            return string.lower(p229.Name) < string.lower(p230.Name)
        end)
        for _, u231 in ipairs(v227) do
            local v232 = p225:Clone()
            local v233 = u231.UserId
            v232.Name = "Player_" .. tostring(v233)
            v232.Visible = true
            v232.Text = u231.DisplayName and u231.DisplayName ~= "" and u231.DisplayName or u231.Name
            v232.Parent = p224
            v232.Activated:Connect(function() --[[ Line: 472 ]]
                --[[
                Upvalues:
                    [1] = u226
                    [2] = u9
                    [3] = u231
                    [4] = u13
                --]]
                if u226 then
                    u9:FireServer({
                        ["action"] = "useGiftTicket",
                        ["passKey"] = u226,
                        ["targetUserId"] = u231.UserId
                    })
                    local v234 = u13.giftModal
                    if v234 then
                        v234.Visible = false
                        return
                    end
                else
                    u9:FireServer({
                        ["action"] = "useTrollJail",
                        ["targetUserId"] = u231.UserId
                    })
                    local v235 = u13.trollModal
                    if v235 then
                        v235.Visible = false
                    end
                end
            end)
        end
        u31(p224)
    end
end
local function u241() --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u42
        [3] = u14
        [4] = u28
        [5] = u29
        [6] = u236
        [7] = u13
        [8] = u31
    --]]
    if u24 ~= true then
        u42(true)
    end
    if u14 and (u14.usable and u14.usable.trollJail == true) then
        if u29() then
            u236(u13.playerList, u13.playerTemplate, nil)
            local v237 = u13.renameModal
            if v237 then
                v237.Visible = false
            end
            local v238 = u13.guildRenameModal
            if v238 then
                v238.Visible = false
            end
            local v239 = u13.giftModal
            if v239 then
                v239.Visible = false
            end
            local v240 = u13.trollModal
            if v240 then
                v240.Visible = true
            end
            u31(u13.playerList)
        end
    else
        return u28("\237\138\184\235\161\164 \234\176\144\236\152\165 \236\157\180\236\154\169\234\182\140\236\157\132 \235\168\188\236\160\128 \234\181\172\235\167\164\237\149\180 \236\163\188\236\132\184\236\154\148.", true)
    end
end
local function u249(p242) --[[ Line: 497 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u28
        [3] = u29
        [4] = u16
        [5] = u236
        [6] = u13
        [7] = u31
    --]]
    local v243 = tostring(p242 or "")
    local v244 = u14 and (u14.consumables and u14.consumables.giftTickets) or {}
    if (v244 and (v244[v243] or 0) or 0) <= 0 then
        return u28("\235\168\188\236\160\128 \236\132\160\235\172\188\234\182\140\236\157\132 \234\181\172\235\167\164\237\149\180 \236\163\188\236\132\184\236\154\148.", true)
    elseif u29() then
        u16 = v243
        u236(u13.giftPlayerList, u13.giftPlayerTemplate, v243)
        local v245 = u13.trollModal
        if v245 then
            v245.Visible = false
        end
        local v246 = u13.renameModal
        if v246 then
            v246.Visible = false
        end
        local v247 = u13.guildRenameModal
        if v247 then
            v247.Visible = false
        end
        local v248 = u13.giftModal
        if v248 then
            v248.Visible = true
        end
        u31(u13.giftPlayerList)
    end
end
local function u254() --[[ Line: 511 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u42
        [3] = u14
        [4] = u28
        [5] = u29
        [6] = u13
    --]]
    if u24 ~= true then
        u42(true)
    end
    if u14 and (u14.usable and u14.usable.rename == true) then
        if u29() then
            if u13.renameInput then
                u13.renameInput.Text = ""
            end
            local v250 = u13.trollModal
            if v250 then
                v250.Visible = false
            end
            local v251 = u13.giftModal
            if v251 then
                v251.Visible = false
            end
            local v252 = u13.guildRenameModal
            if v252 then
                v252.Visible = false
            end
            local v253 = u13.renameModal
            if v253 then
                v253.Visible = true
            end
            if u13.renameInput then
                task.defer(function() --[[ Line: 520 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    u13.renameInput:CaptureFocus()
                end)
            end
        end
    else
        return u28("\235\139\137\235\132\164\236\158\132 \235\179\128\234\178\189\234\182\140\236\157\132 \235\168\188\236\160\128 \234\181\172\235\167\164\237\149\180 \236\163\188\236\132\184\236\154\148.", true)
    end
end
local function u259() --[[ Line: 523 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u42
        [3] = u14
        [4] = u28
        [5] = u29
        [6] = u13
    --]]
    if u24 ~= true then
        u42(true)
    end
    if u14 and (u14.usable and u14.usable.guildRename == true) then
        if u29() then
            if u13.guildRenameInput then
                u13.guildRenameInput.Text = ""
            end
            local v255 = u13.trollModal
            if v255 then
                v255.Visible = false
            end
            local v256 = u13.giftModal
            if v256 then
                v256.Visible = false
            end
            local v257 = u13.renameModal
            if v257 then
                v257.Visible = false
            end
            local v258 = u13.guildRenameModal
            if v258 then
                v258.Visible = true
            end
            if u13.guildRenameInput then
                task.defer(function() --[[ Line: 532 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    u13.guildRenameInput:CaptureFocus()
                end)
            end
        end
    else
        return u28("\234\184\184\235\147\156 \236\157\180\235\166\132 \235\179\128\234\178\189\234\182\140\236\157\132 \235\168\188\236\160\128 \234\181\172\235\167\164\237\149\180 \236\163\188\236\132\184\236\154\148.", true)
    end
end
local function u267() --[[ Line: 538 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
    --]]
    local v260 = u14 or {}
    local v261 = v260.passes
    if v261 then
        v261 = v260.passes.autoSkill == true
    end
    local v262 = v260.autoSkillSlots
    local v263 = type(v262) == "table" and (v260.autoSkillSlots or {}) or {}
    for v264 = 1, 4 do
        local v265 = u13.autoSkillHudButtons
        if v265 then
            v265 = u13.autoSkillHudButtons[v264]
        end
        if v265 then
            local v266 = v263[v264] == true
            v265.Visible = v261 == true
            v265.Active = v261 == true
            v265.AutoButtonColor = v261 == true
            v265.BackgroundColor3 = v266 and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
            v265.TextTransparency = v261 == true and 0 or 0.25
        end
    end
end
local function u277() --[[ Line: 555 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u267
    --]]
    local v268 = u14
    local v269 = v268 and v268.passes
    if v269 then
        v269 = v268.passes.autoAttack == true
    end
    local v270 = v268 and v268.passes
    if v270 then
        v270 = v268.passes.autoPotion == true
    end
    local v271 = v268 and v268.toggles
    if v271 then
        v271 = v268.toggles.autoAttack == true
    end
    local v272 = v268 and v268.toggles
    if v272 then
        v272 = v268.toggles.autoPotion == true
    end
    if u13.autoAttackButton then
        u13.autoAttackButton.Visible = v269
        u13.autoAttackButton.Text = "\236\158\144\235\143\153 \234\179\181\234\178\169" .. (v271 and " : ON" or " : OFF")
        u13.autoAttackButton.BackgroundColor3 = v271 and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(255, 0, 0)
    end
    if u13.autoPotionButton then
        u13.autoPotionButton.Visible = v270
        u13.autoPotionButton.Text = "\236\158\144\235\143\153 \235\172\188\236\149\189" .. (v272 and " : ON" or " : OFF")
        u13.autoPotionButton.BackgroundColor3 = v272 and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(255, 0, 0)
    end
    u267()
    if u13.leftExtra then
        local v273 = u13.autoAttackButton and u13.autoAttackButton.Visible == true and true or false
        local v274 = u13.autoPotionButton and u13.autoPotionButton.Visible == true and true or v273
        for v275 = 1, 4 do
            local v276 = u13.autoSkillHudButtons
            if v276 then
                v276 = u13.autoSkillHudButtons[v275]
            end
            if v276 and v276.Visible == true then
                v274 = true
                break
            end
        end
        u13.leftExtra.Visible = v274
    end
end
local function u296(p278) --[[ Line: 590 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u18
        [3] = u14
        [4] = u22
    --]]
    local v279 = u13.passRows[p278]
    local v280 = u13.buyButtons[p278]
    local v281 = u13.ownedLabels[p278]
    local v282 = u13.giftButtons[p278]
    local v283 = u18[p278]
    local v284 = u14 or {}
    if v279 then
        v279.Visible = true
    end
    local v285 = v284.configured and v284.configured.passes
    if v285 then
        v285 = v284.configured.passes[p278] == true
    end
    local v286 = v284.passes
    if v286 then
        v286 = v284.passes[p278] == true
    end
    local v287 = v284.consumables and v284.consumables.giftTickets or {}
    local v288 = 0
    if v287 then
        v287 = v287[p278]
    end
    local v289 = tonumber(v287) or 0
    local v290 = math.floor(v289)
    local v291 = math.max(v288, v290)
    local v292 = v286 and "\235\179\180\236\156\160\236\164\145" or ""
    if v281 then
        v281.Visible = v286 == true
        if v292 ~= nil then
            v281.Text = v292
        end
    end
    if v282 then
        v282.Visible = u22[p278] ~= nil
    end
    if v285 then
        local v293 = not v286
        local v294 = v286 and "\235\179\180\236\156\160\236\164\145" or "\234\181\172\235\167\164"
        if v280 then
            v280.Active = v293 == true
            v280.AutoButtonColor = v293 == true
            if v294 ~= nil then
                v280.Text = v294
            end
            v280.TextTransparency = v293 == true and 0 or 0.25
        end
        if v282 then
            local v295 = v291 > 0 and "\236\132\160\235\172\188(" .. tostring(v291) .. ")" or "\236\132\160\235\172\188"
            if v282 then
                v282.Active = true
                v282.AutoButtonColor = true
                if v295 ~= nil then
                    v282.Text = v295
                end
                v282.TextTransparency = 0
            end
        end
        if v279 then
            v279 = v279:FindFirstChild("DescLabel")
        end
        if v279 and (v279:IsA("TextLabel") and v283) then
            v279.Text = v283.title .. " : " .. v283.desc
        end
    else
        if v280 then
            v280.Active = false
            v280.AutoButtonColor = false
            v280.Text = "\235\175\184\236\132\164\236\160\149"
            v280.TextTransparency = 0.25
        end
        if v282 then
            if not v282 then
                return
            end
            v282.Active = false
            v282.AutoButtonColor = false
            v282.Text = "\235\175\184\236\132\164\236\160\149"
            v282.TextTransparency = 0.25
        end
    end
end
local function u318(p297) --[[ Line: 616 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    local v298 = u13.consumableRows[p297]
    local v299 = u13.consumableButtons[p297]
    local v300 = u13.consumableOwnedLabels[p297]
    local v301 = u14 or {}
    local v302 = v301.consumables or {}
    local v303 = v301.usable or {}
    local v304 = v301.configured and v301.configured.products
    if v304 then
        v304 = v301.configured.products[p297] ~= false
    end
    if v298 then
        v298.Visible = true
    end
    local v305 = 0
    local v306 = "\234\181\172\235\167\164"
    local v307 = ""
    if p297 == "trollJailTicket" then
        local v308 = v302.trollJailCharges
        local v309 = tonumber(v308) or 0
        local v310 = math.floor(v309)
        v305 = math.max(0, v310)
        if v303.trollJail == true then
            v306 = "\236\130\172\236\154\169"
        end
    elseif p297 == "renameTicket" then
        local v311 = v302.renameTickets
        local v312 = tonumber(v311) or 0
        local v313 = math.floor(v312)
        v305 = math.max(0, v313)
        if v303.rename == true then
            v306 = "\236\130\172\236\154\169"
        end
    elseif p297 == "guildRenameTicket" then
        local v314 = v302.guildRenameTickets
        local v315 = tonumber(v314) or 0
        local v316 = math.floor(v315)
        v305 = math.max(0, v316)
        if v303.guildRename == true then
            v306 = "\236\130\172\236\154\169"
        end
    elseif p297 == "donateBronze" or (p297 == "donateSilver" or (p297 == "donateGold" or p297 == "donateGod")) then
        v305 = 0
        v306 = "\234\184\176\235\182\128"
    end
    if v305 > 0 then
        v307 = "\235\179\180\236\156\160 " .. tostring(v305) .. "\234\176\156"
    end
    local v317 = v305 > 0
    if v300 then
        v300.Visible = v317 == true
        if v307 ~= nil then
            v300.Text = v307
        end
    end
    if v304 then
        if v299 then
            v299.Active = true
            v299.AutoButtonColor = true
            if v306 ~= nil then
                v299.Text = v306
            end
            v299.TextTransparency = 0
        end
    elseif v299 then
        v299.Active = false
        v299.AutoButtonColor = false
        v299.Text = "\235\175\184\236\132\164\236\160\149"
        v299.TextTransparency = 0.25
    end
end
local function u325(p319) --[[ Line: 652 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u29
        [3] = u17
        [4] = u296
        [5] = u20
        [6] = u318
        [7] = u277
        [8] = u31
        [9] = u13
        [10] = u15
        [11] = u241
        [12] = u254
        [13] = u259
        [14] = u249
    --]]
    u14 = type(p319) == "table" and p319 and p319 or u14
    if u14 and u29() then
        for _, v320 in ipairs(u17) do
            u296(v320)
        end
        for _, v321 in ipairs(u20) do
            u318(v321)
        end
        u277()
        u31(u13.productList)
        local v322 = u15
        if type(v322) == "table" then
            if u15.kind == "troll" and (u14.usable and u14.usable.trollJail == true) then
                u15 = nil
                u241()
                return
            end
            if u15.kind == "rename" and (u14.usable and u14.usable.rename == true) then
                u15 = nil
                u254()
                return
            end
            if u15.kind == "guildRename" and (u14.usable and u14.usable.guildRename == true) then
                u15 = nil
                u259()
                return
            end
            if u15.kind == "gift" then
                local v323 = u14.consumables and u14.consumables.giftTickets or {}
                if (v323 and v323[u15.passKey] or 0) > 0 then
                    local v324 = u15.passKey
                    u15 = nil
                    u249(v324)
                end
            end
        end
    end
end
local function u337() --[[ Line: 685 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u7
        [3] = u223
    --]]
    local v326 = {}
    local v327 = {}
    for _, v328 in ipairs((u40())) do
        local v329
        if v328 then
            v329 = v328:FindFirstChild("BtnRobux", true)
        else
            v329 = nil
        end
        if v329 and (v329:IsA("GuiButton") and not v326[v329]) then
            v326[v329] = true
            v327[#v327 + 1] = v329
        end
        local v330
        if v328 then
            v330 = v328:FindFirstChild("BtnR$", true)
        else
            v330 = nil
        end
        if v330 and v330:IsA("GuiButton") then
            if not v326[v330] then
                v326[v330] = true
                v327[#v327 + 1] = v330
            end
        end
    end
    local v331 = u7
    local v332
    if v331 then
        v332 = v331:FindFirstChild("BtnRobux", true)
    else
        v332 = nil
    end
    if v332 and (v332:IsA("GuiButton") and not v326[v332]) then
        v326[v332] = true
        v327[#v327 + 1] = v332
    end
    local v333 = u7
    local v334
    if v333 then
        v334 = v333:FindFirstChild("BtnR$", true)
    else
        v334 = nil
    end
    if v334 and (v334:IsA("GuiButton") and not v326[v334]) then
        v326[v334] = true
        v327[#v327 + 1] = v334
    end
    for _, v335 in ipairs(v327) do
        local v336 = u223
        if v335 then
            if v335:GetAttribute("RobuxOpenBound") ~= true then
                v335:SetAttribute("RobuxOpenBound", true)
                v335.Activated:Connect(v336)
            end
        end
    end
end
local function u345() --[[ Line: 701 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
    --]]
    local v338 = u13.autoAttackButton
    local function v339() --[[ Line: 702 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:FireServer({
            ["action"] = "toggleFeature",
            ["featureKey"] = "autoAttack"
        })
    end
    if v338 and v338:GetAttribute("RobuxToggleBound") ~= true then
        v338:SetAttribute("RobuxToggleBound", true)
        v338.Activated:Connect(v339)
    end
    local v340 = u13.autoPotionButton
    local function v341() --[[ Line: 705 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:FireServer({
            ["action"] = "toggleFeature",
            ["featureKey"] = "autoPotion"
        })
    end
    if v340 and v340:GetAttribute("RobuxToggleBound") ~= true then
        v340:SetAttribute("RobuxToggleBound", true)
        v340.Activated:Connect(v341)
    end
    if u13.autoSkillHudButtons then
        for u342 = 1, 4 do
            local v343 = u13.autoSkillHudButtons[u342]
            local function v344() --[[ Line: 711 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u342
                --]]
                u9:FireServer({
                    ["action"] = "toggleAutoSkillSlot",
                    ["slotIndex"] = u342
                })
            end
            if v343 then
                if v343:GetAttribute("AutoSkillHudBound") ~= true then
                    v343:SetAttribute("AutoSkillHudBound", true)
                    v343.Activated:Connect(v344)
                end
            end
        end
    end
end
local function u354(u346) --[[ Line: 718 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u22
        [4] = u14
        [5] = u249
        [6] = u15
    --]]
    local v347 = u13.buyButtons[u346]
    local v348 = u13.giftButtons[u346]
    local v349 = "RobuxPassBuyBound_" .. u346
    local function v350() --[[ Line: 721 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u346
        --]]
        u9:FireServer({
            ["action"] = "purchasePass",
            ["passKey"] = u346
        })
    end
    if v347 and v347:GetAttribute(v349) ~= true then
        v347:SetAttribute(v349, true)
        v347.Activated:Connect(v350)
    end
    if u22[u346] then
        local v351 = "RobuxPassGiftBound_" .. u346
        local function v353() --[[ Line: 725 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u346
                [3] = u249
                [4] = u15
                [5] = u9
                [6] = u22
            --]]
            local v352 = u14 and (u14.consumables and u14.consumables.giftTickets) or {}
            if (v352 and v352[u346] or 0) > 0 then
                u249(u346)
            else
                u15 = {
                    ["kind"] = "gift",
                    ["passKey"] = u346
                }
                u9:FireServer({
                    ["action"] = "purchaseProduct",
                    ["productKey"] = u22[u346]
                })
            end
        end
        if not v348 then
            return
        end
        if v348:GetAttribute(v351) == true then
            return
        end
        v348:SetAttribute(v351, true)
        v348.Activated:Connect(v353)
    end
end
local function u392() --[[ Line: 737 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u23
        [4] = u337
        [5] = u29
        [6] = u345
        [7] = u13
        [8] = u24
        [9] = u42
        [10] = u17
        [11] = u354
        [12] = u14
        [13] = u241
        [14] = u15
        [15] = u9
        [16] = u254
        [17] = u259
        [18] = u21
    --]]
    u8.applyPair(u7, "RobuxShopGui", u23)
    u337()
    if u29() then
        u345()
        if u13.shopRoot then
            u13.shopRoot.Visible = u24 == true
        end
        local v355 = u13.shopClose
        local function v356() --[[ Line: 744 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42(false)
        end
        if v355 and v355:GetAttribute("RobuxShopCloseBound") ~= true then
            v355:SetAttribute("RobuxShopCloseBound", true)
            v355.Activated:Connect(v356)
        end
        local v357 = u13.trollClose
        local function v359() --[[ Line: 747 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v358 = u13.trollModal
            if v358 then
                v358.Visible = false
            end
        end
        if v357 and v357:GetAttribute("RobuxTrollCloseBound") ~= true then
            v357:SetAttribute("RobuxTrollCloseBound", true)
            v357.Activated:Connect(v359)
        end
        local v360 = u13.giftClose
        local function v362() --[[ Line: 750 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v361 = u13.giftModal
            if v361 then
                v361.Visible = false
            end
        end
        if v360 and v360:GetAttribute("RobuxGiftCloseBound") ~= true then
            v360:SetAttribute("RobuxGiftCloseBound", true)
            v360.Activated:Connect(v362)
        end
        local v363 = u13.renameClose
        local function v365() --[[ Line: 753 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v364 = u13.renameModal
            if v364 then
                v364.Visible = false
            end
        end
        if v363 and v363:GetAttribute("RobuxRenameCloseBound") ~= true then
            v363:SetAttribute("RobuxRenameCloseBound", true)
            v363.Activated:Connect(v365)
        end
        local v366 = u13.renameCancel
        local function v368() --[[ Line: 756 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v367 = u13.renameModal
            if v367 then
                v367.Visible = false
            end
        end
        if v366 and v366:GetAttribute("RobuxRenameCancelBound") ~= true then
            v366:SetAttribute("RobuxRenameCancelBound", true)
            v366.Activated:Connect(v368)
        end
        local v369 = u13.guildRenameClose
        local function v371() --[[ Line: 759 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v370 = u13.guildRenameModal
            if v370 then
                v370.Visible = false
            end
        end
        if v369 and v369:GetAttribute("RobuxGuildRenameCloseBound") ~= true then
            v369:SetAttribute("RobuxGuildRenameCloseBound", true)
            v369.Activated:Connect(v371)
        end
        local v372 = u13.guildRenameCancel
        local function v374() --[[ Line: 762 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v373 = u13.guildRenameModal
            if v373 then
                v373.Visible = false
            end
        end
        if v372 and v372:GetAttribute("RobuxGuildRenameCancelBound") ~= true then
            v372:SetAttribute("RobuxGuildRenameCancelBound", true)
            v372.Activated:Connect(v374)
        end
        for _, v375 in ipairs(u17) do
            u354(v375)
        end
        local v376 = u13.consumableButtons.trollJailTicket
        local function v377() --[[ Line: 768 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u241
                [3] = u15
                [4] = u9
            --]]
            if u14 and (u14.usable and u14.usable.trollJail == true) then
                u241()
            else
                u15 = {
                    ["kind"] = "troll"
                }
                u9:FireServer({
                    ["action"] = "purchaseProduct",
                    ["productKey"] = "trollJailTicket"
                })
            end
        end
        if v376 and v376:GetAttribute("RobuxConsumable_trollJailTicket") ~= true then
            v376:SetAttribute("RobuxConsumable_trollJailTicket", true)
            v376.Activated:Connect(v377)
        end
        local v378 = u13.consumableButtons.renameTicket
        local function v379() --[[ Line: 777 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u254
                [3] = u15
                [4] = u9
            --]]
            if u14 and (u14.usable and u14.usable.rename == true) then
                u254()
            else
                u15 = {
                    ["kind"] = "rename"
                }
                u9:FireServer({
                    ["action"] = "purchaseProduct",
                    ["productKey"] = "renameTicket"
                })
            end
        end
        if v378 and v378:GetAttribute("RobuxConsumable_renameTicket") ~= true then
            v378:SetAttribute("RobuxConsumable_renameTicket", true)
            v378.Activated:Connect(v379)
        end
        local v380 = u13.consumableButtons.guildRenameTicket
        local function v381() --[[ Line: 786 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u259
                [3] = u15
                [4] = u9
            --]]
            if u14 and (u14.usable and u14.usable.guildRename == true) then
                u259()
            else
                u15 = {
                    ["kind"] = "guildRename"
                }
                u9:FireServer({
                    ["action"] = "purchaseProduct",
                    ["productKey"] = "guildRenameTicket"
                })
            end
        end
        if v380 and v380:GetAttribute("RobuxConsumable_guildRenameTicket") ~= true then
            v380:SetAttribute("RobuxConsumable_guildRenameTicket", true)
            v380.Activated:Connect(v381)
        end
        for _, u382 in ipairs(u21) do
            local v383 = u13.consumableButtons[u382]
            local v384 = "RobuxDonation_" .. u382
            local function v385() --[[ Line: 796 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u382
                --]]
                u9:FireServer({
                    ["action"] = "purchaseProduct",
                    ["productKey"] = u382
                })
            end
            if v383 then
                if v383:GetAttribute(v384) ~= true then
                    v383:SetAttribute(v384, true)
                    v383.Activated:Connect(v385)
                end
            end
        end
        local v386 = u13.renameConfirm
        local function v388() --[[ Line: 801 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u9
            --]]
            u9:FireServer({
                ["action"] = "submitRename",
                ["name"] = u13.renameInput and u13.renameInput.Text or ""
            })
            local v387 = u13.renameModal
            if v387 then
                v387.Visible = false
            end
        end
        if v386 and v386:GetAttribute("RobuxRenameConfirmBound") ~= true then
            v386:SetAttribute("RobuxRenameConfirmBound", true)
            v386.Activated:Connect(v388)
        end
        local v389 = u13.guildRenameConfirm
        local function v391() --[[ Line: 806 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u9
            --]]
            u9:FireServer({
                ["action"] = "submitGuildRename",
                ["name"] = u13.guildRenameInput and u13.guildRenameInput.Text or ""
            })
            local v390 = u13.guildRenameModal
            if v390 then
                v390.Visible = false
            end
        end
        if v389 then
            if v389:GetAttribute("RobuxGuildRenameConfirmBound") ~= true then
                v389:SetAttribute("RobuxGuildRenameConfirmBound", true)
                v389.Activated:Connect(v391)
            end
        else
            return
        end
    else
        return
    end
end
u4.InputBegan:Connect(function(p393, p394) --[[ Line: 824 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u24
        [4] = u42
    --]]
    if not (p394 or u4:GetFocusedTextBox()) then
        if p393.KeyCode == Enum.KeyCode.Escape then
            if u13.guildRenameModal and u13.guildRenameModal.Visible then
                local v395 = u13.guildRenameModal
                if v395 then
                    v395.Visible = false
                end
                return
            end
            if u13.renameModal and u13.renameModal.Visible then
                local v396 = u13.renameModal
                if v396 then
                    v396.Visible = false
                end
                return
            end
            if u13.giftModal and u13.giftModal.Visible then
                local v397 = u13.giftModal
                if v397 then
                    v397.Visible = false
                end
                return
            end
            if u13.trollModal and u13.trollModal.Visible then
                local v398 = u13.trollModal
                if v398 then
                    v398.Visible = false
                end
                return
            end
            if u24 == true then
                u42(false)
                return
            end
        end
    end
end)
u7.DescendantAdded:Connect(function(p399) --[[ Line: 835 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u392
        [3] = u14
        [4] = u325
    --]]
    if p399 then
        local v400 = p399.Name
        if p399:IsA("GuiButton") and (v400 == "AutoAttackButton" or (v400 == "AutoPotionButton" or (v400 == "BtnRobux" or v400 == "BtnR$")) or (v400 == "AutoSkill1Button" or (v400 == "AutoSkill2Button" or v400 == "AutoSkill3Button") or v400 == "AutoSkill4Button")) then
            task.defer(function() --[[ Line: 839 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u392
                    [3] = u14
                    [4] = u325
                --]]
                if u29() then
                    u392()
                    if u14 then
                        u325(u14)
                    end
                end
            end)
        end
    end
end)
u7.ChildAdded:Connect(function(p401) --[[ Line: 851 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u392
        [3] = u29
        [4] = u24
        [5] = u30
        [6] = u14
        [7] = u325
    --]]
    local v402 = p401 and p401.Name or ""
    if (v402 == "RobuxShopGui" or (v402 == "RobuxShopGui_Mobile" or v402 == "MainHUD")) and true or v402 == "MainHUD_Mobile" then
        for v403 in pairs(u13) do
            u13[v403] = nil
        end
        task.defer(function() --[[ Line: 815 ]]
            --[[
            Upvalues:
                [1] = u392
                [2] = u29
                [3] = u13
                [4] = u24
                [5] = u30
                [6] = u14
                [7] = u325
            --]]
            u392()
            if u29() then
                if u13.shopRoot then
                    u13.shopRoot.Visible = u24 == true
                end
                if u24 ~= true then
                    u30()
                end
                if u14 then
                    u325(u14)
                end
            end
        end)
    end
end)
u7.ChildRemoved:Connect(function(p404) --[[ Line: 856 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u392
        [3] = u29
        [4] = u24
        [5] = u30
        [6] = u14
        [7] = u325
    --]]
    local v405 = p404 and p404.Name or ""
    if (v405 == "RobuxShopGui" or (v405 == "RobuxShopGui_Mobile" or v405 == "MainHUD")) and true or v405 == "MainHUD_Mobile" then
        for v406 in pairs(u13) do
            u13[v406] = nil
        end
        task.defer(function() --[[ Line: 815 ]]
            --[[
            Upvalues:
                [1] = u392
                [2] = u29
                [3] = u13
                [4] = u24
                [5] = u30
                [6] = u14
                [7] = u325
            --]]
            u392()
            if u29() then
                if u13.shopRoot then
                    u13.shopRoot.Visible = u24 == true
                end
                if u24 ~= true then
                    u30()
                end
                if u14 then
                    u325(u14)
                end
            end
        end)
    end
end)
u8.modeChanged:Connect(function() --[[ Line: 861 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u392
        [3] = u29
        [4] = u24
        [5] = u30
        [6] = u14
        [7] = u325
    --]]
    for v407 in pairs(u13) do
        u13[v407] = nil
    end
    task.defer(function() --[[ Line: 815 ]]
        --[[
        Upvalues:
            [1] = u392
            [2] = u29
            [3] = u13
            [4] = u24
            [5] = u30
            [6] = u14
            [7] = u325
        --]]
        u392()
        if u29() then
            if u13.shopRoot then
                u13.shopRoot.Visible = u24 == true
            end
            if u24 ~= true then
                u30()
            end
            if u14 then
                u325(u14)
            end
        end
    end)
end)
u1.PlayerAdded:Connect(function() --[[ Line: 865 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u236
        [3] = u16
    --]]
    if u13.trollModal and u13.trollModal.Visible then
        u236(u13.playerList, u13.playerTemplate, nil)
    end
    if u13.giftModal and u13.giftModal.Visible then
        u236(u13.giftPlayerList, u13.giftPlayerTemplate, u16)
    end
end)
u1.PlayerRemoving:Connect(function() --[[ Line: 869 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u236
        [3] = u16
    --]]
    if u13.trollModal and u13.trollModal.Visible then
        u236(u13.playerList, u13.playerTemplate, nil)
    end
    if u13.giftModal and u13.giftModal.Visible then
        u236(u13.giftPlayerList, u13.giftPlayerTemplate, u16)
    end
end)
v11.OnClientEvent:Connect(function(p408) --[[ Line: 874 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v409 = type(p408) == "table" and p408 or {}
    local v410 = v409.text or ""
    local u411 = v409.isError == true
    local u412 = tostring(v410 or "")
    if u412 ~= "" then
        pcall(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u411
                [3] = u412
            --]]
            u2:SetCore("SendNotification", {
                ["Title"] = u411 and "\235\161\156\235\178\133\236\138\164 \236\131\129\236\160\144" or "\236\149\140\235\166\188",
                ["Text"] = u412,
                ["Duration"] = u411 and 6 or 4
            })
        end)
    end
end)
v10.OnClientEvent:Connect(function(p413) --[[ Line: 879 ]]
    --[[
    Upvalues:
        [1] = u325
    --]]
    u325(p413)
end)
task.spawn(function() --[[ Line: 883 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u392
        [3] = u29
        [4] = u13
        [5] = u24
        [6] = u12
        [7] = u325
    --]]
    u8.waitUntilReady(5)
    u392()
    if u29() then
        if u13.shopRoot then
            u13.shopRoot.Visible = u24 == true
        end
        local v414, v415 = pcall(function() --[[ Line: 888 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12:InvokeServer()
        end)
        if v414 and type(v415) == "table" then
            u325(v415)
        end
    end
end)
print("[RobuxShopUIController] initialized")