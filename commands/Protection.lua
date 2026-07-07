-- Protection.lua

local Protection = {}

function Protection.StartAntiAFK()
    local VirtualUser = game:GetService("VirtualUser")
    local Players = game:GetService("Players")

    local Player = Players.LocalPlayer

    Player.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)

    return true
end

return Protection
