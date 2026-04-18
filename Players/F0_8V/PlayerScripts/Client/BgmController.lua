local v1 = game:GetService("Players")
local u2 = game:GetService("SoundService")
local v3 = game:GetService("ReplicatedStorage")
local u4 = v1.LocalPlayer
local u5 = require(v3.Shared.Defs.SoundDefs)
local function u8(p6) --[[ Line: 10 ]]
    if type(p6) == "string" then
        local v7 = p6:gsub("%s+", "")
        if v7 == "" then
            return nil
        elseif v7:match("^rbxassetid://") or (v7:match("^rbxasset://") or v7:match("^https?://")) then
            return v7
        elseif v7:match("^%d+$") then
            return "rbxassetid://" .. v7
        else
            return v7
        end
    else
        return nil
    end
end
local function v19() --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u2
        [4] = u4
    --]]
    local v9 = u5.bgm
    local v10 = type(v9) == "table" and u5.bgm or nil
    local v11
    if v10 then
        v11 = u8(v10.soundId) or nil
    else
        v11 = nil
    end
    local u12 = u2:FindFirstChild("BackgroundMusic")
    if not (u12 and u12:IsA("Sound")) then
        u12 = Instance.new("Sound")
        u12.Name = "BackgroundMusic"
        u12.Parent = u2
    end
    if v10 and (v10.enabled ~= false and v11) then
        u12.SoundId = v11
        local v13 = v10.volume
        local v14 = tonumber(v13) or 0.32
        local v15 = u4
        local v16 = tonumber(v15:GetAttribute("BgmVolume"))
        u12.Volume = v14 * (not v16 and 1 or (v16 < 0 and 0 or (v16 > 1 and 1 or v16)))
        local v17 = v10.playbackSpeed
        u12.PlaybackSpeed = tonumber(v17) or 1
        u12.Looped = v10.looped ~= false
        u12.RollOffMaxDistance = 10000
        u12.RollOffMinDistance = 10
        if u12.IsLoaded then
            if not u12.IsPlaying then
                u12:Play()
                return
            end
        else
            local u18 = nil
            u18 = u12.Loaded:Connect(function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u12
                --]]
                if u18 then
                    u18:Disconnect()
                end
                if not u12.IsPlaying then
                    u12:Play()
                end
            end)
            u12:Play()
        end
    else
        u12:Stop()
        u12.SoundId = ""
    end
end
u4:GetAttributeChangedSignal("BgmVolume"):Connect(v19)
v19()