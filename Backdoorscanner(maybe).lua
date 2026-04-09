--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  SCANNER
]=]

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
G2L["2"]["Size"] = UDim2.new(0, 482, 0, 276);
G2L["2"]["Position"] = UDim2.new(0.273, 0, 0.302, 0);

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

-- Executor Folder
G2L["6"] = Instance.new("Folder", G2L["2"]);
G2L["6"]["Name"] = [[Executor]];

-- Execute Frame
G2L["7"] = Instance.new("Frame", G2L["6"]);
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Size"] = UDim2.new(0, 290, 0, 28);
G2L["7"]["Position"] = UDim2.new(0.022, 0, 0.871, 0);
G2L["7"]["Name"] = [[Execute]];

-- Execute Button
G2L["8"] = Instance.new("TextButton", G2L["7"]);
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["TextSize"] = 22;
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["8"]["TextColor3"] = Color3.fromRGB(51, 215, 0);
G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8"]["Name"] = [[Button]];
G2L["8"]["Text"] = [[Execute]];
G2L["8"]["BackgroundTransparency"] = 1;

-- Execute UICorner
G2L["9"] = Instance.new("UICorner", G2L["7"]);

-- Execute UIStroke
G2L["a"] = Instance.new("UIStroke", G2L["7"]);
G2L["a"]["Color"] = Color3.fromRGB(51, 215, 0);

-- Clear Frame
G2L["b"] = Instance.new("Frame", G2L["6"]);
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Size"] = UDim2.new(0, 162, 0, 28);
G2L["b"]["Position"] = UDim2.new(0.64, 0, 0.871, 0);
G2L["b"]["Name"] = [[Clear]];

-- Clear Button
G2L["c"] = Instance.new("TextButton", G2L["b"]);
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["TextSize"] = 22;
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 100, 100);
G2L["c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["c"]["Name"] = [[Button]];
G2L["c"]["Text"] = [[Clear]];
G2L["c"]["BackgroundTransparency"] = 1;

-- Clear UICorner
G2L["d"] = Instance.new("UICorner", G2L["b"]);

-- Clear UIStroke
G2L["e"] = Instance.new("UIStroke", G2L["b"]);
G2L["e"]["Color"] = Color3.fromRGB(255, 100, 100);

-- ExecutorBox Frame
G2L["f"] = Instance.new("Frame", G2L["6"]);
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
G2L["f"]["Size"] = UDim2.new(0, 462, 0, 163);
G2L["f"]["Position"] = UDim2.new(0.02, 0, 0.243, 0);
G2L["f"]["Name"] = [[ExecutorBox]];

-- ExecutorBox UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"]);

-- TextBox
G2L["11"] = Instance.new("TextBox", G2L["f"]);
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["11"]["TextWrapped"] = true;
G2L["11"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["11"]["MultiLine"] = true;
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["PlaceholderText"] = [[require(77055143496081).MorphMonster("fgrwerlgh", "shin sonic")]];
G2L["11"]["Size"] = UDim2.new(0, 448, 0, 150);
G2L["11"]["Text"] = [[]];
G2L["11"]["Position"] = UDim2.new(0.016, 0, 0.042, 0);
G2L["11"]["ClearTextOnFocus"] = false;

-- Scanner Frame
G2L["16"] = Instance.new("Frame", G2L["2"]);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["Size"] = UDim2.new(0, 370, 0, 107);
G2L["16"]["Position"] = UDim2.new(0.117, 0, 0.305, 0);
G2L["16"]["Visible"] = true;
G2L["16"]["Name"] = [[Scanner]];

-- Scanner UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["16"]);
G2L["17"]["Color"] = Color3.fromRGB(255, 255, 255);

-- Scanner UIGradient
G2L["18"] = Instance.new("UIGradient", G2L["17"]);
G2L["18"]["Rotation"] = 50;
G2L["18"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
};

-- Scanner UICorner
G2L["19"] = Instance.new("UICorner", G2L["16"]);

-- Scanner Button
G2L["1a"] = Instance.new("TextButton", G2L["16"]);
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["TextSize"] = 43;
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1a"]["Name"] = [[Button]];
G2L["1a"]["Text"] = [[Start Scanning]];
G2L["1a"]["BackgroundTransparency"] = 1;

-- Scanner Button UIGradient
G2L["1b"] = Instance.new("UIGradient", G2L["1a"]);
G2L["1b"]["Rotation"] = 50;
G2L["1b"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
};

-- Scanner Button UIStroke
G2L["1c"] = Instance.new("UIStroke", G2L["1a"]);
G2L["1c"]["Color"] = Color3.fromRGB(255, 255, 255);

-- Title Label
G2L["1d"] = Instance.new("TextLabel", G2L["2"]);
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["FontFace"] = Font.new([[rbxassetid://12187365977]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1d"]["TextSize"] = 30;
G2L["1d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Size"] = UDim2.new(0, 460, 0, 50);
G2L["1d"]["Text"] = [[NYX BACKDOOR SCANNER]];
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Position"] = UDim2.new(0.022, 0, 0.025, 0);

-- Title UIStroke
G2L["1e"] = Instance.new("UIStroke", G2L["1d"]);
G2L["1e"]["Color"] = Color3.fromRGB(255, 255, 255);

-- Title UIGradient
G2L["1f"] = Instance.new("UIGradient", G2L["1e"]);
G2L["1f"]["Rotation"] = 50;
G2L["1f"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
};

-- Dragify LocalScript
G2L["21"] = Instance.new("LocalScript", G2L["1"]);
G2L["21"]["Name"] = [[Dragify]];

-- ============================================================================
-- ЛОГИКА NYX SCANNER
-- ============================================================================

local GUI = G2L["2"]
local backdoor = nil
local searching = false
local player = game.Players.LocalPlayer

-- Скрываем Executor при старте
for _, v in ipairs(G2L["6"]:GetDescendants()) do
    if v:IsA("Frame") then v.Visible = false end
end

-- Функция уведомления
local function notify(text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "NYX Scanner",
            Duration = 4,
            Text = text
        })
    end)
end

-- Функция сканирования
local function scanBackdoors()
    local found = {}
    local kw = {"admin", "backdoor", "exploit", "bypass", "remote", "fire", "exec", "cmd", "c00l", "nyx", "fe", "skid", "hd", "rage", "kill", "ban", "kick", "tp", "teleport", "god", "esp"}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local n = v.Name:lower()
            local pn = v.Parent and v.Parent.Name:lower() or ""
            for _, k in ipairs(kw) do
                if n:find(k) or pn:find(k) then
                    table.insert(found, v:GetFullName())
                    break
                end
            end
        elseif v:IsA("ModuleScript") then
            local n = v.Name:lower()
            for _, k in ipairs(kw) do
                if n:find(k) then
                    table.insert(found, "[Module] " .. v:GetFullName())
                    break
                end
            end
        end
    end
    
    return found
end

-- Кнопка SCAN
G2L["1a"].MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    G2L["1a"].Text = "Scanning..."
    
    local bd = scanBackdoors()
    
    if #bd > 0 then
        notify("This is admin event, Enjoy! Found " .. #bd .. " backdoors!")
        print("========== THIS IS ADMIN EVENT, ENJOY! ==========")
        for i, v in ipairs(bd) do print(i .. ". " .. v) end
        print("=================================================")
        G2L["16"].Visible = false
        for _, v in ipairs(G2L["6"]:GetDescendants()) do
            if v:IsA("Frame") then v.Visible = true end
        end
    else
        G2L["1a"].Text = "No backdoor :("
        notify("No backdoors found.")
        task.wait(2)
        G2L["1a"].Text = "Start Scanning"
    end
    
    searching = false
end)

-- Кнопка EXECUTE
G2L["8"].MouseButton1Click:Connect(function()
    local code = G2L["11"].Text
    if code ~= "" then
        -- Заменяем %username%
        code = string.gsub(code, "%%username%%", player.Name)
        
        -- Выполняем
        local success, err = pcall(loadstring(code))
        if success then
            G2L["8"].Text = "Executed!"
            notify("Script executed!")
        else
            G2L["8"].Text = "Error!"
            warn("Error: " .. tostring(err))
        end
        task.wait(1)
        G2L["8"].Text = "Execute"
    end
end)

-- Кнопка CLEAR
G2L["c"].MouseButton1Click:Connect(function()
    G2L["11"].Text = ""
    G2L["c"].Text = "Cleared!"
    task.wait(0.5)
    G2L["c"].Text = "Clear"
end)

-- Dragify
local UIS = game:GetService("UserInputService")
local dragToggle, dragInput, dragStart, startPos

local function updateInput(input)
    local Delta = input.Position - dragStart
    local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
    game:GetService("TweenService"):Create(GUI, TweenInfo.new(0.15), {Position = Position}):Play()
end

GUI.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
        dragToggle = true
        dragStart = input.Position
        startPos = GUI.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

GUI.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragToggle then
        updateInput(input)
    end
end)

-- Горячая клавиша LeftAlt
UIS.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.LeftAlt and not processed then
        GUI.Visible = not GUI.Visible
    end
end)

-- Готово
notify("NYX Scanner loaded!")
print("========================================")
print("NYX BACKDOOR SCANNER LOADED!")
print("Press LeftAlt to toggle GUI")
print("========================================")

return G2L["1"], require
