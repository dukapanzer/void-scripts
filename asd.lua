local player = game:GetService("Players").LocalPlayer
local char = player.Character

local humanoid = char:WaitForChild("Humanoid")

local function play_anim()
  local anim = workspace.Animations["Neptunian_V"]

  local load_animation = humanoid:LoadAnimation(anim)
  load_animation:Play()
end

play_anim()
