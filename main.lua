--[[
📢 GLOBAL SERVER ANNOUNCEMENT HUB
🔑 Valid Keys: STEEL-ALPHA to STEEL-ULTIMATE
💬 Official Discord: https://discord.gg/ZhfcPxBvN
⚠️ Educational use only
]]

-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean old UI
if PlayerGui:FindFirstChild("SteelAnnounceHub") then
    PlayerGui.SteelAnnounceHub:Destroy()
end

-- ==============================================
-- CONFIGURATION
-- ==============================================
local Config = {
    DiscordLink = "https://discord.gg/ZhfcPxBvN",
    ValidKeys = {
        "STEEL-ALPHA",
        "STEEL-BRAVO",
        "STEEL-CHARLIE",
        "STEEL-DELTA",
        "STEEL-ECHO",
        "STEEL-FOXTROT",
        "STEEL-GOLF",
        "STEEL-HOTEL",
        "STEEL-INDIA",
        "STEEL-JULIET",
        "STEEL-KILO",
        "STEEL-LIMA",
        "STEEL-MIKE",
        "STEEL-NOVEMBER",
        "STEEL-OSCAR",
        "STEEL-PAPA",
        "STEEL-QUEBEC",
        "STEEL-ROMEO",
        "STEEL-SIERRA",
        "STEEL-TANGO",
        "STEEL-UNIFORM",
        "STEEL-VICTOR",
        "STEEL-WHISKEY",
        "STEEL-XRAY",
        "STEEL-YANKEE",
        "STEEL-ZULU",
        "STEEL-OMEGA",
        "STEEL-LEGEND",
        "STEEL-PRIME",
        "STEEL-ULTIMATE"
    }
}

local State = {
    Unlocked = false,
    UsedKeys = {}
}

-- ==============================================
-- UI
-- ==============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SteelAnnounceHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

-- Open Button
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 60, 0, 60)
OpenBtn.Position = UDim2.new(0.02, 0, 0.35, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
OpenBtn.Text = "📢"
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 28
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.AutoButtonColor = false
OpenBtn.Parent = ScreenGui
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

-- Main Window
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 440)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 27, 36)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(59, 130, 246)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 50)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "🌐 GLOBAL SERVER ANNOUNCEMENT"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Parent = MainFrame

-- ==============================================
-- KEY SYSTEM
-- ==============================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(1, -20, 1, -70)
KeyFrame.Position = UDim2.new(0, 10, 0, 55)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
KeyFrame.Parent = MainFrame
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 10)

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Size = UDim2.new(1, -20, 0, 35)
KeyLabel.Position = UDim2.new(0, 10, 0, 15)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "🔑 ENTER STEEL KEY TO UNLOCK"
KeyLabel.Font = Enum.Font.GothamBold
KeyLabel.TextSize = 16
KeyLabel.TextColor3 = Color3.new(1,1,1)
KeyLabel.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -30, 0, 50)
KeyInput.Position = UDim2.new(0, 15, 0, 55)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
KeyInput.PlaceholderText = "e.g. STEEL-ALPHA"
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 15
KeyInput.TextColor3 = Color3.new(1,1,1)
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = KeyInput
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(1, -30, 0, 45)
GetKeyBtn.Position = UDim2.new(0, 15, 0, 115)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
GetKeyBtn.Text = "🔗 GET KEY FROM DISCORD"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 15
GetKeyBtn.TextColor3 = Color3.new(1,1,1)
GetKeyBtn.Parent = KeyFrame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

local UnlockBtn = Instance.new("TextButton")
UnlockBtn.Size = UDim2.new(1, -30, 0, 45)
UnlockBtn.Position = UDim2.new(0, 15, 0, 170)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
UnlockBtn.Text = "✅ UNLOCK SYSTEM"
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.TextSize = 15
UnlockBtn.TextColor3 = Color3.new(1,1,1)
UnlockBtn.Parent = KeyFrame
Instance.new("UICorner", UnlockBtn).CornerRadius = UDim.new(0, 8)

-- ==============================================
-- ANNOUNCEMENT SYSTEM
-- ==============================================
local AnnounceFrame = Instance.new("Frame")
AnnounceFrame.Size = UDim2.new(1, -20, 1, -70)
AnnounceFrame.Position = UDim2.new(0, 10, 0, 55)
AnnounceFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
AnnounceFrame.Visible = false
AnnounceFrame.Parent = MainFrame
Instance.new("UICorner", AnnounceFrame).CornerRadius = UDim.new(0, 10)

local AnnounceLabel = Instance.new("TextLabel")
AnnounceLabel.Size = UDim2.new(1, -20, 0, 35)
AnnounceLabel.Position = UDim2.new(0, 10, 0, 15)
AnnounceLabel.BackgroundTransparency = 1
AnnounceLabel.Text = "📢 SERVER ANNOUNCEMENT"
AnnounceLabel.Font = Enum.Font.GothamBold
AnnounceLabel.TextSize = 17
AnnounceLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
AnnounceLabel.Parent = AnnounceFrame

local AnnounceInput = Instance.new("TextBox")
AnnounceInput.Size = UDim2.new(1, -30, 0, 120)
AnnounceInput.Position = UDim2.new(0, 15, 0, 55)
AnnounceInput.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
AnnounceInput.PlaceholderText = "Type here... e.g. only 7k steaks left"
AnnounceInput.Text = ""
AnnounceInput.Font = Enum.Font.Gotham
AnnounceInput.TextSize = 15
AnnounceInput.TextColor3 = Color3.new(1,1,1)
AnnounceInput.TextWrapped = true
AnnounceInput.MultiLine = true
AnnounceInput.Parent = AnnounceFrame
Instance.new("UICorner", AnnounceInput).CornerRadius = UDim.new(0, 8)

local SendBtn = Instance.new("TextButton")
SendBtn.Size = UDim2.new(1, -30, 0, 45)
SendBtn.Position = UDim2.new(0, 15, 0, 185)
SendBtn.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
SendBtn.Text = "🌐 SEND GLOBAL ANNOUNCEMENT"
SendBtn.Font = Enum.Font.GothamBold
SendBtn.TextSize = 15
SendBtn.TextColor3 = Color3.new(0,0,0)
SendBtn.Parent = AnnounceFrame
Instance.new("UICorner", SendBtn).CornerRadius = UDim.new(0, 8)

-- ==============================================
-- LOGIC
-- ==============================================
OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(Config.DiscordLink)
    StarterGui:SetCore("SendNotification", {
        Title = "✅ LINK COPIED",
        Text = "Join Discord to get your key!",
        Duration = 3
    })
end)

UnlockBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text:upper():gsub("%s+", "")
    if State.UsedKeys[input] then
        StarterGui:SetCore("SendNotification", {Title = "❌ USED", Text = "This key is already used!", Duration = 3})
        return
    end
    for _, key in ipairs(Config.ValidKeys) do
        if input == key then
            State.UsedKeys[input] = true
            State.Unlocked = true
            StarterGui:SetCore("SendNotification", {Title = "✅ UNLOCKED", Text = "Ready to send announcements!", Duration = 3})
            KeyFrame.Visible = false
            AnnounceFrame.Visible = true
            return
        end
    end
    StarterGui:SetCore("SendNotification", {Title = "❌ INVALID KEY", Text = "Use a valid STEEL- key!", Duration = 3})
end)

SendBtn.MouseButton1Click:Connect(function()
    if not State.Unlocked then return end
    local msg = AnnounceInput.Text
    if msg == "" then
        StarterGui:SetCore("SendNotification", {Title = "⚠️ EMPTY", Text = "Type a message first!", Duration = 2})
        return
    end
    StarterGui:SetCore("SendNotification", {
        Title = "🌐 GLOBAL SERVER ANNOUNCEMENT",
        Text = msg,
        Duration = 7
    })
    AnnounceInput.Text = ""
end)

print("✅ STEEL ANNOUNCE HUB LOADED")
