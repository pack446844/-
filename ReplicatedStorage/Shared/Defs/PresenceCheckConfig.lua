local v1 = {
    ["LOOP_INTERVAL"] = 1,
    ["TRIGGER_COMBAT_SECONDS"] = 7200,
    ["ACTIVE_COMBAT_GAP_SECONDS"] = 10,
    ["COMBAT_SESSION_RESET_SECONDS"] = 300,
    ["RESET_AFTER_NO_COMBAT_SECONDS"] = 300,
    ["CHALLENGE_TIMEOUT_SECONDS"] = 60,
    ["MAX_ATTEMPTS"] = 3,
    ["DISPLAY_ITEM_COUNT"] = 4,
    ["PROMPT_ITEM_COUNT"] = 3,
    ["SUBMIT_MIN_INTERVAL"] = 0.2,
    ["SAFE_ZONE_RECHECK_SECONDS"] = 3,
    ["REMOTE_OPEN_NAME"] = "PresenceCheckOpen",
    ["REMOTE_SUBMIT_NAME"] = "PresenceCheckSubmit",
    ["REMOTE_CLOSE_NAME"] = "PresenceCheckClose",
    ["FAIL_RETURN_SKIP_COOLDOWN"] = true,
    ["SCHEDULER_INTERVAL"] = 0.5,
    ["TIMEOUT_INTERVAL"] = 0.25,
    ["SCHEDULER_RETRY_SECONDS"] = 0.5,
    ["SCHEDULE_BUCKET_STEP_LIMIT"] = 128,
    ["MAX_ACTIVE_CHECKS"] = 2,
    ["CHECK_COOLDOWN_SECONDS"] = 180,
    ["MIN_COMBAT_SCORE_TO_CHECK"] = 5,
    ["MAX_COMBAT_SCORE"] = 20,
    ["SCORE_DEAL_MONSTER_DAMAGE"] = 2,
    ["SCORE_TAKE_MONSTER_DAMAGE"] = 1,
    ["SCORE_SKILL"] = 1,
    ["SCORE_AUTO_ACTIVITY"] = 1,
    ["SCORE_BOSS_BONUS"] = 1,
    ["ITEM_POOL"] = {
        {
            ["id"] = "slime",
            ["label"] = "\236\138\172\235\157\188\236\158\132"
        },
        {
            ["id"] = "wolf",
            ["label"] = "\235\138\145\235\140\128"
        },
        {
            ["id"] = "bear",
            ["label"] = "\234\179\176"
        },
        {
            ["id"] = "skeleton",
            ["label"] = "\237\149\180\234\179\168"
        },
        {
            ["id"] = "bat",
            ["label"] = "\235\176\149\236\165\144"
        },
        {
            ["id"] = "goblin",
            ["label"] = "\234\179\160\235\184\148\235\166\176"
        },
        {
            ["id"] = "boar",
            ["label"] = "\235\169\167\235\143\188\236\167\128"
        },
        {
            ["id"] = "shark",
            ["label"] = "\236\131\129\236\150\180"
        }
    }
}
return v1