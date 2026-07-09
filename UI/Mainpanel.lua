local MainPanel = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Fungsi utama untuk inisialisasi Main Panel
function MainPanel.Init(UI_Elements)
    local Panel = UI_Elements.Panel_3
    local OpenBtn = UI_Elements.OpenButton_bc
    local BackBtn = UI_Elements.BackButton_b5
    local MainBtn = UI_Elements.MainButton_bb -- Asumsi dari struktur Anda
    local InfoBtn = UI_Elements.InfoButton_b8
    
    local CardMain = UI_Elements.CardMain_24
    local CardInfo = UI_Elements.CardInfo_5

    -- 1. SISTEM DRAGGABLE
    local dragging, dragInput, dragStart, startPos
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

    -- 2. SISTEM BUKA / TUTUP
    local function TogglePanel(state)
        local goal = state and {Visible = true} or {Visible = false}
        -- Tambahkan animasi scale jika perlu
        Panel.Visible = state
        OpenBtn.Visible = not state
    end

    OpenBtn.MouseButton1Click:Connect(function() TogglePanel(true) end)
    BackBtn.MouseButton1Click:Connect(function() TogglePanel(false) end)

    -- 3. LOGIKA TAB SWITCHING
    local function SwitchTab(target)
        CardMain.Visible = (target == "Main")
        CardInfo.Visible = (target == "Info")
    end

    MainBtn.MouseButton1Click:Connect(function() SwitchTab("Main") end)
    InfoBtn.MouseButton1Click:Connect(function() SwitchTab("Info") end)
    
    -- Default tab
    SwitchTab("Main")
end

return MainPanel
