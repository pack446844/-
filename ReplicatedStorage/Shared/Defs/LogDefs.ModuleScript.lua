local v1 = {
    ["Types"] = {
        ["PVP"] = "PVP",
        ["DUEL"] = "DUEL"
    }
}
local v2 = {
    ["PVP"] = {
        ["prefix"] = "[PVP]",
        ["prefixColor"] = Color3.fromRGB(255, 165, 0),
        ["duration"] = 6
    },
    ["DUEL"] = {
        ["prefix"] = "[\234\178\176\237\136\172]",
        ["prefixColor"] = Color3.fromRGB(100, 200, 255),
        ["duration"] = 6
    }
}
v1.Display = v2
v1.MAX_LOG_ENTRIES = 6
return v1