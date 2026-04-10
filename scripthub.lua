-- ============================================================================
-- NYX SCRIPT HUB - VERIFIED WORKING LIBRARY
-- ============================================================================
local ScriptLibrary = {
    ["Universal"] = {
        -- Remote Spies
        {name = "AdvancedSpy", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EvyOksi/AdvancedSpy/main/AdvancedSpy.lua", true))() end},
        {name = "Turtle Spy", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Spy/main/source.lua", true))() end},
        {name = "Sigma-Spy", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yukvx/Sigma-Spy/refs/heads/main/Main.lua", true))() end},
        
        -- Админ-панели и инструменты
        {name = "Infinite Yield", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))() end},
        {name = "Reviz Admin", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Reviz-v2/Reviz-Admin/main/loader.lua", true))() end},
        {name = "Fates Admin", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua", true))() end},
        {name = "Dex Explorer", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", true))() end},
        
        -- Геймплейные
        {name = "ESP (Highlights)", func = function()
            local players = game:GetService("Players")
            for _, p in pairs(players:GetPlayers()) do
                if p ~= players.LocalPlayer then
                    p.CharacterAdded:Connect(function(char)
                        local highlight = Instance.new("Highlight", char)
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    end)
                    if p.Character then
                        Instance.new("Highlight", p.Character).FillColor = Color3.fromRGB(255, 0, 0)
                    end
                end
            end
        end},
        {name = "Fly", func = function()
            local player = game.Players.LocalPlayer
            local hrp = player.Character:WaitForChild("HumanoidRootPart")
            local hum = player.Character:WaitForChild("Humanoid")
            flying = true; hum.PlatformStand = true
            game:GetService("RunService").Heartbeat:Connect(function()
                if flying and hrp then hrp.Velocity = Vector3.new(0, 50, 0) end
            end)
        end},
        {name = "NoClip", func = function()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end},
        {name = "Speed Hack", func = function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50 end},
        {name = "Infinite Jump", func = function()
            local hum = game.Players.LocalPlayer.Character.Humanoid
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false) task.wait(0.1)
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        end},
        {name = "Click TP", func = function()
            local player = game.Players.LocalPlayer
            local mouse = player:GetMouse()
            mouse.Button1Down:Connect(function()
                if mouse.Target then player.Character:MoveTo(mouse.Hit.Position) end
            end)
        end}
    },
    ["Visual"] = {
        {name = "FPS Booster", func = function()
            settings().Rendering.QualityLevel = 1
            local light = game:GetService("Lighting")
            light.GlobalShadows = false; light.FogEnd = 9e9
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
            end
        end},
        {name = "Fullbright", func = function()
            local light = game:GetService("Lighting")
            light.Brightness = 2; light.ClockTime = 14; light.FogEnd = 100000
            light.GlobalShadows = false
        end},
        {name = "X-Ray", func = function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0.5 end
            end
        end},
        {name = "Invisible", func = function()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Transparency = 1 end
            end
        end},
        {name = "Rainbow Character", func = function()
            task.spawn(function()
                while true do
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then v.BrickColor = BrickColor.random() end
                    end
                    task.wait(0.1)
                end
            end)
        end},
        {name = "Spinbot", func = function()
            local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            task.spawn(function() while true do hrp.CFrame = hrp.CFrame * CFrame.Angles(0, 0.1, 0) task.wait() end end)
        end},
        {name = "Giant", func = function() game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10) end},
        {name = "Tiny", func = function() game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(1, 1, 1) end}
    },
    ["Utility"] = {
        {name = "Rejoin", func = function() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end},
        {name = "Server Hop", func = function()
            local ts, player, Http = game:GetService("TeleportService"), game.Players.LocalPlayer, game:GetService("HttpService")
            local servers = Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100"))
            for _, s in pairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    ts:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                    return
                end
            end
        end},
        {name = "Low Gravity", func = function() workspace.Gravity = 50 end},
        {name = "Normal Gravity", func = function() workspace.Gravity = 196.2 end},
        {name = "Anti-AFK", func = function()
            local vu = game:GetService("VirtualUser")
            game.Players.LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame) task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end},
        {name = "Reset Character", func = function() game.Players.LocalPlayer.Character:BreakJoints() end},
        {name = "Copy Game ID", func = function() setclipboard(tostring(game.PlaceId)) end}
    }
}
