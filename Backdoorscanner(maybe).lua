--[[
    NYX BACKDOOR SCANNER FE BypAssER
    Полная реплика UI + функционал сканирования
]]

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NyxScanner"
ScreenGui.Parent = game.CoreGui

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Заголовок окна
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NYX BACKDOOR SCANNER FE BypAssER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.Code
CloseButton.TextSize = 16
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Поле для ввода скрипта (большое текстовое поле)
local ScriptBox = Instance.new("TextBox")
ScriptBox.Size = UDim2.new(1, -20, 0, 200)
ScriptBox.Position = UDim2.new(0, 10, 0, 40)
ScriptBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ScriptBox.BorderColor3 = Color3.fromRGB(0, 255, 0)
ScriptBox.BorderSizePixel = 1
ScriptBox.Text = "-- Paste ur script here"
ScriptBox.TextColor3 = Color3.fromRGB(200, 200, 200)
ScriptBox.Font = Enum.Font.Code
ScriptBox.TextSize = 14
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.ClearTextOnFocus = true
ScriptBox.MultiLine = true
ScriptBox.Parent = MainFrame

-- Кнопка Scan
local ScanButton = Instance.new("TextButton")
ScanButton.Size = UDim2.new(0, 100, 0, 30)
ScanButton.Position = UDim2.new(0, 10, 0, 250)
ScanButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScanButton.BorderColor3 = Color3.fromRGB(0, 255, 0)
ScanButton.BorderSizePixel = 1
ScanButton.Text = "Scan"
ScanButton.TextColor3 = Color3.fromRGB(0, 255, 0)
ScanButton.Font = Enum.Font.Code
ScanButton.TextSize = 14
ScanButton.Parent = MainFrame

-- Кнопка Execute
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Size = UDim2.new(0, 100, 0, 30)
ExecuteButton.Position = UDim2.new(0, 120, 0, 250)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ExecuteButton.BorderColor3 = Color3.fromRGB(0, 255, 0)
ExecuteButton.BorderSizePixel = 1
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(0, 255, 0)
ExecuteButton.Font = Enum.Font.Code
ExecuteButton.TextSize = 14
ExecuteButton.Parent = MainFrame

-- Кнопка Clear
local ClearButton = Instance.new("TextButton")
ClearButton.Size = UDim2.new(0, 100, 0, 30)
ClearButton.Position = UDim2.new(0, 230, 0, 250)
ClearButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ClearButton.BorderColor3 = Color3.fromRGB(0, 255, 0)
ClearButton.BorderSizePixel = 1
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(0, 255, 0)
ClearButton.Font = Enum.Font.Code
ClearButton.TextSize = 14
ClearButton.Parent = MainFrame

-- Текстовая метка для результатов
local ResultLabel = Instance.new("TextLabel")
ResultLabel.Size = UDim2.new(1, -20, 0, 30)
ResultLabel.Position = UDim2.new(0, 10, 0, 290)
ResultLabel.BackgroundTransparency = 1
ResultLabel.Text = ""
ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
ResultLabel.Font = Enum.Font.Code
ResultLabel.TextSize = 12
ResultLabel.TextXAlignment = Enum.TextXAlignment.Left
ResultLabel.Parent = MainFrame

-- Функция создания чёрной полосы сверху
local function createTopNotification(text)
    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Name = "NyxTopNotify"
    NotifyGui.Parent = game.CoreGui
    
    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, 0, 0, 25)
    Bar.Position = UDim2.new(0, 0, 0, 0)
    Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Bar.BorderSizePixel = 0
    Bar.Parent = NotifyGui
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(0, 255, 0)
    Label.Font = Enum.Font.Code
    Label.TextSize = 14
    Label.Parent = Bar
    
    task.wait(4)
    NotifyGui:Destroy()
end

-- Функция сканирования бэкдоров
local function scanForBackdoors()
    local found = {}
    local keywords = {
        "admin", "backdoor", "exploit", "bypass", "remote", 
        "fire", "exec", "cmd", "console", "script", "inject",
        "c00l", "nyx", "fe", "skid", "sploit", "hd", "rage",
        "kill", "ban", "kick", "tp", "teleport", "god", "esp"
    }
    
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local objName = obj.Name:lower()
            local parentName = obj.Parent and obj.Parent.Name:lower() or ""
            
            for _, kw in ipairs(keywords) do
                if objName:find(kw) or parentName:find(kw) then
                    table.insert(found, {
                        Name = obj.Name,
                        Path = obj:GetFullName(),
                        Type = obj.ClassName
                    })
                    break
                end
            end
        elseif obj:IsA("ModuleScript") then
            local name = obj.Name:lower()
            if name:find("backdoor") or name:find("admin") or name:find("exploit") then
                table.insert(found, {
                    Name = obj.Name,
                    Path = obj:GetFullName(),
                    Type = "ModuleScript"
                })
            end
        end
    end
    
    return found
end

-- Функция для выполнения скрипта из поля ввода
local function executeScript()
    local scriptText = ScriptBox.Text
    if scriptText and scriptText ~= "" and scriptText ~= "-- Paste ur script here" then
        local success, err = pcall(function()
            loadstring(scriptText)()
        end)
        if not success then
            ResultLabel.Text = "Error: " .. tostring(err)
            ResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        else
            ResultLabel.Text = "Script executed successfully!"
            ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        end
    else
        ResultLabel.Text = "No script to execute!"
        ResultLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    end
end

-- Обработчик кнопки Scan
ScanButton.MouseButton1Click:Connect(function()
    local backdoors = scanForBackdoors()
    
    if #backdoors > 0 then
        createTopNotification("This is admin event, Enjoy!")
        ResultLabel.Text = "Found " .. #backdoors .. " backdoor(s)! Check console (F9)."
        ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Вывод в консоль
        print("========== NYX SCANNER: BACKDOORS FOUND ==========")
        for i, bd in ipairs(backdoors) do
            print(i .. ". [" .. bd.Type .. "] " .. bd.Name)
            print("   Path: " .. bd.Path)
        end
        print("==================================================")
    else
        ResultLabel.Text = "No backdoors found in this game."
        ResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Обработчик кнопки Execute
ExecuteButton.MouseButton1Click:Connect(executeScript)

-- Обработчик кнопки Clear
ClearButton.MouseButton1Click:Connect(function()
    ScriptBox.Text = ""
    ResultLabel.Text = ""
end)

-- Возможность перетаскивать окно
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
