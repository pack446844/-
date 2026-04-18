local v1 = {}
local v2 = {}
local v3 = {
    ["effectId"] = "atk_up_small",
    ["displayName"] = "\234\179\181\234\178\169\235\160\165 \236\166\157\234\176\128",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 8,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "attack" },
    ["modifiers"] = {
        {
            ["stat"] = "attackPower",
            ["mode"] = "mul",
            ["value"] = 0.2
        }
    }
}
v2.atk_up_small = v3
local v4 = {
    ["effectId"] = "maxhp_up_small",
    ["displayName"] = "\236\181\156\235\140\128 HP \236\166\157\234\176\128",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 10,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "maxhp" },
    ["modifiers"] = {
        {
            ["stat"] = "maxHp",
            ["mode"] = "mul",
            ["value"] = 0.2
        }
    }
}
v2.maxhp_up_small = v4
local v5 = {
    ["effectId"] = "slow_30",
    ["displayName"] = "\235\145\148\237\153\148",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 2.5,
    ["maxStacks"] = 1,
    ["stackRule"] = "replace_stronger",
    ["potency"] = 30,
    ["tags"] = { "debuff", "slow" },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = -0.3
        }
    }
}
v2.slow_30 = v5
local v6 = {
    ["effectId"] = "slow_50",
    ["displayName"] = "\234\176\149\237\149\156 \235\145\148\237\153\148",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 2,
    ["maxStacks"] = 1,
    ["stackRule"] = "replace_stronger",
    ["potency"] = 50,
    ["tags"] = { "debuff", "slow" },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = -0.5
        }
    }
}
v2.slow_50 = v6
local v7 = {
    ["effectId"] = "slow_65",
    ["displayName"] = "\234\183\185\236\139\172\237\149\156 \235\145\148\237\153\148",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 2.8,
    ["maxStacks"] = 1,
    ["stackRule"] = "replace_stronger",
    ["potency"] = 65,
    ["tags"] = { "debuff", "slow", "boss" },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = -0.65
        }
    }
}
v2.slow_65 = v7
local v8 = {
    ["effectId"] = "stun_short",
    ["displayName"] = "\234\184\176\236\160\136",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 0.8,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "debuff", "stun", "hard_cc" },
    ["modifiers"] = {
        {
            ["stat"] = "canMove",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canAttack",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canCast",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "override",
            ["value"] = 0,
            ["priority"] = 100
        }
    }
}
v2.stun_short = v8
local v9 = {
    ["effectId"] = "ice_short",
    ["displayName"] = "\235\185\153\234\178\176",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 1.2,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "debuff", "ice", "hard_cc" },
    ["modifiers"] = {
        {
            ["stat"] = "canMove",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canAttack",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canCast",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "override",
            ["value"] = 0,
            ["priority"] = 100
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Ice",
        ["attachTo"] = "root"
    }
}
v2.ice_short = v9
local v10 = {
    ["effectId"] = "dark_cube",
    ["displayName"] = "\236\149\148\237\157\145",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 2,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "debuff", "dark", "hard_cc" },
    ["modifiers"] = {
        {
            ["stat"] = "canMove",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canAttack",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "canCast",
            ["mode"] = "override",
            ["value"] = false,
            ["priority"] = 100
        },
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "override",
            ["value"] = 0,
            ["priority"] = 100
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "DarkCube",
        ["attachTo"] = "root"
    }
}
v2.dark_cube = v10
local v11 = {
    ["effectId"] = "burn_small",
    ["displayName"] = "\237\153\148\236\131\129",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "periodic",
    ["duration"] = 4,
    ["maxStacks"] = 3,
    ["stackRule"] = "refresh",
    ["tags"] = { "debuff", "dot", "burn" },
    ["periodic"] = {
        ["kind"] = "damage",
        ["tickInterval"] = 0.5,
        ["base"] = 0,
        ["scale"] = 0.2
    }
}
v2.burn_small = v11
local v12 = {
    ["effectId"] = "warrior_power_up",
    ["displayName"] = "\237\140\140\236\155\140 \236\151\133",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 10,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = {
        "buff",
        "attack",
        "maxhp",
        "blessing"
    },
    ["modifiers"] = {
        {
            ["stat"] = "attackPower",
            ["mode"] = "mul",
            ["value"] = 0.35
        },
        {
            ["stat"] = "maxHp",
            ["mode"] = "mul",
            ["value"] = 0.4
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Powerup",
        ["attachTo"] = "root"
    }
}
v2.warrior_power_up = v12
local v13 = {
    ["effectId"] = "heal",
    ["displayName"] = "\237\154\140\235\179\181",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "periodic",
    ["duration"] = 5,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "heal", "blessing" },
    ["periodic"] = {
        ["kind"] = "heal",
        ["tickInterval"] = 1,
        ["base"] = 30,
        ["scale"] = 0.25,
        ["maxHpRatio"] = 0.045
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Heal",
        ["attachTo"] = "root"
    }
}
v2.heal = v13
local v14 = {
    ["effectId"] = "dark_fog",
    ["displayName"] = "\236\150\180\235\145\160 \236\149\136\234\176\156",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 4,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "visual_only" },
    ["modifiers"] = {},
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "DarkFog",
        ["attachTo"] = "root"
    }
}
v2.dark_fog = v14
local v15 = {
    ["effectId"] = "drunk",
    ["displayName"] = "\235\159\188\236\163\188 \235\167\136\236\139\156\234\184\176",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 7,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = {
        "buff",
        "attackspeed",
        "speed",
        "blessing"
    },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = 0.3
        },
        {
            ["stat"] = "attackInterval",
            ["mode"] = "mul",
            ["value"] = -0.3
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Drunk",
        ["attachTo"] = "root"
    }
}
v2.drunk = v15
local v16 = {
    ["effectId"] = "angel_blessing",
    ["displayName"] = "\236\178\156\236\130\172\236\157\152 \236\182\149\235\179\181",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 8,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = {
        "buff",
        "attack",
        "speed",
        "blessing"
    },
    ["modifiers"] = {
        {
            ["stat"] = "attackPower",
            ["mode"] = "mul",
            ["value"] = 0.2
        },
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = 0.15
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Bless",
        ["attachTo"] = "root"
    }
}
v2.angel_blessing = v16
local v17 = {
    ["effectId"] = "angel_barrier",
    ["displayName"] = "\236\178\156\236\130\172\236\157\152 \235\179\180\237\152\184\235\167\137",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "shield",
    ["duration"] = 8,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "shield", "blessing" },
    ["modifiers"] = {},
    ["shield"] = {
        ["base"] = 120,
        ["scale"] = 1.1,
        ["maxHpRatio"] = 0.12,
        ["hudColor"] = Color3.fromRGB(90, 170, 255),
        ["sortOrder"] = 10
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Shield",
        ["attachTo"] = "root",
        ["tintColor"] = Color3.fromRGB(90, 170, 255)
    }
}
v2.angel_barrier = v17
local v18 = {
    ["effectId"] = "black_barrier_shield",
    ["displayName"] = "\237\157\145\235\167\136 \235\179\180\237\152\184\235\167\137",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "shield",
    ["duration"] = 6,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "shield", "dark" },
    ["modifiers"] = {},
    ["shield"] = {
        ["base"] = 120,
        ["scale"] = 1.1,
        ["maxHpRatio"] = 0.12,
        ["hudColor"] = Color3.fromRGB(180, 95, 255),
        ["sortOrder"] = 20
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Shield",
        ["attachTo"] = "root",
        ["tintColor"] = Color3.fromRGB(180, 95, 255)
    }
}
v2.black_barrier_shield = v18
local v19 = {
    ["effectId"] = "black_barrier_aura_visual",
    ["displayName"] = "\237\157\145\235\167\136 \236\152\164\235\157\188",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 6,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "visual_only", "dark" },
    ["modifiers"] = {},
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Poison",
        ["attachTo"] = "root",
        ["tintColor"] = Color3.fromRGB(180, 95, 255)
    }
}
v2.black_barrier_aura_visual = v19
local v20 = {
    ["effectId"] = "black_barrier_slow",
    ["displayName"] = "\237\157\145\235\167\136 \235\145\148\237\153\148",
    ["icon"] = "",
    ["isBuff"] = false,
    ["category"] = "control",
    ["duration"] = 0.25,
    ["maxStacks"] = 1,
    ["stackRule"] = "replace_stronger",
    ["potency"] = 25,
    ["tags"] = { "debuff", "slow", "dark" },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = -0.25
        }
    }
}
v2.black_barrier_slow = v20
local v21 = {
    ["effectId"] = "absolute_guard",
    ["displayName"] = "\236\160\136\235\140\128 \236\136\152\237\152\184",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "special",
    ["duration"] = 2.2,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = {
        "buff",
        "invulnerable",
        "debuff_immunity",
        "blessing"
    },
    ["modifiers"] = {},
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Muzeok",
        ["attachTo"] = "root"
    }
}
v2.absolute_guard = v21
local v22 = {
    ["effectId"] = "blade_whirl_speed",
    ["displayName"] = "\237\154\140\236\160\132\235\178\160\234\184\176",
    ["icon"] = "",
    ["isBuff"] = true,
    ["category"] = "stat_mod",
    ["duration"] = 3,
    ["maxStacks"] = 1,
    ["stackRule"] = "refresh",
    ["tags"] = { "buff", "speed", "sword" },
    ["modifiers"] = {
        {
            ["stat"] = "moveSpeed",
            ["mode"] = "mul",
            ["value"] = 0.25
        }
    },
    ["visual"] = {
        ["type"] = "model",
        ["templateName"] = "Whirl",
        ["attachTo"] = "root",
        ["preserveTemplateRotation"] = true
    }
}
v2.blade_whirl_speed = v22
v1.effects = v2
local v23 = {}
local v24 = {
    ["packageId"] = "self_attack_up_small",
    ["effects"] = {
        {
            ["effectId"] = "atk_up_small"
        }
    }
}
v23.self_attack_up_small = v24
local v25 = {
    ["packageId"] = "self_guard_small",
    ["effects"] = {
        {
            ["effectId"] = "maxhp_up_small"
        }
    }
}
v23.self_guard_small = v25
local v26 = {
    ["packageId"] = "party_attack_up_small",
    ["effects"] = {
        {
            ["effectId"] = "atk_up_small",
            ["duration"] = 10
        }
    }
}
v23.party_attack_up_small = v26
local v27 = {
    ["packageId"] = "ice_burst_ice",
    ["effects"] = {
        {
            ["effectId"] = "ice_short",
            ["duration"] = 1.2
        }
    }
}
v23.ice_burst_ice = v27
local v28 = {
    ["packageId"] = "dark_cube",
    ["effects"] = {
        {
            ["effectId"] = "dark_cube",
            ["duration"] = 2
        }
    }
}
v23.dark_cube = v28
local v29 = {
    ["packageId"] = "shield_bash_stun",
    ["effects"] = {
        {
            ["effectId"] = "stun_short",
            ["duration"] = 0.8
        }
    }
}
v23.shield_bash_stun = v29
local v30 = {
    ["packageId"] = "boss_bone_spike_stun",
    ["effects"] = {
        {
            ["effectId"] = "stun_short",
            ["duration"] = 1
        }
    }
}
v23.boss_bone_spike_stun = v30
local v31 = {
    ["packageId"] = "fire_dot_small",
    ["effects"] = {
        {
            ["effectId"] = "burn_small",
            ["duration"] = 3,
            ["stacks"] = 1
        }
    }
}
v23.fire_dot_small = v31
local v32 = {
    ["packageId"] = "warrior_power_up",
    ["effects"] = {
        {
            ["effectId"] = "warrior_power_up",
            ["duration"] = 10
        }
    }
}
v23.warrior_power_up = v32
local v33 = {
    ["packageId"] = "heal",
    ["effects"] = {
        {
            ["effectId"] = "heal",
            ["duration"] = 5
        }
    }
}
v23.heal = v33
local v34 = {
    ["packageId"] = "dark_fog",
    ["effects"] = {
        {
            ["effectId"] = "dark_fog",
            ["duration"] = 4
        }
    }
}
v23.dark_fog = v34
local v35 = {
    ["packageId"] = "drunk",
    ["effects"] = {
        {
            ["effectId"] = "drunk",
            ["duration"] = 7
        }
    }
}
v23.drunk = v35
local v36 = {
    ["packageId"] = "angel_blessing",
    ["effects"] = {
        {
            ["effectId"] = "angel_blessing",
            ["duration"] = 8
        }
    }
}
v23.angel_blessing = v36
local v37 = {
    ["packageId"] = "angel_barrier",
    ["effects"] = {
        {
            ["effectId"] = "angel_barrier",
            ["duration"] = 8
        }
    }
}
v23.angel_barrier = v37
local v38 = {
    ["packageId"] = "black_barrier_self",
    ["effects"] = {
        {
            ["effectId"] = "black_barrier_shield",
            ["duration"] = 6
        },
        {
            ["effectId"] = "black_barrier_aura_visual",
            ["duration"] = 6
        }
    }
}
v23.black_barrier_self = v38
local v39 = {
    ["packageId"] = "black_barrier_slow",
    ["effects"] = {
        {
            ["effectId"] = "black_barrier_slow",
            ["duration"] = 0.25
        }
    }
}
v23.black_barrier_slow = v39
local v40 = {
    ["packageId"] = "absolute_guard",
    ["effects"] = {
        {
            ["effectId"] = "absolute_guard",
            ["duration"] = 2.2
        }
    }
}
v23.absolute_guard = v40
local v41 = {
    ["packageId"] = "boss_red_zone_heavy_slow",
    ["effects"] = {
        {
            ["effectId"] = "slow_65",
            ["duration"] = 2.8
        }
    }
}
v23.boss_red_zone_heavy_slow = v41
local v42 = {
    ["packageId"] = "blade_whirl_speed",
    ["effects"] = {
        {
            ["effectId"] = "blade_whirl_speed",
            ["duration"] = 3
        }
    }
}
v23.blade_whirl_speed = v42
v1.packages = v23
return v1