
local Modules = {connection={}};


local ScreenGui = Instance.new("ScreenGui")
local Item = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Head = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local Framesearch1 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local Talents = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Mantra = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Head2 = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local Framesearch2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local TextBox_2 = Instance.new("TextBox")
local UICorner_5 = Instance.new("UICorner")
local ImageLabel_2 = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local Head3 = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local Framesearch3 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local TextBox_3 = Instance.new("TextBox")
local UICorner_8 = Instance.new("UICorner")
local ImageLabel_3 = Instance.new("ImageLabel")
local UICorner_9 = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local TextLabel_4 = Instance.new("TextLabel")
local Button = Instance.new("Frame")
local ImageButton = Instance.new("ImageButton")
local TextLabel_5 = Instance.new("TextLabel")
local Status = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local Agility = Instance.new("TextLabel")
local Intelligence = Instance.new("TextLabel")
local Willpower = Instance.new("TextLabel")
local Charisma = Instance.new("TextLabel")
local HeavyWep = Instance.new("TextLabel")
local MediumWep = Instance.new("TextLabel")
local LightWep = Instance.new("TextLabel")
local Flamecharm = Instance.new("TextLabel")
local Frostdraw = Instance.new("TextLabel")
local Thundercall = Instance.new("TextLabel")
local Galebreathe = Instance.new("TextLabel")
local Shadowcast = Instance.new("TextLabel")
local Fortitude = Instance.new("TextLabel")
local Strength = Instance.new("TextLabel")
local Ironsing = Instance.new("TextLabel")

--Properties:
ScreenGui.Parent = get_hidden_gui and get_hidden_gui() or gethui and gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Item.Name = "Item"
Item.Parent = ScreenGui
Item.Active = true
Item.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Item.BackgroundTransparency = 0.500
Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
Item.BorderSizePixel = 0
Item.Position = UDim2.new(0, 45, 0, 149)
Item.Size = UDim2.new(0, 406, 0, 265)

UIListLayout.Parent = Item
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Head.Name = "Head"
Head.Parent = ScreenGui
Head.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Head.BackgroundTransparency = 1.000
Head.BorderColor3 = Color3.fromRGB(0, 0, 0)
Head.BorderSizePixel = 0
Head.Position = UDim2.new(0, 176, 0, 100)
Head.Size = UDim2.new(0, 406, 0, 41)

TextLabel.Parent = Head
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, -130, 0, 14)
TextLabel.Size = UDim2.new(0, 406, 0, 41)
TextLabel.Font = Enum.Font.Arial
TextLabel.Text = "[ Inventory ]"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

UIGradient.Parent = TextLabel

Framesearch1.Name = "Framesearch1"
Framesearch1.Parent = Head
Framesearch1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Framesearch1.BackgroundTransparency = 0.500
Framesearch1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Framesearch1.BorderSizePixel = 0
Framesearch1.Position = UDim2.new(0, 137, 0, 14)
Framesearch1.Size = UDim2.new(0, 222, 0, 30)

UICorner.Parent = Framesearch1

TextBox.Parent = Framesearch1
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.ClipsDescendants = true
TextBox.Size = UDim2.new(0, 221, 0, 30)
TextBox.Font = Enum.Font.Arial
TextBox.ShowNativeInput = false
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 85, 127)
TextBox.TextSize = 14.000

UICorner_2.Parent = TextBox

ImageLabel.Parent = Framesearch1
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 190, 0, 0)
ImageLabel.Size = UDim2.new(0, 31, 0, 30)
ImageLabel.Image = "rbxassetid://163851367"

UICorner_3.Parent = ImageLabel

Talents.Name = "Talents"
Talents.Parent = ScreenGui
Talents.Active = true
Talents.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Talents.BackgroundTransparency = 0.500
Talents.BorderColor3 = Color3.fromRGB(0, 0, 0)
Talents.BorderSizePixel = 0
Talents.Position = UDim2.new(0, 45, 0, 483)
Talents.Size = UDim2.new(0, 406, 0, 265)

UIListLayout_2.Parent = Talents
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Mantra.Name = "Mantra"
Mantra.Parent = ScreenGui
Mantra.Active = true
Mantra.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Mantra.BackgroundTransparency = 0.500
Mantra.BorderColor3 = Color3.fromRGB(0, 0, 0)
Mantra.BorderSizePixel = 0
Mantra.Position = UDim2.new(0, 45, 0, 820)
Mantra.Size = UDim2.new(0, 406, 0, 265)

UIListLayout_3.Parent = Mantra
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

Head2.Name = "Head2"
Head2.Parent = ScreenGui
Head2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Head2.BackgroundTransparency = 1.000
Head2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Head2.BorderSizePixel = 0
Head2.Position = UDim2.new(0, 176, 0, 449)
Head2.Size = UDim2.new(0, 406, 0, 41)

TextLabel_2.Parent = Head2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, -130, 0, 0)
TextLabel_2.Size = UDim2.new(0, 406, 0, 41)
TextLabel_2.Font = Enum.Font.Arial
TextLabel_2.Text = "[ Talents  ]"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 20.000

UIGradient_2.Parent = TextLabel_2

Framesearch2.Name = "Framesearch2"
Framesearch2.Parent = Head2
Framesearch2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Framesearch2.BackgroundTransparency = 0.500
Framesearch2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Framesearch2.BorderSizePixel = 0
Framesearch2.Position = UDim2.new(0, 137, 0, 0)
Framesearch2.Size = UDim2.new(0, 222, 0, 30)

UICorner_4.Parent = Framesearch2

TextBox_2.Parent = Framesearch2
TextBox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox_2.BackgroundTransparency = 1.000
TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox_2.BorderSizePixel = 0
TextBox_2.ClipsDescendants = true
TextBox_2.Size = UDim2.new(0, 222, 0, 30)
TextBox_2.Font = Enum.Font.Arial
TextBox_2.ShowNativeInput = false
TextBox_2.Text = ""
TextBox_2.TextColor3 = Color3.fromRGB(255, 85, 127)
TextBox_2.TextSize = 14.000

UICorner_5.Parent = TextBox_2

ImageLabel_2.Parent = Framesearch2
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0, 190, 0, 0)
ImageLabel_2.Size = UDim2.new(0, 32, 0, 30)
ImageLabel_2.Image = "rbxassetid://163851367"

UICorner_6.Parent = ImageLabel_2

Head3.Name = "Head3"
Head3.Parent = ScreenGui
Head3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Head3.BackgroundTransparency = 1.000
Head3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Head3.BorderSizePixel = 0
Head3.Position = UDim2.new(0, 176, 0, 784)
Head3.Size = UDim2.new(0, 406, 0, 41)

TextLabel_3.Parent = Head3
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, -130, 0, -5)
TextLabel_3.Size = UDim2.new(0, 406, 0, 41)
TextLabel_3.Font = Enum.Font.Arial
TextLabel_3.Text = "[ Mantra  ]"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 20.000
TextLabel_3.TextWrapped = true

UIGradient_3.Parent = TextLabel_3

Framesearch3.Name = "Framesearch3"
Framesearch3.Parent = Head3
Framesearch3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Framesearch3.BackgroundTransparency = 0.500
Framesearch3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Framesearch3.BorderSizePixel = 0
Framesearch3.Position = UDim2.new(0, 137, 0, 0)
Framesearch3.Size = UDim2.new(0, 222, 0, 30)

UICorner_7.Parent = Framesearch3

TextBox_3.Parent = Framesearch3
TextBox_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox_3.BackgroundTransparency = 1.000
TextBox_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox_3.BorderSizePixel = 0
TextBox_3.ClipsDescendants = true
TextBox_3.Size = UDim2.new(0, 221, 0, 30)
TextBox_3.Font = Enum.Font.Arial
TextBox_3.ShowNativeInput = false
TextBox_3.Text = ""
TextBox_3.TextColor3 = Color3.fromRGB(255, 85, 127)
TextBox_3.TextSize = 14.000

UICorner_8.Parent = TextBox_3

ImageLabel_3.Parent = Framesearch3
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.Position = UDim2.new(0, 190, 0, 0)
ImageLabel_3.Size = UDim2.new(0, 31, 0, 30)
ImageLabel_3.Image = "rbxassetid://163851367"

UICorner_9.Parent = ImageLabel_3

TopBar.Name = "TopBar"
TopBar.Parent = ScreenGui
TopBar.Active = true
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.892995298, 0, 0.157545611, 0)
TopBar.Size = UDim2.new(0, 255, 0, 61)

TextLabel_4.Parent = TopBar
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 411.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(-0.145098045, 0, 0.0491803288, 0)
TextLabel_4.Size = UDim2.new(0, 249, 0, 58)
TextLabel_4.Font = Enum.Font.ArialBold
TextLabel_4.Text = "[Power 0] _"
TextLabel_4.TextColor3 = Color3.fromRGB(234, 173, 51)
TextLabel_4.TextSize = 15.000

Button.Name = "Button"
Button.Parent = ScreenGui
Button.AnchorPoint = Vector2.new(0.5, 0.5)
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.5, 0, 0.0500000007, 0)
Button.Size = UDim2.new(0, 100, 0, 100)

ImageButton.Parent = Button
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Size = UDim2.new(0, 100, 0, 100)
ImageButton.Image = "rbxassetid://15743726699"

TextLabel_5.Parent = Button
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 12.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0, 25, 0, 28)
TextLabel_5.Size = UDim2.new(0, 48, 0, 44)
TextLabel_5.Font = Enum.Font.Arial
TextLabel_5.Text = "0"
TextLabel_5.TextColor3 = Color3.fromRGB(143, 19, 52)
TextLabel_5.TextSize = 20.000

Status.Name = "Status"
Status.Parent = ScreenGui
Status.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Status.BackgroundTransparency = 0.500
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0.875376046, 0, 0.209784418, 0)
Status.Size = UDim2.new(0, 257, 0, 729)

UICorner_10.Parent = Status

Agility.Name = "Agility"
Agility.Parent = Status
Agility.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Agility.BackgroundTransparency = 1.000
Agility.BorderColor3 = Color3.fromRGB(0, 0, 0)
Agility.BorderSizePixel = 0
Agility.Position = UDim2.new(0, 0, 0.0987654328, 0)
Agility.Size = UDim2.new(0, 257, 0, 36)
Agility.Font = Enum.Font.Arial
Agility.Text = "Agility: 0"
Agility.TextColor3 = Color3.fromRGB(255, 255, 255)
Agility.TextSize = 14.000

Intelligence.Name = "Intelligence"
Intelligence.Parent = Status
Intelligence.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Intelligence.BackgroundTransparency = 1.000
Intelligence.BorderColor3 = Color3.fromRGB(0, 0, 0)
Intelligence.BorderSizePixel = 0
Intelligence.Position = UDim2.new(0, 0, 0.148148149, 0)
Intelligence.Size = UDim2.new(0, 257, 0, 36)
Intelligence.Font = Enum.Font.Arial
Intelligence.Text = "Intelligence: 0"
Intelligence.TextColor3 = Color3.fromRGB(255, 255, 255)
Intelligence.TextSize = 14.000

Willpower.Name = "Willpower"
Willpower.Parent = Status
Willpower.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Willpower.BackgroundTransparency = 1.000
Willpower.BorderColor3 = Color3.fromRGB(0, 0, 0)
Willpower.BorderSizePixel = 0
Willpower.Position = UDim2.new(0, 0, 0.197530866, 0)
Willpower.Size = UDim2.new(0, 257, 0, 36)
Willpower.Font = Enum.Font.Arial
Willpower.Text = "Willpower: 0"
Willpower.TextColor3 = Color3.fromRGB(255, 255, 255)
Willpower.TextSize = 14.000

Charisma.Name = "Charisma"
Charisma.Parent = Status
Charisma.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Charisma.BackgroundTransparency = 1.000
Charisma.BorderColor3 = Color3.fromRGB(0, 0, 0)
Charisma.BorderSizePixel = 0
Charisma.Position = UDim2.new(0, 0, 0.246913582, 0)
Charisma.Size = UDim2.new(0, 257, 0, 36)
Charisma.Font = Enum.Font.Arial
Charisma.Text = "Charisma: 0"
Charisma.TextColor3 = Color3.fromRGB(255, 255, 255)
Charisma.TextSize = 14.000

HeavyWep.Name = "Heavy Wep"
HeavyWep.Parent = Status
HeavyWep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeavyWep.BackgroundTransparency = 1.000
HeavyWep.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeavyWep.BorderSizePixel = 0
HeavyWep.Position = UDim2.new(0, 0, 0.296296299, 0)
HeavyWep.Size = UDim2.new(0, 257, 0, 36)
HeavyWep.Font = Enum.Font.Arial
HeavyWep.Text = "Heavy Wep: 0"
HeavyWep.TextColor3 = Color3.fromRGB(255, 255, 255)
HeavyWep.TextSize = 14.000

MediumWep.Name = "Medium Wep"
MediumWep.Parent = Status
MediumWep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MediumWep.BackgroundTransparency = 1.000
MediumWep.BorderColor3 = Color3.fromRGB(0, 0, 0)
MediumWep.BorderSizePixel = 0
MediumWep.Position = UDim2.new(0, 0, 0.345679015, 0)
MediumWep.Size = UDim2.new(0, 257, 0, 36)
MediumWep.Font = Enum.Font.Arial
MediumWep.Text = "Medium Wep: 0"
MediumWep.TextColor3 = Color3.fromRGB(255, 255, 255)
MediumWep.TextSize = 14.000

LightWep.Name = "Light Wep"
LightWep.Parent = Status
LightWep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LightWep.BackgroundTransparency = 1.000
LightWep.BorderColor3 = Color3.fromRGB(0, 0, 0)
LightWep.BorderSizePixel = 0
LightWep.Position = UDim2.new(0, 0, 0.395061731, 0)
LightWep.Size = UDim2.new(0, 257, 0, 36)
LightWep.Font = Enum.Font.Arial
LightWep.Text = "Light Wep: 0"
LightWep.TextColor3 = Color3.fromRGB(255, 255, 255)
LightWep.TextSize = 14.000

Flamecharm.Name = "Flamecharm"
Flamecharm.Parent = Status
Flamecharm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Flamecharm.BackgroundTransparency = 1.000
Flamecharm.BorderColor3 = Color3.fromRGB(0, 0, 0)
Flamecharm.BorderSizePixel = 0
Flamecharm.Position = UDim2.new(0, 0, 0.444444448, 0)
Flamecharm.Size = UDim2.new(0, 257, 0, 36)
Flamecharm.Font = Enum.Font.Arial
Flamecharm.Text = "Flamecharm: 0"
Flamecharm.TextColor3 = Color3.fromRGB(255, 255, 255)
Flamecharm.TextSize = 14.000

Frostdraw.Name = "Frostdraw"
Frostdraw.Parent = Status
Frostdraw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frostdraw.BackgroundTransparency = 1.000
Frostdraw.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frostdraw.BorderSizePixel = 0
Frostdraw.Position = UDim2.new(0, 0, 0.493827164, 0)
Frostdraw.Size = UDim2.new(0, 257, 0, 36)
Frostdraw.Font = Enum.Font.Arial
Frostdraw.Text = "Frostdraw: 0"
Frostdraw.TextColor3 = Color3.fromRGB(255, 255, 255)
Frostdraw.TextSize = 14.000

Thundercall.Name = "Thundercall"
Thundercall.Parent = Status
Thundercall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Thundercall.BackgroundTransparency = 1.000
Thundercall.BorderColor3 = Color3.fromRGB(0, 0, 0)
Thundercall.BorderSizePixel = 0
Thundercall.Position = UDim2.new(0, 0, 0.534979403, 0)
Thundercall.Size = UDim2.new(0, 257, 0, 36)
Thundercall.Font = Enum.Font.Arial
Thundercall.Text = "Thundercall: 0"
Thundercall.TextColor3 = Color3.fromRGB(255, 255, 255)
Thundercall.TextSize = 14.000

Galebreathe.Name = "Galebreathe"
Galebreathe.Parent = Status
Galebreathe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Galebreathe.BackgroundTransparency = 1.000
Galebreathe.BorderColor3 = Color3.fromRGB(0, 0, 0)
Galebreathe.BorderSizePixel = 0
Galebreathe.Position = UDim2.new(0, 0, 0.578875184, 0)
Galebreathe.Size = UDim2.new(0, 257, 0, 36)
Galebreathe.Font = Enum.Font.Arial
Galebreathe.Text = "Galebreathe: 0"
Galebreathe.TextColor3 = Color3.fromRGB(255, 255, 255)
Galebreathe.TextSize = 14.000

Shadowcast.Name = "Shadowcast"
Shadowcast.Parent = Status
Shadowcast.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadowcast.BackgroundTransparency = 1.000
Shadowcast.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shadowcast.BorderSizePixel = 0
Shadowcast.Position = UDim2.new(0, 0, 0.628257871, 0)
Shadowcast.Size = UDim2.new(0, 257, 0, 36)
Shadowcast.Font = Enum.Font.Arial
Shadowcast.Text = "Shadowcast: 0"
Shadowcast.TextColor3 = Color3.fromRGB(255, 255, 255)
Shadowcast.TextSize = 14.000

Fortitude.Name = "Fortitude"
Fortitude.Parent = Status
Fortitude.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fortitude.BackgroundTransparency = 1.000
Fortitude.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fortitude.BorderSizePixel = 0
Fortitude.Position = UDim2.new(0, 0, 0.0493827164, 0)
Fortitude.Size = UDim2.new(0, 257, 0, 36)
Fortitude.Font = Enum.Font.Arial
Fortitude.Text = "Fortitude: 0"
Fortitude.TextColor3 = Color3.fromRGB(255, 255, 255)
Fortitude.TextSize = 14.000

Strength.Name = "Strength"
Strength.Parent = Status
Strength.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Strength.BackgroundTransparency = 1.000
Strength.BorderColor3 = Color3.fromRGB(0, 0, 0)
Strength.BorderSizePixel = 0
Strength.Size = UDim2.new(0, 257, 0, 36)
Strength.Font = Enum.Font.Arial
Strength.Text = "Strength: 0"
Strength.TextColor3 = Color3.fromRGB(255, 255, 255)
Strength.TextSize = 14.000

Ironsing.Name = "Ironsing"
Ironsing.Parent = Status
Ironsing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ironsing.BackgroundTransparency = 1.000
Ironsing.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ironsing.BorderSizePixel = 0
Ironsing.Position = UDim2.new(0.00389105058, 0, 0.681755841, 0)
Ironsing.Size = UDim2.new(0, 257, 0, 36)
Ironsing.Font = Enum.Font.Arial
Ironsing.Text = "Ironsing: 0"
Ironsing.TextColor3 = Color3.fromRGB(255, 255, 255)
Ironsing.TextSize = 14.000
ScreenGui.Enabled = false;

function Modules:Toggle(stage)
    pcall(function()
        ScreenGui.Enabled = stage;
    end)
end;

function Modules:ToggleItem(stage)
    pcall(function()
        Item.Visible = stage;
    end)
end;

function Modules:ToggleTalents(stage)
    pcall(function()
        Talents.Visible = stage;
    end)
end;

function Modules:ToggleMantra(stage)
    pcall(function()
        Mantra.Visible = stage;
    end)
end;

function Modules:UpdateSkull(value)
    pcall(function()
        TextLabel_5.Text = tostring(value)
    end)
end;

function Modules:UpdateHeadText(value)
    pcall(function()
        TextLabel_4.Text = tostring(value)
    end)
end;



function Modules:Update(class,value)
    pcall(function()
        if (class == 'Strength') then 
            Strength.Text = "Strength: "..tostring(value);
        elseif (class == 'Fortitude') then   
            Fortitude.Text = "Fortitude: "..tostring(value);
        elseif (class == 'Agility') then   
            Agility.Text = "Agility: "..tostring(value);
        elseif (class == 'Intelligence') then   
            Intelligence.Text = "Intelligence: "..tostring(value);
        elseif (class == 'Willpower') then   
            Willpower.Text = "Willpower: "..tostring(value);
        elseif (class == 'Charisma') then   
            Charisma.Text = "Charisma: "..tostring(value);
        elseif (class == 'HeavyWep') then   
            HeavyWep.Text = "HeavyWep: "..tostring(value);
        elseif (class == 'MediumWep') then   
            MediumWep.Text = "MediumWep: "..tostring(value);
        elseif (class == 'LightWep') then   
            LightWep.Text = "LightWep: "..tostring(value);
        elseif (class == 'Flamecharm') then   
            Flamecharm.Text = "Flamecharm: "..tostring(value);
        elseif (class == 'Frostdraw') then   
            Frostdraw.Text = "Frostdraw: "..tostring(value);
        elseif (class == 'Thundercall') then   
            Thundercall.Text = "Thundercall: "..tostring(value);
        elseif (class == 'Galebreathe') then   
            Galebreathe.Text = "Galebreathe: "..tostring(value);
        elseif (class == 'Shadowcast') then   
            Shadowcast.Text = "Shadowcast: "..tostring(value);
        elseif (class == 'Ironsing') then   
            Ironsing.Text = "Ironsing: "..tostring(value);
        end;
    end)
end;
function Modules:Remove()
    pcall(function()
        for i,v in pairs(Item:GetChildren())do
            if v:IsA("TextLabel") then 
                v:Destroy()
            end 
        end
        for i,v in pairs(Talents:GetChildren())do
            if v:IsA("TextLabel") then 
                v:Destroy()
            end 
        end
        for i,v in pairs(Mantra:GetChildren())do
            if v:IsA("TextLabel") then 
                v:Destroy()
            end 
        end
    end)
end;
function Modules:AddText(class,text)
    pcall(function()
        if (not class or not text) then return end;
        local TextTesting = Instance.new("TextLabel")
        local UIGradientNew = Instance.new("UIGradient")
        TextTesting.Name = "TextTesting"
        TextTesting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextTesting.BackgroundTransparency = 1.000
        TextTesting.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextTesting.BorderSizePixel = 0
        TextTesting.Size = UDim2.new(0, 406, 0, 50)
        TextTesting.Font = Enum.Font.Arial
        TextTesting.Text = tostring(text)
        TextTesting.TextColor3 = Color3.fromRGB(255,255,255)
        TextTesting.TextSize = 15.000
        UIGradientNew.Parent = TextTesting
        if (class == 'Item') then 
        TextTesting.Parent = Item
        elseif (class == 'Talents') then 
        TextTesting.Parent = Talents
        elseif (class == 'Mantra') then 
        TextTesting.Parent = Mantra
        end;
    end);
end;
Modules.connection.TextBox1 = TextBox:GetPropertyChangedSignal("Text"):Connect(function()
    pcall(function()
        if (#TextBox.Text == 0) then 
            for _,v in next,Item:GetChildren() do 
                if (v:IsA('TextLabel')) then 
                    v.Visible = true;
                end;
            end;
            return;
        end;
        for _,v in next, Item:GetChildren()do 
            if (v:IsA('TextLabel')) then 
                if (v.Text:find(TextBox.Text)) then 
                    v.Visible = true;
                else 
                    v.Visible = false;
                end;
            end;
        end;
    end)
end)
Modules.connection.TextBox2 = TextBox_2:GetPropertyChangedSignal("Text"):Connect(function()
    pcall(function()
        if (#TextBox_2.Text == 0) then 
            for _,v in next,Talents:GetChildren() do 
                if (v:IsA('TextLabel')) then 
                    v.Visible = true;
                end;
            end;
            return;
        end;
        for _,v in next, Talents:GetChildren()do 
            if (v:IsA('TextLabel')) then 
                if (v.Text:find(TextBox_2.Text)) then 
                    v.Visible = true;
                else 
                    v.Visible = false;
                end;
            end;
        end;
    end)
end)
Modules.connection.TextBox3 = TextBox_3:GetPropertyChangedSignal("Text"):Connect(function()
    pcall(function()
        if (#TextBox_3.Text == 0) then 
            for _,v in next,Mantra:GetChildren() do 
                if (v:IsA('TextLabel')) then 
                    v.Visible = true;
                end;
            end;
            return;
        end;
        for _,v in next, Mantra:GetChildren()do 
            if (v:IsA('TextLabel')) then 
                if (v.Text:find(TextBox_3.Text)) then 
                    v.Visible = true;
                else 
                    v.Visible = false;
                end;
            end;
        end;
    end)
end)
getgenv().SkullButton = ImageButton;
return Modules;
