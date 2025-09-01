-- Load WindUI library
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/WindUI.lua"))()

-- Create a window with WindUI
local window = WindUI:CreateWindow("Slow Hub Z")

-- Add a button to the window
window:AddButton({
    Text = "Activate Slow Walk",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            for i = 1, 10 do
                char.Humanoid.WalkSpeed = i
                wait(1)
            end
        end
    end
})

-- Show the UI
window:Show()
