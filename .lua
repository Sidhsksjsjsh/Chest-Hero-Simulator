local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local LocPlayer = game.Players.LocalPlayer
local chr = LocPlayer.Character
local hum = chr.Humanoid
local root = chr.HumanoidRootPart
local TweenService = game:GetService("TweenService")

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
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.Position * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,_G.Settings.Height,0)}):Play()
        elseif method.Under == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.Position * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,_G.Settings.Height1,0)}):Play()
        elseif method.Behind == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.Position * CFrame.new(0,0,_G.Settings.distance)}):Play()
        end
    end
end

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
Name = "Teleport Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})

D:AddSlider(
    {Name = "Over Height", Default = _G.Settings.Height, Min = 5, Max = 10, Color = Color3.fromRGB(255,215,0), Callback = function(H)
            _G.Settings.Height = H
            end}
)
D:AddSlider(
    {Name = "Under Height", Default = _G.Settings.Height1, Min = -15, Max = -10, Color = Color3.fromRGB(255,215,0), Callback = function(H)
            _G.Settings.Height1 = H
            end}
)
D:AddSlider(
    {Name = "Behind Distance", Default = 0.5, Min = 0, Max = 20, Color = Color3.fromRGB(255,215,0), Callback = function(H)
            _G.Settings.distance = H
            end}
)

D:AddToggle({
Name = "Method (false = TP, true = tweening)",
Default = false,
Callback = function(Value)
    method.Teleport = Value
end})

D:AddToggle({
Name = "Teleport OnTop",
Default = false,
Callback = function(Value)
    method.Top = Value
end})

D:AddToggle({
Name = "Teleport Under",
Default = false,
Callback = function(Value)
    method.Under = Value
end})

D:AddToggle({
Name = "Teleport Behind",
Default = false,
Callback = function(Value)
    method.Behind = Value
end})

T2:AddTextbox({
  Name = "Dungeon Level (1-60)",
  Default = "1",
  TextDisappear = true,
  Callback = function(Value)
      _G.DungeonLevel = Value
  end  
})

T2:AddButton({
Name = "Enter Dungeon",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["DungeonService"]["RF"]["Enter_Level"]:InvokeServer(tonumber(_G.DungeonLevel))
  end    
})

T1:AddToggle({
Name = "Auto Kill",
Default = false,
Callback = function(Value)
_G.InsKill = Value
      while wait() do
        if _G.InsKill == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({c,c,c,c,c,c,c})
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
