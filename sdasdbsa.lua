local plr = owner
local plrgui = owner:WaitForChild("PlayerGui")
local remote = Instance.new("RemoteEvent")
remote.Parent = plrgui

-- Create BillboardGui for cursor
local CursorGui = Instance.new("BillboardGui")
CursorGui.Parent = workspace
CursorGui.Adornee = nil  -- Will be set to nil to follow mouse position
CursorGui.Size = UDim2.new(0, 32, 0, 32)  -- Adjust size as needed
CursorGui.StudsOffset = Vector3.new(0, 0, 0)
CursorGui.AlwaysOnTop = true

local CursorImage = Instance.new("ImageLabel")
CursorImage.Parent = CursorGui
CursorImage.Size = UDim2.new(1, 0, 1, 0)
CursorImage.BackgroundTransparency = 1
CursorImage.Image = "rbxassetid://107027142769343"  -- Use your cursor image asset ID

local function random(length)
    local characters = "0123456789abcdefghijklmnopqrstuvwxyz"
    local result = ""
    for i = 1, length do
        local rand = math.random(1, #characters)
        result = result .. string.sub(characters, rand, rand)
    end
    return result
end

local draggedPart = nil
local dragStartPos = nil
local dragStartCFrame = nil

remote.OnServerEvent:Connect(function(player, mousePos, isMouseDown, isDragging, draggedPartCFrame)
    CursorGui.StudsOffset = mousePos
    CursorImage.ImageColor3 = isMouseDown and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)

    if isDragging and draggedPart then
        draggedPart.CFrame = draggedPartCFrame
    end
end)

NLS([[
local plr = owner
local plrGui = owner:WaitForChild("PlayerGui")
local mouse = plr:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local remote = plrGui:WaitForChild("RemoteEvent")

local isMouseDown = false
local draggedPart = nil
local dragStartPos = nil
local dragStartCFrame = nil

local function updateCursor()
    local mousePos = Vector3.new(mouse.X, mouse.Y, 0)
    local isMouseDown = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
    
    local isDragging = draggedPart ~= nil
    local draggedPartCFrame = nil
    
    if isDragging then
        local delta = mousePos - dragStartPos
        draggedPartCFrame = dragStartCFrame * CFrame.new(delta.X / 50, -delta.Y / 50, 0)
    end
    
    remote:FireServer(mousePos, isMouseDown, isDragging, draggedPartCFrame)
end

mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target and target:IsA("BasePart") then
        draggedPart = target
        dragStartPos = Vector2.new(mouse.X, mouse.Y)
        dragStartCFrame = draggedPart.CFrame
    end
end)

mouse.Button1Up:Connect(function()
    draggedPart = nil
    dragStartPos = nil
    dragStartCFrame = nil
end)

RunService.RenderStepped:Connect(updateCursor)
]])

-- Function to make parts draggable
local function makeDraggable(part)
    part.CanCollide = false
    part.Anchored = true
end

-- Make some example parts draggable
for _, part in ipairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") and part.Name ~= "Terrain" then
        makeDraggable(part)
    end
end
