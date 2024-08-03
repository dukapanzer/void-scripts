local Assets = LoadAssets(18784655878) -- replace asset id

for i,v in pairs(Assets:GetChildren()) do
    v.Parent = game:GetService("ReplicatedStorage")
end
