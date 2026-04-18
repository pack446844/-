local v1 = game:GetService("Players").LocalPlayer
local v2 = v1 and v1:WaitForChild("PlayerGui") or nil
local v3 = v2 and v2:FindFirstChild("AdminAuditLogGui")
if v3 then
    v3:Destroy()
end
print("[AdminAuditLogUIController] disabled for data safety")