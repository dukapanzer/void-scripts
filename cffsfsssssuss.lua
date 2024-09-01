local plr = owner
local plrgui = owner:WaitForChild("PlayerGui")
local remote = Instance.new("RemoteEvent")
remote.Parent = plrgui
local rs = game:GetService("RunService")
local hb = rs.Heartbeat
local Cursor = Instance.new("Part")
Cursor.Parent = workspace
Cursor.Size = Vector3.new(1, 1, 1)
Cursor.Transparency = 1
Cursor.CanCollide = true
Cursor.CanTouch = true
Cursor.CanQuery = true
Cursor.Anchored = true
Cursor.Name = "Cursor"
local Attachment = Instance.new("Attachment")
Attachment.Parent = Cursor
local ParticleEmitter = Instance.new("ParticleEmitter")
ParticleEmitter.Parent = Attachment
ParticleEmitter.LightEmission = 0
ParticleEmitter.LightInfluence = 0
ParticleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera
ParticleEmitter.Texture = "rbxassetid://107027142769343"
ParticleEmitter.Lifetime = NumberRange.new(math.huge)
ParticleEmitter.Rate = 1
ParticleEmitter.LockedToPart = true
ParticleEmitter.Speed = NumberRange.new(0)

local function random(length)
	local characters = "0123456789abcdefghijklmnopqrstuvwxyz"
	local result = ""
	for i = 1, length do
		local rand = math.random(1, #characters)
		result = result .. string.sub(characters, rand, rand)
	end
	return result
end

remote.OnServerEvent:Connect(function(player, pos, isMouseDown)
	Cursor.CFrame = pos
	ParticleEmitter.Color = ColorSequence.new(isMouseDown and Color3.new(1, 0, 0) or Color3.new(1, 1, 1))
end)

NLS([[
local plr = owner
local plrGui = owner:WaitForChild("PlayerGui")
local cursor = workspace:WaitForChild("Cursor")
local mouse = plr:GetMouse()
local rs = game:GetService("RunService")
local remote = plrGui:WaitForChild("RemoteEvent")
local isMouseDown = false

mouse.Button1Down:Connect(function()
	isMouseDown = true
end)

mouse.Button1Up:Connect(function()
	isMouseDown = false
end)

rs.Heartbeat:Connect(function()
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {cursor}
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	local unitRay = workspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y)
	local raycastResult = workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000, raycastParams)
	if raycastResult then
		local hitPosition = raycastResult.Position
		local hitNormal = raycastResult.Normal
		local offset = hitNormal * (cursor.Size.Y / 2 + 0.05)
		local cframe = CFrame.new(hitPosition + offset, hitPosition + hitNormal + offset)
		remote:FireServer(cframe, isMouseDown)
	else
		local camCFrame = workspace.CurrentCamera.CFrame
		local noCF = camCFrame * CFrame.new(0, 0, -10)
		remote:FireServer(noCF, isMouseDown)
	end
end)
]])
