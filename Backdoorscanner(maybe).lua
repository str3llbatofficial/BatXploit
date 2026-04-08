--█████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
--██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
--██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit ULTIMATE Backdoor Scanner v1.0 - LALOL Methods + Aggressive Mode")

-- ========== НАСТРОЙКИ ==========
local DISCORD_WEBHOOK = "" -- Вставь сюда свой webhook, если хочешь логи
local AUTO_EXECUTE_ON_FIND = false -- Автоматически выполнять тестовый код при нахождении

-- ========== СОЗДАНИЕ GUI ==========
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UltimateScanner"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 750)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -375)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 3
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
title.Text = "🔥 BATXPLOIT ULTIMATE BACKDOOR SCANNER 🔥"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 55)
statusLabel.Text = "Status: Ready"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 180, 0, 35)
scanBtn.Position = UDim2.new(0, 10, 0, 90)
scanBtn.Text = "🔥 START ULTIMATE SCAN 🔥"
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BorderSizePixel = 2
scanBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
scanBtn.Font = Enum.Font.SourceSansBold
scanBtn.Parent = mainFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 120, 0, 35)
clearBtn.Position = UDim2.new(0, 200, 0, 90)
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 2
clearBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
clearBtn.Parent = mainFrame

local resultFrame = Instance.new("ScrollingFrame")
resultFrame.Size = UDim2.new(1, -20, 0, 500)
resultFrame.Position = UDim2.new(0, 10, 0, 135)
resultFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
resultFrame.BorderSizePixel = 2
resultFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
resultFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
resultFrame.ScrollBarThickness = 10
resultFrame.Parent = mainFrame

local resultLayout = Instance.new("UIListLayout")
resultLayout.Padding = UDim.new(0, 5)
resultLayout.Parent = resultFrame

local foundBackdoors = {}
local alphabet = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

local function addResult(text, color, bold)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Size = UDim2.new(1, -10, 0, 20)
    label.BackgroundTransparency = 1
    if bold then
        label.Font = Enum.Font.SourceSansBold
    end
    label.Parent = resultFrame
    task.wait()
    resultFrame.CanvasSize = UDim2.new(0, 0, 0, resultLayout.AbsoluteContentSize.Y)
end

local function generateRandomName(length)
    local text = ''
    for i = 1, length do
        text = text .. alphabet[math.random(1, #alphabet)]
    end
    return text
end

local function runRemote(remote, data)
    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(data)
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(data)
        end
    end)
end

local function notify(text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "BatXploit",
        Text = text,
        Duration = 4
    })
end

-- ========== МЕТОД LALOL HUB (ТОЧНАЯ ПРОВЕРКА) ==========
local function lalolMethodTest(remote, remotePath)
    local testName = generateRandomName(math.random(12, 30))
    
    -- Отправляем тестовую команду на создание модели
    runRemote(remote, "a=Instance.new('Model',workspace)a.Name='" .. testName .. "'")
    
    -- Ждём появления модели
    for i = 1, 10 do
        task.wait(0.1)
        if workspace:FindFirstChild(testName) then
            -- Очищаем за собой
            workspace[testName]:Destroy()
            addResult("✅ LALOL METHOD: CRITICAL BACKDOOR confirmed: " .. remotePath, Color3.fromRGB(0, 255, 0), true)
            return true
        end
    end
    return false
end

-- ========== АГРЕССИВНЫЙ МЕТОД (БЫСТРАЯ ПРОВЕРКА) ==========
local aggressivePayloads = {
    "ping",
    "test",
    "BatXploit",
    "check",
    "hello"
}

local function aggressiveMethodTest(remote, remotePath)
    local successCount = 0
    for _, payload in ipairs(aggressivePayloads) do
        local success = pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer(payload)
            else
                remote:InvokeServer(payload)
            end
        end)
        if success then successCount = successCount + 1 end
        task.wait(0.05)
    end
    
    if successCount >= 3 then
        addResult("⚡ AGGRESSIVE METHOD: POTENTIAL backdoor: " .. remotePath .. " (" .. successCount .. "/" .. #aggressivePayloads .. " responses)", Color3.fromRGB(255, 100, 0), false)
        return true
    end
    return false
end

-- ========== ЗАЩИЩЁННЫЙ БЭКДОР (как в LALOL Hub) ==========
local function checkProtectedBackdoor()
    local protectedName = "lh" .. game.PlaceId / 6666 * 1337 * game.PlaceId
    local protectedRemote = game:GetService("ReplicatedStorage"):FindFirstChild(protectedName)
    
    if protectedRemote and protectedRemote:IsA("RemoteFunction") then
        addResult("🔒 PROTECTED BACKDOOR FOUND: " .. protectedRemote:GetFullName(), Color3.fromRGB(255, 200, 0), true)
        table.insert(foundBackdoors, {remote = protectedRemote, path = protectedRemote:GetFullName(), method = "protected"})
        return protectedRemote
    end
    return nil
end

-- ========== ОСНОВНОЙ СКАНЕР ==========
local function scanAllRemotes()
    foundBackdoors = {}
    addResult("🔥🔥🔥 STARTING ULTIMATE BACKDOOR SCAN 🔥🔥🔥", Color3.fromRGB(255, 0, 0), true)
    
    -- Сначала проверяем защищённый бэкдор
    checkProtectedBackdoor()
    
    local allRemotes = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            -- Пропускаем системные remote
            local fullName = obj:GetFullName()
            if not fullName:find("RobloxReplicatedStorage") and not fullName:find("DefaultChatSystemChatEvents") then
                table.insert(allRemotes, obj)
            end
        end
    end
    
    addResult("📡 Found " .. #allRemotes .. " remotes to scan", Color3.fromRGB(255, 255, 0), false)
    
    for i, remote in ipairs(allRemotes) do
        statusLabel.Text = "🔥 SCANNING " .. i .. "/" .. #allRemotes .. " 🔥"
        local remotePath = remote:GetFullName()
        
        -- Быстрая агрессивная проверка
        local isPotential = aggressiveMethodTest(remote, remotePath)
        
        if isPotential then
            -- Точная проверка методом LALOL Hub
            local isConfirmed = lalolMethodTest(remote, remotePath)
            
            if isConfirmed then
                table.insert(foundBackdoors, {remote = remote, path = remotePath, method = "confirmed"})
                addResult("💀💀💀 BACKDOOR CONFIRMED: " .. remotePath, Color3.fromRGB(255, 0, 0), true)
                
                if AUTO_EXECUTE_ON_FIND then
                    runRemote(remote, "print('BatXploit backdoor found!')")
                end
            end
        end
        
        task.wait(0.05)
    end
    
    statusLabel.Text = "🔥 SCAN COMPLETE! Found " .. #foundBackdoors .. " BACKDOORS 🔥"
    addResult("🔥🔥🔥 SCAN COMPLETED! Found " .. #foundBackdoors .. " BACKDOORS 🔥🔥🔥", Color3.fromRGB(0, 255, 0), true)
    
    -- Создаём панель управления
    if #foundBackdoors > 0 then
        createControlPanel()
    end
end

-- ========== ПАНЕЛЬ УПРАВЛЕНИЯ ==========
local function createControlPanel()
    local oldPanel = mainFrame:FindFirstChild("ControlPanel")
    if oldPanel then oldPanel:Destroy() end
    
    local controlFrame = Instance.new("Frame")
    controlFrame.Name = "ControlPanel"
    controlFrame.Size = UDim2.new(1, -20, 0, 120)
    controlFrame.Position = UDim2.new(0, 10, 1, -130)
    controlFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    controlFrame.BorderSizePixel = 2
    controlFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    controlFrame.Parent = mainFrame
    
    local execTitle = Instance.new("TextLabel")
    execTitle.Size = UDim2.new(1, 0, 0, 20)
    execTitle.Text = "💀 BACKDOOR EXECUTION PANEL 💀"
    execTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
    execTitle.BackgroundTransparency = 1
    execTitle.Font = Enum.Font.SourceSansBold
    execTitle.Parent = controlFrame
    
    local execBox = Instance.new("TextBox")
    execBox.Size = UDim2.new(0, 400, 0, 60)
    execBox.Position = UDim2.new(0, 10, 0, 25)
    execBox.Text = "print('BatXploit backdoor exploit')"
    execBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    execBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBox.TextWrapped = true
    execBox.Parent = controlFrame
    
    local execBtn = Instance.new("TextButton")
    execBtn.Size = UDim2.new(0, 150, 0, 60)
    execBtn.Position = UDim2.new(0, 420, 0, 25)
    execBtn.Text = "💀 EXECUTE 💀"
    execBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBtn.BorderSizePixel = 2
    execBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    execBtn.Font = Enum.Font.SourceSansBold
    execBtn.Parent = controlFrame
    
    execBtn.MouseButton1Click:Connect(function()
        for _, bd in ipairs(foundBackdoors) do
            runRemote(bd.remote, execBox.Text)
            addResult("💀 EXECUTED ON: " .. bd.path, Color3.fromRGB(255, 50, 50), false)
            task.wait()
        end
        addResult("🔥 EXECUTION COMPLETE ON ALL BACKDOORS 🔥", Color3.fromRGB(0, 255, 0), true)
        notify("Executed on " .. #foundBackdoors .. " backdoors")
    end)
    
    addResult("🔥 CONTROL PANEL CREATED! Found " .. #foundBackdoors .. " backdoors to exploit 🔥", Color3.fromRGB(0, 255, 0), true)
end

-- ========== ПЕРЕТАСКИВАНИЕ ОКНА ==========
local function dragify(frame)
    local dragToggle, dragInput, dragStart, startPos
    local UIS = game:GetService("UserInputService")
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

dragify(mainFrame)

-- ========== КНОПКИ ==========
scanBtn.MouseButton1Click:Connect(scanAllRemotes)
clearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    foundBackdoors = {}
    addResult("🔥 RESULTS CLEARED - READY FOR NEW SCAN 🔥", Color3.fromRGB(255, 255, 0), true)
end)

-- Горячая клавиша Alt для показа/скрытия
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.LeftAlt and not processed then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

notify("ULTIMATE SCANNER LOADED | LALOL Methods + Aggressive Mode")
addResult("🔥 BatXploit Ultimate Backdoor Scanner v1.0 🔥", Color3.fromRGB(255, 0, 0), true)
addResult("📌 Methods: LALOL Hub (model creation) + Aggressive (payloads)", Color3.fromRGB(255, 255, 0), false)
addResult("📌 Press Left Alt to show/hide", Color3.fromRGB(255, 255, 0), false)
