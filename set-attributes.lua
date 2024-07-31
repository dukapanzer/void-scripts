for i,v in pairs(game:GetService("Players"):GetChildren()) do
	if v:IsA("Player") then
		v.CharacterAdded:connect(function(char)
			char:SetAttribute("combo", 1)
			char:SetAttribute("punching", false)
		end)
	end
end
