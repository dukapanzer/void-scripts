local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Parent = script

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
cursor.Parent = char
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")

remote.OnServerEvent:connect(function(plaeyr, mouse_position, mouse_held)
	cursor.Position = mouse_position
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

local mouse_held = false

mouse.Move:connect(function()
	local mouse_position = mouse.Hit.Position
	remote:FireServer(mouse_position)
end)

mouse.Button1Down:connect(function()
	mouse_held = true
	remote:FireServer(mouse_held)
end)

mouse.Button1Up:connect(function()
	mouse_held = false
	remote:FireServer(mouse_held)
end)
]])
