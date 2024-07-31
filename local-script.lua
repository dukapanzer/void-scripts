local uis = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players").LocalPlayer

local char = plr.Character or plr.CharacterAdded:wait()
local humanoid = char:FindFirstChild("Humanoid")

print(humanoid)

local remotes = replicatedStorage.remotes
local combat_re = remotes.combat

local mouse_held = false

uis.InputBegan:Connect(function(input, is_typing)
	if is_typing then return end
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 then		
		mouse_held = true
	end
end)

uis.InputEnded:Connect(function(input, is_typing)
	if is_typing then return end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		mouse_held = false
	end
end)

spawn(function()
	while true do
		if mouse_held then
			local args = {
				["type"] = "normal"
			}
			
			if humanoid.FloorMaterial == Enum.Material.Air then
				args.type = "downslam"
			elseif uis:IsKeyDown(Enum.KeyCode.Space) and  humanoid.FloorMaterial ~= Enum.Material.Air then
				args.type = "uppercut"
			end
			
			combat_re:FireServer(args)
		end
		
		task.wait()
	end
end)
