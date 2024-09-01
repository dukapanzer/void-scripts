local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Anchored = true
cursor.Parent = script

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
cursor.Parent = char
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")

local base_offset = Vector3.new(0.9, -0.9, 0)

remote.OnServerEvent:Connect(function(player, mouse_position, mouse_held, camera_cframe, hit_part)
	local distance = (mouse_position - camera_cframe.Position).Magnitude

	local adjusted_offset = base_offset * (distance / 50) 

	local camera_right_vector = camera_cframe.RightVector
	local camera_up_vector = camera_cframe.UpVector

	local final_offset = (camera_right_vector * adjusted_offset.X) + (camera_up_vector * adjusted_offset.Y)

	cursor.CFrame = CFrame.new(mouse_position + final_offset)

	if mouse_held then
		hit_part.CFrame = cursor.CFrame
		image_label.ImageColor3 = Color3.new(1, 0, 0)
	else
		image_label.ImageColor3 = Color3.new(1, 1, 1)
	end
end)


NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("RemoteEvent")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera

local mouse_held = false

hb:Connect(function()
	local mouse_position = mouse.Hit.Position
	remote:FireServer(mouse_position, mouse_held, cam.CFrame)
end)

mouse.Button1Down:Connect(function()
	local mouse_position = mouse.Hit.Position
	local hit_part = mouse.Target
	print(hit_part)
	mouse_held = true
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part)
end)

mouse.Button1Up:Connect(function()
	local mouse_position = mouse.Hit.Position
	mouse_held = false
	remote:FireServer(mouse_position, mouse_held, cam.CFrame)
end)
]])
