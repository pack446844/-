local v1 = {
    ["CATEGORY_ORDER"] = { "normal", "boss", "world_boss" },
    ["STAT_LABELS"] = {
        ["attackPct"] = "\234\179\181\234\178\169\235\160\165",
        ["maxHpPct"] = "\236\178\180\235\160\165",
        ["moveSpeedPct"] = "\236\138\164\237\148\188\235\147\156",
        ["bossDamagePct"] = "\235\179\180\236\138\164 \237\148\188\237\149\180\235\159\137",
        ["damageReductionPct"] = "\237\148\188\237\149\180 \234\176\144\236\134\140\235\159\137"
    },
    ["STAT_CAPS"] = {
        ["attackPct"] = 0.5,
        ["maxHpPct"] = 0.5,
        ["moveSpeedPct"] = 0.5,
        ["bossDamagePct"] = 0.5,
        ["damageReductionPct"] = 0.5
    },
    ["PASS_MULTIPLIER"] = 2,
    ["ENTRIES"] = {
        {
            ["monsterId"] = "rabbit",
            ["category"] = "normal",
            ["goal"] = 500,
            ["statKey"] = "attackPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 10,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "deer",
            ["category"] = "normal",
            ["goal"] = 500,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 20,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "pig",
            ["category"] = "normal",
            ["goal"] = 1000,
            ["statKey"] = "moveSpeedPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 30,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "snail",
            ["category"] = "normal",
            ["goal"] = 1000,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 40,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "fox",
            ["category"] = "normal",
            ["goal"] = 1500,
            ["statKey"] = "damageReductionPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 50,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "crab",
            ["category"] = "normal",
            ["goal"] = 1500,
            ["statKey"] = "attackPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 60,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "wolf",
            ["category"] = "normal",
            ["goal"] = 2000,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 70,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "bear",
            ["category"] = "normal",
            ["goal"] = 2000,
            ["statKey"] = "moveSpeedPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 80,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "zombie",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "moveSpeedPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 90,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "iceslime",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "damageReductionPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 100,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "icebear",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "attackPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 110,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "spider",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 120,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "skeleton",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "moveSpeedPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 130,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "golem",
            ["category"] = "normal",
            ["goal"] = 2500,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 140,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "posionscorpion",
            ["category"] = "normal",
            ["goal"] = 3500,
            ["statKey"] = "damageReductionPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 150,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "mummy",
            ["category"] = "normal",
            ["goal"] = 3500,
            ["statKey"] = "attackPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 160,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "redmummy",
            ["category"] = "normal",
            ["goal"] = 3500,
            ["statKey"] = "maxHpPct",
            ["statValue"] = 0.01,
            ["sortOrder"] = 170,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "raptor_miniboss",
            ["category"] = "boss",
            ["goal"] = 30,
            ["statKey"] = "bossDamagePct",
            ["statValue"] = 0.02,
            ["sortOrder"] = 210,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "kingbandit",
            ["category"] = "boss",
            ["goal"] = 20,
            ["statKey"] = "bossDamagePct",
            ["statValue"] = 0.02,
            ["sortOrder"] = 220,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "skeleton_miniboss",
            ["category"] = "boss",
            ["goal"] = 30,
            ["statKey"] = "bossDamagePct",
            ["statValue"] = 0.02,
            ["sortOrder"] = 230,
            ["enabled"] = true
        },
        {
            ["monsterId"] = "grid",
            ["category"] = "world_boss",
            ["goal"] = 10,
            ["statKey"] = "attackPct",
            ["statValue"] = 0.03,
            ["sortOrder"] = 310,
            ["enabled"] = true
        }
    },
    ["BY_MONSTER_ID"] = {},
    ["BY_CATEGORY"] = {
        ["normal"] = {},
        ["boss"] = {},
        ["world_boss"] = {}
    }
}
for _, v2 in ipairs(v1.ENTRIES) do
    if v2 and v2.enabled ~= false then
        local v3 = v2.monsterId
        if type(v3) == "string" and v2.monsterId ~= "" then
            v1.BY_MONSTER_ID[v2.monsterId] = v2
            local v4 = v2.category or "normal"
            local v5 = tostring(v4)
            if v1.BY_CATEGORY[v5] then
                v1.BY_CATEGORY[v5][#v1.BY_CATEGORY[v5] + 1] = v2
            end
        end
    end
end
for _, v6 in pairs(v1.BY_CATEGORY) do
    table.sort(v6, function(p7, p8) --[[ Line: 64 ]]
        local v9
        if p7 then
            v9 = p7.sortOrder
        else
            v9 = p7
        end
        local v10 = tonumber(v9) or 0
        local v11
        if p8 then
            v11 = p8.sortOrder
        else
            v11 = p8
        end
        local v12 = tonumber(v11) or 0
        if v10 ~= v12 then
            return v10 < v12
        end
        local v13 = p7 and p7.monsterId or ""
        local v14 = tostring(v13)
        local v15 = p8 and p8.monsterId or ""
        return v14 < tostring(v15)
    end)
end
return v1