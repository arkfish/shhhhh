local plr = game.Players.LocalPlayer
local chr = plr.Character

function isfruity(v)
    return v.Name:match(" Fruity") and v:IsA("Tool") and v:FindFirstChild("DF_Tool_Client")
end

function loop()
    for i, v in pairs(workspace:GetDescendants()) do
        if isfruity(v) then
            v.Handle.CFrame = chr.HumanoidRootPart.CFrame
        end
    end
end

loop()

workspace.DescendantAdded:Connect(function(d)
    if isfruity(d) then loop() end
end)
