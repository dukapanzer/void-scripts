local Assets = LoadAssets(110160236417085)
local cursor = Assets:Get("Cursor")
cursor.Anchored = true
cursor.Parent = script

local plr = owner
local char = plr.Character
local remote = Instance.new("RemoteEvent")
remote.Parent = char
cursor.Parent = char
local image_label = cursor:WaitForChild("BillboardGui"):WaitForChild("ImageLabel")

local base_offset = Vector3.new(0.9, -0.9, 0)

-- Function to check if a part or model is restricted from dragging
local function isRestrictedPart(part)
    return part and part:IsA("BasePart") and part.Name == "Base" and part.Parent == game.Workspace
end

local function isRestrictedModel(model)
    return model and model:IsA("Model") and model.Name == "Map" and model.Parent == game.Workspace
end

local function handleRemoteEvent(player, mouse_position, mouse_held, camera_cframe, model_to_drag, right_mouse_held)
    local success, errorMessage = pcall(function()
        local distance = (mouse_position - camera_cframe.Position).Magnitude

        local adjusted_offset = base_offset * (distance / 50)

        local camera_right_vector = camera_cframe.RightVector
        local camera_up_vector = camera_cframe.UpVector

        local final_offset = (camera_right_vector * adjusted_offset.X) + (camera_up_vector * adjusted_offset.Y)

        cursor.CFrame = CFrame.new(mouse_position + final_offset)

        if mouse_held or right_mouse_held then
            if right_mouse_held then
                image_label.ImageColor3 = Color3.new(0, 1, 0)  -- Green color for right-click
            else
                image_label.ImageColor3 = Color3.new(1, 0, 0)  -- Red color for left-click
            end
            if model_to_drag then
                for _, part in ipairs(model_to_drag:GetDescendants()) do
                    if part:IsA("BasePart") and not isRestrictedPart(part) then
                        part.Position = mouse_position
                    end
                end
            end
        else
            image_label.ImageColor3 = Color3.new(1, 1, 1)  -- White color when not holding
        end
    end)

    if not success then
        warn("Error handling remote event: " .. errorMessage)
    end
end

remote.OnServerEvent:Connect(handleRemoteEvent)

NLS([[
local plr = owner
local mouse = plr:GetMouse()
local char = plr.Character
local cursor = char:WaitForChild("Cursor")
local remote = char:WaitForChild("RemoteEvent")
local hb = game:GetService("RunService").Heartbeat
local cam = game.Workspace.CurrentCamera

local mouse_held = false
local right_mouse_held = false
local dragging_model = nil

-- Function to check if a part or model is restricted from dragging
local function isRestrictedPart(part)
    if part:IsA("BasePart") then
        -- Check if the part is the restricted part
        if part.Name == "Base" and part.Parent == game.Workspace then
            return true
        end
    end
    return false
end

local function isRestrictedModel(model)
    if model:IsA("Model") then
        -- Check if the model is the restricted model
        if model.Name == "Map" and model.Parent == game.Workspace then
            return true
        end
    end
    return false
end

-- Update the cursor position on the server
local function updateCursor()
    local success, errorMessage = pcall(function()
        local mouse_position = mouse.Hit.Position
        remote:FireServer(mouse_position, mouse_held, cam.CFrame, dragging_model, right_mouse_held)
    end)

    if not success then
        warn("Error updating cursor: " .. errorMessage)
    end
end

hb:Connect(updateCursor)

-- Handle left mouse button down
mouse.Button1Down:Connect(function()
    local success, errorMessage = pcall(function()
        if mouse.Target then
            local target = mouse.Target
            if target:IsA("BasePart") and not isRestrictedPart(target) then
                dragging_model = target.Parent  -- Assume that the parent is the model
                if dragging_model:IsA("Model") and not isRestrictedModel(dragging_model) then
                    mouse.TargetFilter = dragging_model
                    mouse_held = true
                else
                    dragging_model = nil  -- Reset if the model is restricted
                end
            else
                dragging_model = nil  -- Reset if the part is restricted
            end
        end
        remote:FireServer(mouse.Hit.Position, mouse_held, cam.CFrame, dragging_model, right_mouse_held)
    end)

    if not success then
        warn("Error handling left mouse button down: " .. errorMessage)
    end
end)

-- Handle left mouse button up
mouse.Button1Up:Connect(function()
    local success, errorMessage = pcall(function()
        if dragging_model then
            mouse.TargetFilter = nil  -- Reset target filter
            dragging_model = nil
        end
        mouse_held = false
        remote:FireServer(mouse.Hit.Position, mouse_held, cam.CFrame, dragging_model, right_mouse_held)
    end)

    if not success then
        warn("Error handling left mouse button up: " .. errorMessage)
    end
end)

-- Handle right mouse button down
mouse.Button2Down:Connect(function()
    local success, errorMessage = pcall(function()
        right_mouse_held = true
        remote:FireServer(mouse.Hit.Position, mouse_held, cam.CFrame, dragging_model, right_mouse_held)
    end)

    if not success then
        warn("Error handling right mouse button down: " .. errorMessage)
    end
end)

-- Handle right mouse button up
mouse.Button2Up:Connect(function()
    local success, errorMessage = pcall(function()
        right_mouse_held = false
        remote:FireServer(mouse.Hit.Position, mouse_held, cam.CFrame, dragging_model, right_mouse_held)
    end)

    if not success then
        warn("Error handling right mouse button up: " .. errorMessage)
    end
end)

]])
