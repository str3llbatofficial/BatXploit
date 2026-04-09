--[[
    NYX BACKDOOR SCANNER
    Рабочая версия для WeAreDevs API
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NyxScanner"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(0, 255, 0)
stroke.Thickness = 2

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 8)

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

local box = Instance.new("TextBox", main)
box.Size = UDim2.new(1, -20, 0, 200)
box.Position = UDim2.new(0, 10, 0, 40)
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.BorderColor3 = Color3.fromRGB(0, 255, 0)
box.BorderSizePixel = 1
box.Text = ""
box.TextColor3 = Color3.fromRGB(0, 255, 0)
box.Font = Enum.Font.Code
box.TextSize = 14
box.TextXAlignment = Enum.TextXAlignment.Left
box.TextYAlignment = Enum.TextYAlignment.Top
box.ClearTextOnFocus = false
box.MultiLine = true

local scanBtn = Instance.new("TextButton", main)
scanBtn.Size = UDim2.new(0, 100, 0, 30)
scanBtn.Position = UDim2.new(0, 10, 0, 250)
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scanBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
scanBtn.BorderSizePixel = 1
scanBtn.Text = "SCAN"
scanBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
scanBtn.Font = Enum.Font.Code
scanBtn.TextSize = 14

local execBtn = Instance.new("TextButton", main)
execBtn.Size = UDim2.new(0, 100, 0, 30)
execBtn.Position = UDim2.new(0, 120, 0, 250)
execBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
execBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
execBtn.BorderSizePixel = 1
execBtn.Text = "EXECUTE"
execBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
execBtn.Font = Enum.Font.Code
execBtn.TextSize = 14

local clearBtn = Instance.new("TextButton", main)
clearBtn.Size = UDim2.new(0, 100, 0, 30)
clearBtn.Position = UDim2.new(0, 230, 0, 250)
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
clearBtn.BorderSizePixel = 1
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
clearBtn.Font = Enum.Font.Code
clearBtn.TextSize = 14

local result = Instance.new("TextLabel", main)
result.Size = UDim2.new(1, -20, 0, 30)
result.Position = UDim2.new(0, 10, 0, 290)
result.BackgroundTransparency = 1
result.Text = ""
result.TextColor3 = Color3.fromRGB(0, 255, 0)
result.Font = Enum.Font.Code
result.TextSize = 12
result.TextXAlignment = Enum.TextXAlignment.Left

-- Drag
local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = main.Position
    end
end)
titleBar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

-- Сканер
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
            if n:find("backdoor") or n:find("admin") or n:find("exploit") then
                table.insert(found, v:GetFullName())
            end
        end
    end
    return found
end

-- Уведомление
local function notify(text)
    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.ResetOnSpawn = false
    local bar = Instance.new("Frame", gui)
    bar.Size = UDim2.new(1, 0, 0, 25)
    bar.Position = UDim2.new(0, 0, 0, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bar.BorderSizePixel = 0
    local lbl = Instance.new("TextLabel", bar)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(0, 255, 0)
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 16
    task.wait(4)
    gui:Destroy()
end

-- Кнопки
scanBtn.MouseButton1Click:Connect(function()
    local bd = scanBackdoors()
    if #bd > 0 then
        notify("This is admin event, Enjoy!")
        result.Text = "Found " .. #bd .. " backdoor(s)! Check console."
        for i, v in ipairs(bd) do
            print(i .. ". " .. v)
        end
    else
        result.Text = "No backdoors found."
    end
end)

execBtn.MouseButton1Click:Connect(function()
    local code = box.Text
    if code ~= "" then
        local ok, err = pcall(loadstring(code))
        if ok then
            result.Text = "Executed!"
        else
            result.Text = "Error: " .. tostring(err)
        end
    else
        result.Text = "No script!"
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    box.Text = ""
    result.Text = ""
end)

notify("NYX Scanner loaded!")
