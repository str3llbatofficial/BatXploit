--[[
    NYX GUI - Server Destruction & Misc
    Стиль: как на скрине (таблица с рамками)
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NyxGUI"
gui.ResetOnSpawn = false

-- Основное окно
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 300)
main.Position = UDim2.new(0.5, -175, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0

-- Заголовок
local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX GUI"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.Code
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", titleBar)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -25, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BorderSizePixel = 0
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.Code
close.TextSize = 12
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Вкладки
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 25)
tabFrame.Position = UDim2.new(0, 0, 0, 25)
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tabFrame.BorderSizePixel = 0

local destructionTab = Instance.new("TextButton", tabFrame)
destructionTab.Size = UDim2.new(0, 170, 1, 0)
destructionTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
destructionTab.Text = "Server Destruction"
destructionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
destructionTab.Font = Enum.Font.Code
destructionTab.TextSize = 11

local miscTab = Instance.new("TextButton", tabFrame)
miscTab.Size = UDim2.new(0, 170, 1, 0)
miscTab.Position = UDim2.new(0, 170, 0, 0)
miscTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
miscTab.Text = "Misc"
miscTab.TextColor3 = Color3.fromRGB(150, 150, 150)
miscTab.Font = Enum.Font.Code
miscTab.TextSize = 11

-- Контент
local contentFrame = Instance.new("Frame", main)
contentFrame.Size = UDim2.new(1, -10, 0, 200)
contentFrame.Position = UDim2.new(0, 5, 0, 55)
contentFrame.BackgroundTransparency = 1

-- ============================================================================
-- ВКЛАДКА SERVER DESTRUCTION (Таблица 3x2)
-- ============================================================================
local destructionFrame = Instance.new("Frame", contentFrame)
destructionFrame.Size = UDim2.new(1, 0, 1, 0)
destructionFrame.BackgroundTransparency = 1

-- Заголовки столбцов
local header1 = Instance.new("TextLabel", destructionFrame)
header1.Size = UDim2.new(0, 165, 0, 20)
header1.Position = UDim2.new(0, 0, 0, 0)
header1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
header1.BorderColor3 = Color3.fromRGB(0, 255, 0)
header1.BorderSizePixel = 1
header1.Text = "Server Destruction"
header1.TextColor3 = Color3.fromRGB(0, 255, 0)
header1.Font = Enum.Font.Code
header1.TextSize = 11

local header2 = Instance.new("TextLabel", destructionFrame)
header2.Size = UDim2.new(0, 165, 0, 20)
header2.Position = UDim2.new(0, 170, 0, 0)
header2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
header2.BorderColor3 = Color3.fromRGB(0, 255, 0)
header2.BorderSizePixel = 1
header2.Text = "Misc"
header2.TextColor3 = Color3.fromRGB(0, 255, 0)
header2.Font = Enum.Font.Code
header2.TextSize = 11

-- Кнопки (3 строки x 2 столбца)
local buttons = {
    -- Строка 1
    {{text = "Kill All", color = Color3.fromRGB(150, 0, 0), frame = destructionFrame, pos = {0, 0}},
     {text = "Infinite Yield", color = Color3.fromRGB(0, 80, 0), frame = destructionFrame, pos = {0, 170}}},
    -- Строка 2
    {{text = "Crash Server", color = Color3.fromRGB(150, 50, 0), frame = destructionFrame, pos = {25, 0}},
     {text = "Dex Explorer", color = Color3.fromRGB(0, 0, 100), frame = destructionFrame, pos = {25, 170}}},
    -- Строка 3
    {{text = "Lag Server", color = Color3.fromRGB(150, 100, 0), frame = destructionFrame, pos = {50, 0}},
     {text = "Fly", color = Color3.fromRGB(0, 100, 100), frame = destructionFrame, pos = {50, 170}}},
    -- Строка 4
    {{text = "Delete Map", color = Color3.fromRGB(100, 0, 100), frame = destructionFrame, pos = {75, 0}},
     {text = "ESP", color = Color3.fromRGB(80, 0, 80), frame = destructionFrame, pos = {75, 170}}},
    -- Строка 5
    {{text = "Spam Sounds", color = Color3.fromRGB(0, 100, 100), frame = destructionFrame, pos = {100, 0}},
     {text = "Aimbot", color = Color3.fromRGB(100, 50, 0), frame = destructionFrame, pos = {100, 170}}},
    -- Строка 6
    {{text = "Kick All", color = Color3.fromRGB(100, 0, 0), frame = destructionFrame, pos = {125, 0}},
     {text = "Teleport", color = Color3.fromRGB(50, 50, 50), frame = destructionFrame, pos = {125, 170}}}
}

for rowIndex, row in ipairs(buttons) do
    for _, btnData in ipairs(row) do
        local b = Instance.new("TextButton", btnData.frame)
        b.Size = UDim2.new(0, 165, 0, 22)
        b.Position = UDim2.new(0, btnData.pos[2], 0, btnData.pos[1])
        b.BackgroundColor3 = btnData.color
        b.BorderColor3 = Color3.fromRGB(0, 255, 0)
        b.BorderSizePixel = 1
        b.Text = btnData.text
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.Code
        b.TextSize = 11
        
        b.MouseButton1Click:Connect(function()
            print("NYX GUI: " .. btnData.text .. " clicked!")
            -- Здесь можно добавить функционал
        end)
    end
end

-- ============================================================================
-- ВКЛАДКА MISC (Таблица 3x2)
-- ============================================================================
local miscFrame = Instance.new("Frame", contentFrame)
miscFrame.Size = UDim2.new(1, 0, 1, 0)
miscFrame.BackgroundTransparency = 1
miscFrame.Visible = false

local mHeader1 = Instance.new("TextLabel", miscFrame)
mHeader1.Size = UDim2.new(0, 165, 0, 20)
mHeader1.Position = UDim2.new(0, 0, 0, 0)
mHeader1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mHeader1.BorderColor3 = Color3.fromRGB(0, 255, 0)
mHeader1.BorderSizePixel = 1
mHeader1.Text = "Misc Tools"
mHeader1.TextColor3 = Color3.fromRGB(0, 255, 0)
mHeader1.Font = Enum.Font.Code
mHeader1.TextSize = 11

local mHeader2 = Instance.new("TextLabel", miscFrame)
mHeader2.Size = UDim2.new(0, 165, 0, 20)
mHeader2.Position = UDim2.new(0, 170, 0, 0)
mHeader2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mHeader2.BorderColor3 = Color3.fromRGB(0, 255, 0)
mHeader2.BorderSizePixel = 1
mHeader2.Text = "Other"
mHeader2.TextColor3 = Color3.fromRGB(0, 255, 0)
mHeader2.Font = Enum.Font.Code
mHeader2.TextSize = 11

local miscButtons = {
    {{text = "Decal Spam", color = Color3.fromRGB(100, 0, 100), pos = {0, 0}},
     {text = "Skybox", color = Color3.fromRGB(0, 0, 150), pos = {0, 170}}},
    {{text = "Screamer", color = Color3.fromRGB(150, 0, 0), pos = {25, 0}},
     {text = "FPS Booster", color = Color3.fromRGB(0, 100, 0), pos = {25, 170}}},
    {{text = "Chat Bypass", color = Color3.fromRGB(100, 100, 0), pos = {50, 0}},
     {text = "Anti-AFK", color = Color3.fromRGB(0, 100, 100), pos = {50, 170}}},
    {{text = "Rejoin", color = Color3.fromRGB(50, 50, 100), pos = {75, 0}},
     {text = "Server Hop", color = Color3.fromRGB(100, 50, 0), pos = {75, 170}}},
    {{text = "Copy Game ID", color = Color3.fromRGB(80, 80, 80), pos = {100, 0}},
     {text = "Open Console", color = Color3.fromRGB(0, 0, 0), pos = {100, 170}}}
}

for rowIndex, row in ipairs(miscButtons) do
    for _, btnData in ipairs(row) do
        local b = Instance.new("TextButton", miscFrame)
        b.Size = UDim2.new(0, 165, 0, 22)
        b.Position = UDim2.new(0, btnData.pos[2], 0, btnData.pos[1])
        b.BackgroundColor3 = btnData.color
        b.BorderColor3 = Color3.fromRGB(0, 255, 0)
        b.BorderSizePixel = 1
        b.Text = btnData.text
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.Code
        b.TextSize = 11
        
        b.MouseButton1Click:Connect(function()
            print("NYX GUI: " .. btnData.text .. " clicked!")
        end)
    end
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
toggleBtn.Size = UDim2.new(1, -10, 0, 25)
toggleBtn.Position = UDim2.new(0, 5, 0, 265)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
toggleBtn.BorderSizePixel = 1
toggleBtn.Text = "Open/Close"
toggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
toggleBtn.Font = Enum.Font.Code
toggleBtn.TextSize = 11

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
