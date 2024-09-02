local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Anchored = false
cursor.Parent = script

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
remote.Name = "remote"
cursor.Parent = char
local remote2 = Instance.new("RemoteEvent")
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")
image_label.Size = UDim2.new(1, 0, 1, 0)
image_label.Parent.Size = UDim2.new(1, 0, 1, 0)

remote.OnServerEvent:connect(function(player, hit_part, mouse_held)
	if mouse_held then
		image_label.ImageColor3 = Color3.new(1, 0, 0)
	else
		image_label.ImageColor3 = Color3.new(1, 1, 1)
		return
	end

	if mouse_held then
		if hit_part then
			if hit_part:IsA("BasePart") then
				hit_part.Anchored = false
				hit_part:SetNetworkOwner(plr)
			end
		end
	end
end)

game:GetService("RunService").Heartbeat:connect(function()
	cursor:SetNetworkOwner(plr)
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("remote")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera
local hit_part = nil
local right_held = false
local mouse_held = false
local hit_part = nil

local fakePart = Instance.new("Part")
fakePart.Size = cursor.Size
fakePart.Anchored = true
fakePart.Parent = workspace
fakePart.Transparency = 1

local mouse_filter = {}
table.insert(mouse_filter, cursor)
table.insert(mouse_filter, fakePart)

mouse.Button1Down:connect(function()
	hit_part = mouse.Target
	table.insert(mouse_filter, hit_part)
	mouse_held = true
end)

mouse.Button1Up:connect(function()
	table.remove(mouse_filter, 3)
	hit_part = nil
	mouse_held = false
end)

hb:Connect(function()
	local mouse_position = mouse.Hit.Position
	fakePart.CFrame = fakePart.CFrame:Lerp(CFrame.new(mouse_position), 0.08)
	cursor.CFrame = fakePart.CFrame
	for _, table in ipairs(mouse_filter) do
    		mouse.TargetFilter = table
	end

	remote:FireServer(hit_part, mouse_held)
end)
]])
