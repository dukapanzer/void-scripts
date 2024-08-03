local player = game:GetService("Players").LocalPlayer
local char = player.Character

local humanoid = char:WaitForChild("Humanoid")

local Assets = LoadAssets(18787489967)
Assets.Parent = workspace

local function play_anim(animation)
  local animations = workspace:WaitForChild("Animations")

  local load_animation = humanoid:LoadAnimation(folder:WaitForChild("Animation"))
  load_animation:Play()
end

play_animation("idle_anim")
