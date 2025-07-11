-- you can now my script :)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local versionnew = "update v6"

-- you can't do it
local Window = Fluent:CreateWindow({
	Title = "Kuncicoco hub | forsaken | " ..versionnew,
	SubTitle = "by 4x2x9x4x0 X",
	TabWidth = 160,
	Size = UDim2.fromOffset(500, 400),
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.K
})

local Tabs = {
	Main = Window:AddTab({ Title = "Main", Icon = "box" }),
	esp = Window:AddTab({ Title = "Highlights", Icon = "eye" }),
	misc = Window:AddTab({ Title = "Blatant", Icon = "hammer" }),
	aimbot = Window:AddTab({ Title = "Aimbot", Icon = "sword" }),
	shopguys = Window:AddTab({ Title = "Shopee", Icon = "shopping-bag" }),
	wedo = Window:AddTab({ Title = "WeBook", Icon = "book-open" }), -- soviet union.
	onesettings = Window:AddTab({ Title = "About", Icon = "shield-off" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }) -- missing value.
}

local Aura = game:FindFirstChild("Aura")
local kill = game:FindFirstChild("Kill-Aura")

warn("Welcome to kuncicoco hub forsaken!")

_G.Auraloopkill = true
_G.Aurakill = true

_G.buyall = nil
local buyskin = {
	"007n7";
	"Elilot";
	"did all"
}

-- it's Time one more left.
local Aurakill = true
_G.killall = nil

--[[executor name]]
local nameexecutor = "Unknown"
if nameexecutor then
	nameexecutor = getexecutorname()
end
local safeexecutor = "safe or not safe"
if getexecutorname() == "Xeno" and "jjsploit" and "Solara" and "Zorara" and "Luna" and "SubZero" then
	safeexecutor = "Unsafe"
else
	sefeexecutor = "Safe"
	return
end

--[[Player name]]

local Playername = game.Players.LocalPlayer.Name
local AgePlayer = game.Players.LocalPlayer.AccountAge

Tabs.Main:AddSection("Channels")

Tabs.Main:AddParagraph({
	Title = "You Executor: "..nameexecutor;
	Content = "This Executor is safe: "..safeexecutor;
})

Tabs.Main:AddParagraph({
	Title = "You Name: "..Playername;
	Content = "You Age: "..AgePlayer;
})

Tabs.Main:AddButton({
	Title = "Discord",
	Callback = function()
		setclipboard("https://discord.gg/fJre7UgV")
	end
})
-- protect the ui from script.Tabs.misc
Tabs.misc:AddSection("UI")

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Shop UI",
		Default = true,
		Callback = function(s)
			if s then
				game.Players.LocalPlayer.PlayerGui.MainUI.ShopScreen.Visible = true
			else
				game.Players.LocalPlayer.PlayerGui.MainUI.ShopScreen.Visible = false
			end
		end
	})

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Tabs UI",
		Default = true,
		Callback = function(s)
			if s then
				game.Players.LocalPlayer.PlayerGui.MainUI.Sidebar.Visible = true
			else
				game.Players.LocalPlayer.PlayerGui.MainUI.Sidebar.Visible = false
			end
		end
	})

-- script.Tabs.Highlight

local Toggle = Tabs.esp:AddToggle("MyToggle",
	{Title = "ESP Survivor",
		Default = false,
		Callback = function(s)
			local function applySurvivorHighlight(model)
				if model:IsA("Model") and model:FindFirstChild("Head") then
					local existingBillboard = model.Head:FindFirstChild("billboard")
					local existingHighlight = model:FindFirstChild("HiThere")

					if s then
						if not existingBillboard then
							local billboard = Instance.new("BillboardGui")
							billboard.Name = "billboard"
							billboard.Size = UDim2.new(0, 100, 0, 50)
							billboard.StudsOffset = Vector3.new(0, 2, 0)
							billboard.AlwaysOnTop = true
							billboard.Parent = model.Head

							age = Instance.new("TextLabel")
							age.Parent = billboard    
							age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							age.BackgroundTransparency = 1.000
							age.BorderColor3 = Color3.fromRGB(0, 0, 0)
							age.BorderSizePixel = 0
							age.Position = UDim2.new(0.459518611, 0, 0.153571427, 0)
							age.Size = UDim2.new(0, 96, 0, 29)
							age.Font = Enum.Font.FredokaOne
							age.Text = model.Name
							age.TextColor3 = Color3.fromRGB(255, 255, 255)
							age.TextSize = 18.000
						end

						if not existingHighlight then
							local highlight = Instance.new("Highlight")
							highlight.Name = "HiThere"
							highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							highlight.FillColor = Color3.fromRGB(255, 255, 255)
							highlight.Parent = model
						end
					else
						if existingBillboard then
							existingBillboard:Destroy()
						end
						if existingHighlight then
							existingHighlight:Destroy()
						end
					end
				end
			end

			for _, v in pairs(game.Workspace.Players.Survivors:GetChildren()) do
				applySurvivorHighlight(v)
			end

			game.Workspace.Players.Survivors.ChildAdded:Connect(function(child)
				applySurvivorHighlight(child)
			end)
		end
	})

local Toggle = Tabs.esp:AddToggle("MyToggle",
	{Title = "ESP Generator",
		Default = false,
		Callback = function(s)
			local function applyGeneratorHighlight(generator)
				if generator.Name == "Generator" then
					local existingHighlight = generator:FindFirstChild("GeneratorHighlight")
					local progress = generator:FindFirstChild("Progress")
					local existingBillboard = generator:FindFirstChild("billboard")

					if s then
						if not existingBillboard then
							local billboard = Instance.new("BillboardGui")
							billboard.Name = "billboard"
							billboard.Size = UDim2.new(0, 100, 0, 50)
							billboard.StudsOffset = Vector3.new(0, 2, 0)
							billboard.AlwaysOnTop = true
							billboard.Parent = generator

							age = Instance.new("TextLabel")
							age.Parent = billboard    
							age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							age.BackgroundTransparency = 1.000
							age.BorderColor3 = Color3.fromRGB(0, 0, 0)
							age.BorderSizePixel = 0
							age.Position = UDim2.new(0.459518611, 0, 0.153571427, 0)
							age.Size = UDim2.new(0, 96, 0, 29)
							age.Font = Enum.Font.FredokaOne
							age.Text = generator.Name
							age.TextColor3 = Color3.fromRGB(255, 255, 255)
							age.TextSize = 18.000

							local genhighlight = Instance.new("Highlight")
							genhighlight.Parent = generator
							genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							genhighlight.Name = "GeneratorHighlight"
							genhighlight.FillColor = Color3.fromRGB(255, 255, 255)
						end
					else
						if existingHighlight then
							existingHighlight:Destroy()
						end
						return
					end

					if progress then
						if progress.Value == 100 then
							local highlight = generator:FindFirstChild("GeneratorHighlight")
							if highlight then
								highlight:Destroy()
							end
							return
						end

						if existingBillboard then
							existingBillboard:Destroy()
						end

						progress:GetPropertyChangedSignal("Value"):Connect(function()
							if progress.Value == 100 then
								local highlight = generator:FindFirstChild("GeneratorHighlight")
								if highlight then
									highlight:Destroy()
								end
							elseif s and not generator:FindFirstChild("GeneratorHighlight") then
								local genhighlight = Instance.new("Highlight")
								genhighlight.Parent = generator
								genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								genhighlight.Name = "GeneratorHighlight"
							end
						end)
					end
				end
			end

			for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
				applyGeneratorHighlight(v)
			end

			game.Workspace.Map.Ingame.Map.ChildAdded:Connect(function(child)
				applyGeneratorHighlight(child)
			end)
		end
	})

local Toggle = Tabs.esp:AddToggle("MyToggle",
	{Title = "ESP Killers",
		Default = false,
		Callback = function(s)
			local function applyKillerHighlight(model)
				if model:IsA("Model") and model:FindFirstChild("Head") then
					local existingBillboard = model.Head:FindFirstChild("billboard")
					local existingHighlight = model:FindFirstChild("HiThere")

					if s then
						if not existingBillboard then
							local billboard = Instance.new("BillboardGui")
							billboard.Name = "billboard"
							billboard.Size = UDim2.new(0, 100, 0, 50)
							billboard.StudsOffset = Vector3.new(0, 2, 0)
							billboard.AlwaysOnTop = true
							billboard.Parent = model.Head

							age = Instance.new("TextLabel")
							age.Parent = billboard    
							age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							age.BackgroundTransparency = 1.000
							age.BorderColor3 = Color3.fromRGB(0, 0, 0)
							age.BorderSizePixel = 0
							age.Position = UDim2.new(0.459518611, 0, 0.153571427, 0)
							age.Size = UDim2.new(0, 96, 0, 29)
							age.Font = Enum.Font.FredokaOne
							age.Text = model.Name
							age.TextColor3 = Color3.fromRGB(255, 255, 255)
							age.TextSize = 18.000
						end

						if not existingHighlight then
							local highlight = Instance.new("Highlight")
							highlight.Name = "HiThere"
							highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							highlight.FillColor = Color3.fromRGB(255, 255, 255)
							highlight.Parent = model
						end
					else
						if existingBillboard then
							existingBillboard:Destroy()
						end
						if existingHighlight then
							existingHighlight:Destroy()
						end
					end
				end
			end

			for _, v in pairs(game.Workspace.Players.Killers:GetChildren()) do
				applyKillerHighlight(v)
			end

			game.Workspace.Players.Killers.ChildAdded:Connect(function(child)
				applyKillerHighlight(child)
			end)
		end
	})

local Toggle = Tabs.esp:AddToggle("MyToggle",
	{Title = "ESP Tools",
		Default = false,
		Callback = function(s)
			local function applyHighlight(tool)
				if s then
					local existinghighlight = tool:FindFirstChild("ToolHighlight")
					local existingBillboard = tool:FindFirstChild("billboard")
					if not existingBillboard then
						local billboard = Instance.new("BillboardGui")
						billboard.Name = "billboard"
						billboard.Size = UDim2.new(0, 100, 0, 50)
						billboard.StudsOffset = Vector3.new(0, 2, 0)
						billboard.AlwaysOnTop = true
						billboard.Parent = tool

						local toolhighlight = Instance.new("Highlight")
						toolhighlight.Name = "ToolHighlight"
						toolhighlight.Parent = tool
						toolhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						age = Instance.new("TextLabel")
						age.Parent = billboard    
						age.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						age.BackgroundTransparency = 1.000
						age.BorderColor3 = Color3.fromRGB(0, 0, 0)
						age.BorderSizePixel = 0
						age.Position = UDim2.new(0.459518611, 0, 0.153571427, 0)
						age.Size = UDim2.new(1,1,1,1)
						age.Font = Enum.Font.FredokaOne
						age.TextColor3 = Color3.fromRGB(255, 255, 255)
						age.TextSize = 18.000
						if tool.Name == "Medkit" then
							age.Text = "Medkit"
							toolhighlight.FillColor = Color3.fromRGB(255, 255, 255)
						elseif tool.Name == "BloxyCola" then
							age.Text = "BloxyCola"
							toolhighlight.FillColor = Color3.fromRGB(255, 255, 255)
						end
					end
				else
					local existinghighlight = tool:FindFirstChild("ToolHighlight")
					if existinghighlight then
						existinghighlight:Destroy()
					end

					local existingBillboard = tool:FindFirstChild("Billboard")
					if existingBillboard then
						existingBillboard:Destroy()
					end
				end
			end

			for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
				if v:IsA("Tool") then
					applyHighlight(v)
				end
			end

			game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					applyHighlight(child)
				end
			end)
		end
	})

-- script.Tabs.misc

local Section = Tabs.misc:AddSection("Stamina")

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Infinite stamina",
		Default = false,
		Callback = function(s)
			local stamscript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)

			local connection
			connection = game:GetService("RunService").Heartbeat:Connect(function()
				if not s then
					connection:Disconnect()
					stamscript.StaminaLossDisabled = nil
					return
				end
				stamscript.StaminaLossDisabled = function() 
				end
			end)
		end
	})

local Input = Tabs.misc:AddInput("Input", {
	Title = "stamina Sprinting",
	Default = "26",
	Placeholder = "Sprinter",
	Callback = function(Value)
		sure = Value
	end
})

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Sprint X",
		Default = false,
		Callback = function(s)
			if s then
				local stam = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
				local m = require(stam)
				m.SprintSpeed = sure
			else
				m.SprintSpeed = 26
			end
		end
	})

local Section = Tabs.misc:AddSection("Emote")

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Miss Out Quiet [New]",
		Default = false,
		Callback = function(s)
			if s then
				error("The WaitForChild Has Missing Name Value")
			else
				error("The WaitForChild Has Missing Name Value")
			end
		end
	})

local Toggle = Tabs.misc:AddToggle("MyToggle",
	{Title = "Hakari Dance",
		Default = false,
		Callback = function(s)
			local char = player.Character or player.CharacterAdded:Wait()
			local humanoid = char:WaitForChild("Humanoid")
			local rootPart = char:WaitForChild("HumanoidRootPart")

			if s then
				humanoid.PlatformStand = true
				humanoid.JumpPower = 0

				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
				bodyVelocity.Velocity = Vector3.zero
				bodyVelocity.Parent = rootPart

				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://138019937280193"
				local animationTrack = humanoid:LoadAnimation(animation)
				animationTrack:Play()

				local sound = Instance.new("Sound")
				sound.SoundId = "rbxassetid://109474987384441"
				sound.Parent = rootPart
				sound.Volume = 1
				sound.Looped = true
				sound:Play()

				local effect = game.ReplicatedStorage.Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
				effect.Name = "PlayerEmoteVFX"
				effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
				effect.WeldConstraint.Part0 = char.PrimaryPart
				effect.WeldConstraint.Part1 = effect
				effect.Parent = char
				effect.CanCollide = false

				local args = {
					[1] = "PlayEmote",
					[2] = "Animations",
					[3] = "HakariDance"
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))

				animationTrack.Stopped:Connect(function()
					humanoid.PlatformStand = false
					if bodyVelocity and bodyVelocity.Parent then
						bodyVelocity:Destroy()
					end
				end)
			else
				humanoid.PlatformStand = false
				humanoid.JumpPower = 0 

				local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
				if bodyVelocity then
					bodyVelocity:Destroy()
				end

				local sound = rootPart:FindFirstChildOfClass("Sound")
				if sound then
					sound:Stop()
					sound:Destroy()
				end

				local effect = char:FindFirstChild("PlayerEmoteVFX")
				if effect then
					effect:Destroy()
				end

				for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
					if track.Animation.AnimationId == "rbxassetid://138019937280193" then
						track:Stop()
					end
				end
			end
		end
	})

local Section = Tabs.misc:AddSection("Generator")

local Input = Tabs.misc:AddInput("Input", {
	Title = "Auto Generator",
	Default = "2.5",
	Placeholder = "",
	Callback = function(Value)
		unknown = Value
	end
})

local Button = Tabs.misc:AddButton({
	Title = "Instance Generator",
	Callback = function()
		for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
			if v.Name == "Generator" then
				warn("there was generator!")
			else
				warn("there not generator")
			end
		end
	end
})

local Button = Tabs.misc:AddButton({
	Title = "Fix Generator",
	Callback = function()
		local debounce = {}

		while true do
			task.wait(unknown)
			for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
				if v.Name == "Generator" then

					if not debounce[v] then
						debounce[v] = true
						v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
						task.delay(delay, function() debounce[v] = nil end)
					end
				end
			end
		end
	end
})

-- script.Tabs.aimbot

--[[the shop must set be fisrt!]]

local Section = Tabs.aimbot:AddSection("Shedletsky")

local Toggle = Tabs.aimbot:AddToggle("MyToggle",
	{Title = "Shedletsky Aimbot",
		Default = false,
		Callback = function(s)
			if s then
				local shedloop = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
					if not shedaim then return end
					for _, v in pairs(shedaimbotsounds) do
						if child.Name == v then
							local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
							if killersFolder then
								local killer = killersFolder:FindFirstChildOfClass("Model")
								if killer and killer:FindFirstChild("HumanoidRootPart") then
									local killerHRP = killer.HumanoidRootPart
									local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
									if playerHRP then
										local num = 1
										local maxIterations = 100

										while num <= maxIterations do
											task.wait(0.01)
											num = num + 1
											workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
											playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
										end
									end
								end
							end
						end
					end
				end)
			else
				if shedloop then
					shedloop:Disconnect()
					shedloop = nil
				end
			end
		end
	})

Tabs.aimbot:AddButton({
	Title = "Teleport to killer, sword to killers",
	Callback = function()
		error("WaitForChild 1 Missing or nil")
	end
})

local Section = Tabs.aimbot:AddSection("Two Time")

local Toggle = Tabs.aimbot:AddToggle("MyToggle",
	{Title = "Two Time Aimbot",
		Default = false,
		Callback = function(s)
			if s then
				local shedloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
					if not shedaim then return end
					for _, v in pairs(guestsounds) do
						if child.Name == v then
							local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
							if killersFolder then
								local killer = killersFolder:FindFirstChildOfClass("Model")
								if killer and killer:FindFirstChild("HumanoidRootPart") then
									local killerHRP = killer.HumanoidRootPart
									local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
									if playerHRP then
										local num = 1
										local maxIterations = 100

										while num <= maxIterations do
											task.wait(0.01)
											num = num + 1
											workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
											playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
										end
									end
								end
							end
						end
					end
				end)
			else
				if guestloop then
					guestloop:Disconnect()
					guestloop = nil
				end
			end
		end
	})

local Section = Tabs.aimbot:AddSection("Chance")

local Toggle = Tabs.aimbot:AddToggle("MyToggle",
	{Title = "Chance Aimbot",
		Default = false,
		Callback = function(s)
			if s then
				local chanceaimbotLoop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
					if not chanceaim then return end
					for _, v in pairs(chanceaimbotsounds) do
						if child.Name == v  then
							local killer = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
							if killer and killer:FindFirstChild("HumanoidRootPart") then
								local killerHRP = killer.HumanoidRootPart
								local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
								if playerHRP then
									local direction = (killerHRP.Position - playerHRP.Position).Unit
									local num = 1
									local maxIterations = 100


									while num <= maxIterations do
										task.wait(0.01)
										num = num + 1
										workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
										playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(killerHRP.Position.X, killerHRP.Position.Y, killerHRP.Position.Z))
									end


								end
							end
						end
					end
				end)
			else
				if chanceaimbotLoop then
					chanceaimbotLoop:Disconnect()
					chanceaimbotLoop = nil
				end
			end
		end
	})

Tabs.aimbot:AddButton({
	Title = "Teleport to killer, Shoot to killers",
	Callback = function()
		error("WaitForChild 1 Missing or nil")
	end
})

local Section = Tabs.aimbot:AddSection("Guest1337")

local Toggle = Tabs.aimbot:AddToggle("MyToggle",
	{Title = "Guest1337 Aimbot",
		Default = false,
		Callback = function(s)
			if s then
				local shedloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
					if not shedaim then return end
					for _, v in pairs(guestsounds) do
						if child.Name == v then
							local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
							if killersFolder then
								local killer = killersFolder:FindFirstChildOfClass("Model")
								if killer and killer:FindFirstChild("HumanoidRootPart") then
									local killerHRP = killer.HumanoidRootPart
									local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
									if playerHRP then
										local num = 1
										local maxIterations = 100

										while num <= maxIterations do
											task.wait(0.01)
											num = num + 1
											workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
											playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
										end
									end
								end
							end
						end
					end
				end)
			else
				if guestloop then
					guestloop:Disconnect()
					guestloop = nil
				end
			end
		end
	})



-- script.Tabs.onesettings

local Section = Tabs.onesettings:AddSection("Fov")

local Input = Tabs.onesettings:AddInput("Input", {
	Title = "Fov Systems",
	Default = "1",
	Placeholder = "Fov",
	Callback = function(Value)
		value = Value
	end
})

Tabs.onesettings:AddButton({
	Title = "Show Fov",
	Callback = function()
		game.Players.LocalPlayer.Character.FOVMultipliers.FOVSetting.Value = value
	end
})

local Section = Tabs.onesettings:AddSection("Contents")

Tabs.onesettings:AddParagraph({
	Title = "About",
	Content = "protect the this script-not-anti in forsaken,what that this new script the update in forsaken how to i clicker the this script of new, there someone did all script forsaken is just free and then script our key system."
})

local Section = Tabs.onesettings:AddSection("About Settings")

Tabs.onesettings:AddButton({
	Title = "Save all",
	Callback = function()
		Fluent:Notify({
			Title = "Suesses",
			Content = "settings has saved.",
			Duration = 3
		})
		SaveManager:LoadAutoloadConfig()
	end
})

-- script.Tabs.shopguys

local Section = Tabs.shopguys:AddSection("Killer Store")

local Dropdown = Tabs.shopguys:AddDropdown("Dropdown", {
	Title = "Store Killers",
	Values = {"c00lkidd", "1x1x1x1", "John Doe", "Jason"},
	Multi = false,
	Default = 1,
	Callback = function(n)
		selectif = n
	end
})

Tabs.shopguys:AddButton({
	Title = "Buy killers",
	Callback = function()
		local args = {
			"PurchaseContent",
			game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Killers"):WaitForChild(selectif)
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
	end
})

local Section = Tabs.shopguys:AddSection("Survivors Store")

local Dropdown = Tabs.shopguys:AddDropdown("Dropdown", {
	Title = "Store Survivor [New]",
	Values = {"007n7", "Builderman", "Guest1337", "TwoTime", "Dusekkar", "Taph", "Chance"},
	Multi = false,
	Default = 1,
	Callback = function(d)
		Survivornew = d
	end
})

Tabs.shopguys:AddButton({
	Title = "Buy Survivor",
	Callback = function()
		local args = {
			"PurchaseContent",
			game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Survivors"):WaitForChild(Survivornew)
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
	end
})

local Section = Tabs.shopguys:AddSection("Emotes Store")

local Dropdown = Tabs.shopguys:AddDropdown("Dropdown", {
	Title = "Store Emote",
	Values = {"Wave", "Hotdog", "Sukuna", "Hakari Dance [ONLY GAMEPASS]", "COMING SOON..."},
	Multi = false,
	Default = 1,
	Callback = function(d)
		Survivorneww = d
	end
})

Tabs.shopguys:AddButton({
	Title = "Buy Emotes",
	Callback = function()
		local args = {
			"PurchaseContent",
			game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Emotes"):WaitForChild(Survivorneww)
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
	end
})

local Section = Tabs.shopguys:AddSection("Gamepass Store")

Tabs.shopguys:AddButton({
	Title = "Buy Gamepass",
	Callback = function()
		Fluent:Notify({
			Title = "Failed",
			Content = "You need to buy this gamepass!",
			Duration = 2
		})

		local MarketPlaceService = game:GetService("MarketplaceService")
		local Id = 1009460688
		local player = game.Players.LocalPlayer
		local WaitForChild

		MarketPlaceService:PromptGamePassPurchase(player, Id)
	end
})

-- script.Tabs.wedo

local Section = Tabs.wedo:AddSection("Content")

Tabs.wedo:AddParagraph({
	Title = "Webook",
	Content = "the has webook the clicker or support google or that all browser to support do it, likes the my script in scriptblox now."
})

local Input = Tabs.wedo:AddInput("Input", {
	Title = "Webook",
	Default = "",
	Placeholder = "put you web here!",
	Callback = function(Value)
		nothing = Value
	end
})

Tabs.wedo:AddButton({
	Title = "sent in web",
	Callback = function()
		if nothing then
			Fluent:Notify({
				Title = "Done",
				Content = "The webhook has been sent to the console",
				Duration = 2
			})
		else
			Fluent:Notify({
				Title = "Failed",
				Content = "You need to put a web in the input!",
				Duration = 2
			})

		end
	end
})

-- script.Tabs.settings

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
	Title = "Welcome to kuncicoco hub forsaken!";
	Content = "Plz Likes the my channel.";
	Duration = 4
})

-- script.Tabs.onesettings.ButtonFilp

local Section = Tabs.onesettings:AddSection("Filp")

 Tabs.onesettings:AddButton({
        Title = "Frontfilp",
		Callback = function()
			local char = player.Character
        local hum = char.Humanoid
        local animator = hum.Animator
        local hrp = char.HumanoidRootPart
    
    
        if animator then
            for _, v in pairs(animator:GetPlayingAnimationTracks()) do
                v:Stop()
            end
        end
    
        hum:ChangeState(Enum.HumanoidStateType.Physics)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    
            local duration = 0.45
            local steps = 120
            local startCFrame = hrp.CFrame
            local forwardVector = startCFrame.LookVector
            local upVector = Vector3.new(0, 1, 0)
            task.spawn(function()
                local startTime = tick()
                for i = 1, steps do
                    local t = i / steps
                    local height = 4 * (t - t ^ 2) * 10
                    local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height
                    local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)
    
                    hrp.CFrame = CFrame.new(nextPos) * rotation
                    local elapsedTime = tick() - startTime
                    local expectedTime = (duration / steps) * i
                    local waitTime = expectedTime - elapsedTime
                    if waitTime > 0 then
                        task.wait(waitTime)
                    end
                end
    
                hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                hum:ChangeState(Enum.HumanoidStateType.Running)
    
                
            end)
		end
 })
