local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Anchored = false
cursor.Parent = script

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
remote.Name = "remote1"
cursor.Parent = char
local remote2 = Instance.new("RemoteEvent")
remote2.Parent = char
remote2.Name = "remote2"
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")
image_label.Size = UDim2.new(1, 0, 1, 0)
image_label.Parent.Size = UDim2.new(1, 0, 1, 0)

game:GetService("RunService").Heartbeat:connect(function()
	cursor:SetNetworkOwner(plr)
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("remote1")
local remote2 = char:WaitForChild("remote2")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera
local right_held = false
local mouse_held = false

local mouse_filter = {}
table.insert(mouse_filter, cursor)

local fakePart = Instance.new("Part")
fakePart.Size = cursor.Size
fakePart.Anchored = true
fakePart.Parent = workspace
fakePart.Transparency = 1
	
local hit_part = nil

hb:Connect(function()
	local mouse_position = mouse.Hit.Position
	fakePart.CFrame = fakePart.CFrame:Lerp(CFrame.new(mouse_position), 0.4)
	cursor.CFrame = fakePart.CFrame
	for _, table in ipairs(mouse_filter) do
    		mouse.TargetFilter = table
	end
end)
]])
