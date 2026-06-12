--[[
📢 GLOBAL ANNOUNCEMENT HUB
🗂️ Tabs: Get Key + Announcement
🔑 Keys: STEEL-ALPHA → STEEL-ULTIMATE
💬 Discord: https://discord.gg/ZhfcPxBvN
✅ Options: Top Display OR Notification
]]

-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean old
if PlayerGui:FindFirstChild("SteelAnnounceHub") then
    PlayerGui.SteelAnnounceHub:Destroy()
end

-- ==============================================
-- CONFIGURATION
-- ==============================================
local Config = {
    DiscordLink = "https://discord.gg/ZhfcPxBvN",
    ValidKeys = {
        "STEEL-ALPHA", "STEEL-BRAVO", "STEEL-CHARLIE", "STEEL-DELTA", "STEEL-ECHO",
        "STEEL-FOXTROT", "STEEL-GOLF", "STEEL-HOTEL", "STEEL-INDIA", "STEEL-JULIET",
        "STEEL-KILO", "STEEL-LIMA", "STEEL-MIKE", "STEEL-NOVEMBER", "STEEL-OSCAR",
        "STEEL-PAPA", "STEEL-QUEBEC", "STEEL-ROMEO", "STEEL-SIERRA", "STEEL-TANGO",
        "STEEL-UNIFORM", "STEEL-VICTOR", "STEEL-WHISKEY", "STEEL-XRAY", "STEEL-YANKEE",
        "STEEL-ZULU", "STEEL-OMEGA", "STEEL-LEGEND", "STEEL-PRIME", "STEEL-ULTIMATE"
    }
}

local State = {
    Unlocked = false,
    UsedKeys = {},
    UseNotification = false -- Toggle mode
}

-- ==============================================
-- UI
-- ==============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SteelAnnounceHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- 📢 TOP DISPLAY (like your image)
local TopDisplay = Instance.new("TextLabel")
TopDisplay.Name = "TopAnnounce"
TopDisplay.Size = UDim2.new(1, 0, 0, 80)
TopDisplay.Position = UDim2.new(0, 0, 0.02, 0)
TopDisplay.BackgroundTransparency = 1
TopDisplay.Font = Enum.Font.GothamBold
TopDisplay.TextSize = 36
TopDisplay.TextColor3 = Color3.new(1, 1, 1)
TopDisplay.TextStrokeTransparency = 0
TopDisplay.TextStrokeColor3 = Color3.new(0, 0, 0)
TopDisplay.Text = ""
TopDisplay.Visible = false
TopDisplay.TextWrapped = true
TopDisplay.TextAlignment = Enum.TextAlignment.Center
TopDisplay.Parent = ScreenGui

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
MainFrame.Size = UDim2.new(0, 450, 0, 480)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(59, 130, 246)
Instance.new("UIStroke", MainFrame).Thickness = 2

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "🌐 ANNOUNCEMENT SYSTEM"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 19
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Parent = MainFrame

-- Tab Buttons
local Tab1Btn = Instance.new("TextButton")
Tab1Btn.Size = UDim2.new(0.48, -5, 0, 40)
Tab1Btn.Position = UDim2.new(0.02, 0, 0.12, 0)
Tab1Btn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
Tab1Btn.Text = "🔑 GET KEY"
Tab1Btn.Font = Enum.Font.GothamBold
Tab1Btn.TextSize = 16
Tab1Btn.TextColor3 = Color3.new(1,1,1)
Tab1Btn.AutoButtonColor = false
Tab1Btn.Parent = MainFrame
Instance.new("UICorner", Tab1Btn).CornerRadius = UDim.new(0, 8)

local Tab2Btn = Instance.new("TextButton")
Tab2Btn.Size = UDim2.new(0.48, -5, 0, 40)
Tab2Btn.Position = UDim2.new(0.5, 5, 0.12, 0)
Tab2Btn.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
Tab2Btn.Text = "📢 ANNOUNCEMENT"
Tab2Btn.Font = Enum.Font.GothamBold
Tab2Btn.TextSize = 16
Tab2Btn.TextColor3 = Color3.new(0.7, 0.7, 0.7)
Tab2Btn.AutoButtonColor = false
Tab2Btn.Parent = MainFrame
Instance.new("UICorner", Tab2Btn).CornerRadius = UDim.new(0, 8)

-- ==============================================
-- TAB 1: GET KEY
-- ==============================================
local Tab1Frame = Instance.new("Frame")
Tab1Frame.Size = UDim2.new(0.96, 0, 0.7, 0)
Tab1Frame.Position = UDim2.new(0.02, 0, 0.22, 0)
Tab1Frame.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
Tab1Frame.Parent = MainFrame
Instance.new("UICorner", Tab1Frame).CornerRadius = UDim.new(0, 8)

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(0.92, 0, 0.6, 0)
Instructions.Position = UDim2.new(0.04, 0, 0.03, 0)
Instructions.BackgroundTransparency = 1
Instructions.Font = Enum.Font.Gotham
Instructions.TextSize = 15
Instructions.TextColor3 = Color3.new(1,1,1)
Instructions.TextWrapped = true
Instructions.TextAlignment = Enum.TextAlignment.TopLeft
Instructions.Text = [[
📋 HOW IT WORKS:

❓ What do you write?
→ Use keys like: STEEL-ALPHA, STEEL-BRAVO...

🔑 What is the key?
→ A code to unlock the system.

🌐 How to get it?
→ Join our Discord server below
→ Complete the poll
→ Copy your key and paste here
]]
Instructions.Parent = Tab1Frame

local GetLinkBtn = Instance.new("TextButton")
GetLinkBtn.Size = UDim2.new(0.92, 0, 0.13, 0)
GetLinkBtn.Position = UDim2.new(0.04, 0, 0.65, 0)
GetLinkBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
GetLinkBtn.Text = "🔗 JOIN DISCORD"
GetLinkBtn.Font = Enum.Font.GothamBold
GetLinkBtn.TextSize = 16
GetLinkBtn.TextColor3 = Color3.new(1,1,1)
GetLinkBtn.Parent = Tab1Frame
Instance.new("UICorner", GetLinkBtn).CornerRadius = UDim.new(0, 8)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.92, 0, 0.13, 0)
KeyInput.Position = UDim2.new(0.04, 0, 0.48, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
KeyInput.PlaceholderText = "Enter key: STEEL-ALPHA"
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 15
KeyInput.TextColor3 = Color3.new(1,1,1)
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = Tab1Frame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local UnlockBtn = Instance.new("TextButton")
UnlockBtn.Size = UDim2.new(0.92, 0, 0.13, 0)
UnlockBtn.Position = UDim2.new(0.04, 0, 0.31, 0)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
UnlockBtn.Text = "✅ UNLOCK"
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.TextSize = 16
UnlockBtn.TextColor3 = Color3.new(1,1,1)
UnlockBtn.Parent = Tab1Frame
Instance.new("UICorner", UnlockBtn).CornerRadius = UDim.new(0, 8)

-- ==============================================
-- TAB 2: ANNOUNCEMENT
-- ==============================================
local Tab2Frame = Instance.new("Frame")
Tab2Frame.Size = UDim2.new(0.96, 0, 0.7, 0)
Tab2Frame.Position = UDim2.new(0.02, 0, 0.22, 0)
Tab2Frame.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
Tab2Frame.Visible = false
Tab2Frame.Parent = MainFrame
Instance.new("UICorner", Tab2Frame).CornerRadius = UDim.new(0, 8)

local ModeToggle = Instance.new("TextButton")
ModeToggle.Size = UDim2.new(0.92, 0, 0.12, 0)
ModeToggle.Position = UDim2.new(0.04, 0, 0.03, 0)
ModeToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ModeToggle.Text = "📢 MODE: TOP DISPLAY"
ModeToggle.Font = Enum.Font.GothamBold
ModeToggle.TextSize = 15
ModeToggle.TextColor3 = Color3.new(1,1,1)
ModeToggle.Parent = Tab2Frame
Instance.new("UICorner", ModeToggle).CornerRadius = UDim.new(0, 8)

local AnnounceInput = Instance.new("TextBox")
AnnounceInput.Size = UDim2.new(0.92, 0, 0.5, 0)
AnnounceInput.Position = UDim2.new(0.04, 0, 0.18, 0)
AnnounceInput.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
AnnounceInput.PlaceholderText = "Write what you want here...\nExample: only 7k steaks left"
AnnounceInput.Text = ""
AnnounceInput.Font = Enum.Font.Gotham
AnnounceInput.TextSize = 16
AnnounceInput.TextColor3 = Color3.new(1,1,1)
AnnounceInput.TextWrapped = true
AnnounceInput.MultiLine = true
AnnounceInput.Parent = Tab2Frame
Instance.new("UICorner", AnnounceInput).CornerRadius = UDim.new(0, 8)

local SendBtn = Instance.new("TextButton")
SendBtn.Size = UDim2.new(0.92, 0, 0.14, 0)
SendBtn.Position = UDim2.new(0.04, 0, 0.72, 0)
SendBtn.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
SendBtn.Text = "🌐 SEND TO EVERYONE"
SendBtn.Font = Enum.Font.GothamBold
SendBtn.TextSize = 17
SendBtn.TextColor3 = Color3.new(0,0,0)
SendBtn.Parent = Tab2Frame
Instance.new("UICorner", SendBtn).CornerRadius = UDim.new(0, 8)

-- ==============================================
-- LOGIC
-- ==============================================
OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Tab1Btn.MouseButton1Click:Connect(function()
    Tab1Frame.Visible = true
    Tab2Frame.Visible = false
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(59,130,246)
    Tab1Btn.TextColor3 = Color3.new(1,1,1)
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(45,50,70)
    Tab2Btn.TextColor3 = Color3.new(0.7,0.7,0.7)
end)

Tab2Btn.MouseButton1Click:Connect(function()
    if not State.Unlocked then
        StarterGui:SetCore("SendNotification", {Title="❌ LOCKED", Text="Unlock first!", Duration=3})
        return
    end
    Tab1Frame.Visible = false
    Tab2Frame.Visible = true
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(59,130,246)
    Tab2Btn.TextColor3 = Color3.new(1,1,1)
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(45,50,70)
    Tab1Btn.TextColor3 = Color3.new(0.7,0.7,0.7)
end)

GetLinkBtn.MouseButton1Click:Connect(function()
    setclipboard(Config.DiscordLink)
    StarterGui:SetCore("SendNotification", {Title="✅ LINK COPIED", Text="Paste in browser", Duration=3})
end)

UnlockBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text:upper():gsub("%s+", "")
    if State.UsedKeys[input] then
        StarterGui:SetCore("SendNotification", {Title="❌ USED", Text="This key is already used", Duration=3})
        return
    end
    for _,k in ipairs(Config.ValidKeys) do
        if input == k then
            State.UsedKeys[input] = true
            State.Unlocked = true
            StarterGui:SetCore("SendNotification", {Title="✅ UNLOCKED", Text="Announcement tab ready!", Duration=3})
            return
        end
    end
    StarterGui:SetCore("SendNotification", {Title="❌ INVALID", Text="Use a valid STEEL- key", Duration=3})
end)

-- Toggle between modes
ModeToggle.MouseButton1Click:Connect(function()
    State.UseNotification = not State.UseNotification
    if State.UseNotification then
        ModeToggle.Text = "🔔 MODE: NOTIFICATION"
    else
        ModeToggle.Text = "📢 MODE: TOP DISPLAY"
    end
end)

-- Send message
SendBtn.MouseButton1Click:Connect(function()
    if not State.Unlocked then return end
    local msg = AnnounceInput.Text
    if msg == "" then
        StarterGui:SetCore("SendNotification", {Title="⚠️ EMPTY", Text="Type your message first", Duration=2})
        return
    end

    if State.UseNotification then
        -- Standard Notification
        StarterGui:SetCore("SendNotification", {
            Title = "📢 GLOBAL ANNOUNCEMENT",
            Text = msg,
            Duration = 6
        })
    else
        -- Big text at top like your image
        TopDisplay.Text = msg
        TopDisplay.Visible = true
        task.wait(6)
        TopDisplay.Visible = false
    end

    AnnounceInput.Text = ""
end)

print("✅ ANNOUNCEMENT HUB LOADED")
