--[[
    NYX GUI - Server Destruction & Misc
    Стиль: минимализм, чёрный фон, зелёные акценты
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NyxGUI"
gui.ResetOnSpawn = false

-- Основное окно
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 350)
main.Position = UDim2.new(0.5, -200, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Visible = true

-- Заголовок
local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX GUI"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.Code
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", titleBar)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BorderSizePixel = 0
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.Code
close.TextSize = 14
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Вкладки
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 30)
tabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
tabFrame.BorderSizePixel = 0

local destructionTab = Instance.new("TextButton", tabFrame)
destructionTab.Size = UDim2.new(0, 195, 1, 0)
destructionTab.Position = UDim2.new(0, 0, 0, 0)
destructionTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
destructionTab.Text = "Server Destruction"
destructionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
destructionTab.Font = Enum.Font.Code
destructionTab.TextSize = 12

local miscTab = Instance.new("TextButton", tabFrame)
miscTab.Size = UDim2.new(0, 195, 1, 0)
miscTab.Position = UDim2.new(0, 195, 0, 0)
miscTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
miscTab.Text = "Misc"
miscTab.TextColor3 = Color3.fromRGB(150, 150, 150)
miscTab.Font = Enum.Font.Code
miscTab.TextSize = 12

-- Контент
local contentFrame = Instance.new("Frame", main)
contentFrame.Size = UDim2.new(1, -20, 0, 220)
contentFrame.Position = UDim2.new(0, 10, 0, 70)
contentFrame.BackgroundTransparency = 1

-- ============================================================================
-- ВКЛАДКА SERVER DESTRUCTION
-- ============================================================================
local destructionFrame = Instance.new("Frame", contentFrame)
destructionFrame.Size = UDim2.new(1, 0, 1, 0)
destructionFrame.BackgroundTransparency = 1

-- Кнопки Server Destruction (сетка 3x2)
local sdButtons = {
    {text = "Kill All", pos = {0, 0}, color = Color3.fromRGB(150, 0, 0)},
    {text = "Crash Server", pos = {0, 125}, color = Color3.fromRGB(150, 50, 0)},
    {text = "Lag Server", pos = {0, 250}, color = Color3.fromRGB(150, 100, 0)},
    {text = "Delete Map", pos = {1, 0}, color = Color3.fromRGB(100, 0, 100)},
    {text = "Spam Sounds", pos = {1, 125}, color = Color3.fromRGB(0, 100, 100)},
    {text = "Kick All", pos = {1, 250}, color = Color3.fromRGB(100, 0, 0)}
}

for i, btn in ipairs(sdButtons) do
    local b = Instance.new("TextButton", destructionFrame)
    b.Size = UDim2.new(0, 115, 0, 80)
    b.Position = UDim2.new(0, btn.pos[2] + 5, 0, btn.pos[1] * 90 + 5)
    b.BackgroundColor3 = btn.color
    b.Text = btn.text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Code
    b.TextSize = 13
    b.BorderSizePixel = 0
    
    -- Функции для кнопок
    b.MouseButton1Click:Connect(function()
        if btn.text == "Kill All" then
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 0
                end
            end
        elseif btn.text == "Crash Server" then
            -- Спавним много объектов для краша
            for i = 1, 1000 do
                Instance.new("Part", workspace).Position = Vector3.new(math.random(-100,100), math.random(0,50), math.random(-100,100))
            end
        elseif btn.text == "Lag Server" then
            -- Бесконечный цикл на клиенте (лаг)
            while true do end
        elseif btn.text == "Delete Map" then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Part") and v.Name ~= "Baseplate" then
                    pcall(function() v:Destroy() end)
                end
            end
        elseif btn.text == "Spam Sounds" then
            for i = 1, 50 do
                local s = Instance.new("Sound", workspace)
                s.SoundId = "rbxassetid://9120386436"
                s.Volume = 10
                s:Play()
            end
        elseif btn.text == "Kick All" then
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= player then
                    pcall(function() p:Kick("NYX GUI") end)
                end
            end
        end
    end)
end

-- ============================================================================
-- ВКЛАДКА MISC
-- ============================================================================
local miscFrame = Instance.new("Frame", contentFrame)
miscFrame.Size = UDim2.new(1, 0, 1, 0)
miscFrame.BackgroundTransparency = 1
miscFrame.Visible = false

-- Кнопки Misc (сетка 3x2)
local miscButtons = {
    {text = "Infinite Yield", pos = {0, 0}, color = Color3.fromRGB(0, 80, 0)},
    {text = "Dex Explorer", pos = {0, 125}, color = Color3.fromRGB(0, 0, 100)},
    {text = "Fly", pos = {0, 250}, color = Color3.fromRGB(0, 100, 100)},
    {text = "ESP", pos = {1, 0}, color = Color3.fromRGB(80, 0, 80)},
    {text = "Aimbot", pos = {1, 125}, color = Color3.fromRGB(100, 50, 0)},
    {text = "Teleport", pos = {1, 250}, color = Color3.fromRGB(50, 50, 50)}
}

for i, btn in ipairs(miscButtons) do
    local b = Instance.new("TextButton", miscFrame)
    b.Size = UDim2.new(0, 115, 0, 80)
    b.Position = UDim2.new(0, btn.pos[2] + 5, 0, btn.pos[1] * 90 + 5)
    b.BackgroundColor3 = btn.color
    b.Text = btn.text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Code
    b.TextSize = 13
    b.BorderSizePixel = 0
    
    b.MouseButton1Click:Connect(function()
        print("NYX GUI: " .. btn.text .. " clicked!")
        -- Здесь можно добавить loadstring для каждого скрипта
    end)
end

-- ============================================================================
-- ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================================
destructionTab.MouseButton1Click:Connect(function()
    destructionFrame.Visible = true
    miscFrame.Visible = false
    destructionTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    miscTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    destructionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    miscTab.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

miscTab.MouseButton1Click:Connect(function()
    destructionFrame.Visible = false
    miscFrame.Visible = true
    destructionTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    miscTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    destructionTab.TextColor3 = Color3.fromRGB(150, 150, 150)
    miscTab.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- ============================================================================
-- КНОПКА OPEN/CLOSE
-- ============================================================================
local toggleBtn = Instance.new("TextButton", main)
toggleBtn.Size = UDim2.new(1, -20, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 300)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
toggleBtn.BorderSizePixel = 1
toggleBtn.Text = "Open/Close"
toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
toggleBtn.Font = Enum.Font.Code
toggleBtn.TextSize = 12

local isOpen = true
toggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    contentFrame.Visible = isOpen
    toggleBtn.Text = isOpen and "Open/Close" or "Open/Close (Hidden)"
end)

-- ============================================================================
-- DRAGIFY
-- ============================================================================
local UIS = game:GetService("UserInputService")
local dragToggle, dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

print("NYX GUI loaded!")
