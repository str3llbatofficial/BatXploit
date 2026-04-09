-- ============================================================================
-- NYX BACKDOOR SCANNER - ULTIMATE EDITION
-- Объединяет: LALOL Hub + NYX + анализ исходников + require(ID) + обфускация
-- ============================================================================

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NyxScannerUltimate"
gui.ResetOnSpawn = false

-- ============================================================================
-- GUI (стиль LALOL Hub)
-- ============================================================================

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 520, 0, 420)
main.Position = UDim2.new(0.5, -260, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(0, 255, 0)
stroke.Thickness = 2

local gradient = Instance.new("UIGradient", stroke)
gradient.Rotation = 50
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
}

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 8)

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -70, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX ULTIMATE BACKDOOR SCANNER"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.Code
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", titleBar)
close.Size = UDim2.new(0, 35, 0, 35)
close.Position = UDim2.new(1, -35, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BorderSizePixel = 0
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.Code
close.TextSize = 16
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Вкладки
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 35)
tabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
tabFrame.BorderSizePixel = 0

local scanTab = Instance.new("TextButton", tabFrame)
scanTab.Size = UDim2.new(0, 130, 1, 0)
scanTab.Position = UDim2.new(0, 0, 0, 0)
scanTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
scanTab.Text = "SCANNER"
scanTab.TextColor3 = Color3.fromRGB(255, 255, 255)
scanTab.Font = Enum.Font.Code
scanTab.TextSize = 12

local execTab = Instance.new("TextButton", tabFrame)
execTab.Size = UDim2.new(0, 130, 1, 0)
execTab.Position = UDim2.new(0, 130, 0, 0)
execTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
execTab.Text = "EXECUTOR"
execTab.TextColor3 = Color3.fromRGB(150, 150, 150)
execTab.Font = Enum.Font.Code
execTab.TextSize = 12

local settingsTab = Instance.new("TextButton", tabFrame)
settingsTab.Size = UDim2.new(0, 130, 1, 0)
settingsTab.Position = UDim2.new(0, 260, 0, 0)
settingsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
settingsTab.Text = "SETTINGS"
settingsTab.TextColor3 = Color3.fromRGB(150, 150, 150)
settingsTab.Font = Enum.Font.Code
settingsTab.TextSize = 12

local logsTab = Instance.new("TextButton", tabFrame)
logsTab.Size = UDim2.new(0, 130, 1, 0)
logsTab.Position = UDim2.new(0, 390, 0, 0)
logsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logsTab.Text = "LOGS"
logsTab.TextColor3 = Color3.fromRGB(150, 150, 150)
logsTab.Font = Enum.Font.Code
settingsTab.TextSize = 12

-- Контент вкладок
local contentFrame = Instance.new("Frame", main)
contentFrame.Size = UDim2.new(1, -20, 0, 280)
contentFrame.Position = UDim2.new(0, 10, 0, 75)
contentFrame.BackgroundTransparency = 1

-- ============================================================================
-- ВКЛАДКА SCANNER
-- ============================================================================

local scannerFrame = Instance.new("Frame", contentFrame)
scannerFrame.Size = UDim2.new(1, 0, 1, 0)
scannerFrame.BackgroundTransparency = 1
scannerFrame.Visible = true

local scanTitle = Instance.new("TextLabel", scannerFrame)
scanTitle.Size = UDim2.new(1, 0, 0, 25)
scanTitle.BackgroundTransparency = 1
scanTitle.Text = "BACKDOOR SCANNER"
scanTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
scanTitle.Font = Enum.Font.Code
scanTitle.TextSize = 14
scanTitle.TextXAlignment = Enum.TextXAlignment.Left

local scanOptions = Instance.new("Frame", scannerFrame)
scanOptions.Size = UDim2.new(1, 0, 0, 35)
scanOptions.Position = UDim2.new(0, 0, 0, 30)
scanOptions.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local quickScan = Instance.new("TextButton", scanOptions)
quickScan.Size = UDim2.new(0, 110, 1, 0)
quickScan.Position = UDim2.new(0, 5, 0, 0)
quickScan.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
quickScan.Text = "QUICK SCAN"
quickScan.TextColor3 = Color3.fromRGB(255, 255, 255)
quickScan.Font = Enum.Font.Code
quickScan.TextSize = 11

local deepScan = Instance.new("TextButton", scanOptions)
deepScan.Size = UDim2.new(0, 110, 1, 0)
deepScan.Position = UDim2.new(0, 120, 0, 0)
deepScan.BackgroundColor3 = Color3.fromRGB(0, 0, 80)
deepScan.Text = "DEEP SCAN"
deepScan.TextColor3 = Color3.fromRGB(255, 255, 255)
deepScan.Font = Enum.Font.Code
deepScan.TextSize = 11

local sourceScan = Instance.new("TextButton", scanOptions)
sourceScan.Size = UDim2.new(0, 130, 1, 0)
sourceScan.Position = UDim2.new(0, 235, 0, 0)
sourceScan.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
sourceScan.Text = "SOURCE SCAN"
sourceScan.TextColor3 = Color3.fromRGB(255, 255, 255)
sourceScan.Font = Enum.Font.Code
sourceScan.TextSize = 11

local fullScan = Instance.new("TextButton", scanOptions)
fullScan.Size = UDim2.new(0, 110, 1, 0)
fullScan.Position = UDim2.new(0, 370, 0, 0)
fullScan.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
fullScan.Text = "FULL SCAN"
fullScan.TextColor3 = Color3.fromRGB(255, 255, 255)
fullScan.Font = Enum.Font.Code
fullScan.TextSize = 11

local scanResults = Instance.new("ScrollingFrame", scannerFrame)
scanResults.Size = UDim2.new(1, 0, 0, 200)
scanResults.Position = UDim2.new(0, 0, 0, 75)
scanResults.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
scanResults.BorderSizePixel = 0
scanResults.CanvasSize = UDim2.new(0, 0, 0, 0)
scanResults.ScrollBarThickness = 6

local resultsList = Instance.new("UIListLayout", scanResults)
resultsList.Padding = UDim.new(0, 3)

local scanStatus = Instance.new("TextLabel", scannerFrame)
scanStatus.Size = UDim2.new(1, 0, 0, 20)
scanStatus.Position = UDim2.new(0, 0, 1, -20)
scanStatus.BackgroundTransparency = 1
scanStatus.Text = "Ready. Select scan type."
scanStatus.TextColor3 = Color3.fromRGB(100, 100, 100)
scanStatus.Font = Enum.Font.Code
scanStatus.TextSize = 11
scanStatus.TextXAlignment = Enum.TextXAlignment.Left

-- ============================================================================
-- ВКЛАДКА EXECUTOR
-- ============================================================================

local executorFrame = Instance.new("Frame", contentFrame)
executorFrame.Size = UDim2.new(1, 0, 1, 0)
executorFrame.BackgroundTransparency = 1
executorFrame.Visible = false

local execTitle = Instance.new("TextLabel", executorFrame)
execTitle.Size = UDim2.new(1, 0, 0, 25)
execTitle.BackgroundTransparency = 1
execTitle.Text = "SCRIPT EXECUTOR"
execTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
execTitle.Font = Enum.Font.Code
execTitle.TextSize = 14
execTitle.TextXAlignment = Enum.TextXAlignment.Left

local scriptBox = Instance.new("TextBox", executorFrame)
scriptBox.Size = UDim2.new(1, 0, 0, 180)
scriptBox.Position = UDim2.new(0, 0, 0, 30)
scriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scriptBox.TextColor3 = Color3.fromRGB(0, 255, 0)
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 13
scriptBox.MultiLine = true
scriptBox.Text = "-- Paste your script here"
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.ClearTextOnFocus = true

local execButtons = Instance.new("Frame", executorFrame)
execButtons.Size = UDim2.new(1, 0, 0, 35)
execButtons.Position = UDim2.new(0, 0, 0, 220)
execButtons.BackgroundTransparency = 1

local execBtn = Instance.new("TextButton", execButtons)
execBtn.Size = UDim2.new(0, 120, 1, 0)
execBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
execBtn.Text = "EXECUTE"
execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
execBtn.Font = Enum.Font.Code
execBtn.TextSize = 12

local copyBtn = Instance.new("TextButton", execButtons)
copyBtn.Size = UDim2.new(0, 120, 1, 0)
copyBtn.Position = UDim2.new(0, 130, 0, 0)
copyBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 0)
copyBtn.Text = "COPY"
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.Font = Enum.Font.Code
copyBtn.TextSize = 12

local clearBtn = Instance.new("TextButton", execButtons)
clearBtn.Size = UDim2.new(0, 120, 1, 0)
clearBtn.Position = UDim2.new(0, 260, 0, 0)
clearBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.Code
clearBtn.TextSize = 12

local execStatus = Instance.new("TextLabel", executorFrame)
execStatus.Size = UDim2.new(1, 0, 0, 20)
execStatus.Position = UDim2.new(0, 0, 1, -20)
execStatus.BackgroundTransparency = 1
execStatus.Text = ""
execStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
execStatus.Font = Enum.Font.Code
execStatus.TextSize = 11

-- ============================================================================
-- ВКЛАДКА SETTINGS
-- ============================================================================

local settingsFrame = Instance.new("Frame", contentFrame)
settingsFrame.Size = UDim2.new(1, 0, 1, 0)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

local settingsTitle = Instance.new("TextLabel", settingsFrame)
settingsTitle.Size = UDim2.new(1, 0, 0, 25)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "SCANNER SETTINGS"
settingsTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
settingsTitle.Font = Enum.Font.Code
settingsTitle.TextSize = 14
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left

local settingsList = Instance.new("ScrollingFrame", settingsFrame)
settingsList.Size = UDim2.new(1, 0, 0, 230)
settingsList.Position = UDim2.new(0, 0, 0, 30)
settingsList.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
settingsList.BorderSizePixel = 0
settingsList.CanvasSize = UDim2.new(0, 0, 0, 300)
settingsList.ScrollBarThickness = 6

local settingsLayout = Instance.new("UIListLayout", settingsList)
settingsLayout.Padding = UDim.new(0, 5)

-- Настройки
local function createToggle(name, default, parent)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -10, 0, 30)
    frame.Position = UDim2.new(0, 5, 0, 0)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 200, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Code
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggle = Instance.new("TextButton", frame)
    toggle.Size = UDim2.new(0, 60, 0, 24)
    toggle.Position = UDim2.new(1, -70, 0, 3)
    toggle.BackgroundColor3 = default and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    toggle.Text = default and "ON" or "OFF"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.Code
    toggle.TextSize = 11
    
    local state = default
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        toggle.Text = state and "ON" or "OFF"
    end)
    
    return {frame = frame, getState = function() return state end}
end

local toggleRemotes = createToggle("Scan RemoteEvents", true, settingsList)
local toggleFunctions = createToggle("Scan RemoteFunctions", true, settingsList)
local toggleModules = createToggle("Scan ModuleScripts", true, settingsList)
local toggleLocalScripts = createToggle("Scan LocalScripts", true, settingsList)
local toggleSourceCode = createToggle("Analyze Source Code", true, settingsList)
local toggleRequireID = createToggle("Detect require(ID)", true, settingsList)
local toggleObfuscation = createToggle("Detect Obfuscation", true, settingsList)
local toggleWebhooks = createToggle("Detect Webhooks", true, settingsList)

-- ============================================================================
-- ВКЛАДКА LOGS
-- ============================================================================

local logsFrame = Instance.new("Frame", contentFrame)
logsFrame.Size = UDim2.new(1, 0, 1, 0)
logsFrame.BackgroundTransparency = 1
logsFrame.Visible = false

local logsTitle = Instance.new("TextLabel", logsFrame)
logsTitle.Size = UDim2.new(1, 0, 0, 25)
logsTitle.BackgroundTransparency = 1
logsTitle.Text = "SCAN LOGS"
logsTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
logsTitle.Font = Enum.Font.Code
logsTitle.TextSize = 14
logsTitle.TextXAlignment = Enum.TextXAlignment.Left

local logsBox = Instance.new("TextBox", logsFrame)
logsBox.Size = UDim2.new(1, 0, 0, 200)
logsBox.Position = UDim2.new(0, 0, 0, 30)
logsBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
logsBox.TextColor3 = Color3.fromRGB(0, 255, 0)
logsBox.Font = Enum.Font.Code
logsBox.TextSize = 11
logsBox.MultiLine = true
logsBox.Text = "=== NYX ULTIMATE SCANNER LOGS ===\n\n"
logsBox.TextXAlignment = Enum.TextXAlignment.Left
logsBox.TextYAlignment = Enum.TextYAlignment.Top
logsBox.ClearTextOnFocus = false

local clearLogsBtn = Instance.new("TextButton", logsFrame)
clearLogsBtn.Size = UDim2.new(0, 100, 0, 25)
clearLogsBtn.Position = UDim2.new(1, -100, 0, 240)
clearLogsBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
clearLogsBtn.Text = "CLEAR LOGS"
clearLogsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearLogsBtn.Font = Enum.Font.Code
clearLogsBtn.TextSize = 11

-- ============================================================================
-- ЛОГИКА ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК
-- ============================================================================

local tabs = {
    {btn = scanTab, frame = scannerFrame},
    {btn = execTab, frame = executorFrame},
    {btn = settingsTab, frame = settingsFrame},
    {btn = logsTab, frame = logsFrame}
}

for _, tab in ipairs(tabs) do
    tab.btn.MouseButton1Click:Connect(function()
        for _, t in ipairs(tabs) do
            t.frame.Visible = false
            t.btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            t.btn.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
        tab.frame.Visible = true
        tab.btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        tab.btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

-- ============================================================================
-- ФУНКЦИИ СКАНИРОВАНИЯ
-- ============================================================================

local backdoorKeywords = {
    -- Админские
    "admin", "administrator", "mod", "moderator", "owner", "staff", "dev",
    -- Бэкдоры
    "backdoor", "exploit", "bypass", "inject", "exec", "execute", "c00l",
    "c00lkidd", "nyx", "lalol", "fe", "skid", "sploit", "scriptware",
    -- Команды
    "cmd", "command", "console", "terminal", "run", "remote", "fire", "invoke",
    -- Управление
    "kill", "ban", "kick", "crash", "tp", "teleport", "bring", "goto", "god",
    -- Читы
    "esp", "aimbot", "wallhack", "fly", "speed", "noclip", "spin", "rage",
    -- Админки
    "hd", "hdadmin", "adonis", "kohls", "infinite", "yield"
}

local dangerousFuncs = {
    "require", "loadstring", "getfenv", "setfenv", "http_request",
    "syn.request", "HttpService", "hookfunction", "newcclosure",
    "queue_on_teleport", "syn.queue_on_teleport", "fluxus.queue_on_teleport"
}

local function addLog(text)
    logsBox.Text = logsBox.Text .. "[" .. os.date("%H:%M:%S") .. "] " .. text .. "\n"
end

local function clearResults()
    for _, v in ipairs(scanResults:GetChildren()) do
        if v:IsA("TextLabel") then v:Destroy() end
    end
    scanResults.CanvasSize = UDim2.new(0, 0, 0, 0)
end

local function addResult(text, color)
    local label = Instance.new("TextLabel", scanResults)
    label.Size = UDim2.new(1, -10, 0, 20)
    label.Position = UDim2.new(0, 5, 0, #scanResults:GetChildren() * 23)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(0, 255, 0)
    label.Font = Enum.Font.Code
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    scanResults.CanvasSize = UDim2.new(0, 0, 0, (#scanResults:GetChildren() + 1) * 23)
end

local function quickScanFunc()
    clearResults()
    scanStatus.Text = "Quick scanning..."
    addLog("Quick scan started")
    
    local found = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(found, v:GetFullName())
                    break
                end
            end
        end
    end
    
    if #found > 0 then
        for _, v in ipairs(found) do
            addResult("[BACKDOOR] " .. v, Color3.fromRGB(255, 100, 100))
        end
        scanStatus.Text = "Found " .. #found .. " potential backdoors!"
        addLog("Quick scan found " .. #found .. " backdoors")
    else
        addResult("No backdoors found.", Color3.fromRGB(100, 255, 100))
        scanStatus.Text = "No backdoors found."
        addLog("Quick scan: no backdoors found")
    end
end

local function deepScanFunc()
    clearResults()
    scanStatus.Text = "Deep scanning..."
    addLog("Deep scan started")
    
    local found = {}
    local suspicious = {}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local name = v.Name:lower()
            local parent = v.Parent and v.Parent.Name:lower() or ""
            local fullPath = v:GetFullName():lower()
            
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) or parent:find(kw) or fullPath:find(kw) then
                    table.insert(found, v:GetFullName())
                    break
                end
            end
        elseif v:IsA("ModuleScript") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(suspicious, "[Module] " .. v:GetFullName())
                    break
                end
            end
        end
    end
    
    if #found > 0 then
        for _, v in ipairs(found) do
            addResult("[BACKDOOR] " .. v, Color3.fromRGB(255, 100, 100))
        end
    end
    
    if #suspicious > 0 then
        for _, v in ipairs(suspicious) do
            addResult("[SUSPICIOUS] " .. v, Color3.fromRGB(255, 255, 100))
        end
    end
    
    if #found == 0 and #suspicious == 0 then
        addResult("No backdoors or suspicious scripts found.", Color3.fromRGB(100, 255, 100))
    end
    
    scanStatus.Text = "Found " .. #found .. " backdoors, " .. #suspicious .. " suspicious"
    addLog("Deep scan: " .. #found .. " backdoors, " .. #suspicious .. " suspicious")
end

local function sourceScanFunc()
    clearResults()
    scanStatus.Text = "Analyzing source code..."
    addLog("Source scan started")
    
    local found = {}
    local totalScripts = 0
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            totalScripts = totalScripts + 1
            local source = v.Source
            
            -- Поиск require(ID)
            for id in string.gmatch(source, "require%s*%(%s*(%d+)%s*%)") do
                table.insert(found, v:GetFullName() .. " -> require(" .. id .. ")")
            end
            
            -- Поиск опасных функций
            for _, func in ipairs(dangerousFuncs) do
                if string.find(source, func) then
                    table.insert(found, v:GetFullName() .. " -> " .. func)
                end
            end
            
            -- Поиск вебхуков Discord
            if string.find(source, "discord%.com/api/webhooks") or string.find(source, "discordapp%.com/api/webhooks") then
                table.insert(found, v:GetFullName() .. " -> DISCORD WEBHOOK")
            end
            
            -- Поиск обфускации
            if string.find(source, "string%.char") or string.find(source, "\\1[0-9][0-9]") or string.find(source, "loadstring") then
                if string.find(source, "%d+,%d+,%d+") then
                    table.insert(found, v:GetFullName() .. " -> OBFUSCATED")
                end
            end
        end
    end
    
    if #found > 0 then
        for _, v in ipairs(found) do
            addResult("[CODE] " .. v, Color3.fromRGB(255, 150, 0))
        end
        scanStatus.Text = "Found " .. #found .. " suspicious patterns in " .. totalScripts .. " scripts"
        addLog("Source scan: " .. #found .. " suspicious patterns")
    else
        addResult("No suspicious code found in " .. totalScripts .. " scripts.", Color3.fromRGB(100, 255, 100))
        scanStatus.Text = "No suspicious code found."
        addLog("Source scan: clean")
    end
end

local function fullScanFunc()
    clearResults()
    scanStatus.Text = "FULL SCAN IN PROGRESS..."
    addLog("=== FULL SCAN STARTED ===")
    
    addResult("=== FULL SCAN RESULTS ===", Color3.fromRGB(0, 255, 255))
    
    -- Quick scan
    local quickFound = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(quickFound, v:GetFullName())
                    break
                end
            end
        end
    end
    
    addResult("", Color3.fromRGB(255, 255, 255))
    addResult("--- REMOTE SCAN (" .. #quickFound .. " found) ---", Color3.fromRGB(150, 150, 255))
    for _, v in ipairs(quickFound) do
        addResult("  " .. v, Color3.fromRGB(255, 100, 100))
    end
    
    -- Deep scan (modules)
    local moduleFound = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("ModuleScript") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(moduleFound, v:GetFullName())
                    break
                end
            end
        end
    end
    
    addResult("", Color3.fromRGB(255, 255, 255))
    addResult("--- MODULE SCAN (" .. #moduleFound .. " found) ---", Color3.fromRGB(150, 150, 255))
    for _, v in ipairs(moduleFound) do
        addResult("  " .. v, Color3.fromRGB(255, 255, 100))
    end
    
    -- Source scan
    local sourceFound = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            local source = v.Source
            
            for id in string.gmatch(source, "require%s*%(%s*(%d+)%s*%)") do
                table.insert(sourceFound, v:GetFullName() .. " (ID: " .. id .. ")")
            end
            
            for _, func in ipairs(dangerousFuncs) do
                if string.find(source, func) then
                    table.insert(sourceFound, v:GetFullName() .. " (" .. func .. ")")
                end
            end
            
            if string.find(source, "discord%.com/api/webhooks") then
                table.insert(sourceFound, v:GetFullName() .. " (WEBHOOK)")
            end
        end
    end
    
    addResult("", Color3.fromRGB(255, 255, 255))
    addResult("--- SOURCE CODE SCAN (" .. #sourceFound .. " found) ---", Color3.fromRGB(150, 150, 255))
    for _, v in ipairs(sourceFound) do
        addResult("  " .. v, Color3.fromRGB(255, 150, 0))
    end
    
    local total = #quickFound + #moduleFound + #sourceFound
    scanStatus.Text = "FULL SCAN: " .. total .. " total findings"
    addLog("Full scan completed: " .. total .. " total findings")
    
    if total > 0 then
        addResult("", Color3.fromRGB(255, 255, 255))
        addResult("=== THIS IS ADMIN EVENT, ENJOY! ===", Color3.fromRGB(0, 255, 0))
    end
end

-- ============================================================================
-- ПРИВЯЗКА КНОПОК
-- ============================================================================

quickScan.MouseButton1Click:Connect(quickScanFunc)
deepScan.MouseButton1Click:Connect(deepScanFunc)
sourceScan.MouseButton1Click:Connect(sourceScanFunc)
fullScan.MouseButton1Click:Connect(fullScanFunc)

execBtn.MouseButton1Click:Connect(function()
    local code = scriptBox.Text
    if code ~= "" and code ~= "-- Paste your script here" then
        print("========== EXECUTING SCRIPT ==========")
        local success, err = pcall(loadstring(code))
        if success then
            execStatus.Text = "Executed successfully!"
            addLog("Script executed")
        else
            execStatus.Text = "Error: " .. tostring(err)
            addLog("Script error: " .. tostring(err))
        end
        print("======================================")
    else
        execStatus.Text = "No script to execute!"
    end
end)

copyBtn.MouseButton1Click:Connect(function()
    if scriptBox.Text ~= "" and scriptBox.Text ~= "-- Paste your script here" then
        print("========== COPY THIS SCRIPT ==========")
        print(scriptBox.Text)
        print("======================================")
        execStatus.Text = "Copied to console (F9)!"
        addLog("Script copied to console")
    else
        execStatus.Text = "No script to copy!"
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    scriptBox.Text = ""
    execStatus.Text = "Cleared."
end)

clearLogsBtn.MouseButton1Click:Connect(function()
    logsBox.Text = "=== NYX ULTIMATE SCANNER LOGS ===\n\n"
    addLog("Logs cleared")
end)

-- ============================================================================
-- DRAGIFY
-- ============================================================================

local dragToggle, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = i.Position
        startPos = main.Position
    end
end)
titleBar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if dragToggle and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

-- ============================================================================
-- ИНИЦИАЛИЗАЦИЯ
-- ============================================================================

addLog("NYX Ultimate Scanner loaded")
addLog("Game: " .. game.PlaceId .. " | Player: " .. player.Name)
scanStatus.Text = "Ready. Select scan type."

print("========================================")
print("NYX ULTIMATE BACKDOOR SCANNER LOADED!")
print("========================================")
print("Quick Scan - RemoteEvents/Functions")
print("Deep Scan - + Modules")
print("Source Scan - Analyze source code")
print("Full Scan - ALL methods combined")
print("========================================")
