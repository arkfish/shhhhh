local function check()
	for i, v in pairs(game.Players:GetPlayers()) do
		if v:IsA("Player") then
			local chr = v.Character

			if chr.HumanoidRootPart:FindFirstChild("BillboardGui") then
				v.BillboardGui:Destroy()
			end

			local gui = Instance.new("BillboardGui")
			gui.Size = UDim2.new(0, 50, 0, 50)
			gui.Parent = chr.HumanoidRootPart
			gui.Adornee = gui.Parent
			gui.AlwaysOnTop = true

			local frame = Instance.new("Frame")
			frame.Parent = gui
			frame.Size = UDim2.new(1, 0, 1, 0)

			local text = Instance.new("TextLabel")
			text.Parent = gui
			text.Size = UDim2.new(1, 0, 0.3, 0)
			text.Text = v.DisplayName.." (@"..v.Name..")"
			text.TextScaled = true
			text.BackgroundTransparency = 1

			local magntext = Instance.new("TextLabel")
			magntext.Parent = gui
			magntext.Size = UDim2.new(1, 0, 0.3, 0)
			magntext.Position = UDim2.new(0, 0, 0.3, 0)
			magntext.TextScaled = true
			magntext.BackgroundTransparency = 1
			magntext.TextStrokeTransparency = 0

			--== flee the facility ====================================================--]
			pcall(function()
				if v.TempPlayerStatsModule.IsBeast.Value then
					frame.BackgroundColor3 = Color3.new(1, 0, 0)-- red   (rgb)
				else
					frame.BackgroundColor3 = Color3.new(0, 1, 0)-- green (rgb)
				end
			end)
			--=========================================================================--]

			local lplr = game.Players.LocalPlayer
			local lchr = lplr.Character

			local grey = BrickColor.new("Medium stone grey")
			local green = {200, BrickColor.new("Lime green")}
			local yellow = {100, BrickColor.new("Gold")}
			local red = {50, BrickColor.new("Persimmon")}
			
			local ts = game:GetService("TweenService")
			local info = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

			coroutine.wrap(function()
				while true do
					local magn = math.round((chr.HumanoidRootPart.Position - lchr.HumanoidRootPart.Position).Magnitude)
					
                    if magn > green[1] then -- grey

						ts:Create(magntext, info, {TextColor3 = grey.Color}):Play()

					elseif magn <= green[1] and magn > yellow[1] then -- green

						ts:Create(magntext, info, {TextColor3 = green[2].Color}):Play()

					elseif magn <= yellow[1] and magn > red[1] then -- yellow

						ts:Create(magntext, info, {TextColor3 = yellow[2].Color}):Play()

					elseif magn <= red[1] then -- red

						ts:Create(magntext, info, {TextColor3 = red[2].Color}):Play()

					end

					magntext.Text = tostring(magn)
					wait()
				end
			end)()
		end
	end
end


game:GetService("UserInputService").InputBegan:Connect(function(i, gpe)
    if not gpe and i.KeyCode.Name == "RightBracket" then
        check()
    end
end)
