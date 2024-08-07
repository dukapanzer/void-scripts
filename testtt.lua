local player = game:GetService("Players").LocalPlayer
local character = player.Character
local mouse = player:GetMouse()

local part = Instance.new("Part")
part.Color = Color3.new(0.8, 0.8, 0.8)
part.Parent = workspace
part.CFrame = character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 5, 0)

part.Anchored = true

local camera = workspace.CurrentCamera
camera.CameraSubject = part

local moveSpeed = 0.1
local lerpAlpha = 0.1

local pressedKeys = {}

local function onKeyPress(key)
    pressedKeys[key] = true
end

local function onKeyRelease(key)
    pressedKeys[key] = nil
end

mouse.KeyDown:Connect(function(key) onKeyPress(key:lower()) end)
mouse.KeyUp:Connect(function(key) onKeyRelease(key:lower()) end)

game:GetService("RunService").RenderStepped:Connect(function()
    local targetCFrame = part.CFrame
    
    if pressedKeys["w"] then
        targetCFrame = targetCFrame * CFrame.new(0, 0, -moveSpeed)
    end
    if pressedKeys["a"] then
        targetCFrame = targetCFrame * CFrame.new(-moveSpeed, 0, 0)
    end
    if pressedKeys["s"] then
        targetCFrame = targetCFrame * CFrame.new(0, 0, moveSpeed)
    end
    if pressedKeys["d"] then
        targetCFrame = targetCFrame * CFrame.new(moveSpeed, 0, 0)
    end
    if pressedKeys["r"] then
        targetCFrame = targetCFrame * CFrame.new(0, moveSpeed, 0)
    end
    if pressedKeys["f"] then
        targetCFrame = targetCFrame * CFrame.new(0, -moveSpeed, 0)
    end
    
    part.CFrame = part.CFrame:Lerp(targetCFrame, lerpAlpha)
end)
