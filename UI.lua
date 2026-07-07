-- UI.lua

local Protection = require("Protection")

local UI = {}

function UI.Create()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NarakuUI"
    ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui


    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0,150,0,40)
    Button.Position = UDim2.new(0.5,-75,0.5,-20)
    Button.Text = "Anti AFK"

    Button.Parent = ScreenGui


    Button.MouseButton1Click:Connect(function()

        Protection.StartAntiAFK()

        Button.Text = "Anti AFK ON"

    end)

end


return UI
