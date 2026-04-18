local v1 = {}
local v2 = {}
local v3 = {
    ["patternId"] = "falling_rock",
    ["displayName"] = "\235\130\153\236\132\157",
    ["castType"] = "placed_area",
    ["cooldown"] = 8,
    ["targeting"] = {
        ["mode"] = "current_target",
        ["maxDistance"] = 90,
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "circle",
        ["radius"] = 9,
        ["duration"] = 1.15,
        ["color"] = Color3.fromRGB(255, 70, 70),
        ["transparency"] = 0.35,
        ["lift"] = 2.22
    },
    ["impact"] = {
        ["spawnFallingRock"] = true,
        ["rockHeight"] = 26,
        ["rockSize"] = 7,
        ["fallTime"] = 0.22,
        ["cleanupDelay"] = 0.5,
        ["landingGap"] = 0
    },
    ["runtime"] = {
        ["radius"] = 9,
        ["damage"] = 396
    }
}
v2.falling_rock = v3
local v4 = {
    ["patternId"] = "boss_red_zone_blast",
    ["displayName"] = "\236\167\128\236\167\132 \237\140\140\235\143\153",
    ["castType"] = "self_area",
    ["cooldown"] = 9,
    ["targeting"] = {
        ["mode"] = "self",
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "circle",
        ["radius"] = 180,
        ["duration"] = 1.35,
        ["color"] = Color3.fromRGB(255, 55, 55),
        ["transparency"] = 0.32,
        ["lift"] = 2.22
    },
    ["runtime"] = {
        ["radius"] = 18,
        ["damage"] = 484
    },
    ["effects"] = {
        ["packageId"] = "boss_red_zone_heavy_slow"
    },
    ["fx"] = {
        {
            ["trigger"] = "impact",
            ["templateName"] = "QuakeEffect",
            ["attach"] = "boss_root",
            ["lifetime"] = 1.4,
            ["emitCount"] = 24,
            ["inheritRotation"] = false
        }
    }
}
v2.boss_red_zone_blast = v4
local v5 = {
    ["patternId"] = "boss_summon_minions",
    ["displayName"] = "\235\182\128\237\149\152 \236\134\140\237\153\152",
    ["castType"] = "summon",
    ["cooldown"] = 12,
    ["targeting"] = {
        ["mode"] = "self_ring",
        ["ringRadius"] = 11,
        ["minSpacing"] = 5,
        ["randomAngle"] = false
    },
    ["summon"] = {
        ["monsterId"] = "Bandit",
        ["count"] = 3,
        ["lifeTime"] = 30,
        ["maxActive"] = 6,
        ["runtimeSpawnKind"] = "Bandit",
        ["cleanupWithOwner"] = true
    }
}
v2.boss_summon_minions = v5
local v6 = {
    ["patternId"] = "skeleton_lock_shot",
    ["displayName"] = "\237\149\180\234\179\168 \237\131\132\237\153\152",
    ["castType"] = "lock_projectile",
    ["cooldown"] = 1.45,
    ["targeting"] = {
        ["mode"] = "current_target",
        ["maxDistance"] = 82,
        ["snapToGround"] = false
    },
    ["telegraph"] = {
        ["enabled"] = false,
        ["duration"] = 0
    },
    ["runtime"] = {
        ["damage"] = 286,
        ["radius"] = 2.6,
        ["travelTime"] = 0.28,
        ["lifetime"] = 0.5,
        ["startHeight"] = 2.2,
        ["targetHeightOffset"] = 1.8,
        ["lockBreakDistance"] = 96,
        ["speed"] = 96,
        ["color"] = Color3.fromRGB(255, 244, 230)
    },
    ["impact"] = {
        ["stopOnHit"] = true,
        ["color"] = Color3.fromRGB(255, 244, 230),
        ["templateName"] = "BoneShotImpact"
    }
}
v2.skeleton_lock_shot = v6
local v7 = {
    ["patternId"] = "skeleton_radial_bone_burst",
    ["displayName"] = "\237\149\180\234\179\168 \235\130\156\236\130\172",
    ["castType"] = "radial_projectile",
    ["cooldown"] = 9,
    ["targeting"] = {
        ["mode"] = "self",
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "radial_lines",
        ["count"] = 12,
        ["radius"] = 54,
        ["length"] = 54,
        ["lineWidth"] = 1.8,
        ["thickness"] = 0.22,
        ["duration"] = 1,
        ["color"] = Color3.fromRGB(255, 55, 55),
        ["transparency"] = 0.18,
        ["lift"] = 2.25
    },
    ["runtime"] = {
        ["projectileCount"] = 12,
        ["startHeight"] = 2.1,
        ["startRadius"] = 1.5,
        ["visualDistance"] = 56,
        ["speed"] = 78,
        ["lifetime"] = 0.78,
        ["radius"] = 2.8,
        ["damage"] = 438,
        ["color"] = Color3.fromRGB(255, 90, 90),
        ["randomStartAngle"] = false
    },
    ["impact"] = {
        ["stopOnHit"] = true,
        ["color"] = Color3.fromRGB(255, 90, 90)
    },
    ["fx"] = {
        {
            ["trigger"] = "projectile_spawn",
            ["templateName"] = "BoneShardProjectile",
            ["attach"] = "projectile",
            ["lifetime"] = 0.9,
            ["inheritRotation"] = true
        }
    }
}
v2.skeleton_radial_bone_burst = v7
local v8 = {
    ["patternId"] = "grid_random_strike",
    ["displayName"] = "grid_random_strike",
    ["castType"] = "placed_area",
    ["cooldown"] = 10,
    ["targeting"] = {
        ["mode"] = "players_in_radius",
        ["playerRadius"] = 140,
        ["maxPlayers"] = 6,
        ["minimumTargets"] = 1,
        ["selection"] = "random",
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "circle",
        ["radius"] = 12,
        ["duration"] = 1.25,
        ["color"] = Color3.fromRGB(255, 45, 45),
        ["transparency"] = 0.26,
        ["lift"] = 2.22
    },
    ["impact"] = {
        ["templateName"] = "GridRandomStrikeImpact",
        ["riseHeight"] = 7,
        ["riseTime"] = 0.18,
        ["holdTime"] = 0.55
    },
    ["runtime"] = {
        ["radius"] = 12,
        ["damage"] = 5200
    }
}
v2.grid_random_strike = v8
local v9 = {
    ["patternId"] = "grid_front_laser",
    ["displayName"] = "grid_front_laser",
    ["castType"] = "forward_laser",
    ["cooldown"] = 15,
    ["targeting"] = {
        ["mode"] = "self",
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "box",
        ["width"] = 28,
        ["length"] = 132,
        ["startDistance"] = 10,
        ["thickness"] = 0.18,
        ["edgeHeight"] = 0.42,
        ["lineWidth"] = 1.4,
        ["innerStripeWidth"] = 2.2,
        ["lineTransparency"] = 0.02,
        ["duration"] = 1.25,
        ["color"] = Color3.fromRGB(255, 35, 35),
        ["transparency"] = 0.14,
        ["lift"] = 0.16
    },
    ["runtime"] = {
        ["length"] = 132,
        ["width"] = 28,
        ["height"] = 18,
        ["startDistance"] = 10,
        ["beamHeight"] = 6,
        ["damage"] = 7600,
        ["beamLifeTime"] = 0.85,
        ["beamFadeTime"] = 0.2,
        ["beamExpandTime"] = 0.1,
        ["flashHoldTime"] = 0.1,
        ["postLockTime"] = 0.55
    }
}
v2.grid_front_laser = v9
local v10 = {
    ["patternId"] = "skeleton_bone_spike_field",
    ["displayName"] = "\235\188\136 \234\176\144\236\152\165",
    ["castType"] = "placed_area",
    ["cooldown"] = 11.5,
    ["targeting"] = {
        ["mode"] = "players_in_radius",
        ["playerRadius"] = 44,
        ["maxPlayers"] = 12,
        ["minimumTargets"] = 1,
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "circle",
        ["radius"] = 5.5,
        ["duration"] = 1,
        ["color"] = Color3.fromRGB(255, 55, 55),
        ["transparency"] = 0.3,
        ["lift"] = 2.22
    },
    ["impact"] = {
        ["templateName"] = "BoneSpike",
        ["riseHeight"] = 5.5,
        ["riseTime"] = 0.16,
        ["holdTime"] = 0.45
    },
    ["runtime"] = {
        ["radius"] = 5.5,
        ["damage"] = 612
    },
    ["effects"] = {
        ["packageId"] = "boss_bone_spike_stun"
    }
}
v2.skeleton_bone_spike_field = v10
v1.patterns = v2
local v11 = {}
local v12 = {}
local v13 = {
    ["patternId"] = "falling_rock",
    ["cooldown"] = 5,
    ["weight"] = 1,
    ["minRange"] = 0,
    ["maxRange"] = 90,
    ["telegraph"] = {
        ["duration"] = 1.2,
        ["radius"] = 9
    },
    ["runtime"] = {
        ["radius"] = 9,
        ["damage"] = 704
    },
    ["impact"] = {
        ["rockHeight"] = 30,
        ["rockSize"] = 9,
        ["fallTime"] = 0.2
    },
    ["multiDrop"] = {
        ["enabled"] = true,
        ["count"] = 3,
        ["includeCenter"] = true,
        ["radiusMin"] = 15,
        ["radiusMax"] = 30,
        ["minSpacing"] = 7,
        ["randomAngle"] = true,
        ["sequentialDelay"] = 0
    }
}
__set_list(v12, 1, {v13})
v11.raptor_miniboss = v12
local v14 = {}
local v15 = {
    ["patternId"] = "boss_summon_minions",
    ["cooldown"] = 10.5,
    ["weight"] = 1,
    ["minRange"] = 0,
    ["maxRange"] = 100,
    ["targeting"] = {
        ["mode"] = "self_ring",
        ["ringRadius"] = 11,
        ["minSpacing"] = 5,
        ["randomAngle"] = false
    },
    ["summon"] = {
        ["monsterId"] = "bandit",
        ["count"] = 3,
        ["lifeTime"] = 30,
        ["maxActive"] = 6,
        ["runtimeSpawnKind"] = "bandit"
    }
}
local v16 = {
    ["patternId"] = "boss_red_zone_blast",
    ["cooldown"] = 5.5,
    ["weight"] = 1,
    ["minRange"] = 0,
    ["maxRange"] = 28,
    ["telegraph"] = {
        ["duration"] = 1.35,
        ["radius"] = 180
    },
    ["runtime"] = {
        ["radius"] = 180,
        ["damage"] = 1056
    },
    ["effects"] = {
        ["packageId"] = "boss_red_zone_heavy_slow"
    }
}
local v17 = {
    ["patternId"] = "falling_rock",
    ["cooldown"] = 7.5,
    ["weight"] = 1,
    ["minRange"] = 6,
    ["maxRange"] = 100,
    ["telegraph"] = {
        ["duration"] = 1.05,
        ["radius"] = 10
    },
    ["runtime"] = {
        ["radius"] = 10,
        ["damage"] = 836
    },
    ["impact"] = {
        ["rockHeight"] = 30,
        ["rockSize"] = 10,
        ["fallTime"] = 0
    },
    ["multiDrop"] = {
        ["enabled"] = true,
        ["count"] = 14,
        ["includeCenter"] = false,
        ["radiusMin"] = 12,
        ["radiusMax"] = 64,
        ["minSpacing"] = 12,
        ["randomAngle"] = true,
        ["sequentialDelay"] = 0
    }
}
__set_list(v14, 1, {v15, v16, v17})
v11.kingbandit = v14
local v18 = {}
local v19 = {
    ["patternId"] = "grid_random_strike",
    ["cooldown"] = 8.5,
    ["weight"] = 3,
    ["minRange"] = 0,
    ["maxRange"] = 180,
    ["targeting"] = {
        ["mode"] = "players_in_radius",
        ["playerRadius"] = 250,
        ["maxPlayers"] = 8,
        ["minimumTargets"] = 1,
        ["selection"] = "random",
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["duration"] = 1.5,
        ["radius"] = 18,
        ["color"] = Color3.fromRGB(255, 40, 40),
        ["transparency"] = 0.24,
        ["lift"] = 2.22
    },
    ["runtime"] = {
        ["radius"] = 18,
        ["damage"] = 4800
    },
    ["impact"] = {
        ["templateName"] = "GridRandomStrikeImpact",
        ["riseHeight"] = 7,
        ["riseTime"] = 0.18,
        ["holdTime"] = 0.55
    }
}
local v20 = {
    ["patternId"] = "grid_front_laser",
    ["cooldown"] = 14.5,
    ["weight"] = 1,
    ["minRange"] = 0,
    ["maxRange"] = 180,
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "box",
        ["width"] = 32,
        ["length"] = 264,
        ["startDistance"] = 0,
        ["thickness"] = 0.18,
        ["edgeHeight"] = 0.42,
        ["lineWidth"] = 1.4,
        ["innerStripeWidth"] = 2.2,
        ["lineTransparency"] = 0.02,
        ["duration"] = 1.8,
        ["color"] = Color3.fromRGB(255, 35, 35),
        ["transparency"] = 0.14,
        ["lift"] = 0.16
    },
    ["runtime"] = {
        ["length"] = 264,
        ["width"] = 32,
        ["height"] = 36,
        ["startDistance"] = 0,
        ["beamHeight"] = 18,
        ["damage"] = 7600,
        ["beamLifeTime"] = 0.85,
        ["beamFadeTime"] = 0.2,
        ["beamExpandTime"] = 0.1,
        ["flashHoldTime"] = 0.1,
        ["postLockTime"] = 0.55
    }
}
__set_list(v18, 1, {v19, v20})
v11.world_boss_grid = v18
local v21 = {}
local v22 = {
    ["patternId"] = "skeleton_lock_shot",
    ["cooldown"] = 1.35,
    ["weight"] = 5,
    ["minRange"] = 0,
    ["maxRange"] = 120,
    ["targeting"] = {
        ["mode"] = "current_target",
        ["maxDistance"] = 82,
        ["snapToGround"] = false
    },
    ["runtime"] = {
        ["damage"] = 880,
        ["radius"] = 2.6,
        ["travelTime"] = 0.28,
        ["lifetime"] = 0.5,
        ["startHeight"] = 2.2,
        ["targetHeightOffset"] = 1.8,
        ["lockBreakDistance"] = 96,
        ["speed"] = 96,
        ["color"] = Color3.fromRGB(255, 244, 230)
    }
}
local v23 = {
    ["patternId"] = "skeleton_radial_bone_burst",
    ["cooldown"] = 7,
    ["weight"] = 1,
    ["minRange"] = 0,
    ["maxRange"] = 154,
    ["telegraph"] = {
        ["enabled"] = true,
        ["shape"] = "radial_lines",
        ["count"] = 12,
        ["radius"] = 54,
        ["length"] = 154,
        ["lineWidth"] = 1.8,
        ["thickness"] = 0.22,
        ["duration"] = 1,
        ["color"] = Color3.fromRGB(255, 55, 55),
        ["transparency"] = 0.18,
        ["lift"] = 2.25
    },
    ["runtime"] = {
        ["projectileCount"] = 12,
        ["startHeight"] = 2.1,
        ["startRadius"] = 1.5,
        ["visualDistance"] = 154,
        ["speed"] = 78,
        ["lifetime"] = 1.58,
        ["radius"] = 2.8,
        ["damage"] = 3444,
        ["color"] = Color3.fromRGB(255, 90, 90),
        ["randomStartAngle"] = false
    }
}
local v24 = {
    ["patternId"] = "skeleton_bone_spike_field",
    ["cooldown"] = 9.5,
    ["weight"] = 1,
    ["minRange"] = 4,
    ["maxRange"] = 154,
    ["targeting"] = {
        ["mode"] = "players_in_radius",
        ["playerRadius"] = 154,
        ["maxPlayers"] = 12,
        ["minimumTargets"] = 1,
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["telegraph"] = {
        ["duration"] = 1.25,
        ["radius"] = 20.5
    },
    ["runtime"] = {
        ["radius"] = 20.5,
        ["damage"] = 3120
    },
    ["impact"] = {
        ["templateName"] = "BoneSpike",
        ["riseHeight"] = 5.5,
        ["riseTime"] = 0.16,
        ["holdTime"] = 0.45
    },
    ["effects"] = {
        ["packageId"] = "boss_bone_spike_stun"
    }
}
__set_list(v21, 1, {v22, v23, v24})
v11.skeleton_miniboss = v21
v1.sets = v11
return v1