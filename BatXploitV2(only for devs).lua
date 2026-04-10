--[[
    NYX GUI - ТОЧНО КАК НА СКРИНШОТЕ
    Стиль: только рамки, без лишних цветов
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NyxGUI"
gui.ResetOnSpawn = false

-- Основное окно
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 300)
main.Position = UDim2.new(0.5, -175, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0

-- Заголовок (просто полоса)
local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.Code
title.TextSize = 12
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", titleBar)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -25, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
close.BorderSizePixel = 0
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.Code
close.TextSize = 12
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Вкладки (как на скрине)
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 25)
tabFrame.Position = UDim2.new(0, 0, 0, 25)
tabFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
tabFrame.BorderSizePixel = 0

local destructionTab = Instance.new("TextButton", tabFrame)
destructionTab.Size = UDim2.new(0, 170, 1, 0)
destructionTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
-- ТАБЛИЦА (ТОЧНО КАК НА СКРИНЕ)
-- ============================================================================

-- Заголовки столбцов (только рамка и текст)
local header1 = Instance.new("TextLabel", contentFrame)
header1.Size = UDim2.new(0, 165, 0, 25)
header1.Position = UDim2.new(0, 0, 0, 0)
header1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
header1.BorderColor3 = Color3.fromRGB(100, 100, 100)
header1.BorderSizePixel = 1
header1.Text = "Server Destruction"
header1.TextColor3 = Color3.fromRGB(255, 255, 255)
header1.Font = Enum.Font.Code
header1.TextSize = 11

local header2 = Instance.new("TextLabel", contentFrame)
header2.Size = UDim2.new(0, 165, 0, 25)
header2.Position = UDim2.new(0, 170, 0, 0)
header2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
header2.BorderColor3 = Color3.fromRGB(100, 100, 100)
header2.BorderSizePixel = 1
header2.Text = "Misc"
header2.TextColor3 = Color3.fromRGB(255, 255, 255)
header2.Font = Enum.Font.Code
header2.TextSize = 11

-- Пустые квадраты (рамки) с функциями
local buttons = {
    -- Строка 1
    {{text = "Kill All", pos = {30, 0}},
     {text = "Infinite Yield", pos = {30, 170}}},
    -- Строка 2
    {{text = "Crash Server", pos = {60, 0}},
     {text = "Dex Explorer", pos = {60, 170}}},
    -- Строка 3
    {{text = "Lag Server", pos = {90, 0}},
     {text = "Fly", pos = {90, 170}}},
    -- Строка 4
    {{text = "Delete Map", pos = {120, 0}},
     {text = "ESP", pos = {120, 170}}},
    -- Строка 5
    {{text = "Spam Sounds", pos = {150, 0}},
     {text = "Aimbot", pos = {150, 170}}},
    -- Строка 6
    {{text = "Kick All", pos = {180, 0}},
     {text = "Teleport", pos = {180, 170}}}
}

for _, row in ipairs(buttons) do
    for _, btnData in ipairs(row) do
        local b = Instance.new("TextButton", contentFrame)
        b.Size = UDim2.new(0, 165, 0, 25)
        b.Position = UDim2.new(0, btnData.pos[2], 0, btnData.pos[1])
        b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        b.BorderColor3 = Color3.fromRGB(100, 100, 100)
        b.BorderSizePixel = 1
        b.Text = ""
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.Code
        b.TextSize = 11
        
        -- Невидимая надпись по центру (если нужно)
        local label = Instance.new("TextLabel", b)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = btnData.text
        label.TextColor3 = Color3.fromRGB(150, 150, 150)
        label.Font = Enum.Font.Code
        label.TextSize = 10
        
        b.MouseButton1Click:Connect(function()
            print("NYX GUI: " .. btnData.text .. " clicked!")
        end)
    end
end

-- ============================================================================
-- КНОПКА OPEN/CLOSE (ТОЧНО КАК НА СКРИНЕ)
-- ============================================================================
local toggleBtn = Instance.new("TextButton", main)
toggleBtn.Size = UDim2.new(1, -10, 0, 25)
toggleBtn.Position = UDim2.new(0, 5, 0, 265)
toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggleBtn.BorderColor3 = Color3.fromRGB(100, 100, 100)
toggleBtn.BorderSizePixel = 1
toggleBtn.Text = "Open/Close"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
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
