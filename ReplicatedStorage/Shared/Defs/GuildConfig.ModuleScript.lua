local v1 = {
    ["CREATE_COST"] = 10000,
    ["MAX_MEMBERS"] = 20,
    ["MAX_VICE_MASTERS"] = 2,
    ["NAME_MIN"] = 2,
    ["NAME_MAX"] = 12,
    ["LIST_FETCH_LIMIT"] = 25,
    ["PENDING_LIMIT"] = 20,
    ["ROLE_NONE"] = "none",
    ["ROLE_MASTER"] = "master",
    ["ROLE_VICE"] = "vice",
    ["ROLE_MEMBER"] = "member"
}
v1.ROLE_ORDER = {
    [v1.ROLE_MASTER] = 1,
    [v1.ROLE_VICE] = 2,
    [v1.ROLE_MEMBER] = 3,
    [v1.ROLE_NONE] = 4
}
v1.ROLE_DISPLAY = {
    [v1.ROLE_MASTER] = "\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176",
    [v1.ROLE_VICE] = "\235\182\128\234\184\184\235\147\156\235\167\136\236\138\164\237\132\176",
    [v1.ROLE_MEMBER] = "\234\184\184\235\147\156\236\155\144",
    [v1.ROLE_NONE] = ""
}
v1.ACTION_OPEN = "open"
v1.ACTION_CREATE = "create"
v1.ACTION_APPLY = "apply"
v1.ACTION_LEAVE = "leave"
v1.ACTION_APPROVE = "approve"
v1.ACTION_REJECT = "reject"
v1.ACTION_KICK = "kick"
v1.ACTION_SET_ROLE = "set_role"
v1.SET_ROLE_MASTER = v1.ROLE_MASTER
v1.SET_ROLE_VICE = v1.ROLE_VICE
v1.SET_ROLE_MEMBER = v1.ROLE_MEMBER
v1.NOTICE_TIME = 3.5
return v1