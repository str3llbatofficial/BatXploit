--█████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
--██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
--██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit SAFE Backdoor Scanner v1.0 - ZERO AGGRESSION")

-- Создаём GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SafeScanner"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 600)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
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
title.Text = "🛡️ BATXPLOIT SAFE BACKDOOR SCANNER 🛡️"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 50)
statusLabel.Text = "Status: Ready"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 150, 0, 35)
scanBtn.Position = UDim2.new(0, 10, 0, 85)
scanBtn.Text = "Start Safe Scan"
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BorderSizePixel = 1
scanBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
scanBtn.Parent = mainFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 120, 0, 35)
clearBtn.Position = UDim2.new(0, 170, 0, 85)
clearBtn.Text = "Clear"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 1
clearBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
clearBtn.Parent = mainFrame

local resultFrame = Instance.new("ScrollingFrame")
resultFrame.Size = UDim2.new(1, -20, 0, 420)
resultFrame.Position = UDim2.new(0, 10, 0, 130)
resultFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
resultFrame.BorderSizePixel = 1
resultFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
resultFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
resultFrame.ScrollBarThickness = 8
resultFrame.Parent = mainFrame

local resultLayout = Instance.new("UIListLayout")
resultLayout.Padding = UDim.new(0, 5)
resultLayout.Parent = resultFrame

local foundBackdoors = {}

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

-- Мягкий тест (просто проверяем, можно ли отправить хоть что-то)
local function gentleRemoteTest(remote, remotePath)
    task.wait(0.2)
    local safePayloads = {
        "ping",
        "test",
        "BatXploit",
        "hello",
        "check",
    }
    
    local successCount = 0
    for _, payload in ipairs(safePayloads) do
        local success = pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer(payload)
            else
                remote:InvokeServer(payload)
            end
        end)
        if success then successCount = successCount + 1 end
        task.wait()
    end
    
    if successCount >= 3 then
        addResult("🔓 LIKELY BACKDOOR: " .. remotePath .. " (accepted " .. successCount .. "/" .. #safePayloads .. " test packets)", Color3.fromRGB(255, 100, 0), false)
        table.insert(foundBackdoors, {remote = remote, path = remotePath})
        return true
    elseif successCount > 0 then
        addResult("🔍 POSSIBLE BACKDOOR: " .. remotePath .. " (accepted " .. successCount .. " test packets)", Color3.fromRGB(255, 200, 0), false)
        return false
    end
    return false
end

local function scanAllRemotes()
    foundBackdoors = {}
    addResult("🛡️ STARTING SAFE BACKDOOR SCAN (gentle mode)", Color3.fromRGB(0, 255, 0), true)
    
    local allRemotes = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(allRemotes, obj)
        end
    end
    
    addResult("📡 Found " .. #allRemotes .. " remotes to check", Color3.fromRGB(255, 255, 0), false)
    
    for i, remote in ipairs(allRemotes) do
        statusLabel.Text = "Scanning " .. i .. "/" .. #allRemotes
        gentleRemoteTest(remote, remote:GetFullName())
        task.wait()
    end
    
    statusLabel.Text = "Scan complete. Found " .. #foundBackdoors .. " potential backdoors"
    addResult("✅ SCAN COMPLETED SAFELY! Found " .. #foundBackdoors .. " potential backdoors", Color3.fromRGB(0, 255, 0), true)
    
    if #foundBackdoors > 0 then
        addResult("🔧 Use the execution panel below to test them", Color3.fromRGB(255, 255, 0), false)
        createControlPanel()
    end
end

local function createControlPanel()
    if #foundBackdoors == 0 then return end
    
    local oldPanel = mainFrame:FindFirstChild("ControlPanel")
    if oldPanel then oldPanel:Destroy() end
    
    local controlFrame = Instance.new("Frame")
    controlFrame.Name = "ControlPanel"
    controlFrame.Size = UDim2.new(1, -20, 0, 90)
    controlFrame.Position = UDim2.new(0, 10, 1, -100)
    controlFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    controlFrame.BorderSizePixel = 1
    controlFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    controlFrame.Parent = mainFrame
    
    local execTitle = Instance.new("TextLabel")
    execTitle.Size = UDim2.new(1, 0, 0, 20)
    execTitle.Text = "BACKDOOR TEST PANEL (safe mode)"
    execTitle.TextColor3 = Color3.fromRGB(255, 100, 0)
    execTitle.BackgroundTransparency = 1
    execTitle.Parent = controlFrame
    
    local execBox = Instance.new("TextBox")
    execBox.Size = UDim2.new(0, 300, 0, 40)
    execBox.Position = UDim2.new(0, 10, 0, 25)
    execBox.Text = "print('BatXploit safe test')"
    execBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    execBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBox.Parent = controlFrame
    
    local execBtn = Instance.new("TextButton")
    execBtn.Size = UDim2.new(0, 120, 0, 40)
    execBtn.Position = UDim2.new(0, 320, 0, 25)
    execBtn.Text = "Test on all"
    execBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBtn.BorderSizePixel = 1
    execBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    execBtn.Parent = controlFrame
    
    execBtn.MouseButton1Click:Connect(function()
        for _, bd in ipairs(foundBackdoors) do
            pcall(function()
                if bd.remote:IsA("RemoteEvent") then
                    bd.remote:FireServer(execBox.Text)
                else
                    bd.remote:InvokeServer(execBox.Text)
                end
            end)
            addResult("📤 Tested: " .. bd.path, Color3.fromRGB(200, 200, 200), false)
            task.wait()
        end
        addResult("✅ Testing complete", Color3.fromRGB(0, 255, 0), false)
    end)
end

scanBtn.MouseButton1Click:Connect(scanAllRemotes)
clearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    foundBackdoors = {}
    addResult("🛡️ Results cleared", Color3.fromRGB(255, 255, 0), false)
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BatXploit",
    Text = "🛡️ SAFE SCANNER LOADED - No aggressive tests",
    Duration = 4
})
