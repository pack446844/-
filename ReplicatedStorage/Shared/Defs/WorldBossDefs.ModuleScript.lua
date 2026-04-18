local v1 = {
    ["ENABLED"] = true,
    ["PUBLIC_SERVER_ONLY"] = true,
    ["HEARTBEAT_INTERVAL"] = 0.2,
    ["RESULTS_AUTO_CLOSE_SECONDS"] = 25,
    ["SPAWN_RETRY_SECONDS"] = 60,
    ["KST_OFFSET"] = 32400,
    ["RESET_HOUR_KST"] = 4,
    ["UI_REMOTE_NAME"] = "WorldBossUi",
    ["SYSTEM_NAME"] = "\236\155\148\235\147\156\235\179\180\236\138\164",
    ["ROOT_ZONES_FOLDER_NAME"] = "WorldBossZones",
    ["DEFAULT_SPAWN_PART_NAME"] = "SpawnPoint",
    ["DEFAULT_BOUNDS_PART_NAME"] = "Bounds",
    ["MAX_CONCURRENT_ACTIVE"] = 1
}
local v2 = {}
local v3 = {
    ["bossId"] = "grid",
    ["monsterId"] = "grid",
    ["displayName"] = "\236\154\149\235\167\157\236\157\152 \234\183\184\235\166\172\235\147\156",
    ["systemName"] = "\236\154\149\235\167\157\236\157\152 \234\183\184\235\166\172\235\147\156",
    ["zonesFolderName"] = "Grid",
    ["spawnPartName"] = "SpawnPoint",
    ["boundsPartName"] = "Bounds",
    ["minRespawnSeconds"] = 5400,
    ["maxRespawnSeconds"] = 7200,
    ["inactivityResetSeconds"] = 60,
    ["firstPlaceTitleId"] = "world_boss_top_1_grid"
}
local v4 = {
    ["top1"] = {
        ["gold"] = 200000,
        ["token"] = 45
    },
    ["top2_3"] = {
        ["gold"] = 150000,
        ["token"] = 35
    },
    ["top4_10"] = {
        ["gold"] = 100000,
        ["token"] = 28
    },
    ["others"] = {
        ["gold"] = 50000,
        ["token"] = 22
    }
}
v3.rewards = v4
v3.specialDrop = {
    ["itemId"] = "grid_laser_necklace",
    ["chance"] = 0.05,
    ["displayName"] = "\236\154\149\235\167\157\236\157\152 \234\183\184\235\166\172\235\147\156 \235\170\169\234\177\184\236\157\180"
}
v2.grid = v3
v1.BOSSES = v2
return v1