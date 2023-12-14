print("CALL PASS")
getgenv().KaitanConfig = {
	-- // Settings Scripts //
	GemLock = "20000", -- ห้ามมี Comma (,) ใส่เป็นเลขเท่านั้น
    WebhookUrl = "...",
	DisabledGPU = false,
 -- // Settings RBX Account Manager //
	Port = "7963",
	Password = "",
}
local Code = {
    'SACREDPLANET', 
    'UNLEASHFUSESOON',
    'AMEGAKURE',
    'SIXPATHSUPD',
    'HAPPYHALLOWEEN',
	'CLOVER2',
    'CLOVER',
	'HALLOWEEN',
    'CURSE2',
    'SORRYFORSHUTDOWN2',
    'CURSE',
	'FAIRY',
    'subtomaokuma',
    'FictioNTheFirst',
    'SubToKelvingts',
    'TOADBOIGAMING',
    'KingLuffy',
    'subtosnowrbx',
    'noclypso',
    'SubToBlamspot',
    'Cxrsed',
	"CHAINSAW",
	"NEWYEAR2023",
	"CHRISTMAS2022",
	"GRAVITY",
	"PORTALFIX",
	"UCHIHA",
	"SINS",
	"SINS2",
	"GOLDENSHUTDOWN",
	"VIGILANTE",
	"GOLDEN",
	"HAPPYEASTER",
    "ENTERTAINMENT",
    "HAPPYEASTER",
    "VIGILANTE",
}
repeat wait() until game:IsLoaded()
--if game.Players.LocalPlayer.Name:find('SkymaxTV') then return end
if getgenv().KaitanConfig["DisabledGPU"] then
    game.RunService:Set3dRenderingEnabled(false)
end
pcall(setfpscap,getgenv().KaitanConfig["Fps Cap"])
pcall(set_fps_cap,getgenv().KaitanConfig["Fps Cap"])
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("spawn_units")
game:GetService("Players").LocalPlayer.PlayerGui.spawn_units:WaitForChild("Lives")

game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false

game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_battlepass_rewards:InvokeServer()
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
--[[for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Color = Color3.fromRGB(0, 0, 0)
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Color = Color3.fromRGB(0, 0, 0)
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end]]

settings().Rendering.QualityLevel = "Level01"

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("RIVERHUB.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("RIVERHUB.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

local function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        wait()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
end) 

local MapLevelPlay = {}
	for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
		if i == 'session' then
			for i1,v1 in pairs(v) do
				if i1 == 'profile_data' then
					for i2,v2 in pairs(v1['level_data']['completed_story_levels']) do
						if i2:find('namek_level') then
							table.insert(MapLevelPlay,i2)
						end
					end
				end
			end
		end
	end

print('aa')
--- Variables
local function GetBattlePassLv()
    local tableins = {}
    for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session['profile_data']['battlepass_data']['cake_april'].claimed_tiers['normal']) do
        table.insert(tableins,v)
    end
    return #tableins
end
local plr = game:GetService("Players").LocalPlayer
local ViSendMouseButtonEvent = game:service'VirtualInputManager'
--[[for _,v in pairs(getgc(true)) do
	if type(v) == "function" then
		if  getinfo(v).name == "calculate_static_stat_multiplier" then
            print(v)
			getgenv().calculate_static_stat_multiplier = v
		end
	end
 end]]
local VirtualUser = game:GetService("VirtualUser")
spawn(function()
    pcall(function()

function accm()
    local Account = {} Account.__index = Account
    
    local WebserverSettings = {
        Port = getgenv().KaitanConfig["Port"],
        Password = getgenv().KaitanConfig["Password"]
    }
    
    function WebserverSettings:SetPort(Port) self.Port = Port end
    function WebserverSettings:SetPassword(Password) self.Password = Password end
    
    local HttpService = game:GetService'HttpService'
    local Request = (syn and syn.request) or request or (http and http.request) or http_request
    
    local function GET(Method, Account, ...)
        local Arguments = {...}
        local Url = 'http://localhost:' .. WebserverSettings.Port .. '/' .. Method .. '?Account=' .. Account
        
        for Index, Parameter in pairs(Arguments) do
            Url = Url .. '&' .. Parameter
            print(Parameter)
        end
    
        if WebserverSettings.Password and #WebserverSettings.Password >= 6 then
            Url = Url .. '&Password=' .. WebserverSettings.Password
        end
        
        local Response = Request {
            Method = 'GET',
            Url = Url
        }
    
        if Response.StatusCode ~= 200 then return false end
    
        return Response.Body
    end
    
    local function POST(Method, Account, Body, ...)
        local Arguments = {...}
        local Url = 'http://localhost:' .. WebserverSettings.Port .. '/' .. Method .. '?Account=' .. Account
    
        for Index, Parameter in pairs(Arguments) do
            Url = '&' .. Url .. Parameter
        end
    
        if WebserverSettings.Password and #WebserverSettings.Password >= 6 then
            Url = Url .. '&Password=' .. WebserverSettings.Password
        end
        
        local Response = Request {
            Method = 'POST',
            Url = Url,
            Body = Body
        }
    
        if Response.StatusCode ~= 200 then return false end
    
        return Response.Body
    end
    
    function Account.new(Username, SkipValidation)
        local self = {} setmetatable(self, Account)
    
        local IsValid = SkipValidation or GET('GetCSRFToken', Username)
        
        if not IsValid or IsValid == 'Invalid Account' then return false end
        self.Username = Username
        return self
    end
    
    function Account:GetCSRFToken() return GET('GetCSRFToken', self.Username) end
    
    function Account:BlockUser(Argument)
        if typeof(Argument) == 'string' then
            return GET('BlockUser', self.Username, 'UserId=' .. Argument)
        elseif typeof(Argument) == 'Instance' and Argument:IsA'Player' then
            return self:BlockUser(tostring(Argument.UserId))
        elseif typeof(Argument) == 'number' then
            return self:BlockUser(tostring(Argument))
        end
    end
    function Account:UnblockUser(Argument)
        if typeof(Argument) == 'string' then
            return GET('UnblockUser', self.Username, 'UserId=' .. Argument)
        elseif typeof(Argument) == 'Instance' and Argument:IsA'Player' then
            return self:BlockUser(tostring(Argument.UserId))
        elseif typeof(Argument) == 'number' then
            return self:BlockUser(tostring(Argument))
        end
    end
    function Account:GetBlockedList() return GET('GetBlockedList', self.Username) end
    function Account:UnblockEveryone() return GET('UnblockEveryone', self.Username) end
    
    function Account:GetAlias() return GET('GetAlias', self.Username) end
    function Account:GetDescription() return GET('GetDescription', self.Username) end
    function Account:SetAlias(Alias) return POST('SetAlias', self.Username, Alias) end
    function Account:SetDescription(Description) return POST('SetDescription', self.Username, Description) end
    function Account:AppendDescription(Description) return POST('AppendDescription', self.Username, Description) end
    
    function Account:GetField(Field) return GET('GetField', self.Username, 'Field=' .. HttpService:UrlEncode(Field)) end
    function Account:SetField(Field, Value) return GET('SetField', self.Username, 'Field=' .. HttpService:UrlEncode(Field), 'Value=' .. HttpService:UrlEncode(tostring(Value))) end
    function Account:RemoveField(Field) return GET('RemoveField', self.Username, 'Field=' .. HttpService:UrlEncode(Field)) end
    
    function Account:SetServer(PlaceId, JobId) return GET('SetServer', self.Username, 'PlaceId=' .. PlaceId, 'JobId=' .. JobId) end
    function Account:SetRecommendedServer(PlaceId) return GET('SetServer', self.Username, 'PlaceId=' .. PlaceId) end
    
    function Account:ImportCookie(Token) return GET('ImportCookie', 'Cookie=' .. Token) end
    function Account:GetCookie() return GET('GetCookie', self.Username) end
    function Account:LaunchAccount(PlaceId, JobId, FollowUser, JoinVip) -- if you want to follow someone, PlaceId must be their user id
        return GET('LaunchAccount', self.Username, 'PlaceId=' .. PlaceId, JobId and ('JobId=' .. JobId), FollowUser and 'FollowUser=true', JoinVip and 'JoinVIP=true')
    end
    
    return Account, WebserverSettings
end
local MyAccount = accm().new(game:GetService'Players'.LocalPlayer.Name)
local T = {"K","M","B","T","q","Q","s","S","O","N","d","U","D"}
	local function formatNumber(n)
		if not tonumber(n) then return n end
		if n < 10000 then return 'Less 10k' end
		local d = math.floor(math.log10(n)/3)*3
		local s = tostring(n/(10^d)):sub(1,5)
		return s..tostring(T[math.floor(d/3)])
	end


Nexus:CreateNumeric('NumGet1', 60, 5, 1)
Nexus:CreateLabel('tGet1', 'Delay Auto Set Des')
Nexus:NewLine()
Nexus:CreateNumeric('NumGet2', 60, 5, 1)
Nexus:CreateLabel('tGet2', 'Delay Auto Set Ali')
Nexus:NewLine()
Nexus:CreateTextBox('Test', 'Sheet Link', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:NewLine()

Nexus:CreateButton('SendButton', 'Rejoin Server', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('SendButton', function() 
    local ts = game:GetService("TeleportService") local p = game.Players.LocalPlayer ts:Teleport(8304191830, p) 
end)

Nexus:CreateButton('SendButton1', 'Shutdown Game', { 100, 20 }, { 10, 10, 10, 10 })
Nexus:OnButtonClick('SendButton1', function() 
    game:Shutdown()
end)
Nexus:NewLine()

spawn(function()
    while wait() do
        if MyAccount and MyAccount:GetAlias() ~= 'Sheet : Done' then
            MyAccount:SetAlias(("%s"):format(
                tostring(formatNumber(game.Players.LocalPlayer["_stats"]["gem_amount"].Value))
            ))
        end
        wait(tonumber(Nexus:GetText('NumGet2')))
    end
end)

    spawn(function()
        while wait() do
            if MyAccount then
                MyAccount:SetDescription(("Username : %s\nGems : %s\nGolds : %s\nBattlePass : %s"):format(
                    tostring(game:GetService("Players").LocalPlayer.Name),
                    tostring(game.Players.LocalPlayer["_stats"]["gem_amount"].Value),
                    tostring(game:GetService("Players").LocalPlayer["_stats"]["gold_amount"].Value),
                    GetBattlePassLv()
                ))
            end
            wait(tonumber(Nexus:GetText('NumGet2')))
        end
    end)

    Nexus:CreateButton('SendButton2', 'Log Sheet', { 200, 20 }, { 10, 10, 10, 10 })
    Nexus:OnButtonClick('SendButton2', function() 
        local tablec = {}
        function ReturnMythic(args)
            for i,v in pairs(require(game:GetService("ReplicatedStorage").src.Data.Units)) do
                if i == args and v.rarity == 'Mythic' then
                    return {true,v.name}
                end
            end
            return {false}
        end
     
        for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session['collection'].collection_profile_data['owned_units']) do
            if ReturnMythic(v.unit_id)[1] then
                table.insert(tablec,ReturnMythic(v.unit_id)[2]) 
            end
        end
        local HttpRequest 
        local plr = game.Players.LocalPlayer
        if syn then
        HttpRequest = syn.request
        else
        HttpRequest = http_request
        end
        local response = HttpRequest(
            {   
                Url= Nexus:GetText('Test'),
                Body=game:GetService('HttpService'):JSONEncode({
                    ['a'] = tostring(plr.Name) .. (' (Lv.%s)'):format(plr.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split('Level ')[2]:split(' ')[1]),
                    ['b'] =  "Lv." .. GetBattlePassLv(),
                    ['c'] = table.concat(tablec,','),
                    ['d'] = tostring(plr["_stats"]["gem_amount"].Value),
                }), 
                Method="POST",
                Headers={["content-type"] = "application/json"}
        })  
        MyAccount:SetAlias('Sheet : Done')
        print('Send Log Sheet')
    end)
    print('Connect Sheet & Des') 
    spawn(function()
        while true do
            if getgenv().KaitanConfig["GemLock"]  ~= nil and tonumber(getgenv().KaitanConfig["GemLock"])  ~= 0 and plr["_stats"]["gem_amount"].Value >=  tonumber(getgenv().KaitanConfig["GemLock"])  then
                Nexus:SetAutoRelaunch(false)
                wait(.5)
                game:Shutdown()
            end
            wait()
        end
    end)
   
    end)
end)
local game = game
local GetService = function(Service) return game:GetService(Service) end
local alpineMaterialUI = Instance.new("ScreenGui")
local overlay = Instance.new("Frame")
local plrimage = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local bar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local displayname = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local buttons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local settings = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local icon = Instance.new("ImageLabel")
local button = Instance.new("TextButton")
local realname = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local settings_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local topbar = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local shadowcontainer = Instance.new("Frame")
local DropShadowHolder_2 = Instance.new("Frame")
local DropShadow_2 = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local xbutton = Instance.new("ImageButton")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local DropShadowHolder_3 = Instance.new("Frame")
local DropShadow_3 = Instance.new("ImageLabel")
local main = Instance.new("Frame")
local scrollingcontainer = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Gems = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local settingname = Instance.new("TextLabel")
local settingdescription = Instance.new("TextLabel")
local toggle = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local button_2 = Instance.new("TextButton")
local BattlePass = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local settingname_2 = Instance.new("TextLabel")
local settingdescription_2 = Instance.new("TextLabel")
local toggle_2 = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local button_3 = Instance.new("TextButton")
local Gold = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local settingname_3 = Instance.new("TextLabel")
local settingdescription_3 = Instance.new("TextLabel")
local toggle_3 = Instance.new("Frame")
local ImageLabel_3 = Instance.new("ImageLabel")
local button_4 = Instance.new("TextButton")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local CoreGui = GetService("CoreGui")

if CoreGui:FindFirstChild("alpineMaterialUI") then
    CoreGui["alpineMaterialUI"]:Destroy()
end

function AddComma(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end

alpineMaterialUI.Name = "alpineMaterialUI"
alpineMaterialUI.Parent = CoreGui
alpineMaterialUI.ResetOnSpawn = false

overlay.Name = "overlay"
overlay.Parent = alpineMaterialUI
overlay.AnchorPoint = Vector2.new(0, 1)
overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
overlay.BackgroundTransparency = 1.000
overlay.BorderSizePixel = 0
overlay.Position = UDim2.new(0, 545, 0, 360)
overlay.Size = UDim2.new(0.206979528, 0, 0.0533960424, 0)
overlay.Visible = false

plrimage.Name = "plrimage"
plrimage.Parent = overlay
plrimage.AnchorPoint = Vector2.new(0.5, 0.5)
plrimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
plrimage.BorderColor3 = Color3.fromRGB(27, 42, 53)
plrimage.BorderSizePixel = 0
plrimage.Position = UDim2.new(0.0886370689, 0, 0.493498504, 0)
plrimage.Size = UDim2.new(0.2237968, 0, 1.35655296, 0)
plrimage.ZIndex = 3
plrimage.Image = "rbxassetid://6997454192"
plrimage.ScaleType = Enum.ScaleType.Fit

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = plrimage

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = plrimage
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 2
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.700
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.SliceScale = 15.000

bar.Name = "bar"
bar.Parent = overlay
bar.AnchorPoint = Vector2.new(0, 0.5)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(0.10442505, 0, 0.492105544, 0)
bar.Size = UDim2.new(1.0622468, 0, 0.82157433, 0)

UICorner_2.CornerRadius = UDim.new(0.300000012, 0)
UICorner_2.Parent = bar

displayname.Name = "displayname"
displayname.Parent = bar
displayname.AnchorPoint = Vector2.new(0.5, 0.5)
displayname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
displayname.BackgroundTransparency = 1.000
displayname.BorderSizePixel = 0
displayname.Position = UDim2.new(0.383407056, 0, 0.5, 0)
displayname.Size = UDim2.new(0.512853324, 0, 0.450000018, 0)
displayname.Visible = false
displayname.Font = Enum.Font.Gotham
displayname.Text = "@playerName"
displayname.TextColor3 = Color3.fromRGB(59, 59, 59)
displayname.TextSize = 20.000
displayname.TextWrapped = true
displayname.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint.Parent = displayname

buttons.Name = "buttons"
buttons.Parent = bar
buttons.AnchorPoint = Vector2.new(0.5, 0.5)
buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttons.BorderSizePixel = 0
buttons.Position = UDim2.new(0.844341874, 0, 0.500000477, 0)
buttons.Size = UDim2.new(0.267607689, 0, 0.658358574, 0)

UIListLayout.Parent = buttons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0500000007, 0)

settings.Name = "settings"
settings.Parent = buttons
settings.AnchorPoint = Vector2.new(0.5, 0.5)
settings.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
settings.BorderSizePixel = 0
settings.LayoutOrder = 3
settings.Position = UDim2.new(0.843289196, 0, 0.500000536, 0)
settings.Size = UDim2.new(0.313421279, 0, 1, 0)

UICorner_3.CornerRadius = UDim.new(0.300000012, 0)
UICorner_3.Parent = settings

icon.Name = "icon"
icon.Parent = settings
icon.AnchorPoint = Vector2.new(0.5, 0.5)
icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
icon.BackgroundTransparency = 1.000
icon.BorderSizePixel = 0
icon.Position = UDim2.new(0.5, 0, 0.5, 0)
icon.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
icon.Image = "rbxassetid://7072721682"
icon.ImageColor3 = Color3.fromRGB(50, 50, 50)

button.Name = "button"
button.Parent = settings
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 1.000
button.BorderSizePixel = 0
button.Position = UDim2.new(0.5, 0, 0.5, 0)
button.Size = UDim2.new(1, 0, 1, 0)
button.ZIndex = 69420
button.Font = Enum.Font.SourceSans
button.Text = ""
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.TextScaled = true
button.TextSize = 14.000
button.TextWrapped = true

realname.Name = "realname"
realname.Parent = bar
realname.AnchorPoint = Vector2.new(0.5, 0.5)
realname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
realname.BackgroundTransparency = 1.000
realname.BorderSizePixel = 0
realname.Position = UDim2.new(0.383407056, 0, 0.5, 0)
realname.Size = UDim2.new(0.512853324, 0, 0.450000018, 0)
realname.Font = Enum.Font.Gotham
realname.Text = "mexual"
realname.TextColor3 = Color3.fromRGB(59, 59, 59)
realname.TextScaled = true
realname.TextSize = 20.000
realname.TextWrapped = true
realname.TextXAlignment = Enum.TextXAlignment.Left

UIAspectRatioConstraint.Parent = overlay
UIAspectRatioConstraint.AspectRatio = 6.062

settings_2.Name = "settings"
settings_2.Parent = alpineMaterialUI
settings_2.AnchorPoint = Vector2.new(0.5, 0.5)
settings_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settings_2.BorderSizePixel = 0
settings_2.Position = UDim2.new(0.5, 0, 0.5, 0)
settings_2.Size = UDim2.new(0.407380939, 0, 0.471355587, 0)

UICorner_4.CornerRadius = UDim.new(0.0199999996, 0)
UICorner_4.Parent = settings_2

topbar.Name = "topbar"
topbar.Parent = settings_2
topbar.AnchorPoint = Vector2.new(0.5, 0)
topbar.BackgroundColor3 = Color3.fromRGB(98, 135, 255)
topbar.BackgroundTransparency = 1.000
topbar.BorderSizePixel = 0
topbar.Position = UDim2.new(0.5, 0, 0, 0)
topbar.Size = UDim2.new(1.00042248, 0, 0.111548528, 0)
topbar.ZIndex = 5

UICorner_5.CornerRadius = UDim.new(0.150000006, 0)
UICorner_5.Parent = topbar

shadowcontainer.Name = "shadow-container"
shadowcontainer.Parent = topbar
shadowcontainer.AnchorPoint = Vector2.new(0.5, 0.5)
shadowcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
shadowcontainer.BackgroundTransparency = 1.000
shadowcontainer.BorderSizePixel = 0
shadowcontainer.Position = UDim2.new(0.5, 0, 0.92467916, 0)
shadowcontainer.Size = UDim2.new(1, 0, 1.27935827, 0)

DropShadowHolder_2.Name = "DropShadowHolder"
DropShadowHolder_2.Parent = shadowcontainer
DropShadowHolder_2.BackgroundTransparency = 1.000
DropShadowHolder_2.BorderSizePixel = 0
DropShadowHolder_2.ClipsDescendants = true
DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder_2.ZIndex = 0

DropShadow_2.Name = "DropShadow"
DropShadow_2.Parent = DropShadowHolder_2
DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow_2.BackgroundTransparency = 1.000
DropShadow_2.BorderSizePixel = 0
DropShadow_2.Position = UDim2.new(0.5, 0, 0.154951289, 0)
DropShadow_2.Size = UDim2.new(1, 47, 0.763999999, 47)
DropShadow_2.ZIndex = 4
DropShadow_2.Image = "rbxassetid://6015897843"
DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow_2.ImageTransparency = 0.800
DropShadow_2.ScaleType = Enum.ScaleType.Slice
DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

TextLabel.Parent = topbar
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.156671718, 0, 0.5, 0)
TextLabel.Size = UDim2.new(0.264999986, 0, 0.430000007, 0)
TextLabel.ZIndex = 6
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Information"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

xbutton.Name = "xbutton"
xbutton.Parent = topbar
xbutton.AnchorPoint = Vector2.new(0.5, 0.5)
xbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
xbutton.BackgroundTransparency = 1.000
xbutton.BorderSizePixel = 0
xbutton.Position = UDim2.new(0.965557218, 0, 0.5, 0)
xbutton.Size = UDim2.new(0.0372896828, 0, 0.522498429, 0)
xbutton.ZIndex = 6
xbutton.Image = "rbxassetid://7072725342"
xbutton.ScaleType = Enum.ScaleType.Fit

Frame.Parent = topbar
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.BackgroundColor3 = Color3.fromRGB(98, 135, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, 0, 0, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.ZIndex = 5

Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0.5, 0)
Frame_2.BackgroundColor3 = Color3.fromRGB(98, 135, 255)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, 0, 0, 0)
Frame_2.Size = UDim2.new(1.00000012, 0, 1.12175834, 0)
Frame_2.ZIndex = 5

UICorner_6.CornerRadius = UDim.new(0.129999995, 0)
UICorner_6.Parent = Frame_2

DropShadowHolder_3.Name = "DropShadowHolder"
DropShadowHolder_3.Parent = settings_2
DropShadowHolder_3.BackgroundTransparency = 1.000
DropShadowHolder_3.BorderSizePixel = 0
DropShadowHolder_3.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder_3.ZIndex = 0

DropShadow_3.Name = "DropShadow"
DropShadow_3.Parent = DropShadowHolder_3
DropShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow_3.BackgroundTransparency = 1.000
DropShadow_3.BorderSizePixel = 0
DropShadow_3.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow_3.Size = UDim2.new(1, 47, 1, 47)
DropShadow_3.ZIndex = 0
DropShadow_3.Image = "rbxassetid://6014261993"
DropShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow_3.ImageTransparency = 0.800
DropShadow_3.ScaleType = Enum.ScaleType.Slice
DropShadow_3.SliceCenter = Rect.new(49, 49, 450, 450)

main.Name = "main"
main.Parent = settings_2
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 1.000
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Position = UDim2.new(0.5, 0, 0.554999948, 0)
main.Size = UDim2.new(1.00000012, 0, 0.890000105, 0)

scrollingcontainer.Name = "scrollingcontainer"
scrollingcontainer.Parent = main
scrollingcontainer.AnchorPoint = Vector2.new(0.5, 0.5)
scrollingcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingcontainer.BackgroundTransparency = 1.000
scrollingcontainer.BorderSizePixel = 0
scrollingcontainer.ClipsDescendants = false
scrollingcontainer.Position = UDim2.new(0.5, 0, 0.519864619, 0)
scrollingcontainer.Selectable = false
scrollingcontainer.Size = UDim2.new(1, -36, 1.03972924, -36)
scrollingcontainer.ScrollBarThickness = 0
scrollingcontainer.ScrollingEnabled = false

UIListLayout_2.Parent = scrollingcontainer
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0.0120000001, 0)

Gems.Name = "Gems"
Gems.Parent = scrollingcontainer
Gems.AnchorPoint = Vector2.new(0.5, 0.5)
Gems.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Gems.BorderSizePixel = 0
Gems.Position = UDim2.new(0.498659164, 0, 0.0846864656, 0)
Gems.Size = UDim2.new(1, 0, 0.129999995, 0)

UICorner_7.CornerRadius = UDim.new(0.0900000036, 0)
UICorner_7.Parent = Gems

settingname.Name = "settingname"
settingname.Parent = Gems
settingname.AnchorPoint = Vector2.new(0.5, 0.5)
settingname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingname.BackgroundTransparency = 1.000
settingname.BorderSizePixel = 0
settingname.Position = UDim2.new(0.301084191, 0, 0.385828108, 0)
settingname.Size = UDim2.new(0.526023269, 0, 0.199222088, 0)
settingname.Font = Enum.Font.GothamMedium
settingname.Text = "Gems"
settingname.TextColor3 = Color3.fromRGB(56, 56, 56)
settingname.TextScaled = true
settingname.TextSize = 14.000
settingname.TextWrapped = true
settingname.TextXAlignment = Enum.TextXAlignment.Left

settingdescription.Name = "settingdescription"
settingdescription.Parent = Gems
settingdescription.AnchorPoint = Vector2.new(0.5, 0.5)
settingdescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingdescription.BackgroundTransparency = 1.000
settingdescription.BorderSizePixel = 0
settingdescription.Position = UDim2.new(0.416889697, 0, 0.599523365, 0)
settingdescription.Size = UDim2.new(0.757999957, 0, 0.145695731, 0)
settingdescription.Font = Enum.Font.Gotham
settingdescription.Text = "Amount: 98,000"
settingdescription.TextColor3 = Color3.fromRGB(56, 56, 56)
settingdescription.TextScaled = true
settingdescription.TextSize = 14.000
settingdescription.TextTransparency = 0.200
settingdescription.TextWrapped = true
settingdescription.TextXAlignment = Enum.TextXAlignment.Left
settingdescription.TextYAlignment = Enum.TextYAlignment.Top

toggle.Name = "toggle"
toggle.Parent = Gems
toggle.AnchorPoint = Vector2.new(0.5, 0.5)
toggle.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
toggle.BackgroundTransparency = 1.000
toggle.BorderColor3 = Color3.fromRGB(0, 53, 42)
toggle.BorderSizePixel = 0
toggle.Position = UDim2.new(0.911248922, 0, 0.493629992, 0)
toggle.Size = UDim2.new(0.132318497, 0, 0.677820981, 0)

ImageLabel.Parent = toggle
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 16, 53)
ImageLabel.Position = UDim2.new(0.146694884, 0, -0.017772669, 0)
ImageLabel.Size = UDim2.new(0, 58, 0, 58)
ImageLabel.Image = "rbxassetid://10503388325"

button_2.Name = "button"
button_2.Parent = Gems
button_2.AnchorPoint = Vector2.new(0.5, 0.5)
button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button_2.BackgroundTransparency = 1.000
button_2.BorderSizePixel = 0
button_2.Position = UDim2.new(0.5, 0, 0.5, 0)
button_2.Size = UDim2.new(1, 0, 1, 0)
button_2.ZIndex = 69420
button_2.Font = Enum.Font.SourceSans
button_2.Text = ""
button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
button_2.TextScaled = true
button_2.TextSize = 14.000
button_2.TextWrapped = true

BattlePass.Name = "Battle Pass"
BattlePass.Parent = scrollingcontainer
BattlePass.AnchorPoint = Vector2.new(0.5, 0.5)
BattlePass.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
BattlePass.BorderSizePixel = 0
BattlePass.Position = UDim2.new(0.498659164, 0, 0.0846864656, 0)
BattlePass.Size = UDim2.new(1, 0, 0.129999995, 0)

UICorner_8.CornerRadius = UDim.new(0.0900000036, 0)
UICorner_8.Parent = BattlePass

settingname_2.Name = "settingname"
settingname_2.Parent = BattlePass
settingname_2.AnchorPoint = Vector2.new(0.5, 0.5)
settingname_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingname_2.BackgroundTransparency = 1.000
settingname_2.BorderSizePixel = 0
settingname_2.Position = UDim2.new(0.301084191, 0, 0.385828108, 0)
settingname_2.Size = UDim2.new(0.526023269, 0, 0.199222088, 0)
settingname_2.Font = Enum.Font.GothamMedium
settingname_2.Text = "Battle Pass"
settingname_2.TextColor3 = Color3.fromRGB(56, 56, 56)
settingname_2.TextScaled = true
settingname_2.TextSize = 14.000
settingname_2.TextWrapped = true
settingname_2.TextXAlignment = Enum.TextXAlignment.Left

settingdescription_2.Name = "settingdescription"
settingdescription_2.Parent = BattlePass
settingdescription_2.AnchorPoint = Vector2.new(0.5, 0.5)
settingdescription_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingdescription_2.BackgroundTransparency = 1.000
settingdescription_2.BorderSizePixel = 0
settingdescription_2.Position = UDim2.new(0.416889697, 0, 0.599523365, 0)
settingdescription_2.Size = UDim2.new(0.757999957, 0, 0.145695731, 0)
settingdescription_2.Font = Enum.Font.Gotham
settingdescription_2.Text = "Level: 50"
settingdescription_2.TextColor3 = Color3.fromRGB(56, 56, 56)
settingdescription_2.TextScaled = true
settingdescription_2.TextSize = 14.000
settingdescription_2.TextTransparency = 0.200
settingdescription_2.TextWrapped = true
settingdescription_2.TextXAlignment = Enum.TextXAlignment.Left
settingdescription_2.TextYAlignment = Enum.TextYAlignment.Top

toggle_2.Name = "toggle"
toggle_2.Parent = BattlePass
toggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
toggle_2.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
toggle_2.BackgroundTransparency = 1.000
toggle_2.BorderColor3 = Color3.fromRGB(0, 53, 42)
toggle_2.BorderSizePixel = 0
toggle_2.Position = UDim2.new(0.911248922, 0, 0.493629992, 0)
toggle_2.Size = UDim2.new(0.132318497, 0, 0.677820981, 0)

ImageLabel_2.Parent = toggle_2
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 16, 53)
ImageLabel_2.Position = UDim2.new(0.146694884, 0, -0.017772669, 0)
ImageLabel_2.Size = UDim2.new(0, 58, 0, 58)
ImageLabel_2.Image = "rbxassetid://13110085209"

button_3.Name = "button"
button_3.Parent = BattlePass
button_3.AnchorPoint = Vector2.new(0.5, 0.5)
button_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button_3.BackgroundTransparency = 1.000
button_3.BorderSizePixel = 0
button_3.Position = UDim2.new(0.5, 0, 0.5, 0)
button_3.Size = UDim2.new(1, 0, 1, 0)
button_3.ZIndex = 69420
button_3.Font = Enum.Font.SourceSans
button_3.Text = ""
button_3.TextColor3 = Color3.fromRGB(0, 0, 0)
button_3.TextScaled = true
button_3.TextSize = 14.000
button_3.TextWrapped = true

Gold.Name = "Gold"
Gold.Parent = scrollingcontainer
Gold.AnchorPoint = Vector2.new(0.5, 0.5)
Gold.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Gold.BorderSizePixel = 0
Gold.Position = UDim2.new(0.498659164, 0, 0.0846864656, 0)
Gold.Size = UDim2.new(1, 0, 0.129999995, 0)

UICorner_9.CornerRadius = UDim.new(0.0900000036, 0)
UICorner_9.Parent = Gold

settingname_3.Name = "settingname"
settingname_3.Parent = Gold
settingname_3.AnchorPoint = Vector2.new(0.5, 0.5)
settingname_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingname_3.BackgroundTransparency = 1.000
settingname_3.BorderSizePixel = 0
settingname_3.Position = UDim2.new(0.301084191, 0, 0.385828108, 0)
settingname_3.Size = UDim2.new(0.526023269, 0, 0.199222088, 0)
settingname_3.Font = Enum.Font.GothamMedium
settingname_3.Text = "Gold"
settingname_3.TextColor3 = Color3.fromRGB(56, 56, 56)
settingname_3.TextScaled = true
settingname_3.TextSize = 14.000
settingname_3.TextWrapped = true
settingname_3.TextXAlignment = Enum.TextXAlignment.Left

settingdescription_3.Name = "settingdescription"
settingdescription_3.Parent = Gold
settingdescription_3.AnchorPoint = Vector2.new(0.5, 0.5)
settingdescription_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingdescription_3.BackgroundTransparency = 1.000
settingdescription_3.BorderSizePixel = 0
settingdescription_3.Position = UDim2.new(0.416889697, 0, 0.599523365, 0)
settingdescription_3.Size = UDim2.new(0.757999957, 0, 0.145695731, 0)
settingdescription_3.Font = Enum.Font.Gotham
settingdescription_3.Text = "Amout: 100,000"
settingdescription_3.TextColor3 = Color3.fromRGB(56, 56, 56)
settingdescription_3.TextScaled = true
settingdescription_3.TextSize = 14.000
settingdescription_3.TextTransparency = 0.200
settingdescription_3.TextWrapped = true
settingdescription_3.TextXAlignment = Enum.TextXAlignment.Left
settingdescription_3.TextYAlignment = Enum.TextYAlignment.Top

toggle_3.Name = "toggle"
toggle_3.Parent = Gold
toggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
toggle_3.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
toggle_3.BackgroundTransparency = 1.000
toggle_3.BorderColor3 = Color3.fromRGB(0, 53, 42)
toggle_3.BorderSizePixel = 0
toggle_3.Position = UDim2.new(0.911248922, 0, 0.493629992, 0)
toggle_3.Size = UDim2.new(0.132318497, 0, 0.677820981, 0)

ImageLabel_3.Parent = toggle_3
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 16, 53)
ImageLabel_3.Position = UDim2.new(0.146694884, 0, -0.017772669, 0)
ImageLabel_3.Size = UDim2.new(0, 58, 0, 58)
ImageLabel_3.Image = "rbxassetid://10481692479"

button_4.Name = "button"
button_4.Parent = Gold
button_4.AnchorPoint = Vector2.new(0.5, 0.5)
button_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button_4.BackgroundTransparency = 1.000
button_4.BorderSizePixel = 0
button_4.Position = UDim2.new(0.5, 0, 0.5, 0)
button_4.Size = UDim2.new(1, 0, 1, 0)
button_4.ZIndex = 69420
button_4.Font = Enum.Font.SourceSans
button_4.Text = ""
button_4.TextColor3 = Color3.fromRGB(0, 0, 0)
button_4.TextScaled = true
button_4.TextSize = 14.000
button_4.TextWrapped = true

UIAspectRatioConstraint_2.Parent = settings_2
UIAspectRatioConstraint_2.AspectRatio = 1.536

-- Functions:

function SetGems(Value)
    settingdescription.Text = "Amount : " .. AddComma(Value)
end

function SetBattlePass(Value)
    settingdescription_2.Text = "Level : " .. AddComma(Value)
end

function SetBattlePadss(Value)
    settingdescription_3.Text = "Amount : " .. AddComma(Value)
end

local UserInputService = game:GetService("UserInputService")

local function onInputBegan(input, _gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.RightControl then
		game:GetService("CoreGui").alpineMaterialUI.Enabled = not game:GetService("CoreGui").alpineMaterialUI.Enabled
	end
end

UserInputService.InputBegan:Connect(onInputBegan)

-- Scripts:
spawn(function ()
    while true do
        pcall(function ()
            SetGems(tonumber(game.Players.LocalPlayer["_stats"]["gem_amount"].Value))
            SetBattlePass(GetBattlePassLv())
            SetBattlePadss(tonumber(game:GetService("Players").LocalPlayer["_stats"]["gold_amount"].Value))
        end)
        wait(1)
    end
end)

if game.PlaceId == 8304191830 then
spawn(function ()
	for i = 1, 20, 1 do wait()
		game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_daily_reward:InvokeServer()
		wait(.1)
		game:GetService("ReplicatedStorage").endpoints.client_to_server.claim_christmas_calendar_reward:InvokeServer()
	end
end)
for i,v in pairs(Code) do
    game:GetService("ReplicatedStorage").endpoints.client_to_server.redeem_code:InvokeServer(v)
end
if game:GetService("Workspace"):FindFirstChild('EasterArea') then
	for i,v in pairs(getconnections(game:GetService("Workspace").EasterArea.leaderboard.main.Surface.ScrollingFrame.Feed.Activated)) do
		v:Fire()
	end
	wait()
	for i,v in pairs(getconnections(game:GetService("Workspace").EasterArea.leaderboard.main.Surface.ScrollingFrame.Button.Activated)) do
		v:Fire()
	end
end

function GetTicket()
	for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session.inventory['inventory_profile_data']['normal_items']) do
		if i == 'summon_ticket' then
			return true
		end
	end
	return false
end
local tableunit = {}

for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
    if i == 'session' then
        for i1,v1 in pairs(v['collection'].collection_profile_data['owned_units']) do
        	table.insert(tableunit,v1)
        end
    end
end
if #tableunit > 1 then
else
	repeat wait()
		if GetTicket() then
			ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, true, game, 1)
            ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, false, game, 1)
			game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_from_banner:InvokeServer("EventClover", "ticket")
		elseif plr["_stats"]["gem_amount"].Value >= 500 then
			ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, true, game, 1)
            ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, false, game, 1)
			game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_from_banner:InvokeServer("EventClover", "gems10")
		elseif plr["_stats"]["gem_amount"].Value <= 500 then
			ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, true, game, 1)
            ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, false, game, 1)
			game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_from_banner:InvokeServer("EventClover", "gems")
		end
	until plr["_stats"]["gem_amount"].Value <= 49 
end
spawn(function ()
	for i = 1, 10, 1 do
		ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, true, game, 1)
        ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, false, game, 1)
	end
end)
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("collection")
game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
function UnitCanEquip()
	local tableUnitCheck = {}
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["spawn_units"].Lives.Frame.Units:GetChildren()) do
		if v:IsA('ImageButton') then
			if v.locked.Visible == false then
				table.insert(tableUnitCheck,v.Name)
			end
		end
	end
	return #tableUnitCheck
end
	function UnitBest()
		local TableUnit = {}
		local UnitName = {}
		local UnitAll = {}
		local collection = nil
		for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
			if i == 'session' then
				for i1,v1 in pairs(v) do
					if i1 == 'collection' then
						collection = v1
					end
				end
			end
		end
		for i = 1,UnitCanEquip() do wait()
			local LevelCount = 0
			local UnitBest = nil
			local NameUnit = nil
			for i2,v2 in pairs(collection.collection_profile_data['owned_units']) do wait(.08)
				if not table.find(TableUnit,tostring(i2)) and not table.find(UnitName,v2['unit_id']) then
					local LevelNotReal = tonumber((require(game:GetService("ReplicatedStorage").src.Data.Units)[v2.unit_id].damage -- * calculate_static_stat_multiplier(v2,v2.xp,"damage")))
					if tonumber(LevelNotReal) > LevelCount then
						UnitBest = v2['uuid'] 
						NameUnit = v2['unit_id']
						LevelCount = tonumber(LevelNotReal)
					end
				end
			end
			game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(UnitBest)
			table.insert(TableUnit,UnitBest)
			table.insert(UnitName,NameUnit)
		end
		for i = 1,4 do wait()
			UnitAll[#UnitAll + 1] = {TableUnit[i],UnitName[i]}
		end
		return UnitAll
	end
	local fristunit = UnitBest()

	function Upgrade()
		local collection = nil
		for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
			if i == 'session' then
				for i1,v1 in pairs(v) do
					if i1 == 'collection' then
						collection = v1
					end
				end
			end
		end
		for i2,v2 in pairs(collection.collection_profile_data['owned_units']) do wait()
			if fristunit[1][1] ~= tostring(i2) and fristunit[2][1] ~= tostring(i2)  and fristunit[3][1] ~= tostring(i2) and fristunit[4][1] ~= tostring(i2) then
				local args = {
					[1] = fristunit[1][1],
					[2] = {
						[1] = v2['uuid'] 
					}
				}
				game:GetService("ReplicatedStorage").endpoints.client_to_server.feed_units:InvokeServer(unpack(args))
			end
		end
	end
	Upgrade()

wait(1)
function CheckRoom()
    for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetChildren()) do
        if v:IsA('Model') then
            for i1, v1 in pairs(v:GetChildren()) do
                if v1.Name == 'Owner' and tostring(v1.Value) == tostring(game.Players.LocalPlayer.Name) then
                    return {true,v.Name}
                end
            end
        end
    end
    return {false}
end
function Room()
    for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetChildren()) do
        if v:IsA('Model') then
            for i1, v1 in pairs(v:GetChildren()) do
                if v1.Name == 'Owner' and tostring(v1.Value) == 'nil' then
                    return v.Name
                end
            end
        end
    end
end
local MapLevelPlay = {}
for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
	if i == 'session' then
		for i1,v1 in pairs(v) do
			if i1 == 'profile_data' then
			    for i2,v2 in pairs(v1['level_data']['completed_story_levels']) do
			        if i2:find('namek_level') then
    			        table.insert(MapLevelPlay,i2)
			        end
			    end
			end
		end
	end
end
spawn(function ()
    while true do
            pcall(function ()
                if game.PlaceId == 8304191830 then
                    OldCframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    if CheckRoom()[1] == true then
                        if #MapLevelPlay < 6 then
		                    wait(1)
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(CheckRoom()[2], "namek_level_" .. tostring(#MapLevelPlay + 1),true,"Normal")
                            wait(.3)
                        else
		                    wait(1)
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(CheckRoom()[2], "namek_infinite",true,"Hard")
                            wait(.3)
                        end
                        wait(1)
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(CheckRoom()[2])
                        wait(1)
                    else
		                wait(2.5)
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(Room())
                    end
                end 
            end)
        wait()
    end
end)
else
		for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient")) do
			if i == 'session' then
				for i1,v1 in pairs(v) do
					if i1 == 'collection' then
						collection = v1
					end
				end
			end
		end

	function GetFristEnemie()
		local LaneReal = 0
		local Enemy = nil
		for i, v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
			if v:IsA('Model') and v:WaitForChild('HumanoidRootPart') and v:FindFirstChild('HumanoidRootPart') and v:WaitForChild("_stats") and tostring(v["_stats"].base.Value) == 'pve'  then
				if tostring(v["_stats"]["last_reached_bend"].Value):match('%d+') then
					local Lane = tostring(v["_stats"]["last_reached_bend"].Value)
					if tonumber(Lane) >= LaneReal then
						Enemy = v
						LaneReal = tonumber(Lane)
					end
				end
			end
		end
		return Enemy
	end

	local args = {
        [1] = "autoskip_waves",
        [2] = true
    }
    
    game:GetService("ReplicatedStorage").endpoints.client_to_server.toggle_setting:InvokeServer(unpack(args))
	spawn(function ()
		while wait() do
			pcall(function ()
				for i2,v2 in pairs(collection.collection_profile_data['owned_units']) do wait(.2)
					if GetFristEnemie() == nil then
						 game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(i2,GetFristEnemie1().HumanoidRootPart.CFrame * CFrame.new(0,-1,0))
					else
						game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(i2,GetFristEnemie().HumanoidRootPart.CFrame * CFrame.new(0,-1,0))
					end
				end
			end)
		end
	end)
	spawn(function ()
        while true do
            pcall(function ()
                for i,v in pairs(workspace._UNITS:GetChildren()) do
                    if v:IsA('Model') and v:WaitForChild('HumanoidRootPart') and v:FindFirstChild('HumanoidRootPart') and v:WaitForChild("_stats") and tostring(v["_stats"].base.Value) == 'player' then
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                    end
                end
            end)
            wait(1)
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.ResultUi then
                    wait(90)
                    local ts = game:GetService("TeleportService") local p = game.Players.LocalPlayer ts:Teleport(8304191830, p) 
                end
            end) 
        end
    end)

    spawn(function ()
		while true do
			pcall(function ()
				if game.PlaceId == 8304191830  then
				else
					if game:GetService("Workspace")["_DATA"].GameFinished.Value == true and game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true then
						if game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Visible == true then
							wait(1)	
							for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Buttons.Next.Activated)) do
								v:Fire()
							end  
						else
							_G.ResultUi = true
						end
					end
				end
			end)
			wait(1)
		end
	end)
    spawn(function ()
		while true do
			pcall(function ()
				if game.PlaceId == 8304191830  then
				else
					if  _G.WebhookX and _G.AlreadySend == nil then
                        wait(.4)
						local plr = game.Players.LocalPlayer
                        local HttpRequest 
                        if syn then
                        HttpRequest = syn.request
                        else
                        HttpRequest = http_request
                        end
                        local function GetBattlePassLv()
                            local tableins = {}
                            for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session['profile_data']['battlepass_data']['cake_april'].claimed_tiers['normal']) do
                                table.insert(tableins,v)
                            end
                            return #tableins
                        end
                        local NewData = {
                            ["content"] = "",
                            ["username"] = "Xenon 4.0 - Modifier",
                            ["avatar_url"] = "https://sv1.picz.in.th/images/2023/04/25/yTSA02.png",
                            ["embeds"] = {{
                            ["title"] = "Anime Adventures",
                            ["description"] = ("**Username:** || %s ||\n**Level:** %s\n**Gems:** %s\n**Battle Pass:** %s"):format(plr.Name,plr.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split('Level ')[2],game.Players.LocalPlayer["_stats"]["gem_amount"].Value,GetBattlePassLv()),
                            ["type"] = "rich",
                            ["color"] = tonumber(0xB26BF6),
                            ["thumbnail"] = {
                                ["url"] = "https://tr.rbxcdn.com/a9a337cb36067a7539cea136a5c2c81b/150/150/Image/Png"
                            },
                            ["footer"] = {
                            ["text"] = "// Custom [x2Swift x Skyloland]",
                            ["icon_url"] = "https://yt3.googleusercontent.com/ytc/AL5GRJV1yMPLJbodCWa7L-hTq9Zk90o1nIy2cFzpyFSmcA=s900-c-k-c0x00ffffff-no-rj"
                                    },
                                }}
                        }
                        HttpRequest({Url=getgenv().KaitanConfig["WebhookUrl"] , Body=game:GetService('HttpService'):JSONEncode(NewData), Method="POST", Headers={["content-type"] = "application/json"}})
                        _G.AlreadySend = true
                    end
				end
			end)
			wait(1)
		end
	end)

	spawn(function ()
		while true do
			pcall(function ()
				if game.PlaceId == 8304191830  then
				else
					if game:GetService("Workspace")["_DATA"].GameFinished.Value == true and game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true then
						if game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Visible == true then
						else
							_G.ResultUi = true
						end
					end
				end
			end)
			wait(1)
		end
	end)
	spawn(function ()
        while true do
            pcall(function ()
                if game.PlaceId == 8304191830 then
                else
                    if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
                        if _G.ResultUi then
							if not game:GetService("TeleportService"):GetLocalPlayerTeleportData().level_data.levelData['id']:find('infinite') then
                                _G.WebhookX = true
                                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Finished.NextLevel.Activated)) do
                                    v:Fire()
                                end 
							else
                                _G.WebhookX = true
								for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Finished.NextRetry.Activated)) do
									v:Fire()
								end 
							end
                        end  
                    end
                end
            end)
            wait(1)
        end
    end)
	spawn(function ()
        while true do
                pcall(function ()
                    if game.PlaceId == 8304191830 then
                    else
                        if game:GetService("Players").LocalPlayer.PlayerGui.VoteStart.Enabled == true then
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
                        end
                    end
                end)
            wait()  
        end
    end)
	
	--[[spawn(function ()
        while true do
			pcall(function ()
				for i,v in pairs(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session['quest_handler']['quest_profile_data']['quests']) do
					local night1 = is_quest_complete(require(game.ReplicatedStorage.src.Loader).load_client_service(game:GetService("Players").LocalPlayer.PlayerScripts.main, "UnitCollectionServiceClient").session,v)
					if night1 == true then
						game:GetService("ReplicatedStorage").endpoints.client_to_server.redeem_quest:InvokeServer(v['uuid'])
					end
				end
			end)
            wait(2)  
        end
    end)]]
	
    game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false

end

getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        wait(30)
        local ts = game:GetService("TeleportService") local p = game.Players.LocalPlayer ts:Teleport(8304191830, p) 
    end
end) 



