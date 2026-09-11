local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 80, 170)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id= 103035663943878"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "PR Script",
    SubTitle = "Beta • SCRIPT BY PTL",
    TabWidth = 150,
    Size = UDim2.fromOffset(540, 360),
    Acrylic = true,
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.End
})


--==================================================
-- PTL FONT OVERRIDE
-- Chỉ thay đổi font chữ của UI
--==================================================
task.spawn(function()
    task.wait(1)

    local function applyFont(obj)
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            pcall(function()
                obj.Font = Enum.Font.GothamMedium
            end)
        end
    end

    for _, obj in ipairs(game.CoreGui:GetDescendants()) do
        applyFont(obj)
    end

    game.CoreGui.DescendantAdded:Connect(function(obj)
        task.wait()
        applyFont(obj)
    end)
end)


local Tabs = {
        Main0=Window:AddTab({ Title="Thông Tin" }),
        Main1=Window:AddTab({ Title="Script PRE" }),
        Main2=Window:AddTab({ Title="SCRIPT KAITUN" }), 
        Main3=Window:AddTab({ Title="SCRIPT AUTO BOUNTY" }),           
}
    Tabs.Main0:AddButton({
    Title = "Discord",
    Description = "THÍCH HACK GAME",
    Callback = function()
        setclipboard("https://discord.com/invite/6Zv652ntHK")
    end
})

    Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "ZEUSz Roblox",
    Callback = function()
        setclipboard("https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o")
    end
})

    Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "T TEAM",
    Callback = function()
        setclipboard("https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o")
    end
})
    
    Tabs.Main1:AddButton({
    Title="BANANA PREMIUM",
    Description="",
    Callback=function()
	  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().Key = "1e2c6eaa74d3f18e7b5f2105" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="MARU PREMIUM",
    Description="",
    Callback=function()
local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end
})

Tabs.Main1:AddButton({
    Title="W_AZURE PREMIUM",
    Description="",
    Callback=function()
local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end
})

Tabs.Main2:AddButton({
    Title="KAITUN BANANA",
    Description="",
    Callback=function()
local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end
})

Tabs.Main2:AddButton({
    Title="KAITUN MARU",
    Description="",
    Callback=function()
local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end
})

Tabs.Main3:AddButton({
    Title="AUTO BOUNTY BANANA",
    Description="",
    Callback=function()
local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end
})