local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = v2.Shared.Net
local v4 = v1.LocalPlayer
local u5 = v4:WaitForChild("PlayerGui")
local u6 = require(v2.Shared.Util.PlatformGui)
local v7 = u3:WaitForChild("DataSync")
local v8 = u3:WaitForChild("HudSync")
local u9 = u3:WaitForChild("PlayerDataResyncRequest")
local u10 = {
    ["NameInputGui"] = false
}
local u11 = nil
local u12 = nil
local u13 = false
local u14 = false
local u15 = ""
local function u21(p16) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local v17 = tonumber(p16) or 10
    local v18 = u6.find(u5, "NameInputGui")
    if not (v18 and v18.Parent) then
        v18 = u6.wait(u5, "NameInputGui", v17 or 10)
    end
    if not v18 then
        return nil, nil, nil, nil, nil
    end
    local v19 = v18:FindFirstChild("Box") or v18:WaitForChild("Box", v17)
    if not v19 then
        return v18, nil, nil, nil, nil
    end
    local v20 = v19:FindFirstChild("InputBg") or v19:WaitForChild("InputBg", v17)
    return v18, v19, not v20 or v20:FindFirstChild("NameInput") or (v20:WaitForChild("NameInput", v17) or nil), v19:FindFirstChild("ErrorLabel") or v19:WaitForChild("ErrorLabel", v17), v19:FindFirstChild("ConfirmBtn") or v19:WaitForChild("ConfirmBtn", v17)
end
local function u57(p22) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u11
        [4] = u12
        [5] = u6
        [6] = u5
        [7] = u10
        [8] = u21
        [9] = u3
        [10] = u15
        [11] = u9
    --]]
    if u13 ~= true then
        u14 = false
        local v23 = u11
        if v23 and v23.Disconnect then
            v23:Disconnect()
        end
        u11 = nil
        local v24 = u12
        if v24 and v24.Disconnect then
            v24:Disconnect()
        end
        u12 = nil
        local v25 = u6.setEnabled(u5, "NameInputGui", false, u10)
        u6.applyPair(u5, "NameInputGui", u10)
        if not v25 then
            u6.find(u5, "NameInputGui")
        end
        return true
    end
    local v26, v27, u28, u29, u30 = u21(p22 or 10)
    if not (v26 and (v27 and (u28 and (u29 and u30)))) then
        u14 = true
        warn("[NameInputController] UI \236\164\128\235\185\132 \236\160\132\236\157\180\235\157\188 \236\157\180\235\166\132 \236\158\133\235\160\165\236\176\189 \236\152\164\237\148\136 \235\140\128\234\184\176 \236\164\145")
        return false
    end
    local v31 = u6.setEnabled(u5, "NameInputGui", true, u10)
    u6.applyPair(u5, "NameInputGui", u10)
    local _ = v31 or u6.find(u5, "NameInputGui")
    u29.Text = ""
    u30.Active = true
    u30.AutoButtonColor = true
    local v32 = u11
    if v32 and v32.Disconnect then
        v32:Disconnect()
    end
    u11 = nil
    local v33 = u12
    if v33 and v33.Disconnect then
        v33:Disconnect()
    end
    u12 = nil
    local u34 = false
    local function u51() --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u13
            [3] = u28
            [4] = u29
            [5] = u30
            [6] = u3
            [7] = u14
            [8] = u15
            [9] = u11
            [10] = u12
            [11] = u6
            [12] = u5
            [13] = u10
            [14] = u9
        --]]
        if u34 or u13 ~= true then
            return
        else
            local u35 = u28.Text:match("^%s*(.-)%s*$") or ""
            local v36, v37 = pcall(utf8.len, u35)
            if not v36 then
                v37 = nil
            end
            if v37 then
                if v37 < 2 then
                    u29.Text = "\236\157\180\235\166\132\236\157\128 \236\181\156\236\134\140 2\236\158\144 \236\157\180\236\131\129\236\157\180\236\150\180\236\149\188 \237\149\169\235\139\136\235\139\164."
                    return
                elseif v37 > 12 then
                    u29.Text = "\236\157\180\235\166\132\236\157\128 \236\181\156\235\140\128 12\236\158\144\234\185\140\236\167\128 \234\176\128\235\138\165\237\149\169\235\139\136\235\139\164."
                    return
                else
                    u34 = true
                    u29.Text = "\236\178\152\235\166\172 \236\164\145..."
                    u30.Active = false
                    u30.AutoButtonColor = false
                    local v38, v39 = pcall(function() --[[ Line: 112 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u35
                        --]]
                        return u3.SetNameRequest:InvokeServer(u35)
                    end)
                    if v38 and (v39 and v39.success) then
                        u13 = false
                        u14 = false
                        local v40 = v39.name or u35
                        u15 = tostring(v40)
                        local v41 = u11
                        if v41 and v41.Disconnect then
                            v41:Disconnect()
                        end
                        u11 = nil
                        local v42 = u12
                        if v42 and v42.Disconnect then
                            v42:Disconnect()
                        end
                        u12 = nil
                        local v43 = u6.setEnabled(u5, "NameInputGui", false, u10)
                        u6.applyPair(u5, "NameInputGui", u10)
                        if not v43 then
                            u6.find(u5, "NameInputGui")
                        end
                        local v44 = print
                        local v45 = v39.name or u35
                        v44("[NameInput] \236\157\180\235\166\132 \236\132\164\236\160\149 \236\153\132\235\163\140: " .. tostring(v45))
                        return
                    else
                        u34 = false
                        u30.Active = true
                        u30.AutoButtonColor = true
                        local v46 = {
                            ["invalid_length"] = "2~12\236\158\144 \236\157\180\235\130\180\235\161\156 \236\158\133\235\160\165\237\149\180\236\163\188\236\132\184\236\154\148.",
                            ["invalid_chars"] = "\237\149\156\234\184\128, \236\152\129\235\172\184, \236\136\171\236\158\144, \234\179\181\235\176\177, \235\176\145\236\164\132\235\167\140 \236\130\172\236\154\169 \234\176\128\235\138\165\237\149\169\235\139\136\235\139\164.",
                            ["already_set"] = "\236\157\180\235\175\184 \236\157\180\235\166\132\236\157\180 \236\132\164\236\160\149\235\144\152\236\150\180 \236\158\136\236\138\181\235\139\136\235\139\164.",
                            ["filtered_too_short"] = "\237\149\132\237\132\176\235\167\129 \237\155\132 \236\157\180\235\166\132\236\157\180 \235\132\136\235\172\180 \236\167\167\236\138\181\235\139\136\235\139\164.",
                            ["rate_limited"] = "\236\158\160\236\139\156 \237\155\132 \235\139\164\236\139\156 \236\139\156\235\143\132\237\149\180\236\163\188\236\132\184\236\154\148.",
                            ["busy"] = "\236\157\180\235\175\184 \236\178\152\235\166\172 \236\164\145\236\158\133\235\139\136\235\139\164.",
                            ["filter_failed"] = "\236\157\180\235\166\132 \237\149\132\237\132\176\235\167\129\236\151\144 \236\139\164\237\140\168\237\150\136\236\138\181\235\139\136\235\139\164. \235\139\164\236\139\156 \236\139\156\235\143\132\237\149\180\236\163\188\236\132\184\236\154\148.",
                            ["invalid_utf8"] = "\236\157\180\235\166\132 \237\152\149\236\139\157\236\157\180 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164."
                        }
                        local v47 = v39 and v39.reason or "unknown"
                        if v47 == "already_set" then
                            u13 = false
                            u14 = false
                            local v48 = u11
                            if v48 and v48.Disconnect then
                                v48:Disconnect()
                            end
                            u11 = nil
                            local v49 = u12
                            if v49 and v49.Disconnect then
                                v49:Disconnect()
                            end
                            u12 = nil
                            local v50 = u6.setEnabled(u5, "NameInputGui", false, u10)
                            u6.applyPair(u5, "NameInputGui", u10)
                            if not v50 then
                                u6.find(u5, "NameInputGui")
                            end
                            pcall(function() --[[ Line: 31 ]]
                                --[[
                                Upvalues:
                                    [1] = u9
                                --]]
                                u9:FireServer()
                            end)
                        else
                            u29.Text = v46[v47] or "\236\152\164\235\165\152: " .. tostring(v47)
                        end
                    end
                end
            else
                u29.Text = "\236\157\180\235\166\132 \237\152\149\236\139\157\236\157\180 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164."
                return
            end
        end
    end
    u11 = u30.Activated:Connect(u51)
    u12 = u28.FocusLost:Connect(function(p52) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        if p52 then
            u51()
        end
    end)
    u14 = false
    task.defer(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
            [3] = u5
            [4] = u10
            [5] = u21
        --]]
        if u13 == true then
            local v53 = u6.setEnabled(u5, "NameInputGui", true, u10)
            u6.applyPair(u5, "NameInputGui", u10)
            if not v53 then
                u6.find(u5, "NameInputGui")
            end
            local v54, v55, v56 = u21(1)
            if v54 and (v55 and (v56 and v54.Parent)) then
                v56:CaptureFocus()
            end
        else
            return
        end
    end)
    return true
end
local function v69(p58) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u14
        [4] = u11
        [5] = u12
        [6] = u6
        [7] = u5
        [8] = u10
        [9] = u57
    --]]
    if type(p58) == "table" then
        local v59 = p58.name
        if type(v59) == "string" then
            u15 = p58.name
            if p58.name ~= "" then
                u13 = false
                u14 = false
                local v60 = u11
                if v60 and v60.Disconnect then
                    v60:Disconnect()
                end
                u11 = nil
                local v61 = u12
                if v61 and v61.Disconnect then
                    v61:Disconnect()
                end
                u12 = nil
                local v62 = u6.setEnabled(u5, "NameInputGui", false, u10)
                u6.applyPair(u5, "NameInputGui", u10)
                if not v62 then
                    u6.find(u5, "NameInputGui")
                end
            end
        end
        if p58.requiresNameInput ~= nil then
            u13 = p58.requiresNameInput == true
            if u13 then
                if u13 == true then
                    u14 = true
                    task.defer(function() --[[ Line: 155 ]]
                        --[[
                        Upvalues:
                            [1] = u57
                        --]]
                        u57(10)
                    end)
                    return
                end
                u14 = false
                local v63 = u11
                if v63 and v63.Disconnect then
                    v63:Disconnect()
                end
                u11 = nil
                local v64 = u12
                if v64 and v64.Disconnect then
                    v64:Disconnect()
                end
                u12 = nil
                local v65 = u6.setEnabled(u5, "NameInputGui", false, u10)
                u6.applyPair(u5, "NameInputGui", u10)
                if not v65 then
                    u6.find(u5, "NameInputGui")
                    return
                end
            else
                u14 = false
                local v66 = u11
                if v66 and v66.Disconnect then
                    v66:Disconnect()
                end
                u11 = nil
                local v67 = u12
                if v67 and v67.Disconnect then
                    v67:Disconnect()
                end
                u12 = nil
                local v68 = u6.setEnabled(u5, "NameInputGui", false, u10)
                u6.applyPair(u5, "NameInputGui", u10)
                if not v68 then
                    u6.find(u5, "NameInputGui")
                end
            end
        end
    end
end
u3.ShowNameInput.OnClientEvent:Connect(function() --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u14
        [4] = u11
        [5] = u12
        [6] = u6
        [7] = u5
        [8] = u10
        [9] = u57
    --]]
    u13 = true
    if u15 ~= "" then
        u15 = ""
    end
    if u13 == true then
        u14 = true
        task.defer(function() --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57(10)
        end)
    else
        u14 = false
        local v70 = u11
        if v70 and v70.Disconnect then
            v70:Disconnect()
        end
        u11 = nil
        local v71 = u12
        if v71 and v71.Disconnect then
            v71:Disconnect()
        end
        u12 = nil
        local v72 = u6.setEnabled(u5, "NameInputGui", false, u10)
        u6.applyPair(u5, "NameInputGui", u10)
        if not v72 then
            u6.find(u5, "NameInputGui")
            return
        end
    end
end)
v7.OnClientEvent:Connect(v69)
v8.OnClientEvent:Connect(v69)
u5.ChildAdded:Connect(function(p73) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u57
    --]]
    local v74 = p73 and p73.Name or ""
    if (v74 == "NameInputGui" or v74 == "NameInputGui_Mobile") and (u13 or u14) then
        task.defer(function() --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57(10)
        end)
    end
end)
u6.modeChanged:Connect(function() --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u57
    --]]
    if u13 or u14 then
        task.defer(function() --[[ Line: 197 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57(10)
        end)
    end
end)
task.defer(function() --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u13
        [4] = u14
        [5] = u57
    --]]
    u6.waitUntilReady(5)
    pcall(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:FireServer()
    end)
    if u13 or u14 then
        u57(10)
    end
end)
v4.CharacterAdded:Connect(function() --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u14
        [4] = u57
    --]]
    task.delay(0.25, function() --[[ Line: 210 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u13
            [3] = u14
            [4] = u57
        --]]
        pcall(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            u9:FireServer()
        end)
        if u13 or u14 then
            u57(10)
        end
    end)
end)
print("[NameInputController] \236\180\136\234\184\176\237\153\148 \236\153\132\235\163\140")