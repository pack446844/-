local u1 = {
    ["REQUEST_RATE_LIMIT"] = 0.15,
    ["BUFF_TICK_INTERVAL"] = 1,
    ["PROFILE_SYNC_INTERVAL"] = 15,
    ["TIME_DISPLAY_CAP_MINUTES"] = 999,
    ["EXP_BUFF_MULTIPLIER"] = 1.3,
    ["GOLD_BUFF_MULTIPLIER"] = 1.3,
    ["ITEMS"] = {
        {
            ["id"] = "exp_buff_15m",
            ["enabled"] = true,
            ["sortOrder"] = 10,
            ["category"] = "buff",
            ["type"] = "timed_exp_buff",
            ["displayName"] = "\234\178\189\237\151\152\236\185\152 \235\178\132\237\148\132 15\235\182\132",
            ["description"] = "\234\181\172\235\167\164 \236\166\137\236\139\156 \236\160\129\236\154\169\235\144\169\235\139\136\235\139\164. \236\160\145\236\134\141 \236\164\145\236\157\184 \236\139\156\234\176\132\235\167\140 \234\176\144\236\134\140\237\149\169\235\139\136\235\139\164.",
            ["priceToken"] = 20,
            ["durationSeconds"] = 900
        },
        {
            ["id"] = "gold_buff_15m",
            ["enabled"] = true,
            ["sortOrder"] = 20,
            ["category"] = "buff",
            ["type"] = "timed_gold_buff",
            ["displayName"] = "\234\179\168\235\147\156 \235\178\132\237\148\132 15\235\182\132",
            ["description"] = "\234\181\172\235\167\164 \236\166\137\236\139\156 \236\160\129\236\154\169\235\144\169\235\139\136\235\139\164. \236\160\145\236\134\141 \236\164\145\236\157\184 \236\139\156\234\176\132\235\167\140 \234\176\144\236\134\140\237\149\169\235\139\136\235\139\164.",
            ["priceToken"] = 20,
            ["durationSeconds"] = 900
        },
        {
            ["id"] = "title_village_protecter",
            ["enabled"] = true,
            ["sortOrder"] = 100,
            ["category"] = "title",
            ["type"] = "title_unlock",
            ["displayName"] = "\236\136\152\237\152\184 \234\184\176\236\130\172",
            ["description"] = "\236\136\152\235\167\142\236\157\128 \236\157\152\235\162\176\235\165\188 \237\149\180\234\178\176\237\149\152\235\169\176 \235\167\136\236\157\132\236\151\144 \234\179\181\237\151\140\237\149\156 \236\158\144\236\151\144\234\178\140 \236\163\188\236\150\180\236\167\128\235\138\148 \236\185\173\237\152\184.",
            ["priceToken"] = 250,
            ["titleId"] = "village_protecter"
        }
    }
}
local u2 = {}
for _, v3 in ipairs(u1.ITEMS) do
    if v3.enabled ~= false then
        local v4 = v3.id or ""
        u2[tostring(v4)] = v3
    end
end
function u1.getItem(p5) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2[tostring(p5 or "")]
end
function u1.getItems() --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v6 = {}
    for _, v7 in ipairs(u1.ITEMS) do
        if v7.enabled ~= false then
            v6[#v6 + 1] = v7
        end
    end
    table.sort(v6, function(p8, p9) --[[ Line: 31 ]]
        local v10
        if p8 then
            v10 = p8.sortOrder
        else
            v10 = p8
        end
        local v11 = tonumber(v10) or 0
        local v12 = math.floor(v11)
        local v13
        if p9 then
            v13 = p9.sortOrder
        else
            v13 = p9
        end
        local v14 = tonumber(v13) or 0
        local v15 = math.floor(v14)
        if v12 ~= v15 then
            return v12 < v15
        end
        local v16 = p8 and p8.id or ""
        local v17 = tostring(v16)
        local v18 = p9 and p9.id or ""
        return v17 < tostring(v18)
    end)
    return v6
end
return u1