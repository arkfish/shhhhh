local plr = game.Players.LocalPlayer
local chr = plr.Character
local hrp = chr.HumanoidRootPart

local collected = {}
function trans(v)
    for i, v in pairs(chr:GetDescendants()) do
        pcall(function() if v.Name ~= "HumanoidRootPart" then
            v.Transparency = v
        end end)
    end
end

trans(1)

-- collect all chests
for i, chest in pairs(workspace.Chests:GetChildren()) do
    if not collected[chest.Name] and chest.Name ~= "Water Necklace" then
        collected[chest.Name] = true
        hrp.CFrame = chest.Giver.CFrame

        wait(1)
    end
end

trans(0)