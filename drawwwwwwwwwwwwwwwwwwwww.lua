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

local remote4 = Instance.new("RemoteEvent")
remote4.Parent = game:GetService("LocalizationService")
remote4.Name = "UndoPart"
table.insert(remotes, remote4)

local model = Instance.new("Model")
model.Parent = workspace
model.Name = "Parts"

remote1.OnServerEvent:Connect(function(player, mouse)
    local part = Instance.new("Part")
    part.Parent = model
    part.Anchored = true
    part.Size = Vector3.new(1, 1, 1)
    part.Transparency = 0.5
    part.CanCollide = false
    part.CanQuery = false
    part.CFrame = CFrame.new(mouse)
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
    for _, part in pairs(parts) do
        if typeof(part) == "BasePart" then
            part.Transparency = 0
        end
    end
end)

remote4.OnServerEvent:Connect(function()
    if #parts > 0 then
        local lastPart = table.remove(parts)
        lastPart:Destroy()
    end
end)

humanoid.Died:Connect(function()
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
local setTransparency = game:GetService("LocalizationService"):WaitForChild("setPartTransparency")
local undoPart = game:GetService("LocalizationService"):WaitForChild("UndoPart")

mouse.Button1Down:Connect(function()
    createPart:FireServer(mouse.Hit.Position)
end)

mouse.KeyDown:Connect(function(k)
    k = k:lower()
    if k == "r" then
        clearParts:FireServer()
    elseif k == "f" then
        setTransparency:FireServer()
    elseif k == "z" then
        undoPart:FireServer()
    end
end)
]])
