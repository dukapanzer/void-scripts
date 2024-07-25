local players = game:GetService("Players")
local player = players.LocalPlayer
local char = player.Character

local humanoid = char:FindFirstChild("Humanoid")

local UIS = game:GetService("UserInputService")

local space_held = false

while task.wait() do
	if humanoid.FloorMaterial == Enum.Material.Air then
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://18654336853"
		
		local play_anim = humanoid:LoadAnimation(animation)
		play_anim:Play()
	else
		print("not in air")
	end
end
