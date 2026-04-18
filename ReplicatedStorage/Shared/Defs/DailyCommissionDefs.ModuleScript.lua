local u1 = {
    ["BOARD_TAG"] = "DailyCommissionBoard",
    ["BOARD_ATTRIBUTE"] = "DailyCommissionBoard",
    ["BOARD_FALLBACK_NAMES"] = { "DailyCommissionBoard", "CommissionBoard" },
    ["PROMPT_NAME"] = "DailyCommissionBoardPrompt",
    ["PROMPT_ACTION_TEXT"] = "\236\157\152\235\162\176 \237\153\149\236\157\184",
    ["PROMPT_OBJECT_TEXT"] = "\236\157\152\235\162\176 \234\178\140\236\139\156\237\140\144",
    ["PROMPT_DISTANCE"] = 10,
    ["REQUEST_RATE_LIMIT"] = 0.15,
    ["PROMPT_RATE_LIMIT"] = 0.15,
    ["RESET_HOUR_KST"] = 4,
    ["KST_OFFSET"] = 32400,
    ["SLOTS_PER_BOARD"] = 3,
    ["FULL_RESET_PRODUCT_KEY"] = "dailyCommissionReset",
    ["TOKEN_DISPLAY_NAME"] = "\236\157\152\235\162\176 \236\166\157\237\145\156",
    ["VIP_TOKEN_MULTIPLIER"] = 1.5,
    ["REROLL_COSTS"] = {
        30000,
        60000,
        120000,
        200000
    },
    ["GRADE_ORDER"] = {
        "common",
        "rare",
        "epic",
        "legendary"
    }
}
local v2 = {}
local v3 = {
    ["id"] = "common",
    ["displayName"] = "\236\157\188\235\176\152",
    ["weight"] = 40,
    ["token"] = 5,
    ["expMult"] = 1,
    ["goldMult"] = 1,
    ["requiredMult"] = {
        ["kill"] = 1,
        ["collect"] = 1,
        ["target_kill"] = 1
    },
    ["color"] = Color3.fromRGB(225, 225, 225)
}
v2.common = v3
local v4 = {
    ["id"] = "rare",
    ["displayName"] = "\237\157\172\234\183\128",
    ["weight"] = 40,
    ["token"] = 7,
    ["expMult"] = 1.2,
    ["goldMult"] = 1.2,
    ["requiredMult"] = {
        ["kill"] = 1.25,
        ["collect"] = 1.2,
        ["target_kill"] = 1
    },
    ["color"] = Color3.fromRGB(95, 180, 255)
}
v2.rare = v4
local v5 = {
    ["id"] = "epic",
    ["displayName"] = "\236\152\129\236\155\133",
    ["weight"] = 15,
    ["token"] = 10,
    ["expMult"] = 1.45,
    ["goldMult"] = 1.45,
    ["requiredMult"] = {
        ["kill"] = 1.6,
        ["collect"] = 1.45,
        ["target_kill"] = 2
    },
    ["color"] = Color3.fromRGB(190, 110, 255)
}
v2.epic = v5
local v6 = {
    ["id"] = "legendary",
    ["displayName"] = "\236\160\132\236\132\164",
    ["weight"] = 5,
    ["token"] = 13,
    ["expMult"] = 1.75,
    ["goldMult"] = 1.75,
    ["requiredMult"] = {
        ["kill"] = 2,
        ["collect"] = 1.8,
        ["target_kill"] = 3
    },
    ["color"] = Color3.fromRGB(255, 190, 70)
}
v2.legendary = v6
u1.GRADES = v2
local v7 = {}
local v8 = {
    ["id"] = "lv_1_10",
    ["minLevel"] = 1,
    ["maxLevel"] = 10,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "rabbit",
            ["targetType"] = "monster",
            ["baseRequired"] = 20,
            ["weight"] = 100
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "rabbit_liver",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "rabbit",
            ["baseRequired"] = 8,
            ["weight"] = 90
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "deer",
            ["targetType"] = "monster",
            ["baseRequired"] = 16,
            ["weight"] = 90
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "deer_antler",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "deer",
            ["baseRequired"] = 6,
            ["weight"] = 80
        }
    }
}
local v9 = {
    ["id"] = "lv_11_20",
    ["minLevel"] = 11,
    ["maxLevel"] = 20,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "pig",
            ["targetType"] = "monster",
            ["baseRequired"] = 18,
            ["weight"] = 100
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "pig_hide",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "pig",
            ["baseRequired"] = 10,
            ["weight"] = 90
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "snail",
            ["targetType"] = "monster",
            ["baseRequired"] = 15,
            ["weight"] = 90
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "snail_shell",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "snail",
            ["baseRequired"] = 8,
            ["weight"] = 80
        }
    }
}
local v10 = {
    ["id"] = "lv_21_30",
    ["minLevel"] = 21,
    ["maxLevel"] = 30,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "fox",
            ["targetType"] = "monster",
            ["baseRequired"] = 18,
            ["weight"] = 95
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "fox_tail",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "fox",
            ["baseRequired"] = 10,
            ["weight"] = 85
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "crab",
            ["targetType"] = "monster",
            ["baseRequired"] = 16,
            ["weight"] = 90
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "crab_claw",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "crab",
            ["baseRequired"] = 8,
            ["weight"] = 80
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "raptor_miniboss",
            ["targetType"] = "miniboss",
            ["baseRequired"] = 1,
            ["weight"] = 55
        }
    }
}
local v11 = {
    ["id"] = "lv_31_40",
    ["minLevel"] = 31,
    ["maxLevel"] = 40,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "wolf",
            ["targetType"] = "monster",
            ["baseRequired"] = 18,
            ["weight"] = 90
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "bear",
            ["targetType"] = "monster",
            ["baseRequired"] = 15,
            ["weight"] = 85
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "bear_leather",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "bear",
            ["baseRequired"] = 9,
            ["weight"] = 75
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "crab",
            ["targetType"] = "monster",
            ["baseRequired"] = 18,
            ["weight"] = 70
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "crab_claw",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "crab",
            ["baseRequired"] = 10,
            ["weight"] = 70
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "raptor_miniboss",
            ["targetType"] = "miniboss",
            ["baseRequired"] = 1,
            ["weight"] = 65
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "kingbandit",
            ["targetType"] = "boss",
            ["baseRequired"] = 1,
            ["weight"] = 55
        }
    }
}
local v12 = {
    ["id"] = "lv_41_50",
    ["minLevel"] = 41,
    ["maxLevel"] = 50,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "zombie",
            ["targetType"] = "monster",
            ["baseRequired"] = 16,
            ["weight"] = 85
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "zombie_arm",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "zombie",
            ["baseRequired"] = 8,
            ["weight"] = 75
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "iceslime",
            ["targetType"] = "monster",
            ["baseRequired"] = 16,
            ["weight"] = 80
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "slime_jelly",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "iceslime",
            ["baseRequired"] = 8,
            ["weight"] = 75
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "icebear",
            ["targetType"] = "monster",
            ["baseRequired"] = 14,
            ["weight"] = 75
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "icebear_leather",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "icebear",
            ["baseRequired"] = 7,
            ["weight"] = 70
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "spider",
            ["targetType"] = "monster",
            ["baseRequired"] = 14,
            ["weight"] = 72
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "spider_leg",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "spider",
            ["baseRequired"] = 7,
            ["weight"] = 68
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "raptor_miniboss",
            ["targetType"] = "boss",
            ["baseRequired"] = 1,
            ["weight"] = 55
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "kingbandit",
            ["targetType"] = "boss",
            ["baseRequired"] = 1,
            ["weight"] = 45
        }
    }
}
local v13 = {
    ["id"] = "lv_51_plus",
    ["minLevel"] = 51,
    ["maxLevel"] = 200,
    ["pool"] = {
        {
            ["missionType"] = "kill",
            ["targetId"] = "skeleton",
            ["targetType"] = "monster",
            ["baseRequired"] = 15,
            ["weight"] = 80
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "skeleton_bone",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "skeleton",
            ["baseRequired"] = 8,
            ["weight"] = 75
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "golem",
            ["targetType"] = "monster",
            ["baseRequired"] = 12,
            ["weight"] = 72
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "golem_zogak",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "golem",
            ["baseRequired"] = 6,
            ["weight"] = 68
        },
        {
            ["missionType"] = "kill",
            ["targetId"] = "spider",
            ["targetType"] = "monster",
            ["baseRequired"] = 16,
            ["weight"] = 55
        },
        {
            ["missionType"] = "collect",
            ["targetId"] = "spider_leg",
            ["targetType"] = "item",
            ["rewardSourceMonsterId"] = "spider",
            ["baseRequired"] = 9,
            ["weight"] = 50
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "skeleton_miniboss",
            ["targetType"] = "miniboss",
            ["baseRequired"] = 1,
            ["weight"] = 60
        },
        {
            ["missionType"] = "target_kill",
            ["targetId"] = "kingbandit",
            ["targetType"] = "boss",
            ["baseRequired"] = 1,
            ["weight"] = 55
        }
    }
}
__set_list(v7, 1, {v8, v9, v10, v11, v12, v13})
u1.LEVEL_BANDS = v7
function u1.getBandForLevel(p14) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v15 = tonumber(p14) or 1
    local v16 = math.floor(v15)
    local v17 = math.max(1, v16)
    for _, v18 in ipairs(u1.LEVEL_BANDS) do
        if v18.minLevel <= v17 and v17 <= v18.maxLevel then
            return v18
        end
    end
    return u1.LEVEL_BANDS[#u1.LEVEL_BANDS]
end
return u1