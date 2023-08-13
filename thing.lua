local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Difficulty Machine",
   LoadingTitle = "Difficulty Machine Script",
   LoadingSubtitle = "by Alys",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Legion_Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "DM | Key",
      Subtitle = "Key has 1 checkpoint",
      Note = "Get key from :https://link-center.net/922571/legion-hub-key-system",
      FileName = "legionhubkey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/Rkmh5aKr","https://pastebin.com/raw/JENtQhqj","https://pastebin.com/raw/SDZLa8LF"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil)
local MiscTab = Window:CreateTab("Misc", nil)
local TeleportsTab = Window:CreateTab("Teleport", nil)
local ExtraTab = Window:CreateTab("Extra", nil) 
local TestingTab = Window:CreateTab("Testing", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script.",
   Content = "Difficulty Machine",
   Duration = 6,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

-- MAIN TAB


local Button = MainTab:CreateButton({
    Name = "Auto Clicker | You can stop this by pressing 8",
    Callback = function()
        local btn
        for i,v in pairs(workspace.Objects.Factory.Buttons:GetChildren()) do
            if v.Name ~= "Button" then continue end
            if v.SurfaceGui.Txt.Text ~= 'click to spawn difficulty' then continue end
            btn = v.ClickDetector
        end

        local isAutoClicking = true
        
        local stopAutoClicking
        stopAutoClicking = function()
            isAutoClicking = false
        end
        
        local UserInputService = game:GetService("UserInputService")
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Eight then
                stopAutoClicking()
            end
        end)
        
        while isAutoClicking do
            fireclickdetector(btn)
            wait()
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Auto Sell | You can stop this by pressing 7",
    Callback = function()
        local btn
        for i,v in pairs(workspace.Objects.Factory.Buttons:GetChildren()) do
            if v.Name ~= "Button" then continue end
            if v.SurfaceGui.Txt.Text ~= 'sell all' then continue end
            btn = v.ClickDetector
        end

        local isAutoClicking = true
        
        local stopAutoClicking
        stopAutoClicking = function()
            isAutoClicking = false
        end
        
        local UserInputService = game:GetService("UserInputService")
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Seven then
                stopAutoClicking()
            end
        end)
        
        while isAutoClicking do
            fireclickdetector(btn)
            wait()
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "TPLuck |Check Console| Keybinds : 9/0 ",
    Callback = function()
        local UserInputService = game:GetService("UserInputService")
        local humroot = game.Players.LocalPlayer.Character.HumanoidRootPart
        local orig = humroot.CFrame
        local isRunning = false  -- Flag to track whether the loop is running
        local luckOptions = {}

        -- Dynamically retrieve luck options and generate unique IDs
        for _, luck in pairs(game:GetService("Workspace").Objects.Upgrades:GetChildren()) do
            local luckName = luck.Name
            table.insert(luckOptions, luckName)
        end

        local currentLuckIndex = 1

        local function teleportDifficulties(luckPadCFrame)
            for i, v in pairs(game:GetService("Workspace").Objects.Difficulties:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CFrame = luckPadCFrame
                end
            end
        end

        local function startLoop()
            isRunning = true
            for i, v in pairs(game:GetService("Workspace").Objects.Difficulties:GetChildren()) do
                for i, v in pairs(v:GetChildren()) do
                    if not v:IsA('BasePart') then continue end
                    humroot.CFrame = v.CFrame
                    wait()
                    v.CFrame = game:GetService("Workspace").Objects.Upgrades[luckOptions[currentLuckIndex]].Pad.CFrame
                    teleportDifficulties(v.CFrame)
                    humroot.CFrame = orig
                    if not isRunning then
                        break
                    end
                end
                if not isRunning then
                    break
                end
            end
            humroot.CFrame = orig
            isRunning = false
        end

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Nine then
                if isRunning then
                    isRunning = false  -- Stop the loop
                else
                    startLoop()  -- Start the loop
                end
            end
            if input.KeyCode == Enum.KeyCode.Zero then
                currentLuckIndex = currentLuckIndex + 1
                if currentLuckIndex > #luckOptions then
                    currentLuckIndex = 1
                end
                print("Luck changed to " .. luckOptions[currentLuckIndex])
            end
        end)
    end,
})

-- MISC TAB 

local Slider1 = MiscTab:CreateSlider({
   Name = "Walkspeed",
   Range = {24, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 24,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider1 = MiscTab:CreateSlider({
   Name = "Jumppower",
   Range = {50, 1000},
   Increment = 1,
   Suffix = "JPower",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})


--Teleports TAB


local Button = TeleportsTab:CreateButton({
    Name = "Reincarnation",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(-80, 2.53000093, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})

local Button = TeleportsTab:CreateButton({
    Name = "Sacrifice",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(-5, 0.529999971, -116, 1, 0, 0, 0, 1, 0, 0, 0, 1)

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})

local Button = TeleportsTab:CreateButton({
    Name = "Ascension",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(
            -57, -1.43999195, 414.875,
            1, 0, 0,
            0, -1, 0,
            0, 0, -1
        )

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})

local Button = TeleportsTab:CreateButton({
    Name = "Tier",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(
            -125.5, -12.4699717, 127.5,
            -1, 0, 0,
            0, -1, 0,
            0, 0, 1
        )

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})

local Button = TeleportsTab:CreateButton({
    Name = "Win Obby",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(
            66.8725967, 13.4999428, 153.601517,
            0.831489921, -0.212583303, 0.513257205,
            0.000009410083, 0.923894286, 0.382647753,
            -0.555539906, -0.318162918, 0.768210769
        )

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})

local Button = TeleportsTab:CreateButton({
    Name = "Weird Place",
    Callback = function()
        local player = game.Players.LocalPlayer
        local teleportCFrame = CFrame.new(
            887.911316, -9.83914948, -193.905914,
            1, 0, 0,
            0, 1, 0,
            0, 0, 1
        )

        player.Character:MoveTo(teleportCFrame.Position)
    end,
})


--EXTRA TAB

local luckValues = {
    {Value = 0, Difficulty = "N/A"},
    {Value = 3, Difficulty = "Storage"},
    {Value = 4, Difficulty = "Storage+"},
    {Value = 5, Difficulty = "(1) next at (5)"},
    {Value = 6, Difficulty = "(5) next at (9)"},
    {Value = 7, Difficulty = "(9) next at (13)"},
    {Value = 8, Difficulty = "(13) next at (18)"},
    {Value = 9, Difficulty = "(18) next at (23)"},
    {Value = 10, Difficulty = "(23) next at (28)"},
    {Value = 11, Difficulty = "(28) next at (34)"},
    {Value = 12, Difficulty = "(34) next at (39)"},
    {Value = 13, Difficulty = "(39) next at (44)"},
    {Value = 14, Difficulty = "(44) next at (52)"},
    {Value = 15, Difficulty = "(52) next at (59)"},
    {Value = 16, Difficulty = "(59) next at (66)"},
    {Value = 17, Difficulty = "(66) next at (74)"},
    {Value = 18, Difficulty = "(74) next at (82)"},
    {Value = 19, Difficulty = "(82) next at (91)"},
    {Value = 20, Difficulty = "(91) next at (100)"},
    {Value = 21, Difficulty = "(100) next at (108)"},
    {Value = 22, Difficulty = "(108) next at (115)"},
    {Value = 23, Difficulty = "(115) next at (123)"},
    {Value = 24, Difficulty = "(123)"},
}
local Slider
local Paragraph

Slider = ExtraTab:CreateSlider({
    Name = "Luck Slider",
    Range = {1, #luckValues},  -- Adjust the range to include all options
    Increment = 1,
    CurrentValue = 1,  -- Start with N/A
    Flag = "LuckSlider",
    Callback = function(Value)
        local selectedValue = luckValues[Value].Value
        game:GetService("ReplicatedStorage").Remotes.AutoUpgradeEv:FireServer(selectedValue)
       
        -- Update the paragraph to show the luck number and difficulty
        local paragraphContent
        if Value == 1 then
            paragraphContent = "N/A"
        elseif Value == 2 then
            paragraphContent = "Storage"
        elseif Value == 3 then
            paragraphContent = "Storage+"
        else
            paragraphContent = "Luck" .. (Value - 3) .. " at " .. luckValues[Value].Difficulty
        end
        if Paragraph then
            Paragraph:Set({Title = "Luck Difficulty", Content = paragraphContent})
        else
            Paragraph = ExtraTab:CreateParagraph({
                Title = "Luck Difficulty",
                Content = paragraphContent,
            })
        end
    end,
})

-- Function to update the slider's value
function UpdateSliderValue(newValue)
    Slider:Set(newValue)
end

Paragraph = ExtraTab:CreateParagraph({
    Title = "Luck Difficulty",
    Content = "N/A"
})
