local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton_3 = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -199, 0.9, -280)
Frame.Size = UDim2.new(0, 352, 0, 283)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(38, 0, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0767045468, 0, 0.123674914, 0)
TextLabel.Size = UDim2.new(0, 298, 0, 46)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FE BYPASS v2.4 By OrzScript"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

TextButton_3.Parent = Frame
TextButton_3.BackgroundColor3 = Color3.fromRGB(43, 0, 255)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(0.326704532, 0, 0.614840984, 0)
TextButton_3.Size = UDim2.new(0, 120, 0, 35)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "FE BYPASS"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 14.000
TextButton_3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/FE-Bypass-TOP-SECRET-/main/FE%20Bypass%20V263.264.577.lua",true))()
end)
