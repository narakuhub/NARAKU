local MainPanel = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function MainPanel.Init(UI)
    -- Pastikan semua variabel tidak nil sebelum digunakan
    local Panel = UI["Panel_3"]
    local OpenBtn = UI["OpenButton_bc"]
    local BackBtn = UI["BackButton_b5"]
    local MainBtn = UI["MainButton_bb"]
    local InfoBtn = UI["InfoButton_b8"]
    
    local CardMain = UI["CardMain_24"]
    local CardInfo = UI["CardInfo_5"]

    if not Panel then warn("Panel_3 tidak ditemukan dalam UI!") return end

    -- 1. SISTEM DRAGGABLE
    local dragging, dragStart, startPos
    
    Panel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Panel.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    -- 2. SISTEM BUKA / TUTUP (Dengan Pengecekan)
    if OpenBtn and BackBtn then
        OpenBtn.MouseButton1Click:Connect(function()
            Panel.Visible = true
            OpenBtn.Visible = false
        end)
        
        BackBtn.MouseButton1Click:Connect(function()
            Panel.Visible = false
            OpenBtn.Visible = true
        end)
    end

    -- 3. LOGIKA TAB SWITCHING
    if MainBtn and InfoBtn and CardMain and CardInfo then
        local function SwitchTab(target)
            CardMain.Visible = (target == "Main")
            CardInfo.Visible = (target == "Info")
        end

        MainBtn.MouseButton1Click:Connect(function() SwitchTab("Main") end)
        InfoBtn.MouseButton1Click:Connect(function() SwitchTab("Info") end)
        
        SwitchTab("Main") -- Default tab
    end
end

return MainPanel
