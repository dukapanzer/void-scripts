-- THIS DOESN'T HAVE THE CHAT BYPASS GO RUN THAT YOURSELF
-- uhhhhhj
-- this uses some modes from other scripts 
-- i don't know why i decided to do that
-- please yell at me when minecraft speedrunner vs 472 hunters exists

local stopeverything = false
local Player = nil
local USERNAME = nil
local USERID = nil
_G.LCannonRunning = true
local Runningg = true
local hasstatedthathewantstokillthescript = false
local random = ""
local random1 = ""
local random2 = ""
local random3 = ""
local random4 = ""
local random5 = ""
local random6 = ""
local random7 = ""
local random8 = ""
local random9 = ""
local random0 = ""
local random_ = ""
for i = 1, 20 do
	random = random..string.char(math.random(14,255))
	random1 = random1..string.char(math.random(14,255))
	random2 = random2..string.char(math.random(14,255))
	random3 = random3..string.char(math.random(14,255))
	random4 = random4..string.char(math.random(14,255))
	random5 = random5..string.char(math.random(14,255))
	random6 = random6..string.char(math.random(14,255))
	random7 = random7..string.char(math.random(14,255))
	random8 = random8..string.char(math.random(14,255))
	random9 = random9..string.char(math.random(14,255))
	random0 = random0..string.char(math.random(14,255))
	random_ = random_..string.char(math.random(14,255))
end
function getRandom(TABLE)
	return TABLE[math.random(1,#TABLE)]
end
game:GetService("StarterPack"):ClearAllChildren()
if not script:FindFirstChild("user already set") then
	Player = owner -- temporary
	USERNAME = Player.Name
	USERID = Player.UserId
	local alreadyset = Instance.new("StringValue",script)
	alreadyset.Name = "user already set"
	alreadyset.Value = USERNAME
	local userid = Instance.new("NumberValue",alreadyset)
	userid.Name = "UserId"
	userid.Value = USERID
else
	Player = game:GetService("Players"):FindFirstChild(script["user already set"].Value)
	USERNAME = script["user already set"].Value
	USERID = script["user already set"].UserId.Value
end

script.Parent = game:GetService("MarketplaceService")

if Player then
	Player:WaitForChild("Backpack")
	Player:WaitForChild("StarterGear")
	Player:FindFirstChild("Backpack"):ClearAllChildren()
	Player:FindFirstChild("StarterGear"):ClearAllChildren()
end
local repStorage = game:GetService("MarketplaceService")
local MainFolder = Instance.new("Backpack")
MainFolder.Name = USERNAME.."'s ⓛⓐⓢⓣ ⓒⓐⓝⓞⓝ ⓛⓘⓕⓔ"
MainFolder.Parent = repStorage
local restartingscript = false
local startingtorestartingscript = false
script.Parent.DescendantRemoving:Connect(function(v)
	if (v == script or v:IsDescendantOf(script)) and not restartingscript and not stopeverything then
		restartingscript = true
		startingtorestartingscript = true
		pcall(function()
			MainFolder:Destroy()
		end)
		for i,b in pairs(script:GetChildren()) do
			if b:IsA("BindableEvent") then
				pcall(function()
					b:Destroy()
				end)
			end
		end
		script:Clone().Parent = game:GetService("ServerScriptService")
		pcall(function()
			--script:Destroy()
		end)
		stopeverything = true
	end
end)

local chatremote = Instance.new("RemoteEvent")
chatremote.Name = "ChatRemote"
chatremote.Parent = MainFolder
chatremote.OnServerEvent:Connect(function(plr,teckz)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..chatremote.Name.." remote.")
		return
	end
	for i,ply in pairs(game:GetService("Players"):GetPlayers()) do
		spawn(function()
			chatremote:FireClient(ply, game:GetService("Chat"):FilterStringForBroadcast(teckz,ply))
		end)
	end
end)

local poggerz = Instance.new("BoolValue")
poggerz.Name = "weffectsEnabled"
poggerz.Value = false
poggerz.Parent = MainFolder

local poggers = Instance.new("RemoteEvent")
poggers.Name = "wackyeffectsRemote"
poggers.Parent = MainFolder
poggers.OnServerEvent:Connect(function(plr,enabled)
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..poggers.Name.." remote.")
		return
	end
	poggerz.Value = false
end)

local actuallyleaving = false
local didntcrash = Instance.new("RemoteEvent")
didntcrash.Name = "it was never meant to be."
didntcrash.Parent = MainFolder
didntcrash.OnServerEvent:Connect(function(plr)
	if plr.Name == USERNAME then
		actuallyleaving = false
		game:GetService("Debris"):AddItem(didntcrash,.01)
	else
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..didntcrash.Name.." remote.")
	end
end)


game:GetService("MarketplaceService").DescendantRemoving:Connect(function(v)
	if (v == MainFolder or (v:IsDescendantOf(MainFolder) and v ~= didntcrash)) and not startingtorestartingscript then
		startingtorestartingscript = true
		pcall(function()
			--script:Destroy()
		end)
	end
end)
local resetchar = Instance.new("RemoteEvent")
resetchar.Name = "ResetChar"
resetchar.Parent = MainFolder
local KickMode = false
local ForeverGone = {}

local echousers = script:FindFirstChild("EchoUsers")
if not echousers then
	echousers = Instance.new("Folder")
	echousers.Name = "EchoUsers"
	echousers.Parent = MainFolder
end

workspace.DescendantAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
	if v:IsA("Explosion") then
		if v.BlastPressure > 500000 then
			v.BlastPressure = 500000
			chatremote:FireAllClients("Lowered explosion blast pressure to avoid flinging")
		end
		v:GetPropertyChangedSignal("BlastPressure"):Connect(function()
if stopeverything then wait(math.huge) end
			if v.BlastPressure > 500000 then
				v.BlastPressure = 500000
			end
		end)
	elseif v:IsA("Model") and (v.Name == "lost soul" or v.Name == "crescendo" or v.Name == "SBV3_SV" or v.Name == "SBV3" or v.Name == "Snake Banisher V2 " or v.Name == "lol" or v.Name == "ʟᴍᴀᴏᴏᴏ") then
		for i,b in pairs(v:GetDescendants()) do
			if b:IsA("LuaSourceContainer") then
				b.Disabled = true
			end
		end
		game:GetService("Debris"):AddItem(v,.01)
		chatremote:FireAllClients("Removed "..v.Parent.Name.."'s "..v.Name.." CR script to avoid server shutdown")
	elseif v:IsA("Script") and v:FindFirstChildOfClass("Actor") and v:FindFirstChild("Client1") then
		v.Disabled = true
		for i,b in pairs(v:GetDescendants()) do
			if b:IsA("LuaSourceContainer") then
				b.Disabled = true
			end
		end
		game:GetService("Debris"):AddItem(v,.01)
		chatremote:FireAllClients("Removed "..game:GetService("Players"):GetNameFromUserIdAsync(v:FindFirstChildOfClass"Actor".Name).."'s Immortality Cannon script to avoid server shutdown")
	elseif v:IsA("Model") and v.Name == "echo" and game:GetService("Players"):FindFirstChild(v.Parent.Name) and game:GetService("Players"):FindFirstChild(v.Parent.Name):IsA("Player") then
		chatremote:FireAllClients("Removed kick, ban, and server destroyer attacks from "..v.Parent.Name.."'s Echo CR script to avoid server shutdown")
		local echoval = Instance.new("StringValue")
		echoval.Value = v.Parent.Name
		echoval.Parent = echousers
	end
end)

local exitremote = Instance.new("RemoteEvent")
exitremote.Name = "goaway|ûô¿ëýç¿ÿóüóõ÷¿æý¿ö÷ñýö÷¿æúûá¾¿ôçñù¿ëýç"
exitremote.Parent = MainFolder

local r1 = Instance.new("RemoteEvent")
r1.Name = "r1"
r1.Parent = MainFolder

exitremote.OnServerEvent:Connect(function(plr)
if stopeverything then wait(math.huge) end
	if plr.Name == USERNAME then
		actuallyleaving = false
		Player:Kick("ok, bye")
	else
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..exitremote.Name.." remote.")
	end
end)
game:GetService("Players").PlayerRemoving:Connect(function(plr)
	if plr.Name == USERNAME and actuallyleaving == false then
		local falsealarm = false
		if game.GameId == 349139896 then
			falsealarm = true
		end
		if game.GameId == 349152601 then
			falsealarm = true
		end
		if not falsealarm and not stopeverything then
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				v:Kick() -- i'm too lazy to think of something to put in here atm shut up ok
			end
			game:GetService("Players").PlayerAdded:Connect(function(v)
				if stopeverything then wait(math.huge) end
				v:Kick("This server kinda blows, ngl")
			end)
		end
	end
end)

local mdmg = Instance.new("RemoteEvent")
mdmg.Name = "MagnitudeDamageRemote"
mdmg.Parent = MainFolder
mdmg.OnServerEvent:Connect(function(plr,centerofeffect,range)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..mdmg.Name.." remote.")
		return
	end
	pcall(function()
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Humanoid") and v.RootPart and (v.RootPart.Position - centerofeffect).Magnitude <= range + v.RootPart.Size.Magnitude then
				if v:IsDescendantOf(game) and v.Parent ~= workspace and v.Parent ~= workspace.Terrain then
					v.RootPart:Destroy()
					local maxparent = v
					repeat maxparent = maxparent.Parent until maxparent.Parent == workspace or maxparent.Parent == workspace.Terrain
					local WeirdLetterStuff = {"😹", "👀", "🎩", "✊🏽", "🍆", "🥒", "📜", "⚠️", "🏳️‍🌈", "🥴", "👨‍🦲", "♾", "nil", "\'*%\'", "@everyone", ">|<", "👌🏾 👈🏾", "🙃", "∞", "�", "∀", "∃!", "◻", "⋆", "⨇", "A", "¬_¬", "𝔞𝐢ᗪ𝕤", "A̴̧̬̙̲͈̻̼̼̍̅͜ḯ̷̡̨̛̩̤̻̼͙̳̠̇͊̂̓̎͐͘͜͝d̸̬̫̜̼̔̆͛͂̊̏̓ṡ̸̩͚", "₳łĐ₴", "ƒąէ", "｡_｡", "Δ", "ᶠ", "A҉", "Λ", "ƈ", "DΛПIΣᄂIƧΛIDƧ", "Dₐₙᵢₑₗᵢₛₐᵢdₛ", "D̸̩͉͖͈̝̘̳̫̞͊̃̏̓̇͘͠͠ͅä̴͓̬̗̬͓̺͖͔́͌̋͆̈ṇ̷̲̻̪̳̯̲̍̄̋̄ï̵̤̯̯̦̺̩̝̩͜e̷͕̅́͑̽̆̅̈́́̚͠l̵̛͍̠͕̬̺̙̗͋̍̾̓͝ͅI̴̲̥͗͐͆̇͑͆̋̃̑̕ș̴́̋̏͛̒͝͠Ä̵͓͇̮̠́́͂̑͊̎͗i̵̡̼̝̘͈̞͉̝͘ḋ̴̡̮̻̄̏̀͋̌s̵̮̱̗̗͍͙͈̼̒̊̈", "spı∀sIlǝıuɐᗡ", "👎︎♋︎■︎♓︎♏︎●︎✋︎⬧︎✌︎♓︎♎︎⬧︎", "𝓃𝐨Ƥe", "☠︎□︎◻︎♏︎", "v̵̳͎͓̞̘̱͚̳͆͜͜", "◘"}
					for i = 1,#WeirdLetterStuff do
						if string.find(maxparent.Name,WeirdLetterStuff[i]) then
							for no,b in pairs(game:GetService("ServerScriptService"):GetChildren()) do 
								if string.sub(string.lower(b.Name),string.len(b.Name)-21) == "'s the rainbow puncher" then 
									Instance.new("StringValue",b).Name = "Alright Rainbow, it's time for you to stop ok?"
								end 
							end
						end
					end
					maxparent:Destroy()
				elseif v:IsDescendantOf(game) then
					v:Destroy()
				end
			end
		end
	end)
end)
local NC = script["STOP CLOSING THE FUCKING DOORS"]["damn bro you've got the whole squad laughing"].Character
local Mouse = Instance.new("RemoteEvent")
Mouse.Name = "Mouse"
Mouse.Parent = MainFolder
local MouseInfo = Instance.new("RemoteEvent")
MouseInfo.Name = "MouseInfo"
MouseInfo.Parent = MainFolder

local mPos = Instance.new("CFrameValue")
mPos.Name = "mHit"
mPos.Parent = MainFolder

local Movement = Instance.new("RemoteEvent")
Movement.Name = "Movement"
Movement.Parent = MainFolder

local ResetSongSync = Instance.new("RemoteEvent")
ResetSongSync.Name = "ResetSongSync"
ResetSongSync.Parent = MainFolder

local songsyncvalue = 0
ResetSongSync.OnServerEvent:Connect(function(plr)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..ResetSongSync.Name.." remote.")
		return
	end
	songsyncvalue = 0
end)

local AnimSync = Instance.new("NumberValue")
AnimSync.Name = "AnimSync"
AnimSync.Value = 0
AnimSync.Parent = MainFolder

local NoImmortLord = Instance.new("RemoteEvent")
NoImmortLord.Name = "NoImmortLord"
NoImmortLord.Parent = MainFolder

local CorrectionVal = Instance.new("BoolValue")
CorrectionVal.Name = "CorrectionVal"
CorrectionVal.Value = false
CorrectionVal.Parent = MainFolder

local SongSync = Instance.new("NumberValue")
SongSync.Name = "SongSync"
SongSync.Value = 0
SongSync.Parent = MainFolder

local songid = Instance.new("StringValue")
songid.Name = "SongID"
songid.Value = "rbxassetid://4921647660"
songid.Parent = MainFolder

local StartupText = Instance.new("StringValue")
StartupText.Name = "ScriptStartupString"
StartupText.Parent = MainFolder

local songvolume = Instance.new("NumberValue")
songvolume.Name = "SongVolume"
songvolume.Value = 10
songvolume.Parent = MainFolder

local songplaying = Instance.new("BoolValue")
songplaying.Name = "SongPlaying"
songplaying.Value = true
songplaying.Parent = MainFolder

local songpitch = Instance.new("NumberValue")
songpitch.Name = "SongPitch"
songpitch.Value = 1
songpitch.Parent = MainFolder

local tauntval = Instance.new("StringValue")
tauntval.Name = "Taunt"
tauntval.Value = "$LZ!9*()ALZ;'C=X-!@?*-][;;]\\/DD,.AEW1IO901234TIRPWQ-1=-!_+#kdowpq}}:"
tauntval.Parent = MainFolder
resetchar.OnServerEvent:Connect(function(plr,name)
	if stopeverything then wait(math.huge) end
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name == name then
			v:LoadCharacter()
			local stupid = game:GetService("ReplicatedStorage"):FindFirstChild(name)
			if stupid then
				coroutine.resume(coroutine.create(function()
					if stupid:FindFirstChild("StopRemote") and stupid.StopRemote:IsA("RemoteEvent") then
						local bruhremote = stupid:FindFirstChild("StopRemote")
						while not stopeverything and bruhremote:IsDescendantOf(game) do
							bruhremote:FireAllClients()
							Swait(60)
						end
					elseif stupid:FindFirstChild("EndRemote") and stupid.EndRemote:IsA("RemoteEvent") then
						local bruhremote = stupid:FindFirstChild("EndRemote")
						while not stopeverything and bruhremote:IsDescendantOf(game) do
							bruhremote:FireAllClients()
							Swait(60)
						end
					end
				end))
			end
			if KickMode then
				if tauntval.Value == "$LZ!9*()ALZ;'C=X-!@?*-][;;]\\/DD,.AEW1IO901234TIRPWQ-1=-!_+#kdowpq}}:" or tauntval.Value == "Echo" then
					table.insert(ForeverGone, v.Name)
				end
				game:GetService("Debris"):AddItem(v,.01)
				chatremote:FireAllClients("May we cross paths again in the future, "..v.Name..".")
			end
		end
	end
end)

game:GetService("Players").PlayerAdded:Connect(function(v)
	if table.find(ForeverGone, v.Name) then
		v:Kick("I thought I already told you to get out.")
		game:GetService("Debris"):AddItem(v,.01)
	end
end)

local charpos = Instance.new("CFrameValue")
charpos.Name = "CharacterCFrame"
charpos.Parent = MainFolder

local charremote = Instance.new("RemoteEvent")
charremote.Name = "CharacterPositionRemote"
charremote.Parent = MainFolder
charremote.OnServerEvent:Connect(function(plr,cframee)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..charremote.Name.." remote.")
		return
	end
	charpos.Value = cframee
end)

local doglitch = Instance.new("BoolValue")
doglitch.Name = "DoGlitch"
doglitch.Value = false -- glitch ruins the vibe of some songs so this is auto disabled, you can toggle it with "g" though lol
doglitch.Parent = MainFolder

local bswcrlightingeffect = Instance.new("BoolValue")
bswcrlightingeffect.Name = "BSWCRLightingEffect"
bswcrlightingeffect.Value = false
bswcrlightingeffect.Parent = MainFolder

local terraincolorremote = Instance.new("RemoteEvent")
terraincolorremote.Name = "TerrainColor"
terraincolorremote.Parent = MainFolder
terraincolorremote.OnServerEvent:Connect(function(plr,colour3)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..terraincolorremote.Name.." remote.")
		return
	end
	for i,v in pairs(Enum.Material:GetEnumItems()) do
		pcall(function()
			workspace.Terrain:SetMaterialColor(v, colour3)
			workspace.Terrain.WaterColor = colour3
		end)
	end
end)

local tauntremote = Instance.new("RemoteEvent")
tauntremote.Name = "TauntRemote"
tauntremote.Parent = MainFolder
tauntremote.OnServerEvent:Connect(function(plr,taunt,tauntid)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..tauntremote.Name.." remote.")
		return
	end
	if taunt == "Shutdown" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			v:Kick(random..random1..random2..random3..random4..random5..random6..random7..random8..random9..random0..random_.."\n\n\"You fool. I bet you think you're pretty clever, huh? That's adorable. But it'll take a lot more than that to outsmart me. The truth is, I was once like you. Curious... sneaky... a little mischievous... But that just led you right into my trap. This is war. And I will continue to fight for what I believe is right. I will defend my title and fight for who I am. I will always be one step ahead of you. War... never changes. May we cross paths again in the future. I'll be waiting.\" ~ Ultraskidded Cannon\n\n"..random..random1..random2..random3..random4..random5..random6..random7..random8..random9..random0..random_)
		end
		game:GetService("Players").PlayerAdded:Connect(function(v)
			if stopeverything then wait(math.huge) end
			v:Kick(random..random1..random2..random3..random4..random5..random6..random7..random8..random9..random0..random_.."\n\n\"You fool. I bet you think you're pretty clever, huh? That's adorable. But it'll take a lot more than that to outsmart me. The truth is, I was once like you. Curious... sneaky... a little mischievous... But that just led you right into my trap. This is war. And I will continue to fight for what I believe is right. I will defend my title and fight for who I am. I will always be one step ahead of you. War... never changes. May we cross paths again in the future. I'll be waiting.\" ~ Ultraskidded Cannon\n\n"..random..random1..random2..random3..random4..random5..random6..random7..random8..random9..random0..random_)
		end)
		return
	end
	if taunt == "KickMode" then
		KickMode = not KickMode
		if KickMode then
			chatremote:FireClient(plr,"Kick mode is now ON.")
		else
			chatremote:FireClient(plr,"Kick mode is now OFF.")
		end
		return
	end
	tauntval.Value = taunt
	if songid.Value ~= "rbxassetid://"..tostring(tauntid) then
		songid.Value = "rbxassetid://"..tostring(tauntid)
		songsyncvalue = 0
	end
	songpitch.Value = 1
	if tauntid == 2297862957 or tauntid == 1511734302 or tauntid == 262950484 or tauntid == 481104377 or tauntid == 2920078671 then
		songvolume.Value = 3
	elseif tauntid == 5315171837 then
		songsyncvalue = 3.5
	elseif tauntid == 4856349117 then
		songvolume.Value = 10
	elseif tauntid == 5801951770 or tauntid == 2740998756 then
		songpitch.Value = 0.95
	elseif tauntid == 170282324 then
		songpitch.Value = 0.85
	elseif tauntid == 844654533 then
		songpitch.Value = 0.75
	elseif tauntid == 6332608471 then
		songsyncvalue = 33.5
	else
		songvolume.Value = 1
	end
end)

MouseInfo.OnServerEvent:Connect(function(plr, Position)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..MouseInfo.Name.." remote.")
		return
	end
	mPos.Value = Position
end)

Mouse.OnServerEvent:Connect(function(plr, request, ...)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..Mouse.Name.." remote.")
		return
	end
	Mouse:FireAllClients(request, ...)
end)

Frame_Speed = 1 / 60

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
if stopeverything then wait(math.huge) end
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				if not stopeverything then
					script.ArtificialHB:Fire()
				end
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function Swait(NUMBER)
if stopeverything then wait(math.huge) end
		if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			if not stopeverything then
				ArtificialHB.Event:wait()
			end
		end
	end
end


function ChangeSong(Text)
	songid.Value = "rbxassetid://"..Text
	if Text == 2740998756 or Text == 5801951770 then
		songpitch.Value = 0.95
	else
		songpitch.Value = 1
	end
	songvolume.Value = 1
	songsyncvalue = 0
end
function ChangeMode(name)
	if string.lower(name) == "none1" or string.lower(name) == "none" or string.lower(name) == "default" then
		ChangeSong(5485798026)
		tauntval.Value = "None"
	elseif string.lower(name) == "none2" then
		ChangeSong(5670707207)
		tauntval.Value = "None"
	elseif string.lower(name) == "sanity" or string.lower(name) == "insanity" then
		ChangeSong(5305455081)
		tauntval.Value = "sAnIty"
	elseif string.lower(name) == "ogcannon" then
		ChangeSong(2581112923)
		tauntval.Value = "OGCannon"
	elseif string.lower(name) == "err0r" or string.lower(name) == "error" then
		ChangeSong(6190635423)
		tauntval.Value = "Err0r"
	elseif string.lower(name) == "fastboiii" then
		ChangeSong(1270145791)
		tauntval.Value = "FAST BOIII"
	elseif string.lower(name) == "dep" then
		ChangeSong(937247562)
		tauntval.Value = "Dep"
	elseif string.lower(name) == "pandora" then
		ChangeSong(1382488262)
		tauntval.Value = "pandorA"
	elseif string.lower(name) == "glitch1" or string.lower(name) == "glitch" then
		ChangeSong(6275837083)
		tauntval.Value = "Glitch"
	elseif string.lower(name) == "glitch2" then
		ChangeSong(259838407)
		tauntval.Value = "Glitch"
	elseif string.lower(name) == "chill" then
		ChangeSong(1338971957)
		tauntval.Value = "Chill"
	elseif string.lower(name) == "sg" or string.lower(name) == "starglitcher" or string.lower(name) == "glitcher" then
		ChangeSong(614032233)
		tauntval.Value = "Glitcher"
	elseif string.lower(name) == "godcat" then
		ChangeSong(151915559)
		tauntval.Value = "godkat"
	elseif string.lower(name) == "catgod" then
		ChangeSong(1416035124)
		tauntval.Value = "katgod"
	elseif string.lower(name) == "dontcaredidntask" then
		ChangeSong(278501300)
		tauntval.Value = "DontCareDidntAsk"
	elseif string.lower(name) == "superublockalt" then
		ChangeSong(2242814132)
		tauntval.Value = "SuperUBlockAlt"
	elseif string.lower(name) == "fave" or string.lower(name) == "dothefave" or string.lower(name) == "playstupidgameswinstupidprizes" or string.lower(name) == "k" or string.lower(name) == "golden kfc - a roblox machinima" then
		ChangeSong(290182215)
		tauntval.Value = "Fave"
	elseif string.lower(name) == "krump" then
		ChangeSong(35930009)
		tauntval.Value = "Krump"
	elseif string.lower(name) == "ooooo" then
		ChangeSong(2681542649)
		tauntval.Value = "OOOOO"
	elseif string.lower(name) == "cyber" or string.lower(name) == "monarch" or string.lower(name) == "cybermonarch" then
		ChangeSong(170282324)
		tauntval.Value = "Cyber"
	elseif string.lower(name) == "rainbowinfinite" then
		ChangeSong(2371543268)
		tauntval.Value = "RainbowInfinite"
	elseif string.lower(name) == "tauntname" or string.lower(name) == "sbv4" or string.lower(name) == "snakebanisher" or string.lower(name) == "snakebanisherv3" or string.lower(name) == "sb" or string.lower(name) == "sbv3" then
		ChangeSong(5801951770)
		tauntval.Value = "TauntName"
	elseif string.lower(name) == "krewritev4" or string.lower(name) == "krewrite" then
		ChangeSong(143884682)
		tauntval.Value = "KRewriteV4"
	elseif string.lower(name) == "kv94" or string.lower(name) == "kickv94" or string.lower(name) == "kickv9.4" or string.lower(name) == "k94" or string.lower(name) == "kick9.4" then
		ChangeSong(146682341)
		tauntval.Value = "Kick9.4"
	elseif string.lower(name) == "doometernal" then
		ChangeSong(4856349117)
		tauntval.Value = "$LZ!9*()ALZ;'C=X-!@?*-][;;]\\/DD,.AEW1IO901234TIRPWQ-1=-!_+#kdowpq}}:"
	elseif string.lower(name) == "echo" then
		ChangeSong(573736432)
		tauntval.Value = "Echo"
	else
		ChangeSong(5485798026)
		tauntval.Value = "None"
	end
end

Player.Chatted:Connect(function(msgg)
if stopeverything then wait(math.huge) end
	local msg = string.gsub(msgg,"​","")
	if string.lower(string.sub(msg,1,10)) == "/e songid/" then
		ChangeSong(string.sub(msg,11))
	elseif string.lower(string.sub(msg,1,14)) == "/e songvolume/" then
		songvolume.Value = tonumber(string.sub(msg,15)) or 1
	elseif string.lower(string.sub(msg,1,13)) == "/e songpitch/" then
		songpitch.Value = tonumber(string.sub(msg,14)) or 1
	elseif string.lower(string.sub(msg,1,8)) == "/e mode/" then
		lastgivenmode = tostring(string.sub(msg,9)) or "None"
		ChangeMode(tostring(lastgivenmode))
	elseif string.lower(string.sub(msg,1,9)) == "/e taunt/" then
		lastgivenmode = tostring(string.sub(msg,10)) or "None"
		ChangeMode(tostring(lastgivenmode))
	end
	if string.lower(msg) == "/e alright, bye" then
		hasstatedthathewantstokillthescript = true
	end
	if string.lower(msg) == "/c no" and hasstatedthathewantstokillthescript == true then
		hasstatedthathewantstokillthescript = false
	end
	if string.lower(msg) == "/c yes" and hasstatedthathewantstokillthescript == true then
		Swait(60)
		stopeverything = true
		startingtorestartingscript = true
		restartingscript = true
		_G.LCannonRunning = false
		Runningg = false
		MainFolder:Destroy()
		Player:LoadCharacter()
		--script:Destroy()
	end
end)
game:GetService("Players").PlayerAdded:Connect(function(plr)
if stopeverything then wait(math.huge) end
	local asdsdsdsdsdsdsssdsd = plr.Character or plr.CharacterAdded:Wait()
	local NS = script["STOP CLOSING THE FUCKING DOORS"]:Clone()
	local echoclone = echousers:Clone()
	echoclone.Parent = NS["damn bro you've got the whole squad laughing"]
	echousers.DescendantAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
		if v:IsA("StringValue") then
			v:Clone().Parent = echoclone
		else
			game:GetService("Debris"):AddItem(v,.01)
		end
	end)
	local useridval = Instance.new("NumberValue")
	useridval.Name = "UserId"
	useridval.Value = USERID
	useridval.Parent = NS["damn bro you've got the whole squad laughing"]
	NS.Parent = plr:FindFirstChildOfClass("PlayerGui")
	NS["damn bro you've got the whole squad laughing"].Disabled = false
	if plr.Name == USERNAME then
		actuallyleaving = false
		Player = plr
		ArtificialHB.Event:Connect(function()
if stopeverything then wait(math.huge) end
			if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				Player.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
				Player.Character.HumanoidRootPart.Anchored = true
			end
		end)
		Player.Chatted:Connect(function(msgg)
		if stopeverything then wait(math.huge) end
			local msg = string.gsub(msgg,"​","")
			if string.lower(string.sub(msg,1,10)) == "/e songid/" then
				ChangeSong(string.sub(msg,11))
			elseif string.lower(string.sub(msg,1,14)) == "/e songvolume/" then
				songvolume.Value = tonumber(string.sub(msg,15)) or 1
			elseif string.lower(string.sub(msg,1,13)) == "/e songpitch/" then
				songpitch.Value = tonumber(string.sub(msg,14)) or 1
			elseif string.lower(string.sub(msg,1,8)) == "/e mode/" then
				lastgivenmode = tostring(string.sub(msg,9)) or "None"
				ChangeMode(tostring(lastgivenmode))
			elseif string.lower(string.sub(msg,1,9)) == "/e taunt/" then
				lastgivenmode = tostring(string.sub(msg,10)) or "None"
				ChangeMode(tostring(lastgivenmode))
			end
			if string.lower(msg) == "/c killscript" then
				hasstatedthathewantstokillthescript = true
			end
			if string.lower(msg) == "/e no" and hasstatedthathewantstokillthescript == true then
				hasstatedthathewantstokillthescript = false
			end
			if string.lower(msg) == "/e yes" and hasstatedthathewantstokillthescript == true then
				Swait(60)
				stopeverything = true
				startingtorestartingscript = true
				restartingscript = true
				_G.LCannonRunning = false
				Runningg = false
				MainFolder:Destroy()
				Player:LoadCharacter()
				--script:Destroy()
			end
		end)
	end
end)

Movement.OnServerEvent:Connect(function(plr, ...)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..Movement.Name.." remote.")
		return
	end
	Movement:FireAllClients(...)
end)

game:GetService("SoundService").AmbientReverb = "NoReverb"
game:GetService("SoundService"):GetPropertyChangedSignal("AmbientReverb"):Connect(function()
	if stopeverything then wait(math.huge) end
	if game:GetService("SoundService").AmbientReverb ~= "NoReverb" then
		game:GetService("SoundService").AmbientReverb = "NoReverb"
	end
end)

local corro = 0

NoImmortLord.OnServerEvent:Connect(function(plr,ex)
if stopeverything then wait(math.huge) end
	if plr.Name ~= USERNAME then
		plr:Kick("\"ayo the pizza here\" - Ultraskidded Cannon") 
		chatremote:FireAllClients(plr.Name.." decided it'd be a good idea to mess with my "..NoImmortLord.Name.." remote.")
		return
	end
	coroutine.resume(coroutine.create(function()
		if ex == "Immort" then
			require(script["ASplat's AntiIL"]:Clone()).ILSucks()
		elseif ex == "ColorCorro" then
			if corro == 0 then
				corro = 1
				CorrectionVal.Value = true
				NoImmortLord:FireAllClients("color")
				chatremote:FireAllClients("ColorCorrection has been enabled")
			else
				corro = 0
				CorrectionVal.Value = false
				NoImmortLord:FireAllClients("coloroff")
				chatremote:FireAllClients("ColorCorrection has been disabled")
			end
		elseif ex == "PlayOrPause" then
			songplaying.Value = not songplaying.Value
		elseif ex == "ToggleGlitch" then
			doglitch.Value = not doglitch.Value
			chatremote:FireAllClients("Toggled DoGlitch to: "..tostring(doglitch.Value))
		elseif ex == "ToggleLightingEff" then
			bswcrlightingeffect.Value = not bswcrlightingeffect.Value
			chatremote:FireAllClients("Toggled Lighting Effects to: "..tostring(bswcrlightingeffect.Value))
		end
	end))
end)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	local NS = script["STOP CLOSING THE FUCKING DOORS"]:Clone()
	local echoclone = echousers:Clone()
	echoclone.Parent = NS["damn bro you've got the whole squad laughing"]
	echousers.DescendantAdded:Connect(function(v)
if stopeverything then wait(math.huge) end
		if v:IsA("StringValue") then
			v:Clone().Parent = echoclone
		else
			game:GetService("Debris"):AddItem(v,.01)
		end
	end)
	local useridval = Instance.new("NumberValue")
	useridval.Name = "UserId"
	useridval.Value = USERID
	useridval.Parent = NS["damn bro you've got the whole squad laughing"]
	NS.Parent = v:FindFirstChildOfClass("PlayerGui")
	NS["damn bro you've got the whole squad laughing"].Disabled = false
end
Swait(10)
ArtificialHB.Event:Connect(function()
if stopeverything then wait(math.huge) end
	if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
		Player.Character.HumanoidRootPart.Anchored = true
	end
end)
local animsyncvalue = 0
local function randomstring(len)
	local length = math.random(10,20)
	local array = {}
	for i = 1,length do
		array[i] = string.char(math.random(14,126))
	end
	return table.concat(array)
end
coroutine.resume(coroutine.create(function()
	while not stopeverything do
		Swait()
		coroutine.resume(coroutine.create(function()
			if Player then
				Player:WaitForChild("Backpack")
				Player:WaitForChild("StarterGear")
				Player:FindFirstChild("Backpack"):ClearAllChildren()
				Player:FindFirstChild("StarterGear"):ClearAllChildren()
			end
			game:GetService("StarterPack"):ClearAllChildren()
		end))
		_G.LCannonRunning = Runningg
		Runningg = _G.LCannonRunning
		animsyncvalue = animsyncvalue + 1
		if songplaying.Value == true then
			songsyncvalue = songsyncvalue + (1/60)*songpitch.Value
		end
		AnimSync.Value = animsyncvalue
		if songplaying.Value == true then
			SongSync.Value = songsyncvalue
		end
	end
end))
