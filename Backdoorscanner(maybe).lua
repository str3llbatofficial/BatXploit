--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  SCANNER
]=]

local G2L = {}
local player = game.Players.LocalPlayer

-- ScreenGui
G2L["1"] = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
G2L["1"]["Name"] = "NYX Scanner"
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["1"]["ResetOnSpawn"] = false

-- Frame
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["2"]["Size"] = UDim2.new(0, 482, 0, 276)
G2L["2"]["Position"] = UDim2.new(0.273, 0, 0.302, 0)

-- UIStroke
G2L["3"] = Instance.new("UIStroke", G2L["2"])
G2L["3"]["Color"] = Color3.fromRGB(255, 255, 255)
G2L["3"]["Thickness"] = 2

-- UIGradient
G2L["4"] = Instance.new("UIGradient", G2L["3"])
G2L["4"]["Rotation"] = 50
G2L["4"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
}

-- UICorner
G2L["5"] = Instance.new("UICorner", G2L["2"])
G2L["5"]["CornerRadius"] = UDim.new(0, 8)

-- Executor Folder
G2L["6"] = Instance.new("Folder", G2L["2"])
G2L["6"]["Name"] = "Executor"

-- Execute Frame
G2L["7"] = Instance.new("Frame", G2L["6"])
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["7"]["BackgroundTransparency"] = 1
G2L["7"]["Size"] = UDim2.new(0, 290, 0, 28)
G2L["7"]["Position"] = UDim2.new(0.022, 0, 0.871, 0)
G2L["7"]["Name"] = "Execute"

-- Execute Button
G2L["8"] = Instance.new("TextButton", G2L["7"])
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["8"]["TextSize"] = 22
G2L["8"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["8"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["8"]["Name"] = "Button"
G2L["8"]["Text"] = "COPY"
G2L["8"]["BackgroundTransparency"] = 1

-- Execute UICorner
G2L["9"] = Instance.new("UICorner", G2L["7"])
G2L["9"]["CornerRadius"] = UDim.new(0, 6)

-- Execute UIStroke
G2L["a"] = Instance.new("UIStroke", G2L["7"])
G2L["a"]["Color"] = Color3.fromRGB(0, 255, 0)
G2L["a"]["Thickness"] = 1.5

-- Clear Frame
G2L["b"] = Instance.new("Frame", G2L["6"])
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["b"]["BackgroundTransparency"] = 1
G2L["b"]["Size"] = UDim2.new(0, 162, 0, 28)
G2L["b"]["Position"] = UDim2.new(0.64, 0, 0.871, 0)
G2L["b"]["Name"] = "Clear"

-- Clear Button
G2L["c"] = Instance.new("TextButton", G2L["b"])
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["c"]["TextSize"] = 22
G2L["c"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 100, 100)
G2L["c"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["c"]["Name"] = "Button"
G2L["c"]["Text"] = "CLEAR"
G2L["c"]["BackgroundTransparency"] = 1

-- Clear UICorner
G2L["d"] = Instance.new("UICorner", G2L["b"])
G2L["d"]["CornerRadius"] = UDim.new(0, 6)

-- Clear UIStroke
G2L["e"] = Instance.new("UIStroke", G2L["b"])
G2L["e"]["Color"] = Color3.fromRGB(255, 100, 100)
G2L["e"]["Thickness"] = 1.5

-- ExecutorBox Frame
G2L["f"] = Instance.new("Frame", G2L["6"])
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22)
G2L["f"]["Size"] = UDim2.new(0, 462, 0, 163)
G2L["f"]["Position"] = UDim2.new(0.02, 0, 0.243, 0)
G2L["f"]["Name"] = "ExecutorBox"

-- ExecutorBox UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"])
G2L["10"]["CornerRadius"] = UDim.new(0, 6)

-- TextBox
G2L["11"] = Instance.new("TextBox", G2L["f"])
G2L["11"]["TextSize"] = 14
G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left
G2L["11"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["11"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["11"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["11"]["MultiLine"] = true
G2L["11"]["BackgroundTransparency"] = 1
G2L["11"]["PlaceholderText"] = "-- Paste your script here"
G2L["11"]["Size"] = UDim2.new(0, 448, 0, 150)
G2L["11"]["Text"] = ""
G2L["11"]["Position"] = UDim2.new(0.016, 0, 0.042, 0)
G2L["11"]["ClearTextOnFocus"] = false

-- Scanner Frame
G2L["16"] = Instance.new("Frame", G2L["2"])
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["16"]["BackgroundTransparency"] = 1
G2L["16"]["Size"] = UDim2.new(0, 370, 0, 107)
G2L["16"]["Position"] = UDim2.new(0.117, 0, 0.305, 0)
G2L["16"]["Visible"] = true
G2L["16"]["Name"] = "Scanner"

-- Scanner UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["16"])
G2L["17"]["Color"] = Color3.fromRGB(255, 255, 255)
G2L["17"]["Thickness"] = 2

-- Scanner UIGradient
G2L["18"] = Instance.new("UIGradient", G2L["17"])
G2L["18"]["Rotation"] = 50
G2L["18"]["Color"] = ColorSequence.new{
    ColorSequenceKeypoint.new(0.000, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 255, 200))
}

-- Scanner UICorner
G2L["19"] = Instance.new("UICorner", G2L["16"])
G2L["19"]["CornerRadius"] = UDim.new(0, 8)

-- Scanner Button
G2L["1a"] = Instance.new("TextButton", G2L["16"])
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1a"]["TextSize"] = 43
G2L["1a"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["1a"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["1a"]["Name"] = "Button"
G2L["1a"]["Text"] = "START SCANNING"
G2L["1a"]["BackgroundTransparency"] = 1

-- Title Label
G2L["1d"] = Instance.new("TextLabel", G2L["2"])
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1d"]["FontFace"] = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["1d"]["TextSize"] = 30
G2L["1d"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["1d"]["Size"] = UDim2.new(0, 460, 0, 50)
G2L["1d"]["Text"] = "NYX BACKDOOR SCANNER"
G2L["1d"]["BackgroundTransparency"] = 1
G2L["1d"]["Position"] = UDim2.new(0.022, 0, 0.025, 0)

-- Result Label
G2L["20"] = Instance.new("TextLabel", G2L["2"])
G2L["20"]["BackgroundTransparency"] = 1
G2L["20"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["20"]["TextSize"] = 12
G2L["20"]["TextColor3"] = Color3.fromRGB(0, 255, 0)
G2L["20"]["Size"] = UDim2.new(0, 460, 0, 20)
G2L["20"]["Position"] = UDim2.new(0.022, 0, 0.92, 0)
G2L["20"]["Text"] = ""
G2L["20"]["TextXAlignment"] = Enum.TextXAlignment.Center

-- Скрываем Executor при старте
for _, v in ipairs(G2L["6"]:GetDescendants()) do
    if v:IsA("Frame") then v.Visible = false end
end

-- Логика сканера
local searching = false

local function scanBackdoors()
    local found = {}
    local kw = {"admin", "backdoor", "exploit", "bypass", "remote", "fire", "exec", "cmd", "c00l", "nyx", "fe", "skid", "hd"}
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local n = v.Name:lower()
            for _, k in ipairs(kw) do
                if n:find(k) then table.insert(found, v:GetFullName()) break end
            end
        end
    end
    return found
end

G2L["1a"].MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    G2L["1a"].Text = "SCANNING..."
    local bd = scanBackdoors()
    if #bd > 0 then
        G2L["20"].Text = "Found " .. #bd .. " backdoor(s)! Check F9."
        print("========== THIS IS ADMIN EVENT, ENJOY! ==========")
        for i, v in ipairs(bd) do print(i .. ". " .. v) end
        print("=================================================")
        G2L["16"].Visible = false
        for _, v in ipairs(G2L["6"]:GetDescendants()) do
            if v:IsA("Frame") then v.Visible = true end
        end
    else
        G2L["1a"].Text = "NO BACKDOOR :("
        G2L["20"].Text = "No backdoors found."
    end
    searching = false
end)

G2L["8"].MouseButton1Click:Connect(function()
    local code = G2L["11"].Text
    if code ~= "" then
        print("========== COPY THIS TO EXECUTOR ==========")
        print(code)
        print("===========================================")
        G2L["20"].Text = "Copied to console (F9)!"
    else
        G2L["20"].Text = "No script!"
    end
end)

G2L["c"].MouseButton1Click:Connect(function()
    G2L["11"].Text = ""
    G2L["20"].Text = ""
end)

-- Dragify
local UIS = game:GetService("UserInputService")
local dragToggle, dragInput, dragStart, startPos
local main = G2L["2"]

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

main.InputEnded:Connect(function(input)
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
