local player = game:GetService("Players").LocalPlayer
local char = player.Character

local humanoid = char:WaitForChild("Humanoid")
local rs = game:GetService("Workspace")
local anims = Instance.new("Folder",rs)

local mouse_held = false

local anim1 = Instance.new("Animation")
anim1.Parent = anims
anim1.Name = "attack_1"
anim1.AnimationId = "rbxassetid://18754873309"

local anim2 = Instance.new("Animation")
anim2.Parent = anims
anim2.Name = "attack_2"
anim2.AnimationId = "rbxassetid://18754875290"

local anim3 = Instance.new("Animation")
anim3.Parent = anims
anim3.Name = "attack_3"
anim3.AnimationId = "rbxassetid://18754873309"

local anim4 = Instance.new("Animation")
anim4.Parent = anims
anim4.Name = "attack_4"
anim4.AnimationId = "rbxassetid://18754875290"

local combo = 0
local mouse = player:GetMouse()

local debounce = false
local mini_debounce = false

local function play_anim()
	local anim = anims["attack_" ..combo]
		
	local play_anim = humanoid:LoadAnimation(anim)
	play_anim:Play()
	
	play_anim.Priority = Enum.AnimationPriority.Action4
	
	print(combo)
	
	mini_debounce = true
		
	play_anim:GetMarkerReachedSignal("end"):connect(function()
		mini_debounce = false
	end)
end

local function set_debounce()
	debounce = true
	
	if debounce then
		task.wait(2)
		debounce = false
	end
end

local function set_combo()
	if combo > 3 then
		combo = 0
	end
	
	combo += 1
end

local function hit()
	set_combo()
	play_anim()
end

mouse.Button1Down:connect(function()
	mouse_held = true
	while task.wait() do
		if not debounce and not mini_debounce and mouse_held then
			hit()
		end
	end
end)

mouse.Button1Up:connect(function()
	mouse_held = false
end)
