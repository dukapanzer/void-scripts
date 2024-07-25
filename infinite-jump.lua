local players = game:GetService("Players")
local player = players.LocalPlayer
local char = player.Character

local humanoid = char:FindFirstChild("Humanoid")

local UIS = game:GetService("UserInputService")

local space_held = false

UIS.InputBegan:connect(function(k)
	if k.KeyCode == Enum.KeyCode.Space then
		space_held = true
	end
end)

UIS.InputEnded:connect(function(k)
	if k.KeyCode == Enum.KeyCode.Space then
		space_held = false
	end
end)

spawn(function()
	while task.wait() do
		if space_held then
			local bodyvel = Instance.new("BodyVelocity")
			bodyvel.Parent = char:FindFirstChild("HumanoidRootPart")
			bodyvel.Velocity = Vector3.new(0, 50, 0)
			bodyvel.MaxForce = Vector3.new(0, 100000, 0)
			bodyvel.P = 3000
			print("jumpi")
			game:GetService("Debris"):AddItem(bodyvel, 0.1)
		end
	end
end)
