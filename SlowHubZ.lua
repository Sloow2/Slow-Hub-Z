-- Slow Hub Z Main Script (GUI + Slow Walk Feature)
local Gui = Instance.new("ScreenGui")
Gui.Name = "SlowHubZ"
Gui.ResetOnSpawn = false
Gui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Parent = Gui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Slow Hub Z"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 40)
Button.Position = UDim2.new(0.1, 0, 0.5, -20)
Button.Text = "Activate Slow Walk"
Button.Font = Enum.Font.Gotham
Button.TextSize = 18
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        for i = 1, 10 do
            char.Humanoid.WalkSpeed = i
            wait(1)
        end
    end
end)
