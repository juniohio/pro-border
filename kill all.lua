
local mt = getrawmetatable(game)
local OldNameCall = mt.__namecall
local old = mt.__newindex
setreadonly(mt, false)
mt.__newindex = newcclosure(function(self, idx, val)
   if tostring(self) == 'Stamina' and tostring(self).IsA(self, 'NumberValue') and idx == 'Value' then
       val = 100
   end
   return old(self, idx, val)
end)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local Args = {...}
    if not checkcaller() then
        if tostring(self) == "Humanoid" and method == "SetStateEnabled" and (Args[1] == Enum.HumanoidStateType.Jumping and Args[2] == false) then
            --print("RETURNING")
            return
        end
    end
    return OldNameCall(self, unpack(Args))
 end)
setreadonly(mt, true)

local function getClosestPlayerHRP()
    local Closest
    local DistanceToChar = 9e9
    for _, Player in next, game.Players:GetPlayers() do
        if Player == LocalPlayer then continue end

        local Character = Player.Character
        if not Character then continue end

        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character:FindFirstChild("Humanoid")

        if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end

        local LP = game.Players.LocalPlayer
        local LPChar = LP.Character
        if not LPChar then continue end

        local LPHRP = LPChar:FindFirstChild("HumanoidRootPart")
        if not LPHRP then continue end

        local Distance = (LPHRP.Position - HumanoidRootPart.Position).Magnitude
        if Distance <= DistanceToChar then
            Closest = HumanoidRootPart
            DistanceToChar = Distance
        end
    end
    return DistanceToChar, Closest
end

while true do --getClosestPlayerHRP() < 10 do 
    game:GetService("ReplicatedStorage").RemoteEvents.Punch:FireServer("L")
    game:GetService("ReplicatedStorage").RemoteEvents.Punch:FireServer("R")
    wait()

    local A_1 =
    {
    ["PunchMultiplier"] = 69420
    }
    local Event = game:GetService("ReplicatedStorage").RemoteEvents.PlayerValue
    Event:FireServer(A_1)
    local A_1 =
    {
    ["TeamSwitchCooldown"] = 0
    }
    local Event = game:GetService("ReplicatedStorage").RemoteEvents.PlayerValue
    Event:FireServer(A_1)
end

local LP = game.Players.LocalPlayer
while wait() do
for _,player in pairs(game.Players:GetPlayers()) do
    if player ~= LP and player then
        local character = player.Character
        --print("char =", char, "; LPchar =", LPchar, "; character = ", character)
        if character and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
            local start_time = tick()
            repeat
            LP.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0,0,math.random(-5,5))
            game:GetService('RunService').Stepped:Wait()
            until (tick() - start_time) > 2 or not LP.Character or not character or not character.Humanoid or character.Humanoid.Health <= 0 or character.HumanoidRootPart.Position.Z < -700 or character:FindFirstChild("ForceField") or not LP.Character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("HumanoidRootPart")
        end
    end
end
end

while wait() do
    local LP = game.Players.LocalPlayer
    local char = LP.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Jump = true
    end
end
