
--Converted with ttyyuu12345's model to script plugin v4
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Folder0 = Instance.new("Folder")
ModuleScript1 = Instance.new("ModuleScript")
ModuleScript2 = Instance.new("ModuleScript")
ModuleScript3 = Instance.new("ModuleScript")
Folder4 = Instance.new("Folder")
RemoteEvent5 = Instance.new("RemoteEvent")
Folder6 = Instance.new("Folder")
Trail7 = Instance.new("Trail")
ParticleEmitter8 = Instance.new("ParticleEmitter")
ParticleEmitter9 = Instance.new("ParticleEmitter")
ParticleEmitter10 = Instance.new("ParticleEmitter")
Model11 = Instance.new("Model")
Part12 = Instance.new("Part")
Decal13 = Instance.new("Decal")
SpecialMesh14 = Instance.new("SpecialMesh")
Vector3Value15 = Instance.new("Vector3Value")
Vector3Value16 = Instance.new("Vector3Value")
Vector3Value17 = Instance.new("Vector3Value")
Vector3Value18 = Instance.new("Vector3Value")
Vector3Value19 = Instance.new("Vector3Value")
Part20 = Instance.new("Part")
Decal21 = Instance.new("Decal")
Motor6D22 = Instance.new("Motor6D")
Motor6D23 = Instance.new("Motor6D")
Motor6D24 = Instance.new("Motor6D")
Motor6D25 = Instance.new("Motor6D")
Motor6D26 = Instance.new("Motor6D")
Part27 = Instance.new("Part")
Part28 = Instance.new("Part")
Part29 = Instance.new("Part")
Part30 = Instance.new("Part")
Humanoid31 = Instance.new("Humanoid")
Part32 = Instance.new("Part")
Motor6D33 = Instance.new("Motor6D")
BodyColors34 = Instance.new("BodyColors")
Shirt35 = Instance.new("Shirt")
Pants36 = Instance.new("Pants")
Accessory37 = Instance.new("Accessory")
Part38 = Instance.new("Part")
SpecialMesh39 = Instance.new("SpecialMesh")
StringValue40 = Instance.new("StringValue")
Weld41 = Instance.new("Weld")
Accessory42 = Instance.new("Accessory")
Part43 = Instance.new("Part")
SpecialMesh44 = Instance.new("SpecialMesh")
StringValue45 = Instance.new("StringValue")
Weld46 = Instance.new("Weld")
Accessory47 = Instance.new("Accessory")
Part48 = Instance.new("Part")
SpecialMesh49 = Instance.new("SpecialMesh")
StringValue50 = Instance.new("StringValue")
Weld51 = Instance.new("Weld")
Accessory52 = Instance.new("Accessory")
Part53 = Instance.new("Part")
SpecialMesh54 = Instance.new("SpecialMesh")
StringValue55 = Instance.new("StringValue")
Weld56 = Instance.new("Weld")
Accessory57 = Instance.new("Accessory")
Part58 = Instance.new("Part")
SpecialMesh59 = Instance.new("SpecialMesh")
StringValue60 = Instance.new("StringValue")
Weld61 = Instance.new("Weld")
Accessory62 = Instance.new("Accessory")
Part63 = Instance.new("Part")
SpecialMesh64 = Instance.new("SpecialMesh")
StringValue65 = Instance.new("StringValue")
Weld66 = Instance.new("Weld")
Accessory67 = Instance.new("Accessory")
Part68 = Instance.new("Part")
SpecialMesh69 = Instance.new("SpecialMesh")
StringValue70 = Instance.new("StringValue")
Weld71 = Instance.new("Weld")
Accessory72 = Instance.new("Accessory")
Part73 = Instance.new("Part")
SpecialMesh74 = Instance.new("SpecialMesh")
StringValue75 = Instance.new("StringValue")
Weld76 = Instance.new("Weld")
Accessory77 = Instance.new("Accessory")
Part78 = Instance.new("Part")
SpecialMesh79 = Instance.new("SpecialMesh")
StringValue80 = Instance.new("StringValue")
Weld81 = Instance.new("Weld")
Accessory82 = Instance.new("Accessory")
Part83 = Instance.new("Part")
SpecialMesh84 = Instance.new("SpecialMesh")
StringValue85 = Instance.new("StringValue")
Weld86 = Instance.new("Weld")
Folder87 = Instance.new("Folder")
Animation88 = Instance.new("Animation")
Animation89 = Instance.new("Animation")
Animation90 = Instance.new("Animation")
Animation91 = Instance.new("Animation")
Animation92 = Instance.new("Animation")
Animation93 = Instance.new("Animation")
Animation94 = Instance.new("Animation")
Folder0.Name = "modules"
Folder0.Parent = Model0
ModuleScript1.Name = "MuchachoHitbox"
ModuleScript1.Parent = Folder0
table.insert(cors,sandbox(ModuleScript1,function()
--[[


   _____            __    _ __  ___           __           
  / ___/__  _______/ /_  (_)  |/  /___ ______/ /____  _____
  \__ \/ / / / ___/ __ \/ / /|_/ / __ `/ ___/ __/ _ \/ ___/
 ___/ / /_/ (__  ) / / / / /  / / /_/ (__  ) /_/  __/ /    
/____/\__,_/____/_/ /_/_/_/  /_/\__,_/____/\__/\___/_/     
                                                           




____________________________________________________________________________________________________________________________________________________________________________
				
	[ UPDATE LOG v1.1 :]
1. New property!!
	Hitbox.Key = "insert anything you want here"
		--- This property will be used for the new function | module:FindHitbox(key)
		
2. New function!!
	Module:FindHitbox(Key)
		--- Returns a hitbox using specified Key, nil otherwise
		
3. New detection mode! | "ConstantDetection"
	Hitbox.DetectionMode = "ConstantDetection"
		--- The same as the default detection mode but no hit pool / debounce
		--- You're free to customize the debounce anyway you want
		
4, Made the scripts cleaner
____________________________________________________________________________________________________________________________________________________________________________
	
	[ UPDATE LOG v1.2 :]
1. Made the code better

____________________________________________________________________________________________________________________________________________________________________________
	
	[ UPDATE LOG v1.3 :]
1. New property
	HitboxObject.AutoDestroy = true (Default)
		---  With the value being false you can keep using Stop() 
		and Start() without the hitbox being destroyed.

2. New metamethod
	HitboxObject:Destroy()
		---  This destroys the hitbox. You only need to use this
			 When having AutoDestroy's value set to false.
			 
3. Minor bug fixes
			 
____________________________________________________________________________________________________________________________________________________________________________

	[ UPDATE LOG v1.4  Experimental:]
1. New event
	HitboxObject.TouchEnded:Connect(instance)
				Description
					--- The event fires once a part stops touching the hitbox
				Arguments
					--- Instance part: Returns the part that the hitbox stopped touching
					
____________________________________________________________________________________________________________________________________________________________________________

		 UPDATE LOG v1.5  Stable:]
1. Reverted touch ended, will add back after the bug is fixed

____________________________________________________________________________________________________________________________________________________________________________

		 UPDATE LOG v1.6  Stable:]
1. Touch ended is back! It has been fixed
2. HitboxObject.Key is now generated automatically
3. Minor changes

____________________________________________________________________________________________________________________________________________________________________________

	Example code:
		local module = require(game.ServerStorage.MuchachoHitbox)

		local hitbox = module.CreateHitbox()
		hitbox.Size = Vector3.new(10,10,10)
		hitbox.CFrame = workspace.Part

		hitbox.Touched:Connect(function(hit, hum)
			print(hit)
			hum:TakeDamage(10)
		end)
		
		hitbox:Start()
	
	
	Alright thats all for the example code, its a pretty simple module, you could make a module similar to this yourself.
	And maybe even make it better.
	
	If you encounter any bugs, please tell me in the comment section, or you could DM me on discord
	sushimaster#7840
	
	❤ SushiMaster
____________________________________________________________________________________________________________________________________________________________________________
	
	
	[MuchachoHitbox Documentation]

		* local Module = require(MuchachoHitbox)
				--- Require the module


			[ FUNCTIONS ]

		* Module.CreateHitbox()
				Description
					--- Creates a hitbox
					
		* Module:FindHitbox(Key)
				Description
					--- Returns a hitbox with specified Key

		* HitboxObject:Start()
				Description
					--- Starts the hitbox. 
					
		* HitboxObject:Stop()
				Description
					--- Stops the hitbox and resets the debounce.
					
		* HitboxObject:Destroy()
				Description
					--- Destroys the hitbox. Use this when you have
						HitboxObject.AutoDestroy set to false
					
			[ EVENTS ]

		* HitboxObject.Touched:Connect(hit, humanoid)
				Description
					--- If the hitbox touches a humanoid, it'll return information on them
					--- The hitbox can detect parts depending on the detection mode
				Arguments
					--- Instance part: Returns the part that the hitbox hit first
					--- Instance humanoid: Returns the Humanoid object 
					
		* HitboxObject.TouchEnded:Connect(instance)
				Description
					--- The event fires once a part stops touching the hitbox
				Arguments
					--- Instance part: Returns the part that the hitbox stopped touching
					
			[ PROPERTIES ]

		* HitboxObject.OverlapParams: OverlapParams
				Description
					--- Takes in a OverlapParams object

		* HitboxObject.Visualizer: boolean
				Description
					--- Turns on or off the visualizer part

		* HitboxObject.CFrame: CFrame / Instance
				Description
					--- Sets the hitbox CFrame to the CFrame
					--- If its an instance, then the hitbox would follow the instance
					
		* HitboxObject.Shape: Enum.PartType.Block / Enum.PartType.Ball
				Description
					--- Defaults to block
					--- Sets the hitbox shape to the property
					
		* HitboxObject.Size: Vector3 / number 
				Description
					--- Sets the size of the hitbox
					--- It uses Vector3 if the shape is block
					--- It uses number if the shape is ball
					
		* HitboxObject.Offset: CFrame
				Description
					--- Hitbox offset

		* HitboxObject.DetectionMode: string | "Default" , "HitOnce" , "HitParts" , "ConstantDetection"
				Description
					--- Default value set to "Default"
					--- Changes on how the detection works
					
		* HitboxObject.Key: String
				Description
					--- The key property for the find hitbox function
					--- MuchachoHitbox automatically generates a randomized key for you but you can change it. The module will save the hitbox, and can be found using | Module:FindHitbox(Key)
					
		* HitboxObject.AutoDestroy: boolean
				Description
					--- Default value is set to true
					--- When set to true, :Stop() atomatically destroys the hitbox.
					--- Does not destroy the hitbox when set to false. You'll 
						have to use :Destroy() to delete the hitbox.
			
			[ DETECTION MODES ]

		* Default
				Description
					--- Checks if a humanoid exists when this hitbox touches a part. The hitbox will not return humanoids it has already hit for the duration
					--- the hitbox has been active.

		* HitParts
				Description
					--- OnHit will return every hit part, regardless if it's ascendant has a humanoid or not.
					--- OnHit will no longer return a humanoid so you will have to check it. The hitbox will not return parts it has already hit for the
					--- duration the hitbox has been active.

		* HitOnce
				Description
					--- Hitbox will stop as soon as it detects a humanoid
					
		* ConstantDetection
				Description
					--- The default detection mode but no hitlist / debounce
					
____________________________________________________________________________________________________________________________________________________________________________

]]

local rs = game:GetService("RunService")
local hs = game:GetService("HttpService")

local GoodSignal = require(script.GoodSignal)
local DictDiff = require(script.DictDiff)

local muchacho_hitbox = {}
muchacho_hitbox.__index = muchacho_hitbox

local HITBOX_COLOR = Color3.fromRGB(255,0,0)
local HITBOX_TRANSPARENCY = 0.8


local adornment_form = {
	["Proportion"] = {
		[Enum.PartType.Ball] = "Radius",
		[Enum.PartType.Block] = "Size",
	},

	["Shape"] = {
		[Enum.PartType.Ball] = "SphereHandleAdornment",
		[Enum.PartType.Block] = "BoxHandleAdornment",
	},
}

local get_CFrame = {
	["Instance"] = function(point)
		return point.CFrame
	end,

	["CFrame"] = function(point)
		return point
	end,
}

local spatial_query = {
	[Enum.PartType.Ball] = function(self)
		local point_type = typeof(self.CFrame)
		local point_cframe = get_CFrame[point_type](self.CFrame)

		local parts = workspace:GetPartBoundsInRadius(point_cframe.p + self.Offset.p, self.Size, self.OverlapParams)

		return parts
	end,

	[Enum.PartType.Block] = function(self)
		local point_type = typeof(self.CFrame)
		local point_cframe = get_CFrame[point_type](self.CFrame)

		local parts = workspace:GetPartBoundsInBox(point_cframe * self.Offset, self.Size, self.OverlapParams)

		return parts
	end,
}

local hitboxes = {}


function muchacho_hitbox.CreateHitbox()
	return setmetatable({
		Visualizer = true,
		DetectionMode = "Default",
		AutoDestroy = true,	
		Key = hs:GenerateGUID(false),

		HitList = {},
		TouchingParts = {},

		Connection = nil,
		Box = nil,

		Touched = GoodSignal.new(),
		TouchEnded = GoodSignal.new(),

		OverlapParams = OverlapParams.new(),

		Size = Vector3.new(0,0,0),
		Shape = Enum.PartType.Block,
		CFrame = CFrame.new(0,0,0),
		Offset = CFrame.new(0,0,0)

	}, muchacho_hitbox)
end

function muchacho_hitbox:FindHitbox(key)
	if hitboxes[key] then
		return hitboxes[key]
	end
end

function muchacho_hitbox:_visualize()
	if not self.Visualizer then return end

	local point_type = typeof(self.CFrame)
	local point_cframe = get_CFrame[point_type](self.CFrame)

	local proportion = adornment_form.Proportion[self.Shape]

	if self.Box then
		self.Box.CFrame = point_cframe * self.Offset
	else
		self.Box = Instance.new(adornment_form.Shape[self.Shape])
		self.Box.Name = "Visualizer"
		self.Box.Adornee = workspace.Terrain
		self.Box[proportion] = self.Size
		self.Box.CFrame = point_cframe * self.Offset
		self.Box.Color3 = HITBOX_COLOR
		self.Box.Transparency = HITBOX_TRANSPARENCY
		self.Box.Parent = workspace.Terrain
	end
end

function muchacho_hitbox:_InsertTouchingParts(part)
	if table.find(self.TouchingParts, part) then return end

	table.insert(self.TouchingParts, part)
end

function muchacho_hitbox:_FindTouchEnded(parts)
	if not self.TouchingParts[1] then return end

	local mode = self.DetectionMode
	local differences = DictDiff.difference(self.TouchingParts, parts)

	if differences then
		for _, diff in ipairs(differences) do
			self.TouchEnded:Fire(diff)
			table.remove(self.TouchingParts, table.find(self.TouchingParts, diff))
		end
	end
end

function muchacho_hitbox:_cast()
	local mode = self.DetectionMode
	local parts = spatial_query[self.Shape](self)

	self:_FindTouchEnded(parts)

	for _, hit in pairs(parts) do
		local character = hit:FindFirstAncestorOfClass("Model") or hit.Parent
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		-- detection mode
		if mode == "Default" and humanoid and not self.HitList[table.find(self.HitList, humanoid)] then
			table.insert(self.HitList, humanoid)
			self:_InsertTouchingParts(hit)

			self.Touched:Fire(hit, humanoid)

		elseif mode == "ConstantDetection" and humanoid then
			self:_InsertTouchingParts(hit)

			self.Touched:Fire(hit, humanoid)

		elseif mode == "HitOnce" and humanoid then
			self:_InsertTouchingParts(hit)

			self.Touched:Fire(hit, humanoid)
			self.TouchEnded:Fire(hit)

			self:Stop()
			break

		elseif mode == "HitParts" then
			self:_InsertTouchingParts(hit)

			self.Touched:Fire(hit)

		end
	end
end

function muchacho_hitbox:_clear()
	self.HitList = {}

	if self.Connection then
		self.Connection:Disconnect()
	end

	if self.Key then
		hitboxes[self.Key] = nil
	end

	if self.Box then
		self.Box:Destroy()
		self.Box = nil
	end
end

function muchacho_hitbox:Start()
	if hitboxes[self.Key] then
		error("A hitbox with this Key has already been started. Change the key if you want to start this hitbox.")
	end

	hitboxes[self.Key] = self

	-- looping the hitbox
	task.spawn(function()	
		self.Connection = rs.Heartbeat:Connect(function()
			self:_visualize()
			self:_cast()
		end)
	end)
end

function muchacho_hitbox:Stop()
	-- clear hitbox
	self:_clear()

	if not self.AutoDestroy then return end

	-- terminate hitbox
	self.Touched:DisconnectAll()
	self.TouchEnded:DisconnectAll()
	setmetatable(self, nil)
end

function muchacho_hitbox:Destroy()
	-- clear hitbox
	self:_clear()

	-- terminate hitbox
	self.Touched:DisconnectAll()
	self.TouchEnded:DisconnectAll()
	setmetatable(self, nil)
end

return muchacho_hitbox

end))
ModuleScript2.Name = "GoodSignal"
ModuleScript2.Parent = ModuleScript1
table.insert(cors,sandbox(ModuleScript2,function()
--------------------------------------------------------------------------------
--               Batched Yield-Safe Signal Implementation                     --
-- This is a Signal class which has effectively identical behavior to a       --
-- normal RBXScriptSignal, with the only difference being a couple extra      --
-- stack frames at the bottom of the stack trace when an error is thrown.     --
-- This implementation caches runner coroutines, so the ability to yield in   --
-- the signal handlers comes at minimal extra cost over a naive signal        --
-- implementation that either always or never spawns a thread.                --
--                                                                            --
-- API:                                                                       --
--   local Signal = require(THIS MODULE)                                      --
--   local sig = Signal.new()                                                 --
--   local connection = sig:Connect(function(arg1, arg2, ...) ... end)        --
--   sig:Fire(arg1, arg2, ...)                                                --
--   connection:Disconnect()                                                  --
--   sig:DisconnectAll()                                                      --
--   local arg1, arg2, ... = sig:Wait()                                       --
--                                                                            --
-- Licence:                                                                   --
--   Licenced under the MIT licence.                                          --
--                                                                            --
-- Authors:                                                                   --
--   stravant - July 31st, 2021 - Created the file.                           --
--------------------------------------------------------------------------------

-- The currently idle thread to run the next handler on
local freeRunnerThread = nil

-- Function which acquires the currently idle handler runner thread, runs the
-- function fn on it, and then releases the thread, returning it to being the
-- currently idle one.
-- If there was a currently idle runner thread already, that's okay, that old
-- one will just get thrown and eventually GCed.
local function acquireRunnerThreadAndCallEventHandler(fn, ...)
	local acquiredRunnerThread = freeRunnerThread
	freeRunnerThread = nil
	fn(...)
	-- The handler finished running, this runner thread is free again.
	freeRunnerThread = acquiredRunnerThread
end

-- Coroutine runner that we create coroutines of. The coroutine can be 
-- repeatedly resumed with functions to run followed by the argument to run
-- them with.
local function runEventHandlerInFreeThread()
	-- Note: We cannot use the initial set of arguments passed to
	-- runEventHandlerInFreeThread for a call to the handler, because those
	-- arguments would stay on the stack for the duration of the thread's
	-- existence, temporarily leaking references. Without access to raw bytecode
	-- there's no way for us to clear the "..." references from the stack.
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

-- Connection class
local Connection = {}
Connection.__index = Connection

function Connection.new(signal, fn)
	return setmetatable({
		_connected = true,
		_signal = signal,
		_fn = fn,
		_next = false,
	}, Connection)
end

function Connection:Disconnect()
	self._connected = false

	-- Unhook the node, but DON'T clear it. That way any fire calls that are
	-- currently sitting on this node will be able to iterate forwards off of
	-- it, but any subsequent fire calls will not hit it, and it will be GCed
	-- when no more fire calls are sitting on it.
	if self._signal._handlerListHead == self then
		self._signal._handlerListHead = self._next
	else
		local prev = self._signal._handlerListHead
		while prev and prev._next ~= self do
			prev = prev._next
		end
		if prev then
			prev._next = self._next
		end
	end
end

-- Make Connection strict
setmetatable(Connection, {
	__index = function(tb, key)
		error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(key)), 2)
	end,
	__newindex = function(tb, key, value)
		error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(key)), 2)
	end
})

-- Signal class
local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_handlerListHead = false,
	}, Signal)
end

function Signal:Connect(fn)
	local connection = Connection.new(self, fn)
	if self._handlerListHead then
		connection._next = self._handlerListHead
		self._handlerListHead = connection
	else
		self._handlerListHead = connection
	end
	return connection
end

-- Disconnect all handlers. Since we use a linked list it suffices to clear the
-- reference to the head handler.
function Signal:DisconnectAll()
	self._handlerListHead = false
end

-- Signal:Fire(...) implemented by running the handler functions on the
-- coRunnerThread, and any time the resulting thread yielded without returning
-- to us, that means that it yielded to the Roblox scheduler and has been taken
-- over by Roblox scheduling, meaning we have to make a new coroutine runner.
function Signal:Fire(...)
	local item = self._handlerListHead
	while item do
		if item._connected then
			if not freeRunnerThread then
				freeRunnerThread = coroutine.create(runEventHandlerInFreeThread)
				-- Get the freeRunnerThread to the first yield
				coroutine.resume(freeRunnerThread)
			end
			task.spawn(freeRunnerThread, item._fn, ...)
		end
		item = item._next
	end
end

-- Implement Signal:Wait() in terms of a temporary connection using
-- a Signal:Connect() which disconnects itself.
function Signal:Wait()
	local waitingCoroutine = coroutine.running()
	local cn;
	cn = self:Connect(function(...)
		cn:Disconnect()
		task.spawn(waitingCoroutine, ...)
	end)
	return coroutine.yield()
end

-- Implement Signal:Once() in terms of a connection which disconnects
-- itself before running the handler.
function Signal:Once(fn)
	local cn;
	cn = self:Connect(function(...)
		if cn._connected then
			cn:Disconnect()
		end
		fn(...)
	end)
	return cn
end

-- Make signal strict
setmetatable(Signal, {
	__index = function(tb, key)
		error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(key)), 2)
	end,
	__newindex = function(tb, key, value)
		error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(key)), 2)
	end
})

return Signal

end))
ModuleScript3.Name = "DictDiff"
ModuleScript3.Parent = ModuleScript1
table.insert(cors,sandbox(ModuleScript3,function()
local module = {}

local function find(a, tbl)
	for _, a_ in ipairs(tbl) do 
		if a_==a then return true end 
	end
end

function module.difference(a, b)
	local ret = {}
	for _, v in ipairs(a) do
		if not find(v,b) then table.insert(ret, v) end
	end
	
	return ret
end


return module


end))
Folder4.Name = "remotes"
Folder4.Parent = Model0
RemoteEvent5.Name = "combat"
RemoteEvent5.Parent = Folder4
Folder6.Name = "vfxeffects"
Folder6.Parent = Model0
Trail7.Parent = Folder6
Trail7.Color = ColorSequence.new(Color3.new(0.784314, 0, 1),Color3.new(0.784314, 0, 1))
Trail7.LightInfluence = 1
Trail7.Texture = "rbxassetid://12781880888"
Trail7.Transparency = NumberSequence.new(0,1)
Trail7.MinLength = 0
Trail7.Lifetime = 0.10000000149011612
ParticleEmitter8.Name = "Wind"
ParticleEmitter8.Parent = Folder6
ParticleEmitter8.Speed = NumberRange.new(10, 10)
ParticleEmitter8.Orientation = Enum.ParticleOrientation.VelocityParallel
ParticleEmitter8.Enabled = false
ParticleEmitter8.LightInfluence = 1
ParticleEmitter8.Texture = "rbxassetid://8187306581"
ParticleEmitter8.Transparency = NumberSequence.new(0,1)
ParticleEmitter8.Lifetime = NumberRange.new(0.5, 0.5)
ParticleEmitter8.Rate = 10
ParticleEmitter8.SpreadAngle = Vector2.new(360, -360)
ParticleEmitter8.VelocitySpread = 360
ParticleEmitter9.Name = "Punch"
ParticleEmitter9.Parent = Folder6
ParticleEmitter9.Speed = NumberRange.new(10, 10)
ParticleEmitter9.Enabled = false
ParticleEmitter9.LightInfluence = 1
ParticleEmitter9.Texture = "rbxassetid://1525327413"
ParticleEmitter9.Transparency = NumberSequence.new(0,1)
ParticleEmitter9.Size = NumberSequence.new(1,5)
ParticleEmitter9.Lifetime = NumberRange.new(0.3499999940395355, 0.3499999940395355)
ParticleEmitter9.SpreadAngle = Vector2.new(360, 360)
ParticleEmitter9.VelocitySpread = 360
ParticleEmitter10.Name = "Punch2"
ParticleEmitter10.Parent = Folder6
ParticleEmitter10.Speed = NumberRange.new(10, 10)
ParticleEmitter10.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
ParticleEmitter10.Enabled = false
ParticleEmitter10.LightInfluence = 1
ParticleEmitter10.Texture = "rbxassetid://1084952073"
ParticleEmitter10.Transparency = NumberSequence.new(0,1)
ParticleEmitter10.Size = NumberSequence.new(2,2)
ParticleEmitter10.Lifetime = NumberRange.new(0.3499999940395355, 0.3499999940395355)
ParticleEmitter10.SpreadAngle = Vector2.new(360, 360)
ParticleEmitter10.VelocitySpread = 360
Model11.Name = "skidded Dummy"
Model11.Parent = Model0
Model11.PrimaryPart = Part32
Part12.Name = "Head"
Part12.Parent = Model11
Part12.CFrame = CFrame.new(0, 4.5, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part12.Position = Vector3.new(0, 4.5, 0.19525933265686035)
Part12.Color = Color3.new(0.992157, 0.917647, 0.552941)
Part12.Size = Vector3.new(2, 1, 1)
Part12.BrickColor = BrickColor.new("Cool yellow")
Part12.TopSurface = Enum.SurfaceType.Smooth
Part12.brickColor = BrickColor.new("Cool yellow")
Part12.FormFactor = Enum.FormFactor.Symmetric
Part12.formFactor = Enum.FormFactor.Symmetric
Decal13.Name = "face"
Decal13.Parent = Part12
Decal13.Texture = "http://www.roblox.com/asset/?id=25165947"
SpecialMesh14.Parent = Part12
SpecialMesh14.MeshId = "https://assetdelivery.roblox.com/v1/asset/?id=14478743918"
SpecialMesh14.MeshType = Enum.MeshType.FileMesh
Vector3Value15.Name = "FaceCenterAttachment"
Vector3Value15.Parent = SpecialMesh14
Vector3Value16.Name = "FaceFrontAttachment"
Vector3Value16.Parent = SpecialMesh14
Vector3Value16.Value = Vector3.new(3.9356886638586275e-09, 0, -0.6002722978591919)
Vector3Value17.Name = "HairAttachment"
Vector3Value17.Parent = SpecialMesh14
Vector3Value17.Value = Vector3.new(0, 0.6000000238418579, 0)
Vector3Value18.Name = "HatAttachment"
Vector3Value18.Parent = SpecialMesh14
Vector3Value18.Value = Vector3.new(0, 0.6000000238418579, 0)
Vector3Value19.Name = "NeckRigAttachment"
Vector3Value19.Parent = SpecialMesh14
Vector3Value19.Value = Vector3.new(0, -0.5, 0)
Part20.Name = "Torso"
Part20.Parent = Model11
Part20.CFrame = CFrame.new(0, 3, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part20.Position = Vector3.new(0, 3, 0.19525933265686035)
Part20.Color = Color3.new(0.156863, 0.498039, 0.278431)
Part20.Size = Vector3.new(2, 2, 1)
Part20.BrickColor = BrickColor.new("Dark green")
Part20.LeftParamA = 0
Part20.LeftParamB = 0
Part20.LeftSurface = Enum.SurfaceType.Weld
Part20.RightParamA = 0
Part20.RightParamB = 0
Part20.RightSurface = Enum.SurfaceType.Weld
Part20.brickColor = BrickColor.new("Dark green")
Part20.FormFactor = Enum.FormFactor.Symmetric
Part20.formFactor = Enum.FormFactor.Symmetric
Decal21.Name = "roblox"
Decal21.Parent = Part20
Motor6D22.Name = "Right Shoulder"
Motor6D22.Parent = Part20
Motor6D22.MaxVelocity = 0.10000000149011612
Motor6D22.C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D22.C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D22.Part0 = Part20
Motor6D22.Part1 = Part28
Motor6D22.part1 = Part28
Motor6D23.Name = "Left Shoulder"
Motor6D23.Parent = Part20
Motor6D23.MaxVelocity = 0.10000000149011612
Motor6D23.C0 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D23.C1 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D23.Part0 = Part20
Motor6D23.Part1 = Part27
Motor6D23.part1 = Part27
Motor6D24.Name = "Right Hip"
Motor6D24.Parent = Part20
Motor6D24.MaxVelocity = 0.10000000149011612
Motor6D24.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D24.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
Motor6D24.Part0 = Part20
Motor6D24.Part1 = Part30
Motor6D24.part1 = Part30
Motor6D25.Name = "Left Hip"
Motor6D25.Parent = Part20
Motor6D25.MaxVelocity = 0.10000000149011612
Motor6D25.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D25.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Motor6D25.Part0 = Part20
Motor6D25.Part1 = Part29
Motor6D25.part1 = Part29
Motor6D26.Name = "Neck"
Motor6D26.Parent = Part20
Motor6D26.MaxVelocity = 0.10000000149011612
Motor6D26.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D26.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D26.Part0 = Part20
Motor6D26.Part1 = Part12
Motor6D26.part1 = Part12
Part27.Name = "Left Arm"
Part27.Parent = Model11
Part27.CFrame = CFrame.new(-1.5, 3, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part27.Position = Vector3.new(-1.5, 3, 0.19525933265686035)
Part27.Color = Color3.new(0.992157, 0.917647, 0.552941)
Part27.Size = Vector3.new(1, 2, 1)
Part27.BrickColor = BrickColor.new("Cool yellow")
Part27.CanCollide = false
Part27.brickColor = BrickColor.new("Cool yellow")
Part27.FormFactor = Enum.FormFactor.Symmetric
Part27.formFactor = Enum.FormFactor.Symmetric
Part28.Name = "Right Arm"
Part28.Parent = Model11
Part28.CFrame = CFrame.new(1.5, 3, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part28.Position = Vector3.new(1.5, 3, 0.19525933265686035)
Part28.Color = Color3.new(0.992157, 0.917647, 0.552941)
Part28.Size = Vector3.new(1, 2, 1)
Part28.BrickColor = BrickColor.new("Cool yellow")
Part28.CanCollide = false
Part28.brickColor = BrickColor.new("Cool yellow")
Part28.FormFactor = Enum.FormFactor.Symmetric
Part28.formFactor = Enum.FormFactor.Symmetric
Part29.Name = "Left Leg"
Part29.Parent = Model11
Part29.CFrame = CFrame.new(-0.5, 1, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part29.Position = Vector3.new(-0.5, 1, 0.19525933265686035)
Part29.Color = Color3.new(0.0509804, 0.411765, 0.67451)
Part29.Size = Vector3.new(1, 2, 1)
Part29.BottomSurface = Enum.SurfaceType.Smooth
Part29.BrickColor = BrickColor.new("Bright blue")
Part29.CanCollide = false
Part29.brickColor = BrickColor.new("Bright blue")
Part29.FormFactor = Enum.FormFactor.Symmetric
Part29.formFactor = Enum.FormFactor.Symmetric
Part30.Name = "Right Leg"
Part30.Parent = Model11
Part30.CFrame = CFrame.new(0.5, 1, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part30.Position = Vector3.new(0.5, 1, 0.19525933265686035)
Part30.Color = Color3.new(0.0509804, 0.411765, 0.67451)
Part30.Size = Vector3.new(1, 2, 1)
Part30.BottomSurface = Enum.SurfaceType.Smooth
Part30.BrickColor = BrickColor.new("Bright blue")
Part30.CanCollide = false
Part30.brickColor = BrickColor.new("Bright blue")
Part30.FormFactor = Enum.FormFactor.Symmetric
Part30.formFactor = Enum.FormFactor.Symmetric
Humanoid31.Parent = Model11
Humanoid31.LeftLeg = Part29
Humanoid31.RightLeg = Part30
Humanoid31.Torso = Part32
Humanoid31.DisplayName = "skidded Dummy"
Part32.Name = "HumanoidRootPart"
Part32.Parent = Model11
Part32.CFrame = CFrame.new(0, 3, 0.195259333, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part32.Position = Vector3.new(0, 3, 0.19525933265686035)
Part32.Transparency = 1
Part32.Size = Vector3.new(2, 2, 1)
Part32.BottomSurface = Enum.SurfaceType.Smooth
Part32.CanCollide = false
Part32.LeftParamA = 0
Part32.LeftParamB = 0
Part32.RightParamA = 0
Part32.RightParamB = 0
Part32.TopSurface = Enum.SurfaceType.Smooth
Part32.FormFactor = Enum.FormFactor.Symmetric
Part32.formFactor = Enum.FormFactor.Symmetric
Motor6D33.Name = "RootJoint"
Motor6D33.Parent = Part32
Motor6D33.MaxVelocity = 0.10000000149011612
Motor6D33.C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D33.C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
Motor6D33.Part0 = Part32
Motor6D33.Part1 = Part20
Motor6D33.part1 = Part20
BodyColors34.Parent = Model11
BodyColors34.HeadColor = BrickColor.new("Light orange")
BodyColors34.HeadColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors34.LeftArmColor = BrickColor.new("Light orange")
BodyColors34.LeftArmColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors34.LeftLegColor = BrickColor.new("Light orange")
BodyColors34.LeftLegColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors34.RightArmColor = BrickColor.new("Light orange")
BodyColors34.RightArmColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors34.RightLegColor = BrickColor.new("Light orange")
BodyColors34.RightLegColor3 = Color3.new(0.917647, 0.721569, 0.572549)
BodyColors34.TorsoColor = BrickColor.new("Light orange")
BodyColors34.TorsoColor3 = Color3.new(0.917647, 0.721569, 0.572549)
Shirt35.Name = "Shirt"
Shirt35.Parent = Model11
Shirt35.ShirtTemplate = "http://www.roblox.com/asset/?id=13968074638"
Pants36.Name = "Pants"
Pants36.Parent = Model11
Pants36.PantsTemplate = "http://www.roblox.com/asset/?id=6838626514"
Accessory37.Name = "FluffyEars"
Accessory37.Parent = Model11
Accessory37.AttachmentForward = Vector3.new(-3.029981271446139e-15, 4.1444258024012927e-16, -1)
Accessory37.AttachmentPoint = CFrame.new(-0.000275611877, -0.283230782, 0.0902843475, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Accessory37.AttachmentPos = Vector3.new(-0.00027561187744140625, -0.2832307815551758, 0.09028434753417969)
Accessory37.AttachmentRight = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
Accessory37.AttachmentUp = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
Part38.Name = "Handle"
Part38.Parent = Accessory37
Part38.CFrame = CFrame.new(0.000275609636, 5.38323069, 0.104974985, 1, -7.87137555e-09, -3.02998127e-15, 7.87137555e-09, 1, 4.14442554e-16, 3.02998127e-15, -4.1444258e-16, 1)
Part38.Position = Vector3.new(0.0002756096364464611, 5.383230686187744, 0.10497498512268066)
Part38.Size = Vector3.new(1, 1, 1)
Part38.BottomSurface = Enum.SurfaceType.Smooth
Part38.CanCollide = false
Part38.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh39.Name = "SpecialMesh"
SpecialMesh39.Parent = Part38
SpecialMesh39.MeshId = "rbxassetid://5437810334"
SpecialMesh39.Scale = Vector3.new(1.0499999523162842, 1.0499999523162842, 1.0499999523162842)
SpecialMesh39.TextureId = "http://www.roblox.com/asset/?id=5458032339"
SpecialMesh39.MeshType = Enum.MeshType.FileMesh
StringValue40.Name = "AvatarPartScaleType"
StringValue40.Parent = Part38
StringValue40.Value = "Classic"
Weld41.Name = "AccessoryWeld"
Weld41.Parent = Part38
Weld41.C0 = CFrame.new(-0.000275611877, -0.283230782, 0.0902843475, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Weld41.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld41.Part0 = Part38
Weld41.Part1 = Part12
Weld41.part1 = Part12
Accessory42.Name = "orange halo"
Accessory42.Parent = Model11
Accessory42.AttachmentForward = Vector3.new(-8.742277657347586e-08, 4.1444258024012927e-16, 1)
Accessory42.AttachmentPoint = CFrame.new(-0.000335693359, -0.665999889, -2.91038305e-11, -1, -7.87137555e-09, 8.74227766e-08, -7.87137555e-09, 1, -4.1444258e-16, -8.74227766e-08, -1.10258003e-15, -1)
Accessory42.AttachmentPos = Vector3.new(-0.000335693359375, -0.6659998893737793, -2.9103830456733704e-11)
Accessory42.AttachmentRight = Vector3.new(-1, -7.871375551360416e-09, -8.742277657347586e-08)
Accessory42.AttachmentUp = Vector3.new(-7.871375551360416e-09, 1, -1.1025800345838442e-15)
Part43.Name = "Handle"
Part43.Parent = Accessory42
Part43.CFrame = CFrame.new(-0.000335698598, 5.76599979, 0.195259333, -1, -7.87137555e-09, -8.74227766e-08, -7.87137555e-09, 1, -1.10258003e-15, 8.74227766e-08, -4.14442527e-16, -1)
Part43.Orientation = Vector3.new(0, 180, 0)
Part43.Position = Vector3.new(-0.0003356985980644822, 5.765999794006348, 0.19525933265686035)
Part43.Rotation = Vector3.new(180, 0, 180)
Part43.Size = Vector3.new(1, 1, 1)
Part43.BottomSurface = Enum.SurfaceType.Smooth
Part43.CanCollide = false
Part43.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh44.Name = "SpecialMesh"
SpecialMesh44.Parent = Part43
SpecialMesh44.MeshId = "rbxassetid://13695352623"
SpecialMesh44.TextureId = "rbxassetid://13695352666"
SpecialMesh44.MeshType = Enum.MeshType.FileMesh
StringValue45.Name = "AvatarPartScaleType"
StringValue45.Parent = Part43
StringValue45.Value = "Classic"
Weld46.Name = "AccessoryWeld"
Weld46.Parent = Part43
Weld46.C0 = CFrame.new(-0.000335693359, -0.665999889, -2.91038305e-11, -1, -7.87137555e-09, 8.74227766e-08, -7.87137555e-09, 1, -4.14442527e-16, -8.74227766e-08, -1.10258003e-15, -1)
Weld46.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld46.Part0 = Part43
Weld46.Part1 = Part12
Weld46.part1 = Part12
Accessory47.Name = "MessyHairstyleAccessory"
Accessory47.Parent = Model11
Accessory47.AttachmentForward = Vector3.new(-3.029981271446139e-15, 4.1444258024012927e-16, -1)
Accessory47.AttachmentPoint = CFrame.new(-0.0430011749, 0.282998562, -0.0699996948, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Accessory47.AttachmentPos = Vector3.new(-0.04300117492675781, 0.28299856185913086, -0.06999969482421875)
Accessory47.AttachmentRight = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
Accessory47.AttachmentUp = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
Part48.Name = "Handle"
Part48.Parent = Accessory47
Part48.CFrame = CFrame.new(0.0430011787, 4.81700134, 0.265259027, 1, -7.87137555e-09, -3.02998127e-15, 7.87137555e-09, 1, 4.14442554e-16, 3.02998127e-15, -4.1444258e-16, 1)
Part48.Position = Vector3.new(0.04300117865204811, 4.8170013427734375, 0.2652590274810791)
Part48.Size = Vector3.new(1, 1, 1)
Part48.BottomSurface = Enum.SurfaceType.Smooth
Part48.CanCollide = false
Part48.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh49.Name = "SpecialMesh"
SpecialMesh49.Parent = Part48
SpecialMesh49.MeshId = "rbxassetid://7259065617"
SpecialMesh49.TextureId = "http://www.roblox.com/asset/?id=7136653415"
SpecialMesh49.MeshType = Enum.MeshType.FileMesh
StringValue50.Name = "AvatarPartScaleType"
StringValue50.Parent = Part48
StringValue50.Value = "Classic"
Weld51.Name = "AccessoryWeld"
Weld51.Parent = Part48
Weld51.C0 = CFrame.new(-0.0430011749, 0.282998562, -0.0699996948, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Weld51.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld51.Part0 = Part48
Weld51.Part1 = Part12
Weld51.part1 = Part12
Accessory52.Name = "MeshPartAccessory"
Accessory52.Parent = Model11
Accessory52.AttachmentForward = Vector3.new(4.371138828673793e-08, 1.2246468525851679e-16, 1)
Accessory52.AttachmentPoint = CFrame.new(-0.000183105469, 1.26567984, 0.222732544, -1, -1.22464685e-16, -4.37113883e-08, -1.22464685e-16, 1, -1.22464685e-16, 4.37113883e-08, -1.22464685e-16, -1)
Accessory52.AttachmentPos = Vector3.new(-0.00018310546875, 1.2656798362731934, 0.2227325439453125)
Accessory52.AttachmentRight = Vector3.new(-1, -1.2246468525851679e-16, 4.371138828673793e-08)
Accessory52.AttachmentUp = Vector3.new(-1.2246468525851679e-16, 1, -1.2246468525851679e-16)
Part53.Name = "Handle"
Part53.Parent = Accessory52
Part53.CFrame = CFrame.new(-0.000183115204, 3.83432007, 0.417991877, -1, -1.22464685e-16, 4.37113883e-08, -1.22464685e-16, 1, -1.22464685e-16, -4.37113883e-08, -1.22464685e-16, -1)
Part53.Orientation = Vector3.new(0, 180, 0)
Part53.Position = Vector3.new(-0.00018311520398128778, 3.834320068359375, 0.41799187660217285)
Part53.Rotation = Vector3.new(180, 0, 180)
Part53.Size = Vector3.new(1, 1, 1)
Part53.BottomSurface = Enum.SurfaceType.Smooth
Part53.CanCollide = false
Part53.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh54.Name = "SpecialMesh"
SpecialMesh54.Parent = Part53
SpecialMesh54.MeshId = "rbxassetid://13354879059"
SpecialMesh54.TextureId = "rbxassetid://13231419415"
SpecialMesh54.MeshType = Enum.MeshType.FileMesh
StringValue55.Name = "AvatarPartScaleType"
StringValue55.Parent = Part53
StringValue55.Value = "Classic"
Weld56.Name = "AccessoryWeld"
Weld56.Parent = Part53
Weld56.C0 = CFrame.new(-0.000183105469, 1.26567984, 0.222732544, -1, -1.22464685e-16, -4.37113883e-08, -1.22464685e-16, 1, -1.22464685e-16, 4.37113883e-08, -1.22464685e-16, -1)
Weld56.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld56.Part0 = Part53
Weld56.Part1 = Part12
Weld56.part1 = Part12
Accessory57.Name = "Spiky White Anime Hair"
Accessory57.Parent = Model11
Accessory57.AttachmentForward = Vector3.new(8.742277657347586e-08, 4.1444258024012927e-16, 1)
Accessory57.AttachmentPoint = CFrame.new(-0.00323867798, 0.193525791, 0.186584473, -1, -7.87137555e-09, -8.74227766e-08, -7.87137555e-09, 1, -4.1444258e-16, 8.74227766e-08, 2.73694954e-16, -1)
Accessory57.AttachmentPos = Vector3.new(-0.003238677978515625, 0.1935257911682129, 0.18658447265625)
Accessory57.AttachmentRight = Vector3.new(-1, -7.871375551360416e-09, 8.742277657347586e-08)
Accessory57.AttachmentUp = Vector3.new(-7.871375551360416e-09, 1, 2.7369495351292443e-16)
Part58.Name = "Handle"
Part58.Parent = Accessory57
Part58.CFrame = CFrame.new(-0.00323869265, 4.90647411, 0.381843805, -1, -7.87137555e-09, 8.74227766e-08, -7.87137555e-09, 1, 2.73694954e-16, -8.74227766e-08, -4.14442554e-16, -1)
Part58.Orientation = Vector3.new(0, 180, 0)
Part58.Position = Vector3.new(-0.003238692646846175, 4.9064741134643555, 0.38184380531311035)
Part58.Rotation = Vector3.new(180, 0, 180)
Part58.Size = Vector3.new(1, 1, 1)
Part58.BottomSurface = Enum.SurfaceType.Smooth
Part58.CanCollide = false
Part58.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh59.Name = "SpecialMesh"
SpecialMesh59.Parent = Part58
SpecialMesh59.MeshId = "rbxassetid://7805064587"
SpecialMesh59.TextureId = "rbxassetid://7805064828"
SpecialMesh59.MeshType = Enum.MeshType.FileMesh
StringValue60.Name = "AvatarPartScaleType"
StringValue60.Parent = Part58
StringValue60.Value = "Classic"
Weld61.Name = "AccessoryWeld"
Weld61.Parent = Part58
Weld61.C0 = CFrame.new(-0.00323867798, 0.193525791, 0.186584473, -1, -7.87137555e-09, -8.74227766e-08, -7.87137555e-09, 1, -4.14442554e-16, 8.74227766e-08, 2.73694954e-16, -1)
Weld61.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld61.Part0 = Part58
Weld61.Part1 = Part12
Weld61.part1 = Part12
Accessory62.Name = "Neon Red Fangs"
Accessory62.Parent = Model11
Accessory62.AttachmentForward = Vector3.new(0.017449993640184402, -1.614999356469582e-09, 0.9998477697372437)
Accessory62.AttachmentPoint = CFrame.new(-0.00541687012, 0.330435038, 0.00403594971, -0.999847651, 0.00060899189, -0.0174499936, 0.000609084615, 0.999999881, 1.61499936e-09, 0.0174499881, -1.06269054e-05, -0.99984777)
Accessory62.AttachmentPos = Vector3.new(-0.0054168701171875, 0.33043503761291504, 0.00403594970703125)
Accessory62.AttachmentRight = Vector3.new(-0.9998476505279541, 0.0006090846145525575, 0.017449988052248955)
Accessory62.AttachmentUp = Vector3.new(0.0006089918897487223, 0.9999998807907104, -0.000010626905350363813)
Part63.Name = "Handle"
Part63.Parent = Accessory62
Part63.CFrame = CFrame.new(-0.00568773504, 4.16956854, -0.40079987, -0.999847651, 0.000609084615, 0.0174499881, 0.00060899189, 0.999999881, -1.06269054e-05, -0.0174499918, 1.6143531e-09, -0.999847889)
Part63.Orientation = Vector3.new(0.0010000000474974513, 179, 0.03500000014901161)
Part63.Position = Vector3.new(-0.005687735043466091, 4.1695685386657715, -0.40079987049102783)
Part63.Rotation = Vector3.new(179.99899291992188, 1, -179.96499633789062)
Part63.Size = Vector3.new(1, 1, 1)
Part63.BottomSurface = Enum.SurfaceType.Smooth
Part63.CanCollide = false
Part63.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh64.Name = "SpecialMesh"
SpecialMesh64.Parent = Part63
SpecialMesh64.MeshId = "rbxassetid://7106540141"
SpecialMesh64.TextureId = "rbxassetid://7106567986"
SpecialMesh64.MeshType = Enum.MeshType.FileMesh
StringValue65.Name = "AvatarPartScaleType"
StringValue65.Parent = Part63
StringValue65.Value = "Classic"
Weld66.Name = "AccessoryWeld"
Weld66.Parent = Part63
Weld66.C0 = CFrame.new(-0.00541687012, 0.330435038, 0.00403594971, -0.999847651, 0.00060899189, -0.0174499918, 0.000609084615, 0.999999881, 1.6143531e-09, 0.0174499881, -1.06269054e-05, -0.999847889)
Weld66.C1 = CFrame.new(0, 0, -0.600000024, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld66.Part0 = Part63
Weld66.Part1 = Part12
Weld66.part1 = Part12
Accessory67.Name = "Blush Sticker II"
Accessory67.Parent = Model11
Accessory67.AttachmentForward = Vector3.new(-3.029981271446139e-15, 4.1444258024012927e-16, -1)
Accessory67.AttachmentPoint = CFrame.new(-0.00929838419, 0.0527129173, -0.0214370489, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Accessory67.AttachmentPos = Vector3.new(-0.009298384189605713, 0.05271291732788086, -0.02143704891204834)
Accessory67.AttachmentRight = Vector3.new(1, -7.871375551360416e-09, -3.029981271446139e-15)
Accessory67.AttachmentUp = Vector3.new(7.871375551360416e-09, 1, 4.1444255377034967e-16)
Part68.Name = "Handle"
Part68.Parent = Accessory67
Part68.CFrame = CFrame.new(0.00929838419, 4.44728708, -0.383303642, 1, -7.87137555e-09, -3.02998127e-15, 7.87137555e-09, 1, 4.14442554e-16, 3.02998127e-15, -4.1444258e-16, 1)
Part68.Position = Vector3.new(0.009298384189605713, 4.447287082672119, -0.3833036422729492)
Part68.Size = Vector3.new(1, 1, 1)
Part68.BottomSurface = Enum.SurfaceType.Smooth
Part68.CanCollide = false
Part68.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh69.Name = "SpecialMesh"
SpecialMesh69.Parent = Part68
SpecialMesh69.MeshId = "rbxassetid://10744416890"
SpecialMesh69.TextureId = "rbxassetid://10744417104"
SpecialMesh69.MeshType = Enum.MeshType.FileMesh
StringValue70.Name = "AvatarPartScaleType"
StringValue70.Parent = Part68
StringValue70.Value = "Classic"
Weld71.Name = "AccessoryWeld"
Weld71.Parent = Part68
Weld71.C0 = CFrame.new(-0.00929838419, 0.0527129173, -0.0214370489, 1, 7.87137555e-09, 3.02998127e-15, -7.87137555e-09, 1, -4.1444258e-16, -3.02998127e-15, 4.14442554e-16, 1)
Weld71.C1 = CFrame.new(0, 0, -0.600000024, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld71.Part0 = Part68
Weld71.Part1 = Part12
Weld71.part1 = Part12
Accessory72.Name = "wAccessory"
Accessory72.Parent = Model11
Accessory72.AttachmentForward = Vector3.new(1.5099580252808664e-07, 4.1444258024012927e-16, 1)
Accessory72.AttachmentPoint = CFrame.new(5.04010723e-06, 0.277278095, -0.613251209, -1, -7.87137555e-09, -1.50995803e-07, -7.87137555e-09, 1, -4.1444258e-16, 1.50995803e-07, 7.74102246e-16, -1)
Accessory72.AttachmentPos = Vector3.new(0.000005040107225795509, 0.2772780954837799, -0.6132512092590332)
Accessory72.AttachmentRight = Vector3.new(-1, -7.871375551360416e-09, 1.5099580252808664e-07)
Accessory72.AttachmentUp = Vector3.new(-7.871375551360416e-09, 1, 7.741022458254026e-16)
Part73.Name = "Handle"
Part73.Parent = Accessory72
Part73.CFrame = CFrame.new(5.1348884e-06, 4.22272205, -0.417991877, -1, -7.87137555e-09, 1.50995803e-07, -7.87137555e-09, 1, 7.74102246e-16, -1.50995803e-07, -4.14442421e-16, -1)
Part73.Orientation = Vector3.new(0, 180, 0)
Part73.Position = Vector3.new(0.0000051348883971513715, 4.222722053527832, -0.41799187660217285)
Part73.Rotation = Vector3.new(180, 0, 180)
Part73.Size = Vector3.new(1, 1, 1)
Part73.BottomSurface = Enum.SurfaceType.Smooth
Part73.CanCollide = false
Part73.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh74.Name = "SpecialMesh"
SpecialMesh74.Parent = Part73
SpecialMesh74.MeshId = "rbxassetid://12679749359"
SpecialMesh74.TextureId = "rbxassetid://12679749443"
SpecialMesh74.MeshType = Enum.MeshType.FileMesh
StringValue75.Name = "AvatarPartScaleType"
StringValue75.Parent = Part73
StringValue75.Value = "Classic"
Weld76.Name = "AccessoryWeld"
Weld76.Parent = Part73
Weld76.C0 = CFrame.new(5.04010723e-06, 0.277278095, -0.613251209, -1, -7.87137555e-09, -1.50995803e-07, -7.87137555e-09, 1, -4.14442421e-16, 1.50995803e-07, 7.74102246e-16, -1)
Weld76.Part0 = Part73
Weld76.Part1 = Part12
Weld76.part1 = Part12
Accessory77.Name = "01_f1EAccessory"
Accessory77.Parent = Model11
Accessory77.AttachmentForward = Vector3.new(-1, 4.1444258024012927e-16, -1.3113415775478643e-07)
Accessory77.AttachmentPoint = CFrame.new(0.556358337, -0.2349585, -0.00141143799, 1.31134158e-07, 1.44664884e-15, 1, -7.87137555e-09, 1, -4.1444258e-16, -1, -7.87137555e-09, 1.31134158e-07)
Accessory77.AttachmentPos = Vector3.new(0.5563583374023438, -0.2349584996700287, -0.00141143798828125)
Accessory77.AttachmentRight = Vector3.new(1.3113415775478643e-07, -7.871375551360416e-09, -1)
Accessory77.AttachmentUp = Vector3.new(1.4466488411650404e-15, 1, -7.871375551360416e-09)
Part78.Name = "Handle"
Part78.Parent = Accessory77
Part78.CFrame = CFrame.new(-0.00141151284, 4.73495865, -0.361099005, 1.31134158e-07, -7.87137555e-09, -1, 1.44664884e-15, 1, -7.87137555e-09, 1, -4.14442633e-16, 1.31134158e-07)
Part78.Orientation = Vector3.new(0, -90, 0)
Part78.Position = Vector3.new(-0.0014115128433331847, 4.734958648681641, -0.3610990047454834)
Part78.Rotation = Vector3.new(0, -90, 0)
Part78.Size = Vector3.new(1, 1, 1)
Part78.BottomSurface = Enum.SurfaceType.Smooth
Part78.CanCollide = false
Part78.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh79.Name = "SpecialMesh"
SpecialMesh79.Parent = Part78
SpecialMesh79.MeshId = "rbxassetid://13415745755"
SpecialMesh79.TextureId = "rbxassetid://11043140910"
SpecialMesh79.MeshType = Enum.MeshType.FileMesh
StringValue80.Name = "AvatarPartScaleType"
StringValue80.Parent = Part78
StringValue80.Value = "Classic"
Weld81.Name = "AccessoryWeld"
Weld81.Parent = Part78
Weld81.C0 = CFrame.new(0.556358337, -0.2349585, -0.00141143799, 1.31134158e-07, 1.44664884e-15, 1, -7.87137555e-09, 1, -4.14442633e-16, -1, -7.87137555e-09, 1.31134158e-07)
Weld81.Part0 = Part78
Weld81.Part1 = Part12
Weld81.part1 = Part12
Accessory82.Name = "Meshes/collarfixedAccessory"
Accessory82.Parent = Model11
Accessory82.AttachmentPoint = CFrame.new(-0.00111954508, 0.191233397, 0.0463389568, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Accessory82.AttachmentPos = Vector3.new(-0.0011195450788363814, 0.19123339653015137, 0.04633895680308342)
Part83.Name = "Handle"
Part83.Parent = Accessory82
Part83.CFrame = CFrame.new(0.00111954508, 3.8087666, 0.148920372, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part83.Position = Vector3.new(0.0011195450788363814, 3.8087666034698486, 0.14892037212848663)
Part83.Size = Vector3.new(1, 1, 1)
Part83.BottomSurface = Enum.SurfaceType.Smooth
Part83.CanCollide = false
Part83.TopSurface = Enum.SurfaceType.Smooth
SpecialMesh84.Name = "SpecialMesh"
SpecialMesh84.Parent = Part83
SpecialMesh84.MeshId = "rbxassetid://7224492784"
SpecialMesh84.TextureId = "rbxassetid://7224497897"
SpecialMesh84.MeshType = Enum.MeshType.FileMesh
StringValue85.Name = "AvatarPartScaleType"
StringValue85.Parent = Part83
StringValue85.Value = "Classic"
Weld86.Name = "AccessoryWeld"
Weld86.Parent = Part83
Weld86.C0 = CFrame.new(-0.00111954508, 0.191233397, 0.0463389568, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld86.C1 = CFrame.new(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Weld86.Part0 = Part83
Weld86.Part1 = Part20
Weld86.part1 = Part20
Folder87.Name = "animations"
Folder87.Parent = Model0
Animation88.Name = "punch1"
Animation88.Parent = Folder87
Animation88.AnimationId = "rbxassetid://18653153498"
Animation89.Name = "punch2"
Animation89.Parent = Folder87
Animation89.AnimationId = "rbxassetid://18653159709"
Animation90.Name = "punch3"
Animation90.Parent = Folder87
Animation90.AnimationId = "rbxassetid://18653165160"
Animation91.Name = "damaged"
Animation91.Parent = Folder87
Animation91.AnimationId = "rbxassetid://18628111547"
Animation92.Name = "uppercut"
Animation92.Parent = Folder87
Animation92.AnimationId = "rbxassetid://18637519267"
Animation93.Name = "downslam"
Animation93.Parent = Folder87
Animation93.AnimationId = "rbxassetid://18654336853"
Animation94.Name = "punch4"
Animation94.Parent = Folder87
Animation94.AnimationId = "rbxassetid://18653153498"
for i,v in pairs(mas:GetChildren()) do
	v.Parent = game:GetService("ReplicatedStorage")
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
