local v1 = {}
local v2 = {
    ["jobId"] = "mage",
    ["skillId"] = "fireball",
    ["displayName"] = "\237\140\140\236\157\180\236\150\180\235\179\188",
    ["cooldown"] = 2,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\149\235\169\180\236\156\188\235\161\156 \235\182\136\235\141\169\236\157\180\235\165\188 \235\176\156\236\130\172\237\149\156\235\139\164.",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 1.5,
        ["speed"] = 65,
        ["radius"] = 3,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 40,
        ["scale"] = 1.05
    },
    ["fx"] = {
        ["key"] = "fireball",
        ["templateName"] = "FlyingFireball"
    }
}
v1.fireball = v2
local v3 = {
    ["jobId"] = "mage",
    ["skillId"] = "ice_burst",
    ["displayName"] = "\236\149\132\236\157\180\236\138\164 \235\178\132\236\138\164\237\138\184",
    ["cooldown"] = 8,
    ["icon"] = "rbxassetid://87101851390441",
    ["description"] = "\236\158\144\236\139\160 \236\163\188\235\179\128 \236\160\129\235\147\164\236\151\144\234\178\140 \236\150\188\236\157\140 \237\143\173\235\176\156 \237\148\188\237\149\180\235\165\188 \236\163\188\234\179\160 \236\150\188\235\166\176\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 20,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 350,
        ["scale"] = 1
    },
    ["effects"] = {
        ["packageId"] = "ice_burst_ice",
        ["targetPolicy"] = "enemies",
        ["radius"] = 20,
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    }
}
local v4 = {
    ["key"] = "ice_burst",
    ["templateName"] = "IceBurst",
    ["mode"] = "self_area",
    ["burst"] = {
        ["radius"] = 20,
        ["time"] = 0.25
    }
}
v3.fx = v4
v1.ice_burst = v3
local v5 = {
    ["jobId"] = "mage",
    ["skillId"] = "meteor",
    ["displayName"] = "\235\169\148\237\133\140\236\152\164",
    ["cooldown"] = 18.5,
    ["icon"] = "",
    ["description"] = "\236\167\128\236\160\149\237\149\156 \236\167\128\236\160\144\236\151\144 \236\158\160\236\139\156 \237\155\132 \235\169\148\237\133\140\236\152\164\235\165\188 \235\150\168\236\150\180\235\156\168\235\166\176\235\139\164.",
    ["castType"] = "placed_area",
    ["targetPolicy"] = "enemies",
    ["placement"] = {
        ["maxDistance"] = 56,
        ["fallbackForwardDistance"] = 14,
        ["snapToGround"] = true,
        ["groundOffset"] = 0.2
    },
    ["runtime"] = {
        ["startDelay"] = 0.75,
        ["duration"] = 0.15,
        ["tickInterval"] = 0.15,
        ["radius"] = 50,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 480,
        ["scale"] = 3.5
    }
}
local v6 = {
    ["centerFx"] = {
        ["style"] = "burst",
        ["size"] = 7,
        ["color"] = Color3.fromRGB(255, 135, 70),
        ["lifetime"] = 0.35
    }
}
v5.impactActions = v6
local v7 = {
    ["key"] = "meteor",
    ["templateName"] = "Meteor",
    ["mode"] = "placed_area",
    ["lifetime"] = 3,
    ["sequence"] = {
        ["style"] = "falling_strike",
        ["fallingPartName"] = "Slash_Skill1",
        ["burstModelName"] = "Red Explosion",
        ["ringModelNames"] = { "spin" },
        ["startDelay"] = 0.03,
        ["fallDuration"] = 0.75,
        ["impactOffset"] = Vector3.new(0, 2, 0),
        ["skyOffset"] = Vector3.new(-25, 140, -25),
        ["burstExpandDuration"] = 0.5,
        ["ringExpandDuration"] = 0.55,
        ["burstFadeDelay"] = 0.25,
        ["burstFadeDuration"] = 0.75,
        ["ringFadeDelay"] = 0.65,
        ["ringFadeDuration"] = 0.55,
        ["finalHold"] = 0.6,
        ["cleanupDelay"] = 0.15
    }
}
v5.fx = v7
v1.meteor = v5
local v8 = {
    ["jobId"] = "warrior",
    ["skillId"] = "ground_slam",
    ["displayName"] = "\236\167\128\235\169\180\234\176\149\237\131\128",
    ["cooldown"] = 2.3,
    ["icon"] = "",
    ["description"] = "\235\149\133\236\157\132 \235\130\180\235\160\164\236\176\141\235\138\148\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 12,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 60,
        ["scale"] = 1.2
    }
}
local v9 = {
    ["key"] = "ground_slam",
    ["templateName"] = "GroundSlam",
    ["mode"] = "self_area",
    ["burst"] = {
        ["radius"] = 12,
        ["time"] = 0.25
    }
}
v8.fx = v9
v1.ground_slam = v8
local v10 = {
    ["jobId"] = "warrior",
    ["skillId"] = "warrior_power_up",
    ["displayName"] = "\237\140\140\236\155\140\236\151\133",
    ["cooldown"] = 19,
    ["icon"] = "",
    ["description"] = "\236\158\144\236\139\160\236\151\144\234\178\140 \235\178\132\237\148\132\235\165\188 \234\177\180\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["effects"] = {
        ["packageId"] = "warrior_power_up",
        ["targetPolicy"] = "self",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.warrior_power_up = v10
local v11 = {
    ["jobId"] = "warrior",
    ["skillId"] = "blade_whirl",
    ["displayName"] = "\237\154\140\236\160\132\235\178\160\234\184\176",
    ["cooldown"] = 19.5,
    ["icon"] = "",
    ["description"] = "\236\157\180\235\143\153\237\149\152\235\169\176 \236\163\188\235\179\128 \236\160\129\236\157\132 \236\151\172\235\159\172 \235\178\136 \235\178\160\234\179\160, \236\139\156\236\160\132 \236\164\145 \236\157\180\235\143\153\236\134\141\235\143\132\234\176\128 \236\166\157\234\176\128\237\149\156\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 3,
        ["tickInterval"] = 0.25,
        ["radius"] = 11.5,
        ["maxHitsPerTarget"] = 12,
        ["hitCooldown"] = 0.2
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 90,
        ["scale"] = 0.32
    },
    ["effects"] = {
        ["packageId"] = "blade_whirl_speed",
        ["targetPolicy"] = "self",
        ["applyMode"] = "on_cast"
    },
    ["fx"] = nil
}
v1.blade_whirl = v11
local v12 = {
    ["jobId"] = "priest",
    ["skillId"] = "lightarrow",
    ["displayName"] = "\235\185\155\236\157\152 \237\153\148\236\130\180",
    ["cooldown"] = 2.5,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\149\235\169\180\236\156\188\235\161\156 \235\185\155\236\157\152 \237\153\148\236\130\180\236\157\132 \235\176\156\236\130\172\237\149\156\235\139\164.",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 1.5,
        ["speed"] = 70,
        ["radius"] = 3,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 60,
        ["scale"] = 1.15
    },
    ["fx"] = {
        ["key"] = "lightarrow",
        ["templateName"] = "LightArrow",
        ["rotation"] = Vector3.new(0, -180, 0)
    }
}
v1.lightarrow = v12
local v13 = {
    ["jobId"] = "priest",
    ["skillId"] = "heal",
    ["displayName"] = "\237\154\140\235\179\181",
    ["cooldown"] = 20,
    ["icon"] = "",
    ["description"] = "\235\130\152\236\153\128 \237\140\140\237\139\176\236\155\144\236\151\144\234\178\140 5\236\180\136\234\176\132 \237\154\140\235\179\181",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self_and_party",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["effects"] = {
        ["packageId"] = "heal",
        ["targetPolicy"] = "self_and_party",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.heal = v13
local v14 = {
    ["jobId"] = "priest",
    ["skillId"] = "cross_totem",
    ["displayName"] = "\236\139\173\236\158\144\234\176\128 \237\134\160\237\133\156",
    ["cooldown"] = 32,
    ["icon"] = "",
    ["description"] = "\237\148\140\235\160\136\236\157\180\236\150\180 \236\152\134\236\151\144 \236\139\173\236\158\144\234\176\128\235\165\188 \236\134\140\237\153\152\237\149\180 \236\163\188\235\179\128 \236\160\129\236\157\132 \236\158\144\235\143\153 \234\179\181\234\178\169\237\149\152\234\179\160, \237\148\140\235\160\136\236\157\180\236\150\180\236\151\144\234\178\140 \237\158\144\236\157\132 \236\164\128\235\139\164",
    ["castType"] = "summon",
    ["targetPolicy"] = "enemies",
    ["summonId"] = "cross_totem",
    ["placement"] = {
        ["maxDistance"] = 18,
        ["fallbackForwardDistance"] = 8,
        ["snapToGround"] = true,
        ["groundOffset"] = 0.15
    },
    ["fx"] = nil
}
v1.cross_totem = v14
local v15 = {
    ["jobId"] = "lonely",
    ["skillId"] = "dark_fog",
    ["displayName"] = "\236\150\180\235\145\160\236\149\136\234\176\156",
    ["cooldown"] = 8.5,
    ["icon"] = "",
    ["description"] = "\235\170\135 \236\180\136\234\176\132 \236\163\188\235\179\128 \236\160\129\236\151\144\234\178\140 \236\167\128\236\134\141 \237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["damage"] = {
        ["base"] = 6,
        ["scale"] = 0.07
    },
    ["runtime"] = {
        ["duration"] = 4,
        ["tickInterval"] = 0.05,
        ["radius"] = 14,
        ["maxHitsPerTarget"] = 40,
        ["hitCooldown"] = 0.1
    },
    ["effects"] = {
        ["packageId"] = "dark_fog",
        ["targetPolicy"] = "self",
        ["applyMode"] = "on_cast"
    },
    ["fx"] = nil
}
v1.dark_fog = v15
local v16 = {
    ["jobId"] = "lonely",
    ["skillId"] = "dark_cube",
    ["displayName"] = "\236\150\180\235\145\160\237\129\144\235\184\140",
    ["cooldown"] = 9,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\149\235\169\180\236\156\188\235\161\156 \236\150\180\235\145\160\237\129\144\235\184\140\235\165\188 \235\176\156\236\130\172\237\149\156\235\139\164. \235\167\158\236\157\128 \236\160\129\236\157\128 \236\150\180\235\145\160\236\134\141\236\151\144 \234\176\135\237\158\140\235\139\164",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 1.3,
        ["speed"] = 100,
        ["radius"] = 6,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 370,
        ["scale"] = 1.2
    },
    ["fx"] = {
        ["key"] = "dark_cube",
        ["templateName"] = "DarkCube",
        ["rotation"] = Vector3.new(33.231, 19.421, -84.171)
    },
    ["effects"] = {
        ["packageId"] = "dark_cube",
        ["targetPolicy"] = "enemies",
        ["radius"] = 6,
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    }
}
v1.dark_cube = v16
local v17 = {
    ["jobId"] = "lonely",
    ["skillId"] = "void_pull",
    ["displayName"] = "\237\157\161\236\157\184",
    ["cooldown"] = 19,
    ["icon"] = "",
    ["description"] = "\236\163\188\235\179\128 \236\160\129\236\157\132 \235\129\140\236\150\180\235\139\185\234\184\176\234\179\160 \237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.12,
        ["tickInterval"] = 0.12,
        ["radius"] = 58,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 16,
        ["maxPlayers"] = 6,
        ["maxTargets"] = 16,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 470,
        ["scale"] = 2.8
    }
}
local v18 = {
    ["pull"] = {
        ["distance"] = 32,
        ["maxDistance"] = 32,
        ["stopDistance"] = 4.5,
        ["smooth"] = true,
        ["steps"] = 5,
        ["duration"] = 0.16,
        ["moveLockTime"] = 0.22,
        ["allowPlayers"] = true
    },
    ["centerFx"] = {
        ["style"] = "burst",
        ["size"] = 5.6,
        ["color"] = Color3.fromRGB(20, 20, 20),
        ["lifetime"] = 0.16
    },
    ["perTargetFx"] = {
        ["style"] = "pull_line",
        ["attach"] = "root",
        ["yOffset"] = 1.8,
        ["sourceYOffset"] = 2.4,
        ["thickness"] = 0.88,
        ["color"] = Color3.fromRGB(10, 10, 10),
        ["transparency"] = 0.08,
        ["lifetime"] = 0.12
    }
}
v17.impactActions = v18
v17.fx = nil
v1.void_pull = v17
local v19 = {
    ["jobId"] = "pirate",
    ["skillId"] = "drunk",
    ["displayName"] = "\235\159\188\236\163\188 \235\167\136\236\139\156\234\184\176",
    ["cooldown"] = 12,
    ["icon"] = "",
    ["description"] = "\234\179\181\234\178\169\236\134\141\235\143\132, \236\157\180\235\143\153\236\134\141\235\143\132\234\176\128 \236\152\164\235\165\184\235\139\164",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["effects"] = {
        ["packageId"] = "drunk",
        ["targetPolicy"] = "self",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.drunk = v19
local v20 = {
    ["jobId"] = "pirate",
    ["skillId"] = "shark",
    ["displayName"] = "\236\131\129\236\150\180\235\143\140\236\167\132",
    ["cooldown"] = 2.5,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\131\129\236\150\180 \235\176\156\236\130\172",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 1,
        ["speed"] = 85,
        ["radius"] = 4,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 70,
        ["scale"] = 1.1
    },
    ["fx"] = {
        ["key"] = "shark",
        ["templateName"] = "Shark"
    }
}
v1.shark = v20
local v21 = {
    ["jobId"] = "pirate",
    ["skillId"] = "tsunami",
    ["displayName"] = "\236\147\176\235\130\152\235\175\184",
    ["cooldown"] = 18.5,
    ["icon"] = "",
    ["description"] = "\236\160\132\235\176\169\236\156\188\235\161\156 \236\147\176\235\130\152\235\175\184\235\165\188 \235\130\160\235\160\164 \236\160\129\236\157\132 \235\176\128\236\150\180\235\130\184\235\139\164.",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 1.5, -1)
    },
    ["runtime"] = {
        ["lifetime"] = 2.1,
        ["speed"] = 64,
        ["radius"] = 25,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 430,
        ["scale"] = 3
    }
}
local v22 = {
    ["knockback"] = {
        ["distance"] = 20,
        ["maxDistance"] = 20
    }
}
v21.impactActions = v22
v21.fx = {
    ["key"] = "tsunami",
    ["templateName"] = "Tsunami"
}
v1.tsunami = v21
v1.pirate_cannon_call = {
    ["jobId"] = "pirate",
    ["skillId"] = "pirate_cannon_call",
    ["displayName"] = "\235\140\128\237\143\172 \236\132\164\236\185\152",
    ["cooldown"] = 16,
    ["icon"] = "",
    ["description"] = "\235\130\180 \236\163\188\235\179\128\236\151\144 \235\140\128\237\143\172\235\165\188 \236\132\164\236\185\152\237\149\180 \236\158\144\235\143\153\236\156\188\235\161\156 \237\143\172\237\131\132\236\157\132 \235\176\156\236\130\172\237\149\156\235\139\164.",
    ["castType"] = "summon",
    ["targetPolicy"] = "enemies",
    ["summonId"] = "pirate_cannon",
    ["fx"] = nil
}
local v23 = {
    ["jobId"] = "swordman",
    ["skillId"] = "dash",
    ["displayName"] = "\235\176\156\235\143\132\236\136\160",
    ["cooldown"] = 2.5,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\132\235\176\169\236\156\188\235\161\156 \235\143\140\236\167\132\237\149\152\235\169\176 \234\178\189\235\161\156\236\157\152 \236\160\129\236\151\144\234\178\140 \237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "dash",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["distance"] = 28,
        ["speed"] = 200,
        ["radius"] = 5,
        ["width"] = 20,
        ["height"] = 8,
        ["tickInterval"] = 0.03,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0,
        ["stopOnWall"] = true,
        ["wallPadding"] = 2
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 80,
        ["scale"] = 1.15
    },
    ["fx"] = {
        ["key"] = "dash",
        ["templateName"] = "Dash",
        ["mode"] = "dash",
        ["followOffset"] = 4
    }
}
v1.dash = v23
local v24 = {
    ["jobId"] = "swordman",
    ["skillId"] = "rapid_slash",
    ["displayName"] = "\236\151\176\236\134\141\235\178\160\234\184\176",
    ["cooldown"] = 5.5,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\132\235\176\169 \236\162\129\236\157\128 \235\178\148\236\156\132\235\165\188 \236\151\172\235\159\172 \235\178\136 \235\178\160\236\150\180 \236\151\176\236\134\141 \237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "front_box",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.42,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["forwardOffset"] = 5.5,
        ["width"] = 16,
        ["height"] = 8,
        ["depth"] = 16,
        ["maxHitsPerTarget"] = 4,
        ["hitCooldown"] = 0.09
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 68,
        ["scale"] = 0.45
    },
    ["fx"] = {
        ["key"] = "rapid_slash",
        ["templateName"] = "RapidSlash",
        ["mode"] = "front_box",
        ["forwardOffset"] = 5.5,
        ["yOffset"] = 2.2,
        ["lifetime"] = 0.42,
        ["cleanupDelay"] = 0.18
    }
}
v1.rapid_slash = v24
local v25 = {
    ["jobId"] = "swordman",
    ["skillId"] = "absolute_guard",
    ["displayName"] = "\236\160\136\235\140\128 \236\136\152\237\152\184",
    ["cooldown"] = 23,
    ["icon"] = "",
    ["description"] = "\235\148\148\235\178\132\237\148\132\235\165\188 \236\160\149\237\153\148\237\149\152\234\179\160 \236\158\160\236\139\156 \235\170\168\235\147\160 \237\148\188\237\149\180\236\153\128 \235\148\148\235\178\132\237\148\132\235\165\188 \235\172\180\236\139\156\237\149\156\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["castActions"] = {
        ["allowCastWhileControlled"] = true,
        ["cleanseTags"] = { "debuff" }
    },
    ["effects"] = {
        ["packageId"] = "absolute_guard",
        ["targetPolicy"] = "self",
        ["applyMode"] = "on_cast",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.absolute_guard = v25
local v26 = {
    ["jobId"] = "magicsword",
    ["skillId"] = "swordwave",
    ["displayName"] = "\234\178\128\234\184\176\235\130\160\235\166\172\234\184\176",
    ["cooldown"] = 2.8,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\149\235\169\180\236\156\188\235\161\156 \234\178\128\234\184\176\235\165\188 \235\176\156\236\130\172\237\149\156\235\139\164.",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 0.5,
        ["speed"] = 70,
        ["radius"] = 10,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 50,
        ["scale"] = 1.1
    },
    ["fx"] = {
        ["key"] = "swordwave",
        ["templateName"] = "SwordWave",
        ["rotation"] = Vector3.new(90, 0, 82)
    }
}
v1.swordwave = v26
local v27 = {
    ["jobId"] = "magicsword",
    ["skillId"] = "fire_burst",
    ["displayName"] = "\237\140\140\236\157\180\236\150\180 \235\178\132\236\138\164\237\138\184",
    ["cooldown"] = 8,
    ["icon"] = "rbxassetid://87101851390441",
    ["description"] = "\236\158\144\236\139\160 \236\163\188\235\179\128 \236\160\129\235\147\164\236\151\144\234\178\140 \235\182\136 \237\143\173\235\176\156 \237\148\188\237\149\180\235\165\188 \236\163\188\234\179\160 \236\167\128\236\134\141\237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 28,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 100,
        ["scale"] = 1.1
    },
    ["effects"] = {
        ["packageId"] = "fire_dot_small",
        ["targetPolicy"] = "enemies",
        ["radius"] = 20,
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    }
}
local v28 = {
    ["key"] = "fire_burst",
    ["templateName"] = "FireBurst",
    ["mode"] = "self_area",
    ["burst"] = {
        ["radius"] = 28,
        ["time"] = 0.25
    }
}
v27.fx = v28
v1.fire_burst = v27
local v29 = {
    ["jobId"] = "magicsword",
    ["skillId"] = "holy_lightning",
    ["displayName"] = "\236\139\172\237\140\144\236\157\152 \235\178\136\234\176\156",
    ["cooldown"] = 19,
    ["icon"] = "",
    ["description"] = "\236\163\188\235\179\128 \236\160\129\235\147\164\236\151\144\234\178\140 \237\153\149\236\160\149 \235\178\136\234\176\156\235\165\188 \235\150\168\236\150\180\235\156\168\235\166\176\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 50,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 12,
        ["maxPlayers"] = 12,
        ["maxTargets"] = 12,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 480,
        ["scale"] = 3
    }
}
local v30 = {
    ["perTargetFx"] = {
        ["templateName"] = "HolyLightningStrike",
        ["attach"] = "head",
        ["offset"] = Vector3.new(0, 5, 0),
        ["lifetime"] = 0.35,
        ["cleanupDelay"] = 0.35,
        ["rotation"] = Vector3.new(0, 0, 0),
        ["style"] = "lightning_strike",
        ["height"] = 18,
        ["radius"] = 3.8,
        ["color"] = Color3.fromRGB(170, 225, 255)
    }
}
v29.impactActions = v30
v29.fx = nil
v1.holy_lightning = v29
local v31 = {
    ["jobId"] = "angel",
    ["skillId"] = "angel_blessing",
    ["displayName"] = "\236\178\156\236\130\172\236\157\152 \236\182\149\235\179\181",
    ["cooldown"] = 17,
    ["icon"] = "",
    ["description"] = "\235\130\152\236\153\128 \237\140\140\237\139\176\236\155\144\236\157\152 \234\179\181\234\178\169\235\160\165\234\179\188 \236\157\180\235\143\153\236\134\141\235\143\132\235\165\188 \236\158\160\236\139\156 \236\152\172\235\166\176\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self_and_party",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["effects"] = {
        ["packageId"] = "angel_blessing",
        ["targetPolicy"] = "self_and_party",
        ["applyMode"] = "on_cast",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.angel_blessing = v31
local v32 = {
    ["jobId"] = "angel",
    ["skillId"] = "angel_barrier",
    ["displayName"] = "\236\178\156\236\130\172\236\157\152 \235\179\180\237\152\184\235\167\137",
    ["cooldown"] = 18,
    ["icon"] = "",
    ["description"] = "\235\130\152\236\153\128 \237\140\140\237\139\176\236\155\144\236\151\144\234\178\140 \234\179\181\234\178\169\235\160\165/\235\140\128\236\131\129 \236\181\156\235\140\128 \236\178\180\235\160\165 \235\185\132\235\161\128 \235\179\180\237\152\184\235\167\137\236\157\132 \235\182\128\236\151\172\237\149\156\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "self_and_party",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 0,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["effects"] = {
        ["packageId"] = "angel_barrier",
        ["targetPolicy"] = "self_and_party",
        ["applyMode"] = "on_cast",
        ["radius"] = 0,
        ["maxMonsters"] = 0,
        ["maxPlayers"] = 1,
        ["maxTargets"] = 1,
        ["maxParts"] = 8
    },
    ["fx"] = nil
}
v1.angel_barrier = v32
v1.angel_call = {
    ["jobId"] = "angel",
    ["skillId"] = "angel_call",
    ["displayName"] = "\236\178\156\236\130\172 \236\134\140\237\153\152",
    ["cooldown"] = 31,
    ["icon"] = "",
    ["description"] = "\235\130\180 \236\163\188\235\179\128\236\151\144 \236\178\156\236\130\172 \235\179\145\236\130\172\235\147\164\236\157\132 \236\134\140\237\153\152\237\149\156\235\139\164.",
    ["castType"] = "summon",
    ["targetPolicy"] = "enemies",
    ["summonId"] = "angel",
    ["fx"] = nil
}
local v33 = {
    ["jobId"] = "blackmagician",
    ["skillId"] = "black_fireball",
    ["displayName"] = "\237\157\145\236\151\188\234\181\172",
    ["cooldown"] = 2,
    ["icon"] = "rbxassetid://121113980386893",
    ["description"] = "\236\160\149\235\169\180\236\156\188\235\161\156 \237\157\145\236\151\188\234\181\172\235\165\188 \235\176\156\236\130\172\237\149\156\235\139\164.",
    ["castType"] = "projectile",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 2, -1.25)
    },
    ["runtime"] = {
        ["lifetime"] = 1.5,
        ["speed"] = 65,
        ["radius"] = 3,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 40,
        ["scale"] = 1.05
    },
    ["fx"] = {
        ["key"] = "black_fireball",
        ["templateName"] = "FlyingBlackFireball"
    }
}
v1.black_fireball = v33
local v34 = {
    ["jobId"] = "blackmagician",
    ["skillId"] = "black_barrier",
    ["displayName"] = "\235\139\164\237\129\172 \235\178\160\235\166\172\236\150\180",
    ["cooldown"] = 15,
    ["icon"] = "",
    ["description"] = "\236\158\144\236\139\160\236\151\144\234\178\140 \235\179\180\237\152\184\235\167\137\236\157\132 \235\145\144\235\165\180\234\179\160 \236\163\188\235\179\128 \236\160\129\236\151\144\234\178\140 \236\167\128\236\134\141 \237\148\188\237\149\180\236\153\128 \235\145\148\237\153\148\235\165\188 \234\177\180\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 6,
        ["tickInterval"] = 0.1,
        ["radius"] = 18,
        ["maxHitsPerTarget"] = 40,
        ["hitCooldown"] = 0.1
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 1,
        ["scale"] = 0.04
    }
}
local v35 = {
    ["applyPackages"] = {
        {
            ["packageId"] = "black_barrier_self",
            ["targetPolicy"] = "self",
            ["radius"] = 0,
            ["maxMonsters"] = 0,
            ["maxPlayers"] = 1,
            ["maxTargets"] = 1,
            ["maxParts"] = 8
        }
    }
}
v34.castActions = v35
v34.effects = {
    ["packageId"] = "black_barrier_slow",
    ["targetPolicy"] = "enemies",
    ["radius"] = 14,
    ["maxMonsters"] = 20,
    ["maxPlayers"] = 20,
    ["maxTargets"] = 20,
    ["maxParts"] = 2048
}
v34.fx = nil
v1.black_barrier = v34
local v36 = {
    ["jobId"] = "blackmagician",
    ["skillId"] = "dark_explosion",
    ["displayName"] = "\235\139\164\237\129\172 \236\157\181\236\138\164\237\148\140\235\161\156\236\160\132",
    ["cooldown"] = 17.5,
    ["icon"] = "rbxassetid://87101851390441",
    ["description"] = "\236\163\188\235\179\128\236\151\144 \236\150\180\235\145\160 \237\143\173\235\176\156\236\157\132 \236\157\188\236\156\188\236\188\156 \237\149\156 \235\178\136 \237\129\172\234\178\140 \237\148\188\237\149\180\235\165\188 \236\164\128\235\139\164.",
    ["castType"] = "self_area",
    ["targetPolicy"] = "enemies",
    ["cast"] = {
        ["offset"] = Vector3.new(0, 0, 0)
    },
    ["runtime"] = {
        ["duration"] = 0.1,
        ["tickInterval"] = 0.1,
        ["radius"] = 40,
        ["maxHitsPerTarget"] = 1,
        ["hitCooldown"] = 0
    },
    ["targeting"] = {
        ["maxMonsters"] = 20,
        ["maxPlayers"] = 20,
        ["maxTargets"] = 20,
        ["maxParts"] = 2048
    },
    ["damage"] = {
        ["base"] = 480,
        ["scale"] = 3.8
    }
}
local v37 = {
    ["key"] = "dark_explosion",
    ["templateName"] = "DarkFireballExplosionVFX",
    ["mode"] = "self_area",
    ["burst"] = {
        ["radius"] = 40,
        ["time"] = 0.25
    },
    ["rotation"] = Vector3.new(0, 0, -90)
}
v36.fx = v37
v1.dark_explosion = v36
return v1