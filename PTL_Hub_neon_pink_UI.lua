--========================================================
-- PTL HUB - NEON PINK UI
-- Giao diện mô phỏng mẫu thiết kế: sidebar + cards + footer
-- Chỉ chứa UI/callback mẫu
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local parentGui = player:WaitForChild("PlayerGui")

local old = parentGui:FindFirstChild("PTL_NeonHub")
if old then old:Destroy() end

local PINK = Color3.fromRGB(255, 45, 155)
local PINK2 = Color3.fromRGB(255, 105, 190)
local WHITE = Color3.fromRGB(248, 245, 248)
local MUTED = Color3.fromRGB(185, 170, 182)
local BLACK = Color3.fromRGB(8, 8, 11)
local PANEL = Color3.fromRGB(15, 13, 18)
local CARD = Color3.fromRGB(22, 17, 25)

local gui = Instance.new("ScreenGui")
gui.Name = "PTL_NeonHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = parentGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(620, 380)
main.Position = UDim2.new(.5, -310, .5, -190)
main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 16)

local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = PINK
mainStroke.Thickness = 2
mainStroke.Transparency = .08

-- top bar
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 52)
top.BackgroundColor3 = Color3.fromRGB(11, 10, 14)
top.BorderSizePixel = 0
top.Parent = main

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 1)
topLine.Position = UDim2.new(0, 0, 1, -1)
topLine.BackgroundColor3 = PINK
topLine.BackgroundTransparency = .45
topLine.BorderSizePixel = 0
topLine.Parent = top

local title = Instance.new("TextLabel")
title.Size = UDim2.fromOffset(210, 30)
title.Position = UDim2.fromOffset(18, 6)
title.BackgroundTransparency = 1
title.Text = "PTL HUB"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = WHITE
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = top

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.fromOffset(220, 16)
subtitle.Position = UDim2.fromOffset(19, 31)
subtitle.BackgroundTransparency = 1
subtitle.Text = "ROBLOX SCRIPT"
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.TextColor3 = PINK2
subtitle.TextSize = 10
subtitle.Font = Enum.Font.GothamMedium
subtitle.Parent = top

local min = Instance.new("TextButton")
min.Size = UDim2.fromOffset(34, 30)
min.Position = UDim2.new(1, -78, 0, 11)
min.BackgroundColor3 = PANEL
min.Text = "—"
min.TextColor3 = PINK2
min.TextSize = 18
min.Font = Enum.Font.GothamBold
min.Parent = top
Instance.new("UICorner", min).CornerRadius = UDim.new(0, 8)

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(34, 30)
close.Position = UDim2.new(1, -40, 0, 11)
close.BackgroundColor3 = PANEL
close.Text = "×"
close.TextColor3 = PINK2
close.TextSize = 22
close.Font = Enum.Font.GothamBold
close.Parent = top
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

-- sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(170, 286)
sidebar.Position = UDim2.fromOffset(10, 62)
sidebar.BackgroundColor3 = PANEL
sidebar.BorderSizePixel = 0
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local sideStroke = Instance.new("UIStroke", sidebar)
sideStroke.Color = PINK
sideStroke.Transparency = .75

local sideLayout = Instance.new("UIListLayout", sidebar)
sideLayout.Padding = UDim.new(0, 7)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
local sidePad = Instance.new("UIPadding", sidebar)
sidePad.PaddingTop = UDim.new(0, 10)

-- content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -200, 0, 286)
content.Position = UDim2.fromOffset(190, 62)
content.BackgroundTransparency = 1
content.Parent = main

local heading = Instance.new("TextLabel")
heading.Size = UDim2.new(1, 0, 0, 34)
heading.BackgroundTransparency = 1
heading.Text = "Thông Tin"
heading.TextXAlignment = Enum.TextXAlignment.Left
heading.TextColor3 = WHITE
heading.TextSize = 24
heading.Font = Enum.Font.GothamBold
heading.Parent = content

local headingSub = Instance.new("TextLabel")
headingSub.Size = UDim2.new(1, 0, 0, 20)
headingSub.Position = UDim2.fromOffset(0, 31)
headingSub.BackgroundTransparency = 1
headingSub.Text = "Kết nối với cộng đồng của chúng tôi"
headingSub.TextXAlignment = Enum.TextXAlignment.Left
headingSub.TextColor3 = MUTED
headingSub.TextSize = 12
headingSub.Font = Enum.Font.Gotham
headingSub.Parent = content

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, 0, 0, 1)
divider.Position = UDim2.fromOffset(0, 57)
divider.BackgroundColor3 = PINK
divider.BackgroundTransparency = .35
divider.BorderSizePixel = 0
divider.Parent = content

local cards = Instance.new("Frame")
cards.Size = UDim2.new(1, 0, 1, -68)
cards.Position = UDim2.fromOffset(0, 68)
cards.BackgroundTransparency = 1
cards.Parent = content

local cardLayout = Instance.new("UIListLayout", cards)
cardLayout.Padding = UDim.new(0, 9)

local function addCard(name, desc, buttonText, callback)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 59)
    card.BackgroundColor3 = CARD
    card.BorderSizePixel = 0
    card.Parent = cards
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 11)

    local stroke = Instance.new("UIStroke", card)
    stroke.Color = PINK
    stroke.Transparency = .38
    stroke.Thickness = 1

    local n = Instance.new("TextLabel")
    n.Size = UDim2.new(1, -130, 0, 24)
    n.Position = UDim2.fromOffset(15, 7)
    n.BackgroundTransparency = 1
    n.Text = name
    n.TextXAlignment = Enum.TextXAlignment.Left
    n.TextColor3 = WHITE
    n.TextSize = 15
    n.Font = Enum.Font.GothamBold
    n.Parent = card

    local d = Instance.new("TextLabel")
    d.Size = UDim2.new(1, -130, 0, 18)
    d.Position = UDim2.fromOffset(15, 31)
    d.BackgroundTransparency = 1
    d.Text = desc
    d.TextXAlignment = Enum.TextXAlignment.Left
    d.TextColor3 = MUTED
    d.TextSize = 11
    d.Font = Enum.Font.Gotham
    d.Parent = card

    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(102, 34)
    b.Position = UDim2.new(1, -114, .5, -17)
    b.BackgroundColor3 = Color3.fromRGB(31, 15, 28)
    b.Text = buttonText
    b.TextColor3 = WHITE
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.Parent = card
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 9)

    local bs = Instance.new("UIStroke", b)
    bs.Color = PINK
    bs.Thickness = 1.5

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(.12), {BackgroundColor3 = Color3.fromRGB(65, 18, 48)}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(.12), {BackgroundColor3 = Color3.fromRGB(31, 15, 28)}):Play()
    end)
    b.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
end

local pages = {
    ["Thông Tin"] = function()
        heading.Text = "Thông Tin"
        headingSub.Text = "Kết nối với cộng đồng của chúng tôi"
        for _,v in ipairs(cards:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
        addCard("Discord", "THÍCH HACK GAME", "SAO CHÉP LINK", function() print("Discord selected") end)
        addCard("Youtuber", "ZEUSz Roblox", "SAO CHÉP LINK", function() print(" https://youtu.be/Zwmm3zIpYVk?si=scnlgKooXwL0M0B2") end)
        addCard("Youtuber", "T TEAM", "SAO CHÉP LINK", function() print("YouTube selected") end)
    end,
    ["Script PRE"] = function()
        heading.Text = "Script PRE"
        headingSub.Text = "Danh sách script premium"
        for _,v in ipairs(cards:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
        addCard("BANANA PREMIUM", "Premium Script", "RUN", function() print(" loadstring(game:HttpGet("https://isnahamzah.site/SubscribeYTisnahamzah/gantenghub30"))()") end)
        addCard("MARU PREMIUM", "Premium Script", "RUN", function() print("Maru selected") end)
        addCard("W_AZURE PREMIUM", "Premium Script", "RUN", function() print("W Azure selected") end)
    end,
    ["SCRIPT KAITUN"] = function()
        heading.Text = "SCRIPT KAITUN"
        headingSub.Text = "Danh sách Kaitun"
        for _,v in ipairs(cards:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
        addCard("KAITUN BANANA", "Kaitun Script", "RUN", function() print("Kaitun Banana selected") end)
        addCard("KAITUN MARU", "Kaitun Script", "RUN", function() print("Kaitun Maru selected") end)
    end,
    ["SCRIPT AUTO BOUNTY"] = function()
        heading.Text = "SCRIPT AUTO BOUNTY"
        headingSub.Text = "Danh sách Auto Bounty"
        for _,v in ipairs(cards:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy() end end
        addCard("AUTO BOUNTY BANANA", "Auto Bounty", "RUN", function() print("Auto Bounty selected") end)
    end
}

local function addTab(name)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -16, 0, 48)
    b.BackgroundColor3 = Color3.fromRGB(18, 15, 21)
    b.Text = name
    b.TextColor3 = WHITE
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.Parent = sidebar
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)

    local st = Instance.new("UIStroke", b)
    st.Color = PINK
    st.Transparency = .72

    b.MouseButton1Click:Connect(function()
        if pages[name] then pages[name]() end
    end)
end

addTab("Thông Tin")
addTab("Script PRE")
addTab("SCRIPT KAITUN")
addTab("SCRIPT AUTO BOUNTY")

-- footer
local footerLine = Instance.new("Frame")
footerLine.Size = UDim2.new(1, -20, 0, 1)
footerLine.Position = UDim2.new(0, 10, 1, -26)
footerLine.BackgroundColor3 = PINK
footerLine.BackgroundTransparency = .45
footerLine.BorderSizePixel = 0
footerLine.Parent = main

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 24)
footer.Position = UDim2.new(0, 0, 1, -25)
footer.BackgroundTransparency = 1
footer.Text = "SCRIPT BY PTL"
footer.TextColor3 = PINK2
footer.TextSize = 13
footer.Font = Enum.Font.GothamBold
footer.Parent = main

-- close/minimize
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minimized = false
min.MouseButton1Click:Connect(function()
    minimized = not minimized
    sidebar.Visible = not minimized
    content.Visible = not minimized
    footer.Visible = not minimized
    footerLine.Visible = not minimized
    TweenService:Create(main, TweenInfo.new(.2), {
        Size = minimized and UDim2.fromOffset(620, 52) or UDim2.fromOffset(620, 380)
    }):Play()
end)

-- simple drag support
local dragging, dragStart, startPos
top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
top.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

pages["Thông Tin"]()
