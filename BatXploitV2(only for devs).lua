-- █████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
-- ██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
-- ██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit GUI loading...")
-- Alpha build
local gui = Instance.new("ScreenGui")
gui.Name = "BatXploitGUI"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 350, 0, 420)
main.Position = UDim2.new(0.5, -175, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(255, 0, 0)
main.Active = true
main.Draggable = true
main.Parent = gui


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
title.Text = "BATXPLOIT"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = main


local buttons = {
    {name = "Inf Yield", y = 60, action = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end},
    {name = "Fly", y = 110, action = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1,1,1) * 100000
        bv.Parent = hrp
        local flying = true
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.F then
                flying = not flying
                if flying then bv.Parent = hrp else bv.Parent = nil end
            end
        end)
        game:GetService("RunService").RenderStepped:Connect(function()
            if flying and hrp then
                bv.Velocity = Vector3.new(0, 0, 0)
                local move = Vector3.new()
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0,0,-50) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0,0,50) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-50,0,0) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(50,0,0) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,50,0) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then move = move + Vector3.new(0,-50,0) end
                bv.Velocity = move
            end
        end)
    end},
    {name = "Fling", y = 160, action = function()
        local target = game.Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
    end},
    {name = "Speed x2", y = 210, action = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 32
        end
    end},
    {name = "Jump x2", y = 260, action = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = 80
        end
    end},
    {name = "NoClip", y = 310, action = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CanCollide = false
        end
    end}
}

for _, btnData in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 35)
    btn.Position = UDim2.new(0.5, -100, 0, btnData.y)
    btn.Text = btnData.name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Parent = main
    btn.MouseButton1Click:Connect(btnData.action)
end


local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 55)
footer.Position = UDim2.new(0, 0, 1, -55)
footer.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
footer.Text = "⚠️ ALPHA BUILD\nI dont make remakes, so dont download remakes of ts gui! With love Str3llbat"
footer.TextColor3 = Color3.fromRGB(255, 100, 0)
footer.Font = Enum.Font.SourceSans
footer.TextSize = 10
footer.TextWrapped = true
footer.Parent = main


game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BatXploit",
    Text = "Module loaded! Enjoy:)",
    Duration = 4
})
