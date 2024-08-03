local aerguijhdfcvkejigknfd = "Script RE-Made by: Ronald McDonald SS dev#2194"
local fury = false

--[[

Script written from scratch by Asarii_IV & Edited by NOTHINGNEWTODAY
A month-long project orientated around creating the ultimate multi-purpose glitcher.
R.I.P Last Star Here's to one of the best glitcher's out there 🫗
]]

-- /// CORE FUNCTIONS

CFA = function(X,Y,Z)
	return(CFrame.Angles(math.rad(X),math.rad(Y),math.rad(Z)))
end
CFN = CFrame.new
V3 = Vector3.new
function rand(x,z)
	return(math.random(x,z))
end
function CFR(nX,mX,nY,mY,nZ,mZ)
	return (CFrame.Angles(math.rad(rand(nX,nX)),math.rad(rand(nY,mY)),math.rad(rand(nZ,mZ))))
end

local In,Out,InOut = Enum.EasingDirection.In,Enum.EasingDirection.Out,Enum.EasingDirection.InOut
local Linear,Sine,Quad,Quart,Quint,Back,Bounce,Elastic = Enum.EasingStyle.Linear,Enum.EasingStyle.Sine,Enum.EasingStyle.Quad,Enum.EasingStyle.Quart,Enum.EasingStyle.Quint,Enum.EasingStyle.Back,Enum.EasingStyle.Bounce,Enum.EasingStyle.Elastic
local Expo,Circular,Cubic = Enum.EasingStyle.Exponential,Enum.EasingStyle.Circular,Enum.EasingStyle.Cubic

local Neon,Forcefield = Enum.Material.Neon,Enum.Material.ForceField

C3R,C3H,C3N = Color3.fromRGB,Color3.fromHSV,Color3.new

local main_Folder = LoadAssets(18784994522)

for i,v in pairs(main_Folder.Folder:GetChildren()) do
	v.Parent = script
end

local plr = owner.Character
plr.Humanoid.MaxHealth = 9e9
plr.Humanoid.Health = 9e9
plr:WaitForChild("Health"):Destroy()

local sine = 0
local kevingaming = 0

local rs = game:GetService("RunService")
local heartbeat = rs.Heartbeat

plr:WaitForChild("Humanoid")
local a = Instance.new("Animation",plr.Humanoid)
a.AnimationId = "rbxassetid://13903023321"
local s = plr.Humanoid:LoadAnimation(a)
s.Priority = Enum.AnimationPriority.Action
s:Play()
wait(.1)
local x = plr:FindFirstChild("Animate")
local y = plr:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator")
if x then x:Destroy() end
if y then y:Destroy() end
local nametodisplay = string.upper(plr.Name)

local torsocframe,LAcframe,RAcframe,headcframe,LLcframe,RLcframe = CFN(),CFN(),CFN(),CFN(),CFN(),CFN()
local mousecframe,mousetarget = nil,nil
script.Events.MouseCFrame.OnServerEvent:Connect(function(player,mcf,mt,torsocf,lacf,racf,headcf,llcf,rlcf)
	if mcf ~= nil then
		mousecframe = mcf
	else
		mousecframe = nil
	end
	if mt ~= nil then
		mousetarget = mt
	else
		mousetarget = nil
	end
	if torsocf then
		torsocframe = torsocf
		LAcframe = lacf
		RAcframe = racf
		LLcframe = llcf
		RLcframe = rlcf
		headcframe = headcf
	end
end)

for i,v in pairs(plr:GetChildren()) do
	if v:IsA("CharacterMesh") or v:IsA("Accessory") then
		local a = v:Clone()
		a.Parent = script.TeleportEffect
		if a:IsA("Accessory") then
			local handle = a:FindFirstChildOfClass("Part")
			if handle then
				handle.Transparency = .5
				local mesh = handle:FindFirstChildOfClass("SpecialMesh")
				if mesh then
					mesh.TextureId = ""
				end
			end
			for _,c in pairs(a:GetDescendants()) do
				if c:IsA("Sparkles") or c:IsA("Smoke") or c:IsA("Fire") then
					c:Destroy()
				end
			end
		end
	end
end

local teleportfx = script.TeleportEffect
teleportfx.Parent = nil

local tweens = game:GetService("TweenService")

-- GIVES PLAYERS THE CFRAME SCRIPT
for i,v in pairs(workspace:GetChildren()) do
	if game:GetService("Players"):FindFirstChild(v.Name) then
		if not v:FindFirstChild("CFrame"..plr.Name) then
			local a = script.LocalCFrame:Clone()
			a.Owner.Value = plr.Name
			a.Parent = v
			a.Name = "CFrame"..plr.Name
			a.Disabled=false
			plr.Humanoid.Died:Connect(function()
				a:Destroy()
			end)
			if script.Parent == nil then
				a:Destroy()
			end
		end
		if not v:FindFirstChild("LastStarEffects") then -- ADDS THE EFFECTS
			local a = script.LastStarEffects:Clone()
			a.Parent = v
			a.Disabled=false
		end
	end
end

-- MAKES A STARTERPLAYER CFRAME SCRIPT
if not game.StarterPlayer.StarterCharacterScripts:WaitForChild("CFrame"..plr.Name,.5) then
	local a = script.LocalCFrame:Clone()
	a.Owner.Value = plr.Name
	a.Parent = game.StarterPlayer.StarterCharacterScripts
	a.Name = "CFrame"..plr.Name
	a.Disabled=false
end
if not game.StarterPlayer.StarterCharacterScripts:WaitForChild("LastStarEffects",.5) then -- ADDS EFFECTS
	local a = script.LastStarEffects:Clone()
	a.Parent = game.StarterPlayer.StarterCharacterScripts
	a.Disabled=false
end

-- SAFETY CHECK FOR DESTROYING ALL CFRAME SCRIPTS
plr.Humanoid.Died:Connect(function()
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("LocalScript") and v.Name == "CFrame"..plr.Name then
			v:Destroy()
		end
	end
end)

script.LocalCFrame:Destroy()

local Head = plr:WaitForChild("Head")
local Torso = plr:WaitForChild("Torso")
local Root = plr:WaitForChild("HumanoidRootPart")
local LA = plr:WaitForChild("Left Arm")
local RA = plr:WaitForChild("Right Arm")
local LL = plr:WaitForChild("Left Leg")
local RL = plr:WaitForChild("Right Leg")

local RCF = Root.CFrame
local RV = Root.Velocity/4

local count = 0
local Loudness = 0
local wing1, wing2, wing3, wing4, wing5, wing6, wing7,wing8,wing9,wing10,wing11,wing12 = script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(),script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone(), script.Wing:Clone()
local core = script.Core
core.Base.Anchored=false
core.Parent = plr
local w = Instance.new("Motor6D",core)
w.Part0 = core.Base
w.Part1 = Torso
w.Name = "CoreWeld"

local W1PC,W1SC = wing1.Primary.Color,wing1.Secondary.Color

for i,v in ipairs({wing1,wing2,wing3,wing4,wing5,wing6,wing7,wing8,wing9,wing10,wing11,wing12}) do
	v.Name = "Wing"..i
	v.Parent = plr
	v.Core.Anchored=false
	v.Beam.Attachment1 = core.Base.Cyli.Centre
end
script.Wing:Destroy()

local w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12 = Instance.new("Motor6D",wing1), Instance.new("Motor6D",wing2), Instance.new("Motor6D",wing3), Instance.new("Motor6D",wing4), Instance.new("Motor6D",wing5), Instance.new("Motor6D",wing6), Instance.new("Motor6D",wing7), Instance.new("Motor6D",wing8), Instance.new("Motor6D",wing9), Instance.new("Motor6D",wing10), Instance.new("Motor6D",wing11), Instance.new("Motor6D",wing12)
for i,v in ipairs({w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12}) do
	v.Name = "Motor"..i
	v.Part0 = Torso
end
w1.Part1 = wing1.Core		w2.Part1 = wing2.Core		w3.Part1 = wing3.Core		w4.Part1 = wing4.Core		w5.Part1 = wing5.Core		w6.Part1 = wing6.Core		w7.Part1 = wing7.Core		w8.Part1 = wing8.Core		w9.Part1 = wing9.Core		w10.Part1 = wing10.Core		w11.Part1 = wing11.Core		w12.Part1 = wing12.Core

for i,v in pairs({wing7,wing8,wing9,wing10,wing11,wing12}) do
	v.Primary.Transparency=1
	v.Secondary.Transparency=1
	v.Spin.Transparency=1
	v.Trail.Enabled=false
	v.Primary.Main.Enabled=false
	v.Secondary.Main.Enabled=false
	v.Primary.PointLight.Enabled=false
	v.Beam.Enabled=false
	for _,c in pairs(v.Particle["0"]:GetChildren()) do
		c.Enabled=false
	end
end

local pointlight = Instance.new("PointLight",Torso)
pointlight.Color = C3R(255,0,0)
pointlight.Brightness = 1.5
pointlight.Range = 20

local NG = script.NameGui
NG.Parent = Head

NG.LowerHalf.ScriptName.Text = "NOTHINGNEWTODAY's Last Star "..nametodisplay

local chat = script.ChatGui
chat.Parent = Head

local textserv = game:GetService("TextService")

local player = game:GetService("Players"):WaitForChild(plr.Name)
local filter = ""

local Theme = Instance.new("Sound",Root)
Theme.SoundId = "rbxassetid://1839526957"
Theme.RollOffMinDistance = 100
Theme.Name = "Theme"
Theme.Volume = 5
Theme.RollOffMaxDistance = 500

script.Events.MusicRemote.OnServerEvent:Connect(function(a,t)
	Theme.TimePosition = t
end)

script.Events.VisualizerEvent.OnServerEvent:Connect(function(plr,LocalLoudness) 
	Loudness = LocalLoudness
end)

if not workspace:FindFirstChild("LastStarMouseIgnore") then
	script.LastStarMouseIgnore.Parent = workspace
else
	script.LastStarMouseIgnore:Destroy()
end

for i,v in pairs({"LastStarEffects","LastStarCamShake","LastStarChatRemote"}) do
	if not game:GetService("ReplicatedStorage"):FindFirstChild(v) then
		local e = Instance.new("RemoteEvent",game:GetService("ReplicatedStorage"))
		e.Name = v
	end
end

function chatmsg(msg,a)
	filter = msg
	local filterfailed = false
	if a then
		local success,failure = pcall(function()
			filter = textserv:FilterStringAsync(msg,player.UserId):GetChatForUserAsync(player.UserId)
		end)
		if not success then
			warn("Could not filter message. "..failure)
			filterfailed = true
		end
	end
	if fury == false then
		if filterfailed == false then
			game:GetService("ReplicatedStorage"):WaitForChild("LastStarChatRemote"):FireAllClients(plr.Name,filter)
		end
	else
		game:GetService("ReplicatedStorage"):WaitForChild("LastStarChatRemote"):FireAllClients(plr.Name,string.upper(filter))
	end
end
player.Chatted:Connect(function(message)
	chatmsg(message,true)
end)

local d = workspace:WaitForChild("LastStarMouseIgnore")
for i,v in pairs(d:GetChildren()) do
	if not v:IsA("Folder") then
		v.Position = V3(99999,99999,99999)
	end
end

function effect(shape,cframe,sizevector,color,material,transparency,tweentime,easingstyle,easingdirection,reverse,tableprop,newtransparency,transparencystyle)
	game:GetService("ReplicatedStorage").LastStarEffects:FireAllClients(shape,cframe,sizevector,color,material,transparency,tweentime,easingstyle,easingdirection,reverse,tableprop,newtransparency,transparencystyle)
end
function bolt(startpos,endpos,thickness,length,offset,colour,duration)
	local mag = (startpos-endpos).Magnitude
	local amount = math.floor(mag/length+.5)
	local x,y,z = rand(-offset,offset),rand(-offset,offset),rand(-offset,offset)
	local lastcf = CFN(startpos,endpos)*CFN(0,0,-length/2)*CFA(x,y,z)*CFN(0,0,-length/2)
	if amount > 2 then
		for i = 1,amount-1 do
			effect("Cube",lastcf,V3(thickness,thickness,length),colour,Neon,0,duration,Sine,In,false,{Size=V3(thickness/2,thickness/2,length)},1,Sine)
			lastcf *= CFN(0,0,-length/2)*CFA(-x*2,-y*2,-z*2)
			x,y,z = rand(-offset,offset),rand(-offset,offset),rand(-offset,offset)
			lastcf *= CFA(x,y,z)*CFN(0,0,-length/2)
		end
	end
	local finalcf = CFN((lastcf*CFN(0,0,length/2)).Position,endpos)
	local finalmag = (lastcf.Position-endpos).Magnitude
	effect("Cube",finalcf*CFN(0,0,-finalmag/2),V3(thickness,thickness,finalmag),colour,Neon,0,duration,Sine,In,false,{Size=V3(thickness/2,thickness/2,finalmag)},1,Sine)
end
function camshake(position,range,power)
	game:GetService("ReplicatedStorage").LastStarCamShake:FireAllClients(position,range,power)
end
function sound(cframe,id,volume,playbackspeed,timeposition,distance)
	local a = Instance.new("Part",d)
	a.CFrame = cframe
	a.Transparency=1
	a.CanCollide=false
	a.Anchored=true
	
	local s = Instance.new("Sound",a)
	s.SoundId = "rbxassetid://"..id
	s.Volume = volume
	s.PlaybackSpeed = playbackspeed
	s.TimePosition = timeposition
	s.Playing=true
	s.RollOffMinDistance = distance
	
	s.Ended:Connect(function()
		a:Destroy()
	end)
end

local Hum = plr:WaitForChild("Humanoid")

Hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
Hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

pointlight.Enabled = false

Hum.WalkSpeed = 0
Hum.JumpPower = 0

function ray(position,vector)
	local ray = Ray.new(position,vector)
	local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{plr,d},false,true)
	return RPA,RPS,NO
end

if true == false then
	sound(Root.CFrame,1085317309,1,1,0,1000)
	local RPA,RPS,NO = ray(Root.Position,V3(0,-1000,0))
	if RPA then
		effect("Sphere",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(0,0,0),C3R(0,0,0),Neon,0,.4,Quad,Out,false,{Size=V3(300,0,300)},1,Sine)
	end
	local light = nil
	if not workspace:FindFirstChild("LastStarPlace") then
		local light = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
		game:GetService("Debris"):AddItem(light,3)
		light.Contrast = -2
		light.Brightness = 1
		local info = TweenInfo.new(.5,Sine,Out,0,false,0)
		local prop = {Brightness=0}
		local tween = tweens:Create(light,info,prop)
		tween:Play()
	end
	wait(1)
	if light ~= nil then
		light.TintColor = C3R(255,0,0)
		local info = TweenInfo.new(2,Quint,In,0,false,0)
		local prop = {Contrast=0;TintColor=C3R(255,255,255)}
		local tween = tweens:Create(light,info,prop)
		tween:Play()
	end
	sound(Root.CFrame,610327604,1,1,0,10000)
	sound(Root.CFrame,1835337231,1,1,0,10000)
	sound(Root.CFrame,6429267775,.5,1,0,100)
	sound(Root.CFrame,255679373,.5,1,0,100)
	sound(Root.CFrame,4643825537,.5,1,0,100)
	camshake(Root.Position,10000,25)

	for i = 1,5 do
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local s = rand(500,700)

		effect("Sphere",Root.CFrame,V3(5,5,5),c,Neon,0,.2,Quad,Out,false,{Size=V3(s,s,s)},1,Linear)
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		effect("Sphere",Root.CFrame*CFR(0,360,0,360,0,360),V3(s*.5,5,s*.5),c,Neon,0,.4,Quint,Out,false,{Size=V3(s*.1,s*3,s*.1)},1,Linear)

		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("HoleTornado",cf,V3(5,.05,5),c,Neon,0,.4,Sine,Out,false,{Size=V3(s*2,.05,s*2);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Linear)

		local ray = Ray.new(Root.Position,V3(0,-5,0))
		local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{d,plr},false,true)
		if RPA then
			local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
			local a = rand(1,2)
			local c = W1SC
			if a == 1 then c = W1PC end
			local x = rand(900,1500)
			effect("LightWind",cf,V3(100,.05,100),c,Neon,0,rand(30,60)/100,Sine,Out,false,{Size=V3(x,.05,x);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Sine)
		end

		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(10,10,10),c,Neon,0,rand(30,50)/100,Sine,Out,false,{Size=V3(80,800,80);CFrame=cf*CFN(0,rand(1000,2000),0)},1,Sine)
	end

	effect("Sphere",Root.CFrame,V3(5,5,5),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(1000,1000,1000)},1,Sine)
	effect("Sphere",Root.CFrame,V3(5,5,5),W1PC,Neon,0,.5,Sine,Out,false,{Size=V3(1500,1500,1500)},1,Sine)
	camshake(Root.Position,200,70)
end

pointlight.Enabled = true

for i,v in pairs({wing1,wing2,wing3,wing4,wing5,wing6}) do
	v.Primary.Transparency=0
	v.Secondary.Transparency=0
	v.Spin.Transparency=0
	v.Trail.Enabled=true
	v.Primary.Main.Enabled=true
	v.Secondary.Main.Enabled=true
	v.Primary.PointLight.Enabled=true
	for _,c in pairs(v.Particle["0"]:GetChildren()) do
		c.Enabled=true
	end
end
NG.Enabled = true

Theme:Play()
Hum.WalkSpeed = 16
Hum.JumpPower = 50

script.Values.Anim.Value = "APEX"
script.Values.WingStyle.Value = "APEX"

local beeified = false
local falsehead = script.ForbiddenFolder.FalseHead
local falsetorso = script.ForbiddenFolder.FalseTorso
local pserv = game:GetService("PhysicsService")
local real,fake = pcall(function()
	pserv:CreateCollisionGroup("LSAmuletCollision")
	pserv:CreateCollisionGroup("LSPlayerCollision")
end)
pserv:CollisionGroupSetCollidable("LSAmuletCollision","LSPlayerCollision",false)
function beeify()
	if beeified == true then return end
	beeified = true
	falsetorso.CFrame = Torso.CFrame
	falsehead.CFrame = Head.CFrame
	falsetorso.Amulet.AmuletBase.CFrame = Torso.CFrame*CFN(0,0,-.6)
	for i,v in pairs(plr:GetDescendants()) do
		if v:IsA("CharacterMesh") or v:IsA("Accessory") or v.Name == "AeroQuality" or v.Name == "LocksofIce" or v.Name == "Scarf" or v.Name == "Shades" then
			v:Destroy()
		end
	end
	local shirt,pants,tie = plr:FindFirstChildOfClass("Shirt"),plr:FindFirstChildOfClass("Pants"),plr:FindFirstChildOfClass("ShirtGraphic")
	if shirt then shirt:Destroy() end		if pants then pants:Destroy() end			 if tie then tie:Destroy() end
	Head.Transparency=1
	local fb = script.ForbiddenFolder
	local m = Instance.new("CharacterMesh",plr)
	m.MeshId = 48112070
	m.BodyPart = Enum.BodyPart.Torso
	local bc = plr:WaitForChild("Body Colors")
	bc.RightArmColor3 = C3R(255, 190, 80)
	bc.LeftArmColor3 = C3R(255, 190, 80)
	bc.RightLegColor3 = C3R(255, 190, 80)
	bc.LeftLegColor3 = C3R(255, 190, 80)
	bc.TorsoColor3 = C3R(255,190,80)
	Head:FindFirstChildOfClass("Decal"):Destroy()
	for i,v in pairs(fb:GetDescendants()) do
		if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") and v.Name ~= "FalseTorso" then
			v.Transparency = 0
			v.Anchored=false
			if v.Parent.Name ~= "Amulet" then
				v.CanCollide=false
			end
			v.Massless=true
		end
	end
	falsehead.Parent = Head
	local w = Instance.new("Weld",falsehead)
	w.Part0 = falsehead
	w.Part1 = Head
	fb.FalseTorso.Parent = Torso
	local w = Instance.new("Weld",falsetorso)
	w.Part0 = falsetorso
	w.Part1 = Torso
	w.C0 = CFA(0,180,0)
	falsetorso.Transparency = 1
	falsetorso.Anchored = false
	falsehead.Eyes.Transparency = 0
	local falserightarm = script.ForbiddenFolder.Arm:Clone()
	local w = Instance.new("Weld",falserightarm)
	w.Part0 = falserightarm.Neon
	w.Part1 = RA
	w.C0 = CFN(0,-.35,0)
	falserightarm.Parent = RA
	local falserightleg = script.ForbiddenFolder.Leg:Clone()
	local w = Instance.new("Weld",falserightleg)
	w.Part0 = falserightleg.Neon
	w.Part1 = RL
	w.C0 = CFN(0,.1,0)
	falserightleg.Parent = RL
	local falseleftarm = script.ForbiddenFolder.Arm
	local w = Instance.new("Weld",falseleftarm)
	w.Part0 = falseleftarm.Neon
	w.Part1 = LA
	w.C0 = CFN(0,-.35,0)*CFA(0,180,0)
	falseleftarm.Parent = LA
	local falseleftleg = script.ForbiddenFolder.Leg
	local w = Instance.new("Weld",falseleftleg)
	w.Part0 = falseleftleg.Neon
	w.Part1 = LL
	w.C0 = CFN(0,.1,0)
	falseleftleg.Parent = LL
	
	for i,v in pairs(plr:GetDescendants()) do
		if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
			if v.Parent.Name ~= "Amulet" and v.Name ~= "FakeTorso" and v.Name ~= "Torso" then
				pserv:SetPartCollisionGroup(v,"LSPlayerCollision")
			else
				pserv:SetPartCollisionGroup(v,"LSAmuletCollision")
			end
		end
	end
	wait(.1)
	for i,v in pairs(falsetorso.Amulet:GetChildren()) do
		v.CanCollide=true
	end
end

if game:GetService("RunService"):IsStudio() then
	Theme.RollOffMinDistance = 0
	--beeify()
end

wait(1)
if game.PlaceId ~= 2578460148 then
	local voice = script.Sounds.voiceline:Clone()
	voice.SoundId = "rbxassetid://4107988850"
	voice.Volume = 10
	voice.Parent = Root
	voice.RollOffMinDistance=300
	voice:Play()
	game:GetService("Debris"):AddItem(voice,5)
end
chatmsg("I'm Back, and I've got some new tricks.")

local RPA,RPS,NO = ray(Root.Position,V3(0,-1000,0))
if RPA then
	--effect("Sphere",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(0,0,0),C3R(255,0,0),Neon,0,1.8,Quint,InOut,false,{Size=V3(2048,0,2048)},1,Linear)
end

-- FORMS

local dclimit = 0
d.ChildAdded:Connect(function(child)
	if child.Name == "DamageCount" then
		dclimit += 1
	end
end)
d.ChildRemoved:Connect(function(child)
	if child.Name == "DamageCount" then
		dclimit -= 1
	end
end)

local instakill = false
local damageplayers = true
local ds = false
function damage(position,range,damage,setonfireduration,KBpower,stun)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Humanoid") then
			if v.Parent ~= script.Parent then
				local r,head,compiler = nil,v.Parent:FindFirstChild("Head"),v.Parent:FindFirstChild("Compile")
				if head and not compiler then
					local candamage = true
					if head.Parent:FindFirstChild("LastStar") then
						if head.Parent.LastStar.Values.Safezone.Value == 1 then
							candamage = false
						end
					end
					if script.Values.Safezone.Value == 1 then
						candamage = false
					end
					if damageplayers == false and game:GetService("Players"):FindFirstChild(v.Parent.Name) then
						candamage = false
					end
					if head:IsA("Part") then
						local magnitude = (position-head.Position).Magnitude
						if magnitude <= range and candamage == true then
							if ds == true then
								local x = damage*(v.MaxHealth/1000000)
								damage = x
							end
							v.Health = v.Health-(math.ceil((damage*script.Values.Attack.Value)+.5))
							if dclimit <= 50 then
								local c = script.DamageCount:Clone()
								c.CFrame = CFN(head.Position)*CFR(-50,50,0,360,-50,50)*CFN(rand(-5,5),rand(5,10),rand(-5,5))
								if ds == false then
									c.Bill.Amount.Text = "-"..math.ceil(damage*script.Values.Attack.Value/1000+.5).."k!"
								else
									c.Bill.Amount.Text = "-"..math.ceil(damage+.5).."!"
								end
								c.Bill.Amount.Rotation = rand(-5,5)
								c.Bill.Amount.TextColor3 = NG.LowerHalf.FormName.TextColor3
								c.Bill.Amount.TextStrokeColor3 = NG.LowerHalf.FormName.TextStrokeColor3
								local x = rand(-1,1)
								local tim = rand(15,30)/10
								local info = TweenInfo.new(tim,Sine,In,0,false,0)
								local prop = {Rotation=90*x;TextTransparency=1;TextStrokeTransparency=1}
								local tween = tweens:Create(c.Bill.Amount,info,prop)
								tween:Play()
								local prop = {CFrame=c.CFrame+V3(0,30,0)}
								local tween = tweens:Create(c,info,prop)
								tween:Play()
								if instakill == true then
									v.Parent:BreakJoints()
									c.Bill.Amount.Text = "INSTAKILL!"
								end
								c.Parent = d
								game:GetService("Debris"):AddItem(c,3)
							end
							if KBpower then
								if KBpower > 0 then
									local bv = Instance.new("BodyVelocity",head)
									bv.MaxForce = V3(math.huge,math.huge,math.huge)
									bv.Velocity = CFN(position,head.Position).LookVector.Unit*rand(100,150)/100*KBpower+Vector3.new(0,rand(50,100)/100*KBpower,0)
									game:GetService("Debris"):AddItem(bv,.2)
									local bav = Instance.new("BodyAngularVelocity",head)
									bav.MaxTorque = V3(math.huge,math.huge,math.huge)
									bav.AngularVelocity = V3(rand(-30,30),rand(-30,30),rand(-30,30))
									game:GetService("Debris"):AddItem(bav,.2)
								end
							end
							if stun then
								if stun > 0 then
									local s = Instance.new("StringValue",v)
									s.Name = "LASTSTARSTUN"
									game:GetService("Debris"):AddItem(s,stun)
								end
							end
							if setonfireduration then
								if setonfireduration > 0 then
									if not v.Parent:FindFirstChild("LASTSTARONFIRE") then
										local val = Instance.new("StringValue",v.Parent)
										val.Name = "LASTSTARONFIRE"
										val.Value = plr.Name
										local c1,c2 = Instance.new("Color3Value",val),Instance.new("Color3Value",val)
										c1.Name = "c1"
										c2.Name = "c2"
										c1.Value = W1PC
										c2.Value = W1SC
										game:GetService("Debris"):AddItem(val,setonfireduration)
									end
								end
							end
							if v.Health == 0 or instakill == true then
								local cf = head.CFrame*CFR(0,0,0,360,0,0)
								local cf2 = head.CFrame*CFR(0,0,0,360,0,0)
								effect("Fire",cf,V3(.05,.05,.05),W1SC,Neon,0,.25,Sine,Out,false,{Size=V3(70,.05,70);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Sine)
								for i = 1,2 do
									local cf = head.CFrame*CFR(0,360,0,360,0,360)
									local a = rand(30,50)
									effect("LightWind",cf,V3(.05,.05,.05),W1PC,Neon,0,rand(2,5)/10,Quart,Out,false,{Size=V3(a,.05,a);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Linear)
								end
								local cf = head.CFrame*CFR(0,360,0,360,0,360)
								effect("Sphere",cf,V3(.05,.05,.05),W1SC,Neon,0,.25,Quad,Out,false,{Size=V3(20,20,20);CFrame=cf*CFR(0,360,0,360,0,360)},1,Linear)
								effect("Sphere",cf2,V3(.05,.05,.05),W1PC,Neon,0,.25,Quad,Out,false,{Size=V3(40,40,40);CFrame=cf2*CFR(0,360,0,360,0,360)},1,Linear)
								effect("HoleSphere2",cf,V3(.05,.05,.05),W1SC,Neon,0,.5,Quad,Out,false,{Size=V3(40,40,40);CFrame=cf*CFR(0,360,0,360,0,360)},1,Linear)
								effect("HoleSphere2",cf2,V3(.05,.05,.05),W1PC,Neon,0,.5,Quad,Out,false,{Size=V3(40,40,40);CFrame=cf2*CFR(0,360,0,360,0,360)},1,Linear)
								sound(head.CFrame,282061033,1,1,0,40)
								sound(head.CFrame,3199238931,1,1,0,40)
								sound(head.CFrame,1192402877,.5,1,0,40)
								for _,c in pairs(v.Parent:GetDescendants()) do
									if c:IsA("Part") or c:IsA("MeshPart") then
										local cf = c.CFrame
										effect("Cube",cf,c.Size,W1PC,Neon,0,rand(10,30)/10,Quad,In,false,{Size=c.Size*3;CFrame=cf*CFR(-30,30,-30,30,-30,30)*CFN(rand(-10,10)/2,rand(-10,10)/2,rand(-10,10)/2)*CFR(-30,30,-30,30,-30,30)+V3(rand(-10,10),rand(30,70),rand(-10,10))},1,Sine)
										local p = Instance.new("Part",d)
										p.Anchored=true
										p.CanCollide=false
										p.CFrame = c.CFrame
										p.Size = c.Size
										p.Transparency=1
										game:GetService("Debris"):AddItem(p,5)
										local kp1,kp2 = script.Particles.KP1:Clone(),script.Particles.KP2:Clone()
										for i,v in pairs({kp1,kp2}) do
											v.Parent = p
											v.Color = ColorSequence.new(W1PC)
											v:Emit(8)
										end
										c:Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
function heal(position,range,amount,selfbool,othersbool)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Humanoid") then
			if v.Parent ~= script.Parent and othersbool == true or v.Parent == script.Parent and selfbool == true then
				local r,head,compiler = nil,v.Parent:FindFirstChild("Head"),v.Parent:FindFirstChild("Compile")
				if head and not compiler then
					if head:IsA("Part") then
						local magnitude = (position-head.Position).Magnitude
						if magnitude <= range then
							v.Health = v.Health+(amount)*script.Values.Attack.Value
							if dclimit <= 50 then
								local c = script.DamageCount:Clone()
								c.CFrame = CFN(head.Position)*CFR(-50,50,0,360,-50,50)*CFN(rand(-5,5),rand(5,10),rand(-5,5))
								c.Bill.Amount.Text = "+"..math.ceil(amount*script.Values.Attack.Value/1000+.5).."k!"
								c.Bill.Amount.Rotation = rand(-5,5)
								c.Bill.Amount.TextColor3 = NG.LowerHalf.FormName.TextColor3
								c.Bill.Amount.TextStrokeColor3 = NG.LowerHalf.FormName.TextStrokeColor3
								local x = rand(-1,1)
								local tim = rand(15,30)/10
								local info = TweenInfo.new(tim,Sine,In,0,false,0)
								local prop = {Rotation=90*x;TextTransparency=1;TextStrokeTransparency=1}
								local tween = tweens:Create(c.Bill.Amount,info,prop)
								tween:Play()
								local prop = {CFrame=c.CFrame+V3(0,30,0)}
								local tween = tweens:Create(c,info,prop)
								tween:Play()
								c.Parent = d
								game:GetService("Debris"):AddItem(c,3)
							end
						end
					end
				end
			end
		end
	end
end


function crater(cframe,size,distance)
	local angle = 0
	for i = 1,18 do
		angle = angle + 20
		local ray = Ray.new((cframe*CFA(0,angle,0)*CFN(0,15,-distance)).Position,V3(0,-30,0))
		local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{plr,d},false,true)
		if RPA then
			local s = Instance.new("Part",d)
			game:GetService("Debris"):AddItem(s,5)
			local info = TweenInfo.new(5,Sine,Out,0,false,0)
			local prop = {Transparency = 1}
			local tween = tweens:Create(s,info,prop)
			tween:Play()
			s.Anchored = true
			s.Position = RPS
			s.CanCollide = false
			s.CastShadow = false
			s.Orientation = V3(rand(0,360),rand(0,360),rand(0,360))
			s.Size = V3(rand(7,10),rand(7,10),rand(7,10))*size
			s.Material = RPA.Material
			s.Color = RPA.Color
			
		end
	end
end

local canswitch = true
local activedynamic = false

local altindex = 0
local gui = script.PlayerGui
local switchcooldown = 0
gui.Enabled=true

local comebackidle = "APEX"
local altswitchcooldown = 0
function formswitch(textcolor,textstrokecolor,theme,primary,secondary,walkspeed,jumppower,attack,formname,formfont,wingstyle,formidle,themevolume,fancyexplosionbool,altindexnumber,corebool,scriptname,dynamic,themename,extrawingsbool,marbleimage)
	if canswitch == false or switchcooldown > 0 then return end
	if script.Values.CurrentForm.Value == formname then return end
	Root.Anchored=true
	Root.Velocity = V3()
	if fancyexplosionbool == true then
		sound(torsocframe,1835338251,.5,3,0,50)
		canswitch = false
		Hum.WalkSpeed = 0
		Hum.JumpPower = 0
		script.Values.Anim.Value = "SWITCH START"
		local a = 0

		for i = 1,40 do
			local c = W1PC
			local x = rand(1,2)
			if x == 1 then
				c = W1SC
			end
			local data = torsocframe*CFR(0,360,0,360,0,360)
			effect("Sphere",data*CFN(0,rand(50,100),0),V3(3,3,3),c,Neon,1,rand(2,5)/10,Quart,In,false,{Size=V3(.05,.05,.05);CFrame=data},0,Sine)
		end
		effect("Sphere",torsocframe,V3(50,50,50),W1PC,Neon,1,.5,Sine,In,false,{Size=V3(.05,.05,.05)},0,Sine)
		local cf = torsocframe*CFR(0,360,0,360,0,360)
		effect("HoleSphere2",cf,V3(50.1,50.1,50.1),W1PC,Neon,1,.5,Quart,In,false,{Size=V3(.05,.05,.05);CFrame=cf*CFA(rand(-50,50),rand(-50,50),rand(-50,50))},0,Sine)
		effect("Sphere",torsocframe,V3(50,50,50),W1SC,Forcefield,1,.5,Quart,In,false,{Size=V3(.05,.05,.05)},0,Sine)
		if fury == false then
			local info = TweenInfo.new(.4,Sine,In,0,false,0)
			local prop = {PlaybackSpeed=0}
			local tween = tweens:Create(Theme,info,prop)
			tween:Play()
		end
		wait(.5)
	end
	script.Values.Anim.Value = "SWITCH"
	script.Values.WingStyle.Value = wingstyle
	Theme.PlaybackSpeed = 1
	Theme.SoundId = "rbxassetid://"..theme
	Theme.Volume = themevolume*2
	if fury == true then
		textcolor = C3R(0,0,0)
		textstrokecolor = C3R(255,30,60)
		primary = textcolor
		secondary = textstrokecolor
		Theme.SoundId = "rbxassetid://6913550990"
		Theme.Volume = 10
		themename = "NOTHING-NEW-TODAY \|/ (Has Gone InSanE)"
	end
	NG.LowerHalf.FormName.TextColor3 = textcolor
	NG.LowerHalf.ScriptName.TextColor3 = textcolor
	NG.LowerHalf.FormName.TextStrokeColor3 = textstrokecolor
	NG.LowerHalf.ScriptName.TextStrokeColor3 = textstrokecolor
	NG.LowerHalf.Deco.BackgroundColor3 = textstrokecolor
	NG.LowerHalf.Deco.Inner.BackgroundColor3 = textcolor
	NG.UpperHalf.Center.BackgroundColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Marble.ImageColor3 = textcolor
	NG.UpperHalf.Center.Inner.Marble.Inner.ImageColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Marble.Inner.Pattern.ImageColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Bar.BackgroundColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Amount.TextStrokeColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Amount.TextColor3 = textcolor
	NG.UpperHalf.Center.Inner.Max.TextStrokeColor3 = textstrokecolor
	NG.UpperHalf.Center.Inner.Max.TextColor3 = textcolor
	for i,v in pairs({wing1,wing2,wing3,wing4,wing5,wing6,wing7,wing8,wing9,wing10,wing11,wing12}) do
		v.Primary.Color = primary
		v.Secondary.Color = secondary
		v.Spin.Color = primary
		v.Primary.PointLight.Color = primary
		v.Particle["0"].Main.Color = ColorSequence.new(primary)
		v.Particle["0"].Secondary.Color = ColorSequence.new(primary)
		v.Particle["0"].Circle.Color = ColorSequence.new(primary)
		v.Particle["0"].Shine.Color = ColorSequence.new(primary)
		v.Trail.Color = ColorSequence.new(primary)
		
		v.Primary.Main.Color = ColorSequence.new(primary)
		v.Secondary.Main.Color = ColorSequence.new(secondary)
		
	end
	W1PC = primary
	W1SC = secondary
	NG.LowerHalf.FormName.Text = formname
	NG.LowerHalf.FormName.Font = formfont
	Hum.WalkSpeed = walkspeed
	Hum.JumpPower = jumppower
	if fury == true then
		Hum.WalkSpeed = walkspeed*5
		Hum.JumpPower = jumppower*2
	end
	
	script.Values.CurrentForm.Value = formname
	
	for i,v in pairs({NG.LowerHalf.Vis1,NG.LowerHalf.Vis2,NG.LowerHalf.Vis3,NG.LowerHalf.Vis4,NG.LowerHalf.Vis5,NG.LowerHalf.Vis6,NG.LowerHalf.Vis7,NG.LowerHalf.Vis8,NG.LowerHalf.Vis9}) do
		v.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,textstrokecolor),ColorSequenceKeypoint.new(1,textcolor)})
	end
	effect("Sphere",torsocframe,V3(5,5,5),primary,Neon,0,.8,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
	effect("Sphere",torsocframe,V3(5,5,5),secondary,Neon,0,1.4,Sine,Out,false,{Size=V3(50,50,50)},1,Sine)
	effect("HoleSphere2",torsocframe*CFR(0,360,0,360,0,360),V3(5,5,5),primary,Neon,0,.4,Sine,Out,false,{Size=V3(75,75,75)},1,Sine)
	local cf = torsocframe*CFR(0,360,0,360,0,360)
	effect("HoleSphere",cf,V3(5,5,5),secondary,Neon,0,.25,Sine,Out,false,{Size=V3(150,150,150);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Sine)
	local cf = torsocframe*CFA(0,rand(0,360),0)
	for i = 1,3 do
		local r = torsocframe*CFR(0,360,0,360,0,360)
		effect("LightWind",r,V3(5,5,5),secondary,Neon,0,.5,Quad,Out,false,{Size=V3(120,70,120);CFrame=r*CFR(-50,50,-50,50,-50,50)},1,Sine)
	end
	for i = 1,5 do
		effect("Star",torsocframe*CFR(0,360,0,360,0,360),V3(0,180,180),secondary,Neon,0,rand(10,50)/100,Quad,Out,false,{Size=V3(rand(300,600),0,0)},1,Linear)
	end
	sound(torsocframe,6150724423,.5,1,0,50)
	camshake(Root.Position,25,10)
	local x = 0
	for i = 1,15 do
		local c = primary
		local x = rand(1,2)
		if x == 1 then
			c = secondary
		end
		local data = torsocframe*CFR(0,360,0,360,0,360)
		effect("Sphere",data,V3(.05,.05,.05),c,Neon,0,rand(5,15)/10,Sine,Out,false,{Size=V3(10,10,10);CFrame=data*CFN(0,rand(50,120),0)},1,Sine)
	end
	
	if fancyexplosionbool == true then
		sound(Root.CFrame,610327604,1,1.5,0,50)
		sound(torsocframe,4735205897,.5,1,0,50)
		sound(torsocframe,3359047385,.25,1,0,50)
		for i = 0,2 do
			local cf = torsocframe*CFA(rand(0,360),rand(0,360),rand(0,360))
			effect("HoleSphere2",torsocframe,V3(5,5,5),primary,Neon,0,.75,Quad,Out,false,{Size=V3(150,150,150);CFrame=cf*CFA(rand(-50,50),rand(-50,50),rand(-50,50))},1,Sine)
		end
		local ray = Ray.new(Root.Position+V3(0,10,0),V3(0,-20,0))
		local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{plr,d},false,true)
		if RPA then
			local cf = CFN(RPS,RPS+NO)*CFA(90,0,0)*CFR(0,0,0,360,0,0)
			effect("LightWind",cf,V3(.05,.05,.05),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(200,.05,200);CFrame=cf*CFA(0,rand(-90,90),0)},1,Quad)
			local cf = CFN(RPS,RPS+NO)*CFA(90,0,0)*CFR(0,0,0,360,0,0)
			effect("LightWind",cf,V3(.05,.05,.05),W1PC,Neon,0,1,Sine,Out,false,{Size=V3(200,.05,200);CFrame=cf*CFA(0,rand(-90,90),0)},1,Quad)
			local cf = CFN(RPS,RPS+NO)*CFA(90,rand(0,360),0)
			effect("Fire",cf,V3(.05,.05,.05),W1PC,Neon,0,2.7,Quint,InOut,false,{Size=V3(500,.05,500);CFrame=cf*CFR(0,0,-180,-180,0,0)},1,Quad)
			local cf2 = cf*CFR(0,0,180,180,0,0)
			effect("Fire",cf2,V3(.05,.05,.05),W1PC,Neon,0,2.7,Quint,InOut,false,{Size=V3(500,.05,500);CFrame=cf2*CFR(0,0,180,180,0,0)},1,Quad)
		end
	
	end
	comebackidle = formidle
	pointlight.Color = primary
	activedynamic = dynamic
	if fury == true then
		activedynamic = false
	end
	NG.LowerHalf.ScriptName.Text = scriptname.." // "..nametodisplay
	gui.Music.SongName.Text = themename
	
	if extrawingsbool then
		for i,v in pairs({wing7,wing8,wing9,wing10,wing11,wing12}) do
			v.Primary.Transparency=0
			v.Secondary.Transparency=0
			v.Spin.Transparency=0
			v.Trail.Enabled=true
			v.Primary.Main.Enabled=true
			v.Secondary.Main.Enabled=true
			v.Primary.PointLight.Enabled=true
			v.Beam.Enabled=true
			for _,c in pairs(v.Particle["0"]:GetChildren()) do
				c.Enabled=true
			end
		end
	else
		for i,v in pairs({wing7,wing8,wing9,wing10,wing11,wing12}) do
			v.Primary.Transparency=1
			v.Secondary.Transparency=1
			v.Spin.Transparency=1
			v.Trail.Enabled=false
			v.Primary.Main.Enabled=false
			v.Secondary.Main.Enabled=false
			v.Primary.PointLight.Enabled=false
			v.Beam.Enabled=false
			for _,c in pairs(v.Particle["0"]:GetChildren()) do
				c.Enabled=false
			end
		end
	end
	
	script.AstralReflection.FormName.Text = formname
	script.AstralReflection.FormName.Font = formfont
	script.AstralReflection.FormName.TextColor3 = secondary
	script.AstralReflection.FormName.TextStrokeColor3 = primary
	local z,c,v = 0,0,0
	if formidle == "APEX" then
		z = 1 c = 2 v = 3
	elseif formidle == "REPRESSION" then
		z = 4 c = 5 v = 6
	elseif formidle == "EXECUTION" then
		c = 8
	end
	script.AstralReflection.Z.Value = z
	script.AstralReflection.C.Value = c
	script.AstralReflection.V.Value = v
	altindex = altindexnumber
	script.Values.CurrentBaseForm.Value = wingstyle
	if marbleimage then
		NG.UpperHalf.Center.Inner.Marble.Inner.Pattern.Image = marbleimage
	end
	script.Values.Attack.Value = attack
	if fury == true then
		script.Values.Attack.Value = attack*3
	end
	if fancyexplosionbool == true then
		wait(.75)
		altswitchcooldown = .5
	end
	Root.Anchored=false
	script.Values.Anim.Value = formidle
	canswitch = true
end

local c3 = C3R

local usedmove = "Z"
local cds = true
function cooldown(duration)
	if cds == true and fury == false then
		script.Cooldowns:FindFirstChild(usedmove).Value = script.Cooldowns:FindFirstChild("Equipped"..usedmove)
		script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value = 0
		local info = TweenInfo.new(duration,Linear,In,0,false,0)
		local prop = {Value=1} 
		local tween = tweens:Create(script.Cooldowns:FindFirstChild(usedmove).Cooldown,info,prop)
		tween:Play()
	end
end

holdingf = false
holdingz = false
function teleport()
	if canswitch == true then
		local p = 0
		canswitch = false
		Root.Anchored=true
		script.Values.Anim.Value = "TELEPORT"
		repeat
			wait()
			p = math.clamp(p+.1,0,1)
		until holdingf == false or p >= 1
		if p == 1 then
			sound(Root.CFrame,847061203,.5,1,0,50)
			local cf = Root.CFrame*CFN(0,5,0)*CFR(0,360,0,360,0,360)
			local cf2 = cf*CFR(-10,10,-10,10,-10,10)
			effect("Star",cf,V3(0,50,50),W1PC,Neon,0,.5,Quint,Out,false,{Size=V3(200,3,3);CFrame=cf2},1,Sine)
			effect("Star",cf,V3(0,60,60),W1SC,Neon,.5,.5,Quint,Out,false,{Size=V3(220,4,4);CFrame=cf2},1,Sine)
			repeat
				wait()
			until holdingf == false
		end
		
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(100,100,100),W1SC,Forcefield,1,.3,Sine,In,false,{Size=V3(3,3,3);CFrame=cf*CFR(-40,40,-40,40,-40,40)},0,Sine)
		effect("HoleSphere",cf*CFR(0,360,0,360,0,360),V3(130,130,130),W1PC,Neon,1,.15,Sine,In,false,{Size=V3(3,3,3)},0,Sine)
		effect("Sphere",cf,V3(60,60,60),W1PC,Neon,1,.6,Sine,In,false,{Size=V3(3,3,3)},0,Sine)
		for i = 1,2 do
			local cf2 = cf*CFR(0,360,0,360,0,360)
			effect("LightWind",cf2,V3(160,0,160),W1SC,Neon,1,rand(10,20)/100,Sine,In,false,{Size=V3(0,0,0);CFrame=cf2*CFR(0,0,-50,50,0,0)},0,Linear)
		end
		
		local startingpos = Root.Position
		local orientation = Root.Orientation.Y
		Root.CFrame = CFN(mousecframe.Position)*CFN(0,3,0)*CFA(0,orientation,0)
		if beeified == true then
			falsetorso.Amulet.AmuletBase.CFrame = Torso.CFrame*CFN(0,0,-.6)
		end
		camshake(Root.Position,30,3)
		
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(3,3,3),W1SC,Forcefield,0,.3,Sine,Out,false,{Size=V3(100,100,100);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Sine)
		effect("HoleSphere",cf*CFR(0,360,0,360,0,360),V3(3,3,3),W1PC,Neon,0,.15,Sine,Out,false,{Size=V3(130,130,130)},1,Sine)
		effect("Sphere",cf,V3(3,3,3),W1PC,Neon,0,.6,Sine,Out,false,{Size=V3(60,60,60)},1,Sine)
		for i = 1,2 do
			local cf2 = cf*CFR(0,360,0,360,0,360)
			effect("LightWind",cf2,V3(0,0,0),W1SC,Neon,0,rand(10,20)/100,Sine,Out,false,{Size=V3(160,0,160);CFrame=cf2*CFR(0,0,-50,50,0,0)},1,Linear)
		end
		sound(Root.CFrame,1177785010,1,1,0,50)
		if p ~= 1 then

		end
		if p == 1 then

			sound(Root.CFrame,1905343596,1,1,0,50)
			effect("InvertedSpike",cf*CFR(0,360,0,360,0,360),V3(0,0,0),W1PC,Neon,0,.2,Quad,Out,false,{Size=V3(90,90,90)},1,Linear)
			for i = 1,4 do
				local cf = Root.CFrame*CFR(0,360,0,360,0,360)
				local a = rand(90,150)
				effect("LightWind",cf,V3(.05,.05,.05),W1SC,Neon,0,rand(3,8)/10,Sine,Out,false,{Size=V3(a,.05,a);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Sine)
			end
			if script.Values.CurrentBaseForm.Value ~= "VIRTUE" then
				damage(Root.Position,30,rand(50000,80000))
			else
				heal(Root.Position,30,rand(50000,80000),false,true)
			end
			local endingpos = Root.Position
			local mag = (startingpos-endingpos).magnitude
			local count = 0
			repeat
				if mag >= 20 then
					mag = mag - 20
					count = math.clamp(count + 1,0,50)
				end
			until mag < 20
			if count > 0 then
				local dist = 0
				repeat
					count = count - 1
					dist = dist + 20
					local info = TweenInfo.new(rand(5,15)/10,Sine,In,0,false,0)
					local prop = {Transparency=1}
					local prop2 = {Brightness=0}
					local d = teleportfx:Clone()
					for i,v in pairs(d:GetDescendants()) do
						if v:IsA("Part") or v:IsA("PointLight") then
							v.Color = W1PC
							if v:IsA("Part") then
								local tween = tweens:Create(v,info,prop)
								tween:Play()
								v.CastShadow=false
							elseif v:IsA("PointLight") then
								local tween = tweens:Create(v,info,prop2)
								tween:Play()
							end
						end
					end
					game:GetService("Debris"):AddItem(d,1.5)
					d.Center.CFrame = CFN(startingpos,endingpos)*CFN(0,0,-dist)
					d.Parent = workspace.LastStarMouseIgnore
				until count == 0
			end
		end
		
		script.Values.Anim.Value = comebackidle
		Root.Anchored=false
		canswitch = true
	end
end




-- APEX MOVES
function tweenroot(tim,style,direction,prop)
	script.Events.TweenRoot:FireAllClients(tim,style,direction,prop)
end
function apexslamrewrite()
	if canswitch == false then return end
	wait()
	canswitch = false
	Root.Anchored=true
	script.Values.Anim.Value = "ApexRun"
	Root.CFrame = CFrame.new(Root.Position,V3(mousecframe.Position.X,Root.Position.Y,mousecframe.Position.Z))
	local range = 200
	local R,RP,N = ray(Root.Position,Root.CFrame.LookVector.Unit*range)
	local mag = (Root.Position-RP).Magnitude
	local prop = {CFrame = CFrame.new(Root.Position,V3(mousecframe.Position.X,Root.Position.Y,mousecframe.Position.Z))*CFN(0,0,-mag)}
	tweenroot(1*(mag/range),Linear,In,prop)
	wait(1*(mag/range))
	script.Values.Anim.Value = script.Values.CurrentBaseForm.Value
	wait(.1)
	canswitch = true
	Root.Anchored=false
end
function apexslam()
	if canswitch == false then return end
	canswitch = false
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "SWING"
	wait(.3)
	sound(Root.CFrame,4958430453,.25,1.3,0,50)
	Root.Anchored=true
	script.Values.Anim.Value = "GRAB"
	local target
	local range = 6
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Humanoid") then
			if v.Health > 0 then
				if v.Parent ~= script.Parent then
					local root,torso = v.Parent:FindFirstChild("HumanoidRootPart"),v.Parent:FindFirstChild("Torso")
					if root and torso then
						local magnitude = (Root.Position-root.Position).Magnitude
						if magnitude < range then
							range = magnitude
							target = v.Parent
						end
						if v.Parent:FindFirstChild("LastStar") then
							if v.Parent.LastStar.Values.Safezone.Value == 1 then target = nil end
						end
					end
				end
			end
		end
	end
	wait(.1)
	if target then
		if target.Humanoid.Health > target.Humanoid.MaxHealth*.3 and fury == false and instakill == false then
			target = nil
			chatmsg("Not weak enough.")
		end
	end
	if target == nil then
		canswitch = true
		script.Values.Anim.Value = res
		Root.Anchored=false
	else

		sound(Root.CFrame,545219984,1,1,0,100)
		local s = script.Sounds.voiceline:Clone()
		s.Parent = Root
		s.Playing=true
		if script.Values.CurrentForm.Value == "OBSCURITY" then
			s.SoundId = "rbxassetid://907330011"
			chatmsg("P i t a f u l")
		else
			chatmsg("!!SHUT UP and DIE!! -Ronald McDonald told me :)")
		end
		game:GetService("Debris"):AddItem(s,3)
		local w = Instance.new("Weld",Root)
		w.C0 = CFN(0,-1,1)*CFA(-90,0,0)
		game:GetService("Debris"):AddItem(w,1)
		w.Part0 = RA
		w.Part1 = target.Torso
		script.Values.Anim.Value = "SWING"
		wait(.8)
		script.Values.Anim.Value = "SLAM"
		wait(.1)
		target:BreakJoints()
		for i,v in pairs(target:GetDescendants()) do
			if v:isA("Part") then
				local vel = Instance.new("BodyVelocity",v)
				vel.MaxForce = V3(math.huge,math.huge,math.huge)
				vel.Velocity = Root.CFrame.LookVector.Unit*rand(100,150)+V3(rand(-20,20),rand(5,10),rand(-20,20))
				game:GetService("Debris"):AddItem(vel,.1)
			end
		end
		local light = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
		light.TintColor = W1PC
		light.Contrast = -2
		game:GetService("Debris"):AddItem(light,.05)
		camshake(Root.Position,100,50)
		sound(Root.CFrame,3744400428,1.5,rand(90,110)/100,0,100)
		sound(Root.CFrame,2965762659,1.5,rand(90,110)/100,0,100)
		sound(Root.CFrame,157878578,1.5,rand(90,110)/100,0,100)
		sound(Root.CFrame,610327604,1,1,.4,150)
		effect("Sphere",Root.CFrame,V3(300,100000,300),W1PC,Forcefield,1,1.4,Quad,In,true,{Size=V3(.05,100000,.05)},0,Quint)
		
		local ray = Ray.new(Root.Position,V3(0,-5,0))
		local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{plr,d},false,true)
		if RPA then
			effect("LightWind",CFN(RPS,RPS+NO)*CFA(-90,rand(0,360),0),V3(.05,.05,.05),W1SC,Neon,0,1,Quart,Out,false,{Size=V3(500,.05,500);CFrame=CFN(0,2.5,0)*CFN(RPS,RPS+NO)*CFA(-90,rand(0,360),0)},1,Sine)
			effect("LightWind",CFN(RPS,RPS+NO)*CFA(-90,rand(0,360),0),V3(.05,.05,.05),W1PC,Neon,0,1,Quart,Out,false,{Size=V3(500,.05,500);CFrame=CFN(0,2.5,0)*CFN(RPS,RPS+NO)*CFA(-90,rand(0,360),0)},1,Sine)
			effect("Sphere",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(300,0,300),W1PC,Neon,1,1.4,Quad,In,true,{Size=V3(.05,0,.05)},0,Quint)
		end
		for i = 1,15 do
			local cf = Root.CFrame*CFR(0,360,0,360,0,360)
			effect("Sphere",cf,V3(10,10,10),W1PC,Neon,0,rand(5,15)/10,Sine,Out,false,{CFrame=cf*CFN(0,rand(90,120),0)*CFR(-160,160,-160,160,-160,160)},1,Sine)
		end
		effect("Sphere",Root.CFrame,V3(60,60,60),W1PC,Neon,0,.7,Sine,In,false,{Size=V3(.05,.05,.05)},1,Sine)
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("HoleSphere2",cf,V3(.05,.05,.05),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(80,80,80);CFrame=cf*CFR(-30,30,-30,30,-30,30)},1,Sine)
		for i = 1,4 do
			local cf = Root.CFrame*CFR(0,360,0,360,0,360)
			local a = rand(110,180)
			effect("LightWind",cf,V3(.05,.05,.05),W1PC,Neon,0,rand(7,14)/10,Sine,Out,false,{Size=V3(a,.05,a);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Linear)
		end
		
		crater(Root.CFrame,1.5,25)
		
		wait(1)
		script.Values.Anim.Value = res
		canswitch = true
		Root.Anchored=false
	end
end
local pullingchain = false
local cancelchain =  false
function cocacola()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "Ground Stomp 1"
	wait(.5)
	script.Values.Anim.Value = "Ground Stomp 2"
	local info = TweenInfo.new(1,Circular,In,0,false,0)
	local prop = {Color=W1PC}
	local RP,RPO,NO = ray(Root.Position,V3(0,-50,0))
	local destroytable = {}
	if RP then
		effect("Sphere",CFN(RPO,RPO+NO)*CFA(-90,0,0),V3(100,1,100),W1PC,Neon,0,.3,Circular,In,false,{Size=V3(300,0,300)},1,Sine)
		camshake(Root.Position,200,20)
		sound(Root.CFrame,2965762659,1,1,0,70)
		sound(Root.CFrame,151776180,1.5,1,0,70)
		sound(Root.CFrame,3744400428,2,1,0,70)
		local P1 = {}
		for i = 1,7 do
			local cf = CFN(RPO)*CFA(0,51*i+rand(-20,20),0)*CFN(0,0,15)
			for u = 1,6 do
				local p = Instance.new("Part",d)
				local addon = math.random(0,200)/1000
				game:GetService("Debris"):AddItem(p,.3+(20-u)/20+addon)
				p.Color = W1SC
				p.Material = Neon
				p.Anchored=true
				p.CFrame = cf
				p.Size = V3(.7,0,30)
				p.CanCollide=false
				local tween = tweens:Create(p,info,prop)
				tween:Play()
				
				local p = Instance.new("Part",d)
				game:GetService("Debris"):AddItem(p,(.3+20-u)/20+addon)
				table.insert(destroytable,#destroytable+1,p)
				p.Color = W1SC
				p.Shape = "Ball"
				p.Material = Neon
				p.Anchored=true
				p.CFrame = cf*CFN(0,0,15)
				p.Size = V3(3,3,3)
				p.CanCollide=false
				local tween = tweens:Create(p,info,prop)
				tween:Play()
				
				cf = cf*CFN(0,0,15)*CFA(0,rand(-60,60),0)*CFN(0,0,15)
			end
		end
	end
	for i,v in pairs(destroytable) do
		d.ChildRemoved:Connect(function(child)
			if child == v then
				local mod = rand(50,150)/100
				camshake(v.Position,100,10)
				sound(v.CFrame,6141030906,.5,rand(80,120)/100,0,50)
				effect("Sphere",v.CFrame,V3(30,30,30)*mod,W1PC,Neon,0,.5,Quart,Out,false,{Size=V3(80,80,80)*mod;Color=W1PC},1,Circular)
				effect("Sphere",v.CFrame,V3(25,25,25)*mod,W1SC,Neon,0,.7,Quart,Out,false,{Size=V3(50,50,50)*mod},1,Circular)
				for i = 1,3 do
					effect("Sphere",v.CFrame*CFR(0,360,0,360,0,360),V3(5,0,5)*mod,W1SC,Neon,0,rand(40,60)/100,Quart,Out,false,{Size=V3(2,300*rand(90,110)/100,1)*mod},1,Circular)
				end
				local RP,RPO,NO = ray(child.Position+V3(0,1,0),V3(0,-2,0))
				if RP then
					effect("LightWind",CFN(RPO,RPO+NO)*CFA(-90,rand(0,360),0),V3(0,0,0),W1SC,Neon,0,rand(40,50)/100,Quint,Out,false,{Size=V3(150,0,150)*mod},1,Circular)
				end
				damage(v.Position,45*mod,rand(60000,100000))
			end
		end)
	end
	wait(2)
	Root.Anchored=false
	canswitch = true
	script.Values.Anim.Value = res
end
function YOU()
	cancelchain =  false
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	sound(Root.CFrame,4958430453,.25,1.3,0,50)
	local target,hum,root,torso = nil,nil,nil,nil
	if mousetarget ~= nil then
		local thum,troot,ttorso = mousetarget.Parent:FindFirstChildOfClass("Humanoid"),mousetarget.Parent:FindFirstChild("HumanoidRootPart"),mousetarget.Parent:FindFirstChild("Torso")
		if thum == nil then
			thum = mousetarget.Parent.Parent:FindFirstChildOfClass("Humanoid")
		end
		if troot == nil then
			troot = mousetarget.Parent.Parent:FindFirstChildOfClass("HumanoidRootPart")
		end
		if ttorso == nil then
			ttorso = mousetarget.Parent.Parent:FindFirstChildOfClass("Torso")
		end
		if thum and troot and ttorso then
			target = thum.Parent
			hum = thum
			root = troot
			torso = ttorso
		end
	end
	if root then
		if root.Parent:FindFirstChild("LastStar") then
			if root.Parent.LastStar.Values.Safezone.Value == 1 then
				canswitch = true
				Root.Anchored=false
				cancelchain = true
				chatmsg("I'm not a coward.")
			end
		end
	end
	if script.Values.Safezone.Value == 1 and cancelchain == false then
		canswitch = true
		Root.Anchored=false
		cancelchain = true
		chatmsg("I'm not a coward.")
	end
	local res = script.Values.Anim.Value
	if cancelchain == false then
		if target and root then
			Root.CFrame = CFN(Root.Position,V3(root.Position.X,Root.Position.Y,root.Position.Z))
		end
		script.Values.Anim.Value = "SWING"
		wait(.2)
		script.Values.Anim.Value = "GRAB"
	end
	if target and hum and root and torso and cancelchain == false then
		sound(Root.CFrame,4952953428,.7,1,0,50)
		sound(Root.CFrame,5540424854,1,1,0,30)
		sound(root.CFrame,5282858997,1,1,0,30)
		effect("Sphere",root.CFrame,V3(1,1,1),W1PC,Neon,0,.6,Circular,Out,false,{Size=V3(10,10,10);Color=W1SC},1,Sine)
		effect("Sphere",root.CFrame,V3(1,1,1),W1SC,Neon,0,.3,Circular,Out,false,{Size=V3(20,20,20);Color=W1PC},1,Sine)
		for i = 1,3 do
			local cf = root.CFrame*CFR(0,360,0,360,0,360)
			local a = rand(90,110)/100
			effect("LightWind",cf,V3(0,0,0),W1PC,Neon,0,rand(30,60)/100,Circular,Out,false,{Size=V3(60,0,60)*a},1,Sine)
		end
		for i = 1,3 do
			local cf = root.CFrame*CFR(0,360,0,360,0,360)
			local a = rand(90,110)/100
			effect("LightWind",cf,V3(0,0,0),W1SC,Forcefield,0,rand(30,60)/100,Circular,Out,false,{Size=V3(60,0,60)*a},1,Sine)
		end
		camshake(Root.Position,4,10)
		camshake(root.Position,4,10)
		local at = Instance.new("Attachment",RA)
		local at2 = Instance.new("Attachment",torso)
		root.Anchored=true
		
		at.CFrame = CFN(0,-1,0)
		game:GetService("Debris"):AddItem(at,20)
		game:GetService("Debris"):AddItem(at2,20)
		
		local beam = Instance.new("Beam",at)
		beam.Color = ColorSequence.new(W1PC)
		beam.LightInfluence = 0
		beam.LightEmission = .7
		beam.Width0 = 1.5
		beam.Width1 = 1.5
		beam.Texture = "rbxassetid://6161890495"
		beam.Transparency = NumberSequence.new(0)
		beam.Attachment0 = at
		beam.Attachment1 = at2
		beam.FaceCamera = true
		beam.TextureMode = "Static"
		beam.TextureLength = 1.5
		
		local magnitude = (Root.Position-root.Position).Magnitude
		local info = TweenInfo.new(20*magnitude/10000,Sine,Out,0,false,0)
		local prop = {CFrame = Root.CFrame*CFN(0,0,-2)*CFA(0,180,0)}
		local tween = tweens:Create(root,info,prop)
		damage(root.Position,2,rand(20000,30000),0,0,20*magnitude/10000+2)
		wait(.5)
		tween:Play()
		script.Values.Anim.Value = "SWING"
		pullingchain = true
		wait(20*magnitude/10000)
		pullingchain = false
		root.Anchored=false
		script.Values.Anim.Value = "APEX"
		canswitch = true
		Root.Anchored=false
		beam:Destroy()
		at:Destroy()
		at2:Destroy()
	end
	script.Values.Anim.Value = res
	canswitch = true
	Root.Anchored=false
	if not target or not hum or not root or not torso then
		if script.Values.Safezone.Value == 0 and cancelchain == false then
			chatmsg("I need a target.")
		end
	end
end
function AEROnt()
	if canswitch == false then return end
	Root.Anchored=true
	canswitch = false
	local distance = 400
	local size = 1
	local rotation = 1
	local x = 0
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "SWITCH"
	sound(Root.CFrame,255679384,1,1.1,0,350)
	--[[for i = 1,50 do
		distance = distance - 8
		size = size + 1.2
		rotation = rotation+6
		local angle = 0
		for _ = 1,4 do
			angle = angle + 90
			local cf = CFN(Root.Position)*CFA(0,rotation+angle,0)*CFN(0,10,distance)
			local ray = Ray.new(cf.Position,V3(0,-20,0))
			local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{plr,d},false,true)
			if RPA then
				damage(RPS,size/2,rand(20000,30000))
				local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
				local t = rand(30,70)/100
				effect("Sphere",cf,V3(.05,.05,.05),W1PC,Neon,0,t,Sine,Out,false,{Size=V3(size,size*2,size)},1,Linear)
				effect("HoleSphere",cf,V3(.05,.05,.05),W1SC,Neon,0,t,Sine,Out,false,{Size=V3(size+1,size*2+1,size+1)},1,Linear)
				effect("Wind",cf,V3(.05,.05,.05),W1SC,Neon,0,t,Sine,Out,false,{Size=V3(size*1.5,05,size*1.5);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Linear)
			end
			local cf = Root.CFrame*CFR(0,360,0,360,0,360)
			local a = rand(1,2)
			local c = W1SC
			if a == 1 then c = W1PC end
			effect("Sphere",cf*CFN(0,300,0),V3(10,10,10),c,Neon,0,rand(70,100)/100,Sine,In,false,{Size=V3(10,60,10);CFrame=cf},1,Quad)
		end
		wait()
	end]]
	for i = 1,10 do
		effect("LightWind",Root.CFrame*CFR(0,360,0,360,0,360),V3(900+i*100,0,900+i*100)*rand(80,120)/100,W1SC,Neon,1,i/5,Quint,In,false,{Size=V3(0,0,0)},0,Quint)
		effect("Sphere",Root.CFrame,V3(1500-i*100,1500-i*100,1500-i*100),W1PC,Neon,1,i/5,Quint,In,false,{Size=V3(0,0,0)},0,Quint)
		effect("Sphere",Root.CFrame,V3(1000-i*50,1000-i*50,1000-i*50),W1SC,Neon,1,i/5,Quint,In,false,{Size=V3(0,0,0)},0,Quint)
	end
	wait(2)
	effect("Sphere",Root.CFrame,V3(5,5,5),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(1000,1000,1000)},1,Sine)
	effect("Sphere",Root.CFrame,V3(5,5,5),W1PC,Neon,0,.5,Sine,Out,false,{Size=V3(1500,1500,1500)},1,Sine)
	damage(Root.Position,600,rand(40000,50000))
	camshake(Root.Position,600,50)
	sound(Root.CFrame,138677306,1,1,0,350)
	sound(Root.CFrame,6141030906,.5,1,0,350)
	sound(Root.CFrame,1905343596,.5,1,0,350)
	sound(Root.CFrame,134854740,.5,1,0,350)
	sound(Root.CFrame,5519568804,.5,1,0,350)
	sound(Root.CFrame,1577567682,.5,1,0,350)
	sound(Root.CFrame,153832545,.5,1,0,350)
	sound(Root.CFrame,5855423156,.5,1,0,350)
	sound(Root.CFrame,2089920319,.5,1,0,350)
	for i = 1,40 do
		camshake(Root.Position,600,25)
		damage(Root.Position,400,rand(30000,60000))
		
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local s = rand(500,700)
		
		effect("Sphere",Root.CFrame,V3(5,5,5),c,Neon,0,.2,Quad,Out,false,{Size=V3(s,s,s)},1,Linear)
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		effect("Sphere",Root.CFrame*CFR(0,360,0,360,0,360),V3(s*.5,5,s*.5),c,Neon,0,.4,Quint,Out,false,{Size=V3(s*.1,s*3,s*.1)},1,Linear)
		
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("HoleTornado",cf,V3(5,.05,5),c,Neon,0,.4,Sine,Out,false,{Size=V3(s*2,.05,s*2);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Linear)
		
		local ray = Ray.new(Root.Position,V3(0,-5,0))
		local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{d,plr},false,true)
		if RPA then
			local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
			local a = rand(1,2)
			local c = W1SC
			if a == 1 then c = W1PC end
			local x = rand(900,1500)
			effect("LightWind",cf,V3(100,.05,100),c,Neon,0,rand(30,60)/100,Sine,Out,false,{Size=V3(x,.05,x);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Sine)
		end
		
		local a = rand(1,2)
		local c = W1SC
		if a == 1 then c = W1PC end
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(10,10,10),c,Neon,0,rand(30,50)/100,Sine,Out,false,{Size=V3(80,800,80);CFrame=cf*CFN(0,rand(1000,2000),0)},1,Sine)
		
		wait()
	end
	canswitch = true
	Root.Anchored=false
	script.Values.Anim.Value = res
end

-- REPRESSION MOVES
function repressionbombs()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "REPRESSIONBOMBCHARGE"
	local count = 0
	local info = TweenInfo.new(1,Sine,InOut,math.huge,true,0)
	local prop = {Size=V3(3,3,3)}
	local bombtable = {}
	repeat
		count = count+1
		local cf = Root.CFrame*CFN(0,10,0)
		effect("Sphere",Root.CFrame*CFN(0,10,0),V3(5,5,5),W1PC,Neon,0,.2,Sine,Out,false,{Size=V3(10,10,10)},1,Sine)
		local mag = ((Root.CFrame*CFN(0,10,0)).Position-mousecframe.Position).Magnitude
		local cf2 = CFN(cf.Position,mousecframe.Position)*CFN(0,0,-mag/2)*CFA(0,90,0)
		effect("Cylinder",cf2,V3(mag,.5,.5),W1PC,Neon,0,.5,Sine,Out,false,{Size=V3(mag,1,1)},1,Sine)
		local p = Instance.new("Part",d)
		p.Name = plr.Name.."repressionbomb"..count
		p.Shape = "Ball"
		p.Material = Neon
		p.Color = W1PC
		p.Anchored=true
		p.CanCollide=false
		p.CFrame = mousecframe
		p.CastShadow = false
		p.Size = V3(2,2,2)
		local l = Instance.new("PointLight",p)
		l.Color = p.Color
		l.Shadows = false
		l.Brightness = 3
		l.Range = 10
		local tween = tweens:Create(p,info,prop)
		tween:Play()
		sound(mousecframe,5000442343,1,1,0,10)
		sound(mousecframe,3848738002,1,1,0,10)
		table.insert(bombtable,#bombtable+1,p)
		wait()
	until holdingz == false or count == 100
	wait()
	local info = TweenInfo.new(.1,Sine,In,0,false,0)
	local prop = {Size=V3(.05,.05,.05)}
	for i,v in pairs(bombtable) do
		local tween = tweens:Create(v,info,prop)
		tween:Play()
	end
	script.Values.Anim.Value = "REPRESSIONBOMBDETONATE"
	wait(.1)
	local zxc = 0
	for i,v in ipairs(bombtable) do
		local cf = CFN(v.Position)
		v:Destroy()
		effect("Sphere",cf,V3(10,10,10),W1PC,Neon,0,.5,Quad,Out,false,{Size=V3(60,60,60)},1,Sine)
		effect("Sphere",cf,V3(10,10,10),W1SC,Neon,0,.7,Quad,Out,false,{Size=V3(50,50,50)},1,Sine)
		local cf2 = cf*CFR(0,360,0,360,0,360)
		local a = rand(100,150)
		effect("LightWind",cf2,V3(.05,.05,.05),W1PC,Neon,0,rand(5,10)/10,Sine,Out,false,{Size=V3(a,.05,a);CFrame=cf2*CFR(-50,50,-50,50,-50,50)},1,Sine)
		damage(cf.Position,35,rand(15000,25000))
		camshake(cf.Position,200,5)
		local cf2 = cf*CFR(0,360,0,360,0,360)
		effect("Wind",cf,V3(.05,.05,.05),W1SC,Neon,0,.2,Sine,Out,false,{Size=V3(120,100,120);CFrame=cf2*CFR(0,0,-50,50,0,0)},1,Sine)
		sound(cf,5855423156,1,rand(90,110)/100,0,50)
		zxc = zxc + 1
		if zxc == 1 then
			zxc = 0
			heartbeat:Wait()
		end
	end
	canswitch = true
	Root.Anchored=false
	script.Values.Anim.Value = res
end
function circlesofdeath()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "REPRESSIONCIRCLESSTART"
	local pos = mousecframe.Position
	local angle = 0
	local RPA,RPS,NO = ray(pos+V3(0,10,0),V3(0,-20,0))
	for i = 1,3 do
		wait(.3)
		if RPA and RPS and NO then
			effect("Sphere",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(150,1,150),W1SC,Neon,0,.3,Sine,Out,false,{Size=V3(.05,.05,.05)},1,Sine)
			effect("Sphere",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(75,1,75),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(.05,.05,.05)},1,Sine)
			local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
			effect("Fire",cf,V3(150,.05,150),W1PC,Neon,0,.3,Sine,Out,false,{Size=V3(250,.05,250);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Sine)
			sound(CFN(pos),1283290053,1,1,0,50)
		end
	end
	sound(CFN(pos),4144456942,1,1,0,50)
	wait(.35)
	script.Values.Anim.Value = "REPRESSIONCIRCLESEND"
	wait(.05)
	camshake(pos,250,10)
	damage(pos,150,rand(300000,400000))
	sound(CFN(pos),1843115950,1,1,.7,100)
	sound(CFN(pos),383635050,1,1,0,100)
	sound(CFN(pos),1837829564,1,1,0,100)
	sound(CFN(pos),1837829764,1,1,0,100)
	effect("Cylinder",CFN(RPS)*CFA(0,0,-90),V3(2048,0,0),W1PC,Forcefield,0,1,Sine,Out,false,{Size=V3(2048,400,400)},1,Sine)
	effect("Cylinder",CFN(RPS)*CFA(0,0,-90),V3(2048,0,0),W1SC,Forcefield,0,2,Sine,Out,false,{Size=V3(2048,200,200)},1,Sine)
	for i = 1,20 do
		local dist = 6
		angle = angle + 18
		for i = 1,5 do
			local cf = CFN(pos)*CFA(0,angle,0)*CFN(0,0,dist)
			local RPA,RPS,NO = ray(cf.Position+V3(0,50,0),V3(0,-100,0))
			if RPA then
				effect("Sphere",CFN(RPS),V3(0,0,0),W1PC,Neon,0,rand(5,10)/10,Sine,Out,false,{Size=V3(60,60,60)*(i/5)},1,Sine)
				effect("Sphere",CFN(RPS),V3(0,0,0),W1SC,Neon,0,rand(2,3)/10,Sine,Out,false,{Size=V3(60,60,60)*(i/5)},1,Sine)
			end
			dist = dist + 60*(i/5)
		end
	end
	wait(.5)
	Root.Anchored=false
	canswitch = true
	script.Values.Anim.Value = res
end
function bigepic()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored = true
	effect("Sphere",Root.CFrame,V3(200,200,200),W1SC,Neon,1,1,Sine,In,false,{Size=V3(0,0,0)},0,Sine)
	effect("Sphere",Root.CFrame,V3(200,200,200),W1PC,Neon,1,1,Quad,In,false,{Size=V3(0,0,0)},0,Quad)
	sound(Root.CFrame,581516887,1,1,0,50)
	for i = 1,3 do
		wait(.2)
		local cf = CFN(Root.Position)*CFR(0,360,0,360,0,360)
		effect("LightWind",cf,V3(400,0,400),W1SC,Neon,1,.5,Quint,In,false,{Size=V3(0,0,0);CFrame=cf*CFR(-50,50,-50,50,-50,50)},0,Quad)
		effect("HoleSphere2",cf,V3(300,300,300),W1PC,Neon,1,.5,Sine,In,false,{Size=V3(0,0,0);CFrame=cf*CFR(-50,50,-50,50,-50,50)},0,Sine)
		local RPA,RPS,NO = ray(Root.Position,V3(0,-5,0))
		if RPA then
			effect("ThinRing",CFN(RPS,RPS+NO)*CFA(-90,0,0),V3(400,10,400),W1PC,Neon,1,.5,Sine,In,false,{Size=V3(0,0,0)},0,Sine)
		end
		camshake(Root.Position,200,10)
	end
	wait(.4)
	camshake(Root.Position,200,50)
	sound(Root.CFrame,2042706607,2,1,0,50)
	sound(Root.CFrame,1398290761,2,1,0,50)
	sound(Root.CFrame,258057783,2,1,0,50)
	sound(Root.CFrame,5855423156,2,1,0,50)
	effect("Sphere",Root.CFrame,V3(0,0,0),W1PC,Neon,0,.5,Sine,Out,true,{Size=V3(300,300,300)},.5,Linear)
	effect("HoleSphere",Root.CFrame,V3(0,0,0),W1SC,Neon,0,.5,Sine,Out,true,{Size=V3(301,301,301)},.5,Linear)
	effect("Sphere",Root.CFrame,V3(0,0,0),W1SC,Neon,0,.5,Quad,Out,true,{Size=V3(200,200,200)},.5,Linear)
	effect("Sphere",Root.CFrame,V3(0,0,0),W1SC,Neon,0,.5,Sine,Out,false,{Size=V3(500,500,500)},1,Linear)
	effect("Sphere",Root.CFrame,V3(0,0,0),W1PC,Neon,0,.25,Sine,Out,false,{Size=V3(500,500,500)},1,Linear)
	for i = 1,3 do
		local cf = Root.CFrame*CFR(0,360,0,360,0,360)
		effect("HoleSphere2",cf,V3(0,0,0),W1PC,Neon,0,1,Sine,Out,false,{Size=V3(500,500,500)},1,Sine)
	end
	local angle = 0
	crater(Root.CFrame,6,150)
	damage(Root.Position,150,rand(350000,450000))
	Root.Anchored = false
	canswitch = true
end

-- EXECUTION MOVES
function burger()
	if canswitch == false then return end
	local target,hum,root,torso = nil,nil,nil,nil
	if mousetarget ~= nil then
		local thum,troot,ttorso = mousetarget.Parent:FindFirstChildOfClass("Humanoid"),mousetarget.Parent:FindFirstChild("HumanoidRootPart"),mousetarget.Parent:FindFirstChild("Torso")
		if thum == nil then
			thum = mousetarget.Parent.Parent:FindFirstChildOfClass("Humanoid")
		end
		if troot == nil then
			troot = mousetarget.Parent.Parent:FindFirstChildOfClass("HumanoidRootPart")
		end
		if ttorso == nil then
			ttorso = mousetarget.Parent.Parent:FindFirstChildOfClass("Torso")
		end
		if thum and troot and ttorso then
			target = thum.Parent
			hum = thum
			root = troot
			torso = ttorso
		end
	end
	if target and root then
		Root.CFrame = CFN(Root.Position,V3(root.Position.X,Root.Position.Y,root.Position.Z))
	end
	if target and hum and root and torso then
		if target:FindFirstChild("LastStar") then
			if target.LastStar:FindFirstChild("Safezone") then
				if target.LastStar.Safezone.Value == 1 then
					chatmsg("I'm not a coward.")
					return
				end
			end
		end
		if script.Values.Safezone.Value == 1 then
			chatmsg("I'm not a coward.")
			return
		end
		canswitch = false
		Root.Anchored=true
		local cfs = root.CFrame
		local cfb = cfs*CFN(0,0,-3)*CFA(0,180,0)
		Root.CFrame = cfb
		local animstorage = script.Values.Anim.Value
		
		sound(cfb,1177785010,1,1,0,50)
		local cf = cfb*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(3,3,3),W1SC,Forcefield,0,.3,Sine,Out,false,{Size=V3(50,50,50);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Sine)
		effect("HoleSphere",cf*CFR(0,360,0,360,0,360),V3(3,3,3),W1PC,Neon,0,.2,Sine,Out,false,{Size=V3(80,80,80)},1,Sine)
		effect("Sphere",cf,V3(3,3,3),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(40,40,40)},1,Sine)
		for i = 1,2 do
			local cf2 = cf*CFR(0,360,0,360,0,360)
			effect("LightWind",cf2,V3(0,0,0),W1SC,Neon,0,.3,Sine,Out,false,{Size=V3(100,0,100);CFrame=cf2*CFR(0,0,-50,50,0,0)},1,Linear)
		end
		
		script.Values.Anim.Value = "ExecutionGrab"
		local gw = Instance.new("Weld",root)
		gw.Part0 = LA
		gw.Part1 = root
		gw.C0 = CFN(0,-3,0)
		wait(.3)
		sound(Root.CFrame,4958430453,.25,1.3,0,50)
		script.Values.Anim.Value = "ExecutionThrow"
		wait()
		gw:Destroy()
		root.Anchored=true
		root.CFrame = cfs
		local info = TweenInfo.new(1.4,Quint,Out,0,false,0)
		local cfn = cfs*CFN(0,80,0)*CFA(180,0,0)
		local prop = {CFrame=cfn}
		local tween = tweens:Create(root,info,prop)
		tween:Play()
		wait(.6)
		Root.CFrame = cfb*CFN(0,80,0)
		sound(cfb,1177785010,1,1,0,50)
		local cf = cfb*CFN(0,80,0)*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(3,3,3),W1SC,Forcefield,0,.3,Sine,Out,false,{Size=V3(50,50,50);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Sine)
		effect("HoleSphere",cf*CFR(0,360,0,360,0,360),V3(3,3,3),W1PC,Neon,0,.2,Sine,Out,false,{Size=V3(80,80,80)},1,Sine)
		effect("Sphere",cf,V3(3,3,3),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(40,40,40)},1,Sine)
		for i = 1,2 do
			local cf2 = cf*CFR(0,360,0,360,0,360)
			effect("LightWind",cf2,V3(0,0,0),W1SC,Neon,0,.3,Sine,Out,false,{Size=V3(100,0,100);CFrame=cf2*CFR(0,0,-50,50,0,0)},1,Linear)
		end
		script.Values.Anim.Value = "ExecutionCharge"
		sound(cfb,615910787,1,1,0,50)
		wait(.4)
		
		tween:Cancel()
		hum.Health = 1
		script.Values.Anim.Value = "ExecutionSlam"
		
		local RPA,RPS,NO = ray(root.Position+V3(0,-4,0),V3(0,-2000,0))
		if RPA then
			root.CFrame = CFN(RPS)*CFA(180,0,0)
			crater(CFN(RPS),4,80)
			hum.BreakJointsOnDeath=false
			hum.MaxHealth=0
			hum.Health=0
			
			local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFN(0,3,0)
			effect("Wave",cf,V3(160,6,160),W1PC,Neon,0,1,Quad,Out,false,{Size=V3(1000,10,1000);CFrame=cf*CFN.new(0,2,0)},1,Sine)
		end
		local chance = rand(1,10)
		if chance == 1 then
			sound(CFN(RPS),1074184175,2,1,.9,50)
		else
			sound(cfb,3848679789,1,1,0,50)
			sound(cfb,166084014,1,1,0,50)
			sound(cfb,2648563122,1,1,0,50)
			sound(cfb,4921099862,1,1,0,50)
			sound(cfb,5400203733,1,1,.5,50)
			sound(cfb,5855422842,1,1,0,50)
			sound(cfb,1617579644,1,1,0,50)
			sound(cfb,383635050,2,1,0,50)
		end
		effect("Sphere",cfb*CFN(0,80,0),V3(0,0,0),W1SC,Neon,0,.5,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
		effect("Sphere",cfb*CFN(0,80,0),V3(0,0,0),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(200,200,200)},1,Sine)
		effect("Sphere",cfb*CFN(0,80,0),V3(0,0,0),W1SC,Forcefield,0,.3,Sine,Out,false,{Size=V3(300,300,300)},1,Sine)
		for i = 1,2 do
			local cf = cfb*CFN(0,80,0)*CFR(0,360,0,360,0,360)
			effect("HoleSphere2",cf,V3(0,0,0),W1PC,Neon,0,.6,Sine,Out,false,{Size=V3(250,250,250);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Sine)
		end
		effect("ThinRing",cfb*CFN(0,80,0),V3(0,0,0),W1SC,Neon,0,1,Quart,Out,false,{Size=V3(100,3,100)},1,Sine)
		effect("ThinRing",cfb*CFN(0,80,0),V3(0,0,0),W1SC,Neon,0,.5,Quad,Out,false,{Size=V3(100,3,100)*2},1,Sine)
		effect("ThinRing",cfb*CFN(0,80,0),V3(0,0,0),W1SC,Neon,0,.25,Sine,Out,false,{Size=V3(100,3,100)*3},1,Sine)
		
		camshake(RPS,200,100)
		
		wait(.5)
		script.Values.Anim.Value = animstorage
		canswitch = true
		Root.Anchored=false
	else
		if cancelchain == false then
			chatmsg("I need a target.")
		end
	end
end
function bigbolt()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored = true
	
	local postable = {}
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "Execution Z 1"
	wait(.1)
	for i = 1,3 do
		script.Values.Anim.Value = "Execution Z 1"
		wait(.1)
		script.Values.Anim.Value = "Execution Z 2"
		wait(.05)
		local cf = CFN(mousecframe.Position)
		local R,RP,NO = ray(cf.Position+V3(0,10,0),V3(0,-50,0))
		if R then
			effect("Sphere",CFN(RP,RP+NO)*CFA(-90,0,0),V3(40,.5,40),W1PC,Forcefield,0,.5,Sine,Out,false,{Size=V3(100,0,100)},1,Linear)
			effect("Sphere",CFN(RP,RP+NO)*CFA(-90,0,0),V3(20,1,20),W1SC,Forcefield,0,.5,Sine,Out,false,{Size=V3(50,0,50)},1,Linear)
			sound(CFN(RP),615910787,1,1,0,50)
			sound(CFN(RP),260433721,1,2,0,50)
			table.insert(postable,i,RP)
			effect("Sphere",RAcframe*CFN(0,-1,0),V3(1,1,1),W1SC,Neon,0,.3,Sine,Out,false,{Size=V3(5,5,5)},1,Sine)
			effect("Sphere",RAcframe*CFN(0,-1,0),V3(1,1,1),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(8,8,8)},1,Sine)
			effect("Cylinder",CFN((RAcframe*CFN(0,-1,0).Position))*CFA(0,0,-90)+V3(0,1024,0),V3(2048,1,1),W1SC,Neon,0,.3,Sine,Out,false,{Size=V3(2048,3,3)},1,Sine)
			effect("Cylinder",CFN((RAcframe*CFN(0,-1,0).Position))*CFA(0,0,-90)+V3(0,1024,0),V3(2048,1,1),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(2048,5,5)},1,Sine)
			sound(RCF,1177785010,1,.8,0,50)
		end
	end
	wait(.1)
	script.Values.Anim.Value = res
	Root.Anchored = false
	wait(.5)
	for i,v in ipairs(postable) do
		local cf = CFN(v)
		sound(cf,5148124781,1,1,0,50)
		sound(cf,153832545,1,1,0,50)
		sound(cf,1577567682,1,1,0,50)
		effect("Sphere",cf,V3(30,30,30),W1SC,Neon,0,.5,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
		effect("Sphere",cf,V3(50,50,50),W1PC,Neon,0,.7,Sine,Out,false,{Size=V3(130,130,130)},1,Sine)
		effect("Sphere",cf,V3(30,30,30),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(50,50,50)},1,Linear)
		effect("Sphere",cf,V3(50,50,50),W1PC,Neon,0,1.1,Sine,Out,false,{Size=V3(70,70,70)},1,Sine)
		
		effect("HoleSphere2",cf,V3(50,50,50),W1PC,Neon,0,.2,Sine,Out,false,{Size=V3(300,300,300)},1,Sine)
		effect("Cylinder",cf*CFA(0,0,-90),V3(2048,10,10),W1SC,Neon,0,.5,Sine,Out,false,{Size=V3(2048,30,30)},1,Sine)
		
		for y = 1,3 do
			effect("LightWind",cf*CFR(0,360,0,360,0,360),V3(0,0,0),W1SC,Neon,0,rand(60,80)/100,Sine,Out,false,{Size=V3(300,0,300)*rand(80,120)/100},1,Sine)
		end
		for x = 1,6 do
			effect("Cylinder",cf*CFA(0,x*60,-90)*CFN(0,0,15),V3(2048,2,2),W1PC,Neon,0,.7,Sine,Out,false,{Size=V3(2048,10,10)},1,Sine)
		end
		camshake(v,200,10)
		damage(v,45,rand(90000,110000))
	end
	canswitch = true
end

-- ANARCHY MOVES
function bombo()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "Coin Toss 1"
	sound(Root.CFrame,6181007512,1,1.4,0,50)
	wait(.3)
	sound(Root.CFrame,4958430453,1,1,0,50)
	script.Values.Anim.Value = "Coin Toss 2"
	local projectile = Instance.new("Model",nil)
	local core = Instance.new("Part",projectile)
	projectile.Name = "ANARCHYCOIN"
	projectile.PrimaryPart = core
	core.Size = V3(5,5,5)
	core.Material = Neon
	core.Color = W1PC
	core.Shape = "Ball"
	core.CastShadow = false
	core.CFrame = CFrame.new(torsocframe.Position)*CFN(0,0,-3)
	core.CustomPhysicalProperties = PhysicalProperties.new(.01,.01,1,0,1)
	local bounces = 0
	
	local hitbox = Instance.new("Part",core)
	hitbox.Transparency=1
	hitbox.CanCollide=false
	hitbox.Name = "ANARCHYCOINHITBOX"
	hitbox.Color = W1SC
	hitbox.Size = V3(0,0,0)
	
	local w = Instance.new("Weld",hitbox)
	w.Part0 = core
	w.Part1 = hitbox
	
	hitbox.Massless = true
	core.Massless = true
	
	projectile.Parent = d.Projectiles
	projectile.PrimaryPart:SetNetworkOwner(nil)
	local BV = Instance.new("BodyVelocity",core)
	BV.MaxForce =V3(math.huge,math.huge,math.huge)
	BV.Velocity = Root.CFrame.LookVector.Unit*200+V3(0,140,0)
	game:GetService("Debris"):AddItem(BV,.1)
	game:GetService("Debris"):AddItem(projectile,8)
	wait(.2)
	core.Touched:Connect(function(p)
		if p.CanCollide==true and p.Transparency ~= 1 and p.Parent ~= d and bounces < 3 then
			local mult = (4-bounces)/4
			bounces += 1
			wait(.2)
			camshake(core.Position,600,mult*20)
			sound(core.CFrame,512112801,2,2-mult,.3,50)
			sound(core.CFrame,305734380,2,2-mult,0,50)
			sound(core.CFrame,1837829564,2,2-mult,0,50)
			sound(core.CFrame,550965268,2,2-mult,0,50)
			sound(core.CFrame,2965762659,2,2-mult,0,50)
			effect("Sphere",core.CFrame,V3(50,50,50)*mult,core.Color,Neon,0,.2,Sine,Out,false,{Size=V3(200,200,200)*mult;Color=hitbox.Color},1,Sine)
			effect("Sphere",core.CFrame,V3(50,50,50)*mult,core.Color,Neon,0,.7,Sine,Out,false,{Size=V3(200,200,200)*mult;Color=hitbox.Color},1,Sine)
			effect("Sphere",core.CFrame,V3(50,50,50)*mult,hitbox.Color,Neon,0,1.3,Sine,Out,false,{Size=V3(120,120,120)*mult;Color=core.Color},1,Sine)
			for i = 1,5 do
				local cf = core.CFrame*CFR(0,360,0,360,0,360)
				local xd = rand(80,120)/100
				effect("LightWind",cf,V3(0,0,0),hitbox.Color,Neon,0,rand(50,150)/100,Circular,Out,false,{Size=V3(200,0,200)*xd},1,Linear)
			end
			for i = 1,5 do
				local cf = core.CFrame*CFR(0,360,0,360,0,360)
				local xd = rand(80,120)/100
				effect("LightWind",cf,V3(0,0,0),core.Color,Forcefield,0,rand(50,150)/100,Circular,Out,false,{Size=V3(200,0,200)*xd},1,Linear)
			end
			damage(core.Position,100*mult,rand(400000,500000),0,140,5)
			if bounces == 3 then
				projectile:Destroy()
			end
		end
	end)
	wait(.3)
	script.Values.Anim.Value = res
	canswitch = true
	Root.Anchored=false
end

-- VIRTUE MOVES
function burst()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "Healing Burst Start"
	wait(.5)
	script.Values.Anim.Value = "Healing Burst End"
	effect("Sphere",RCF+RV,V3(5,5,5),W1SC,Neon,0,.2,Quad,Out,false,{Size=V3(50,50,50)},1,Linear)
	for i = 1,5 do
		effect("Sphere",RCF+RV,V3(5,5,5),W1PC,Forcefield,0,.6-(i/30),Quint,Out,false,{Size=V3(50+i,50+i,50+i)},1,Linear)
		effect("Sphere",RCF*CFR(0,360,0,360,0,360)+RV,V3(5,0,5),W1SC,Neon,0,rand(40,60)/100,Sine,Out,false,{Size=V3(3,rand(150,300),3)},1,Linear)
		effect("LightWind",RCF*CFR(0,360,0,360,0,360)+RV,V3(0,0,0),W1PC,Neon,0,rand(30,80)/100,Sine,Out,false,{Size=V3(150,0,150)*rand(90,100)/100},1,Linear)
	end
	effect("Sphere",RCF+RV,V3(5,5,5),W1SC,Neon,0,.7,Quad,Out,false,{Size=V3(50,50,50)},1,Linear)
	effect("Sphere",RCF+RV,V3(5,5,5),W1PC,Neon,0,.9,Quad,Out,false,{Size=V3(40,40,40)},1,Linear)
	sound(RCF+RV,3199238931,3,1,0,50)
	sound(RCF+RV,3848677576,1,1,0,50)
	heal(Root.Position+RV,26,rand(150000,200000),true,true)
	camshake(Root.Position+RV,26,5)
	wait(1)
	script.Values.Anim.Value = res
	canswitch = true
	Root.Anchored=false
end

-- ABSOLUTION MOVES
function bigexplosioneee()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	sound(Root.CFrame,336717461,1,1.5,0,100)
	effect("Sphere",Root.CFrame,V3(300,300,300),W1PC,Neon,1,.5,Sine,In,false,{Size=V3(0,0,0)},0,Linear)
	effect("Sphere",Root.CFrame,V3(400,400,400),W1SC,Neon,1,.75,Sine,In,false,{Size=V3(0,0,0)},0,Linear)
	effect("Sphere",Root.CFrame,V3(500,500,500),W1PC,Neon,1,1,Sine,In,false,{Size=V3(0,0,0)},0,Linear)
	local angle = 0
	local startingcf = CFN(Root.Position)*CFA(0,rand(0,360),0)
	wait(1)
	for i = 1,50 do
		angle += 7.2
		local miniangle = 0
		for count = 1,5 do
			local raypart,raypos,normal = ray((startingcf*CFA(0,angle+miniangle,0)*CFN(0,0,i*50)).Position+V3(0,1024,0),V3(0,-2048),0)
			if raypart then
				local cf = CFrame.new(raypos,raypos+normal)
				effect("Sphere",cf,V3(100,100,100),W1PC,Neon,0,1,Sine,In,false,{Size=V3(50,50,50)},1,Sine)
				effect("Sphere",cf,V3(100,100,100),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(200,200,200)},1,Linear)
				effect("InvertedSpike",cf*CFA(rand(0,360),rand(0,360),rand(0,360)),V3(300,300,300),W1SC,Neon,0,.5,Sine,In,false,{Size=V3(0.05,0.05,0.05)},1,Sine)
				camshake(cf.Position,200,50)
				sound(cf,6446564367,1,rand(90,110)/100,0,50)
				damage(cf.Position,150,rand(50000,100000),0,50,5)
			end
			miniangle += 72
		end
		miniangle = 0
		for count = 1,5 do
			local raypart,raypos,normal = ray((startingcf*CFA(0,-angle-miniangle,0)*CFN(0,0,i*50)).Position+V3(0,1024,0),V3(0,-2048),0)
			if raypart then
				local cf = CFrame.new(raypos,raypos+normal)
				effect("Sphere",cf,V3(100,100,100),W1PC,Neon,0,1,Sine,In,false,{Size=V3(50,50,50)},1,Sine)
				effect("Sphere",cf,V3(100,100,100),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(200,200,200)},1,Linear)
				effect("InvertedSpike",cf*CFA(rand(0,360),rand(0,360),rand(0,360)),V3(300,300,300),W1SC,Neon,0,.5,Sine,In,false,{Size=V3(0.05,0.05,0.05)},1,Sine)
				camshake(cf.Position,200,50)
				sound(cf,6446564367,1,rand(90,110)/100,0,50)
			end
			miniangle += 72
		end
		heartbeat:Wait()
	end
	canswitch = true
	Root.Anchored=false
end

-- INFERNUM MOVES
function pyrotf2()
	if canswitch == false then return end
	canswitch = false
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "FLAMETHROWERSTART"
	Root.Anchored=true
	camshake(Root.Position,10,5)
	sound(Root.CFrame,3730690214,1,1,0,50)
	sound(Root.CFrame,3291021366,1,1,0,50)
	sound(Root.CFrame,438666343,1,1,0,50)
	for i = 1,10 do
		wait()
		local cf = Root.CFrame*CFN(0,4,1)*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(2,2,2),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(1,8,1);Color=W1SC;CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Linear)
		effect("LightWind",cf,V3(15,0,15),W1SC,Neon,1,.2,Sine,In,false,{Size=V3(0,0,0);Color=W1PC;CFrame=cf*CFR(-50,50,-50,50,-50,50)},0,Linear)
	end
	script.Values.Anim.Value = "FLAMETHROWEREND"
	wait()
	sound(Root.CFrame,5868574236,1,1,.2,50)
	sound(Root.CFrame,5560680723,1,1,0,50)
	sound(Root.CFrame,3518168170,1,1,.2,50)
	sound(Root.CFrame,142472270,1,1,0,50)
	local pos = (Root.CFrame*CFN(0,0,-80)).Position
	camshake(pos,100,10)
	for i = 1,40 do
		wait()
		damage((Root.CFrame*CFN(0,.25,-1.5)*CFN(0,0,-40)).Position,25,rand(9000,10000),5)
		damage((Root.CFrame*CFN(0,.25,-1.5)*CFN(0,0,-90)).Position,35,rand(8000,9000),5)
		damage((Root.CFrame*CFN(0,.25,-1.5)*CFN(0,0,-150)).Position,50,rand(7000,8000),5)
		local pos = (Root.CFrame*CFN(0,0,-80)).Position
		camshake(pos,100,1)
		for x = 1,2 do
			local cf = Root.CFrame*CFN(0,.25,-1.5)
			effect("Cube",cf*CFR(0,360,0,360,0,360),V3(0,0,0),W1PC,Neon,0,.5,Linear,In,false,{Color=W1SC;Size=V3(50,50,50);CFrame=cf*CFR(-5,5,-5,5,-5,5)*CFN(0,0,-180)*CFR(0,360,0,360,0,360)*CFN(0,rand(-10,10),0)},1,Sine)
			for p = 1,2 do
				local cf = Root.CFrame*CFN(0,.25,-3)
				effect("Cube",cf*CFR(0,360,0,360,0,360),V3(0,0,0),W1PC,Neon,0,rand(20,40)/100,Linear,In,false,{Color=W1SC;Size=V3(1,1,1)*(rand(70,140)/100);CFrame=cf*CFR(-40,40,-40,40,-40,40)*CFN(0,0,rand(-250,-50))*CFR(0,360,0,360,0,360)*CFN(0,rand(-10,10),0)},1,Sine)
			end
		end
	end
	wait(.1)
	script.Values.Anim.Value = res
	Root.Anchored=false
	canswitch = true
end
function hadouken()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "HADOUKENSTART"
	Root.CFrame = CFN(Root.Position,V3(mousecframe.Position.X,Root.Position.Y,mousecframe.Position.Z))
	if script.Values.CurrentForm.Value == "HELLFIRE" then
		sound(Root.CFrame,5154775949,3,1,0,100)
	end
	sound(Root.CFrame,6337656934,1,1,0,50)
	sound(Root.CFrame,902204346,1,1,0,50)
	camshake(Root.Position,10,2)
	for i = 1,40 do
		heartbeat:Wait()
		local cf = Root.CFrame*CFN(2,-1,.7)*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(1.5,1.5,1.5),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(1,4,1)},1,Sine)
		cf = Root.CFrame*CFN(2,-1,.7)*CFR(0,360,0,360,0,360)
		effect("Sphere",cf,V3(1,1,1),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(.5,.5,.5);CFrame=cf*CFN(0,rand(40,60)/10,0)},1,Sine)
		effect("Sphere",cf,V3(8,8,8),W1SC,Forcefield,1,.2,Sine,In,false,{Size=V3(0,0,0)},.5,Sine)
	end
	camshake(Root.Position,10,5)
	sound(Root.CFrame,3356359494,1,1,0,50)
	sound(Root.CFrame,5868574236,1,1,.2,50)
	sound(Root.CFrame,6337656934,1,1.5,0,50)
	script.Values.Anim.Value = "HADOUKENEND"
	local projectile = Instance.new("Model",nil)
	projectile.Name = "INFERNUMPROJECTILE"
	local part = Instance.new("Part",projectile)
	projectile.PrimaryPart = part
	part.Transparency = 1
	part.Color = W1PC
	part.Size = V3(4.5,4.5,4.5)
	part.Shape = "Ball"
	part.CFrame = Root.CFrame*CFN(0,0,-5)
	projectile.Parent = d.Projectiles
	projectile.PrimaryPart:SetNetworkOwner(nil)
	local c = W1SC
	game:GetService("Debris"):AddItem(projectile,10)
	local bv = Instance.new("BodyVelocity",part)
	bv.MaxForce = V3(math.huge,math.huge,math.huge)
	bv.Velocity = Root.CFrame.LookVector.Unit*400
	part.Touched:Connect(function(t)
		if t.Parent ~= plr and t.Parent.Parent ~= plr and t.Parent.Parent.Parent ~= plr and t.Parent ~= d and t.Name ~= "Safezone" then
			damage(part.Position,50,rand(300000,400000),5,100,3.5)
			camshake(part.Position,250,10)
			sound(part.CFrame,512112801,1.5,1,.3,70)
			sound(part.CFrame,2721745637,1.5,1,0,70)
			sound(part.CFrame,151776180,1.5,1,0,70)
			sound(part.CFrame,6429267775,1.5,1,0,70)
			sound(part.CFrame,4810729508,1.5,1,0,70)
			effect("Sphere",part.CFrame,V3(30,30,30),part.Color,Neon,0,.7,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
			effect("Sphere",part.CFrame,V3(30,30,30),c,Neon,0,.5,Sine,Out,false,{Size=V3(50,50,50)},1,Sine)
			effect("Sphere",part.CFrame,V3(30,30,30),part.Color,Neon,0,.1,Sine,Out,false,{Size=V3(100,100,100)},1,Linear)
			effect("Sphere",part.CFrame,V3(30,30,30),c,Neon,0,.25,Sine,Out,false,{Size=V3(100,100,100)},1,Linear)
			for i = 1,5 do
				local cf = part.CFrame*CFR(0,360,0,360,0,360)
				effect("Sphere",cf,V3(25,0,25)*1.5,part.Color,Neon,0,rand(30,60)/100,Sine,Out,false,{Size=V3(10,rand(70,140),10)*1.5},1,Linear)
				cf = part.CFrame*CFR(0,360,0,360,0,360)
				effect("Star",cf,V3(50,0,50)*1.5,part.Color,Neon,0,rand(30,60)/100,Sine,Out,false,{Size=V3(0,rand(140,180),0)*1.5},1,Linear)
			end
			for i = 1,3 do
				local cf = part.CFrame*CFR(0,360,0,360,0,360)
				effect("LightWind",cf,V3(0,0,0),c,Neon,0,rand(30,50)/100,Sine,Out,false,{Size=V3(200,0,200)*(rand(80,120)/100);CFrame=cf*CFR(-30,30,-30,30,-30,30)},1,Linear)
			end
			for i = 1,40 do
				local cf = part.CFrame*CFR(0,360,0,360,0,360)
				local s = rand(30,50)/10
				effect("Cube",cf,V3(s,s,s),part.Color,Neon,0,rand(40,80)/100,Sine,Out,false,{Size=V3(s,s,s)*.7;CFrame=cf*CFN(0,rand(10,100),0)},1,Linear)
			end
			effect("Sphere",part.CFrame,V3(25,25,25),c,Neon,0,.25,Sine,Out,false,{Size=V3(200,200,200)},1,Linear)
			local RPA,RPS,NO = ray(part.Position,V3(0,-50,0))
			if RPA then
				local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
				for i = 1,2 do
					cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
					effect("LightWind",cf,V3(25,0,25),part.Color,Neon,0,.9,Sine,Out,false,{Size=V3(300,0,300);CFrame=cf*CFR(0,0,-30,30,0,0)},1,Sine)
				end
			end
			projectile:Destroy()
		end
	end)
	wait(.5)
	script.Values.Anim.Value = res
	canswitch = true
	Root.Anchored=false
end

-- VINDICTIVE MOVES
function erase()
	if canswitch == false then return end
	if script.Values.CurrentForm.Value ~= "EUPHORIA" then
		sound(Root.CFrame,6551054010,1,1,0,200)
		chatmsg("TIME TO FINISH THIS!")
	else
		sound(Root.CFrame,6460148774,1,1,0,200)
		chatmsg("uwu")
	end
	Root.Anchored=true
	canswitch = false
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "VINDICTIVE Z"
	Root.Velocity = V3()
	wait(.5)
	local light = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
	game:GetService("Debris"):AddItem(light,10)
	local info,info2 = TweenInfo.new(2.4,Sine,In,0,false,0),TweenInfo.new(.1,Sine,In,0,false,0)
	local prop,prop2 = {Brightness=1},{Brightness=0}
	local tween,tween2 = tweens:Create(light,info,prop),tweens:Create(light,info2,prop2)
	tween:Play()
	sound(Root.CFrame,1837833941,1,2,0,200)
	effect("Sphere",Root.CFrame,V3(0,100000,0),C3R(255,255,255),Neon,1,2.5,Sine,In,false,{Size=V3(200,100000,200)},0,Sine)
	wait(2.5)
	tween2:Play()
	effect("Sphere",Root.CFrame,V3(200,2048,200),C3R(255,255,255),Neon,0,.1,Sine,In,false,{Size=V3(0,2048,0)},1,Sine)
	wait(.1)
	script.Values.Anim.Value = "VINDICTIVE Z END"
	sound(Root.CFrame,1837831827,1,1,0,2000)
	sound(Root.CFrame,1577567682,1,1,0,2000)
	sound(Root.CFrame,5400203733,1,1,.3,2000)
	sound(Root.CFrame,2089920319,1,1,0,2000)
	sound(Root.CFrame,1337747268,1,1,0,2000)
	sound(Root.CFrame,5082594678,3,1,.1,2000)
	sound(Root.CFrame,555090374,1,1,0,2000)
	
	sound(Root.CFrame,550965268,3,.5,0,200)
	effect("Sphere",Root.CFrame,V3(50,50,50),W1PC,Neon,0,2,Quint,Out,false,{Size=V3(2048,2048,2048)},1,Linear)
	effect("Sphere",Root.CFrame,V3(50,50,50),W1SC,Neon,0,3,Quint,Out,false,{Size=V3(2048,2048,2048)/2},1,Linear)
	local roar = script.Sounds.Roar:Clone()
	roar.Parent = workspace
	roar:Play()
	game:GetService("Debris"):AddItem(roar,5)
	light.TintColor = W1PC
	light.Contrast = -2
	local info = TweenInfo.new(2,Sine,In,0,false,0)
	local prop = {TintColor = C3R(255,255,255),Contrast=0}
	local tween = tweens:Create(light,info,prop)
	tween:Play()
	local s = instakill
	instakill = true
	camshake(V3(0,0,0),1000000000000,1000)
	damage(V3(0,0,0),1000000000000,9999999)
	instakill = s
	wait(3)
	script.Values.Anim.Value = res
	Root.Anchored=false
	canswitch = true
end

local wheel = gui.FormSelection
local altwheel = false
function changewheel(altBool,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,c1,c1b,c2,c2b,c3,c3b,c4,c4b,c5,c5b,c6,c6b,c7,c7b,c8,c8b,c9,c9b,c10,c10b)
	altwheel = altBool
	
	local index = {i1,i2,i3,i4,i5,i6,i7,i8,i9,i10}
	local colindex = {c1,c2,c3,c4,c5,c6,c7,c8,c9,c10}
	local colindexB = {c1b,c2b,c3b,c4b,c5b,c6b,c7b,c8b,c9b,c10b}
	local fontindex = {f1,f2,f3,f4,f5,f6,f7,f8,f9,f10}
	
	local slices = {wheel["1"],wheel["2"],wheel["3"],wheel["4"],wheel["5"],wheel["6"],wheel["7"],wheel["8"],wheel["9"],wheel["0"]}
	for i,v in ipairs(slices) do
		local name = index[i]
		local color = colindex[i]
		local colorB = colindexB[i]
		local font = fontindex[i]
		v.ID.Value = index[i]
		v.Primary.Value = color
		v.Secondary.Value = colorB
		
		v.TextButton.Text = name
		v.TextButton.Font = font
		v.TextButton.TextColor3 = colorB
		v.TextButton.TextStrokeColor3 = color
		v.ImageColor3 =	color
		v.Marble.ImageColor3 = colorB
		
		v.Marble.Visible=true
		if name == "APEX" or name == "EXCELLENCE" or name == "AGONY" or name == "PARALLELENCE" or name == "CARNAGE" or name == "CALAMITY" or name == "REVOLTION" or name == "PROSPECTUM" or name == "OBSCURITY" or name == "CRYSTALLIZATION" or name == "DOWNFALL" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6593238379"
		elseif name == "PERDURANCE" or name == "ANIMOSITY" or name == "PROPOSITUM" or name == "OBSESSION" or name == "STIRICIDIUM" or name == "EXTREMITY" or name == "DETERIORATION" or name == "ADMISSION" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974497"
		elseif name == "REPRESSION" or name == "ANNIHILATION" or name == "CONTINUUM" or name == "ECLIPSE" or name == "FOCUS" or name == "DEVIANCE" or name == "RUST" or name == "CRIMSON" or name == "CREVASSE" or name == "CHAOS" or name == "STIGMA" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6593357327"
		elseif name == "EXECUTION" or name == "SPECTRAFIELD" or name == "PROHIBITION" or name == "ΣTERNITY" or name == "NEBULA" or name == "AURORA" or name == "UTTERANCE" or name == "SOMNAMBULIST" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6593369926"
		elseif name == "ANARCHY" or name == "HYPERTRANCE" or name == "DESTINY" or name == "LUNAR" or name == "SURREPTITIOUS" or name == "EXHAUSTION" or name == "KATHASTROPHE" or name == "EXTERMINATION" or name == "NOCTURNALITY" or name == "UPHEAVAL" or name == "SILENCE" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974803"
		elseif name == "VIRTUE" or name == "DIAPHANOUS" or name == "DELICACY" or name == "CONTRIVANCE" or name == "ENIGMA" or name == "MOTIVATION" or name == "HEARTFELT" or name == "SENTIMENT" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595997907"
		elseif name == "ABSOLUTION" or name == "VICISSITUDE" or name == "MISMATCHED" or name == "AUTUMN" or name == "DECEPTION" or name == "RETENTION" or name == "ACQUITTAL" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974875"
		elseif name == "INFERNUM" or name == "HELLFIRE" or name == "FERVENCY" or name == "INCANDESCENCE" or name == "BLAZE" or name == "INFERNO" or name == "SHATTERED" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974633"
		elseif name == "DISSONANCE" or name == "DISTORTION" or name == "ALTERATION" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974744"
		elseif name == "WARPSPEED" or name == "LEGERITY" or name == "EXPEDITIOUS" or name == "ACCELERATION" or name == "RAINBOW" or name == "OMEGA" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6596658428"
		elseif name == "INTRICACY" or name == "HERCULEAN" or name == "MASSACRE" then
			v.Marble.Inner.Pattern.Image = "rbxassetid://6595974565"
		else
			v.Marble.Inner.Pattern.Image = "rbxassetid://6593238379"
			if v.Marble.ImageColor3 == C3R(20,20,20) then
				v.Marble.Visible=false
			end
		end
	end
end
changewheel(false,"APEX","REPRESSION","EXECUTION","ANARCHY","VIRTUE","ABSOLUTION","INFERNUM","DISSONANCE","WARPSPEED","INTRICACY","Antique","Oswald","Bodoni","Antique","FredokaOne","Fondamento","JosefinSans","Kalam","Michroma","RobotoCondensed",c3(255,0,0),c3(0,0,0),c3(255,130,0),c3(0,0,0),c3(255,255,255),c3(255,255,255),c3(100,0,255),c3(0,0,0),c3(0,230,255),c3(255,255,255),c3(255,80,80),c3(255,0,0),c3(255,70,0),c3(0,0,0),c3(10,10,10),c3(10,10,10),c3(208, 241, 255),c3(70, 181, 255),c3(100,255,100),c3(255,255,255))

local apexlines = {"Waste of Space.","Get out of my way.","NOTHINGNEWTODAY re-made me."}
local vindictivelines = {"Actions have consequences.","Farewell.","Oh great i'm back."}
local perdurancelines = {"I hate the Floor :(","What is going on here?","All will fall one day."}
local repressionlines = {"You have no power here.","Pathetic.","Why is the sky dark."}
local executionlines = {"Pitiful.","Your destiny is meaningless.","Is this what you truly want?"}
local anarchylines = {"Ready for erasure?","Can you feel the chaos?","I hate people like you.... nah jk."}
local virtuelines = {"Let light shine upon you.","Purity is the way.","Be not afraid."}
local absolutionlines = {"Let this be settled.","The stars are watching.","No more messing around."}
local infernumlines = {"Cast it into the fire.","Hades awaits.","Feel the solar heat."}
local dissonancelines = {"Hello everyone","I bend reality as it bends me.","This dimension is corrupt."}
local warpspeedlines = {"Untouchable!.","I saw Nothingnewtoday around here somewhere.","Demolition!"}
local intricacylines = {"Complexity at its finest.","This ends now.","Face your fears."}
local OHGODWHYHELPMESOMEBODYPLEASE = {"HOW DID YOU FIND THIS MODE.","Eat at McDonalds Or else...","Is anyone actually going to see this?"}
-- // BASE FORMS

local returnwheel = "BASE"
local baseformtable = {
	["APEX"]=function() if altwheel == false then formswitch(C3R(0,0,0),C3R(255,0,0),6924735395,C3R(255,0,0),C3R(0,0,0),16,50,1,"APEX","Antique","APEX","APEX",.4,true,0,true,"True Star Glitcher",false,"C a l m | D o w n",false,"rbxassetid://1841647093") chatmsg(apexlines[rand(1,3)]) returnwheel = "BASE" end end;
	["REPRESSION"]=function() if altwheel == false then formswitch(C3R(0,0,0),C3R(255,130,0),1847588523,C3R(255,100,0),C3R(0,0,0),20,40,1,"REPRESSION","Oswald","REPRESSION","REPRESSION",.4,true,0,true,"True Star Glitcher",false,"Calm Down Buddy",false,"rbxassetid://6593357327") chatmsg(repressionlines[rand(1,3)]) end end;
	["EXECUTION"]=function() if altwheel == false then formswitch(C3R(255,255,255),C3R(0,170,255),1839931160,script.Dynamics.Execution.Value,C3R(200,200,200),100,100,1,"EXECUTION","Bodoni","EXECUTION","EXECUTION",.4,true,0,true,"True Star Glitcher",true,"8 Bit Dubstep",false,"rbxassetid://6593369926") chatmsg(executionlines[rand(1,3)]) end end;
	["ANARCHY"]=function() if altwheel == false then formswitch(C3R(0,0,0),C3R(100,0,255),9245552700,C3R(80,0,255),C3R(0,0,0),60,100,1,"ANARCHY","Antique","ANARCHY","ANARCHY",.6,true,0,true,"True Star Glitcher",false,"TacoBot 3,000",false,"rbxassetid://6595974803") chatmsg(anarchylines[rand(1,3)]) end end;
	["VIRTUE"]=function() if altwheel == false then formswitch(C3R(0,230,255),C3R(255,255,255),9046862941,C3R(80,190,255),C3R(180,180,180),55,50,1,"VIRTUE","FredokaOne","VIRTUE","VIRTUE",.4,true,0,true,"True Star Glitcher",false,"Sunset Chill (Bed Version)",false,"rbxassetid://6595997907") chatmsg(virtuelines[rand(1,3)]) end end;
	["ABSOLUTION"]=function() if altwheel == false then formswitch(C3R(255,80,80),C3R(255,0,00),9045344148,C3R(255,0,0),C3R(255,80,80),300,100,1,"ABSOLUTION","Fondamento","ABSOLUTION","ABSOLUTION",.4,true,0,true,"True Star Glitcher",false,"Forgotten Dreams",false,"rbxassetid://6595974875") chatmsg(absolutionlines[rand(1,3)]) end end;
	["INFERNUM"]=function() if altwheel == false then formswitch(C3R(0,0,0),C3R(255,70,0),1839526985,C3R(255,70,0),C3R(0,0,0),14,50,1,"INFERNUM","JosefinSans","INFERNUM","INFERNUM",.4,true,0,true,"True Star Glitcher",false,"Dubstep Hero",false,"rbxassetid://6595974633") chatmsg(infernumlines[rand(1,3)]) end end;
	["DISSONANCE"]=function() if altwheel == false then formswitch(C3R(0,21,128),C3R(107,0,128),1847523310,C3R(107,0,128),C3R(0,21,128),50,50,1,"DISSONANCE","Kalam","DISSONANCE","DISSONANCE",.35,true,0,true,"True Star Glitcher",true,"Robot Electronic's",false,"rbxassetid://6595974744") chatmsg(dissonancelines[rand(1,3)]) end end;
	["WARPSPEED"]=function() if altwheel == false then formswitch(C3R(70, 181, 255),C3R(208, 241, 255),1839527296,C3R(151, 165, 255),C3R(64, 121, 255),400,50,1,"WARPSPEED","Michroma","WARPSPEED","WARPSPEED",.4,true,0,true,"True Star Glitcher",false,"100% S P E E D",false,"rbxassetid://6596658428") chatmsg(warpspeedlines[rand(1,3)]) end end;
	["INTRICACY"]=function() if altwheel == false then formswitch(C3R(0,255,0),C3R(255,255,255),1847754836,C3R(0,255,0),C3R(255,255,255),200,150,1,"INTRICACY","RobotoCondensed","INTRICACY","INTRICACY",.55,true,0,true,"True Star Glitcher",false,"Deleted Files",false,"rbxassetid://6595974565") chatmsg(intricacylines[rand(1,3)]) end end;
}
local disgraceformtable = {
	["DOWNFALL"]=function() if altwheel == false then formswitch(C3R(0,0,0),C3R(190,60,60),6941090644,C3R(190, 60, 60),C3R(0,0,0),16,50,1,"DOWNFALL","Antique","APEX","DOWNFALL",.6,true,0,true,"True Star Glitcher?",false,"Water Spirit // P.L.U.R",false,"rbxassetid://6595974565") returnwheel = "DISGRACE" end end;
	["ADMISSION"]=function() formswitch(C3R(0,0,0),C3R(255, 175, 62),1057854857,C3R(170, 130, 60),C3R(0,0,0),20,40,1,"ADMISSION","Oswald","REPRESSION","ADMISSION",.4,true,0,true,"True Star Glitcher?",false,"Bossfight // Mescalink") returnwheel = "DISGRACE" end;  -- REPRESSION
	["STIGMA"]=function() formswitch(C3R(0,0,0),script.Dynamics.Execution.Value,5113228942,script.Dynamics.Execution.Value,C3R(0,0,0),100,100,1,"STIGMA","Bodoni","EXECUTION","STIGMA",.4,true,0,true,"True Star Glitcher?",true,"Yooh // Heracles (Extended)") returnwheel = "DISGRACE" end; -- EXECUTION
	["SILENCE"]=function() formswitch(C3R(0,0,0),C3R(70, 0, 255),5097730967,C3R(70, 0, 255),C3R(0, 0, 0),60,100,1,"SILENCE","Antique","ANARCHY","SILENCE",.3,true,0,true,"True Star Glitcher?",false,"This Song is 3:04 Min's LONG LOL") returnwheel = "DISGRACE" end; -- ANARCHY
	["IGNOMINY"]=function() end; -- VIRTUE
	["RETENTION"]=function() formswitch(C3R(0,0,0),C3R(255, 80, 140),6735674317,C3R(255, 80, 140),C3R(255, 0, 70),300,100,1,"RETENTION","Fondamento","ABSOLUTION","RETENTION",1.1,true,0,true,"True Star Glitcher?",false,"Yonaka // Vespertilism") returnwheel = "DISGRACE" end; -- ABSOLUTION
	["DIFFLAMED"]=function() end; -- INFERNUM
	["RAPTURE"]=function() end; -- DISSONANCE
	["HINDRANCE"]=function() end; -- WARPSPEED
	["LIMPIDITY"]=function() end; -- INTRICACY
}
-- // WHEEL CHANGES
local changewheeltable = {
	["BASE"]=function() changewheel(false,"APEX","REPRESSION","EXECUTION","ANARCHY","VIRTUE","ABSOLUTION","INFERNUM","DISSONANCE","WARPSPEED","INTRICACY","Antique","Oswald","Bodoni","Antique","FredokaOne","Fondamento","JosefinSans","Kalam","Michroma","RobotoCondensed",c3(255,0,0),c3(0,0,0),c3(255,130,0),c3(0,0,0),c3(255,255,255),c3(255,255,255),c3(100,0,255),c3(0,0,0),c3(0,230,255),c3(255,255,255),c3(255,80,80),c3(255,0,0),c3(255,70,0),c3(0,0,0),c3(10,10,10),c3(10,10,10),c3(208, 241, 255),c3(70, 181, 255),c3(0,255,0),c3(255,255,255)) end;
	["DISGRACE"]=function() changewheel(false,"DOWNFALL","ADMISSION","STIGMA","SILENCE","","RETENTION","","","","","Antique","Oswald","Bodoni","Antique","Arial","Fondamento","Arial","Arial","Arial","Arial",c3(190,60,60),c3(0,0,0),c3(255, 175, 62),c3(0,0,0),c3(255,255,255),c3(0,0,0),c3(70, 0, 255),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(255, 80, 140),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20)) end;
	["APEXMAJORS"]=function()
		changewheel(false,"PERDURANCE","VINDICTIVE","TEMPEST","","","","","","","","Michroma","Bodoni","Nunito","Arial","Arial","Arial","Arial","Arial","Arial","Arial",c3(255,80,60),c3(81, 25, 19),c3(117,0,0),c3(99,95,98),c3(40,120,160),c3(35,45,55),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
		returnwheel = "BASE"
	end;
	["APEXALTS"]=function() changewheel(true,"APEX","EXCELLENCE","AGONY","PARALLELENCE","CARNAGE","CALAMITY","REVOLTION","PROSPECTUM","OBSCURITY","CRYSTALLIZATION","Antique","GothamSemibold","Antique","GothamBold","Antique","Fondamento","Garamond","Oswald","GothamSemibold","Arcade",c3(255,0,0),c3(0,0,0),c3(255,200,100),c3(255,255,255),c3(200,0,0),c3(0,0,0),c3(255,50,50),c3(255,255,255),c3(130,0,0),c3(255,0,0),c3(50,130,167),c3(20,51,66),c3(167,69,69),c3(230,167,167),c3(143,226,255),c3(255,164,119),c3(200,0,0),c3(0,0,0),c3(255,255,255),c3(150,150,150)) returnwheel = "BASE" end;
	["REPRESSIONALTS"]=function() changewheel(true,"REPRESSION","ANNIHILATION","CONTINUUM","ECLIPSE","FOCUS","DEVIANCE","RESONANCE","CRIMSON","CREVASSE","CHAOS","Oswald","Antique","GothamBold","Fantasy","Code","Antique","Antique","IndieFlower","SciFi","Arcade",c3(255,100,0),c3(0,0,0),c3(255,55,70),c3(0,0,0),c3(100,255,90),c3(0,0,0),c3(255,80,0),c3(0,0,0),c3(168,43,45),c3(0,0,0),c3(100,0,0),c3(0,0,0),c3(255,0,0),c3(124,0,51),c3(180,0,0),c3(0,0,0),c3(78,113,208),c3(255,255,255),c3(255,255,255),c3(27,42,53)) returnwheel = "BASE" end;
	["EXECUTIONALTS"]=function() changewheel(true,"EXECUTION","SPECTRAFIELD","PROHIBITION","ΣTERNITY","NEBULA","AURORA","UTTERANCE","SOMNAMBULIST","","","Bodoni","Arcade","ArialBold","SourceSansSemibold","SciFi","GothamBlack","Fondamento","Bodoni","Arial","Arial",c3(255,255,255),c3(255,255,255),c3(45,45,45),c3(0,0,0),c3(255,0,0),c3(80,0,0),c3(255,255,255),c3(200,200,200),c3(210,100,255),c3(100,160,255),c3(130, 200, 255),c3(255,255,255),c3(240,0,40),c3(10,10,10),c3(166, 197, 255),c3(208, 189, 255),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20)) returnwheel = "BASE" end;
	["ANARCHYALTS"]=function() changewheel(true,"ANARCHY","DESTRUCTION","HYPERTRANCE","LUNAR","SURREPTITIOUS","EXHAUSTION","KATHASTROPHE","EXTERMINATION","NOCTURNALITY","UPHEAVAL","Antique","Garamond","GothamBold","Bodoni","Nunito","Bodoni","Antique","Fondamento","Antique","Code",c3(100,0,255),c3(0,0,0),c3(155,0,155),c3(0,0,0),c3(127, 92, 241),c3(249, 196, 255),c3(0,0,255),c3(0,0,0),c3(33,145,126),c3(0,62,76),c3(196, 40, 28),c3(27,42,53),c3(170,85,225),c3(0,0,0),c3(160,0,0),c3(0,0,0),c3(28,9,56),c3(29,24,91),c3(255,140,0),c3(50,50,50)) returnwheel = "BASE" end;
	["VIRTUEALTS"]=function()changewheel(true,"VIRTUE","DIAPHANOUS","DELICACY","CONTRIVANCE","ENIGMA","MOTIVATION","HEARTFELT","SENTIMENT","","","FredokaOne","Fantasy","GothamBold","Cartoon","SciFi","Nunito","Nunito","IndieFlower","Arial","Arial",c3(0,230,255),c3(255,255,255),c3(255,255,255),c3(150,150,150),c3(255,130,200),c3(255,255,255),c3(255,0,115),c3(255,255,255),c3(0,130,255),c3(0,0,0),C3N(0.0313725, 0.494118, 0.545098),C3N(1, 0.352941, 0.372549),c3(127,96,170),c3(35,14,57),c3(47, 14, 86),c3(255, 182, 99),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20)) returnwheel = "BASE" end;
}

-- // ALTS

local apexalttable = {
	["APEX"]=function()
		local x = math.random(1,10)
		if x > 1 then
			formswitch(C3R(0,0,0),C3R(255,0,0),6454152476,C3R(255,0,0),C3R(0,0,0),16,50,1,"APEX","Antique","APEX","APEX",.4,false,0,false,"True Star Glitcher",false,"C a l m | D o w n")
		else
			formswitch(C3R(255,0,0),C3R(0,0,255),250185257 ,C3R(255,0,0),C3R(0,0,255),16,50,1,"EXASPERATION","Ubuntu","APEX","EXASPERATION",.4,false,0,false,"DERPZ GLITCHER",true,"Excision & Pegboard Nerds // Bring The Madness")
			chatmsg("Oh boy here we go again, huh Ronald.")
		end
	end;
	["EXCELLENCE"]=function() formswitch(C3R(255,200,100),C3R(255,255,255),1847588502,C3R(255,170,60),C3R(200,200,200),18,50,.95,"EXCELLENCE","GothamSemibold","APEX","APEX",.5,false,1,false,"GREAT TURMOIL",false,"P e r f e c t") end;
	["AGONY"]=function()  formswitch(C3R(0,0,0),C3R(200,0,0),1842660676,C3R(200,0,0),C3R(0,0,0),14,45,1.1,"AGONY","Antique","APEX","APEX",.25,false,2,false,"LΔPSΣ",false,"-| D o o M |-") end;
	["PARALLELENCE"]=function() formswitch(C3R(255,50,50),C3R(255,255,255),1847754660,C3R(255,60,60),C3R(255,200,200),16,60,.9,"PARALLELENCE","GothamBold","APEX","APEX",.75,false,3,false,"FORGOTTEN IRIDESCENCE",false,"...oh,ok...") end;
	["CARNAGE"]=function() formswitch(C3R(255,0,0),C3R(150,0,0),1839527117,C3R(255,0,0),C3R(100,0,0),16,60,.95,"CARNAGE","Antique","APEX","APEX",.3,false,4,false,"HESYCHASTIC",false,"Nothing was here") end;
	["CALAMITY"]=function() formswitch(C3R(20, 51, 66),C3R(50, 130, 167),9038274374,C3R(50, 130, 167),C3R(20, 51, 66),30,40,.8,"CALAMITY","Fondamento","APEX","APEX",.4,false,6,false,"True Star Glitcher",false,"Dead man's life story") end;
	["REVOLTION"]=function() formswitch(C3R(230,167,167),C3R(167,69,69),1836057239,C3R(167, 69, 69),C3R(230,167,167),13,70,1.3,"REVOLTION","Garamond","APEX","APEX",.4,false,-1,false,"True Star Glitcher",false,"Ultra Killer // more like Ultra Loser") end;
	["PROSPECTUM"]=function() formswitch(C3R(255,164,119),C3R(143,226,255),1839542961,C3R(255,164,119),C3R(143,226,255),16,60,.95,"PROSPECTUM","Oswald","APEX","APEX",.4,false,-1,false,"True Star Glitcher",false,"Don't get dizzy now :)") end;
	["OBSCURITY"]=function() formswitch(C3R(0,0,0),C3R(200,0,0),1839527184,C3R(200,0,0),C3R(0,0,0),16,50,1,"OBSCURITY","GothamSemibold","APEX","APEX",.4,false,0,false,"FORGOTTEN IRIDESCENCE",false,"Dubstep Fight // (Come at me Bro)") end;
	["CRYSTALLIZATION"]=function() formswitch(C3R(150,150,150),C3R(255,255,255),1839448308,C3R(255,255,255),C3R(150,150,150),20,50,.9,"CRYSTALLIZATION","Arcade","APEX","APEX",.3,false,-1,false,"GREAT TURMOIL",false,"Confused Glitcher") end
}
local repressionalttable = {
	["REPRESSION"]=function() formswitch(C3R(0,0,0),C3R(255,130,0),1843404009,C3R(255,100,0),C3R(0,0,0),20,40,1,"REPRESSION","Oswald","REPRESSION","REPRESSION",.4,false,0,false,"True Star Glitcher",false,"Calm Down buddy") end;
	["ANNIHILATION"]=function() formswitch(C3R(0,0,0),C3R(255,55,70),6913550990,C3R(255,55,70),C3R(0,0,0),22,50,.95,"ANNIHILATION","Antique","REPRESSION","REPRESSION",.3,false,1,false,"GREAT TURMOIL",false,"Die Potato") end;
	["CONTINUUM"]=function() formswitch(C3R(0,0,0),C3R(100,255,90),1837454064,C3R(100,255,90),C3R(0,0,0),18,50,1.1,"CONTINUUM","GothamBold","REPRESSION","REPRESSION",.3,false,2,false,"FORGOTTEN IRIDESCENCE",false,"OMG it's HIM (again)") end;
	["ECLIPSE"]=function()
		local t = {
			function()formswitch(C3R(0,0,0),C3R(255,80,0),1837301451,C3R(255,80,0),C3R(0,0,0),16,50,1.1,"ECLIPSE","Fantasy","REPRESSION","REPRESSION",.3,false,3,false,"LΔPSΣ",false,"gmtn. (witch's slave) // Furioso Melodia")end;
			function()formswitch(C3R(0,0,0),C3R(0,130,255),142376088,C3R(0,130,255),C3R(0,0,0),16,50,1.15,"DARKENING","Highway","REPRESSION","REPRESSION",.3,false,3,false,"LΔPSΣ",false,"gmtn. (witch's slave) // Furioso Melodia (2017 VIP)")end
		}
		local x = rand(1,5) if x > 1 then t[1]() else t[2]() end
	end;
	["Press Play BRO"]=function() formswitch(C3R(0,0,0),C3R(168,43,45),5410085763,C3R(168,43,45),C3R(0,0,0),10,50,1.4,"FOCUS","Code","REPRESSION","REPRESSION",.5,false,4,false,"True Star Glitcher",false,"This Song is 3:04 Min's LONG LOL") end;
	["DEVIANCE"]=function() formswitch(C3R(0,0,0),C3R(100,0,0),7023887630,C3R(70,0,0),C3R(0,0,0),16,50,1.1,"DEVIANCE","Antique","REPRESSION","REPRESSION",.4,false,-1,false,"True Star Glitcher",false,"B L O O M") end;
	["ROXANNE"]=function() formswitch(C3R(124, 0, 51),C3R(255,0,0),6808308228,C3R(255,0,0),C3R(124, 0, 51),16,50,1,"RESONANCE","Antique","REPRESSION","REPRESSION",.3,false,-1,false,"True Star Glitcher",false,"Hyper Potions & Nokae - Expedition: Yeah it's Monstercat :/") end;
	["CRIMSON"]=function() formswitch(C3R(0,0,0),C3R(180,0,0),7024233823,C3R(120,0,0),C3R(0,0,0),16,50,1.1,"CRIMSON","IndieFlower","REPRESSION","REPRESSION",.2,false,-1,false,"STAR GLITCHER",false,"Nitro Is Fun") end;
	["CREVASSE"]=function() formswitch(C3R(78,113,208),C3R(255,255,255),7023635858,C3R(78,113,208),C3R(180,180,180),23,50,.9,"CREVASSE","SciFi","REPRESSION","REPRESSION",.25,false,-1,false,"HESYCHASTIC",false,"Vex \/ 3:55 ") end;
	["CHAOS"]=function() formswitch(C3R(27,42,53),C3R(255,255,255),1838074757,C3R(255,255,255),C3R(0,0,0),23,50,.9,"CHAOS","Arcade","REPRESSION","REPRESSION",.4,false,10,false,"STAR GLITCHER",true,"Nothing's wrong with a little chaos") end;
}
local executionalttable = {
	["EXECUTION"] = function() formswitch(C3R(255,255,255),C3R(0,170,255),4514914581,script.Dynamics.Execution.Value,C3R(200,200,200),100,100,1,"EXECUTION","Bodoni","EXECUTION","EXECUTION",.4,false,0,false,"True Star Glitcher",true,"8 Bit Dubstep") end;
	["SPECTRAFIELD"] = function() local x = rand(1,10000) if x ~= 1 then formswitch(script.Dynamics.Spectrafield.Value,C3R(255,255,255),9045766377,script.Dynamics.Spectrafield.Value,C3R(255,255,255),200,50,.85,"SPECTRAFIELD","Arcade","EXECUTION","EXECUTION",.35,false,1,false,"True Star Glitcher",true,"Dude...Just play it cool......") else formswitch(C3R(0,60,255),C3R(255,255,255),6245897503,C3R(0,0,255),C3R(255,255,255),200,50,1,"PEPSIMAN","ArialBold","EXECUTION","EXECUTION",.2,false,666,false,"HELL ITSELF",true,"Turbo // Pepsiman Pepsiman Pepsiman") chatmsg(OHGODWHYHELPMESOMEBODYPLEASE[rand(1,#OHGODWHYHELPMESOMEBODYPLEASE)]) end end;
	["PROHIBITION"] = function() formswitch(C3R(80,0,0),C3R(255,0,0),9045959416,C3R(255,0,0),C3R(80,0,0),400,130,.65,"PROHIBITION","ArialBold","EXECUTION","EXECUTION",.3,false,2,false,"CESSATION",false,"Little Bird-i") end;
	["ΣTERNITY"] = function() formswitch(C3R(200,200,200),C3R(255,255,255),1846668647,C3R(255,255,255),C3R(150,150,150),200,50,.9,"ΣTERNITY","SourceSansSemibold","EXECUTION","EXECUTION",.3,false,-1,false,"True Star Glitcher",false,"Egipt Rad B)") end;
	["NEBULA"] = function() formswitch(C3R(210,100,255),C3R(100,160,255),5410080857,C3R(210,100,255),C3R(100,160,255),500,100,.6,"NEBULA","SciFi","EXECUTION","EXECUTION",.3,false,5,false,"LΔPSΣ",true,"Who's laughing now bastard") end;
	["AURORA"] = function() formswitch(C3R(255,255,255),C3R(100,160,255),7024332460,script.Dynamics.Aurora.Value,C3R(255,255,255),500,100,.6,"AURORA","GothamBlack","EXECUTION","EXECUTION",.3,false,6,false,"LΔPSΣ",true,"Pegboard Nerds - Shaku |Nothing more to say|") end;
	["UTTERANCE"] = function() formswitch(C3R(240,0,40),C3R(10,10,10),7023771708,c3(240,0,40),C3R(10,10,10),300,90,.8,"UTTERANCE","Fondamento","EXECUTION","EXECUTION",.4,false,30,false,"True Star Glitcher",true,"Please...Just stay still :|") end;
	["Bad Computer"] = function() formswitch(C3R(166, 197, 255),C3R(208, 189, 255),7023598688,c3(129, 156, 255),C3R(172, 151, 255),100,70,1,"SOMNAMBULIST","Bodoni","EXECUTION","EXECUTION",.6,false,30,false,"REALITY GLITCHER",true,"Potato PC moment") end;
}
local anarchyalttable = {
	["ANARCHY"]=function() formswitch(C3R(0,0,0),C3R(100,0,255),5671763707,C3R(80,0,255),C3R(0,0,0),60,100,1,"ANARCHY","Antique","ANARCHY","ANARCHY",.6,false,0,false,"True Star Glitcher",false,"meganeko // The Cyber Grind") end;
	["DESTRUCTION"]=function() formswitch(C3R(0,0,0),C3R(155,0,155),1248240943,C3R(155,0,155),C3R(0,0,0),60,100,1,"DESTRUCTION","Garamond","ANARCHY","ANARCHY",.4,false,1,false,"STAR GLITCHER",false,"ALEX // Mainframe") end;
	["HYPERTRANCE"]=function() formswitch(C3R(249, 196, 255),C3R(127, 92, 241),6770715109,C3R(127, 92, 241),C3R(249, 196, 255),60,100,1,"HYPERTRANCE","GothamBold","ANARCHY","ANARCHY",.6,false,2,false,"True Star Glitcher",false,"meganeko // Robot Language") end;
	["LUNAR"]=function() formswitch(C3R(0,0,0),C3R(0,0,255),1842971758,C3R(0,0,255),C3R(0,0,0),80,60,1.1,"LUNAR","Bodoni","ANARCHY","ANARCHY",.3,false,3,false,"LΔPSΣ",false,"Lchavasse // Space Abyss") end;
	["SURREPTITIOUS"]=function() formswitch(C3R(0,62,76),C3R(33,145,126),1842657589,C3R(33,145,126),C3R(0,62,76),80,80,1,"SURREPTITIOUS","Nunito","ANARCHY","ANARCHY",.3,false,3,false,"ARBITRARIUM",false,"Camellia // Dance with Silence") end;
	["EXHAUSTION"]=function() formswitch(C3R(27,42,53),C3R(196,40,28),4531555639,C3R(255, 50, 36),C3R(27,42,53),300,60,1,"EXHAUSTION","Bodoni","ANARCHY","ANARCHY",.7,false,3,false,"REALITY GLITCHER",false,"Bravely Default OST // Serpent Eating the Ground") end;
	["KATHASTROPHE"]=function() formswitch(C3R(0,0,0),C3R(170,85,225),1839542584,C3R(170,85,225),C3R(0,0,0),200,60,1.1,"KATHASTROPHE","Antique","ANARCHY","ANARCHY",.35,false,3,false,"HESYCHASTIC",false,"Team Grimoire // Kathastrophe") end;
	["EXTERMINATION"]=function() formswitch(C3R(0,0,0),C3R(160,0,0),1846511322,C3R(130,0,0),C3R(0,0,0),200,70,1,"EXTERMINATION","Fondamento","ANARCHY","ANARCHY",.4,false,0,false,"True Star Glitcher",false,"kenta-v.ez. // ListENiNg to spEEDcorE turNs you iNto An idiot (Kobaryo's FTN-Remix)") end;
	["NOCTURNALITY"]=function() formswitch(C3R(28,9,56),C3R(29,24,91),1838520240,C3R(29,24,91),C3R(28,9,56),250,100,1,"NOCTURNALITY","Kalam","ANARCHY","ANARCHY",.6,false,0,false,"PROJECT 2",false,"monoq + RIZARDI // SLEEPWALKER") end;
	["UPHEAVAL"]=function() formswitch(C3R(50,50,50),C3R(255,140,0),1836388266,C3R(255,115,0),C3R(50,50,50),100,100,.9,"UPHEAVAL","Code","ANARCHY","ANARCHY",.6,false,0,false,"GREAT TURMOIL",false,"Locknar // Rock & Loaded") end;
}
local virtuealttable = {
	["VIRTUE"]=function() formswitch(C3R(0,230,255),C3R(255,255,255),6289868990,C3R(80,190,255),C3R(180,180,180),55,50,1,"VIRTUE","FredokaOne","VIRTUE","VIRTUE",.4,false,0,false,"True Star Glitcher",false,"Sunset Chill (Bed Version)") end;
	["DIAPHANOUS"]=function() formswitch(C3R(150,150,150),C3R(255,255,255),5410082879,C3R(200,200,200),C3R(120,120,120),60,40,1.25,"DIAPHANOUS","Fantasy","VIRTUE","VIRTUE",.4,false,1,false,"LΔPSΣ",false,"xi // Happy End of the World") end;
	["DELICACY"]=function() formswitch(C3R(255,255,255),C3R(255,130,200),9044575797,C3R(255,130,200),C3R(170,170,170),45,45,1.4,"DELICACY","GothamBold","VIRTUE","VIRTUE",.3,false,2,false,"FORGOTTEN IRIDESCENCE",false,"(inappropriate name) // Toromi Hearts 2") end;
	["CONTRIVANCE"]=function() formswitch(C3R(255,255,255),C3R(255, 0, 115),9045071133,C3R(255,0,115),C3R(220,220,220),23,50,1.75,"CONTRIVANCE","Cartoon","VIRTUE","VIRTUE",.4,false,3,false,"True Star Glitcher",false,"Magic Sword // Uprising") end;
	["ENIGMA"]=function() formswitch(C3R(0,0,0),C3R(0,130,255),1836875692,C3R(0,110,255),C3R(0,0,0),70,50,.8,"ENIGMA","SciFi","VIRTUE","VIRTUE",.4,false,3,false,"LΔPSΣ",false,"XI // Ascension to Heaven") end;
	["MOTIVATION"]=function() formswitch(C3N(1, 0.352941, 0.372549),C3N(0.0313725, 0.494118, 0.545098),35930009,C3N(1, 0.352941, 0.372549),C3N(0.0313725, 0.494118, 0.545098),40,60,1,"MOTIVATION","Nunito","VIRTUE","VIRTUE",.4,false,3,false,"ASTRAL",false,"Megawolf77 // Happyyyy~!!") end;
	["HEARTFELT"]=function() formswitch(C3R(35,14,57),C3R(127,96,170),6889574376,C3R(35,14,57),C3R(127,96,170),51,50,1,"HEARTFELT","Nunito","VIRTUE","VIRTUE",.4,false,3,false,"CHROMOSPHERIC",false,"Cororo // ウエンレラの氷華") end;
	["SENTIMENT"]=function() formswitch(C3R(255, 182, 99),C3R(47, 14, 86),1837403683,C3R(255, 182, 99),C3R(47, 14, 86),70,50,.8,"SENTIMENT","IndieFlower","VIRTUE","VIRTUE",.4,false,3,false,"UNIVERSAL GLITCHER",false,"OISHI // Onigiri Freeway") end;
}
local dissonancealttable = {
	["DISSONANCE"]=function() formswitch(C3R(0,21,128),C3R(107,0,128),4857461826,C3R(107,0,128),C3R(0,21,128),50,50,1,"DISSONANCE","Kalam","DISSONANCE","DISSONANCE",.35,false,0,false,"True Star Glitcher",true,"Robot Electronic's") end;
	["DISTORTION"]=function() formswitch(C3R(255,0,0),C3R(0,0,0),7023459476,C3R(255,0,0),C3R(0,0,0),60,40,1.1,"DISTORTION","SciFi","DISSONANCE","DISSONANCE",.35,false,1,false,"LΔPSΣ",true,"Kobaryo // Necrophagiatoast") end;
	["ALTERATION"]=function() formswitch(C3R(255,255,255),C3R(0,0,0),7023828725,C3R(255,255,255),C3R(0,0,0),130,30,.8,"ALTERATION","Bodoni","DISSONANCE","DISSONANCE",.4,false,2,false,"LΔPSΣ",true,"The Quick Brown Fox - PROSELYTISM") end
}
local nihilalttable = {
	["NIHIL"]=function() formswitch(C3R(0,0,0),C3R(0,0,0),5249099148,C3R(0,0,255),C3R(255,255,255),100,50,1,"NIHIL","SciFi","NIHIL","NIHIL",.2,false,0,false,"True Star Glitcher",true,"Water Spirit // Aries") end;
	["ANOMALY"]=function() formswitch(C3R(0,0,0),C3R(0,0,0),1228696343,C3R(255,0,0),C3R(255,255,255),200,40,.9,"ANOMALY","Arcade","NIHIL","NIHIL",.25,false,1,false,"True Star Glitcher",true,"Camellia // Anomaly") end;
	["TERMINATION"]=function() formswitch(C3R(0,0,0),C3R(0,0,0),6807085919,C3R(0,255,0),C3R(255,255,255),300,60,.7,"TERMINATION","SciFi","NIHIL","NIHIL",.35,false,-1,false,"LΔPSΣ",true,"Renard & Adraen // Terminal") end;
	["404"]=function() formswitch(C3R(24, 40, 130),C3R(47, 78, 255),6111767199,C3R(47, 78, 255),C3R(24, 40, 130),400,50,.5,"404","Code","NIHIL","NIHIL",.35,false,-1,false,"True Star Glitcher",true,"RoughSketch // Ill") end;
	["ABERRATION"]=function() formswitch(C3R(225, 225, 255),C3R(252, 226, 5),1639681622,C3R(252, 226, 5),C3R(225, 225, 255),300,60,.5,"ABERRATION","Cartoon","NIHIL","NIHIL",.35,false,-1,false,"True Star Glitcher",true,"Bossfight // Work") end;
}

local holding1,holding2,holding3 = false,false,false
function keycheck()
	if holding1 == true and holding2 == true and holding3 == true then
		formswitch(C3R(0,0,0),C3R(0,0,0),5249099148,C3R(0,0,255),C3R(255,255,255),100,50,1,"NIHIL","SciFi","NIHIL","NIHIL",.2,true,0,true,"True Star Glitcher",true,"Water Spirit // Aries")
		changewheel(true,"NIHIL","ANOMALY","TERMINATION","404","ABERRATION","","","","","","Arial","Arcade","SciFi","Code","Cartoon","Arial","Arial","Arial","Arial","Arial",c3(0,0,255),c3(255,255,255),c3(255,0,0),c3(255,255,255),c3(0,255,0),c3(255,255,255),c3(47,78,255),c3(24,40,130),c3(252, 226, 5),c3(225, 225, 255),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
end

local finaltable = {
	baseformtable;
	disgraceformtable;
	apexalttable;
	repressionalttable;
	executionalttable;
	anarchyalttable;
	virtuealttable;
	dissonancealttable;
	nihilalttable;
}
script.Events.Switching.OnServerEvent:Connect(function(player,form)
	if form == "GOBACK" then
		changewheeltable[returnwheel]()
	else
		if changewheeltable[form] then
			changewheeltable[form]()
		end
	end
	
	for i,v in ipairs(finaltable) do
		if v[form] then
			v[form]()
		end
	end
	
	-- MAJORS
	
	if form == "APEXMAJORS" then
		returnwheel = "BASE"
		changewheel(false,"PERDURANCE","VINDICTIVE","TEMPEST","","","","","","","","Michroma","Bodoni","Nunito","Arial","Arial","Arial","Arial","Arial","Arial","Arial",c3(255,80,60),c3(81, 25, 19),c3(117,0,0),c3(99,95,98),c3(40,120,160),c3(35,45,55),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if altwheel == false then
		if form == "PERDURANCE" then
			formswitch(c3(255,80,60),c3(65, 90, 255),6471251501,c3(255,80,60),c3(65, 90, 255),400,80,1,"PERDURANCE","Michroma","PERDURANCE","PERDURANCE",3,true,0,true,"True Star Glitcher",true,"Fear, and Loathing in Las Vegas // Shape of Trust (marbun 1987 Instrumental Cover)",false,"rbxassetid://6595974497")
			if canswitch == true then chatmsg(perdurancelines[rand(1,3)]) end
		elseif form == "VINDICTIVE" then
			local x = rand(1,5)
			if x ~= 1 then
				formswitch(C3R(117,0,0),C3R(99,95,98),4521541755,C3R(117,0,0),C3R(99,95,98),500,100,1,"VINDICTIVE","Bodoni","VINDICTIVE","VINDICTIVE",.3,true,0,true,"STAR GLITCHER",false,"The Requirem // Sigmund (tpz Overheat Remix)")
			else
				formswitch(C3R(255,255,255),C3R(0,0,255),4159375283,C3R(0,0,255),C3R(170,170,170),500,100,1,"EXONERATION","Fondamento","VINDICTIVE","VINDICTIVE",.3,true,0,true,"True Star Glitcher",false,"Gram // Sigmund")
			end
			chatmsg(vindictivelines[rand(1,3)])
		elseif form == "TEMPEST" then
			formswitch(C3R(35,45,55),C3R(40,120,160),6272737169,C3R(40,120,160),C3R(35,45,55),6000,100,1,"TEMPEST","Nunito","TEMPEST","TEMPEST",.4,true,0,true,"PROJECT STRATUS",false,"t+pazolite // Tempestissimo")
		end
	end
	
	if form == "PERDURANCEALTS" then
		returnwheel = "APEXMAJORS"
		changewheel(true,"PERDURANCE","ANIMOSITY","PROPOSITUM","OBSESSION","STIRICIDIUM","EXTREMITY","DETERIORATION","","","","Michroma","Antique","Merriweather","PermanentMarker","GothamSemibold","GothamSemibold","GothamSemibold","Arial","Arial","Arial",c3(255,80,60),c3(81, 25, 19),c3(200,0,0),c3(0,0,0),c3(0,0,255),c3(0,0,100),c3(60,255,60),c3(50,80,50),c3(130,0,255),c3(0,0,0),c3(255,0,0),c3(0,0,0),c3(235,120,255),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if altwheel == true and altswitchcooldown == 0 then
		if form == "PERDURANCE" then
			formswitch(c3(255,80,60),c3(65, 90, 255),6471251501,c3(255,80,60),c3(65, 90, 255),400,80,1,"PERDURANCE","Michroma","PERDURANCE","PERDURANCE",3,false,0,false,"True Star Glitcher",true,"Fear, and Loathing in Las Vegas // Shape of Trust (marbun 1987 Instrumental Cover)")
		elseif form == "ANIMOSITY" then
			formswitch(c3(0,0,0),c3(200,0,0),2614150374,c3(175,0,0),c3(0,0,0),400,80,1,"ANIMOSITY","Antique","PERDURANCE","PERDURANCE",.4,false,0,false,"LΔPSΣ",false,"UNDEAD CORPORATION // Flowering Night Fever (Scream off)")
		elseif form == "PROPOSITUM" then
			formswitch(c3(0,0,60),c3(0,0,255),5182678213,c3(0,0,255),c3(0,0,60),400,80,1,"PROPOSITUM","Merriweather","PERDURANCE","PERDURANCE",1.1,false,0,false,"True Star Glitcher",false,"Noah // The End")
		elseif form == "OBSESSION" then
			formswitch(c3(50,80,50),c3(60,255,60),5188455408,c3(60,255,60),c3(50,80,50),400,80,1,"OBSESSION","PermanentMarker","PERDURANCE","PERDURANCE",.7,false,0,false,"True Star Glitcher",false,"MARETU // Magical Doctor")
		elseif form == "STIRICIDIUM" then
			formswitch(c3(0,0,0),c3(130,0,255),4966145073,c3(130,0,255),c3(0,0,0),400,80,1,"STIRICIDIUM","GothamSemibold","PERDURANCE","PERDURANCE",1,false,0,false,"FORGOTTEN IRIDESCENCE",false,"Camellia // =El=Dorado=")
		elseif form == "EXTREMITY" then
			formswitch(c3(0,0,0),c3(255,0,0),4471994298,c3(255,0,0),c3(0,0,0),400,80,1,"EXTREMITY","GothamSemibold","PERDURANCE","PERDURANCE",.5,false,0,false,"FORGOTTEN IRIDESCENCE",false,"gmtn. // 妖艶魔女 -trappola bewitching-")
		elseif form == "DETERIORATION" then
			formswitch(c3(0,0,0),c3(235,120,255),5153058313,c3(235,120,255),c3(0,0,0),400,80,1,"DETERIORATION","GothamSemibold","PERDURANCE","PERDURANCE",.5,false,0,false,"FORGOTTEN IRIDESCENCE",false,"UNDEAD CORPORATION // Killing Me If You Can (Istrumental Version)")
		end
	end
	
	-- ALTS
	
	
	if form == "ABSOLUTIONALTS" then
		returnwheel = "BASE"
		changewheel(true,"ABSOLUTION","VICISSITUDE","MISMATCHED","AUTUMN","DECEPTION","ACQUITTAL","","","","","Fondamento","Garamond","SciFi","SourceSansLight","Fantasy","Nunito","Arial","Arial","Arial","Arial",c3(255,80,80),c3(255,0,0),c3(175, 47, 56),c3(61, 16, 20),c3(255,255,255),c3(0,0,0),C3N(1, 0.415686, 0),C3N(1, 0.760784, 0.0980392),c3(130,0,255),c3(20,0,40),C3R(100,35,35),C3R(155,30,30),C3R(20,20,20),C3R(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "ABSOLUTION" and altwheel == true and altswitchcooldown == 0 then
		formswitch(C3R(255,80,80),C3R(255,0,00),5944346438,C3R(255,0,0),C3R(255,80,80),300,100,1,"ABSOLUTION","Fondamento","ABSOLUTION","ABSOLUTION",.4,false,0,false,"True Star Glitcher",false,"Forgotten Dreams")
	elseif form == "VICISSITUDE" then
		formswitch(C3R(61, 16, 20),C3R(175, 47, 56),1837056634,C3R(175, 47, 56),C3R(61, 16, 20),600,75,1,"VICISSITUDE","Garamond","ABSOLUTION","ABSOLUTION",.4,false,1,false,"True Star Glitcher",false,"DJ Grimoire // Noisy Minority")
	elseif form == "MISMATCHED" then
		formswitch(C3R(255,255,255),C3R(0,0,0),6937042327,C3R(0,0,0),C3R(255,255,255),200,150,1,"MISMATCHED","SciFi","ABSOLUTION","ABSOLUTION",.4,false,2,false,"CONCEALED TENEBROSITY",true,"NyxTheShield // Mismatch")
	elseif form == "AUTUMN" then
		formswitch(C3N(1, 0.760784, 0.0980392),C3N(1, 0.415686, 0),1836042433,C3N(1, 0.415686, 0),C3R(170,170,170),600,75,1,"AUTUMN","SourceSansLight","ABSOLUTION","ABSOLUTION",.4,false,10,false,"ASTRAL",false,"megawolf77 // Shining Sprinter")
	elseif form == "DECEPTION" then
		formswitch(C3R(20,0,40),C3R(130,0,255),1836101374,C3R(120,0,255),C3R(20,0,40),400,125,1,"DECEPTION","Fantasy","ABSOLUTION","ABSOLUTION",.4,false,10,false,"EXUBERANCE",false,"Team Grimoire & Sennzai // CHAOS MAGNVM")
	elseif form == "ACQUITTAL" then
		formswitch(C3R(100,35,35),C3R(155,30,30),1836968877,C3R(155,30,30),C3R(100,35,35),500,150,1,"ACQUITTAL","Nunito","ABSOLUTION","ABSOLUTION",3,false,10,false,"True Star Glitcher",false,"	RedOgre, OZIGIRI, DJ Myosuke - Positron Emission")
	end
	
	if form == "INFERNUMALTS" then
		returnwheel = "BASE"
		changewheel(true,"INFERNUM","HELLFIRE","INCANDESCENCE","FERVENCY","BLAZE","INFERNO","SHATTERED","","","","JosefinSans","Arcade","Kalam","Fondamento","Fantasy","RobotoMono","Arcade","Arial","Arial","Arial",c3(255,70,0),c3(0,0,0),c3(70,200,255),c3(0,0,0),c3(255, 224, 128),c3(255, 147, 125),c3(144, 150, 255),c3(97, 100, 255),c3(255, 170, 50),c3(255, 50, 0),C3H(0.0696944, 0.909804, rand(75,100)*0.01),C3N(0.0588235, 0.0588235, 0.0784314),c3(255,255,255),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "INFERNUM" and altwheel == true and altswitchcooldown == 0 then
		formswitch(C3R(0,0,0),C3R(255,70,0),6872126938,C3R(255,70,0),C3R(0,0,0),14,50,1,"INFERNUM","JosefinSans","INFERNUM","INFERNUM",.45,false,0,false,"True Star Glitcher",false,"Dubstep Hero")
	elseif form == "HELLFIRE" then
		local x = rand(1,5)
		if x ~= 1 then
			formswitch(C3R(0,0,0),C3R(70,200,255),5409360995,C3R(50,150,255),C3R(0,0,0),20,50,.95,"HELLFIRE","Arcade","INFERNUM","INFERNUM",.4,false,1,false,"True Star Glitcher",false,"JAKAZiD - Make Me Burn")
		else
			formswitch(C3R(0,0,0),C3R(255,80,0),4615964997,C3R(255,80,0),C3R(0,0,0),20,50,.95,"HELLFIRE","Antique","INFERNUM","INFERNUM",.4,false,1,false,"GREAT TURMOIL",false,"Team Grimoire // b4d dr4g0n")
		end
	elseif form == "INCANDESCENCE" then
		formswitch(C3R(255, 147, 125),C3R(255, 224, 128),7028856935,C3R(255, 224, 128),C3R(255, 147, 125),60,50,.7,"INCANDESCENCE","Kalam","INFERNUM","INFERNUM",.35,false,2,false,"True Star Glitcher",false,"Mr. Ivex // Thinking")
	elseif form == "FERVENCY" then
		formswitch(C3R(97, 100, 255),C3R(144, 150, 255),5410080857,C3R(144, 150, 255),C3R(97, 100, 255),20,50,1,"FERVENCY","Fondamento","INFERNUM","INFERNUM",.4,false,2,false,"True Star Glitcher",false,"onumi // ARROGANCE")
	elseif form == "BLAZE" then
		formswitch(C3R(255, 50, 0),C3R(255, 170, 50),5410082534,C3R(255, 170, 0),C3R(255, 50, 0),20,50,1,"BLAZE","Fantasy","INFERNUM","INFERNUM",.3,false,2,false,"REMINISCENCE CYTUS",false,"Yu_Asahina // HAELEQUIN (Extended)")
	elseif form == "INFERNO" then
		formswitch(C3R(10, 10, 10),C3H(0.0696944, 0.909804, rand(75,100)*0.01),7023861220,C3H(0.0696944, 0.909804, rand(75,100)*0.01),C3R(10, 10, 10),30,50,.8,"INFERNO","RobotoMono","INFERNUM","INFERNUM",.4,false,300,false,"ASTRAL",true,"R3vulk // Vulcan")
	elseif form == "SHATTERED" then
		formswitch(C3H(rand(1,360)/360,1,1),C3H(rand(1,360)/360,1,1),6828176320,C3H(rand(1,360)/360,1,1),C3H(rand(1,360)/360,1,1),16,40,1.5,"SHATTERED","Arcade","INFERNUM","INFERNUM",.3,false,50,false,"HESYCHASTIC",true,"NNN // Ark")
	end
	
	if form == "DISSONANCEALTS" then
		changewheel(true,"DISSONANCE","DISTORTION","ALTERATION","FUTILITY","","","","","","","Kalam","SciFi","Bodoni","Antique","Arial","Arial","Arial","Arial","Arial","Arial",c3(0,21,128),c3(107,0,128),c3(255,0,0),c3(0,0,0),c3(255,255,255),c3(0,0,0),c3(60,60,60),c3(25,25,25),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if dissonancealttable[form] then dissonancealttable[form]() end
	
	if form == "WARPSPEEDALTS" then
		changewheel(true,"WARPSPEED","LEGERITY","EXPEDITIOUS","ACCELERATION","RAINBOW","OMEGA","","","","","Michroma","SciFi","Arcade","SciFi","Highway","SciFi","Arial","Arial","Arial","Arial",c3(208,241,255),c3(70, 181, 255),c3(255,0,140),c3(0,160,255),c3(0,0,255),c3(0,140,255),c3(100,200,255),c3(255,255,255),c3(255,255,255),c3(255,0,0),c3(0, 143, 156),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "WARPSPEED" and altwheel == true and altswitchcooldown == 0 then
		formswitch(C3R(70, 181, 255),C3R(208, 241, 255),7028557220,C3R(151, 165, 255),C3R(64, 121, 255),400,50,1,"WARPSPEED","Michroma","WARPSPEED","WARPSPEED",.4,false,0,false,"True Star Glitcher",false,"100% S P E E D")
	elseif form == "LEGERITY" then
		formswitch(C3R(0,140,255),C3R(255,0,140),1837871067,C3R(255,0,145),C3R(0,140,255),500,50,.9,"LEGERITY","SciFi","WARPSPEED","WARPSPEED",.6,false,0,false,"GREAT TURMOIL",false,"DJKurara // Japanese Transformation")
	elseif form == "EXPEDITIOUS" then
		formswitch(C3R(0,160,255),C3R(0,0,255),1836807218,C3R(0,160,255),C3R(0,0,255),300,50,1,"EXPEDITIOUS","Arcade","WARPSPEED","WARPSPEED",.6,false,0,false,"REMINISCENCE CYTUS",false,"Yooh // Ice Angel")
	elseif form == "ACCELERATION" then
		formswitch(C3R(100,200,255),C3R(255,255,255),7023445033,C3R(100,200,255),C3R(190,190,190),600,50,.75,"ACCELERATION","SciFi","WARPSPEED","WARPSPEED",.6,false,0,false,"LΔPSΣ",false,"Acid-Notation // Accelerate")
	elseif form == "RAINBOW"  then
		local x = rand(1,5)
		if x ~= 1 then
			formswitch(C3R(0,0,0),C3R(255,255,255),1838620663,C3R(13,105,172),C3R(255,255,255),150,50,1,"RAINBOW","Highway","WARPSPEED","WARPSPEED",.6,false,0,false,"STAR GLITCHER",true,"fr a rainbow theme")
		else
			formswitch(C3R(0,0,0),C3R(0,0,0),142312526,C3R(13,105,172),C3R(0,0,0),150,50,1,"RAINBOW","Fantasy","WARPSPEED","WARPSPEED",.6,false,1,false,"ORIGINAL STAR GLITCHER",true,"Kitsune^2 // Rainbow Tylenol")
		end
	elseif form == "OMEGA" then
		local x = rand(1,10)
		if x > 2 then
			formswitch(C3R(0,0,0),C3R(0, 143, 156),7023887630,C3R(0, 143, 156),C3R(0,0,0),300,50,1,"OMEGA","SciFi","WARPSPEED","WARPSPEED",.6,false,0,false,"STAR GLITCHER",false,"WAiKURO // AMAZING MIGHTYYYY!!!!")
		elseif x == 2 then
			formswitch(C3R(0,0,0),C3R(13, 105, 172),6101111764,C3R(13, 105, 172),C3R(0,0,0),300,50,1,"OMEGA","SciFi","WARPSPEED","WARPSPEED",.6,false,0,false,"True Star Glitcher",false,"WAiKURO // AMAZING MIGHTYYYY!!!! (ULT!MATE EXTENDED)")
		else
			formswitch(C3R(27, 42, 53),C3R(82, 99, 76),3664863329,C3R(82, 99, 76),C3R(27, 42, 53),600,50,1,"HYDRA","Garamond","WARPSPEED","WARPSPEED",.6,false,0,false,"STAR GLITCHER",false,"Katana ZERO OST // Breath of a Serpent")
		end
	end
	
	if form == "INTRICACYALTS" then
		changewheel(true,"INTRICACY","HERCULEAN","MASSACRE","","","","","","","","RobotoCondensed","Sarpanch","SciFi","Arial","Arial","Arial","Arial","Arial","Arial","Arial",c3(50,50,50),c3(50,50,50),c3(172, 151, 255),c3(49, 110, 184),c3(150, 40, 255),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "INTRICACY" and altwheel == true and altswitchcooldown == 0 then
		formswitch(C3R(0,255,0),C3R(255,255,255),6584997234,C3R(0,255,0),C3R(255,255,255),200,150,1,"INTRICACY","RobotoCondensed","INTRICACY","INTRICACY",.55,false,0,false,"True Star Glitcher",false,"Deleted Files")
	elseif form == "HERCULEAN" then
		formswitch(C3R(49, 110, 184),C3R(172, 151, 255),7028913008,C3R(172, 151, 255),C3R(49, 110, 184),200,300,.7,"HERCULEAN","Sarpanch","INTRICACY","INTRICACY",.55,false,0,false,"DERPZ GLITCHER",false,"Pegboard Nerds // Hero")
	elseif form == "MASSACRE" then
		formswitch(C3R(0,0,0),C3R(150, 40, 255),7029070008,C3R(150, 40, 255),C3R(0,0,0),250,100,.9,"MASSACRE","SciFi","INTRICACY","INTRICACY",.55,false,0,false,"LΔPSΣ",false,"Camellia // Berserkerz' Warfare 345")
	end
	
	if form == "VINDICTIVEALTS" then
		returnwheel = "APEXMAJORS"
		changewheel(true,"VINDICTIVE","VINDICATION","EUPHORIA","TURMOIL","","","","","","","Bodoni","Bodoni","Cartoon","Fantasy","Arial","Arial","Arial","Arial","Arial","Arial",c3(117,0,0),c3(99,95,98),c3(140,0,0),c3(230,230,230),c3(0,220,213),c3(200,255,200),c3(255,255,255),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "VINDICTIVE" and altwheel == true and altswitchcooldown == 0 then
		local x = rand(1,5)
		if x ~= 1 then
			formswitch(C3R(117,0,0),C3R(99,95,98),4521541755,C3R(117,0,0),C3R(99,95,98),500,100,1,"VINDICTIVE","Bodoni","VINDICTIVE","VINDICTIVE",.3,false,0,false,"STAR GLITCHER",false,"The Requirem // Sigmund (tpz Overheat Remix)")
		else
			formswitch(C3R(255,255,255),C3R(0,0,255),4159375283,C3R(0,0,255),C3R(170,170,170),500,100,1,"EXONERATION","Fondamento","VINDICTIVE","VINDICTIVE",.3,false,0,false,"True Star Glitcher",false,"Gram // Sigmund")
		end
	elseif form == "VINDICATION" then
		formswitch(C3R(230,230,230),C3R(140,0,0),3556806276,C3R(140,0,0),C3R(230,230,230),150,50,1,"VINDICATION","Bodoni","VINDICTIVE","VINDICTIVE",.2,false,1,false,"STAR GLITCHER",false,"Laur // Vindication")
	elseif form == "EUPHORIA" then
		formswitch(C3R(200,255,200),C3R(0, 220, 213),397723799,C3R(180,255,180),C3R(0, 220, 213),150,50,1,"EUPHORIA","Cartoon","VINDICTIVE","VINDICTIVE",.4,false,-1,false,"STAR GLITCHER",false,"Twin Rocket // uno")
	elseif form == "TURMOIL" then
		formswitch(C3R(0,0,0),script.Dynamics.Execution.Value,4747395632,script.Dynamics.Execution.Value,C3R(0, 0, 0),1500,150,1,"TURMOIL","Fantasy","VINDICTIVE","VINDICTIVE",.7,false,-1,false,"GREAT TURMOIL",true,"DJ Grimoire & Team Grimoire // B+stard of Hardcore")
	end
	
	if form == "TEMPESTALTS" then
		returnwheel = "APEXMAJORS"
		changewheel(true,"TEMPEST","GUARDIAN","CLAIRVOYANCE","VOID","LIGHTMARE","","","","","","Nunito","Code","JosefinSans","Michroma","Oswald","Arial","Arial","Arial","Arial","Arial",c3(40,120,160),c3(35,45,55),c3(0,255,0),c3(255,255,255),c3(255,190,50),c3(0,0,0),c3(200,200,200),c3(200,200,200),C3R(255, 89, 89),c3(0,0,0),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20),c3(20,20,20))
	end
	if form == "TEMPEST" and altwheel == true and altswitchcooldown == 0 then
		formswitch(C3R(35,45,55),C3R(40,120,160),6272737169,C3R(40,120,160),C3R(35,45,55),6000,100,1,"TEMPEST","Nunito","TEMPEST","TEMPEST",.4,false,0,false,"PROJECT STRATUS",false,"t+pazolite // Tempestissimo")
	elseif form == "GUARDIAN" then
		formswitch(C3R(255,255,255),C3R(0,255,0),1679593582,C3R(0,180,0),C3R(170,170,170),6000,100,1,"GUARDIAN","Code","EXECUTION","TEMPEST",.4,false,1,false,"SENTINEL",false,"Demetori // Jehovah's Yahveh")
	elseif form == "CLAIRVOYANCE" then
		formswitch(C3R(0,0,0),C3R(255,190,50),1598931801,C3R(255,150,50),C3R(0,0,0),6000,100,1,"CLAIRVOYANCE","JosefinSans","VINDICTIVE","TEMPEST",.575,false,2,false,"True Star Glitcher",false,"Demetori // 風神少女 (Wind God Girl)")
	elseif form == "VOID" then
		formswitch(C3N(0.027451, 0, 0.0431373),C3H(0.75+0.015*math.cos(sine/8), 1, 1),4961170103,C3H(0.75+0.015*math.cos(sine/8), 1, 1),C3N(0.027451, 0, 0.0431373),6000,100,1,"VOID","Michroma","SAGITTARIUS","TEMPEST",.3,false,5,false,"ASTRAL",true,"Frums // Nisemono")
	elseif form == "LIGHTMARE" then
		formswitch(C3R(0,0,0),C3R(255, 89, 89),2033545997,C3R(255, 89, 89),C3R(0,0,0),6000,100,1,"LIGHTMARE","Oswald","EXECUTION","TEMPEST",.4,false,0,false,"RUIN EMPHASIS",false,"Trevor Something // Your Eyes")
	end
end)

function moveset(id)
	local movetable = {
		[1]=apexslam, -- APEX
		[2]=cocacola,
		[3]=YOU,
		[4]=AEROnt,
		
		[5]=repressionbombs, -- REPRESSION
		[6]=nil,
		[7]=circlesofdeath,
		[8]=bigepic,
		
		[9]=bigbolt, -- EXECUTION
		[10]=nil,
		[11]=nil,
		[12]=nil,
		
		[13]=nil, -- ANARCHY
		[14]=nil,
		[15]=bombo,
		[16]=nil,
		
		[17]=burst, -- VIRTUE
		[18]=nil,
		[19]=nil,
		[20]=nil,
		
		[21]=nil, -- ABSOLUTION
		[22]=nil,
		[23]=nil,
		[24]=bigexplosioneee,
		
		[25]=pyrotf2, -- INFERNUM
		[26]=nil,
		[27]=hadouken,
		[28]=nil,
		
		[29]=nil, -- DISSONANCE
		[30]=nil,
		[31]=nil,
		[32]=nil,
		
		[33]=nil, -- WARPSPEED
		[34]=nil,
		[35]=nil,
		[36]=nil,
		
		[37]=nil, -- INTRICACY
		[38]=nil,
		[39]=nil,
		[40]=nil,
		
		[41]=nil, -- PENDURANCE
		[42]=nil,
		[43]=nil,
		[44]=nil,
		
		[1001]=erase, -- VINDICTIVE
		[1002]=nil,
		[1003]=nil,
		[1004]=nil,
	}
	if movetable[id] and id ~= 0 then
		movetable[id]()
	end
end

function mouse1()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "Mouse1Start"
	Root.CFrame = CFN(Root.Position,V3(mousecframe.Position.X,Root.Position.Y,mousecframe.Position.Z))
	for i = 1,5 do
		wait(.025)
		local cf = Root.CFrame*CFN(0,0,-i*15)+RV
		sound(cf,305734380,.5,rand(90,110)/100,0,50)
		local RP,RPO,NO = ray(cf.Position,V3(0,-50,0))
		if RP then
			effect("Sphere",CFN(RPO,RPO+NO)*CFA(-90,0,0),V3(20,.5,20),W1PC,Neon,0,.3,Sine,Out,false,{Size=V3(30,0,30)},1,Circular)
			effect("Sphere",CFN(RPO,RPO+NO)*CFA(-90,0,0),V3(10,.5,10),W1SC,Neon,0,.2,Sine,Out,false,{Size=V3(20,0,20)},1,Circular)
			effect("LightWind",CFN(RPO,RPO+NO)*CFA(-90,rand(0,360),0),V3(20,.5,20),W1SC,Neon,0,.4,Sine,Out,false,{Size=V3(40,0,40)},1,Circular)
		end
	end
	wait(.2)
	script.Values.Anim.Value = "Mouse1End"
	for i = 1,5 do
		heartbeat:Wait()
		local cf = RCF*CFN(0,0,-i*15)+RV
		local RP,RPO,NO = ray(cf.Position,V3(0,-50,0))
		if RP then
			sound(cf,1398290761,.5,rand(90,110)/100,0,50)
			sound(cf,2648563122,.5,rand(90,110)/100,0,50)
			sound(cf,6141030906,.5,rand(90,110)/100,.05,50)
			camshake(cf.Position,20,10)
			local mod = rand(90,110)/100
			effect("Sphere",CFN(RPO,RPO+NO)*CFA(-90,0,0),V3(30,.5,30),W1PC,Neon,0,.6*mod,Sine,Out,false,{Size=V3(20,100,20)*mod},1,Circular)
			effect("Sphere",CFN(RPO,RPO+NO)*CFA(-90,0,0),V3(20,.5,20),W1SC,Neon,0,.4*mod,Sine,Out,false,{Size=V3(10,80,10)*mod},1,Circular)
			effect("LightWind",CFN(RPO,RPO+NO)*CFA(-90,rand(0,360),0),V3(20,.5,20),W1SC,Neon,0,.4*mod,Sine,Out,false,{Size=V3(60,0,60)*mod},1,Circular)
			effect("LightWind",CFN(RPO,RPO+NO)*CFA(-90,rand(0,360),0),V3(20,.5,20),W1SC,Neon,0,.4*mod,Sine,Out,false,{Size=V3(60,0,60)*mod},1,Circular)
			if script.Values.CurrentBaseForm.Value ~= "VIRTUE" then
				damage(cf.Position,15,rand(120000,130000),0,0,2.5)
			else
				heal(cf.Position,15,rand(120000,130000),false,true)
			end
		end
	end
	wait(.5)
	script.Values.Anim.Value =res
	Root.Anchored=false
	canswitch=true
end
function mouse2()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored = true
	local res = script.Values.Anim.Value
	script.Values.Anim.Value = "SWITCH START"
	sound(RCF,550965268,1,1,0,50)
	--sound(RCF,615910787,1,1,0,50)
	for i = 1,3 do
		effect("ThinRing",torsocframe*CFR(0,360,0,360,0,360)+RV*.1,V3(200,10,200),W1PC,Forcefield,1,rand(20,30)/100,Quart,In,false,{Size=V3(0,0,0)},0,Linear)
	end
	wait(.3)
	script.Values.Anim.Value = "SWITCH"
	effect("Sphere",torsocframe+RV*.1,V3(50,50,50),W1PC,Neon,0,.4,Sine,Out,false,{Size=V3(150,150,150)},1,Sine)
	effect("Sphere",torsocframe+RV*.1,V3(50,50,50),W1SC,Neon,0,.7,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
	effect("Sphere",torsocframe+RV*.1,V3(50,50,50),W1PC,Neon,0,1,Sine,Out,false,{Size=V3(150,150,150)},1,Circular)
	effect("Sphere",torsocframe+RV*.1,V3(50,50,50),W1SC,Neon,0,1.5,Sine,Out,false,{Size=V3(100,100,100)},1,Circular)
	for i = 1,5 do
		effect("Sphere",torsocframe*CFR(0,360,0,360,0,360)+RV*.1,V3(10,0,10),W1PC,Neon,0,rand(50,70)/100,Sine,Out,false,{Size=V3(6,600,6)*rand(90,110)/100},1,Linear)
	end
	crater(RCF+RV,1.75,50)
	camshake(RCF.Position,90,10)
	sound(RCF,174295284,.75,1,0,50)
	sound(RCF,260433450,1,1,0,50)
	sound(RCF,341074086,1,1,0,50)
	sound(RCF,2847401943,1,1,0,50)
	sound(RCF,3744400428,1,1,0,50)
	if script.Values.CurrentBaseForm.Value ~= "VIRTUE" then
		damage(RCF.Position,75,rand(120000,140000),0,50,1.5)
	else
		heal(RCF.Position,75,rand(120000,140000),false,true)
	end
	wait(.5)
	script.Values.Anim.Value = res
	canswitch = true
	Root.Anchored = false
end
function mouse3()
	if canswitch == false then return end
	canswitch = false
	Root.Anchored=true
	local target = nil
	local maxrange = 200
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Humanoid") and v.Parent ~= plr then
			local head = v.Parent:FindFirstChild("Head")
			local comp = v.Parent:FindFirstChild("Compile")
			if head and not comp and v.Parent.Name ~= "Idles" and v.Parent.Name ~= "Moves" then
				local mag = (Head.Position-head.Position).Magnitude
				if mag < maxrange then
					maxrange = mag
					target = v.Parent
				end
			end
		end
	end
	if target then
		effect("Sphere",Root.CFrame,V3(60,60,60),W1PC,Neon,.5,.3,Sine,In,false,{Size=V3(0,0,0)},1,Sine)
		effect("Sphere",Root.CFrame,V3(40,40,40),W1SC,Neon,0,.3,Sine,In,false,{Size=V3(0,0,0)},1,Sine)
		local SC,EC = Root.CFrame,target.Head.CFrame*CFrame.new(0,-1,2)
		local mag = math.floor((SC.Position-EC.Position).Magnitude+.5)
		for i = 1,4 do
			bolt(SC.Position,EC.Position,i,10,20,W1PC,.2)
		end
		local cf = CFN(target.Head.CFrame.Position)
		Root.CFrame = cf*CFA(0,target.Head.Orientation.Y,0)*CFN(0,-1,2)
		effect("Sphere",Root.CFrame,V3(5,5,5),W1PC,Neon,0,.15,Sine,Out,true,{Size=V3(100,100,100)},.8,Sine)
		effect("Sphere",Root.CFrame,V3(5,5,5),W1SC,Neon,0,.15,Sine,Out,true,{Size=V3(60,60,60)},0,Sine)
		sound(EC,1837829764,1,1,0,50)
		sound(EC,3359047385,.7,1,0,50)
		sound(EC,255679373,2,1,0,50)
		sound(EC,5786032123,2,1,0,50)
		camshake(EC.Position,60,12)
		if script.Values.CurrentBaseForm.Value ~= "VIRTUE" then
			damage(EC.Position,60,rand(80000,90000),0,20,.5)
		else
			heal(EC.Position,60,rand(80000,90000),false,true)
		end
	else
		chatmsg("Nothing in range.")
	end
	wait(.1)
	Root.Anchored=false
	canswitch = true
end

local zID,xID,cID,vID = 1,2,3,4

local chosenleftclick = 1
script.Events.Key.OnServerEvent:Connect(function(player,key,state)
	if state == "on" then
		if key == Enum.KeyCode.K then
			--function formswitch(textcolor,textstrokecolor,theme,primary,secondary,walkspeed,jumppower,attack,formname,formfont,wingstyle,formidle,themevolume,fancyexplosionbool,altindexnumber,corebool,scriptname,dynamic,themename,extrawingsbool,marbleimage)
			formswitch(C3R(0,0,0),C3R(255,255,255),4866206472,C3R(170,170,170),C3R(0,0,0),30,50,"VISUALISER","Code","VISUALISER","VISUALISER",.4,true,0,true,"True Star Glitcher",true,"man",false,"rbxassetid://6595974565")
		elseif key == Enum.KeyCode.M then
			if script.Values.CurrentForm.Value == "ANARCHY" then
				formswitch(C3R(0,0,0),C3R(0,0,0),4825395341,C3R(0,0,0),C3R(0,0,0),2000,300,1,"SAGITTARIUS","JosefinSans","SAGITTARIUS","SAGITTARIUS",.4,true,0,true,"True Star Glitcher",true,"Silentroom // Rainshower",true,"rbxassetid://6595974565")
			elseif script.Values.CurrentForm.Value == "SAGITTARIUS" then
				formswitch(C3R(0,0,0),C3R(0,0,0),6399708347,script.Dynamics.Execution.Value,script.Dynamics.Harmony.Value,10000,100,1,"HARMONY","Fondamento","HARMONY","HARMONY",.4,true,0,true,"THE★True Star Glitcher",true,"majiko - Hypocrite Syndrome",true,"rbxassetid://6595974565")
				if fury == false then Theme.TimePosition = 0 end
			end
		end
		if key == "mousebutton1" then
			usedmove = tostring(chosenleftclick)
			if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
				if chosenleftclick == 1 then
					mouse1()
				elseif chosenleftclick == 2 then
					mouse2()
				else
					mouse3()
				end
			end
		end
		if key == Enum.KeyCode.One then
			holding1 = true
			chosenleftclick = 1
			script.Values.SelectedClick.Value = 1
			keycheck()
		elseif key == Enum.KeyCode.Two then
			holding2 = true
			chosenleftclick = 2
			script.Values.SelectedClick.Value = 2
			keycheck()
		elseif key == Enum.KeyCode.Three then
			holding3 = true
			chosenleftclick = 3
			script.Values.SelectedClick.Value = 3
			keycheck()
		end
		if key == Enum.KeyCode.F then
			holdingf = true
			if canswitch == true then
				usedmove = "F"
				if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
					teleport()
				end
			end
		elseif key == Enum.KeyCode.Z then
			holdingz = true
			if canswitch == true then
				usedmove = "Z"
				if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
					moveset(zID)
				end
			end
		elseif key == Enum.KeyCode.X then
			if canswitch == true then
				usedmove = "X"
				if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
					moveset(xID)
				end
			end
		elseif key == Enum.KeyCode.C then
			if canswitch == true then
				usedmove = "C"
				if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
					moveset(cID)
				end
			end
		elseif key == Enum.KeyCode.V then
			if canswitch == true then
				usedmove = "V"
				if script.Cooldowns:FindFirstChild(usedmove).Cooldown.Value == 1 then
					moveset(vID)
				end
			end
		elseif key == Enum.KeyCode.L then
			if Theme.RollOffMinDistance == 100 then
				Theme.RollOffMinDistance = 0
			else
				Theme.RollOffMinDistance = 100
			end
		end
		if key == Enum.KeyCode.Period then
			if NG.Enabled == false then
				NG.Enabled = true
			else
				NG.Enabled = false
			end
		elseif key == Enum.KeyCode.Comma then
			if gui.Enabled == false then
				gui.Enabled = true
			else
				gui.Enabled = false
			end
		end
		if key == Enum.KeyCode.P then
			if script.Values.CurrentForm.Value == "SAGITTARIUS" then
				if altindex == 0 then
					formswitch(C3R(170,170,170),C3R(255,255,255),4825395341,C3R(255,255,255),C3R(170,170,170),2000,300,1,"FOMALHAUT","JosefinSans","SAGITTARIUS","SAGITTARIUS",.4,false,1,false,"True Star Glitcher",true,"Silentroom // Rainshower",true)
				else
					formswitch(C3R(0,0,0),C3R(255,255,255),4825395341,C3R(0,0,0),C3R(0,0,0),2000,300,1,"SAGITTARIUS","JosefinSans","SAGITTARIUS","SAGITTARIUS",.4,false,0,false,"True Star Glitcher",true,"Silentroom // Rainshower",true)
				end
			end
		end
		if key == Enum.KeyCode.BackSlash then
				if instakill == true then
					instakill = false
					chatmsg("Instakill off.")
				else
					instakill = true
					chatmsg("Instakill on.")
				end
		elseif key == Enum.KeyCode.Zero then
				if fury == false then
					fury = true
					script.Values.Fury.Value = true
					Theme.TimePosition = 0
					script.Values.CurrentBaseForm.Value = "Fury"
					script.Values.CurrentForm.Value = "Fury"
					altwheel = false
					baseformtable["APEX"]()
					local light = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
					light.TintColor = Color3.fromRGB(255,30,60)
					light.Contrast = -2
					for i,v in pairs({418302853,512112801,555090374,5082594678}) do
						sound(Root.CFrame,v,1,1,0,200)
					end
					game:GetService("Debris"):AddItem(light,.1)
					camshake(Root.Position,1000,70)
					Theme.TimePosition = 157
					chatmsg("I see hear the voices in my head there telling me a lot about YOU.")
					for i = 1,10 do
						local a = rand(1,2)
						local c = W1SC
						if a == 1 then c = W1PC end
						local s = rand(500,700)

						effect("Sphere",Root.CFrame,V3(5,5,5),c,Neon,0,.2,Quad,Out,false,{Size=V3(s,s,s)},1,Linear)
						local a = rand(1,2)
						local c = W1SC
						if a == 1 then c = W1PC end
						effect("Sphere",Root.CFrame*CFR(0,360,0,360,0,360),V3(s*.5,5,s*.5),c,Neon,0,.4,Quint,Out,false,{Size=V3(s*.1,s*3,s*.1)},1,Linear)

						local a = rand(1,2)
						local c = W1SC
						if a == 1 then c = W1PC end
						local cf = Root.CFrame*CFR(0,360,0,360,0,360)
						effect("HoleTornado",cf,V3(5,.05,5),c,Neon,0,.4,Sine,Out,false,{Size=V3(s*2,.05,s*2);CFrame=cf*CFR(-50,50,-50,50,-50,50)},1,Linear)

						local ray = Ray.new(Root.Position,V3(0,-5,0))
						local RPA,RPS,NO = workspace:FindPartOnRayWithIgnoreList(ray,{d,plr},false,true)
						if RPA then
							local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
							local a = rand(1,2)
							local c = W1SC
							if a == 1 then c = W1PC end
							local x = rand(900,1500)
							effect("LightWind",cf,V3(100,.05,100),c,Neon,0,rand(30,60)/100,Sine,Out,false,{Size=V3(x,.05,x);CFrame=cf*CFR(0,0,-50,50,0,0)},1,Sine)
						end

						local a = rand(1,2)
						local c = W1SC
						if a == 1 then c = W1PC end
						local cf = Root.CFrame*CFR(0,360,0,360,0,360)
						effect("Sphere",cf,V3(10,10,10),c,Neon,0,rand(30,50)/100,Sine,Out,false,{Size=V3(80,800,80);CFrame=cf*CFN(0,rand(1000,2000),0)},1,Sine)
					end

					effect("Sphere",Root.CFrame,V3(5,5,5),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(1000,1000,1000)},1,Sine)
					effect("Sphere",Root.CFrame,V3(5,5,5),W1PC,Neon,0,.5,Sine,Out,false,{Size=V3(1500,1500,1500)},1,Sine)
				else
					fury = false
					script.Values.Fury.Value = false
					script.Values.CurrentBaseForm.Value = "Fury"
					script.Values.CurrentForm.Value = "Fury"
					wait(.2)
					altwheel = false
					baseformtable["APEX"]()
				end
		elseif key == Enum.KeyCode.LeftBracket then
				if ds == false then
					ds = true
					chatmsg("Damage scaling on.")
				else
					ds = false
					chatmsg("Damage scaling off.")
				end
		elseif key == Enum.KeyCode.RightBracket then
				if cds == true then
					cds = false
					chatmsg("Cooldowns off.")
				else
					cds = true
					chatmsg("Cooldowns on.")
				end
		elseif key == Enum.KeyCode.Quote then
			if damageplayers == true then
				damageplayers = false
				chatmsg("Player damage off.")
			else
				damageplayers = true
				chatmsg("Player damage on.")
			end
		end
		if key == Enum.KeyCode.RightControl or key == Enum.KeyCode.LeftControl then
			kevingaming = 100
		elseif key == Enum.KeyCode.Insert then
			beeify()
		end
	elseif state == "off" then
		if key == Enum.KeyCode.One then
			holding1 = false
		elseif key == Enum.KeyCode.Two then
			holding2 = false
		elseif key == Enum.KeyCode.Three then
			holding3 = false
		elseif key == Enum.KeyCode.F then
			holdingf = false
		elseif key == Enum.KeyCode.Z then
			holdingz = false
		end
	end
end)


local powerfall = false
local dirt = script.Sounds.Dirt
dirt.Parent = Head
local dirteff = script.Particles.DirtEff
dirteff.Parent = RA

local BG = Instance.new("BodyGyro",Root)
BG.MaxTorque = V3(0,0,0)
BG.P = 30000
BG.D = 20

coroutine.resume(coroutine.create(function()
	while true do
		wait()
		if Root.Velocity.Y < -150 then
			script.Values.Anim.Value = "PowerFall"
			local RPA,RPS,NO = ray(Root.Position,V3(0,Root.Velocity.Y,0))
			if RPA then
				local mag = (Root.Position-RPS).Magnitude
				local orientation = Root.Orientation.Y
				if Root.Velocity.X > 100 or Root.Velocity.X < -010 or Root.Velocity.Z > 100 or Root.Velocity.Z < -100 then
					orientation = orientation + 180
				end
				Root.CFrame = CFN(RPS)*CFA(0,orientation,0)+V3(0,4,0)
				sound(CFN(RPS),1177785010,1,1,0,50)
				local cf = CFN(RPS)*CFR(0,360,0,360,0,360)
				effect("Sphere",cf,V3(3,3,3),W1SC,Forcefield,0,.3,Sine,Out,false,{Size=V3(100,100,100);CFrame=cf*CFR(-40,40,-40,40,-40,40)},1,Sine)
				effect("HoleSphere",cf*CFR(0,360,0,360,0,360),V3(3,3,3),W1PC,Neon,0,.15,Sine,Out,false,{Size=V3(130,130,130)},1,Sine)
				effect("Sphere",cf,V3(3,3,3),W1PC,Neon,0,.6,Sine,Out,false,{Size=V3(60,60,60)},1,Sine)
				for i = 1,2 do
					local cf2 = cf*CFR(0,360,0,360,0,360)
					effect("LightWind",cf2,V3(0,0,0),W1SC,Neon,0,rand(10,20)/100,Sine,Out,false,{Size=V3(160,0,160);CFrame=cf2*CFR(0,0,-50,50,0,0)},1,Linear)
				end
				if Root.Velocity.Y < -175 then
					sound(CFN(RPS),6324841214,1,1,0,50)
					sound(CFN(RPS),3848679789,1,1,0,50)
					camshake(RPS,75,10)
					local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
					effect("Wave",cf,V3(0,0,0),W1PC,Neon,0,.3,Sine,Out,false,{Size=V3(200,10,200);CFrame=cf*CFN(0,5,0)},1,Quad)
					for i = 1,10 do
						local a = Instance.new("Part",d)
						a.Position = RPS
						a.Color = RPA.Color
						a.Material = RPA.Material
						a.Orientation = V3(rand(0,360),rand(0,360),rand(0,360))
						a.Size = V3(10,10,10)
						a.Velocity = V3(rand(-150,150),rand(80,150),rand(-150,150))
						a.RotVelocity = V3(rand(-10,10),rand(-10,10),rand(-10,10))
						a.CanCollide=false
						a.Massless=true
						game:GetService("Debris"):AddItem(a,5)
					end
				end
				if Root.Velocity.Y < -250 then
					sound(CFN(RPS),6141030616,1.5,1,0,75)
					sound(CFN(RPS),3848677576,1.5,1,0,75)
					camshake(RPS,125,25)
					effect("Sphere",CFN(RPS),V3(3,3,3),W1PC,Neon,0,.4,Quad,Out,false,{Size=V3(100,100,100)},1,Sine)
					effect("Sphere",CFN(RPS),V3(3,3,3),W1SC,Neon,0,.8,Sine,Out,false,{Size=V3(100,100,100)},1,Sine)
					for i = 1,2 do
						local cf = CFN(RPS)*CFR(0,360,0,360,0,360)
						effect("HoleSphere2",cf,V3(3,3,3),W1PC,Neon,0,.6,Quad,Out,false,{Size=V3(100,100,100)},1,Sine)
					end
				end
				if Root.Velocity.Y < -600 then
					sound(CFN(RPS),5786032123,1.5,1,0,75)
					sound(CFN(RPS),255679373,2,1,0,100)
					camshake(RPS,300,50)
					local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
					effect("Fire",cf,V3(0,0,0),W1PC,Neon,0,1,Sine,Out,false,{Size=V3(500,0,500)},1,Quad)
					local cf = CFN(RPS,RPS+NO)*CFA(-90,0,0)*CFR(0,0,0,360,0,0)
					effect("Fire",cf,V3(0,0,0),W1SC,Neon,0,1,Sine,Out,false,{Size=V3(500,0,500)},1,Quad)
				end
				Root.Anchored=false
				script.Values.Anim.Value = "PowerHit"
				local ws = Hum.WalkSpeed
				local jp = Hum.JumpPower
				Hum.WalkSpeed = 0
				Hum.JumpPower = 0
				local height = Root.Position.Y
				if Root.Velocity.X > 100 or Root.Velocity.X < -100 or Root.Velocity.Z > 100 or Root.Velocity.Z < -100 then
					repeat
						Root.RotVelocity = V3()
						heartbeat:Wait()
						BG.MaxTorque = V3(math.huge,math.huge,math.huge)
						BG.CFrame = CFA(0,orientation,0)
						dirteff.Enabled = true
						local RPA = ray(Root.Position,V3(0,-5,0))
						if RPA then
							dirteff.Color = ColorSequence.new(RPA.Color)
						end
						if dirt.IsPlaying == false then
							dirt:Play()
						end
						dirteff.Rate = Root.Velocity.Magnitude
						dirt.Volume = math.clamp(Root.Velocity.Magnitude/300,0,3)
					until Root.Velocity.X < 1 and Root.Velocity.X > -1 and Root.Velocity.Z < 1 and Root.Velocity.Z > -1 or Root.Position.Y > height+20 or Root.Position.Y < height-20
					dirteff.Enabled = false
					BG.MaxTorque = V3(0,0,0)
				end
				dirt:Stop()
				wait(.5)
				Hum.WalkSpeed = ws
				Hum.JumpPower = jp
				script.Values.Anim.Value = comebackidle
				Root.Velocity = V3()
			end
		end
	end
end))

local apexauraval = 0

local rainbow = 0
local harmony = 180
local infernumdelay = 0
local harmonyoffset = 0
local repressionoffset = 0
local executionoffset = 0
local virtuedelay = 0

local flying = {
	["EXECUTION"]=true,
	["ANARCHY"]=true,
	["NIHIL"]=true,
	["SYSTEM"]=true,
	["SAGITTARIUS"]=true,
	["ABSOLUTION"]=true,
	["VINDICTIVE"]=true,
	["TEMPEST"]=true,
	["DISSONANCE"]=true,
}

local mismatchinfo = TweenInfo.new(.1,Linear,InOut,math.huge,true,0)
local mismatchprop1,mismatchprop2 = {Value = C3R(255,255,255)},{Value = C3R(0,0,0)}
local tween1,tween2 = tweens:Create(script.Dynamics.MismatchedA,mismatchinfo,mismatchprop1),tweens:Create(script.Dynamics.MismatchedB,mismatchinfo,mismatchprop2)
tween1:Play()
tween2:Play()

local blacklistedanims = {
	["SWITCH"]=true,
	["TELEPORT"]=true,
	["REPRESSIONCIRCLESSTART"]=true,
	["REPRESSIONBOMBSCHARGE"]=true,
	["SWING"]=true,
	["GRAB"]=true,
	["SLAM"]=true,
}
script.Values.Resting.Changed:Connect(function()
	if script.Values.Resting.Value == 1 then
		script.Values.Anim.Value = "RESTING"
	elseif not blacklistedanims[script.Values.Anim.Value] then
		script.Values.Anim.Value = comebackidle
	end
end)
script.Values.Anim.Changed:Connect(function()
	if script.Values.Anim.Value ~= "RESTING" then
		kevingaming = 0
		script.Values.Resting.Value = 0
	end
end)

local flyingdelay = 0
local mismatchalt = 0

local blinkinterval = 0

local nebulainfo = TweenInfo.new(3,Sine,InOut,math.huge,true,0)
local nb1,nb2 = {Value = C3R(210, 100, 255)},{Value = C3R(100, 160, 255)}
local nbt1,nbt2 = tweens:Create(script.Dynamics.NebulaA,nebulainfo,nb1),tweens:Create(script.Dynamics.NebulaB,nebulainfo,nb2)
nbt1:Play()
nbt2:Play()

local ap = {Value = C3R(150,255,130)}
local apt = tweens:Create(script.Dynamics.Aurora,nebulainfo,ap)
apt:Play()

local pprop = {Value = C3R(65, 90, 255)}
local pt = tweens:Create(script.Dynamics.Perdurance,nebulainfo,pprop)
pt:Play()

local spectrafieldprop = {Value=C3R(100,255,50)}
local sdt = tweens:Create(script.Dynamics.Spectrafield,nebulainfo,spectrafieldprop)
sdt:Play()

local instmult = 1
-- FINAL LOOP
while true do
	RCF = Root.CFrame
	RV = Root.Velocity*.2
	W1PC,W1SC = wing1.Primary.Color,wing1.Secondary.Color
	wait()
	if script.Values.CurrentBaseForm.Value == "APEX" then
		zID,xID,cID,vID = 1,2,3,4
	elseif script.Values.CurrentBaseForm.Value == "REPRESSION" then
		zID,xID,cID,vID = 5,6,7,8
	elseif script.Values.CurrentBaseForm.Value == "EXECUTION" then
		zID,xID,cID,vID = 9,10,11,12
	elseif script.Values.CurrentBaseForm.Value == "ANARCHY" then
		zID,xID,cID,vID = 13,14,15,16
	elseif script.Values.CurrentBaseForm.Value == "VIRTUE" then
		zID,xID,cID,vID = 17,18,19,20
	elseif script.Values.CurrentBaseForm.Value == "ABSOLUTION" then
		zID,xID,cID,vID = 21,22,23,24
	elseif script.Values.CurrentBaseForm.Value == "INFERNUM" then
		zID,xID,cID,vID = 25,26,27,28
	elseif script.Values.CurrentBaseForm.Value == "VINDICTIVE" then
		zID,xID,cID,vID = 1001,0,0,0
	else
		zID,xID,cID,vID = 0,0,0,0
	end
	if Hum then
		if Hum.Health == 0 then break end
	end
	if pullingchain == true then sound(Root.CFrame,5595840041,.6,rand(90,110)/100,0,50) end
	if instakill == true then
		instmult = 1000
	else
		instmult = 1
	end
	if beeified then
		if wing1 then
			falsehead.Eyes.Color3 = W1PC
			falsehead.Eye.Color = W1PC
		end
		for i,v in pairs(plr:GetDescendants()) do
			if v.Parent.Name == "Arm" or v.Parent.Name == "Leg" or v.Parent.Name == "Torso" or v.Parent.Name == "Amulet" then
				if v.Name == "Neon" then
					v.Color = W1PC
				elseif v.Name == "Secondary" then
					v.Color = NG.LowerHalf.FormName.TextStrokeColor3
				elseif v.Name == "Primary" then
					v.Color = NG.LowerHalf.FormName.TextColor3
				end
			end
		end
		if falsehead then
			blinkinterval += .3
			if falsehead:FindFirstChild("Eyes") then
				if blinkinterval >= 20 then
					falsehead.Eyes.Texture = "rbxassetid://6443894124"
					if beeified == true then
						falsehead.Eye.Transparency = 1
					end
					if blinkinterval >= 21 then
						blinkinterval = 0
					end
				else
					if beeified == true then
						falsehead.Eye.Transparency = .2
					end
					falsehead.Eyes.Texture = "rbxassetid://6443737548"
				end
			end
		end
	end
	
	if Hum.MoveDirection.Magnitude == 0 and Root.Velocity.Magnitude < 1 then
		if kevingaming >= 40 then
			script.Values.Resting.Value = 1
		end
	else
		kevingaming = 0
		script.Values.Resting.Value = 0
	end
	switchcooldown = math.clamp(switchcooldown-.016,0,math.huge)
	sine = sine + 1
	rainbow = math.clamp(rainbow+2,0,361)
	if rainbow > 360 then
		rainbow = 0
	end
	harmony = math.clamp(harmony+2,0,361)
	if harmony > 360 then
		harmony = 0
	end
	script.Dynamics.Execution.Value = C3H(rainbow/360,.7,1)
	script.Dynamics.Harmony.Value = C3H(harmony/360,.7,1)
	if activedynamic == true then
		local p = W1PC
		local s = W1SC
		if script.Values.CurrentForm.Value == "EXECUTION" or script.Values.CurrentForm.Value == "RAINBOW" then
			p = script.Dynamics.Execution.Value
			s = C3R(255,255,255)
		elseif script.Values.CurrentForm.Value == "STIGMA" then
			p = script.Dynamics.Execution.Value
			s = C3R(0,0,0)
		elseif script.Values.CurrentForm.Value == "SPECTRAFIELD" then
			p = script.Dynamics.Spectrafield.Value
			s = C3R(255,255,255)
		elseif script.Values.CurrentForm.Value == "RAINBOW" and altindex == 1 then
			p = script.Dynamics.Execution.Value
			s = C3R(0,0,0)
		elseif script.Values.CurrentForm.Value == "TURMOIL" then
			p = script.Dynamics.Execution.Value
			s = C3R(0,0,0)
		elseif script.Values.CurrentForm.Value == "EXASPERATION" then
			p = C3R(155+100*math.sin(sine/10),0,0)
			s = C3R(0,0,155+100*math.sin(sine/10))
		elseif comebackidle == "ABSOLUTION" then
			p = C3H(0,0,rand(1,100)/100)
			s = C3R(255-p.R*255,255-p.G*255,255-p.B*255)
		elseif script.Values.CurrentForm.Value == "ALTERATION" then
			p = C3H(0,0,rand(1,100)/100)
			s = C3H(0,0,rand(1,100)/100)
		elseif comebackidle == "HARMONY" then
			p = script.Dynamics.Execution.Value
			s = script.Dynamics.Harmony.Value
		elseif comebackidle == "REPRESSION" and altindex == 10 then
			local bc = BrickColor.Random().Color
			p = C3N(bc.R,bc.G,bc.B)
			s = C3R(27,42,53)
		elseif script.Values.CurrentForm.Value == "PEPSIMAN" and altindex == 666 then
			p = C3R(127.5+127.5*math.cos(sine/40),0,127.5-127.5*math.cos(sine/40))
			s = C3R(255,255,255)
		elseif comebackidle == "DISSONANCE" and altindex == 0 then
			p = C3H(rand(230,290)/360,rand(70,100)/100,rand(10,80)/100)
			s = C3H(rand(230,290)/360,rand(70,100)/100,rand(10,80)/100)
		elseif comebackidle == "DISSONANCE" and altindex == 1 then
			p = C3H(0,1,rand(0,100)/100)
			s = C3H(0,1,rand(0,100)/100)
		elseif comebackidle == "TEMPEST" and altindex == 5 then
			p = C3H(0.75+0.015*math.cos(sine/8), 1, 1)
			s = C3N(0.027451, 0, 0.0431373)
		elseif comebackidle == "EXECUTION" and altindex == 5 then
			p = script.Dynamics.NebulaA.Value
			s = script.Dynamics.NebulaB.Value
		elseif comebackidle == "EXECUTION" and altindex == 6 then
			p = script.Dynamics.Aurora.Value
			s = C3R(255,255,255)
		elseif comebackidle == "INFERNUM" and altindex == 300 then
			p = C3H(0.0696944, 0.909804, rand(75,100)*0.01)
			s = C3N(0.0588235, 0.0588235, 0.0784314)
		elseif comebackidle == "INFERNUM" and altindex == 50 then
			p = C3H(rand(1,360)/360,1,1)
			s = C3R(0,0,0)
		elseif comebackidle == "PERDURANCE" and altindex == 0 then
			local g = 0.85+0.15*math.cos(sine/20)
			local u = script.Dynamics.Perdurance.Value
			p = C3N(u.R*g,u.G*g,u.B*g)
			s = C3N(u.R*.15,u.G*.15,u.B*.15)
		elseif comebackidle == "SAGITTARIUS" then
			local zxc = rand(150,255)
			if altindex == 0 then
				s = C3R(zxc*.2,zxc*.2,zxc*.2)
				p = C3R(0,0,0)
			else
				p = C3R(zxc,zxc,zxc)
				s = C3R(zxc-60,zxc-60,zxc-60)
			end
		elseif script.Values.CurrentForm.Value == "SYSTEM_" then
			p = C3H(0,1,rand(0,100)/100)
			s = C3H(0,1,rand(0,100)/100)
			local ntable = {"SYSTEM_","SYSTEM_LOST","SYSTEM_EXCEPTION","SYSTEM_NULL","SYSTEM_CRASH","SYSMTE_SHUTDOWN","SYSTEM_DELETED","SYSTEM_NOT_FOUND","SYSTEM_FATALITY","SYSTEM_???","SYSTEM_ERROR","SYSTEM_CORRUPTED","SYSTEM_FAILURE","SYSTEM_UNKNOWN"}
			NG.LowerHalf.FormName.Text = ntable[rand(1,#ntable)]
		elseif script.Values.CurrentForm.Value == "NIHIL" then
			local n,i,h,l = {"N","n"},{"I","i"},{"H","h"},{"L","l"}
			NG.LowerHalf.FormName.Text = n[rand(1,2)]..i[rand(1,2)]..h[rand(1,2)]..i[rand(1,2)]..l[rand(1,2)]
			local ft = {"Arcade","Antique","SciFi","Bodoni","Garamond","Oswald","Arial","Bangers","Cartoon","Code","Creepster","DenkOne","Fantasy","Fondamento","FredokaOne","GothamSemibold","GrenzeGotisch","Highway","IndieFlower","JosefinSans","Jura","Kalam","LuckiestGuy","Merriweather","Michroma","Nunito","PatrickHand","PermanentMarker","RobotoMono","Sarpanch","SourceSansSemibold","SpecialElite","Ubuntu","TitilliumWeb"}
			NG.LowerHalf.FormName.Font = ft[rand(1,#ft)]
			p = C3H((240)/360,rand(0,100)/100,rand(0,100)/100)
			s = C3H((240)/360,rand(0,100)/100,rand(0,100)/100)
			local chartable = {"A","a","B","b","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z","1","!","2","@","3","#","4","$","5","%","6","^","7","&","8","*","9","(","0",")","[","]","{","}",":",";","'",'"',"|",",","<",".",">","/","?"}
			NG.LowerHalf.ScriptName.Text = chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)].." // "..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]..chartable[rand(1,#chartable)]
		elseif script.Values.CurrentForm.Value == "ABERRATION" then
			local ctable = {
				[1]={C3R(252, 226, 5);C3R(225, 225, 255)};
				[2]={C3R(155, 135, 12);C3R(0, 0, 0)};
				[3]={C3R(143, 139, 102);C3R(86, 86, 86)};
			}
			local ma = rand(1,3)
			p = ctable[ma][1]
			s = ctable[ma][2]
		elseif script.Values.CurrentForm.Value == "ANOMALY" then
			p = C3H(0,rand(0,100)/100,rand(0,100)/100)
			s = C3H(0,rand(0,100)/100,rand(0,100)/100)
		elseif script.Values.CurrentForm.Value == "TERMINATION" then
			local t,e,r,m,i,n,a,o,n = {"T","t"},{"E","e"},{"R","r"},{"M","m"},{"I","i"},{"N","n"},{"A","a"},{"O","o"},{"N","n"}
			NG.LowerHalf.FormName.Text = t[rand(1,2)]..e[rand(1,2)]..r[rand(1,2)]..m[rand(1,2)]..i[rand(1,2)]..n[rand(1,2)]..a[rand(1,2)]..t[rand(1,2)]..i[rand(1,2)]..o[rand(1,2)]..n[rand(1,2)]
			p = C3H((120)/360,rand(0,100)/100,rand(0,100)/100)
			s = C3H((120)/360,rand(0,100)/100,rand(0,100)/100)
		elseif script.Values.CurrentForm.Value == "404" then
			local x = math.random(1,3)
			local under  = {"","_",}
			if x > 1 then
				NG.LowerHalf.FormName.Text = "404"..under[math.random(1,#under)]
				p = C3R(47, 78, 255)
				s = C3R(24, 40, 130)
			else
				local under  = {"","_","_?","_!","!"}
				NG.LowerHalf.FormName.Text = under[math.random(1,#under)]..under[math.random(1,#under)]..under[math.random(1,#under)].."???"
				p = C3R(0,0,0)
				s = C3R(255,255,255)
			end
		elseif comebackidle == "VISUALISER" then
			local VSense = Loudness/875
			if VSense >= 1 then
				VSense = 1
			end
			p = C3H(sine/360 - math.floor(sine/360),1,VSense)
			s = C3H(0,0,VSense)
		end

		for i,v in pairs({NG.LowerHalf.Vis1,NG.LowerHalf.Vis2,NG.LowerHalf.Vis3,NG.LowerHalf.Vis4,NG.LowerHalf.Vis5,NG.LowerHalf.Vis6,NG.LowerHalf.Vis7,NG.LowerHalf.Vis8,NG.LowerHalf.Vis9}) do
			v.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,s),ColorSequenceKeypoint.new(1,p)})
		end
		NG.UpperHalf.Center.BackgroundColor3 = p
		NG.UpperHalf.Center.Inner.Amount.TextStrokeColor3 = p
		NG.UpperHalf.Center.Inner.Amount.TextColor3 = s
		NG.UpperHalf.Center.Inner.Max.TextStrokeColor3 = p
		NG.UpperHalf.Center.Inner.Max.TextColor3 = s
		NG.UpperHalf.Center.Inner.Bar.BackgroundColor3 = p
		
		NG.LowerHalf.FormName.TextStrokeColor3 = p
		NG.LowerHalf.FormName.TextColor3 = s
		NG.LowerHalf.ScriptName.TextStrokeColor3 = p
		NG.LowerHalf.ScriptName.TextColor3 = s
		if script.Values.CurrentForm.Value == "EXECUTION" and altindex == 0 or script.Values.CurrentForm.Value == "INFERNO" or script.Values.CurrentForm.Value == "SHATTERED" or script.Values.CurrentForm.Value == "RAINBOW" then
			NG.LowerHalf.FormName.TextStrokeColor3 = s
			NG.LowerHalf.FormName.TextColor3 = p
			NG.LowerHalf.ScriptName.TextStrokeColor3 = s
			NG.LowerHalf.ScriptName.TextColor3 = p
		end
		NG.LowerHalf.Deco.BackgroundColor3 = p
		NG.LowerHalf.Deco.Inner.BackgroundColor3 = s
		NG.UpperHalf.Center.Inner.Marble.ImageColor3 = s
		NG.UpperHalf.Center.Inner.Marble.Inner.ImageColor3 = p
		NG.UpperHalf.Center.Inner.Marble.Inner.Pattern.ImageColor3 = p
		
		Torso.PointLight.Color = p
		
		for i,v in pairs({wing1}) do
			if script.Values.CurrentForm.Value == "CHAOS" then
				local bc = BrickColor.Random().Color
				p = C3N(bc.R,bc.G,bc.B)
			elseif script.Values.CurrentForm.Value == "SHATTERED" or script.Values.CurrentForm.Value == "NIL" then
				p = C3H(rand(1,360)/360,1,1)
				s = C3H(rand(1,360)/360,1,1)
			elseif script.Values.CurrentForm.Value == "SYSTEM_" then
				p = C3H(0,1,rand(0,100)/100)
				s = C3H(0,1,rand(0,100)/100)
			elseif script.Values.CurrentForm.Value == "ALTERATION" then
				p = C3H(0,0,rand(1,100)/100)
				s = C3H(0,0,rand(1,100)/100)
			end
			v.Primary.Color = p
			v.Secondary.Color = s
			v.Spin.Color = p
			v.Primary.PointLight.Color = p
			v.Particle["0"].Main.Color = ColorSequence.new(p)
			v.Particle["0"].Secondary.Color = ColorSequence.new(p)
			v.Particle["0"].Shine.Color = ColorSequence.new(p)
			v.Trail.Color = ColorSequence.new(p)

			v.Primary.Main.Color = ColorSequence.new(p)
			v.Secondary.Main.Color = ColorSequence.new(s)
			v.Particle["0"].Circle.Color = ColorSequence.new(p)
		end
	else
		NG.LowerHalf.FormName.Rotation = 0
	end
	if Theme.SoundId == "rbxassetid://1839527140" then
		if Theme.TimePosition > 261 then
			Theme.TimePosition = 0
		end
	elseif Theme.SoundId == "rbxassetid://1839527181" then
		if Theme.TimePosition > 108 then
			Theme.TimePosition = 0.2
		end
	end
	NG.UpperHalf.Center.Inner.Amount.Text = Hum.Health
	if Root.RotVelocity.Magnitude > 140 then
		Root.RotVelocity = V3()
	end
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "LASTSTARONFIRE" then
			if v.Value == plr.Name then
				v.Parent.Humanoid.Health -= rand(1000,2000)
				for x,y in pairs(v.Parent:GetChildren()) do
					if y:IsA("Part") then
						local cf = y.CFrame*CFrame.new(math.random(-y.Size.X,y.Size.X)/2,math.random(-y.Size.Y,y.Size.Y)/2,math.random(-y.Size.Z,y.Size.Z)/2)
						local cfc = CFrame.new(cf.Position)
						local x = math.random(1,10)
						if x == 1 then
							effect("Cube",cf*CFR(0,360,0,360,0,360),V3(1,1,1),v.c1.Value,Neon,0,1,Linear,In,false,{Size=V3(0,0,0);CFrame=cfc*CFN(0,rand(4,10),0)*CFR(0,360,0,360,0,360);Color=v.c2.Value},1,Linear)
						end
					end
				end
			end
		end
	end
	if Theme.IsPlaying == false then
		Theme.TimePosition = 0
		Theme:Play()
	end
	NG.UpperHalf.Center.Decoration.BackgroundColor3 = NG.UpperHalf.Center.Inner.Amount.TextColor3
	NG.UpperHalf.Center.Inner.BackgroundColor3 = NG.UpperHalf.Center.Inner.Amount.TextColor3
	
	for y,u in pairs(workspace:GetChildren()) do
		if u:FindFirstChild("Humanoid") then
			local stun = u.Humanoid:FindFirstChild("LASTSTARSTUN")
			if stun then
				u.Humanoid.PlatformStand = true
			else
				u.Humanoid.PlatformStand = false
			end
		end
	end
	altswitchcooldown = math.clamp(altswitchcooldown-.05,0,1)
	script.Cooldowns.Z.Value = zID
	script.Cooldowns.X.Value = xID
	script.Cooldowns.C.Value = cID
	script.Cooldowns.V.Value = vID
	
	local RP,RPO = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.Position+V3(0,10,0),V3(0,-20,0)),{d},false,true)
	if RP then
		if RP.Parent.Name == "Spawn" or RP.Parent.Parent.Name == "Spawn" then
			Root.CFrame = Root.CFrame+V3(0,10,0)
		end
	end
end
