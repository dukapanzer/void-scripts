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
remote.Parent = game:GetService("LocalizationService")
remote.Name = "ClearParts"
table.insert(remotes, remote2)

local remote3 = Instance.new("RemoteEvent")
remote3.Parent = game:GetService("LocalizationService")
remote3.Name = "setPartTransparency"
table.insert(remotes, remote3)

local model = Instance.new("Model")
model.Parent = workspace
model.Name = "Parts"

remote.OnServerEvent:connect(function(CFrame)
    local part = Instance.new("Part")
    table.insert(parts, part)
    part.Parent = model
    part.Size = "1, 1, 1"
    part.Transparency = 0.5
    part.CanCollide = false
    part.CanQuery = false
    part.CFrame = CFrame
end)

remote2.OnServerEvent:connect(function()
    if parts then
        parts:Destroy()
    else
        return if parts then
    end
end

humanoid.Died:connect(function()
    remotes:Destroy()
end

NLS[((
local plr = owner
local mouse = plr:GetMouse()
local createPart = game:GetService("ReplicatedStorage"):WaitForChild("CreatePart")
local clearParts = game:GetService("ReplicatedStorage"):WaitForChild("ClearParts")
local setTransparency = game:GetService("ReplicatedStorage"):WaitForChild("setPartTransparency")

mouse.Button1Down:connect(function()
    createPart:FireServer(mouse.Hit.CFrame)
end

mouse.KeyDown:connect(function(k)
    k = k:lower()
    
    if k == "R" then
        clearParts:FireServer()
    end

    if k == "F" then
        setTransparency:FireServer()
    end
))]
