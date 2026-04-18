local v1 = {}
local v2 = {}
local v3 = {
    ["patternId"] = "arena_half_room_slam",
    ["castType"] = "arena_half_room",
    ["cooldown"] = 8.5,
    ["weight"] = 3,
    ["telegraph"] = {
        ["markerGroup"] = "halvesTelegraph",
        ["duration"] = 1.05,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.48,
        ["height"] = 0.22,
        ["lift"] = 0.08,
        ["material"] = Enum.Material.Neon
    },
    ["runtime"] = {
        ["markerGroup"] = "halvesHit",
        ["templateName"] = "ArenaHalfRoomSlashFx",
        ["rotation"] = Vector3.new(0, 0, 0),
        ["activeDuration"] = 0.22,
        ["damage"] = 420,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.18,
        ["height"] = 0.28,
        ["lift"] = 0.1
    }
}
v2.arena_half_room_slam = v3
local v4 = {
    ["patternId"] = "arena_stripe_sweep",
    ["castType"] = "arena_stripe_sweep",
    ["cooldown"] = 10.5,
    ["weight"] = 4,
    ["telegraph"] = {
        ["markerGroupX"] = "stripesXTelegraph",
        ["markerGroupZ"] = "stripesZTelegraph",
        ["duration"] = 0.7,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.6,
        ["height"] = 0.18,
        ["lift"] = 0.06,
        ["material"] = Enum.Material.Neon
    },
    ["runtime"] = {
        ["markerGroupX"] = "stripesXHit",
        ["markerGroupZ"] = "stripesZHit",
        ["projectileTemplateName"] = "ArenaArrowProjectile",
        ["projectileRotation"] = Vector3.new(0, 0, 0),
        ["laneInterval"] = 0.18,
        ["laneActiveDuration"] = 0.14,
        ["damage"] = 285,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.18,
        ["height"] = 0.32,
        ["lift"] = 0.1,
        ["projectileHeight"] = 2.4,
        ["projectileThickness"] = 0.65,
        ["projectileLength"] = 4.8,
        ["projectileSpeed"] = 88,
        ["projectileLifetime"] = 0.28
    }
}
v2.arena_stripe_sweep = v4
local v5 = {
    ["patternId"] = "arena_zone_dot",
    ["castType"] = "arena_zone_dot",
    ["cooldown"] = 13,
    ["weight"] = 2,
    ["telegraph"] = {
        ["markerGroup"] = "zoneDotsTelegraph",
        ["duration"] = 0.9,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.54,
        ["height"] = 0.2,
        ["lift"] = 0.08,
        ["material"] = Enum.Material.Neon
    },
    ["runtime"] = {
        ["markerGroup"] = "zoneDotsHit",
        ["templateName"] = "ArenaZoneDotAuraFx",
        ["rotation"] = Vector3.new(0, 0, 0),
        ["duration"] = 3,
        ["tickInterval"] = 0.5,
        ["damagePerTick"] = 92,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.3,
        ["height"] = 0.24,
        ["lift"] = 0.1
    }
}
v2.arena_zone_dot = v5
local v6 = {
    ["patternId"] = "arena_summon_soldiers",
    ["castType"] = "arena_summon",
    ["cooldown"] = 16,
    ["weight"] = 2,
    ["telegraph"] = {
        ["markerGroup"] = "summonPointsTelegraph",
        ["templateName"] = "ArenaSummonCircleFx",
        ["rotation"] = Vector3.new(0, 0, 0),
        ["duration"] = 0.95,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.54,
        ["height"] = 0.18,
        ["lift"] = 0.06,
        ["material"] = Enum.Material.Neon
    },
    ["summon"] = {
        ["markerGroup"] = "summonPoints",
        ["monsterId"] = "bandit",
        ["count"] = 3,
        ["maxActive"] = 6,
        ["lifeTime"] = 35,
        ["noRewards"] = true,
        ["isSummonOnly"] = true,
        ["noQuestKillCredit"] = true,
        ["cleanupWithOwner"] = true,
        ["runtimeSpawnKind"] = "arena_soldier"
    },
    ["runtime"] = {
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.22,
        ["height"] = 0.28,
        ["lift"] = 0.1,
        ["activeDuration"] = 0.25
    }
}
v2.arena_summon_soldiers = v6
v1.patterns = v2
local v7 = {
    ["arena_boss_template"] = {
        {
            ["patternId"] = "arena_half_room_slam",
            ["weight"] = 3
        },
        {
            ["patternId"] = "arena_stripe_sweep",
            ["weight"] = 4
        },
        {
            ["patternId"] = "arena_zone_dot",
            ["weight"] = 2
        },
        {
            ["patternId"] = "arena_summon_soldiers",
            ["weight"] = 2
        }
    },
    ["arena_bandit_lord"] = {
        {
            ["patternId"] = "arena_half_room_slam",
            ["weight"] = 3
        },
        {
            ["patternId"] = "arena_stripe_sweep",
            ["weight"] = 4
        },
        {
            ["patternId"] = "arena_zone_dot",
            ["weight"] = 3
        },
        {
            ["patternId"] = "arena_summon_soldiers",
            ["weight"] = 2
        }
    }
}
v1.sets = v7
return v1