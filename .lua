local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local LocPlayer = game.Players.LocalPlayer
local chr = LocPlayer.Character
local hum = chr.Humanoid
local root = chr.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local number = math.huge

local function workspaceChildren(str,func)
for _,v in pairs(str:GetChildren()) do
    func(v)
  end
end

local workspace = game:GetService("Workspace")

_G.Settings = {
    Height = 20,
    Height1 = -20,
    distance = 1.5
}

local method = {
    Top = false,
    Under = false,
    Behind = false,
    Teleport = false
}

--workspace["DungeonFolder"]:FindFirstChild("16")["Enemy_Folder"]["Epic_10"]

local function Teleport(target)
if method.Teleport == true then
        if method.Top == true then
            root.CFrame = CFrame.new(target.Position * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,_G.Settings.Height,0))
        elseif method.Under == true then
            root.CFrame = CFrame.new(target.Position * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,_G.Settings.Height1,0))
        elseif method.Behind == true then
            root.CFrame = CFrame.new(target.Position * CFrame.new(0,0,_G.Settings.distance))
        end
elseif method.Teleport == false then
        if method.Top == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,_G.Settings.Height,0)}):Play()
        elseif method.Under == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,_G.Settings.Height1,0)}):Play()
        elseif method.Behind == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.new(0,0,_G.Settings.distance)}):Play()
        end
    end
end

local function sell()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Sell_Equipment"]:InvokeServer()
end

local function equip()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Change_Equipment"]:InvokeServer()
end

--chest_cd, chest_wait

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Dungeon",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Gacha",
Icon = "rbxassetid://",
PremiumOnly = false
})

local D = Window:MakeTab({
Name = "Config",
Icon = "rbxassetid://",
PremiumOnly = false
})

-- atk, atk_cutdown, Atk_Range, c_health, combo, counter, crit, defense, dodge, DungeonLevel, health, ignore_lifesteal, lifesteal
-- :SetAttribute("DMG",number)
D:AddButton({
Name = "Infinite Damage",
Callback = function()
      LocPlayer:SetAttribute("atk",number)
  end    
})

D:AddButton({
Name = "Infinite Range",
Callback = function()
      LocPlayer:SetAttribute("Atk_Range",number)
  end    
})

D:AddButton({
Name = "Infinite all",
Callback = function()
      LocPlayer:SetAttribute("combo",number)
      LocPlayer:SetAttribute("counter",number)
      LocPlayer:SetAttribute("crit",number)
      LocPlayer:SetAttribute("defense",number)
      LocPlayer:SetAttribute("dodge",number)
      LocPlayer:SetAttribute("lifesteal",number)
  end    
})

--[[T2:AddTextbox({
  Name = "Dungeon Level (1-60)",
  Default = "1",
  TextDisappear = true,
  Callback = function(Value)
      _G.DungeonLevel = Value
  end  
})
]]

T2:AddButton({
Name = "Enter Dungeon",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["DungeonService"]["RF"]["Enter_Level"]:InvokeServer(LocPlayer:GetAttribute("DungeonLevel"))
  end    
})

-- n.HumanoidRootPart.CFrame
T1:AddToggle({
Name = "Auto Kill ( ☠️brutal☠️ )",
Default = false,
Callback = function(Value)
_G.InsKill = Value
      while wait() do
        if _G.InsKill == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({c,c,c,c,c,c,c,c,c,c})
            end)
          end)
      end
end    
})

T1:AddToggle({
Name = "Open Chest",
Default = false,
Callback = function(Value)
_G.oc = Value
      while wait() do
        if _G.oc == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Open_Chest"]:InvokeServer()
        LocPlayer:SetAttribute("chest_wait",0)
        LocPlayer:SetAttribute("chest_cd",0)
      end
  end})

T1:AddToggle({
Name = "Claim Gifts",
Default = false,
Callback = function(Value)
_G.org = Value
      while wait() do
        if _G.org == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(1)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(2)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(3)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(4)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(5)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(6)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(7)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(8)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(9)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(10)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(11)
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["ClaimOnlineReward"]:InvokeServer(12)
      end
  end})

T1:AddToggle({
Name = "Claim Task",
Default = false,
Callback = function(Value)
_G.ct = Value
      while wait() do
        if _G.ct == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TaskService"]["RF"]["Claim_TaskReward"]:InvokeServer()
      end
  end})

T1:AddToggle({
Name = "Bring Asshole [Testing]",
Default = false,
Callback = function(Value)
_G.bringAsshole = Value
      while wait() do
        if _G.bringAsshole == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                c.CFrame = root.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,_G.Settings.Height,0)
            end)
          end)
      end
end    
})

T3:AddToggle({
Name = "Gacha Mount [ Gems ]",
Default = false,
Callback = function(Value)
_G.gm = Value
      while wait() do
        if _G.gm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MountService"]["RF"]["Normal_Gacha_Mount"]:InvokeServer("Gem")
      end
  end})

T3:AddToggle({
Name = "Gacha Mount [ Coins ]",
Default = false,
Callback = function(Value)
_G.gm = Value
      while wait() do
        if _G.gm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MountService"]["RF"]["Normal_Gacha_Mount"]:InvokeServer("Coin")
      end
  end})
