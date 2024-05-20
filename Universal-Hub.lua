local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Zaneru Project", HidePremium = false, SaveConfig = true, IntroText = "Welcome Zaneru Project", ConfigFolder = "myhubscript"})

OrionLib:MakeNotification({
	Name = "Notification",
	Content = "Made By zaneru.id 😎",
	Image = "rbxassetid://7733911828",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "Blade Ball",
	Icon = "rbxassetid://7733964126",
	PremiumOnly = false
})


Tab:AddButton({
	Name = "Omg Hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Omgshit/animesouls/main/.Ok"))()
  	end    
})

Tab:AddButton({
	Name = "FFJ(Ver 2.5)",
    Icon = "rbxassetid://7733715400",
	Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Redz Hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/eng"))()
  	end    
})

Tab:AddButton({
	Name = "Tunx Hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/TunxDeveloper/BladeBall/main/main"))()
  	end    
})

Tab:AddButton({
	Name = "Sirius hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/Siriusisbetter/main/xyz.bb.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Nova X",
    Icon = "rbxassetid://7733715400",
	Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/xdevslasher/novaxnewgen/main/novax.lua",true))()
  	end    
})

Tab:AddButton({
	Name = "Galaxy Hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
  loadstring(game:HttpGet("https://paste.gg/p/anonymous/a180017023b94aa6a54811ea13b9e802/files/95e50523742642c88d5ff95dfd95cae7/raw"))()
  	end    
})

Tab:AddButton({
	Name = "Knights hub",
    Icon = "rbxassetid://7733715400",
	Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AvianProjects/Hubs/main/Blade%20ball"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "Blade Ball Event",
	Icon = "rbxassetid://7733964126",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "FFJ(Ver3.6) Auto Dungeon",
    Icon = "rbxassetid://7733715400",
	Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/BladeBallEvent.lua"))()
  	end    
})


local Tab = Window:MakeTab({
    Name = "Blox Fruit",
    Icon = "rbxassetid://7733964126",
    PremiumOnly = false
})


Tab:AddButton({
	Name = "W Azure",
        Icon = "rbxassetid://7733715400",
	Callback = function()
            getgenv().Team = "Marine"
getgenv().AutoLoad = false --Will Load Script On Server Hop
getgenv().SlowLoadUi  = false
getgenv().ForceUseSilentAimDashModifier = false --Force turn on silent aim , if error then executor problem
getgenv().ForceUseWalkSpeedModifier = false --Force turn on Walk Speed Modifier , if error then executor problem
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    
  	end    
})

Tab:AddButton({
	Name = "Hoho Hub",
        Icon = "rbxassetid://7733715400",
	Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
        end
    })

local Tab = Window:MakeTab({
    Name = "Arsenal",
    Icon = "rbxassetid://7733964126",
    PremiumOnly = false
})

Tab:AddButton({
        Name = "Script not added yet",
        Image = "rbxassetid://7734021118",
        Callback = function()

	end		
})


local Tab = Window:MakeTab({
    Name = "Evade",
    Icon = "rbxassetid://7733964126",
    PremiumOnly = false
})

Tab:AddButton({
        Name = "Script not added yet",
        Image = "rbxassetid://7734021118",
        
})

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733993211",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "Aimbot & ESP Universal (Click For Execute)",
    Icon = "rbxassetid://7743878496",
    Callback = function()
	  loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua"))()
    end					
})

MainTab:AddButton({
    Name = "Fly GUI (Click For Execute)",
    Icon = "rbxassetid://7733696665",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/zanesirusen/Flying-GUI/main/zaneru.lua"))()
    end
})

MainTab:AddButton({
	Name = "Infinite Yield (Click For Execute)",
	Callback = function()
         loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})          

MainTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(s)
        local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
    end
})

MainTab:AddSlider({
    Name = "WalkSpeed",
    Min = 0,
    Max = 1000,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end
})


MainTab:AddSlider({
    Name = "JumpPower",
    Min = 0,
    Max = 550,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end
})


MainTab:AddButton({
    Name = "Reset Character",
    Callback = function()
        game.Players.LocalPlayer.Character.Head:Destroy()
      end
})


local Tab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://7734053495",
	PremiumOnly = false
})

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
            OrionLib:Destroy()
    end
})
            
local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7229442422",
    PremiumOnly = false
})


CreditsTab:AddButton({
    Name = "Made By zaneru.id",
    Callback = function()
      end
})

local DiscordTab = Window:MakeTab({
     Name = "Discord Server",
     Icon = "rbxassetid://7734053495",          
     HidePremium = false           
})


DiscordTab:AddButton({
                
})
        
local httpHook;
httpHook = hookfunction(game.HttpGet, function(self,...)
   local Args = {...}
   if Args[1] and type(Args[1]) == "string" then
       if Args[1]:match("checkPremium.php") then
           return "true"
       end
   end
   return httpHook(self,...)
end)

local OrionLib = loadstring(game:HttpGet(('https://hypernite.xyz/Backup/Orion/source.lua')))() -- Backed up to my host
OrionLib:Init()
