local Assets = LoadAssets(76512257771374)
local cursor = Assets:Get("Cursor"):Clone()
cursor.Anchored = false
cursor.Parent = script
local part = cursor:WaitForChild("Part")
part.Parent = script.Parent
part.Name = "the Bart..."
part.CanCollide = true
part.CanQuery = true
part.CanTouch = true
part.Anchored = true
part.Transparency = 1

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
local objectValue = Instance.new("ObjectValue")
objectValue.Value = part
local remote3 = Instance.new("RemoteEvent")
remote3.Parent = char
remote3.Name = "remote3"
if not char or char == nil then
	part:Destroy()
end

local previous_owner = nil

remote.OnServerEvent:connect(function(player, hit_part, mouse_held)
	if mouse_held then
		image_label.ImageColor3 = Color3.new(1, 0, 0)
		if hit_part and not part then
			if hit_part:IsA("BasePart") and not part then
				hit_part.Anchored = true
				hit_part.CFrame = cursor.CFrame
			end
		end
	
	else
		if not part then
			hit_part.Anchored = false
		end
		image_label.ImageColor3 = Color3.new(1, 1, 1)
		--return
	end
end)

game:GetService("RunService").Heartbeat:connect(function()
	cursor:SetNetworkOwner(plr)
end)

remote2.OnServerEvent:connect(function(player, hit_part, right_held)
	if right_held then
		image_label.ImageColor3 = Color3.new(0, 0.5, 1)
		part:WaitForChild("SurfaceGui1").Enabled = true
		part.CFrame = cursor.CFrame
		part:WaitForChild("SurfaceGui2").Enabled = true
		part.CFrame = cursor.CFrame
	end

	if not right_held then
		image_label.ImageColor3 = Color3.new(1, 1, 1)
	end
end)

remote3.OnServerEvent:connect(function(player, hit_part, type)
	if type == "anchor" then
		hit_part.Anchored = false
	end

	if type == "duplication" then
		local duplication = hit_part:Clone()
		duplication.Parent = hit_part.Parent
	end

	if type == "deletion" then
		hit_part:Destroy()
	end
end)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("remote")
local remote2 = char:WaitForChild("remote2")
local remote3 = char:WaitForChild("remote3")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera
local right_held = false
local mouse_held = false
local hit_part = nil
local bart = char:WaitForChild("Value").Value
local sf1 = bart:WaitForChild("SurfaceGui1")
local sf2 = bart:WaitForChild("SurfaceGui2")
local delete1 = sf1:WaitForChild("delete")
local delete2 = sf2:WaitForChild("delete")
local duplicate1 = sf1:WaitForChild("duplicate")
local duplicate2 = sf2:WaitforChild("duplicate")
local unanchor1 = sf1:WaitForChild("unanchor")
local unanchor2 = sf2:WaitForChild("unanchor")

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

mouse.Button2Down:connect(function()
	right_held = true
	hit_part = mouse.Target
	table.insert(mouse_filter, hit_part)
	remote2:FireServer(hit_part, right_held)
	return
end)

mouse.Button2Up:connect(function()
	right_held = false
	remote2:FireServer(hit_part, right_held)
end)

local type = nil

local function un_anchor(hit_part)
	if hit_part then
		type = "anchor"
		remote3:FireServer(hit_part, type)
	else
		warn("no part was detected")
	end
end

local function duplicate(hit_part)
	if hit_part then
		type = "duplication"
		local hit_part_parent = hit_part.Parent
		remote3:FireServer(hit_part, type)
	else
		warn("no part was detected")
	end
end

local function delete(hit_part)
	if hit_part then
		type = "deletion"
		remote3:FireServer(hit_part, type)
	else
		warn("no part was detected")
	end
end

delete1.Activated:connect(function()
	delete(hit_part)
end)


delete2.Activated:connect(function()
	delete(hit_part)
end)

duplicate1.Activated:connect(function()
	duplicate(hit_part)
end)

duplicate2.Activated:connect(function()
	duplicate(hit_part)
end)

unanchor1.Activated:connect(function()
	un_anchor(hit_part)
end)

unanchor2.Activated:connect(function()
	un_anchor(hit_part)
end)
]])
