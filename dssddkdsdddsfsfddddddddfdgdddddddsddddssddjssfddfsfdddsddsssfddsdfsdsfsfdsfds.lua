local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Anchored = true
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

local base_offset = Vector3.new(0.9, -0.9, 0)

local right_held
remote2.OnServerEvent:Connect(function(player, right_held)
	if right_held then
		right_held = true
	else
		right_held = false
	end
end)

remote.OnServerEvent:Connect(function(player, mouse_position, mouse_held, camera_cframe, hit_part)
	cursor.CFrame = CFrame.new(mouse_position)

	if mouse_held then
		if hit_part ~= nil then
			hit_part.CFrame = cursor.CFrame * CFrame.new(0, 3, 0)
			print("currently setting cframe of part: " .. tostring(hit_part))
		else
			warn("sorry if i make you mad but the part you clicked got detected as nil and i don't know what to move, sorry. you probably accidentaly clicked in the sky or missed the part? no idea..")
		end
		image_label.ImageColor3 = Color3.new(1, 0, 0)
	else
		if not right_held then
			image_label.ImageColor3 = Color3.new(1, 1, 1)
		end
	end
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

local hit_part = nil

hb:Connect(function()
	local mouse_position = mouse.Hit.Position
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part, right_held)
end)

mouse.Button1Down:Connect(function()
	local mouse_position = mouse.Hit.Position
	hit_part = mouse.Target
	mouse.TargetFilter = hit_part
	hit_part.CanQuery = false
	mouse_held = true
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part, right_held)
end)

mouse.Button1Up:Connect(function()
	local mouse_position = mouse.Hit.Position
	hit_part.CanQuery = true
	mouse.TargetFilter = nil
	mouse_held = false
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part, right_held)
end)

mouse.Button2Down:Connect(function()
	right_held = true
	remote2:FireServer(right_held)
end)

mouse.Button2Up:Connect(function()
	right_held = false
	remote2:FireServer(right_held)
end)
]])
