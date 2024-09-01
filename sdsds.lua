
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
	mouse_held = true
	remote:FireServer(mouse_position, mouse_held, cam.CFrame)
end)

mouse.Button1Up:Connect(function()
	local mouse_position = mouse.Hit.Position
	mouse_held = false
	remote:FireServer(mouse_position, mouse_held, cam.CFrame)
end)
]])
