local v1 = {}
local v2 = {
    ["monsterId"] = "rabbit",
    ["displayName"] = "LV1 \237\134\160\235\129\188",
    ["maxHp"] = 30,
    ["expReward"] = 14,
    ["goldReward"] = 5,
    ["touchDamage"] = 7,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "rabbit_liver",
            ["chance"] = 1,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "RabbitSpawnPoint",
        ["legacyNamePattern"] = "^Rabbit_%d+$",
        ["templateName"] = "Rabbit",
        ["respawnTime"] = 2,
        ["defaultSpawnCount"] = 20,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.4
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 12,
        ["leashRange"] = 65,
        ["moveSpeed"] = 22,
        ["retargetCycle"] = 0.35
    }
}
v1.rabbit = v2
local v3 = {
    ["monsterId"] = "deer",
    ["displayName"] = "LV5 \236\130\172\236\138\180",
    ["maxHp"] = 99,
    ["expReward"] = 27,
    ["goldReward"] = 10,
    ["touchDamage"] = 14,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "deer_antler",
            ["chance"] = 0.75,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "DeerSpawnPoint",
        ["legacyNamePattern"] = "^Deer_%d+$",
        ["templateName"] = "Deer",
        ["respawnTime"] = 2.6,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.7
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 14,
        ["leashRange"] = 56,
        ["moveSpeed"] = 28,
        ["retargetCycle"] = 0.4
    }
}
v1.deer = v3
local v4 = {
    ["monsterId"] = "pig",
    ["displayName"] = "LV11 \235\143\188\236\167\128",
    ["maxHp"] = 190,
    ["expReward"] = 66,
    ["goldReward"] = 15,
    ["touchDamage"] = 23,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "pig_hide",
            ["chance"] = 0.65,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "PigSpawnPoint",
        ["legacyNamePattern"] = "^Pig_%d+$",
        ["templateName"] = "Pig",
        ["respawnTime"] = 2.5,
        ["defaultSpawnCount"] = 6,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 12,
        ["leashRange"] = 56,
        ["moveSpeed"] = 25,
        ["retargetCycle"] = 0.4
    }
}
v1.pig = v4
local v5 = {
    ["monsterId"] = "snail",
    ["displayName"] = "LV16 \235\139\172\237\140\189\236\157\180",
    ["maxHp"] = 330,
    ["expReward"] = 119,
    ["goldReward"] = 24,
    ["touchDamage"] = 32,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "snail_shell",
            ["chance"] = 0.55,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "SnailSpawnPoint",
        ["legacyNamePattern"] = "^Snail_%d+$",
        ["templateName"] = "Snail",
        ["respawnTime"] = 2.5,
        ["defaultSpawnCount"] = 6,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.4
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 10,
        ["leashRange"] = 52,
        ["moveSpeed"] = 17,
        ["retargetCycle"] = 0.45
    }
}
v1.snail = v5
local v6 = {
    ["monsterId"] = "fox",
    ["displayName"] = "LV22 \236\151\172\236\154\176",
    ["maxHp"] = 480,
    ["expReward"] = 196,
    ["goldReward"] = 36,
    ["touchDamage"] = 47,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "fox_tail",
            ["chance"] = 0.45,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "FoxSpawnPoint",
        ["legacyNamePattern"] = "^Fox_%d+$",
        ["templateName"] = "Fox",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 38,
        ["retargetCycle"] = 0.35
    }
}
v1.fox = v6
local v7 = {
    ["monsterId"] = "crab",
    ["displayName"] = "LV27 \234\178\140",
    ["maxHp"] = 600,
    ["expReward"] = 288,
    ["goldReward"] = 46,
    ["touchDamage"] = 58,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "crab_claw",
            ["chance"] = 0.35,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "CrabSpawnPoint",
        ["legacyNamePattern"] = "^Crab_%d+$",
        ["templateName"] = "Crab",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.crab = v7
local v8 = {
    ["monsterId"] = "wolf",
    ["displayName"] = "LV31 \235\138\145\235\140\128",
    ["maxHp"] = 1200,
    ["expReward"] = 424,
    ["goldReward"] = 60,
    ["touchDamage"] = 78,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "wolf_fur",
            ["chance"] = 0.3,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "WolfSpawnPoint",
        ["legacyNamePattern"] = "^Wolf_%d+$",
        ["templateName"] = "Wolf",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.wolf = v8
local v9 = {
    ["monsterId"] = "bear",
    ["displayName"] = "LV36 \234\179\176",
    ["maxHp"] = 1550,
    ["expReward"] = 594,
    ["goldReward"] = 70,
    ["touchDamage"] = 106,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "bear_leather",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "BearSpawnPoint",
        ["legacyNamePattern"] = "^Bear_%d+$",
        ["templateName"] = "Bear",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.bear = v9
local v10 = {
    ["monsterId"] = "zombie",
    ["displayName"] = "LV42 \236\162\128\235\185\132",
    ["maxHp"] = 2400,
    ["expReward"] = 830,
    ["goldReward"] = 83,
    ["touchDamage"] = 130,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "zombie_arm",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "ZombieSpawnPoint",
        ["legacyNamePattern"] = "^Zombie_%d+$",
        ["templateName"] = "Zombie",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.zombie = v10
local v11 = {
    ["monsterId"] = "iceslime",
    ["displayName"] = "LV43 \236\150\188\236\157\140 \236\138\172\235\157\188\236\158\132",
    ["maxHp"] = 3150,
    ["expReward"] = 1151,
    ["goldReward"] = 92,
    ["touchDamage"] = 155,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "slime_jelly",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "IceSlimeSpawnPoint",
        ["legacyNamePattern"] = "^IceSlime_%d+$",
        ["templateName"] = "IceSlime",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.iceslime = v11
local v12 = {
    ["monsterId"] = "icebear",
    ["displayName"] = "LV45 \235\182\129\234\183\185\234\179\176",
    ["maxHp"] = 3900,
    ["expReward"] = 1508,
    ["goldReward"] = 107,
    ["touchDamage"] = 194,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "icebear_leather",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "IceBearSpawnPoint",
        ["legacyNamePattern"] = "^IceBear_%d+$",
        ["templateName"] = "IceBear",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.icebear = v12
local v13 = {
    ["monsterId"] = "spider",
    ["displayName"] = "LV48 \235\143\133\234\177\176\235\175\184",
    ["maxHp"] = 4600,
    ["expReward"] = 1943,
    ["goldReward"] = 115,
    ["touchDamage"] = 220,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "spider_leg",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "SpiderSpawnPoint",
        ["legacyNamePattern"] = "^Spider_%d+$",
        ["templateName"] = "Spider",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.spider = v13
local v14 = {
    ["monsterId"] = "skeleton",
    ["displayName"] = "LV52 \236\138\164\236\188\136\235\160\136\237\134\164",
    ["maxHp"] = 5250,
    ["expReward"] = 2219,
    ["goldReward"] = 130,
    ["touchDamage"] = 242,
    ["attackRange"] = 5,
    ["drops"] = {
        {
            ["itemId"] = "skeleton_bone",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "SkeletonSpawnPoint",
        ["legacyNamePattern"] = "^Skeleton_%d+$",
        ["templateName"] = "Skeleton",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.skeleton = v14
local v15 = {
    ["monsterId"] = "golem",
    ["displayName"] = "LV55 \234\179\168\235\160\152",
    ["maxHp"] = 6000,
    ["expReward"] = 2604,
    ["goldReward"] = 145,
    ["touchDamage"] = 280,
    ["attackRange"] = 6,
    ["drops"] = {
        {
            ["itemId"] = "golem_zogak",
            ["chance"] = 0.2,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "GolemSpawnPoint",
        ["legacyNamePattern"] = "^Golem_%d+$",
        ["templateName"] = "Golem",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.golem = v15
local v16 = {
    ["monsterId"] = "posionscorpion",
    ["displayName"] = "LV58 \236\160\132\234\176\136",
    ["maxHp"] = 6800,
    ["expReward"] = 2884,
    ["goldReward"] = 170,
    ["touchDamage"] = 330,
    ["attackRange"] = 6,
    ["drops"] = {
        {
            ["itemId"] = "scorpion_dok",
            ["chance"] = 0.17,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "PoisonScorpionSpawnPoint",
        ["legacyNamePattern"] = "^PoisonScorpion_%d+$",
        ["templateName"] = "PoisonScorpion",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.posionscorpion = v16
local v17 = {
    ["monsterId"] = "mummy",
    ["displayName"] = "LV61 \235\175\184\236\157\180\235\157\188",
    ["maxHp"] = 7600,
    ["expReward"] = 3164,
    ["goldReward"] = 195,
    ["touchDamage"] = 360,
    ["attackRange"] = 6,
    ["drops"] = {
        {
            ["itemId"] = "mummy_boongdae",
            ["chance"] = 0.1,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "MummySpawnPoint",
        ["legacyNamePattern"] = "^Mummy_%d+$",
        ["templateName"] = "Mummy",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.mummy = v17
local v18 = {
    ["monsterId"] = "redmummy",
    ["displayName"] = "LV64 \235\182\137\236\157\128 \235\175\184\236\157\180\235\157\188",
    ["maxHp"] = 8800,
    ["expReward"] = 3500,
    ["goldReward"] = 220,
    ["touchDamage"] = 420,
    ["attackRange"] = 6,
    ["drops"] = {
        {
            ["itemId"] = "redmummy_boongdae",
            ["chance"] = 0.15,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "RedMummynSpawnPoint",
        ["legacyNamePattern"] = "^RedMummy_%d+$",
        ["templateName"] = "RedMummy",
        ["respawnTime"] = 2.4,
        ["defaultSpawnCount"] = 5,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 3.5
    },
    ["elite"] = {
        ["enabled"] = true,
        ["perSpawnCount"] = 1,
        ["scale"] = 1.4,
        ["maxHpMul"] = 2,
        ["attackMul"] = 1.5,
        ["expRewardMul"] = 2,
        ["goldRewardMul"] = 2,
        ["hpBarOffsetMul"] = 1.18,
        ["titleText"] = "\236\151\152\235\166\172\237\138\184"
    },
    ["ai"] = {
        ["detectRange"] = 28,
        ["chaseStopRange"] = 42,
        ["wanderRadius"] = 13,
        ["leashRange"] = 58,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.35
    }
}
v1.redmummy = v18
local v19 = {
    ["monsterId"] = "kingbandit",
    ["displayName"] = "\236\130\176\236\160\129\236\153\149 \235\161\156\235\178\132\237\138\184",
    ["level"] = 45,
    ["maxHp"] = 130000,
    ["expReward"] = 7115,
    ["goldReward"] = 2000,
    ["touchDamage"] = 616,
    ["attackRange"] = 8,
    ["drops"] = {
        {
            ["itemId"] = "bandit_king_necklace",
            ["chance"] = 1,
            ["minQty"] = 1,
            ["maxQty"] = 1,
            ["rewardScope"] = "shared"
        },
        {
            ["itemId"] = "bandit_king_boots",
            ["chance"] = 0.1,
            ["minQty"] = 1,
            ["maxQty"] = 1,
            ["rewardScope"] = "individual"
        }
    },
    ["spawn"] = {
        ["pointTag"] = "KingBanditBossSpawnPoint",
        ["legacyNamePattern"] = "^KingBandit_%d+$",
        ["templateName"] = "KingBandit",
        ["respawnTime"] = 600,
        ["defaultSpawnCount"] = 1,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 4.8
    },
    ["ai"] = {
        ["detectRange"] = 84,
        ["chaseStopRange"] = 108,
        ["wanderRadius"] = 10,
        ["leashRange"] = 150,
        ["moveSpeed"] = 38,
        ["retargetCycle"] = 0.18,
        ["senseInterval"] = 0.06
    },
    ["boss"] = {
        ["enabled"] = true,
        ["kind"] = "boss",
        ["scale"] = 2.15,
        ["uiShowDistance"] = 210,
        ["returnHealPerSecond"] = 650,
        ["resetOnReturn"] = true,
        ["patternSetId"] = "kingbandit",
        ["debuffImmune"] = true,
        ["forceMoveImmune"] = true
    }
}
v1.kingbandit = v19
local v20 = {
    ["monsterId"] = "bandit",
    ["displayName"] = "\236\130\176\236\160\129",
    ["templateName"] = "Bandit",
    ["level"] = 41,
    ["maxHp"] = 1750,
    ["expReward"] = 0,
    ["goldReward"] = 0,
    ["touchDamage"] = 106,
    ["attackRange"] = 6,
    ["drops"] = {},
    ["noRewards"] = true,
    ["isSummonOnly"] = true,
    ["noQuestKillCredit"] = true,
    ["ai"] = {
        ["detectRange"] = 52,
        ["chaseStopRange"] = 268,
        ["wanderRadius"] = 6,
        ["leashRange"] = 34,
        ["moveSpeed"] = 42,
        ["retargetCycle"] = 0.22,
        ["senseInterval"] = 0.08
    }
}
v1.bandit = v20
local v21 = {
    ["monsterId"] = "arena_bandit_lord",
    ["displayName"] = "\237\136\172\234\184\176\236\158\165 \234\181\176\236\163\188 \235\161\156\235\178\132\237\138\184",
    ["level"] = 58,
    ["maxHp"] = 228000,
    ["expReward"] = 13552,
    ["goldReward"] = 4200,
    ["touchDamage"] = 720,
    ["attackRange"] = 10,
    ["drops"] = {
        {
            ["itemId"] = "bandit_king_necklace",
            ["chance"] = 1,
            ["minQty"] = 1,
            ["maxQty"] = 1,
            ["rewardScope"] = "shared"
        },
        {
            ["itemId"] = "bandit_king_boots",
            ["chance"] = 0.15,
            ["minQty"] = 1,
            ["maxQty"] = 1,
            ["rewardScope"] = "individual"
        }
    },
    ["spawn"] = {
        ["pointTag"] = "ArenaBanditLordSpawnPoint",
        ["legacyNamePattern"] = "^ArenaBanditLord_%d+$",
        ["templateName"] = "KingBandit",
        ["respawnTime"] = 600,
        ["defaultSpawnCount"] = 1,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 4.8
    },
    ["ai"] = {
        ["detectRange"] = 88,
        ["chaseStopRange"] = 108,
        ["wanderRadius"] = 4,
        ["leashRange"] = 96,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.16,
        ["senseInterval"] = 0.05
    },
    ["boss"] = {
        ["enabled"] = true,
        ["kind"] = "boss",
        ["scale"] = 2.25,
        ["uiShowDistance"] = 220,
        ["returnHealPerSecond"] = 820,
        ["resetOnReturn"] = true,
        ["arenaId"] = "Arena_BanditLord",
        ["arenaPatternSetId"] = "arena_bandit_lord",
        ["debuffImmune"] = true,
        ["forceMoveImmune"] = true
    }
}
v1.arena_bandit_lord = v21
local v22 = {
    ["monsterId"] = "training_dummy",
    ["displayName"] = "Training Dummy",
    ["maxHp"] = 10000000,
    ["expReward"] = 0,
    ["goldReward"] = 0,
    ["touchDamage"] = 0,
    ["attackRange"] = 0,
    ["drops"] = {},
    ["spawn"] = {
        ["pointTag"] = "TrainingDummySpawnPoint",
        ["legacyNamePattern"] = "^TrainingDummy_%d+$",
        ["templateName"] = "TrainingDummy",
        ["respawnTime"] = 5,
        ["defaultSpawnCount"] = 1,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 3.8
    },
    ["elite"] = {
        ["enabled"] = false
    },
    ["ai"] = {
        ["detectRange"] = 0,
        ["chaseStopRange"] = 0,
        ["wanderRadius"] = 0,
        ["leashRange"] = 0,
        ["moveSpeed"] = 0,
        ["retargetCycle"] = 1,
        ["trainingDummy"] = true,
        ["trainingDummyResetTime"] = 5
    }
}
v1.training_dummy = v22
local v23 = {
    ["monsterId"] = "raptor_miniboss",
    ["displayName"] = "\235\175\184\235\139\136\235\163\161",
    ["level"] = 30,
    ["maxHp"] = 38000,
    ["expReward"] = 4404,
    ["goldReward"] = 1500,
    ["touchDamage"] = 480,
    ["attackRange"] = 8,
    ["drops"] = {
        {
            ["itemId"] = "cloth_armor",
            ["chance"] = 1,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "RaptorMiniBossSpawnPoint",
        ["legacyNamePattern"] = "^RaptorMiniBoss_%d+$",
        ["templateName"] = "Raptor",
        ["respawnTime"] = 300,
        ["defaultSpawnCount"] = 1,
        ["spawnHeightOffset"] = 2.5,
        ["hpBarOffsetY"] = 4.2
    },
    ["ai"] = {
        ["detectRange"] = 72,
        ["chaseStopRange"] = 96,
        ["wanderRadius"] = 8,
        ["leashRange"] = 120,
        ["moveSpeed"] = 54,
        ["retargetCycle"] = 0.2,
        ["senseInterval"] = 0.06
    },
    ["boss"] = {
        ["enabled"] = true,
        ["kind"] = "mini_boss",
        ["scale"] = 1.55,
        ["uiShowDistance"] = 170,
        ["returnHealPerSecond"] = 280,
        ["resetOnReturn"] = true,
        ["patternSetId"] = "raptor_miniboss",
        ["debuffImmune"] = true,
        ["forceMoveImmune"] = true
    }
}
v1.raptor_miniboss = v23
local v24 = {
    ["monsterId"] = "skeleton_miniboss",
    ["displayName"] = "\237\130\185 \236\138\164\236\187\172 \236\158\173",
    ["level"] = 55,
    ["maxHp"] = 168000,
    ["expReward"] = 10021,
    ["goldReward"] = 3500,
    ["touchDamage"] = 0,
    ["attackRange"] = 74,
    ["drops"] = {
        {
            ["itemId"] = "guardian_armor",
            ["chance"] = 1,
            ["minQty"] = 1,
            ["maxQty"] = 1
        }
    },
    ["spawn"] = {
        ["pointTag"] = "KingSkeletonMiniBossSpawnPoint",
        ["legacyNamePattern"] = "^KingSkeletonMiniBoss_%d+$",
        ["templateName"] = "KingSkullJack",
        ["respawnTime"] = 420,
        ["defaultSpawnCount"] = 1,
        ["spawnHeightOffset"] = 4.5,
        ["hpBarOffsetY"] = 4.4
    },
    ["ai"] = {
        ["detectRange"] = 96,
        ["chaseStopRange"] = 126,
        ["wanderRadius"] = 8,
        ["leashRange"] = 150,
        ["moveSpeed"] = 30,
        ["retargetCycle"] = 0.14,
        ["senseInterval"] = 0.05
    },
    ["boss"] = {
        ["enabled"] = true,
        ["kind"] = "mini_boss",
        ["scale"] = 1.8,
        ["uiShowDistance"] = 190,
        ["returnHealPerSecond"] = 360,
        ["resetOnReturn"] = true,
        ["patternSetId"] = "skeleton_miniboss",
        ["debuffImmune"] = true,
        ["forceMoveImmune"] = true
    }
}
v1.skeleton_miniboss = v24
local v25 = {
    ["monsterId"] = "grid",
    ["displayName"] = "\236\154\149\235\167\157\236\157\152 \234\183\184\235\166\172\235\147\156",
    ["templateName"] = "Grid",
    ["level"] = 60,
    ["maxHp"] = 4444444,
    ["expReward"] = 0,
    ["goldReward"] = 0,
    ["touchDamage"] = 450,
    ["attackRange"] = 11,
    ["drops"] = {},
    ["noRewards"] = true,
    ["rewardMode"] = "none",
    ["noQuestKillCredit"] = true,
    ["spawn"] = {
        ["templateName"] = "Grid",
        ["spawnHeightOffset"] = 8,
        ["spawnHeightPerScale"] = 4,
        ["maxSpawnHeightOffset"] = 28,
        ["hpBarOffsetY"] = 9.5
    },
    ["ai"] = {
        ["detectRange"] = 130,
        ["chaseStopRange"] = 165,
        ["wanderRadius"] = 8,
        ["moveSpeed"] = 34,
        ["retargetCycle"] = 0.14,
        ["senseInterval"] = 0.05
    },
    ["boss"] = {
        ["enabled"] = true,
        ["kind"] = "world_boss",
        ["scale"] = 4,
        ["uiShowDistance"] = 260,
        ["returnHealPerSecond"] = 0,
        ["resetOnReturn"] = false,
        ["patternSetId"] = "world_boss_grid",
        ["debuffImmune"] = true,
        ["forceMoveImmune"] = true
    }
}
v1.grid = v25
return v1