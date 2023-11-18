local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local function workspaceChildren(str,func)
for _,v in pairs(str:GetChildren()) do
    func(v)
  end
end

local workspace = game:GetService("Workspace")

--workspace["DungeonFolder"]:FindFirstChild("16")["Enemy_Folder"]["Epic_10"]

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
                game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({c})
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
_G.or = Value
      while wait() do
        if _G.or == false then break end
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

T3:AddToggle({
Name = "Gacha Mount [ Gems ]",
Default = false,
Callback = function(Value)
_G.gm = Value
      while wait() do
        if _G.gm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MountService"]["RF"]["Normal_Gacha_Mount"]:InvokeServer(Gem)
      end
  end})
