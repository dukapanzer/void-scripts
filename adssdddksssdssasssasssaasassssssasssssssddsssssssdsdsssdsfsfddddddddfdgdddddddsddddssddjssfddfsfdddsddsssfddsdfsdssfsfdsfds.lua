local Assets = LoadAssets(92282790242091)
local cursor = Assets:Get("Cursor"):Clone()
cursor.Anchored = false
cursor.Parent = script
local part = cursor:WaitForChild("Part")

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
remote.Name = "remote"
cursor.Parent = char
local remote2 = Instance.new("RemoteEvent")
remote2.Parent = char
remote2.Name = "remote2"
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")
image_label.Size = UDim2.new(1, 0, 1, 0)
image_label.Parent.Size = UDim2.new(3, 0, 3, 0)

local previous_owner = nil

remote.OnServerEvent:connect(function(player, hit_part, mouse_held)
	if mouse_held then
		image_label.ImageColor3 = Color3.new(1, 0, 0)
		if hit_part then
			if hit_part:IsA("BasePart") then
				hit_part.Anchored = true
				hit_part.CFrame = cursor.CFrame
			end
		end
	
	else
		hit_part.Anchored = false
		image_label.ImageColor3 = Color3.new(1, 1, 1)
		return
	end
end)

game:GetService("RunService").Heartbeat:connect(function()
	cursor:SetNetworkOwner(plr)
end)

remote2.OnServerEvent:connect(function(player, hit_part, right_held)
	if right_held then
		image_label.ImageColor3 = Color3.new(0, 0, 0)
		part:WaitForChild("SurfaceGui").Enabled = true
		part.CFrame = cursor.CFrame
	end

	if not right_held then
		image_label.ImageColor3 = Color3.new(1, 1, 1)
	end
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("remote")
local remote2 = char:WaitForChild("remote2")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera
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
	if hit_part then
		if hit_part:IsA("BasePart") then
			hit_part.CanQuery = false
		end
	end
	mouse_held = true
end)

mouse.Button1Up:connect(function()
	for i, part in ipairs(mouse_filter) do
		if part == hit_part then
			table.remove(mouse_filter, i)
			break
		end
	end
	
	if hit_part then
		if hit_part:IsA("BasePart") then
			hit_part.CanQuery = true
		end
	end
	
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
	remote2:FireServer(hit_part, right_held)
end)

mouse.Button1Down:connect(function()
	right_held = true
end)

mouse.Button1Up:connect(function()
	right_held = false
end)]])
