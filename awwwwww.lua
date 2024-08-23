local plr = owner
local char = owner.Character
local humanoid = char:WaitForChild("Humanoid")
remotes = {}
parts = {}

local remote1 = Instance.new("RemoteEvent")
remote1.Parent = game:GetService("LocalizationService")
remote1.Name = "CreatePart"
table.insert(remotes, remote1)

local remote2 = Instance.new("RemoteEvent")
remote2.Parent = game:GetService("LocalizationService")
remote2.Name = "ClearParts"
table.insert(remotes, remote2)

local remote3 = Instance.new("RemoteEvent")
remote3.Parent = game:GetService("LocalizationService")
remote3.Name = "UndoPart"
table.insert(remotes, remote3)

local model = Instance.new("Model")
model.Parent = workspace
model.Name = "Parts"

local function roundToIncrement(number, increment)
    return math.round(number / increment) * increment
end

remote1.OnServerEvent:Connect(function(player, position)
    local part = Instance.new("Part")
    part.Parent = model
    part.Anchored = true
    part.Size = Vector3.new(1, 1, 1)
    part.Transparency = 0
    part.CanCollide = true
    part.CanQuery = false
    part.CFrame = CFrame.new(position)
    table.insert(parts, part)
end)

remote2.OnServerEvent:Connect(function()
    if #parts > 0 then
        for _, part in ipairs(parts) do
            part:Destroy()
        end
        parts = {}
    end
end)

remote3.OnServerEvent:Connect(function()
    if #parts > 0 then
        local lastPart = table.remove(parts)
        lastPart:Destroy()
    end
end)

humanoid.Died:Connect(function()
    if model then
        model:Destroy()
    end

    for _, remote in ipairs(remotes) do
        remote:Destroy()
    end
    remotes = {}
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local createPart = game:GetService("LocalizationService"):WaitForChild("CreatePart")
local clearParts = game:GetService("LocalizationService"):WaitForChild("ClearParts")
local undoPart = game:GetService("LocalizationService"):WaitForChild("UndoPart")

local increment = 0
local previewPart = Instance.new("Part")
previewPart.Anchored = true
previewPart.CanCollide = false
previewPart.Size = Vector3.new(1, 1, 1)
previewPart.Transparency = 0.5
previewPart.Parent = workspace

mouse.TargetFilter = previewPart

local function roundToIncrement(number, increment)
    return math.round(number / increment) * increment
end

local function updatePreviewPart()
    local targetPos = mouse.Hit.Position
    local roundedX = roundToIncrement(targetPos.X, increment)
    local roundedY = roundToIncrement(targetPos.Y, increment)
    local roundedZ = roundToIncrement(targetPos.Z, increment)
    previewPart.CFrame = CFrame.new(roundedX, roundedY, roundedZ)
    mouse.TargetFilter = previewPart
end

mouse.Move:Connect(updatePreviewPart)

while task.wait() do
    mouse.Button1Down:Connect(function()
        local targetPos = previewPart.Position
        createPart:FireServer(targetPos)
    end)
end

mouse.KeyDown:Connect(function(k)
    k = k:lower()
    if k == "r" then
        clearParts:FireServer()
    elseif k == "z" then
        undoPart:FireServer()
        print("Undo last part")
    end
end)

game:GetService("RunService").RenderStepped:Connect(updatePreviewPart)
]])
