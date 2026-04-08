--█████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
--██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
--██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 

print("BatXploit AGGRESSIVE Backdoor Scanner v3.0 - MAXIMUM POWER")

-- Создаём GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AggressiveScanner"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 700)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -350)
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
title.Text = "🔥 BATXPLOIT AGGRESSIVE BACKDOOR SCANNER 🔥"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 30)
statusLabel.Position = UDim2.new(0, 10, 0, 60)
statusLabel.Text = "Status: READY FOR AGGRESSIVE SCAN"
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Font = Enum.Font.SourceSansBold
statusLabel.Parent = mainFrame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 200, 0, 40)
scanBtn.Position = UDim2.new(0, 10, 0, 100)
scanBtn.Text = "🔥 START AGGRESSIVE SCAN 🔥"
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BorderSizePixel = 2
scanBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
scanBtn.Font = Enum.Font.SourceSansBold
scanBtn.Parent = mainFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 150, 0, 40)
clearBtn.Position = UDim2.new(0, 220, 0, 100)
clearBtn.Text = "CLEAR RESULTS"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 2
clearBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
clearBtn.Parent = mainFrame

local resultFrame = Instance.new("ScrollingFrame")
resultFrame.Size = UDim2.new(1, -20, 0, 500)
resultFrame.Position = UDim2.new(0, 10, 0, 150)
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
local totalTests = 0

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

-- Агрессивные тесты
local function aggressiveRemoteTest(remote, remotePath)
    local testPayloads = {
        "print('BATXPLOIT_BACKDOOR_TEST')",
        "loadstring('print(\\'BATXPLOIT\\')')()",
        "game:GetService('Players').LocalPlayer:Kick('BATXPLOIT_TEST')",
        "warn('BATXPLOIT_AGGRESSIVE_SCAN')",
        "game:GetService('ReplicatedStorage'):FindFirstChild('BATXPLOIT')",
        "script:Destroy()",
        "game:GetService('TeleportService'):Teleport(0)",
        "for i=1,100 do print('BATXPLOIT') end",
        "pcall(function() loadstring('game.Players.LocalPlayer:Kick(\\'BATXPLOIT\\')')() end)",
        "shared.BATXPLOIT = true",
        "_G.BATXPLOIT_SCAN = true",
        "getfenv().BATXPLOIT = true"
    }
    
    local successCount = 0
    
    for _, payload in ipairs(testPayloads) do
        local success = pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer(payload)
            else
                remote:InvokeServer(payload)
            end
        end)
        
        if success then
            successCount = successCount + 1
        end
        task.wait()
    end
    
    if successCount >= 3 then
        addResult("💀💀💀 CRITICAL BACKDOOR: " .. remotePath .. " (responded to " .. successCount .. "/" .. #testPayloads .. " tests) 💀💀💀", Color3.fromRGB(255, 0, 0), true)
        table.insert(foundBackdoors, {remote = remote, path = remotePath})
        return true
    elseif successCount > 0 then
        addResult("⚠️ POTENTIAL BACKDOOR: " .. remotePath .. " (responded to " .. successCount .. " tests)", Color3.fromRGB(255, 100, 0), false)
        table.insert(foundBackdoors, {remote = remote, path = remotePath})
        return true
    end
    return false
end

local function aggressiveScriptAnalysis(script, scriptPath)
    local dangerousPatterns = {
        "loadstring", "getfenv", "setfenv", "getrenv", "shared", "_G",
        "pcall", "spawn", "delay", "task.spawn", "coroutine.wrap",
        "require", "getgenv", "getsenv", "getfenv", "setfenv",
        "getnil", "getrawmetatable", "setrawmetatable", "getgc",
        "getconnections", "fireclickdetector", "queue_on_teleport"
    }
    
    local source = ""
    local success = pcall(function()
        if getscriptbytecode then
            source = getscriptbytecode(script)
        elseif getscriptclosure then
            source = tostring(getscriptclosure(script))
        end
    end)
    
    if not success then return false end
    
    local found = false
    source = tostring(source):lower()
    
    for _, pattern in ipairs(dangerousPatterns) do
        if source:find(pattern:lower()) then
            addResult("🔴 DANGEROUS PATTERN FOUND: '" .. pattern .. "' in " .. scriptPath, Color3.fromRGB(255, 50, 50), false)
            found = true
        end
    end
    
    return found
end

local function scanAllRemotes()
    foundBackdoors = {}
    totalTests = 0
    addResult("🔥🔥🔥 STARTING AGGRESSIVE BACKDOOR SCAN 🔥🔥🔥", Color3.fromRGB(255, 0, 0), true)
    
    local allRemotes = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(allRemotes, obj)
        end
    end
    
    addResult("📡 Found " .. #allRemotes .. " remotes to scan", Color3.fromRGB(255, 255, 0), false)
    
    for i, remote in ipairs(allRemotes) do
        totalTests = totalTests + 1
        statusLabel.Text = "🔥 SCANNING REMOTE " .. i .. "/" .. #allRemotes .. " 🔥"
        local remotePath = remote:GetFullName()
        
        -- Анализируем связанные скрипты
        local parent = remote.Parent
        if parent then
            for _, script in ipairs(parent:GetDescendants()) do
                if script:IsA("Script") or script:IsA("LocalScript") then
                    aggressiveScriptAnalysis(script, script:GetFullName())
                end
            end
        end
        
        -- Агрессивный тест
        aggressiveRemoteTest(remote, remotePath)
        
        task.wait()
    end
    
    statusLabel.Text = "🔥 SCAN COMPLETE! Found " .. #foundBackdoors .. " BACKDOORS 🔥"
    addResult("🔥🔥🔥 SCAN COMPLETED! Found " .. #foundBackdoors .. " BACKDOORS 🔥🔥🔥", Color3.fromRGB(0, 255, 0), true)
    
    -- Создаём панель управления бэкдорами
    if #foundBackdoors > 0 then
        local controlFrame = Instance.new("Frame")
        controlFrame.Size = UDim2.new(1, -20, 0, 100)
        controlFrame.Position = UDim2.new(0, 10, 1, -110)
        controlFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
        controlFrame.BorderSizePixel = 2
        controlFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
        controlFrame.Parent = mainFrame
        
        local execTitle = Instance.new("TextLabel")
        execTitle.Size = UDim2.new(1, 0, 0, 20)
        execTitle.Text = "BACKDOOR EXECUTION PANEL"
        execTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        execTitle.BackgroundTransparency = 1
        execTitle.Parent = controlFrame
        
        local execBox = Instance.new("TextBox")
        execBox.Size = UDim2.new(0, 400, 0, 50)
        execBox.Position = UDim2.new(0, 10, 0, 25)
        execBox.Text = "print('BATXPLOIT BACKDOOR EXPLOIT')"
        execBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
        execBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        execBox.TextWrapped = true
        execBox.Parent = controlFrame
        
        local execBtn = Instance.new("TextButton")
        execBtn.Size = UDim2.new(0, 150, 0, 50)
        execBtn.Position = UDim2.new(0, 420, 0, 25)
        execBtn.Text = "EXECUTE ON ALL"
        execBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        execBtn.BorderSizePixel = 2
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
                addResult("💀 EXECUTED ON: " .. bd.path, Color3.fromRGB(255, 50, 50), false)
                task.wait()
            end
            addResult("🔥 EXECUTION COMPLETE ON ALL BACKDOORS 🔥", Color3.fromRGB(0, 255, 0), true)
        end)
    end
end

scanBtn.MouseButton1Click:Connect(scanAllRemotes)
clearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    addResult("🔥 RESULTS CLEARED - READY FOR NEW SCAN 🔥", Color3.fromRGB(255, 255, 0), true)
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BatXploit",
    Text = "🔥 AGGRESSIVE SCANNER LOADED - USE WITH CAUTION 🔥",
    Duration = 5
})
