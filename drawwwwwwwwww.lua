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
remote3.Name = "setPartTransparency"
table.insert(remotes, remote3)

local model = Instance.new("Model")
model.Parent = workspace
model.Name = "Parts"

remote2.OnServerEvent:connect(function(mouse.Hit.Position))
    local part = Instance.new("Part")
    table.insert(parts, part)
    part.Parent = model
    part.Size = "1, 1, 1"
    part.Transparency = 0.5
    part.CanCollide = false
    part.CanQuery = false
    part.CFrame = CFrame.new(mouse.Hit.Position)
end)

remote2.OnServerEvent:connect(function()
    if parts then
        parts:Destroy()
    else
        return
    end
end)

remote3.OnServerEvent:connect(function(CFrame)
    if parts then
        parts.Transparency = 1
    else
        return
    end      
end)

humanoid.Died:connect(function()
    if remotes then
        remotes:Destroy()
    end
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local createPart = game:GetService("LocalizationService"):WaitForChild("CreatePart")
local clearParts = game:GetService("LocalizationService"):WaitForChild("ClearParts")
local setTransparency = game:GetService("LocalizationService"):WaitForChild("setPartTransparency")

mouse.Button1Down:connect(function()
    createPart:FireServer(mouse.Hit.Position)
end)

mouse.KeyDown:connect(function(k)
    k = k:lower()
    
    if k == "R" then
        clearParts:FireServer()
    end

    if k == "F" then
        setTransparency:FireServer()
    end
end)
]])
