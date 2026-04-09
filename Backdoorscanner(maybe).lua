--[[ NYX BACKDOOR SCANNER - ULTRA STABLE FIX ]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NyxScanner"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false  -- <-- ВОТ ЭТО ВАЖНО

-- Простое окно
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Parent = gui

-- Заголовок
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NYX BACKDOOR SCANNER FE BypAssER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.Code
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.BorderSizePixel = 0
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.Code
close.TextSize = 16
close.Parent = titleBar
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Поле ввода
local box = Instance.new("TextBox")
box.Size = UDim2.new(1, -20, 0, 200)
box.Position = UDim2.new(0, 10, 0, 40)
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.BorderColor3 = Color3.fromRGB(0, 255, 0)
box.BorderSizePixel = 1
box.Text = "-- Paste ur script here"
box.TextColor3 = Color3.fromRGB(200, 200, 200)
box.Font = Enum.Font.Code
box.TextSize = 14
box.TextXAlignment = Enum.TextXAlignment.Left
box.TextYAlignment = Enum.TextYAlignment.Top
box.ClearTextOnFocus = true
box.MultiLine = true
box.Parent = main

-- Кнопки
local scan = Instance.new("TextButton")
scan.Size = UDim2.new(0, 100, 0, 30)
scan.Position = UDim2.new(0, 10, 0, 250)
scan.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scan.BorderColor3 = Color3.fromRGB(0, 255, 0)
scan.BorderSizePixel = 1
scan.Text = "Scan"
scan.TextColor3 = Color3.fromRGB(0, 255, 0)
scan.Font = Enum.Font.Code
scan.TextSize = 14
scan.Parent = main

local exec = Instance.new("TextButton")
exec.Size = UDim2.new(0, 100, 0, 30)
exec.Position = UDim2.new(0, 120, 0, 250)
exec.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
exec.BorderColor3 = Color3.fromRGB(0, 255, 0)
exec.BorderSizePixel = 1
exec.Text = "Execute"
exec.TextColor3 = Color3.fromRGB(0, 255, 0)
exec.Font = Enum.Font.Code
exec.TextSize = 14
exec.Parent = main

local clear = Instance.new("TextButton")
clear.Size = UDim2.new(0, 100, 0, 30)
clear.Position = UDim2.new(0, 230, 0, 250)
clear.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clear.BorderColor3 = Color3.fromRGB(0, 255, 0)
clear.BorderSizePixel = 1
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(0, 255, 0)
clear.Font = Enum.Font.Code
clear.TextSize = 14
clear.Parent = main

local result = Instance.new("TextLabel")
result.Size = UDim2.new(1, -20, 0, 30)
result.Position = UDim2.new(0, 10, 0, 290)
result.BackgroundTransparency = 1
result.Text = ""
result.TextColor3 = Color3.fromRGB(0, 255, 0)
result.Font = Enum.Font.Code
result.TextSize = 12
result.TextXAlignment = Enum.TextXAlignment.Left
result.Parent = main

-- Сканнер
local function scanBackdoors()
    local found = {}
    local kw = {"admin", "backdoor", "exploit", "bypass", "remote", "fire", "exec", "cmd", "c00l", "nyx", "fe", "skid", "hd", "rage", "kill", "ban", "kick", "tp", "teleport", "god", "esp"}
    
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local n = v.Name:lower()
            local pn = v.Parent and v.Parent.Name:lower() or ""
            for _, k in ipairs(kw) do
                if n:find(k) or pn:find(k) then
                    table.insert(found, {Name = v.Name, Path = v:GetFullName(), Type = v.ClassName})
                    break
                end
            end
        elseif v:IsA("ModuleScript") then
            local n = v.Name:lower()
            if n:find("backdoor") or n:find("admin") or n:find("exploit") then
                table.insert(found, {Name = v.Name, Path = v:GetFullName(), Type = "ModuleScript"})
            end
        end
    end
    return found
end

scan.MouseButton1Click:Connect(function()
    local bd = scanBackdoors()
    if #bd > 0 then
        result.Text = "Found " .. #bd .. " backdoor(s)! Check F9."
        result.TextColor3 = Color3.fromRGB(0, 255, 0)
        print("========== NYX SCANNER RESULTS ==========")
        for i, v in ipairs(bd) do
            print(i .. ". [" .. v.Type .. "] " .. v.Name .. "\n   Path: " .. v.Path)
        end
        print("=========================================")
    else
        result.Text = "No backdoors found."
        result.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

exec.MouseButton1Click:Connect(function()
    local code = box.Text
    if code and code ~= "" and code ~= "-- Paste ur script here" then
        local ok, err = pcall(loadstring(code))
        if ok then
            result.Text = "Executed successfully!"
            result.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            result.Text = "Error: " .. tostring(err)
            result.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    else
        result.Text = "No script to execute!"
        result.TextColor3 = Color3.fromRGB(255, 255, 0)
    end
end)

clear.MouseButton1Click:Connect(function()
    box.Text = ""
    result.Text = ""
end)

-- Перетаскивание (без лишних заморочек)
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
