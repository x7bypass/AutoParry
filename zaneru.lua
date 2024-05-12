local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Exploit Hub - Premium 2.9.5",
    SubTitle = "by zaneru",
    TabWidth = 180,
    Size = UDim2.fromOffset(450, 225),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Parry", Icon = "shield" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Options = Fluent.Options

--functions
function Manual()
local toggleState = false
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "Button"

local button = Instance.new("TextButton")
button.Text = "Auto Parry"
button.BackgroundTransparency = 3
button.BackgroundColor3 = Color3.new(1, 1, 1)
button.Size = UDim2.new(0, 150, 0, 70)
button.Parent = ScreenGui
button.Position = UDim2.new(0, 100, 0, 100)

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 15)
topBar.BackgroundColor3 = Color3.new(0, 0, 0)
topBar.Parent = button

local originalColor = button.BackgroundColor3
local grayColor = Color3.new(0.7, 0.7, 0.7)

local dragging = false
local offset = Vector2.new()
local player = game.Players.LocalPlayer

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        offset = button.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
        button.BackgroundColor3 = grayColor
    end
end)

topBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local inputPosition = input.Position
        local newPosition = UDim2.new(0, inputPosition.X, 0, inputPosition.Y) + offset
        button.Position = newPosition
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        button.BackgroundColor3 = originalColor
    end
end)

button.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    button.Text = tostring(toggleState)
    getgenv().Spam = toggleState
    while getgenv().Spam do
game.ReplicatedStorage.Remotes.ParryButtonPress:Fire()
        wait(0.01)
    end
end)

ScreenGui.Parent = player:FindFirstChild("PlayerGui")
end

function autoParry()
local Debug = true -- Set this to true if you want my debug output.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9) -- A second argument in waitforchild what could it mean?
local Balls = workspace:WaitForChild("Balls", 9e9)
local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end
local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end
local function IsTarget() -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end
local function Parry() -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end
Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    print(`Ball Spawned: {Ball}`)
    local OldPosition = Ball.Position
    local OldTick = tick()
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then -- No need to do the math if we're not being attacked.
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude -- Fix for .Velocity not working. Yes I got the lowest possible grade in accuplacer math.
            print(`Distance: {Distance}\nVelocity: {Velocity}\nTime: {Distance / Velocity}`)
            if (Distance / Velocity) <= 10 then -- Sorry for the magic number. This just works. No, you don't get a slider for this because it's 2am.
                Parry()
            end
        end
        if (tick() - OldTick >= 1/60) then -- Don't want it to update too quickly because my velocity implementation is aids. Yes, I tried Ball.Velocity. No, it didn't work.
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
end

function SwordCrateManual()
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
end

function ExplosionCrateManual()
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
end

function SwordCrateAuto()
while _G.AutoSword do
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
wait(1)
end
end

function ExplosionCrateAuto()
while _G.AutoBoom do
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
wait(1)
end
end

--start
do
    Fluent:Notify({
        Title = "Exploit X Hub has injected",
        Content = "report any bugs at https://dsc.gg/exploitx",
        SubContent = "or copy the link trough the 'Misc' page", -- Optional
        Duration = 3.5 -- Set to nil to make the notification not disappear
    })
end

--start, the real one
local Mainy = Tabs.Main:AddSection("Parry")

Mainy:AddParagraph({
        Title = "NEWS",
        Content = "we fixed it. but the script will suck alot"
    })


Mainy:AddButton({
        Title = " auto Parry - works",
        Description = "we are better4 ever! ",
        Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/UltraStuff/scripts2/main/bladered")))()
        end
    })

Mainy:AddButton({
        Title = " auto spam - works",
        Description = "we are better4 ever! ",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/x7bypass/Blade-Ball/main/Scripts"))()
        end
    })       

-- start          
local toggle = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.X then
        toggle = not toggle
        if toggle then
            -- Your code when toggle is true
        else
            -- Your code when toggle is false
        end
    end
end)
-- end
        end
    })

local Toggle = Mainy:AddToggle("Freeze Spammy - we all know", {Title = "Freeze Ability Spammer", Default = false })
Toggle:OnChanged(function(Value)
  local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local sus = Value

local function Freezer()
    if sus then
        print("Freeze Spammer is enabled | Exploit X")
        while sus do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Freeze"):FireServer()
            wait()
        end
    else
        print("Freeze Spammer is disabled | Exploit X")
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.B then
        Freezer()
    end
end)
end)

local Money = Tabs.Main:AddSection("Features")

Money:AddButton({
        Title = "remove particles",
        Description = "execute this for less lag",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/Destroy%20Particle%20Emitters",true))()
        end
    })

Money:AddButton({
        Title = "Open Sword Crate",
        Description = "will open one common sword crate",
        Callback = function()
            SwordCrateManual()
        end
    })
    
Money:AddButton({
        Title = "Open Explosion Crate",
        Description = "will open one common explosion crate",
        Callback = function()
            ExplosionCrateManual()
        end
    })
    
local Toggle = Money:AddToggle("SwordAuto", {Title = "Auto Open Sword Crate", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoSword = Value
        SwordCrateAuto()
end)

local Toggle = Money:AddToggle("ExplosionAuto", {Title = "Auto Open Explosion Crate", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoBoom = Value
        ExplosionCrateAuto()
end)

--misc
local Misc = Tabs.Misc:AddSection("Misc")

Misc:AddButton({
        Title = "Mobile Keyboard",
        Description = "launches a GUI that mimics a Keyboard.",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
        end
    })
    
Misc:AddButton({
        Title = "Infinite Yield",
        Description = "I dont think i have to explain what this is.",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
        end
    })
