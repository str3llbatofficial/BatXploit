-- NYX BACKDOOR SCANNER - STABLE EDITION (FIXED GUI)

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NyxScanner"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0.5, -250, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX BACKDOOR SCANNER"
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
close.TextSize = 16
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Вкладки
local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 30)
tabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
tabFrame.BorderSizePixel = 0

local scanTab = Instance.new("TextButton", tabFrame)
scanTab.Size = UDim2.new(0, 125, 1, 0)
scanTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
scanTab.Text = "SCANNER"
scanTab.TextColor3 = Color3.fromRGB(255, 255, 255)
scanTab.Font = Enum.Font.Code
scanTab.TextSize = 12

local execTab = Instance.new("TextButton", tabFrame)
execTab.Size = UDim2.new(0, 125, 1, 0)
execTab.Position = UDim2.new(0, 125, 0, 0)
execTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
execTab.Text = "EXECUTOR"
execTab.TextColor3 = Color3.fromRGB(150, 150, 150)
execTab.Font = Enum.Font.Code
execTab.TextSize = 12

local logsTab = Instance.new("TextButton", tabFrame)
logsTab.Size = UDim2.new(0, 125, 1, 0)
logsTab.Position = UDim2.new(0, 250, 0, 0)
logsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logsTab.Text = "LOGS"
logsTab.TextColor3 = Color3.fromRGB(150, 150, 150)
logsTab.Font = Enum.Font.Code
logsTab.TextSize = 12

local settingsTab = Instance.new("TextButton", tabFrame)
settingsTab.Size = UDim2.new(0, 125, 1, 0)
settingsTab.Position = UDim2.new(0, 375, 0, 0)
settingsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
settingsTab.Text = "SETTINGS"
settingsTab.TextColor3 = Color3.fromRGB(150, 150, 150)
settingsTab.Font = Enum.Font.Code
settingsTab.TextSize = 12

-- Контент
local contentFrame = Instance.new("Frame", main)
contentFrame.Size = UDim2.new(1, -20, 0, 290)
contentFrame.Position = UDim2.new(0, 10, 0, 70)
contentFrame.BackgroundTransparency = 1

-- SCANNER FRAME
local scannerFrame = Instance.new("Frame", contentFrame)
scannerFrame.Size = UDim2.new(1, 0, 1, 0)
scannerFrame.BackgroundTransparency = 1

local scanBtn = Instance.new("TextButton", scannerFrame)
scanBtn.Size = UDim2.new(0, 150, 0, 35)
scanBtn.Position = UDim2.new(0.5, -75, 0, 10)
scanBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
scanBtn.Text = "QUICK SCAN"
scanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scanBtn.Font = Enum.Font.Code
scanBtn.TextSize = 14

local deepBtn = Instance.new("TextButton", scannerFrame)
deepBtn.Size = UDim2.new(0, 150, 0, 35)
deepBtn.Position = UDim2.new(0.5, -75, 0, 55)
deepBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
deepBtn.Text = "DEEP SCAN"
deepBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
deepBtn.Font = Enum.Font.Code
deepBtn.TextSize = 14

local sourceBtn = Instance.new("TextButton", scannerFrame)
sourceBtn.Size = UDim2.new(0, 150, 0, 35)
sourceBtn.Position = UDim2.new(0.5, -75, 0, 100)
sourceBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
sourceBtn.Text = "SOURCE SCAN"
sourceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
sourceBtn.Font = Enum.Font.Code
sourceBtn.TextSize = 14

local fullBtn = Instance.new("TextButton", scannerFrame)
fullBtn.Size = UDim2.new(0, 150, 0, 35)
fullBtn.Position = UDim2.new(0.5, -75, 0, 145)
fullBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 0)
fullBtn.Text = "FULL SCAN"
fullBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fullBtn.Font = Enum.Font.Code
fullBtn.TextSize = 14

local scanStatus = Instance.new("TextLabel", scannerFrame)
scanStatus.Size = UDim2.new(1, 0, 0, 30)
scanStatus.Position = UDim2.new(0, 0, 1, -30)
scanStatus.BackgroundTransparency = 1
scanStatus.Text = "Ready."
scanStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
scanStatus.Font = Enum.Font.Code
scanStatus.TextSize = 12

-- EXECUTOR FRAME
local executorFrame = Instance.new("Frame", contentFrame)
executorFrame.Size = UDim2.new(1, 0, 1, 0)
executorFrame.BackgroundTransparency = 1
executorFrame.Visible = false

local scriptBox = Instance.new("TextBox", executorFrame)
scriptBox.Size = UDim2.new(1, 0, 0, 200)
scriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scriptBox.TextColor3 = Color3.fromRGB(0, 255, 0)
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 13
scriptBox.MultiLine = true
scriptBox.Text = "-- Paste script or require(ID)"
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.ClearTextOnFocus = true

local execBtn = Instance.new("TextButton", executorFrame)
execBtn.Size = UDim2.new(0, 120, 0, 35)
execBtn.Position = UDim2.new(0, 0, 0, 210)
execBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
execBtn.Text = "EXECUTE"
execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
execBtn.Font = Enum.Font.Code
execBtn.TextSize = 12

local copyBtn = Instance.new("TextButton", executorFrame)
copyBtn.Size = UDim2.new(0, 120, 0, 35)
copyBtn.Position = UDim2.new(0, 130, 0, 210)
copyBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 0)
copyBtn.Text = "COPY"
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.Font = Enum.Font.Code
copyBtn.TextSize = 12

local clearBtn = Instance.new("TextButton", executorFrame)
clearBtn.Size = UDim2.new(0, 120, 0, 35)
clearBtn.Position = UDim2.new(0, 260, 0, 210)
clearBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.Code
clearBtn.TextSize = 12

local execStatus = Instance.new("TextLabel", executorFrame)
execStatus.Size = UDim2.new(1, 0, 0, 30)
execStatus.Position = UDim2.new(0, 0, 1, -30)
execStatus.BackgroundTransparency = 1
execStatus.Text = ""
execStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
execStatus.Font = Enum.Font.Code
execStatus.TextSize = 12

-- LOGS FRAME
local logsFrame = Instance.new("Frame", contentFrame)
logsFrame.Size = UDim2.new(1, 0, 1, 0)
logsFrame.BackgroundTransparency = 1
logsFrame.Visible = false

local logsBox = Instance.new("TextBox", logsFrame)
logsBox.Size = UDim2.new(1, 0, 0, 250)
logsBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
logsBox.TextColor3 = Color3.fromRGB(0, 255, 0)
logsBox.Font = Enum.Font.Code
logsBox.TextSize = 11
logsBox.MultiLine = true
logsBox.Text = "=== NYX SCANNER LOGS ===\n\n"
logsBox.TextXAlignment = Enum.TextXAlignment.Left
logsBox.TextYAlignment = Enum.TextYAlignment.Top
logsBox.ClearTextOnFocus = false

-- SETTINGS FRAME
local settingsFrame = Instance.new("Frame", contentFrame)
settingsFrame.Size = UDim2.new(1, 0, 1, 0)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

-- Переключение вкладок
scanTab.MouseButton1Click:Connect(function()
    scannerFrame.Visible = true
    executorFrame.Visible = false
    logsFrame.Visible = false
    settingsFrame.Visible = false
    scanTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    execTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    logsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    settingsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

execTab.MouseButton1Click:Connect(function()
    scannerFrame.Visible = false
    executorFrame.Visible = true
    logsFrame.Visible = false
    settingsFrame.Visible = false
    scanTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    execTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    logsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    settingsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

logsTab.MouseButton1Click:Connect(function()
    scannerFrame.Visible = false
    executorFrame.Visible = false
    logsFrame.Visible = true
    settingsFrame.Visible = false
    scanTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    execTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    logsTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    settingsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

settingsTab.MouseButton1Click:Connect(function()
    scannerFrame.Visible = false
    executorFrame.Visible = false
    logsFrame.Visible = false
    settingsFrame.Visible = true
    scanTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    execTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    logsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    settingsTab.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
end)

-- Функции
local function addLog(text)
    logsBox.Text = logsBox.Text .. "[" .. os.date("%H:%M:%S") .. "] " .. text .. "\n"
end

local backdoorKeywords = {"admin", "backdoor", "exploit", "bypass", "exec", "cmd", "c00l", "nyx", "fe", "skid", "hd", "rage", "kill", "ban", "kick", "tp", "teleport", "god", "esp"}

local function quickScan()
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
        scanStatus.Text = "Found " .. #found .. " backdoors! Check F9."
        print("========== BACKDOORS FOUND ==========")
        for i, v in ipairs(found) do print(i .. ". " .. v) end
        print("=====================================")
        addLog("Quick scan: " .. #found .. " backdoors found")
    else
        scanStatus.Text = "No backdoors found."
        addLog("Quick scan: no backdoors")
    end
end

local function deepScan()
    quickScan()
    local suspicious = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("ModuleScript") then
            local name = v.Name:lower()
            for _, kw in ipairs(backdoorKeywords) do
                if name:find(kw) then
                    table.insert(suspicious, v:GetFullName())
                    break
                end
            end
        end
    end
    if #suspicious > 0 then
        print("========== SUSPICIOUS MODULES ==========")
        for i, v in ipairs(suspicious) do print(i .. ". " .. v) end
        print("========================================")
        addLog("Deep scan: " .. #suspicious .. " suspicious modules")
    end
end

local function sourceScan()
    local found = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            local source = v.Source
            for id in string.gmatch(source, "require%s*%(%s*(%d+)%s*%)") do
                table.insert(found, v:GetFullName() .. " -> require(" .. id .. ")")
            end
            if string.find(source, "loadstring") then
                table.insert(found, v:GetFullName() .. " -> loadstring")
            end
            if string.find(source, "discord%.com/api/webhooks") then
                table.insert(found, v:GetFullName() .. " -> WEBHOOK")
            end
        end
    end
    
    if #found > 0 then
        scanStatus.Text = "Found " .. #found .. " suspicious patterns! Check F9."
        print("========== SOURCE CODE ANALYSIS ==========")
        for i, v in ipairs(found) do print(i .. ". " .. v) end
        print("==========================================")
        addLog("Source scan: " .. #found .. " suspicious patterns")
    else
        scanStatus.Text = "No suspicious code found."
        addLog("Source scan: clean")
    end
end

-- Кнопки
scanBtn.MouseButton1Click:Connect(function()
    scanStatus.Text = "Quick scanning..."
    quickScan()
end)

deepBtn.MouseButton1Click:Connect(function()
    scanStatus.Text = "Deep scanning..."
    deepScan()
    scanStatus.Text = "Deep scan complete. Check F9."
end)

sourceBtn.MouseButton1Click:Connect(function()
    scanStatus.Text = "Analyzing source code..."
    sourceScan()
end)

fullBtn.MouseButton1Click:Connect(function()
    scanStatus.Text = "FULL SCAN IN PROGRESS..."
    addLog("=== FULL SCAN STARTED ===")
    quickScan()
    deepScan()
    sourceScan()
    scanStatus.Text = "Full scan complete! Check F9."
    addLog("=== FULL SCAN COMPLETED ===")
    print("========== THIS IS ADMIN EVENT, ENJOY! ==========")
end)

execBtn.MouseButton1Click:Connect(function()
    local code = scriptBox.Text
    if code ~= "" and code ~= "-- Paste script or require(ID)" then
        if string.find(code, "require%s*%(%s*%d+%s*%)") then
            local id = string.match(code, "require%s*%(%s*(%d+)%s*%)")
            print("========== REQUIRE DETECTED ==========")
            print("Module ID: " .. id)
            print('loadstring(game:HttpGet("https://raw.githubusercontent.com/rohanssrao/Roblox-Modules/main/' .. id .. '.lua"))()')
            print("======================================")
            execStatus.Text = "Require ID: " .. id .. " - Check F9!"
            addLog("Require(" .. id .. ") - copied to console")
        else
            local success, err = pcall(loadstring(code))
            if success then
                execStatus.Text = "Executed!"
                addLog("Script executed")
            else
                execStatus.Text = "Error: " .. tostring(err)
                addLog("Error: " .. tostring(err))
            end
        end
    else
        execStatus.Text = "No script!"
    end
end)

copyBtn.MouseButton1Click:Connect(function()
    if scriptBox.Text ~= "" and scriptBox.Text ~= "-- Paste script or require(ID)" then
        print("========== COPY THIS ==========")
        print(scriptBox.Text)
        print("===============================")
        execStatus.Text = "Copied to F9!"
    else
        execStatus.Text = "Nothing to copy!"
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    scriptBox.Text = ""
    execStatus.Text = "Cleared."
end)

-- Drag
local drag, startPos, startMouse
titleBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        startPos = main.Position
        startMouse = i.Position
    end
end)
titleBar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - startMouse
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

-- Init
addLog("NYX Scanner loaded")
addLog("Game: " .. game.PlaceId)
print("========================================")
print("NYX BACKDOOR SCANNER LOADED!")
print("========================================")
