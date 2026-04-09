-- NYX BACKDOOR SCANNER - ULTRA SIMPLE

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NyxScanner"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.Text = "NYX BACKDOOR SCANNER"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local box = Instance.new("TextBox", main)
box.Size = UDim2.new(1, -20, 0, 200)
box.Position = UDim2.new(0, 10, 0, 40)
box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
box.TextColor3 = Color3.fromRGB(0, 255, 0)
box.Font = Enum.Font.SourceSans
box.TextSize = 14
box.MultiLine = true
box.Text = ""

local scanBtn = Instance.new("TextButton", main)
scanBtn.Size = UDim2.new(0, 150, 0, 30)
scanBtn.Position = UDim2.new(0, 10, 0, 250)
scanBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scanBtn.Text = "SCAN"
scanBtn.TextColor3 = Color3.fromRGB(0, 255, 0)

local copyBtn = Instance.new("TextButton", main)
copyBtn.Size = UDim2.new(0, 150, 0, 30)
copyBtn.Position = UDim2.new(0, 170, 0, 250)
copyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
copyBtn.Text = "COPY"
copyBtn.TextColor3 = Color3.fromRGB(0, 255, 0)

local clearBtn = Instance.new("TextButton", main)
clearBtn.Size = UDim2.new(0, 150, 0, 30)
clearBtn.Position = UDim2.new(0, 330, 0, 250)
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255, 100, 100)

local result = Instance.new("TextLabel", main)
result.Size = UDim2.new(1, -20, 0, 30)
result.Position = UDim2.new(0, 10, 0, 290)
result.BackgroundTransparency = 1
result.Text = ""
result.TextColor3 = Color3.fromRGB(0, 255, 0)
result.Font = Enum.Font.SourceSans
result.TextSize = 12

-- Сканер
scanBtn.MouseButton1Click:Connect(function()
    local found = {}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            table.insert(found, v:GetFullName())
        end
    end
    if #found > 0 then
        result.Text = "Found " .. #found .. " remotes! Check F9."
        for i, v in ipairs(found) do print(i .. ". " .. v) end
    else
        result.Text = "No remotes found."
    end
end)

copyBtn.MouseButton1Click:Connect(function()
    if box.Text ~= "" then
        print(box.Text)
        result.Text = "Copied to console (F9)!"
    else
        result.Text = "No script!"
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    box.Text = ""
    result.Text = ""
end)

-- Drag
local drag, startPos, startMouse
title.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        startPos = main.Position
        startMouse = i.Position
    end
end)
title.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - startMouse
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)
