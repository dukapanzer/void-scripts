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

local image_size = image_label.Size

local offset = Vector3.new(-image_size.X.Offset / 2, image_size.Y.Offset / 2, 0)

remote.OnServerEvent:connect(function(plaeyr, mouse_position, mouse_held)
	cursor.CFrame = CFrame.new(mouse_position + offset)

	if mouse_held then
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

local mouse_held = false

hb:connect(function()
	local mouse_position = mouse.Hit.Position
	remote:FireServer(mouse_position, mouse_held)
end)

mouse.Button1Down:connect(function()
	local mouse_position = mouse.Hit.Position
	mouse_held = true
	remote:FireServer(mouse_position, mouse_held)
end)

mouse.Button1Up:connect(function()
	local mouse_position = mouse.Hit.Position
	mouse_held = false
	remote:FireServer(mouse_position, mouse_held)
end)
]])
