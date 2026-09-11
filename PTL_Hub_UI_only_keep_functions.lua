--========================================================
-- PTL HUB
-- UI redesigned only
-- Existing button functions/callback logic preserved
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

repeat wait() until game:IsLoaded()

local player = Players.LocalPlayer
local guiParent = game.CoreGui

local old = guiParent:FindFirstChild("PTL_HUB")
if old then
    old:Destroy()
end

local PINK = Color3.fromRGB(255, 45, 155)
local PINK2 = Color3.fromRGB(255, 120, 195)
local BG = Color3.fromRGB(8, 8, 11)
local PANEL = Color3.fromRGB(16, 13, 19)
local CARD = Color3.fromRGB(23, 18, 27)
local WHITE = Color3.fromRGB(248, 248, 248)
local MUTED = Color3.fromRGB(190, 180, 190)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PTL_HUB"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

--========================================================
-- FLOATING OPEN BUTTON
--========================================================

local Floating = Instance.new("TextButton")
Floating.Size = UDim2.fromOffset(46, 46)
Floating.Position = UDim2.new(0.04, 0, 0.22, 0)
Floating.BackgroundColor3 = PINK
Floating.BorderSizePixel = 0
Floating.Text = "PTL"
Floating.TextColor3 = Color3.fromRGB(255,255,255)
Floating.TextSize = 12
Floating.Font = Enum.Font.GothamBold
Floating.Draggable = true
Floating.Parent = ScreenGui

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = Floating

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = PINK2
FloatStroke.Thickness = 2
FloatStroke.Parent = Floating

--========================================================
-- MAIN WINDOW
--========================================================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(620, 380)
Main.Position = UDim2.new(0.5, -310, 0.5, -190)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = PINK
MainStroke.Thickness = 2
MainStroke.Transparency = 0.05
MainStroke.Parent = Main

--========================================================
-- TOP BAR
--========================================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 56)
TopBar.BackgroundColor3 = Color3.fromRGB(11, 10, 14)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(260, 30)
Title.Position = UDim2.fromOffset(20, 6)
Title.BackgroundTransparency = 1
Title.Text = "PTL HUB"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = WHITE
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = TopBar

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.fromOffset(280, 18)
SubTitle.Position = UDim2.fromOffset(21, 33)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "SCRIPT CENTER"
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.TextColor3 = PINK2
SubTitle.TextSize = 10
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.Parent = TopBar

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(34, 30)
Minimize.Position = UDim2.new(1, -82, 0, 13)
Minimize.BackgroundColor3 = PANEL
Minimize.Text = "—"
Minimize.TextColor3 = PINK2
Minimize.TextSize = 18
Minimize.Font = Enum.Font.GothamBold
Minimize.Parent = TopBar
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(0, 8)

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(34, 30)
Close.Position = UDim2.new(1, -42, 0, 13)
Close.BackgroundColor3 = PANEL
Close.Text = "×"
Close.TextColor3 = PINK2
Close.TextSize = 22
Close.Font = Enum.Font.GothamBold
Close.Parent = TopBar
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 1)
TopLine.Position = UDim2.new(0, 0, 1, -1)
TopLine.BackgroundColor3 = PINK
TopLine.BackgroundTransparency = 0.45
TopLine.BorderSizePixel = 0
TopLine.Parent = TopBar

--========================================================
-- SIDEBAR
--========================================================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.fromOffset(178, 286)
Sidebar.Position = UDim2.fromOffset(10, 66)
Sidebar.BackgroundColor3 = PANEL
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local SidebarStroke = Instance.new("UIStroke")
SidebarStroke.Color = PINK
SidebarStroke.Transparency = 0.72
SidebarStroke.Parent = Sidebar

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0, 8)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.Parent = Sidebar

--========================================================
-- CONTENT
--========================================================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -208, 0, 286)
Content.Position = UDim2.fromOffset(198, 66)
Content.BackgroundTransparency = 1
Content.Parent = Main

local PageTitle = Instance.new("TextLabel")
PageTitle.Size = UDim2.new(1, 0, 0, 34)
PageTitle.BackgroundTransparency = 1
PageTitle.Text = "Thông Tin"
PageTitle.TextXAlignment = Enum.TextXAlignment.Left
PageTitle.TextColor3 = WHITE
PageTitle.TextSize = 23
PageTitle.Font = Enum.Font.GothamBold
PageTitle.Parent = Content

local PageSub = Instance.new("TextLabel")
PageSub.Size = UDim2.new(1, 0, 0, 20)
PageSub.Position = UDim2.fromOffset(0, 32)
PageSub.BackgroundTransparency = 1
PageSub.Text = "Kết nối với cộng đồng"
PageSub.TextXAlignment = Enum.TextXAlignment.Left
PageSub.TextColor3 = MUTED
PageSub.TextSize = 11
PageSub.Font = Enum.Font.Gotham
PageSub.Parent = Content

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.fromOffset(0, 58)
HeaderLine.BackgroundColor3 = PINK
HeaderLine.BackgroundTransparency = 0.38
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = Content

local List = Instance.new("ScrollingFrame")
List.Size = UDim2.new(1, 0, 1, -68)
List.Position = UDim2.fromOffset(0, 68)
List.BackgroundTransparency = 1
List.BorderSizePixel = 0
List.ScrollBarThickness = 3
List.ScrollBarImageColor3 = PINK
List.AutomaticCanvasSize = Enum.AutomaticSize.Y
List.CanvasSize = UDim2.new()
List.Parent = Content

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 8)
ListLayout.Parent = List

--========================================================
-- HELPERS
--========================================================

local function clearList()
    for _, child in ipairs(List:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

local function addCard(titleText, descText, buttonText, callback)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -4, 0, 62)
    Card.BackgroundColor3 = CARD
    Card.BorderSizePixel = 0
    Card.Parent = List

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 11)
    corner.Parent = Card

    local stroke = Instance.new("UIStroke")
    stroke.Color = PINK
    stroke.Transparency = 0.38
    stroke.Parent = Card

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -132, 0, 24)
    Name.Position = UDim2.fromOffset(14, 8)
    Name.BackgroundTransparency = 1
    Name.Text = titleText
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.TextColor3 = WHITE
    Name.TextSize = 14
    Name.Font = Enum.Font.GothamBold
    Name.Parent = Card

    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -132, 0, 18)
    Desc.Position = UDim2.fromOffset(14, 33)
    Desc.BackgroundTransparency = 1
    Desc.Text = descText
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextColor3 = MUTED
    Desc.TextSize = 11
    Desc.Font = Enum.Font.Gotham
    Desc.Parent = Card

    local Run = Instance.new("TextButton")
    Run.Size = UDim2.fromOffset(106, 34)
    Run.Position = UDim2.new(1, -118, 0.5, -17)
    Run.BackgroundColor3 = Color3.fromRGB(34, 16, 30)
    Run.Text = buttonText
    Run.TextColor3 = WHITE
    Run.TextSize = 11
    Run.Font = Enum.Font.GothamBold
    Run.Parent = Card

    local rcorner = Instance.new("UICorner")
    rcorner.CornerRadius = UDim.new(0, 9)
    rcorner.Parent = Run

    local rstroke = Instance.new("UIStroke")
    rstroke.Color = PINK
    rstroke.Thickness = 1.4
    rstroke.Parent = Run

    Run.MouseEnter:Connect(function()
        TweenService:Create(Run, TweenInfo.new(0.12), {
            BackgroundColor3 = Color3.fromRGB(72, 20, 54)
        }):Play()
    end)

    Run.MouseLeave:Connect(function()
        TweenService:Create(Run, TweenInfo.new(0.12), {
            BackgroundColor3 = Color3.fromRGB(34, 16, 30)
        }):Play()
    end)

    Run.MouseButton1Click:Connect(callback)
end

local pages = {}

--========================================================
-- ORIGINAL FUNCTIONS PRESERVED
--========================================================

pages["Thông Tin"] = function()
    clearList()
    PageTitle.Text = "Thông Tin"
    PageSub.Text = "Kết nối với cộng đồng"

    addCard("Discord", "THÍCH HACK GAME", "SAO CHÉP LINK", function()
        setclipboard("https://discord.com/invite/6Zv652ntHK")
    end)

    addCard("Youtuber", "ZEUSz Roblox", "SAO CHÉP LINK", function()
        setclipboard("https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o")
    end)

    addCard("Youtuber", "T TEAM", "SAO CHÉP LINK", function()
        setclipboard("https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o")
    end)
end

pages["Script PRE"] = function()
    clearList()
    PageTitle.Text = "Script PRE"
    PageSub.Text = "Danh sách script premium"

    addCard("BANANA PREMIUM", "", "RUN", function()
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        getgenv().Key = "1e2c6eaa74d3f18e7b5f2105"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
    end)

    addCard("MARU PREMIUM", "", "RUN", function()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
        }

        getgenv().BETA_VERSION = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end)

    addCard("W_AZURE PREMIUM", "", "RUN", function()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
        }

        getgenv().BETA_VERSION = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end)
end

pages["SCRIPT KAITUN"] = function()
    clearList()
    PageTitle.Text = "SCRIPT KAITUN"
    PageSub.Text = "Danh sách Kaitun"

    addCard("KAITUN BANANA", "", "RUN", function()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
        }

        getgenv().BETA_VERSION = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end)

    addCard("KAITUN MARU", "", "RUN", function()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
        }

        getgenv().BETA_VERSION = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end)
end

pages["SCRIPT AUTO BOUNTY"] = function()
    clearList()
    PageTitle.Text = "SCRIPT AUTO BOUNTY"
    PageSub.Text = "Danh sách Auto Bounty"

    addCard("AUTO BOUNTY BANANA", "", "RUN", function()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
        }

        getgenv().BETA_VERSION = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
    end)
end

local function addTab(name)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -18, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(20, 16, 23)
    Button.Text = name
    Button.TextColor3 = WHITE
    Button.TextSize = 12
    Button.Font = Enum.Font.GothamBold
    Button.Parent = Sidebar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = Button

    local stroke = Instance.new("UIStroke")
    stroke.Color = PINK
    stroke.Transparency = 0.72
    stroke.Parent = Button

    Button.MouseButton1Click:Connect(function()
        if pages[name] then
            pages[name]()
        end
    end)
end

addTab("Thông Tin")
addTab("Script PRE")
addTab("SCRIPT KAITUN")
addTab("SCRIPT AUTO BOUNTY")

--========================================================
-- FOOTER
--========================================================

local FooterLine = Instance.new("Frame")
FooterLine.Size = UDim2.new(1, -20, 0, 1)
FooterLine.Position = UDim2.new(0, 10, 1, -27)
FooterLine.BackgroundColor3 = PINK
FooterLine.BackgroundTransparency = 0.42
FooterLine.BorderSizePixel = 0
FooterLine.Parent = Main

local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, 0, 0, 25)
Footer.Position = UDim2.new(0, 0, 1, -26)
Footer.BackgroundTransparency = 1
Footer.Text = "SCRIPT BY PTL"
Footer.TextColor3 = PINK2
Footer.TextSize = 13
Footer.Font = Enum.Font.GothamBold
Footer.Parent = Main

--========================================================
-- WINDOW CONTROLS
--========================================================

local minimized = false

local function setVisible(state)
    Sidebar.Visible = state
    Content.Visible = state
    Footer.Visible = state
    FooterLine.Visible = state
end

Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        setVisible(false)
        TweenService:Create(Main, TweenInfo.new(0.2), {
            Size = UDim2.fromOffset(620, 56)
        }):Play()
    else
        TweenService:Create(Main, TweenInfo.new(0.2), {
            Size = UDim2.fromOffset(620, 380)
        }):Play()
        task.wait(0.18)
        setVisible(true)
    end
end)

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

Floating.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

-- drag
local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

TopBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

pages["Thông Tin"]()
