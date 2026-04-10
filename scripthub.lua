local KEY_CODES = {36, 48, 48, 36, 71, 95, 71, 49, 74, 103, 52, 115, 104, 54, 52, 71, 100, 69, 106, 82, 70, 48, 70, 48, 49, 50, 102, 120, 48, 120, 120, 48}

local function getKey()
    local chars = {}
    for _, code in ipairs(KEY_CODES) do
        table.insert(chars, string.char(code))
    end
    return table.concat(chars)
end

local MASTER_KEY = getKey()

-- ============================================================================
-- PASSWORD GUI
-- ============================================================================
local player = game.Players.LocalPlayer
local passGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
passGui.Name = "NyxPassPrompt"
passGui.ResetOnSpawn = false
passGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local passFrame = Instance.new("Frame", passGui)
passFrame.Size = UDim2.new(0, 300, 0, 140)
passFrame.Position = UDim2.new(0.5, -150, 0.5, -70)
passFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passFrame.BorderSizePixel = 0

local passStroke = Instance.new("UIStroke", passFrame)
passStroke.Color = Color3.fromRGB(0, 255, 0)
passStroke.Thickness = 1.5

local passCorner = Instance.new("UICorner", passFrame)
passCorner.CornerRadius = UDim.new(0, 8)

local passTitle = Instance.new("TextLabel", passFrame)
passTitle.Size = UDim2.new(1, 0, 0, 30)
passTitle.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
passTitle.Text = "NYX SCRIPT HUB - PASSWORD"
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

local errorLabel = Instance.new("TextLabel", passFrame)
errorLabel.Size = UDim2.new(1, -20, 0, 20)
errorLabel.Position = UDim2.new(0, 10, 0, 115)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorLabel.Font = Enum.Font.Code
errorLabel.TextSize = 11

-- Drag
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
-- SCRIPT LIBRARY (50+ Scripts)
-- ============================================================================
local ScriptLibrary = {
    ["Universal"] = {
        {name = "Dex Explorer", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end},
        {name = "Infinite Yield", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end},
        {name = "RemoteSpy", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpy.lua"))() end},
        {name = "Cmd-X", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))() end},
        {name = "Dark Dex", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/master/Universal/DarkDex.lua"))() end},
        {name = "Fly GUI", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))() end},
        {name = "ESP", func = function() 
            for _, p in ipairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local hl = Instance.new("Highlight", p.Character)
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                end
            end
        end},
        {name = "Click TP", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/click-teleport/main/source.lua"))() end},
        {name = "Nametag Spoofer", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/nametag-spoofer/main/source.lua"))() end},
        {name = "Anti-AFK", func = function()
            local vu = game:GetService("VirtualUser")
            player.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame) end)
        end},
        {name = "Stream Sniper", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/stream-sniper/main/source.lua"))() end},
        {name = "Chat Bypass", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/chat-bypass/main/source.lua"))() end},
        {name = "Infinite Jump", func = function() 
            local hum = player.Character.Humanoid
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            wait(0.1)
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        end},
        {name = "NoClip", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/noclip/main/source.lua"))() end},
        {name = "Speed Hack", func = function() player.Character.Humanoid.WalkSpeed = 50 end}
    },
    ["Game"] = {
        {name = "Brookhaven RP", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Polaris/master/Brookhaven.lua"))() end},
        {name = "Murder Mystery 2", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownKidd/Hub/main/MM2.lua"))() end},
        {name = "Adopt Me!", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/AdoptMe.lua"))() end},
        {name = "Blox Fruits", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/BloxFruits/main/BloxFruits.lua"))() end},
        {name = "Tower of Hell", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/tower-of-hell/main/source.lua"))() end},
        {name = "Jailbreak", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/jailbreak/main/source.lua"))() end},
        {name = "MeepCity", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/meepcity/main/source.lua"))() end},
        {name = "Royale High", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/royale-high/main/source.lua"))() end},
        {name = "Pet Simulator X", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/pet-sim-x/main/source.lua"))() end},
        {name = "Natural Disaster Survival", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/nds/main/source.lua"))() end},
        {name = "Piggy", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/piggy/main/source.lua"))() end},
        {name = "Arsenal", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/arsenal/main/source.lua"))() end},
        {name = "Phantom Forces", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/phantom-forces/main/source.lua"))() end},
        {name = "Jailbreak Auto Rob", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/jailbreak-autorob/main/source.lua"))() end},
        {name = "Mad City", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/mad-city/main/source.lua"))() end}
    },
    ["Visual"] = {
        {name = "Skybox Changer", func = function() 
            local sky = Instance.new("Sky", game.Lighting)
            sky.SkyboxBk = "http://www.roblox.com/asset/?id=123456"
            sky.SkyboxDn = "http://www.roblox.com/asset/?id=123456"
            sky.SkyboxFt = "http://www.roblox.com/asset/?id=123456"
            sky.SkyboxLf = "http://www.roblox.com/asset/?id=123456"
            sky.SkyboxRt = "http://www.roblox.com/asset/?id=123456"
            sky.SkyboxUp = "http://www.roblox.com/asset/?id=123456"
        end},
        {name = "FPS Booster", func = function()
            settings().Rendering.QualityLevel = 1
            game.Lighting.GlobalShadows = false
            game.Lighting.FogEnd = 9e9
        end},
        {name = "Remove Terrain", func = function() workspace.Terrain:Clear() end},
        {name = "Fullbright", func = function() game.Lighting.Brightness = 2 game.Lighting.ClockTime = 14 end},
        {name = "No Fog", func = function() game.Lighting.FogEnd = 9e9 game.Lighting.FogStart = 0 end},
        {name = "Invisible Character", func = function() 
            for _, v in ipairs(player.Character:GetDescendants()) do 
                if v:IsA("BasePart") then v.Transparency = 1 end 
            end
        end},
        {name = "Rainbow Character", func = function()
            while true do
                for _, v in ipairs(player.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.BrickColor = BrickColor.random() end
                end
                wait(0.1)
            end
        end},
        {name = "Spin Character", func = function()
            while true do
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0.1, 0)
                wait()
            end
        end},
        {name = "Giant Character", func = function() player.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10) end},
        {name = "Tiny Character", func = function() player.Character.HumanoidRootPart.Size = Vector3.new(1, 1, 1) end},
        {name = "Trails", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/trails/main/source.lua"))() end},
        {name = "Aura", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/aura/main/source.lua"))() end},
        {name = "X-Ray", func = function() 
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0.5 end
            end
        end},
        {name = "Lighting Editor", func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScripts/lighting-editor/main/source.lua"))() end},
        {name = "Camera FOV", func = function() workspace.CurrentCamera.FieldOfView = 100 end}
    },
    ["Utility"] = {
        {name = "Rejoin Server", func = function() game:GetService("TeleportService"):Teleport(game.PlaceId, player) end},
        {name = "Server Hop", func = function() 
            local ts = game:GetService("TeleportService")
            local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
            for _, s in ipairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    ts:TeleportToPlaceInstance(game.PlaceId, s.id, player)
                    break
                end
            end
        end},
        {name = "Copy Game ID", func = function() setclipboard(tostring(game.PlaceId)) end},
        {name = "Copy User ID", func = function() setclipboard(tostring(player.UserId)) end},
        {name = "Open Console", func = function() game:GetService("StarterGui"):SetCore("DevConsoleVisible", true) end},
        {name = "Reset Character", func = function() player.Character:BreakJoints() end},
        {name = "Sit", func = function() 
            local seat = Instance.new("Seat", workspace)
            seat.Position = player.Character.HumanoidRootPart.Position
            seat:Sit(player.Character.Humanoid)
        end},
        {name = "WalkSpeed 50", func = function() player.Character.Humanoid.WalkSpeed = 50 end},
        {name = "JumpPower 100", func = function() player.Character.Humanoid.JumpPower = 100 end},
        {name = "Low Gravity", func = function() workspace.Gravity = 50 end},
        {name = "Normal Gravity", func = function() workspace.Gravity = 196.2 end},
        {name = "Lag Switch", func = function() 
            settings().Network.SendRate = 5
            settings().Network.IncomingReplicationLag = 0.5
        end},
        {name = "Auto Clicker", func = function() 
            while true do
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                wait(0.05)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                wait(0.05)
            end
        end},
        {name = "Screenshot", func = function() 
            local screenshot = game:GetService("ThumbnailGenerator"):ClickAsync("png", 1920, 1080)
        end},
        {name = "FPS Unlocker", func = function() setfpscap(240) end}
    }
}

-- ============================================================================
-- MAIN HUB GUI
-- ============================================================================
local function createHub()
    local hubGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    hubGui.Name = "NyxHub"
    hubGui.ResetOnSpawn = false
    hubGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local mainFrame = Instance.new("Frame", hubGui)
    mainFrame.Size = UDim2.new(0, 550, 0, 420)
    mainFrame.Position = UDim2.new(0.5, -275, 0.5, -210)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 0
    
    local mainStroke = Instance.new("UIStroke", mainFrame)
    mainStroke.Color = Color3.fromRGB(0, 255, 0)
    mainStroke.Thickness = 2
    
    local mainCorner = Instance.new("UICorner", mainFrame)
    mainCorner.CornerRadius = UDim.new(0, 8)
    
    -- Title Bar
    local titleBar = Instance.new("Frame", mainFrame)
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    titleBar.BorderSizePixel = 0
    
    local title = Instance.new("TextLabel", titleBar)
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "NYX SCRIPT HUB v1.0.0"
    title.TextColor3 = Color3.fromRGB(0, 255, 0)
    title.Font = Enum.Font.Code
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local closeBtn = Instance.new("TextButton", titleBar)
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.Code
    closeBtn.TextSize = 14
    closeBtn.MouseButton1Click:Connect(function() hubGui:Destroy() end)
    
    -- Tabs
    local tabFrame = Instance.new("Frame", mainFrame)
    tabFrame.Size = UDim2.new(1, 0, 0, 30)
    tabFrame.Position = UDim2.new(0, 0, 0, 30)
    tabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    tabFrame.BorderSizePixel = 0
    
    local tabs = {}
    local tabButtons = {}
    local contentFrame = Instance.new("Frame", mainFrame)
    contentFrame.Size = UDim2.new(1, -20, 0, 320)
    contentFrame.Position = UDim2.new(0, 10, 0, 70)
    contentFrame.BackgroundTransparency = 1
    
    local function createTab(name, category)
        local btn = Instance.new("TextButton", tabFrame)
        btn.Size = UDim2.new(0, 130, 1, 0)
        btn.Position = UDim2.new(0, #tabButtons * 130, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(150, 150, 150)
        btn.Font = Enum.Font.Code
        btn.TextSize = 12
        
        local frame = Instance.new("Frame", contentFrame)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Visible = false
        
        -- Scrolling Frame
        local scroll = Instance.new("ScrollingFrame", frame)
        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.BackgroundTransparency = 1
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.ScrollBarThickness = 6
        
        local list = Instance.new("UIListLayout", scroll)
        list.Padding = UDim.new(0, 5)
        list.SortOrder = Enum.SortOrder.LayoutOrder
        
        -- Script buttons
        local scripts = ScriptLibrary[category] or {}
        local yPos = 0
        for _, scriptData in ipairs(scripts) do
            local scriptBtn = Instance.new("TextButton", scroll)
            scriptBtn.Size = UDim2.new(1, -10, 0, 30)
            scriptBtn.Position = UDim2.new(0, 5, 0, yPos)
            scriptBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            scriptBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
            scriptBtn.BorderSizePixel = 1
            scriptBtn.Text = scriptData.name
            scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            scriptBtn.Font = Enum.Font.Code
            scriptBtn.TextSize = 12
            
            Instance.new("UICorner", scriptBtn).CornerRadius = UDim.new(0, 4)
            
            scriptBtn.MouseButton1Click:Connect(function()
                pcall(scriptData.func)
                scriptBtn.Text = scriptData.name .. " [DONE]"
                wait(1)
                scriptBtn.Text = scriptData.name
            end)
            
            yPos = yPos + 35
        end
        
        scroll.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
        
        table.insert(tabs, {btn = btn, frame = frame})
        table.insert(tabButtons, btn)
        
        btn.MouseButton1Click:Connect(function()
            for _, t in ipairs(tabs) do
                t.frame.Visible = false
                t.btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                t.btn.TextColor3 = Color3.fromRGB(150, 150, 150)
            end
            frame.Visible = true
            btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)
    end
    
    -- Create tabs
    createTab("Universal", "Universal")
    createTab("Game", "Game")
    createTab("Visual", "Visual")
    createTab("Utility", "Utility")
    
    -- Activate first tab
    if tabs[1] then
        tabs[1].frame.Visible = true
        tabs[1].btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        tabs[1].btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    
    -- Status bar
    local statusBar = Instance.new("TextLabel", mainFrame)
    statusBar.Size = UDim2.new(1, -20, 0, 25)
    statusBar.Position = UDim2.new(0, 10, 0, 390)
    statusBar.BackgroundTransparency = 1
    statusBar.Text = "Welcome, " .. player.Name .. " | Game: " .. game.PlaceId .. " | Scripts: 50+"
    statusBar.TextColor3 = Color3.fromRGB(0, 255, 0)
    statusBar.Font = Enum.Font.Code
    statusBar.TextSize = 11
    statusBar.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Hub Drag
    local hubDragToggle, hubDragStart, hubStartPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hubDragToggle = true
            hubDragStart = input.Position
            hubStartPos = mainFrame.Position
        end
    end)
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hubDragToggle = false
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if hubDragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - hubDragStart
            mainFrame.Position = UDim2.new(hubStartPos.X.Scale, hubStartPos.X.Offset + delta.X, hubStartPos.Y.Scale, hubStartPos.Y.Offset + delta.Y)
        end
    end)
end

-- ============================================================================
-- PASSWORD CHECK
-- ============================================================================
local attempts = 0

local function unlock()
    passGui:Destroy()
    createHub()
end

passBtn.MouseButton1Click:Connect(function()
    if passBox.Text == MASTER_KEY then
        unlock()
    else
        attempts = attempts + 1
        if attempts >= 3 then
            player:Kick("NYX HUB - Too many failed attempts.")
        else
            passBox.Text = ""
            errorLabel.Text = "Wrong! " .. (3 - attempts) .. " tries left."
        end
    end
end)

passBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if passBox.Text == MASTER_KEY then
            unlock()
        else
            attempts = attempts + 1
            if attempts >= 3 then
                player:Kick("NYX HUB - Too many failed attempts.")
            else
                passBox.Text = ""
                errorLabel.Text = "Wrong! " .. (3 - attempts) .. " tries left."
            end
        end
    end
end)

-- ============================================================================
-- STARTUP
-- ============================================================================
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NYX SCRIPT HUB",
        Text = "Enter password to continue.",
        Duration = 3
    })
end)

print("========================================")
print("NYX SCRIPT HUB - PASSWORD REQUIRED")
print("========================================")
