local v1 = {}
local v2 = {
    ["summonId"] = "cross_totem",
    ["summonType"] = "turret",
    ["displayName"] = "\236\139\173\236\158\144\234\176\128 \237\134\160\237\133\156",
    ["templateName"] = "Cross",
    ["duration"] = 10,
    ["tickInterval"] = 0.45,
    ["radius"] = 40,
    ["acquireRadius"] = 40,
    ["maxTargets"] = 3,
    ["maxMonsters"] = 3,
    ["maxPlayers"] = 3,
    ["maxParts"] = 2048,
    ["maxActivePerOwner"] = 1,
    ["spawnRadius"] = 4.2,
    ["spawnGroundOffset"] = 0.15,
    ["despawnOnOwnerDeath"] = true,
    ["targetPolicy"] = "enemies",
    ["damage"] = {
        ["base"] = 48,
        ["scale"] = 0.85
    }
}
local v3 = {
    ["enabled"] = true,
    ["interval"] = 0.9,
    ["radius"] = 34,
    ["maxTargets"] = 4,
    ["includeOwner"] = true,
    ["includeParty"] = true,
    ["amount"] = {
        ["base"] = 48,
        ["scale"] = 0.55
    }
}
local v4 = {
    ["rangeRing"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(90, 255, 160),
        ["transparency"] = 0.35,
        ["thickness"] = 0.18,
        ["height"] = 0.1,
        ["yOffset"] = 0.15,
        ["segments"] = 24
    }
}
v3.visual = v4
v2.healPulse = v3
local v5 = {
    ["color"] = Color3.fromRGB(65, 0, 110),
    ["accentColor"] = Color3.fromRGB(160, 70, 255),
    ["radius"] = 2.5,
    ["height"] = 6,
    ["floatingOrbY"] = 3.8,
    ["rangeRing"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 70, 90),
        ["transparency"] = 0.2,
        ["thickness"] = 0.22,
        ["height"] = 0.12,
        ["yOffset"] = 0.08,
        ["segments"] = 24
    }
}
v2.visual = v5
v1.cross_totem = v2
local v6 = {
    ["summonId"] = "angel",
    ["summonType"] = "guard",
    ["displayName"] = "\236\178\156\236\130\172",
    ["templateName"] = "Angel",
    ["duration"] = 12,
    ["spawnCount"] = 3,
    ["tickInterval"] = 0.7,
    ["acquireRadius"] = 42,
    ["radius"] = 42,
    ["attackRange"] = 8,
    ["moveSpeed"] = 45,
    ["followDistance"] = 3,
    ["leashDistance"] = 35,
    ["maxTargets"] = 1,
    ["maxMonsters"] = 1,
    ["maxPlayers"] = 1,
    ["maxParts"] = 2048,
    ["maxActivePerOwner"] = 3,
    ["spawnRadius"] = 5.5,
    ["spawnGroundOffset"] = 0.15,
    ["despawnOnOwnerDeath"] = true,
    ["targetPolicy"] = "enemies",
    ["damage"] = {
        ["base"] = 60,
        ["scale"] = 0.32
    },
    ["visual"] = {
        ["color"] = Color3.fromRGB(45, 45, 45),
        ["accentColor"] = Color3.fromRGB(215, 215, 215),
        ["weaponColor"] = Color3.fromRGB(170, 120, 255)
    }
}
v1.angel = v6
local v7 = {
    ["summonId"] = "pirate_cannon",
    ["summonType"] = "artillery",
    ["displayName"] = "\237\149\180\236\160\129 \235\140\128\237\143\172",
    ["templateName"] = "PirateCannon",
    ["duration"] = 10,
    ["tickInterval"] = 0.35,
    ["acquireRadius"] = 30,
    ["radius"] = 30,
    ["maxTargets"] = 1,
    ["maxMonsters"] = 1,
    ["maxPlayers"] = 1,
    ["maxParts"] = 2048,
    ["maxActivePerOwner"] = 1,
    ["spawnRadius"] = 4.5,
    ["spawnGroundOffset"] = 0.05,
    ["muzzlePartName"] = "Muzzle",
    ["despawnOnOwnerDeath"] = true,
    ["targetPolicy"] = "enemies",
    ["damage"] = {
        ["base"] = 58,
        ["scale"] = 0.21
    }
}
local v8 = {
    ["speed"] = 54,
    ["radius"] = 4.2,
    ["lifetime"] = 1.8,
    ["maxTargets"] = 1,
    ["visual"] = {
        ["name"] = "CannonballProjectile",
        ["color"] = Color3.fromRGB(255, 170, 80),
        ["size"] = Vector3.new(1.8, 1.8, 1.8)
    }
}
v7.projectile = v8
local v9 = {
    ["color"] = Color3.fromRGB(88, 88, 88),
    ["accentColor"] = Color3.fromRGB(35, 35, 35),
    ["muzzleColor"] = Color3.fromRGB(255, 170, 80),
    ["rangeRing"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 60, 60),
        ["transparency"] = 0.15,
        ["thickness"] = 0.22,
        ["height"] = 0.12,
        ["yOffset"] = 0.08,
        ["segments"] = 28
    }
}
v7.visual = v9
v1.pirate_cannon = v7
return v1