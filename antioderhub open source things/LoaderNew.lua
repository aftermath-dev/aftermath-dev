local TweenService = game:GetService("TweenService")

-- Création de l'interface
local CCOpeningScreen = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local BlurEffect = Instance.new("BlurEffect")
local ImageLogo = Instance.new("ImageLabel")
local T1 = Instance.new("TextLabel")
local T2 = Instance.new("TextLabel")
local T3 = Instance.new("TextLabel")
local LoadBar = Instance.new("Frame")
local LoadBarFill = Instance.new("Frame")
local Corner = Instance.new("UICorner")
local CornerMain = Instance.new("UICorner")

-- Configuration de l'effet de flou
BlurEffect.Parent = game:GetService("Lighting")
BlurEffect.Size = 0

-- Configuration de base
CCOpeningScreen.Name = "CCOpeningScreen"
CCOpeningScreen.Parent = game.CoreGui
CCOpeningScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = CCOpeningScreen
MainFrame.Active = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 0, 0, 180)
CornerMain.CornerRadius = UDim.new(0, 10)
CornerMain.Parent = MainFrame

-- Configuration de l'image
ImageLogo.Name = "ImageLogo"
ImageLogo.Parent = MainFrame
ImageLogo.BackgroundTransparency = 1
ImageLogo.Position = UDim2.new(0.05, 0, 0.5, 0)
ImageLogo.AnchorPoint = Vector2.new(0, 0.5)
ImageLogo.Size = UDim2.new(0, 70, 0, 70)
ImageLogo.Image = "rbxassetid://128216856751714"
ImageLogo.ImageTransparency = 1

-- Textes avec effets avancés
local function createTextEffect(label)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    })
    gradient.Parent = label
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 1
    stroke.Thickness = 1
    stroke.Parent = label
    
    return stroke, gradient
end

T1.Name = "T1"
T1.Parent = MainFrame
T1.AnchorPoint = Vector2.new(0, 0.5)
T1.BackgroundTransparency = 1
T1.Position = UDim2.new(0.35, 0, 0.35, 0)
T1.Size = UDim2.new(0, 180, 0, 25)
T1.Font = Enum.Font.GothamBold
T1.Text = "Welcome To"
T1.TextColor3 = Color3.fromRGB(255, 255, 255)
T1.TextSize = 20
T1.TextTransparency = 1
T1.TextXAlignment = Enum.TextXAlignment.Left
local stroke1, gradient1 = createTextEffect(T1)

T2.Name = "T2"
T2.Parent = MainFrame
T2.AnchorPoint = Vector2.new(0, 0.5)
T2.BackgroundTransparency = 1
T2.Position = UDim2.new(0.35, 0, 0.55, 0)
T2.Size = UDim2.new(0, 180, 0, 35)
T2.Font = Enum.Font.GothamBlack
T2.Text = "AntiOder Hub!"
T2.TextColor3 = Color3.fromRGB(255, 255, 255)
T2.TextSize = 30
T2.TextTransparency = 1
T2.TextXAlignment = Enum.TextXAlignment.Left
local stroke2, gradient2 = createTextEffect(T2)

T3.Name = "T3"
T3.Parent = MainFrame
T3.AnchorPoint = Vector2.new(0.5, 0.5)
T3.BackgroundTransparency = 1
T3.Position = UDim2.new(0.5, 0, 0.8, 0)
T3.Size = UDim2.new(0.9, 0, 0, 15)
T3.Font = Enum.Font.Gotham
T3.TextColor3 = Color3.fromRGB(200, 200, 200)
T3.TextSize = 14
T3.TextTransparency = 1

-- Barre de chargement améliorée
LoadBar.Name = "LoadBar"
LoadBar.Parent = MainFrame
LoadBar.AnchorPoint = Vector2.new(0.5, 0.5)
LoadBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LoadBar.Position = UDim2.new(0.5, 0, 0.92, 0)
LoadBar.Size = UDim2.new(0.9, 0, 0, 8)
Corner.CornerRadius = UDim.new(0, 4)
Corner.Parent = LoadBar

LoadBarFill.Name = "LoadBarFill"
LoadBarFill.Parent = LoadBar
LoadBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadBarFill.Size = UDim2.new(0, 0, 1, 0)
local CornerFill = Corner:Clone()
CornerFill.Parent = LoadBarFill

-- Fonction d'animation améliorée
local function animate(object, properties, time, style, direction, delay)
    delay = delay or 0
    wait(delay)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(time, Enum.EasingStyle[style], Enum.EasingDirection[direction]),
        properties
    )
    tween:Play()
    return tween
end

-- Animation des gradients
local function animateGradient(gradient)
    local offset = 0
    while wait() do
        offset = (offset + 0.02) % 1
        gradient.Offset = Vector2.new(offset, offset)
    end
end

-- Script principal
local function main()
    -- Effet de flou initial
    animate(BlurEffect, {Size = 20}, 0.5, "Quad", "Out")
    
    -- Animation d'ouverture
    wait(0.3)
    animate(MainFrame, {Size = UDim2.new(0, 340, 0, 180)}, 0.8, "Back", "Out")
    
    -- Animation de l'image
    wait(0.2)
    animate(ImageLogo, {ImageTransparency = 0}, 0.6, "Quad", "Out")
    
    -- Animation des textes avec effets
    wait(0.3)
    
    -- Animation T1
    animate(T1, {TextTransparency = 0}, 0.6, "Quad", "Out")
    animate(T1, {Position = UDim2.new(0.35, 0, 0.35, 0)}, 0.8, "Back", "Out")
    animate(stroke1, {Transparency = 0.8}, 0.6, "Quad", "Out")
    
    wait(0.2)
    
    -- Animation T2
    animate(T2, {TextTransparency = 0}, 0.6, "Quad", "Out")
    animate(T2, {Position = UDim2.new(0.35, 0, 0.55, 0)}, 0.8, "Back", "Out")
    animate(stroke2, {Transparency = 0.8}, 0.6, "Quad", "Out")
    
    -- Démarrage des animations de gradient
    coroutine.wrap(function() animateGradient(gradient1) end)()
    coroutine.wrap(function() animateGradient(gradient2) end)()
    
    wait(0.2)
    animate(T3, {TextTransparency = 0}, 0.6, "Quad", "Out")
    
    -- Animation de la barre de chargement avec messages
    local loadingSteps = {
        {progress = 0.2, text = "System initialization...", time = 0.6},
        {progress = 0.4, text = "Loading modules...", time = 0.5},
        {progress = 0.6, text = "Configuring interface...", time = 0.5},
        {progress = 0.8, text = "Final preparation...", time = 0.4},
        {progress = 1, text = "Ready!", time = 0.3}
    }
    
    for _, step in ipairs(loadingSteps) do
        T3.Text = step.text
        animate(LoadBarFill, {
            Size = UDim2.new(step.progress, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, step.time, "Quad", "Out")
        wait(step.time + 0.2)
    end
    
    wait(0.8)
    
    -- Animation de fermeture
    animate(ImageLogo, {ImageTransparency = 1}, 0.3, "Quad", "In")
    animate(LoadBarFill, {BackgroundTransparency = 1}, 0.3, "Quad", "In")
    animate(LoadBar, {BackgroundTransparency = 1}, 0.3, "Quad", "In")
    animate(T1, {TextTransparency = 1, Position = UDim2.new(0.35, -50, 0.35, 0)}, 0.3, "Quad", "In")
    animate(T2, {TextTransparency = 1, Position = UDim2.new(0.35, -50, 0.55, 0)}, 0.3, "Quad", "In")
    animate(T3, {TextTransparency = 1}, 0.3, "Quad", "In")
    animate(BlurEffect, {Size = 0}, 0.5, "Quad", "In")
    
    wait(0.3)
    local finalTween = animate(MainFrame, {Size = UDim2.new(0, 0, 0, 180)}, 0.5, "Back", "In")
    
    -- Attendre que l'animation finale soit terminée
    finalTween.Completed:Wait()
    
    -- Nettoyer
    CCOpeningScreen:Destroy()
    BlurEffect:Destroy()
    
    -- Exécuter le loadstring une fois l'animation terminée
    loadstring(game:HttpGet("https://raw.githubusercontent.com/antioderhub/antioderhub/refs/heads/main/AntiOderHub3.30.lua"))()
end
coroutine.wrap(main)()
