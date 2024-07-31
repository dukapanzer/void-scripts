local uis = game:GetService("UserInputService")
local replicatedstorage = game:GetService("ReplicatedStorage")

local remotes = replicatedstorage.remotes
local combat_re = remotes.combat

local animations = replicatedstorage.animations

local vfxeffects = replicatedstorage.vfxeffects

local modules = replicatedstorage.modules
local hitbox_service = require(modules.MuchachoHitbox)

local function change_combo(char)
	local curr_combo = char:GetAttribute("combo")

	if curr_combo >= 4 then
		char:SetAttribute("combo", 1)
	else
		char:SetAttribute("combo", curr_combo + 1)
	end
end

local function get_animation(char, punch_type)
	local curr_combo = char:GetAttribute("combo")

	change_combo(char)

	if curr_combo < 4 or punch_type == "normal" then
		for _, anim in animations:GetChildren() do
			if anim.Name == "punch".. curr_combo then
				return anim
			end
		end
	elseif curr_combo == 4 and punch_type == "downslam" then
		return animations.downslam
	end
end

local function create_trail(char, number)
	local trail = vfxeffects.Trail:Clone()
	trail.Parent = workspace.effects

	local att0 = Instance.new("Attachment")
	local att1 = Instance.new("Attachment")

	if number == 0 then
		att0.Parent = char:FindFirstChild("Right Arm")
		att0.CFrame = CFrame.new(0.5, -1, 0.5)
		att1.Parent = char:FindFirstChild("Right Arm")
		att1.CFrame = CFrame.new(0.5, -1, -0.5)
	elseif number == 1 then
		att0.Parent = char:FindFirstChild("Left Arm")
		att0.CFrame = CFrame.new(-0.5, -1, 0.5)
		att1.Parent = char:FindFirstChild("Left Arm")
		att1.CFrame = CFrame.new(-0.5, -1, -0.5)
	end

	trail.Attachment0 = att0
	trail.Attachment1 = att1

	return trail, att0, att1
end

combat_re.OnServerEvent:connect(function(plr, args)
	local char = plr.Character
	local humanoid = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local ts = char:FindFirstChild("Torso")
	local ra = char:FindFirstChild("Right Arm")
	local la = char:FindFirstChild("Left Arm")

	local curr_combo = char:GetAttribute("combo")

	local is_punching = char:GetAttribute("punching")

	if is_punching then return end

	local punch_type = args.type
	local anim = get_animation(char, punch_type)

	local play_anim = humanoid:LoadAnimation(anim)
	play_anim:Play()

	local trail, att0, att1

	if curr_combo == 1 then
		trail, att0, att1 = create_trail(char, 0)
	elseif curr_combo == 2 then
		trail, att0, att1 = create_trail(char, 1)
	elseif curr_combo == 3 then
		trail, att0, att1 = create_trail(char, 1)
	elseif curr_combo == 4 then
		trail, att0, att1 = create_trail(char, 0)
	end

	char:SetAttribute("punching", true)

	local hitbox_params = OverlapParams.new()
	hitbox_params.FilterType = Enum.RaycastFilterType.Exclude
	hitbox_params.FilterDescendantsInstances = {char}

	local hitbox = hitbox_service.CreateHitbox()
	spawn(function()
		while true do
			hitbox.CFrame = hrp.CFrame
			task.wait()
		end
	end)
	hitbox.Offset = CFrame.new(0, -0.5, -3)
	hitbox.Size = Vector3.new(4.5, 5, 4.5)
	hitbox.OverlapParams = hitbox_params

	hitbox.Touched:Connect(function(hit, hit_humanoid)
		hit_humanoid:TakeDamage(3)
		local hit_char = hit_humanoid.Parent
		local hit_hrp = hit_char:FindFirstChild("HumanoidRootPart")
		local hit_ts = hit_char:FindFirstChild("Torso")

		for i,v in pairs(vfxeffects:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v = v:clone()
				v.Parent = hit_ts
				v:emit(7)
				print("e")
				game:GetService("Debris"):AddItem(v, 1)
			end
		end

		if punch_type == "downslam" then
			local downslamParams = RaycastParams.new()
			downslamParams.FilterType = Enum.RaycastFilterType.Exclude
			downslamParams.FilterDescendantsInstances = {hit_char}

			local downslamRay = workspace:Raycast(hit_hrp.Position, Vector3.new(0, -10, 0), downslamParams)

			if downslamRay then
				hit_hrp.CFrame = CFrame.new(downslamRay.Position) * CFrame.Angles(math.rad(90), 0, 0)
			end
		end
	end)

	play_anim:GetMarkerReachedSignal("hitreg"):Connect(function()
		hitbox:Start()
	end)

	play_anim:GetMarkerReachedSignal("end"):Connect(function()
		hitbox:Stop()
		char:SetAttribute("punching", false)
		if trail then
			trail:Destroy()
			att0:Destroy()
			att1:Destroy()
			print("trail and attachments destroyed")
		else
			print("no trail to destroy")
		end
	end)
end)
