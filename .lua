local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local LocPlayer = game.Players.LocalPlayer
local chr = LocPlayer.Character
local hum = chr.Humanoid
local root = chr.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local number = math.huge
local offset = Vector3.new(20,0,0)
local enemys = nil

local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'Start_Attack' then
        enemys = Args[1]
end
	return namecall(self, ...) 
end)

local function workspaceChildren(str,func)
for _,v in pairs(str:GetChildren()) do
    func(v)
  end
end

local workspace = game:GetService("Workspace")

local function stopMoving(str)
    str.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
end

local Settings = {
    Height = 20,
    Height1 = -20,
    distance = 8
}

local method = {
    Top = false,
    Under = false,
    Behind = true,
    Teleport = true
}

--workspace["DungeonFolder"]:FindFirstChild("16")["Enemy_Folder"]["Epic_10"]

local function Teleport(target)
if method.Teleport == true then
        if method.Top == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,Settings.Height,0)
        elseif method.Under == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,Settings.Height1,0)
        elseif method.Behind == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0,0,Settings.distance)
        end
elseif method.Teleport == false then
        if method.Top == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,Settings.Height,0)}):Play()
        elseif method.Under == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,Settings.Height1,0)}):Play()
        elseif method.Behind == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.new(0,0,Settings.distance)}):Play()
        end
    end
end

local function sell()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Sell_Equipment"]:InvokeServer()
end

local function equip()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Change_Equipment"]:InvokeServer()
end

local function NpcCFrame(str)
local rotatedOffset = offset:rotate(Vector3.new(0,math.rad(LocPlayer.Character.HumanoidRootPart.Orientation.Y),0))
        local newPosition = LocPlayer.Character.HumanoidRootPart.Position + rotatedOffset

        local lookVector = (newPosition - LocPlayer.Character.HumanoidRootPart.Position).unit
        local orientation = Vector3.new(lookVector.x,0,lookVector.z).unit
        local angle = math.atan2(orientation.z,orientation.x)
        str:SetPrimaryPartCFrame(CFrame.new(newPosition) * CFrame.Angles(0,angle,0))
end

local function SafeNPC(str)
local rotatedOffset = offset:rotate(Vector3.new(0,math.rad(LocPlayer.Character.HumanoidRootPart.Orientation.Y),0))
        local newPosition = LocPlayer.Character.HumanoidRootPart.Position + rotatedOffset

        str:SetPrimaryPartCFrame(CFrame.new(newPosition))
end

local function Calculate(str)
    return #str["Enemy_Folder"]:GetChildren()
end

local function CalculateRandom(str)
    return #str["Enemy_Folder"]:GetChildren()[math.random(1,#str["Enemy_Folder"]:GetChildren())]
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

local T4 = Window:MakeTab({
Name = "NPC Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Teleport Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})

T5:AddSlider({
  Name = "OnTop Distance",
  Min = 0,
  Max = 100,
  Default = Settings.Height,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.Height = Value
  end    
})

T5:AddSlider({
  Name = "Under Distance",
  Min = 0,
  Max = 100,
  Default = Settings.Height1,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.Height1 = Value
  end    
})

T5:AddSlider({
  Name = "Behind Distance",
  Min = 0,
  Max = 100,
  Default = Settings.distance,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.distance = Value
  end    
})

T5:AddToggle({
Name = "OnTop Teleport",
Default = false,
Callback = function(Value)
        method.Top = Value
end})

T5:AddToggle({
Name = "Under Teleport",
Default = false,
Callback = function(Value)
        method.Under = Value
end})

T5:AddToggle({
Name = "Behind Teleport",
Default = false,
Callback = function(Value)
        method.Behind = Value
end})

T5:AddToggle({
Name = "Teleport Method",
Default = false,
Callback = function(Value)
        method.Teleport = Value
end})

--[[T5:AddToggle({
Name = "Start Teleport",
Default = false,
Callback = function(Value)
_G.StartTP = Value
      while wait() do
        if _G.StartTP == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                Teleport(c.HumanoidRootPart)
            end)
          end)
      end
end    
})
]]

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

T2:AddToggle({
Name = "Enter Dungeon",
Default = false,
Callback = function(Value)
_G.dngn = Value
      while wait(1) do
        if _G.dngn == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["DungeonService"]["RF"]["Enter_Level"]:InvokeServer(LocPlayer:GetAttribute("DungeonLevel"))
      end
  end})

local function KillEnemy(str,full)
if #str["Enemy_Folder"]:GetChildren() == 1 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full})
elseif #str["Enemy_Folder"]:GetChildren() == 2 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 3 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 4 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 5 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 6 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 7 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 8 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 9 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 10 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full,full,full})
end
end

T1:AddToggle({
Name = "Auto Kill V1",
Default = false,
Callback = function(Value)
_G.InsKill = Value
      while wait() do
        if _G.InsKill == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                --KillEnemy(v,c)
                game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({c,c,c,c,c,c,c,c,c,c})
            end)
          end)
      end
end    
})

T1:AddToggle({
Name = "Auto Kill V2",
Default = false,
Callback = function(Value)
_G.Killmf = Value
      while wait() do
        if _G.Killmf == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer(enemys)
      end
  end})

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
Name = "Teleport To Enemy",
Default = false,
Callback = function(Value)
_G.tte = Value
      while wait() do
        if _G.tte == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                Teleport(c.HumanoidRootPart)
            end)
          end)
      end
end    
})

T4:AddToggle({
Name = "Bring Asshole V1 [Testing]",
Default = false,
Callback = function(Value)
_G.bringAsshole1 = Value
      while wait() do
        if _G.bringAsshole1 == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                NpcCFrame(c)
            end)
          end)
      end
end    
})

T4:AddToggle({
Name = "Bring Asshole V2 [Testing]",
Default = false,
Callback = function(Value)
_G.bringAsshole2 = Value
      while wait() do
        if _G.bringAsshole2 == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                SafeNPC(c)
            end)
          end)
      end
end    
})

T4:AddToggle({
Name = "Freeze NPC [Testing]",
Default = false,
Callback = function(Value)
_G.Freeze = Value
      while wait() do
        if _G.Freeze == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                c.Humanoid.WalkSpeed = 0
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
