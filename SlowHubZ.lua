local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Gui = Instance.new("ScreenGui")
Gui.Name = "SlowHubZ_WindUI"
Gui.ResetOnSpawn = false
Gui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 320)
Frame.Position = UDim2.new(0.5, -210, 0.5, -160)
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
Frame.BorderSizePixel = 0
Frame.Parent = Gui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true
Frame.Name = "MainFrame"

-- Shadow Effect (simulated with UIStroke and UIGradient)
local Shadow = Instance.new("UIStroke")
Shadow.Parent = Frame
Shadow.Color = Color3.fromRGB(50, 50, 55)
Shadow.Thickness = 1
Shadow.Transparency = 0.6

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(32, 32, 36)
TitleBar.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Slow Hub Z"
Title.TextColor3 = Color3.fromRGB(220, 220, 230)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
CloseButton.Text = "✕"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 24
CloseButton.TextColor3 = Color3.fromRGB(180, 180, 190)
CloseButton.Parent = TitleBar
CloseButton.AutoButtonColor = false

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(220, 70, 70)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    CloseButton.TextColor3 = Color3.fromRGB(180, 180, 190)
end)

CloseButton.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 36)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(28, 28, 31)
TabContainer.Parent = Frame

local tabs = {"Main", "Settings"}
local tabButtons = {}
local contentFrames = {}
local currentTab = nil

local function setActiveTab(tabName)
    for name, frame in pairs(contentFrames) do
        frame.Visible = (name == tabName)
    end
    for _, btn in pairs(tabButtons) do
        if btn.Name == tabName then
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            btn.TextColor3 = Color3.fromRGB(220, 220, 230)
        else
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 31)
            btn.TextColor3 = Color3.fromRGB(150, 150, 160)
        end
    end
    currentTab = tabName
end

local function createTab(name, index)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.Position = UDim2.new(0, (index - 1) * 100, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 31)
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(150, 150, 160)
    btn.Parent = TabContainer
    btn.AutoButtonColor = false

    btn.MouseEnter:Connect(function()
        if currentTab ~= name then
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            btn.TextColor3 = Color3.fromRGB(190, 190, 200)
        end
    end)

    btn.MouseLeave:Connect(function()
        if currentTab ~= name then
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 31)
            btn.TextColor3 = Color3.fromRGB(150, 150, 160)
        end
    end)

    btn.MouseButton1Click:Connect(function()
        setActiveTab(name)
    end)

    tabButtons[name] = btn
end

for i, tabName in ipairs(tabs) do
    createTab(tabName, i)
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, -76)
    content.Position = UDim2.new(0, 0, 0, 76)
    content.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
    content.Visible = false
    content.Parent = Frame
    contentFrames[tabName] = content
end

setActiveTab(tabs[1])

-- Slow Walk Button in Main tab
local slowWalkButton = Instance.new("TextButton")
slowWalkButton.Size = UDim2.new(0.8, 0, 0, 48)
slowWalkButton.Position = UDim2.new(0.1, 0, 0.1, 0)
slowWalkButton.BackgroundColor3 = Color3.fromRGB(48, 48, 52)
slowWalkButton.Text = "Activate Slow Walk"
slowWalkButton.Font = Enum.Font.GothamBold
slowWalkButton.TextSize = 20
slowWalkButton.TextColor3 = Color3.fromRGB(210, 210, 215)
slowWalkButton.Parent = contentFrames["Main"]
slowWalkButton.AutoButtonColor = false

slowWalkButton.MouseEnter:Connect(function()
    slowWalkButton.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
end)

slowWalkButton.MouseLeave:Connect(function()
    slowWalkButton.BackgroundColor3 = Color3.fromRGB(48, 48, 52)
end)

slowWalkButton.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        for i = 1, 10 do
            char.Humanoid.WalkSpeed = i
            wait(1)
        end
    end
end)

-- Example toggle switch in Settings tab
local function createToggle(parent, pos, labelText, default)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.8, 0, 0, 40)
    container.Position = pos
    container.BackgroundTransparency = 1
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(200, 200, 210)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 25)
    toggle.Position = UDim2.new(0.75, 0, 0.15, 0)
    toggle.BackgroundColor3 = default and Color3.fromRGB(94, 150, 255) or Color3.fromRGB(80, 80, 80)
    toggle.Text = ""
    toggle.AutoButtonColor = false
    toggle.Parent = container

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 20, 0, 20)
    circle.Position = default and UDim2.new(0.65, 0, 0.1, 0) or UDim2.new(0.05, 0, 0.1, 0)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.AnchorPoint = Vector2.new(0.5, 0.5)
    circle.Parent = toggle
    circle.Name = "Circle"
    circle.ClipsDescendants = true
    circle.BorderSizePixel = 0
    circle.Position = default and UDim2.new(0.65, 0, 0.5, 0) or UDim2.new(0.15, 0, 0.5, 0)
    circle.AnchorPoint = Vector2.new(0.5, 0.
