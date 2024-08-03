local Assets = LoadAssets(18784655878) -- replace asset id
table.foreach(Assets:Get("USC"):GetChildren(), function(i,v) -- replace foldername
    local lol = v:Clone()
    lol.Parent = game:GetService("ReplicatedStorage")
end)
