local togglegui = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UserInputService = game:GetService("UserInputService")
local isMobile = false

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
 isMobile = true
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
 print("PC detected! Hiding toggle...")
end

--Properties:

togglegui.Name = "togglegui"
togglegui.Parent = game.CoreGui
togglegui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextButton.Parent = togglegui
TextButton.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.370791614, 0, 0.345360816, 0)
TextButton.Size = UDim2.new(0, 80, 0, 80)
TextButton.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton.Text = "Open Aftr Hub GUI"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 20.000
TextButton.TextWrapped = true
TextButton.Visible = false

if isMobile then
  TextButton.Visible = true
end

UICorner.Parent = TextButton

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
UIGradient.Parent = TextButton

TextButton.MouseButton1Click:Connect(function()
    keypress(Enum.KeyCode.LeftControl)
end)


local gui = TextButton

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
  local delta = input.Position - dragStart
  gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = gui.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        dragging = false
      end
    end)
  end
end)

gui.InputChanged:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    dragInput = input
  end
end)

UserInputService.InputChanged:Connect(function(input)
  if input == dragInput and dragging then
    update(input)
  end
end)
