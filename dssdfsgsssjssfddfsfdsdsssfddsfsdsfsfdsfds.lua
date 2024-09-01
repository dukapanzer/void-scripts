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
		if hit_part ~= nil then
			hit_part.CFrame = cursor.CFrame
			print("currently setting cframe of part: " .. tostring(hit_part))
		else
			warn("sorry if i make you mad but hit_part is nil and i don't know what to move, sorry.")
		end
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

local hit_part = nil

hb:Connect(function()
	local mouse_position = mouse.Hit.Position
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part)
end)

mouse.Button1Down:Connect(function()
	local mouse_position = mouse.Hit.Position
	hit_part = mouse.Target
	mouse_held = true
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part)
end)

mouse.Button1Up:Connect(function()
	local mouse_position = mouse.Hit.Position
	mouse_held = false
	remote:FireServer(mouse_position, mouse_held, cam.CFrame, hit_part)
end)
]])
