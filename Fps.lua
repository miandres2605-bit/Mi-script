-- Janela simples
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

Frame.Size = UDim2.new(0, 250, 0, 120)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Parent = ScreenGui

-- Título RGB
Title.Text = "Menu FPS"
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = Frame

-- Gradiente RGB animado
UIGradient.Parent = Title

task.spawn(function()
    while true do
        for hue = 0, 1, 0.01 do
            UIGradient.Color = ColorSequence.new(Color3.fromHSV(hue, 1, 1))
            task.wait(0.03)
        end
    end
end)

-- Botão para ajustar qualidade
ToggleButton.Text = "Modo FPS"
ToggleButton.Size = UDim2.new(0, 200, 0, 40)
ToggleButton.Position = UDim2.new(0.5, -100, 0.6, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.new(1,1,1)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 20
ToggleButton.Parent = Frame

local fpsMode = false

ToggleButton.MouseButton1Click:Connect(function()
    fpsMode = not fpsMode

    if fpsMode then
        ToggleButton.Text = "FPS ON"
        
        -- Ajustes seguros
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        workspace.GlobalShadows = false
        game.Lighting.FogEnd = 50
        
    else
        ToggleButton.Text = "FPS OFF"

        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        workspace.GlobalShadows = true
        game.Lighting.FogEnd = 100000
    end
end)
