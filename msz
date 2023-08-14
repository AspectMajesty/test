local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Money Simulator Z",
   LoadingTitle = "Money Simulator Z Script",
   LoadingSubtitle = "by Alys",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Legion_Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Thanks!",
   Content = "Thank you for using my scripts!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Np!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local BuildTab = Window:CreateTab("Building", nil) -- Title, Image
local MachinesTab = Window:CreateTab("Machines", nil) -- Title, Image
local GemsTab = Window:CreateTab("Gems", nil) -- Title, Image

-- MAIN TAB | Faster Generations

local GenerateFasterEnabled = false
local GenerateFasterConnection

local Toggle = MainTab:CreateToggle({
    Name = "Generate Faster | KB = 1",
    CurrentValue = false,
    Flag = "GenerateFasterToggle",
    Callback = function(Value)
        GenerateFasterEnabled = Value
        if GenerateFasterEnabled then
            GenerateFasterConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.GenerateFaster:FireServer()
            end)
        else
            if GenerateFasterConnection then
                GenerateFasterConnection:Disconnect()
            end
        end
    end,
})

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.One then
        Toggle:Set(not GenerateFasterEnabled)
    end
end)

local BoostGemEnabled = false
local BoostGemConnection

local ToggleBoostGem = MainTab:CreateToggle({
    Name = "Boost Gem | KB = 2",
    CurrentValue = false,
    Flag = "BoostGemToggle",
    Callback = function(Value)
        BoostGemEnabled = Value
        if BoostGemEnabled then
            BoostGemConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.BoostGem:FireServer()
            end)
        else
            if BoostGemConnection then
                BoostGemConnection:Disconnect()
            end
        end
    end,
})

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Two then
        ToggleBoostGem:Set(not BoostGemEnabled)
    end
end)

--MAIN TAB | GEMS
local ButtonCollectGems = MainTab:CreateButton({
    Name = "Collect All Gems | out of gems = callback error",
    Callback = function()
        while wait() do
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Factory.Gems.Gem1, 1)
        end
    end,
})

--BUILDING | BuildTab

local UpgradeWallsConnection
local UpgradeLengthConnection
local UpgradeSurfaceConnection
local UpgradeFloorsConnection

local ToggleUpgradeWalls = BuildTab:CreateToggle({
    Name = "Upgrade Walls",
    CurrentValue = false,
    Flag = "ToggleUpgradeWalls",
    Callback = function(Value)
        local ohNumber1 = 1
        local ohBoolean2 = Value

        if Value then
            UpgradeWallsConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.FactoryUpgrade:FireServer(ohNumber1, ohBoolean2)
            end)
        else
            if UpgradeWallsConnection then
                UpgradeWallsConnection:Disconnect()
            end
        end
    end,
})

local ToggleUpgradeLength = BuildTab:CreateToggle({
    Name = "Upgrade Length",
    CurrentValue = false,
    Flag = "ToggleUpgradeLength",
    Callback = function(Value)
        local ohNumber1 = 2
        local ohBoolean2 = Value

        if Value then
            UpgradeLengthConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.FactoryUpgrade:FireServer(ohNumber1, ohBoolean2)
            end)
        else
            if UpgradeLengthConnection then
                UpgradeLengthConnection:Disconnect()
            end
        end
    end,
})

local ToggleUpgradeSurface = BuildTab:CreateToggle({
    Name = "Upgrade Surface",
    CurrentValue = false,
    Flag = "ToggleUpgradeSurface",
    Callback = function(Value)
        local ohNumber1 = 3
        local ohBoolean2 = Value

        if Value then
            UpgradeSurfaceConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.FactoryUpgrade:FireServer(ohNumber1, ohBoolean2)
            end)
        else
            if UpgradeSurfaceConnection then
                UpgradeSurfaceConnection:Disconnect()
            end
        end
    end,
})

local ToggleUpgradeFloors = BuildTab:CreateToggle({
    Name = "Upgrade Floors",
    CurrentValue = false,
    Flag = "ToggleUpgradeFloors",
    Callback = function(Value)
        local ohNumber1 = 4
        local ohBoolean2 = Value

        if Value then
            UpgradeFloorsConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("ReplicatedStorage").Events.FactoryUpgrade:FireServer(ohNumber1, ohBoolean2)
            end)
        else
            if UpgradeFloorsConnection then
                UpgradeFloorsConnection:Disconnect()
            end
        end
    end,
})


-- GET FIRST MACHIES | MachinesTab



-- BUYING MACHINES | MachinesTab
local currentMachineNumber = 1
local BuyMoreMachinesConnection
local ToggleBuyMoreMachines = MachinesTab:CreateToggle({
    Name = "Buy More Machines",
    CurrentValue = false,
    Flag = "ToggleBuyMoreMachines",
    Callback = function(Value)
        local ohBoolean2 = false

        if Value then
            BuyMoreMachinesConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local ohNumber1 = currentMachineNumber
                game:GetService("ReplicatedStorage").Events.BuyMachine:FireServer(currentMachineNumber, ohBoolean2)

                currentMachineNumber = currentMachineNumber % 10 + 1
            end)
        else
            if BuyMoreMachinesConnection then
                BuyMoreMachinesConnection:Disconnect()
            end
        end
    end,
})
--BUY MORE MACHINES | MachinesTab
local currentMachineNumber = 1
local BuyMoreMachinesConnection
local ToggleBuyMoreMachines = MachinesTab:CreateToggle({
    Name = "Buy More Machines",
    CurrentValue = false,
    Flag = "ToggleBuyMoreMachines",
    Callback = function(Value)
        local ohNumber2 = 1
        local ohBoolean3 = false

        if Value then
            BuyMoreMachinesConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local ohNumber1 = currentMachineNumber
                game:GetService("ReplicatedStorage").Events.BuyMoreMachines:FireServer(ohNumber1, ohNumber2, ohBoolean3)

                currentMachineNumber = currentMachineNumber % 10 + 1
            end)
        else
            if BuyMoreMachinesConnection then
                BuyMoreMachinesConnection:Disconnect()
            end
        end
    end,
})




--UPGRADE MACHINES | MachinesTab
local currentMachineNumber = 1
local UpgradeMachineConnection

local ToggleUpgradeMachines = MachinesTab:CreateToggle({
    Name = "Upgrade Machines",
    CurrentValue = false,
    Flag = "ToggleUpgradeMachines",
    Callback = function(Value)
        local ohNumber2 = 1
        local ohBoolean3 = false

        if Value then
            UpgradeMachineConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local ohNumber1 = currentMachineNumber
                game:GetService("ReplicatedStorage").Events.UpgradeMachine:FireServer(ohNumber1, ohNumber2, ohBoolean3)

                currentMachineNumber = currentMachineNumber % 10 + 1
            end)
        else
            if UpgradeMachineConnection then
                UpgradeMachineConnection:Disconnect()
            end
        end
    end,
})



--GEMS | GemsTab
local ButtonUpgradeGem1 = GemsTab:CreateButton({
    Name = "Upgrade Gem Machine Tier",
    Callback = function()
        local ohNumber1 = 1
        game:GetService("ReplicatedStorage").Events.GemUpgrade:FireServer(ohNumber1)
    end,
})

local ButtonUpgradeGem2 = GemsTab:CreateButton({
    Name = "Upgrade Money",
    Callback = function()
        local ohNumber1 = 2
        game:GetService("ReplicatedStorage").Events.GemUpgrade:FireServer(ohNumber1)
    end,
})

local ButtonUpgradeGem3 = GemsTab:CreateButton({
    Name = "Upgrade Prestige Points",
    Callback = function()
        local ohNumber1 = 3
        game:GetService("ReplicatedStorage").Events.GemUpgrade:FireServer(ohNumber1)
    end,
})

local ButtonUpgradeGem4 = GemsTab:CreateButton({
    Name = "Upgrade Research Speed",
    Callback = function()
        local ohNumber1 = 4
        game:GetService("ReplicatedStorage").Events.GemUpgrade:FireServer(ohNumber1)
    end,
})
