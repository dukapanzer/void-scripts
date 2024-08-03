local player = game:GetService("Players").LocalPlayer
local char = player.Character

local humanoid = char:WaitForChild("Humanoid")

  local anim = workspace.Animations["Neptunian_V"]
print(anim)

  local load_animation = humanoid:LoadAnimation(anim)
  load_animation:Play()

play_anim()
