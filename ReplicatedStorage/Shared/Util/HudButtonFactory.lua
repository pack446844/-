local v1 = {}
local u2 = {
    ["BtnFight"] = "Fight",
    ["BtnSetting"] = "Setting",
    ["BtnTitle"] = "Title"
}
local u3 = {
    ["BtnFight"] = 1,
    ["BtnSetting"] = 2,
    ["BtnTitle"] = 3
}
local u4 = {
    ["BtnFight"] = 1,
    ["BtnSetting"] = 2,
    ["BtnTitle"] = 3
}
local function u8(p5, p6) --[[ Line: 12 ]]
    for _, v7 in ipairs(p5:GetDescendants()) do
        if v7:IsA("TextLabel") then
            v7.Text = p6
        end
    end
    if p5:IsA("TextButton") then
        p5.Text = ""
    end
end
local function u18(p9, p10, p11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    local v12
    if p9 then
        v12 = p9:FindFirstChild(p10)
    else
        v12 = p9
    end
    if v12 and v12:IsA("TextButton") then
        return v12
    end
    local v13
    if p9 then
        v13 = p9:FindFirstChild("BtnRobux")
    else
        v13 = p9
    end
    local v14
    if v13 and v13:IsA("TextButton") then
        v14 = v13:Clone()
        v14.Name = p10
        u8(v14, p11)
        v14.Visible = true
        v14.Parent = p9
    else
        v14 = nil
    end
    if not v14 then
        local v15
        if p9 then
            v15 = p9:FindFirstChild("BtnEquip")
        else
            v15 = p9
        end
        if v15 and v15:IsA("TextButton") then
            v14 = v15:Clone()
            v14.Name = p10
            u8(v14, p11)
            v14.Visible = true
            v14.Parent = p9
        else
            v14 = nil
        end
        if not v14 then
            local v16
            if p9 then
                v16 = p9:FindFirstChild("BtnGuild")
            else
                v16 = p9
            end
            if v16 and v16:IsA("TextButton") then
                v14 = v16:Clone()
                v14.Name = p10
                u8(v14, p11)
                v14.Visible = true
                v14.Parent = p9
            else
                v14 = nil
            end
        end
    end
    if not v14 then
        return nil
    end
    local v17 = u4[p10] or 1
    v14.Position = UDim2.new(0, 18, 0, 774 + (v17 - 1) * 78)
    v14.Size = UDim2.new(0, 88, 0, 52)
    v14:SetAttribute("AutoCreated", true)
    return v14
end
local function u29(p19, p20, p21) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local v22
    if p19 then
        v22 = p19:FindFirstChild(p20)
    else
        v22 = p19
    end
    if v22 and v22:IsA("TextButton") then
        return v22
    end
    local v23
    if p19 then
        v23 = p19:FindFirstChild("BtnRobux")
    else
        v23 = p19
    end
    local v24
    if v23 and v23:IsA("TextButton") then
        v24 = v23:Clone()
        v24.Name = p20
        u8(v24, p21)
        v24.Visible = true
        v24.Parent = p19
    else
        v24 = nil
    end
    if not v24 then
        local v25
        if p19 then
            v25 = p19:FindFirstChild("BtnEquip")
        else
            v25 = p19
        end
        if v25 and v25:IsA("TextButton") then
            v24 = v25:Clone()
            v24.Name = p20
            u8(v24, p21)
            v24.Visible = true
            v24.Parent = p19
        else
            v24 = nil
        end
        if not v24 then
            local v26
            if p19 then
                v26 = p19:FindFirstChild("BtnGuild")
            else
                v26 = p19
            end
            if v26 and v26:IsA("TextButton") then
                v24 = v26:Clone()
                v24.Name = p20
                u8(v24, p21)
                v24.Visible = true
                v24.Parent = p19
            else
                v24 = nil
            end
        end
    end
    if not v24 then
        return nil
    end
    local v27 = u3[p20] or 1
    local v28 = v27 == 1 and 0.540245593 or (v27 == 2 and 0.620736718 or 0.705320597)
    v24.Position = UDim2.new(v28, 0, 0, 56)
    v24.Size = UDim2.new(0, 50, 0, 50)
    v24:SetAttribute("AutoCreated", true)
    return v24
end
function v1.ensureButton(p30, p31, p32) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u29
    --]]
    local v33 = p32 or (u2[p31] or p31)
    local v34 = tostring(v33)
    local v35 = {}
    local v36
    if p30 then
        v36 = p30:FindFirstChild("MainHUD")
    else
        v36 = p30
    end
    if v36 then
        v35[#v35 + 1] = u18(v36, p31, v34)
    end
    if p30 then
        p30 = p30:FindFirstChild("MainHUD_Mobile")
    end
    if p30 then
        v35[#v35 + 1] = u29(p30, p31, v34)
    end
    return v35
end
return v1