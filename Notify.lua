-- Title: Notification Title
-- Desc: Notification Description
-- Type: Info, Success, Warn, Error
-- Duration: Notification Time Duration
-- You can change or mod it :)
-- Made by @C00l_Ch4os on Roblox, @torawa_noya / @niroko_kinawa On Discord
-- Notification in line '275 to 280'

local TweenService = game:GetService("TweenService")
local ParentTarget = game:GetService("CoreGui")

shared.NoyaActiveNotifications = shared.NoyaActiveNotifications or {}
local activeNotifications = shared.NoyaActiveNotifications

local NoyaUI = {}

local function updatePositions()
	for i, notif in ipairs(activeNotifications) do
		if notif and notif.Frame then
			local targetY = 165 - ((#activeNotifications - i) * 72.5)
			local moveTween = TweenService:Create(notif.Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 550, 0, targetY)})
			moveTween:Play()
		end
	end
end

function NoyaUI:Notify(config)
	local titleText = config.Title or "Notification Title"
	local descText = config.Desc or "Notification Description"
	local duration = config.Duration or 5
	local notifType = config.Type or "Info"

	local typeColor = Color3.fromRGB(158, 198, 255)
	local iconId = "rbxassetid://70718918423383"

	if notifType == "Error" then
		typeColor = Color3.fromRGB(255, 82, 82)
		iconId = "rbxassetid://113114601887005"
	elseif notifType == "Success" then
		typeColor = Color3.fromRGB(145, 255, 128)
		iconId = "rbxassetid://18567015051"
	elseif notifType == "Warn" then
		typeColor = Color3.fromRGB(255, 225, 117)
		iconId = "rbxassetid://14863060512"
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "NoyaNotificationLibrary"
	ScreenGui.Parent = ParentTarget
	ScreenGui.ClipToDeviceSafeArea = false
	ScreenGui.ResetOnSpawn = false

	local Folder = Instance.new("Folder")
	Folder.Name = "NoyaUI"
	Folder.Parent = ScreenGui

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Folder
	MainFrame.BorderSizePixel = 0
	MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.Size = UDim2.new(0, 200, 0, 55)
	MainFrame.Position = UDim2.new(1, 50, 0, 165)

	local Glow = Instance.new("ImageLabel")
	Glow.Name = "Glow"
	Glow.Parent = MainFrame
	Glow.ZIndex = 0
	Glow.BorderSizePixel = 0
	Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glow.ImageTransparency = 0.8
	Glow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	Glow.Image = "rbxassetid://4654143143"
	Glow.Size = UDim2.new(0, 375, 0, 125)
	Glow.BackgroundTransparency = 1
	Glow.Position = UDim2.new(0, -85, 0, -35)

	local NotificationTitle = Instance.new("TextLabel")
	NotificationTitle.Name = "NotificationTitle"
	NotificationTitle.Parent = MainFrame
	NotificationTitle.BorderSizePixel = 0
	NotificationTitle.TextSize = 14
	NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
	NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationTitle.BackgroundTransparency = 1
	NotificationTitle.Size = UDim2.new(0, 180, 0, 20)
	NotificationTitle.Text = titleText
	NotificationTitle.Position = UDim2.new(0, 20, 0, 0)

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, typeColor), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))}
	UIGradient.Parent = NotificationTitle

	local UICorner_Main = Instance.new("UICorner")
	UICorner_Main.Parent = MainFrame

	local DurationFrame = Instance.new("Frame")
	DurationFrame.Name = "DurationFrame"
	DurationFrame.Parent = MainFrame
	DurationFrame.BorderSizePixel = 0
	DurationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DurationFrame.Size = UDim2.new(0, 150, 0, 5)
	DurationFrame.Position = UDim2.new(0, 25, 0, 60)
	DurationFrame.BackgroundTransparency = 0.7

	local UICorner_Duration = Instance.new("UICorner")
	UICorner_Duration.Parent = DurationFrame

	local Border = Instance.new("ImageLabel")
	Border.Name = "Border"
	Border.Parent = MainFrame
	Border.BorderSizePixel = 0
	Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Border.ImageTransparency = 0.7
	Border.Image = "rbxassetid://120997033468887"
	Border.Size = UDim2.new(0, 70, 0, 70)
	Border.BackgroundTransparency = 1
	Border.Rotation = -90
	Border.Position = UDim2.new(0, 155, 0, -25)

	local TypeEffect = Instance.new("Frame")
	TypeEffect.Name = "TypeEffect"
	TypeEffect.Parent = MainFrame
	TypeEffect.ZIndex = 0
	TypeEffect.BorderSizePixel = 0
	TypeEffect.BackgroundColor3 = typeColor
	TypeEffect.Size = UDim2.new(0, 20, 0, 55)
	TypeEffect.Position = UDim2.new(0, -3, 0, 0)

	local UICorner_Type = Instance.new("UICorner")
	UICorner_Type.Parent = TypeEffect

	local CloseButton = Instance.new("TextButton")
	CloseButton.Name = "CloseButton"
	CloseButton.Parent = MainFrame
	CloseButton.BorderSizePixel = 0
	CloseButton.TextXAlignment = Enum.TextXAlignment.Center
	CloseButton.TextSize = 18
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextYAlignment = Enum.TextYAlignment.Center
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CloseButton.BackgroundTransparency = 1
	CloseButton.Size = UDim2.new(0, 20, 0, 20)
	CloseButton.AnchorPoint = Vector2.new(0, 0)
	CloseButton.Position = UDim2.new(0, 170, 0, 0)
	CloseButton.Text = "x"

	local NotificationDescription = Instance.new("TextLabel")
	NotificationDescription.Name = "NotificationDescription"
	NotificationDescription.Parent = MainFrame
	NotificationDescription.TextWrapped = true
	NotificationDescription.BorderSizePixel = 0
	NotificationDescription.TextSize = 10
	NotificationDescription.TextXAlignment = Enum.TextXAlignment.Left
	NotificationDescription.TextTransparency = 0.6
	NotificationDescription.TextYAlignment = Enum.TextYAlignment.Top
	NotificationDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDescription.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	NotificationDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
	NotificationDescription.BackgroundTransparency = 1
	NotificationDescription.Size = UDim2.new(0, 190, 0, 28)
	NotificationDescription.Text = descText
	NotificationDescription.Position = UDim2.new(0, 10, 0, 18)

	local FrameEffect = Instance.new("Frame")
	FrameEffect.Name = "FrameEffect"
	FrameEffect.Parent = MainFrame
	FrameEffect.BorderSizePixel = 0
	FrameEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FrameEffect.Size = UDim2.new(0, 200, 0, 20)
	FrameEffect.Position = UDim2.new(0, 0, 0, 35)
	FrameEffect.BackgroundTransparency = 0.85

	local UICorner_Effect = Instance.new("UICorner")
	UICorner_Effect.Parent = FrameEffect

	local FrameEffect2 = Instance.new("Frame")
	FrameEffect2.Name = "FrameEffect2"
	FrameEffect2.Parent = FrameEffect
	FrameEffect2.BorderSizePixel = 0
	FrameEffect2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	FrameEffect2.Size = UDim2.new(0, 200, 0, 12)

	local TypeIcon = Instance.new("ImageLabel")
	TypeIcon.Name = "TypeIcon"
	TypeIcon.Parent = MainFrame
	TypeIcon.BorderSizePixel = 0
	TypeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TypeIcon.ImageColor3 = typeColor
	TypeIcon.Image = iconId
	TypeIcon.Size = UDim2.new(0, 15, 0, 15)
	TypeIcon.BackgroundTransparency = 1
	TypeIcon.Position = UDim2.new(0, 3, 0, 3)

	local notifData = {Frame = MainFrame, Gui = ScreenGui}
	table.insert(activeNotifications, notifData)

	local isClosing = false
	local tweenBar = TweenService:Create(DurationFrame, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 5)})

	local function closeUI(forcedByButton)
		if isClosing then return end
		isClosing = true
		
		if tweenBar and tweenBar.PlaybackState == Enum.PlaybackState.Playing then
			tweenBar:Cancel()
		end

		if forcedByButton then
			local buttonTween = TweenService:Create(CloseButton, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				TextColor3 = Color3.fromRGB(255, 82, 82),
				Rotation = 360,
				TextTransparency = 1
			})
			
			local barScaleTween = TweenService:Create(DurationFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 0, 0, 5)
			})
			
			local barColorTween = TweenService:Create(DurationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = Color3.fromRGB(255, 82, 82)
			})

			buttonTween:Play()
			barScaleTween:Play()
			barColorTween:Play()
			
			task.wait(0.35)
		end

		for i, v in ipairs(activeNotifications) do
			if v == notifData then
				table.remove(activeNotifications, i)
				break
			end
		end
		
		updatePositions()
		
		if MainFrame and MainFrame.Parent then
			local tweenOut = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(1, 50, 0, MainFrame.Position.Y.Offset)})
			tweenOut:Play()
			tweenOut.Completed:Connect(function()
				ScreenGui:Destroy()
			end)
		end
	end

	CloseButton.MouseButton1Click:Connect(function()
		closeUI(true)
	end)

	local targetY = 165 - ((#activeNotifications - 1) * 72.5)
	local tweenIn = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 550, 0, targetY)})

	tweenIn:Play()
	updatePositions()

	tweenIn.Completed:Connect(function()
		if not isClosing and tweenBar then
			tweenBar:Play()
		end
	end)

	tweenBar.Completed:Connect(function()
		if not isClosing then
			closeUI(false)
		end
	end)
end

NoyaUI:Notify({
	Title = "Notification Title",
	Desc = "Notification Description",
	Type = "Info",
	Duration = 5
})
