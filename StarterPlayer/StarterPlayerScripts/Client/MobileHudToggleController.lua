local u1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local u2 = false
local u3 = {}
local function u9(p4) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if p4 then
        for _, v5 in ipairs(p4:GetDescendants()) do
            local v6
            if v5:IsA("GuiObject") and v5.Name ~= "BtnToggle" then
                v6 = v5.Name == "BtnFrame" and true or v5.Name:sub(1, 3) == "Btn"
            else
                v6 = false
            end
            if v6 then
                v5.Visible = u2
            end
        end
        local v7 = p4:FindFirstChild("BtnToggle", true)
        local v8
        if v7 then
            v8 = v7:FindFirstChild("TextLabel", true) or v7:FindFirstChildWhichIsA("TextLabel", true)
        else
            v8 = nil
        end
        if v8 then
            v8.Text = u2 and "\226\150\182" or "\226\151\128"
        end
    end
end
local function u12(p10) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u1
        [4] = u9
    --]]
    if p10 then
        local v11 = p10:FindFirstChild("BtnToggle", true)
        if v11 and (v11:IsA("GuiButton") and not u3[v11]) then
            u3[v11] = true
            v11.Activated:Connect(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u1
                    [3] = u9
                --]]
                u2 = not u2 == true
                u9((u1:FindFirstChild("MainHUD_Mobile")))
            end)
        end
        u9(p10)
    end
end
local v13 = u1:FindFirstChild("MainHUD_Mobile")
if v13 then
    u12(v13)
end
u2 = false
u9((u1:FindFirstChild("MainHUD_Mobile")))
u1.DescendantAdded:Connect(function(u14) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u1
        [4] = u9
    --]]
    if u14.Name == "MainHUD_Mobile" then
        task.defer(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u14
                [3] = u2
                [4] = u1
                [5] = u9
            --]]
            u12(u14)
            u2 = false
            u9((u1:FindFirstChild("MainHUD_Mobile")))
        end)
        return
    elseif u14.Name == "BtnToggle" and u14:IsA("GuiButton") then
        task.defer(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u12
            --]]
            u12((u1:FindFirstChild("MainHUD_Mobile")))
        end)
    elseif u14:IsA("GuiObject") then
        local v15 = u1:FindFirstChild("MainHUD_Mobile")
        if v15 and u14:IsDescendantOf(v15) then
            local v16
            if u14:IsA("GuiObject") and u14.Name ~= "BtnToggle" then
                v16 = u14.Name == "BtnFrame" and true or u14.Name:sub(1, 3) == "Btn"
            else
                v16 = false
            end
            if v16 then
                u14.Visible = u2
            end
        end
    end
end)