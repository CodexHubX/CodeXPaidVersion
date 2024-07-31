loadstring(game:HttpGet("https://raw.githubusercontent.com/CodexHubX/CodeXPaidVersion/main/Config%20V4%20%5B1%5D.lua"))()

-- if not LPH_OBFUSCATED  then 
--     getgenv().Configuration = {
--         ['Enabled'] = true,
--         ['Enabled Challenge'] = false,
--         ['Summon The Beast'] = true,
--         ['PC Name'] = 'V4 [1]',
--         ['Delay'] = 0,
--         ['Leave Delay'] = 0,
--         ['EquipBest'] = true,
--         ['Leave At Wave'] = 31,
--         ['Leave Method'] = 1, -- 1 = Sell,  2 = Leave
--         ['TradingMode'] = false,
--         ['License'] = 'JameFarmOnTop',
--    };
--    getgenv().warn = function() return end;
-- end

-- if LPH_OBFUSCATED  then 
--     getgenv().warn = function() return end;
-- end;
getgenv().warn = function() return end;

if not getgenv().Configuration['Delay'] then
    getgenv().Configuration['Delay'] = 0
end

if not getgenv().Configuration['License'] then 
    getgenv().Configuration['License'] = 'CodeXZaZa'
end;

if not getgenv().Configuration['Main User'] then 
    getgenv().Configuration['Main User'] = '';
end;

if getgenv().Configuration['EquipBest'] == nil then
    getgenv().Configuration['EquipBest'] = true
end

if getgenv().Configuration['Summon The Beast'] == nil then
    getgenv().Configuration['Summon The Beast'] = false
end

if getgenv().Configuration['Enabled Challenge'] == nil then
    getgenv().Configuration['Enabled Challenge'] = false
end

if not getgenv().Configuration['Leave Delay'] then
    getgenv().Configuration['Leave Delay'] = 5
end

if not getgenv().Configuration['Leave At Wave'] then
    getgenv().Configuration['Leave At Wave'] = 31
end

if not getgenv().Configuration['Leave Method'] then
    getgenv().Configuration['Leave Method'] = 1
end

warn(([[
    Configurations:
    Enabled: %s
    PC Name: %s
    Delay: %s
    Leave Delay: %s
    Leave At Wave: %s
    Leave Method: %s
    Enabled Challenge: %s
]]):format(tostring(getgenv().Configuration['Enabled']), getgenv().Configuration['PC Name'], getgenv().Configuration['Delay'], getgenv().Configuration['Leave Delay'], getgenv().Configuration['Leave At Wave'], getgenv().Configuration['Leave Method'], tostring(getgenv().Configuration['Enabled Challenge'])))

if (not getgenv().DeveloperMode and LPH_OBFUSCATED) then
    getgenv().warn = function() return end;
end;

local start_load = tick();

repeat task.wait(); until game:IsLoaded();

if (game.GameId ~= 5836869368) then
    warn('Not : Anime Defenders');
    game.Players.LocalPlayer:Kick('An error occurred.');
    return;
end;

if (game.PlaceId == 17764698696) then
    local Avatar = {
        AccessGranted = false,
        Hairs = {376527350, 376526888, 376524487, 62234425, 376548738},
        Shirts = {382537085, 382537702, 382538295, 382538059},
        Pants = {382537702, 382537806, 382538503, 382537950},
    }

    local AvatarEditorService = game:GetService("AvatarEditorService")
    local Players = game:GetService("Players")

    local LocalPlayer = Players.LocalPlayer

    AvatarEditorService:PromptAllowInventoryReadAccess()

    if not Avatar.AccessGranted then
        local Result = AvatarEditorService.PromptAllowInventoryReadAccessCompleted:Wait()

        if Result == Enum.AvatarPromptResult.Success then
            Avatar.AccessGranted = true
        end
    end

    if Avatar.AccessGranted then
        local AssetTypes = {
            Enum.AvatarAssetType.HairAccessory,
            Enum.AvatarAssetType.Shirt,
            Enum.AvatarAssetType.Pants,
        }
        local PagesObject = AvatarEditorService:GetInventory(AssetTypes)
        local Pages = PagesObject:GetCurrentPage()

        local toWear = {
            Hairs = {},
            Shirts = {},
            Pants = {},
        }

        for _, Asset in ipairs(Pages) do
            if table.find(Avatar.Hairs, Asset.AssetId) then
                table.insert(toWear.Hairs, Asset.AssetId)
            end
            if table.find(Avatar.Shirts, Asset.AssetId) then
                table.insert(toWear.Shirts, Asset.AssetId)
            end
            if table.find(Avatar.Pants, Asset.AssetId) then
                table.insert(toWear.Pants, Asset.AssetId)
            end
        end

        local HumanoidDescription = Instance.new("HumanoidDescription")

        local SkinTone = Color3.fromRGB(237, 213, 180)

        HumanoidDescription.HairAccessory = toWear.Hairs[math.random(1, #toWear.Hairs)]
        HumanoidDescription.Head = '10638267973'
        HumanoidDescription.MoodAnimation = '2510235063'
        HumanoidDescription.IdleAnimation = '10647852134'

        HumanoidDescription.Shirt = toWear.Shirts[math.random(1, #toWear.Shirts)]
        HumanoidDescription.Pants = toWear.Pants[math.random(1, #toWear.Pants)]

        HumanoidDescription.HeadColor = SkinTone
        HumanoidDescription.LeftArmColor = SkinTone
        HumanoidDescription.LeftLegColor = SkinTone
        HumanoidDescription.RightArmColor = SkinTone
        HumanoidDescription.RightLegColor = SkinTone
        HumanoidDescription.TorsoColor = SkinTone

        AvatarEditorService:PromptSaveAvatar(HumanoidDescription, LocalPlayer.Character.Humanoid.RigType)

        AvatarEditorService.PromptSaveAvatarCompleted:Wait()

        game.StarterGui:SetCore("SendNotification", {
            Title = "Avatar",
            Text = "Avatar has been updated!".. tostring(game.PlaceId),
            Duration = 5,
        })

        getgenv().Teleport = true;

        task.wait(5);

        if game.PlaceId ~= 17017769292 then
            game:GetService('TeleportService'):Teleport(17017769292)
        else
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    end

    while true do task.wait(60)
    end;
end;

local Service = {};
local mt_service = setmetatable(Service,{
    __index = function(self,key)
        return game:GetService(tostring(key));
    end;
});

local ReplicatedStorage = Service['ReplicatedStorage']
local LocalPlayer = game.Players.LocalPlayer;
local VirtualInputManager = Instance.new('VirtualInputManager');
local VirtualUser = Service['VirtualUser']
local UserInputService = Service['UserInputService']
local PlaceId = game.PlaceId;
local RunService = Service['RunService']
local HttpService = Service['HttpService']
local Players = Service['Players']
local TeleportService = Service['TeleportService']

repeat 
    task.wait()
until ReplicatedStorage:FindFirstChild('Actions') and ReplicatedStorage.Actions:FindFirstChild('Action')

local Action = ReplicatedStorage:WaitForChild('Actions'):WaitForChild('Action')
local Actions = require(ReplicatedStorage.Actions);
local CollectionService = Service['CollectionService'];
local MarketplaceService = Service['MarketplaceService']
getgenv().http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request or httpget or nil

local base64encode = crypt and crypt.base64 and crypt.base64.encode or base64 and base64.encode or nil
local Ingame = true;

if (PlaceId == 17017769292 or PlaceId == 17764698696) then
    Ingame = false;
end;

if not LPH_OBFUSCATED then
    getfenv()["LPH" .. "_NO_VIRTUALIZE"] = function(f) return f end
    getfenv()["LPH" .. "_JIT_MAX"] = function(f) return f end
    getfenv()["LPH" .. "_JIT"] = function(f) return f end
end

local Finished = false

-- local function BypassAntiCheat()
--     local Actions = require(ReplicatedStorage.Actions);
--     local ActionRemote = ReplicatedStorage:WaitForChild('Actions'):WaitForChild('Action')

--     local metamethod = getrawmetatable(Actions)
--     local old_metamethod = metamethod.__index;

--     local bypass_metamethod = setrawmetatable(Actions,{
--         __index = old_metamethod,
--         __call = function(self, ...) return LocalPlayer:Kick('AntiCheat: Trigger') end;
--     })

--     if (getrawmetatable(Actions).__tostring) then
--         warn('bypass fail pls rejoin');
--         return;
--     end;
    
--     if not getgenv().Hooked then
--         local LocalPlayer = game:GetService('Players').LocalPlayer
--         local oldNamecall;oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
--             local Args = {...}
--             local Method = getnamecallmethod()
--             local CallingScript = getcallingscript()

--             if Method == 'FireServer' and self.Name == 'Action' and (Args[1] == nil or Args[1] == LocalPlayer or Args[1] == LocalPlayer.UserId or Args[1] == LocalPlayer.Name) then
--                 -- warn('game tryna ban u, but we stopped it!', Args[1], CallingScript)
--                 warn('[Network Reverse Tool V1.0] : Detected a ban request from the game, but we stopped it!', Args[1], CallingScript)
--                 return wait(9e9)
--             end

--             return oldNamecall(self, ...)
--         end)
--         getgenv().Hooked = true
--     end

--     getgenv().AntiCheatBypass = true;
--     warn('LOL Bypass Sucess By Code X L Game')
-- end;

-- BypassAntiCheat();


-- local function GetRemoteKey()
--     if (not getgenv().AntiCheatBypass) then return end;
--     local rermoteKey = {}
--     local Actions = require(ReplicatedStorage.Actions);
--     local KeyIgnoreList = {'UNIT_UNSELECT','UNIT_TOGGLE_ACTIVE','UNIT_PLACEMENT_UNEQUIPT','UNIT_SELECT','UNIT_FORCE_DESELECT'}

--     for key,data in next, Actions do
--         if (not table.find(KeyIgnoreList,tostring(key))) then
--             rermoteKey[tostring(key)] = data.name
--         end;
--     end;

--     return rermoteKey
-- end;

-- local RemoteKey = GetRemoteKey();

function GiveKey(Key)
    if (not Key or not Actions[Key]) then return end;
    return Actions[Key];
end;

function BypassAntiCheat()  

    local metamethod = getrawmetatable(Actions)
    metamethod.__tostring = nil;

    local oldNamecall;oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local Args = {...}
        local Method = getnamecallmethod()

        if Method == 'FireServer' and self.Name == 'Action' and (Args[1] == nil or Args[1] == LocalPlayer or Args[1] == LocalPlayer.UserId or Args[1] == LocalPlayer.Name) then
            warn('[Network Reverse Tool V1.0] : Detected a ban request from the game, but we stopped it!')
            return wait(9e9)
        end

        return oldNamecall(self, ...)
    end);

    getgenv().AntiCheatBypass = true;
end;

BypassAntiCheat();

function GetBitbufModules()
    for _,v in next, Actions do 
        if (v.Fire) then 
            local bitbuf = debug.getupvalue(v.Fire,16);
            if (bitbuf and type(bitbuf) == 'table' and bitbuf.new) then 
                warn('L bypass...')
                return bitbuf;
            end;
        end;
    end;
    return nil;
end;

local Bitbuf =  GetBitbufModules()
    
if (not Bitbuf) then 
    LocalPlayer:Kick('bypass not working...')
end;


local SupportType = {
    ["string"] = true,
	["boolean"] = true,
	["number"] = true
}

local function IsSupported(argument)
    for Int, value in argument do
		if typeof(value) == "table" then
			IsSupported(value)
		elseif SupportType[typeof(value)] then
			if not SupportType[typeof(value)] then
				error('not support..')
			end
		else
			error('not support..')
		end
	end
end;

local Network = {}

function Network.Fire(Key,...)
    if (not Key or not Key.Fire) then return end;
    --local CanSupport = IsSupported({...})
    local Support, notSupport = pcall(IsSupported, { ... })

    if (Support) then 
        --warn('Support...')
        if (Bitbuf and type(Bitbuf) == 'table' and Bitbuf.new) then 
            local Encode = HttpService:JSONEncode({Key.name , ... });
            local newBuffer = Bitbuf.new();
            local fakeNumber = math.random(42, 48);
            if (fakeNumber + 9 + 19) % 8 == 0 then 
                fakeNumber = fakeNumber + math.random(1, 4)
            end;

            newBuffer:writeUnit(9, fakeNumber)
            local serverTime = workspace:GetServerTimeNow();
            newBuffer:WriteUint(fakeNumber, (math.floor(serverTime)))
            newBuffer:writeUnit(19, #Encode)
            newBuffer:WriteBytes(Encode)
            newBuffer:writeUnit(math.random(5, 10), math.random(1, 31))

            return Action:FireServer(newBuffer:String());
        end;

        --warn('not Support')
        return Action:FireServer(Key.name, ... );
    end;

    --warn('Remote not found..');
    return nil;
end;    

function Network.Invoke(Key,...)
    if (not Key or not Key.Invoke) then return end;
    local Remote = ReplicatedStorage.Actions.Invokables:WaitForChild(Key.name)
    local Support, notSupport = pcall(IsSupported, { ... })

    if (Support) then 

        warn('Remote: ', Remote)

        if (Bitbuf and type(Bitbuf) == 'table' and Bitbuf.new) then 

            local Encode = HttpService:JSONEncode({...});
            local newBuffer = Bitbuf.new();
            local fakeNumber = math.random(42, 48);
            if (fakeNumber + 9 + 19) % 8 == 0 then 
                fakeNumber = fakeNumber + math.random(1, 4)
            end;

            newBuffer:writeUnit(9, fakeNumber)
            local serverTime = workspace:GetServerTimeNow();
            newBuffer:WriteUint(fakeNumber, (math.floor(serverTime)))
            newBuffer:writeUnit(19, #Encode)
            newBuffer:WriteBytes(Encode)
            newBuffer:writeUnit(math.random(5, 10), math.random(1, 31))

            return Remote:InvokeServer(newBuffer:String());
        end;

        return Remote:InvokeServer(Key.name, ... );
    end;

    return nil; 
end;



local Main={};
local mt = setmetatable(Main,{
    __call = function(self,...)
        return (getmetatable(self));
    end,
    connections={},
    Thread={},
    ChallengeDifficulty={},
    ChapterData={},
    Codes = {},
    HillCFrame = {},
    Story={
        Map={},
        Chapter ={
            'Chapter1',
            'Chapter2',
            'Chapter3',
            'Chapter4',
            'Chapter5',
            'Chapter6',
            'Infinite',
        },
        Difficulty ={
            'Normal',
            'Hard',
        }
    },
})


local Cooldown= {};
local mt_cooldown = setmetatable(Cooldown,{
    __index = function(self,key)
        self[tostring(key)] = 0;
        return 0;
    end;
})

local ChapterData=require(ReplicatedStorage.Modules.Bins.ChapterData);
local ChallengeDifficulty=require(ReplicatedStorage.Modules.Bins.ModifierData);
local MapData = require(ReplicatedStorage.Modules.Bins.MapData)
local UnitData = require(ReplicatedStorage.Modules.Bins.UnitData)
local UnitUpgradeData = require(ReplicatedStorage.Modules.Bins.UnitUpgradeData)
local UnitUtils = require(ReplicatedStorage.Modules.Bins.UnitUtils);
local Values = require(ReplicatedStorage.Values);

if not getgenv().Configuration['TradingMode'] then
    ChapterData = require(ReplicatedStorage.Modules.Bins.ChapterData);
    ChallengeDifficulty = require(ReplicatedStorage.Modules.Bins.ModifierData);
    MapData = require(ReplicatedStorage.Modules.Bins.MapData)
    UnitData = require(ReplicatedStorage.Modules.Bins.UnitData)
    UnitUpgradeData = require(ReplicatedStorage.Modules.Bins.UnitUpgradeData)
    UnitUtils = require(ReplicatedStorage.Modules.Bins.UnitUtils);
    Values = require(ReplicatedStorage.Values);
else 
    Values = require(ReplicatedStorage.Values);
end;


function Main:IsCaptcha()
    return LocalPlayer.PlayerGui.PAGES.CaptchaPage.Visible;
end;

function Main:SolveCaptcha()
    local CaptchaPage = require(LocalPlayer.PlayerGui.PAGES.CaptchaPage.LocalCaptchaPage.CaptchaPage)
    if (not CaptchaPage.Update) then return end; 
    local Captchabuffer = debug.getupvalue(CaptchaPage.Update,2)
    local myBuffer = getrenv().buffer.fromstring(Captchabuffer);
    local rbxasset = getrenv().buffer.readf64(myBuffer, 16) - 21839
    local ProductInfo = MarketplaceService:GetProductInfo(rbxasset);
    if ProductInfo and ProductInfo.Name then 
        warn('Captcha: ', ProductInfo.Name)
        Network.Invoke(GiveKey('CAPTCHA_SOLVE'),ProductInfo.Name)
        task.wait(2.5);
    end;
end;

local TaskUpdate;
local MapInfo;

LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.InProgress then
        getgenv().Teleport = true

        for _,connection in next, Main().connections do
            if (connection) then
                warn('Disconnecting: ', connection)
                connection:Disconnect()
                connection = nil;
            end;
        end;

        for _,connection in next, Main().Thread do
            if (connection) then
                task.cancel(connection)
                connections = nil;
            end;
        end;
    end
end);

task.spawn(function()
    while (not getgenv().Teleport) do task.wait(60)
        if getgenv().Teleport then break end
        VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new(0,1,0,1));
    end;
end)

local TextBoxService = game:GetService('TextBoxService');

-- if LPH_OBFUSCATED then
--     Main.License = TextBoxService:GetAttribute('LineHeight')
--     Main.MergeAllowed = TextBoxService:GetAttribute('Text')
-- else
--     Main.License = 'JameFarmZaZa' --  'CodeXZaZa'
--     Main.MergeAllowed = true
-- end

Main.License = getgenv().Configuration['License']
Main.MergeAllowed = true


function Main:HiddenName(State)
    if (not State) then
        if (getmetatable(Main).connections.HiddenName) then
            getmetatable(Main).connections.HiddenName:Disconnect();
            getmetatable(Main).connections.HiddenName = nil;
        end;
        return;
    end;

    getmetatable(Main).connections.HiddenName = RunService.Heartbeat:Connect(function()
        game.CoreGui.PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame["p_"..game.Players.LocalPlayer.UserId].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = "Protected By Xenon Hub"
    end);
end;

function Main:FPSBooster()
    pcall(function()
        if (not Settigs["FPS Booster"]) then return end;
        for _,v in pairs(workspace:GetDescendants()) do
            if v.ClassName == "Part"
                or v.ClassName == "SpawnLocation"
                or v.ClassName == "WedgePart"
                or v.ClassName == "Terrain"
                or v.ClassName == "MeshPart" then
                v.Material = "Plastic"
            end
        end
    end)
end;

function Main:ToggleWhiteScreen(State)
    pcall(function()
        if (not State) then
            RunService:Set3dRenderingEnabled(true);
            return
        end;

        RunService:Set3dRenderingEnabled(false);
        return
    end)
end;

function Main:PressButton(Button)
    VirtualInputManager:SendMouseButtonEvent(Button.AbsolutePosition.X + Button.AbsoluteSize.X / 2, Button.AbsolutePosition.Y + Button.AbsoluteSize.Y / 2 + 35, 0, true, nil, 1)
    VirtualInputManager:SendMouseButtonEvent(Button.AbsolutePosition.X + Button.AbsoluteSize.X / 2, Button.AbsolutePosition.Y + Button.AbsoluteSize.Y / 2 + 35, 0, false, nil, 1)
end;

function Main:GetInventory()
    return game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()
end

spawn(function()
    while (not getgenv().Teleport) do task.wait(.1)
        pcall(function()
            if (Main:IsCaptcha()) then 
                Main:SolveCaptcha();
                return;
            end;
        end)
    end;
end)

if getgenv().Configuration['TradingMode'] then 
    warn('TradingMode Enabled')
    if (PlaceId == 17017769292 or PlaceId == 17764698696) and #getgenv().Configuration['Main User'] > 0 then 
        local JoinUser = task.spawn(function()
            while task.wait(1) do 
                pcall(function()    
                    Network.Fire(GiveKey('GAME_MODE_SELECTED_CTS'),'TradingLobby',tostring(getgenv().Configuration['Main User']))
                end);
            end;
        end);
    end;
    while true do 
        task.wait(10)
    end;
end;

function Main:IsSlotAvailable()
    local inventory = Main:GetInventory();
    local equipped, maxEquip = inventory.EquippedUnits, inventory.MaxEquippedUnits

    if (#equipped < maxEquip) then
        return true;
    end;

    return false;
end;

function Main:CheckDifferentUnits()
    local inventory = Main:GetInventory();
    local units = inventory.Units;
    local equipped, maxEquip = inventory.EquippedUnits, inventory.MaxEquippedUnits
    local different = {}

    for i,v in next, units do
        if (not table.find(different,v.Type)) then
            table.insert(different,v.Type)
        end;
    end;

    --local empty = (maxEquip - #equipped);
    if (#different >= maxEquip) then
        return true
    end;

    return false;
end

setreadonly(table, false);

function table.filter( t, func, withKeys )
    local result = {};

    for key, value in pairs (t) do
        if func(value, key, t) then
            if withKeys then
                result[key] = value;
            else
                table.insert(result, value);
            end;
        end;
    end;

    return result;
end;

setreadonly(table, true);

function Main:FetchBestStory()
    local Chapters = Main:GetInventory().Chapters
    local HighestExp, Difficulty = 0, 'Normal'

    local Unlocked = table.filter(Chapters, function(v)
        return v.Unlocked
    end, true)

    for i,v in next, ChapterData do
        if Unlocked[i] and tostring(i):find('FooshaVillage') then
            if v.IsInfinite then
                return i, 'Hard'
            end

            local UnitXP = v.Difficulties['Normal'].UnitXP

            if UnitXP > HighestExp then
                HighestExp = UnitXP
                Difficulty = 'Normal'
                HighestChapter = i
            end
        end
    end

    return HighestChapter, Difficulty
end


function Main:RedeemCode()
    local Passed, Statement = pcall(function()
        return http_request({
            Url = "https://tryhardguides.com/anime-defenders-codes/"
        }).Body
    end)

    if Passed then
        local ended = false

        for line in Statement:gmatch("([^\r\n]+)") do
            if line:find("Roblox Games Codes") then
                ended = true
            end

            if ended then
                break
            end

            local code = line:match("<strong>(.+)</strong>")
            if code and not code:find(" ") then
                code = code:find('&') and code:split('&')[1] or code
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UseCode"):InvokeServer(tostring(code))
                task.wait(.1)
            end
        end
    end
end;

function Main:ClaimAllQuest()
    local inventory = Main:GetInventory()
    for i,v in next, inventory.Quests do
        if v.Required == v.Current and not v.Claimed then
            Network.Fire(GiveKey('QUEST_CLAIM'),i)
        end
    end
end

-- function Main:GetPods()
--     for i,v in next, LocalPlayer.PlayerGui.UI.GUIs:GetChildren() do
--         local TextHolder = v:FindFirstChild('TextHolder');
--         local MatchDisplayFrame = v:FindFirstChild('MatchDisplayFrame');
        
--         if (TextHolder and MatchDisplayFrame and TextHolder:FindFirstChild('EnterToPlayLabel') and TextHolder.EnterToPlayLabel.Visible) then 
--             return v.Adornee.Parent:FindFirstChild('Detector')
--         end;
--     end;   
-- end;



function Main:GetMergeGemData()
    if not Main.MergeAllowed then
        return {
            ['success'] = false,
            ['message'] = 'Merge Not Allowed',
        }
    end;

    local response;

    local passed, statement = pcall(function()
        response = http_request({
            Url = "https://defenders-backend.seriality.ai/api/v1/users/merge?key="..Main.License,
        })
    end)

    if (not passed) then
        warn('Error: ', statement)
        return {
            ['success'] = false,
            ['message'] = statement,
        }
    end;

    local data = HttpService:JSONDecode(response.Body)
    return data
end;


if (PlaceId == 17017769292 or PlaceId == 17764698696) then

    -- warn('update 2')

    -- local MergeGem = Main:GetMergeGemData();

    -- warn('MergeGemData', MergeGem.success, MergeGem.message)

    -- Cooldown.GetMergeGem = tick() + 30

    -- warn('MergeGem: ', MergeGem)

    -- if MergeGem.success then
    --     warn('success')
    --     local MergeData = MergeGem.mergeData
    --     local mergeAccount = MergeData.mergeAccount;
    --     local mergeGem = MergeData.mergeGem;
    --     warn(Main:GetInventory()['Currencies']['Gems'], tonumber(mergeGem))
    --     local RunService = game:GetService("RunService")
    --     RunService:Set3dRenderingEnabled(false)
    --     warn('mergeAccount: ', mergeAccount)

    --     local OwnerUnit = isfile('OwnerUnit.androssy') and readfile('OwnerUnit.androssy') or nil;

    --     if OwnerUnit then
    --         getgenv().OwnerUnit = OwnerUnit;
    --         if (LocalPlayer.Name ~= mergeAccount) then
    --             local Units = Main:GetInventory()['Units']
    --             if Units[OwnerUnit] then
    --                 while true do task.wait(30)
    --                     -- local Args = {
    --                     --     [1] = RemoteKey['GAME_MODE_SELECTED_CTS'],
    --                     --     [2] = "TradingLobby",
    --                     --     [3] = mergeAccount,
    --                     -- }
    --                     -- Action:FireServer(unpack(Args))
    --                 end
    --             else
    --                 delfile('OwnerUnit.androssy')
    --             end
    --         end
    --     end;


    --     if LocalPlayer.Name == mergeAccount or Main:GetInventory()['Currencies']['Gems'] >= tonumber(mergeGem) then
    --         local users = MergeData.user
    --         local found = false

    --         for _,v in next, users do
    --             if (v.robloxUsername == LocalPlayer.Name) then
    --                 found = true
    --                 break
    --             end
    --         end

    --         if found then
    --             Main().Thread.Gems = task.spawn(function()
    --                 while (not getgenv().Teleport) do task.wait(1)

    --                     if (tick()-Cooldown.GetMergeGem) > 30 then
    --                         Cooldown.GetMergeGem=tick()+30
    --                         MergeGem = Main:GetMergeGemData();
    --                     end;

    --                     local MergeData = MergeGem.mergeData;

    --                     if (LocalPlayer.Name == mergeAccount) then
    --                         -- local Args = {
    --                         --     [1] = RemoteKey['GAME_MODE_SELECTED_CTS'],
    --                         --     [2] = "TradingLobby",
    --                         -- }
    --                         -- Action:FireServer(unpack(Args))
    --                     else
    --                         local MergeGem = MergeData.mergeGem;
    --                         local users = MergeData.user;
    --                         -- local Args = {
    --                         --     [1] = RemoteKey['GAME_MODE_SELECTED_CTS'],
    --                         --     [2] = "TradingLobby",
    --                         --     [3] = mergeAccount,
    --                         -- }
    --                         -- Action:FireServer(unpack(Args))
    --                     end;
    --                 end
    --             end);

    --             while true do task.wait(60) end
    --         end
    --     end
    -- end;
end;

if (PlaceId == 17490500437) then
    
    -- local MergeGem = Main:GetMergeGemData();
    -- if MergeGem.success then
    --     local MergeData = MergeGem.mergeData;
    --     local mergeAccount = MergeData.mergeAccount;
    --     local MergeGem = MergeData.mergeGem;
    --     local users = MergeData.user;

    --     local MainUser = false;
    --     local MainUserName = mergeAccount;
    --     getgenv().Members = {}

    --     for _,v in next, users do
    --         if (v.robloxUsername ~= MainUserName) then
    --             table.insert(getgenv().Members, v.robloxUsername)
    --         end;
    --     end;

    --     warn('Members: ', #getgenv().Members)

    --     local Players = game.Players
    --     local BuyCost = tonumber(MergeGem)

    --     if (LocalPlayer.Name == MainUserName) then
    --         MainUser = true;
    --     end;

    --     task.spawn(function()
    --         if not MainUser then
    --             if not game:GetService("Players"):FindFirstChild(MainUserName) then
    --                 game:GetService("TeleportService"):Teleport(17017769292)
    --             end

    --             -- if setthreadidentity then
    --             --     setthreadidentity(2)
    --             -- end
                    
    --             local RunService = game:GetService("RunService")
    --             RunService:Set3dRenderingEnabled(false)

    --             while true do task.wait(30)
    --                 if not game:GetService("Players"):FindFirstChild(MainUserName) then
    --                     game:GetService("TeleportService"):Teleport(17017769292)
    --                 end
    --             end
    --         end
    --     end)

    --     if not getgenv().OwnerUnit then
    --         local Inventory = Main:GetInventory();
    --         local Units = Inventory['Units'];

    --         local OwnerUnitFile = isfile('OwnerUnit.androssy') and readfile('OwnerUnit.androssy') or nil;

    --         if OwnerUnitFile and Units[OwnerUnitFile] then
    --             getgenv().OwnerUnit = tostring(OwnerUnitFile);
    --         else
    --             getgenv().OwnerUnit = nil;
    --         end
    --     end

    --     function Main:GetValues()
    --         return require(game:GetService("ReplicatedStorage").Values);
    --     end;

    --     function Main:CheckBooth()
    --         local allBooth = CollectionService:GetTagged('Booth')
    --         if (allBooth and type(allBooth) == 'table') then
    --             for _,v in next, allBooth do
    --                 if (v:FindFirstChild('Root') and v.Root:FindFirstChild('SurfaceGui')) then
    --                     local Owner = v.Root.SurfaceGui:FindFirstChild('PlayerName');
    --                     if (Owner and Owner.Text == 'Your Booth') then
    --                         return true;
    --                     end;
    --                 end;
    --             end;
    --         end;
    --         return false;
    --     end;

    --     function Main:GetVoidBooth()
    --         for _,v in next, workspace.FX:GetChildren() do
    --             if (v.Name == 'FakeBooth') then
    --                 return v.Root
    --             end;
    --         end;

    --         return nil;
    --     end;

    --     function Main:GetNearestPrompt()
    --         local closest = nil;
    --         local shortestDistance = math.huge;
    --         local Sucessfully,Error = pcall(function()
    --             for _,v in pairs(CollectionService:GetTagged('sBooth')) do
    --                 if (v:FindFirstChildOfClass('ProximityPrompt')) then
    --                     local magnitude = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
    --                     if (tonumber(magnitude) < shortestDistance) then
    --                         closest = v:FindFirstChildOfClass('ProximityPrompt');
    --                         shortestDistance = magnitude;
    --                     end;
    --                 end;
    --             end;
    --         end)
    --         if (not Sucessfully) then
    --             warn('Error:GetNearest', Error);
    --         end;

    --         return (closest);
    --     end;

    --     function Main:CreateBooth()
    --         local emptyBooth = self:GetVoidBooth()
    --         if (not emptyBooth) then return end;
    --         LocalPlayer.Character.Humanoid:MoveTo(emptyBooth.Position)
    --         LocalPlayer.Character.Humanoid.Jump = true
    --         task.wait(.1);
    --         local prompt = self:GetNearestPrompt()
    --         if (not prompt) then return end;
    --         fireproximityprompt(prompt)
    --     end;

    --     function Main:GetBoothInfo(name)
    --         local Key = 'ON_SALE_ITEMS'..tostring(Players[name].UserId);
    --         if (not self:GetValues()[Key] or not self:GetValues()[Key]['value']) then
    --             return {};
    --         end;

    --         return self:GetValues()[Key]['value'];
    --     end;

    --     function Main:FindUnit(Cost)
    --         local MyBooth = self:GetBoothInfo(LocalPlayer.Name);
    --         if (not MyBooth['Units']) then return end;
    --         for _,unit in next, MyBooth['Units'] do
    --             if (unit.OnSale and unit.OnSale >= Cost) then
    --                 return true;
    --             end;
    --         end;

    --         return false;
    --     end;

    --     function Main:GetRarity(unit)
    --         if (not unit) then
    --             return 0
    --         end;

    --         return UnitData[unit].Rarity
    --     end;

    --     function Main:OnSale(Cost)
    --         if (not Cost) then return end;
    --         local Inventory = self:GetInventory();
    --         local ShinyUnit = {}

    --         for _,v in next, Inventory['Units'] do
    --             if (v.Shiny and v.Shiny==true) then
    --                 if (self:GetRarity(v.Type) == 4) then
    --                     table.insert(ShinyUnit,{
    --                         ['uuid'] = tostring(_),
    --                         ['Level'] = v.Level,
    --                     })
    --                 end;
    --             end;
    --         end;

    --         table.sort(ShinyUnit,function(a,b)
    --             return a.Level > b.Level
    --         end)

    --         local s_unit = ShinyUnit[1]

    --         warn('s_unit: ', s_unit)

    --         if s_unit then
    --             -- local Args = {
    --             --     [1] = RemoteKey['SELL_BOOTH_ITEMS'],
    --             --     [2] = {
    --             --         ["Items"] = {
    --             --             [s_unit['uuid']] = {
    --             --                 ["Class"] = "Units"
    --             --             }
    --             --         },
    --             --         ["Price"] = Cost
    --             --     }
    --             -- }
    --             -- ReplicatedStorage.Actions.Action:FireServer(unpack(Args));
    --         end
    --     end;

    --     function Main:FindMembers()
    --         for _,v in next, Players:GetPlayers() do
    --             if (table.find(getgenv().Members, v.Name)) then
    --                 local gems = v.leaderstats:FindFirstChildOfClass('IntValue');
    --                 if (gems.Value >= BuyCost) then
    --                     return gems.Value;
    --                 end;
    --             end;
    --         end;

    --         return nil;
    --     end;

    --     function Main:GetTradeRequests()
    --         local NotificationsHolder = LocalPlayer.PlayerGui.UI.NotificationsHolder

    --         if (NotificationsHolder and NotificationsHolder:FindFirstChild('Notification')) then
    --             local requestInfo = NotificationsHolder.Notification.PromptWindow.PromptMessage.Text:split('\n')[1];
    --             warn('requestInfo: ', requestInfo)
    --             setclipboard(tostring(requestInfo))
    --             return requestInfo;
    --         end;

    --         return false;
    --     end;

    --     function Main:IsMember(name)
    --         if (table.find(getgenv().Members, name)) then
    --             return true;
    --         end;
    --         return false
    --     end;



    --     function Main:GetTradeInfo()
    --         return LocalPlayer.PlayerGui.UI.TradeTransactionUI.OtherPlayerLabel.Text;
    --     end;

    --     function Main:InTrade()
    --         return LocalPlayer.PlayerGui.UI.TradeTransactionUI.Visible
    --     end;

    --     function Main:GetMainUser()
    --         return Players:FindFirstChild(MainUserName)
    --     end;

    --     function Main:GetGems()
    --         return tonumber(LocalPlayer.leaderstats:FindFirstChildOfClass('IntValue').Value)
    --     end;


    --     function Main:TradeCompleted()
    --         local Prompt = LocalPlayer.PlayerGui.PromptGui:FindFirstChild('PromptDefault');
    --         if (Prompt and Prompt:FindFirstChild('Holder') and Prompt.Holder:FindFirstChild('MessageLabel')) then
    --             if (Prompt.Holder.MessageLabel.Text == 'Trade has been completed!') then
    --                 return true;
    --             end;
    --         end;
    --         return false;
    --     end;

    --     function Main:Notify(Message)
    --         game:GetService('StarterGui'):SetCore('SendNotification', {
    --             Title = 'Trade',
    --             Text = tostring(Message),
    --             Duration = 5
    --         })
    --     end

    --     local CanTrade = true;

    --     -- Main:Notify('Please Wait For Trade Ready To Trade...');

    --     -- task.delay(60, function()
    --     --     CanTrade = true;
    --     --     Main:Notify('Trading Ready!!')
    --     -- end);

    --     -- do 
    --     --     local Inventory = Main:GetInventory();

    --     --     local Currencies = Inventory['Currencies']
    --     --     local Items = Inventory['Items']

    --     --     local Gems = Currencies['Gems']
    --     --     local Gold = Currencies['Gold']
    --     --     local Level = Inventory['Level']
    --     --     local TraitCrystal = Items['Trait Crystal'] or 0
    --     --     local RiskyDice = Items['Risky Dice'] or 0

    --     --     -- Gem:Set({Title = "Gems : "..tostring(Gems).."\nGold : "..tostring(Gold),Image = "rbxassetid://16637242593"})
    --     --     -- Info:Set({Title = "Trait Crystal : "..TraitCrystal.."\nLevel : "..tostring(Level),Image = "rbxassetid://17648368283"})

    --     --     if (Ingame) then
    --     --         TaskUpdate = 'In Trading!'
    --     --     end;

    --     --     seconds = math.floor(workspace.DistributedGameTime)

    --     --     if tick() >= Cooldown.RequestWeb and ServerResponsed then
    --     --         Cooldown.RequestWeb = tick() + 480

    --     --         local StartedAt = tick()

    --     --         warn('Updating Account...')

    --     --         Sockets.Socket = Sockets.Socket or Connect(WS_URL)

    --     --         warn('Connected to Websocket', Sockets.Socket)

    --     --         local Data = {
    --     --             userQuery = tostring(Main.License),
    --     --             pcName = tostring(PcName),
    --     --             robloxUsername = tostring(LocalPlayer.Name), -- tostring(LocalPlayer.Name)
    --     --             level = tostring(Level),
    --     --             gem = tostring(Gems),
    --     --             gold = tostring(Gold),
    --     --             traits = tostring(TraitCrystal),
    --     --             riskyDice = tostring(RiskyDice),
    --     --             statusText = tostring(TaskUpdate),
    --     --         }

    --     --         if Sockets.Socket then
    --     --             Sockets.Socket:Send(HttpService:JSONEncode(Data))
    --     --         end 
    --     --     end;
    --     -- end;

    --     local Playload = task.spawn(function()
    --         while (not getgenv().Teleport) do task.wait(1)
    --             local su,er = pcall(function()
    --                 if (not Main:CheckBooth() and MainUser) then
    --                     Main:CreateBooth();
    --                     task.wait(1)
    --                     return;
    --                 end;

    --                 if (not CanTrade) then
    --                     return
    --                 end;

    --                 if (MainUser) then
    --                     warn('Main:InTrade()', Main:InTrade())

    --                     if (Main:InTrade()) then

    --                         if (Main:TradeCompleted()) then
    --                             Main:PressButton(LocalPlayer.PlayerGui.PromptGui.PromptDefault.Holder.Options.Back);
    --                             task.wait(1)
    --                             return;
    --                         end;

    --                         warn('Main:GetTradeInfo()', Main:GetTradeInfo(), Main:IsMember(Main:GetTradeInfo()))

    --                         if (Main:IsMember(Main:GetTradeInfo())) then
    --                             local button = LocalPlayer.PlayerGui.UI.TradeTransactionUI.Lock
    --                             if (button and (button.TextLabel.Text == 'Ready' or button.TextLabel.Text == 'Trade')) then
    --                                 Main:PressButton(LocalPlayer.PlayerGui.UI.TradeTransactionUI.Lock);
    --                                 task.wait(.5);
    --                             end;
    --                         else
    --                             ReplicatedStorage.TradeRemotes.SendTradeRequest:InvokeServer(true)
    --                             task.wait(1)
    --                         end;

    --                         return;
    --                     end;

    --                     local Trade = Main:GetTradeRequests();
    --                     warn('Trade:', Trade)

    --                     if (Trade) then
    --                         warn('IS: ', Main:IsMember(tostring(Trade)))

    --                         if (Main:IsMember(tostring(Trade))) then
    --                             ReplicatedStorage.TradeRemotes.SendTradeRequest:InvokeServer(Players:FindFirstChild(Trade), true, true);
    --                             task.wait(5)
    --                             return
    --                         end;

    --                         warn('not trade')
    --                     end;

    --                     if (not Main:FindUnit(BuyCost)) then
    --                         local GetCost = Main:FindMembers()

    --                         Main:Notify('GetCost: ' .. tostring(GetCost))

    --                         if (not GetCost or GetCost < BuyCost) then return end;

    --                         Main:Notify('Selling: ' .. tostring(GetCost))

    --                         Main:OnSale(GetCost)

    --                         task.wait(5)
    --                     else
    --                         local Booth = Main:GetBoothInfo(LocalPlayer.Name)

    --                         if (not Booth) then return end;

    --                         local MembersGem = {}

    --                         for _,v in next, Players:GetPlayers() do
    --                             if (table.find(getgenv().Members, v.Name)) then
    --                                 local gems = v.leaderstats:FindFirstChildOfClass('IntValue');

    --                                 table.insert(MembersGem, gems.Value)
    --                             end
    --                         end

    --                         local Found = false;
    --                         local SellingUnitId = nil;

    --                         for _, unit in next, Booth['Units'] do
    --                             SellingUnit = unit;
    --                             if unit.OnSale then
    --                                 warn('SellingUnitId', unit.OnSale, unit.OnSale)
    --                                 SellingUnitId = tostring(_);
    --                                 if table.find(MembersGem, unit.OnSale) then
    --                                     Found = true;
    --                                     break;
    --                                 end
    --                             end;
    --                         end;

    --                         warn('End SellingUnitId', SellingUnitId)

    --                         warn('Found:', Found)

    --                         if not Found then
    --                             if SellingUnitId then
    --                                 Main:Notify('No Member with enough gems')

    --                                 -- local Args = {
    --                                 --     [1] = RemoteKey['REMOVE_BOOTH_ITEM'],
    --                                 --     [2] = tostring(SellingUnitId)
    --                                 -- }

    --                                 -- ReplicatedStorage.Actions.Action:FireServer(unpack(Args))
    --                             end
    --                         else
    --                             Main:Notify('Waiting For Buy Unit')
    --                         end;
    --                     end;
    --                     return;
    --                 end;

    --                 if (Main:GetMainUser()) then

    --                     warn(Main:GetGems(), getgenv().OwnerUnit)

    --                     if (Main:GetGems() < tonumber(MergeGem) and getgenv().OwnerUnit) then
    --                         warn('OwnerUnit: ', getgenv().OwnerUnit)

    --                         local Inventory = Main:GetInventory();
    --                         local Items = Inventory['Items']
    --                         local TraitCrystal = Items['Trait Crystal'] or 0
    --                         local RiskyDice = Items['Risky Dice'] or 0

    --                         if (not Inventory['Units'][getgenv().OwnerUnit]) and RiskyDice == 0 and TraitCrystal == 0 then
    --                             game:GetService('TeleportService'):Teleport(17017769292)
    --                             return;
    --                         end;

    --                         if (Main:TradeCompleted()) then
    --                             Main:PressButton(LocalPlayer.PlayerGui.PromptGui.PromptDefault.Holder.Options.Back);
    --                             task.wait(1)
    --                             return;
    --                         end;

    --                         if (Main:InTrade()) then
    --                             if (Main:GetTradeInfo() == MainUserName) then

    --                                 Main:Notify('Trade Accepted')

    --                                 if (tick() >= Cooldown.TradeAdd) then

    --                                     Main:Notify('Trade Add Item')
    --                                     Cooldown.TradeAdd = tick() + 60

    --                                     if Inventory['Units'][getgenv().OwnerUnit] then
    --                                         local Args = {
    --                                             [1] = tostring(getgenv().OwnerUnit),
    --                                             [2] = "Units",
    --                                             [3] = 1,
    --                                             [4] = true
    --                                         }

    --                                         ReplicatedStorage.TradeRemotes.TradeUpdated:FireServer(unpack(Args))
    --                                     end

    --                                     if (TraitCrystal > 0) then
    --                                         task.wait(0.25)

    --                                         local Args = {
    --                                             [1] = "Trait Crystal",
    --                                             [2] = "Items",
    --                                             [3] = tonumber(TraitCrystal),
    --                                             [4] = true
    --                                         }

    --                                         ReplicatedStorage.TradeRemotes.TradeUpdated:FireServer(unpack(Args))
    --                                     end;

    --                                     if (RiskyDice > 0) then
    --                                         task.wait(0.25)

    --                                         local Args = {
    --                                             [1] = "Risky Dice",
    --                                             [2] = "Items",
    --                                             [3] = tonumber(RiskyDice),
    --                                             [4] = true
    --                                         }

    --                                         ReplicatedStorage.TradeRemotes.TradeUpdated:FireServer(unpack(Args))
    --                                     end;
    --                                 end;

    --                                 task.wait(1)

    --                                 local button = LocalPlayer.PlayerGui.UI.TradeTransactionUI.Lock

    --                                 if (button and (button.TextLabel.Text == 'Ready' or button.TextLabel.Text == 'Trade')) then
    --                                     Main:PressButton(LocalPlayer.PlayerGui.UI.TradeTransactionUI.Lock);
    --                                     task.wait(.5);
    --                                 end;
    --                             else
    --                                 Main:Notify('Cancel Trade')
    --                                 ReplicatedStorage.TradeRemotes.SendTradeRequest:InvokeServer(true)
    --                                 task.wait(1)
    --                             end;

    --                         else
    --                             if (tick() >= Cooldown.TradeRequest) then
    --                                 Cooldown.TradeRequest = tick() + 10
    --                                 Main:Notify('Trade Request Sent')
    --                                 ReplicatedStorage.TradeRemotes.SendTradeRequest:InvokeServer(Players[MainUserName], false, true)
    --                             end;
    --                         end;
    --                         return;
    --                     end;

    --                     if (Main:GetGems() >= BuyCost) then
    --                         local Booth = Main:GetBoothInfo(MainUserName)
    --                         if (not Booth) then return end;
    --                         local BoughtUnit = nil
    --                         for _,unit in next, Booth['Units'] do
    --                             if (unit.OnSale and unit.OnSale == Main:GetGems()) then
    --                                 -- local Args = {
    --                                 --     [1] = RemoteKey['BUY_BOOTH_ITEM'],
    --                                 --     [2] = Players[MainUserName].UserId,
    --                                 --     [3] = tostring(_)
    --                                 -- }
    --                                 -- ReplicatedStorage.Actions.Action:FireServer(unpack(Args))
    --                                 warn('Bought: ', _)
    --                                 Main:Notify('Bought Unit: ' .. _)
    --                                 BoughtUnit = tostring(_)
    --                                 break;
    --                             end;
    --                         end;

    --                         task.wait(15);

    --                         if BoughtUnit then
    --                             local Units = Main:GetInventory()['Units']
    --                             if Units[tostring(BoughtUnit)] then
    --                                 getgenv().OwnerUnit = tostring(BoughtUnit)
    --                                 writefile('OwnerUnit.androssy', tostring(BoughtUnit))
    --                                 Main:Notify('Saved Unit: ' .. BoughtUnit)
    --                             end
    --                         end
    --                     end;
    --                 else
    --                     warn('wait MainUser');


    --                 end;
    --             end);
    --             if (not su) then
    --                 warn('Error:', er)
    --             end;
    --         end;
    --     end);
    -- else
    --     if LPH_OBFUSCATED then
    --         TeleportService:Teleport(17017769292)
    --     end
    -- end;

    -- while true do task.wait(60)
    --     local Passed, Statement = pcall(function()
    --         local MergeGem = Main:GetMergeGemData();
    --         if MergeGem.success then
    --             local MergeData = MergeGem.mergeData;
    --             local mergeAccount = MergeData.mergeAccount;
    --             local MergeGem = MergeData.mergeGem;
    --             local users = MergeData.user;

    --             local MainUser = false;
    --             local MainUserName = mergeAccount;

    --             for _,v in next, users do
    --                 if (v.robloxUsername ~= MainUserName) then
    --                     table.insert(getgenv().Members, v.robloxUsername)
    --                 end;
    --             end;
    --         else
    --             if LPH_OBFUSCATED then
    --                 TeleportService:Teleport(17017769292)
    --             end
    --         end
    --     end)

    --     if not Passed then
    --         warn('Error: ', Statement)
    --     end
    -- end
end;

warn('update 3', Ingame)

if (not Ingame) then
    function Main:GetChallengeName(Desc)
        for i,v in next, ChallengeDifficulty do
            if (v.Description == Desc) then
                return tostring(i);
            end;
        end;

        return Desc
    end

    function Main:GetMapName(MapDisplayName)
        for i,v in next, MapData do
            if (v.DisplayName == MapDisplayName) then
                return tostring(i);
            end;
        end;

        return MapDisplayName
    end

    function Main:GetUnlockedChapters()
        local inventory = Main:GetInventory()
        local chapters = {}

        for _, item in next, inventory.Chapters do
            if item.Unlocked then
                table.insert(chapters, tostring(_))
            end
        end

        return chapters
    end

    function Main:IsChapterUnlocked(DisplayName)
        local Unlocked = Main:GetUnlockedChapters()

        if table.find(Unlocked, DisplayName) then
            return true
        end

        for i,v in next, ChapterData do
            if table.find(Unlocked, tostring(i)) then
                if v.DisplayName == DisplayName then
                    return true
                end
            end
        end;

        return false
    end

    function Main:GetChallenge()
        for i,v in next, LocalPlayer.PlayerGui.UI.GUIs:GetChildren() do
            if not v:FindFirstChild('TextHolder') then
                local MatchDisplayFrame = v:FindFirstChild('MatchDisplayFrame')
                if (MatchDisplayFrame:FindFirstChild('MatchDetailsFrame') and MatchDisplayFrame.MatchDetailsFrame:FindFirstChild('ChallengeCompleted')) then
                    if not MatchDisplayFrame.MatchDetailsFrame:FindFirstChild('ChallengeCompleted').Visible then
                        local TimerFrame = MatchDisplayFrame.TimerFrame
                        local MatchDetailsFrame = MatchDisplayFrame.MatchDetailsFrame;

                        if not TimerFrame.Visible then
                        --  local ChallengeDetails = MatchDisplayFrame.ChallengeDetails
                            local MapLabel = Main:GetMapName(MatchDetailsFrame.MapNameLabel.Text)
                            local ChallengeLabel = Main:GetChallengeName(MatchDetailsFrame.ChallangeLabel.Text)
                            local ChapterLabel = MatchDetailsFrame.ChapterTitleLabel
                            local DisplayPart = v.Adornee
                            local ChallengeId = DisplayPart:GetAttribute('ChallengeId')

                            if MapLabel == 'FooshaVillage' then
                                if not Main:GetInventory().CompletedChallenges[tostring(ChallengeId)] and Main:IsChapterUnlocked(ChapterLabel.Text) then
                                    return MapLabel, ChallengeLabel, DisplayPart
                                end
                            end;
                        end
                    end
                else
                    if MatchDisplayFrame and MatchDisplayFrame:FindFirstChild('ChallengeCompleted') and not MatchDisplayFrame:FindFirstChild('ChallengeCompleted').Visible then
                        local TimerFrame = MatchDisplayFrame.TimerFrame

                        if not TimerFrame.Visible then
                            local ChallengeDetails = MatchDisplayFrame.ChallengeDetails
                            local MapLabel = Main:GetMapName(ChallengeDetails.MapNameLabel.Text)
                            local ChallengeLabel = Main:GetChallengeName(ChallengeDetails.ChallangeLabel.Text)
                            local ChapterLabel = ChallengeDetails.ChapterTitleLabel

                            local DisplayPart = v.Adornee
                            local ChallengeId = DisplayPart:GetAttribute('ChallengeId')
                            if MapLabel == 'FooshaVillage' then
                                if not Main:GetInventory().CompletedChallenges[tostring(ChallengeId)] and Main:IsChapterUnlocked(ChapterLabel.Text) then
                                    return MapLabel, ChallengeLabel, DisplayPart
                                end
                            end
                        end
                    end
                end
            end
        end

        return nil
    end

    -- function Main:GetPity()

    -- end;

    function Main:GetLegendUnit()
        local Inventory = self:GetInventory();
        for _,v in next, Inventory['Units'] do
            local unitData = UnitData[v.Type]

            if (unitData and unitData.Rarity > 3) then
                return true;
            end;
        end;

        return false;
    end;

    local Title = {'Welcome to Anime Defenders!', 'Thanks for Playing!'}
    TaskUpdate = 'In Lobby!'

    -- game:GetService('TeleportService'):Teleport(game.PlaceId)

    local UseCode = ReplicatedStorage.Remotes:FindFirstChild('UseCode')

    warn('Starting Thread')

    function Main:IsEquipped(unit)
        if not unit then return end;
        local Inventory = self:GetInventory();
        for uuid,v in next, Inventory['Units'] do 
            if v.Type == unit then 
                for _,y in next, Inventory['EquippedUnits'] do 
                    if y == tostring(uuid) then
                        return true;
                    end;
                end;
            end;
        end;
        return false;
    end;

    function Main:GetMyUnit(unit)
        if not unit then 
            return;
        end;

        local Inventory = self:GetInventory()
        for uuid,v in next, Inventory['Units'] do 
            if v.Type == unit then 
                return tostring(uuid);
            end;    
        end;

        return false;
    end;

    
    function Main:GetBanner()
        local banner = {};

        for _,v in next, Values['CURRENT_BANNER']['value']['Standard']['Items'] do
            if (v.Chance < 20) then
                table.insert(banner,v.Type);
            end;
        end;

        return banner
    end;

    function Main:SlotEquip()
        local Inventory = self:GetInventory();
        return #Inventory['EquippedUnits'];
    end;

    Main().Thread.Rander = task.spawn(function()
        task.wait(getgenv().Configuration['Delay'] or 30)
        while (not getgenv().Teleport) do task.wait(1)
            if getgenv().Teleport then break end
            local Successful,Error = pcall(function()

                local Inventory = Main:GetInventory();

                local PromptDefault = LocalPlayer.PlayerGui.PromptGui:FindFirstChild('PromptDefault');
                if (PromptDefault and PromptDefault:FindFirstChild('Holder') and table.find(Title, PromptDefault.Holder.TitleLabel.Text)) then
                    Main:PressButton(PromptDefault.Holder.Options:FindFirstChildOfClass('ImageButton'));
                    return;
                end

                local InspectGui = LocalPlayer.PlayerGui.InspectGui;
                if (InspectGui.Enabled and InspectGui.Info.Visible) then
                    Main:PressButton(InspectGui:FindFirstChildOfClass('Frame'));
                    return
                end

                Main:ClaimAllQuest()

                if (Inventory['Level'] >= 8 and UseCode ~= nil) then
                    Main:RedeemCode()
                end;

                if getgenv().Configuration['Summon The Beast'] then  
                    local checkUnit = Main:IsEquipped('The Beast')
                    if not checkUnit then 
                        local getUnit = Main:GetMyUnit('The Beast')
                        if (getUnit) then 
                            Network.Fire(GiveKey('UNIT_UNEQUIP_ALL'));
                            task.wait(0.5);
                            Network.Fire(GiveKey('UNIT_EQUIP_UNEQUIP'),getUnit);
                            return;
                        else
                            local banner = Main:GetBanner();
                            if banner then 
                                if table.find(banner,'The Beast') and  Inventory['Currencies']['Gems'] >= 50 then 
                                    warn('Roll Banner The Beast...')
                                    if Inventory['Currencies']['Gems'] >= 500 then 
                                        Network.Invoke(GiveKey('SUMMON'),'Standard',10)
                                    elseif Inventory['Currencies']['Gems'] >= 50 then 
                                        Network.Invoke(GiveKey('SUMMON'),'Standard',1)
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;

                if not Main:GetLegendUnit() and Inventory['Currencies']['Gems'] >= 50 then
                    local Pity = (Inventory['Pity']['Standard'] and Inventory['Pity']['Standard']['4']) or 0
                    -- warn('Pity: ', Pity)

                    local Left = (50 - Pity)
                    local Gems = Inventory['Currencies']['Gems']
                    -- warn('Left', Left, 'Gems', Gems)
                    -- warn('Left Calculate', (Left * 50), 'Gems', Gems)
                    if (Gems >= (Left * 50)) then

                        if (Left > 10 and Gems >= 500) then
                            -- local Args = {
                            --     [1] = "Standard",
                            --     [2] = 10
                            -- }
                            -- ReplicatedStorage.Remotes.Summon:InvokeServer(unpack(Args))
                            Network.Invoke(GiveKey('SUMMON'),'Standard',10)
                            task.wait(1);
                            return
                        end;

                        -- local Args = {
                        --     [1] = "Standard",
                        --     [2] = 1
                        -- }
                        -- ReplicatedStorage.Remotes.Summon:InvokeServer(unpack(Args))
                        Network.Invoke(GiveKey('SUMMON'),'Standard',1)
                        task.wait(1)

                        return
                    end
                end

                warn('Checking Slot')

                if not getgenv().Configuration['Summon The Beast'] or not Main:GetMyUnit('The Beast') then 
                    if (Main:IsSlotAvailable() and getgenv().Configuration['EquipBest']) then
                        local Different = Main:CheckDifferentUnits();
                        if (Different) then
                            -- warn('Different')
                            -- Action:FireServer(RemoteKey['UNIT_EQUIP_BEST']);
                            Network.Fire(GiveKey('UNIT_EQUIP_BEST'))
                            return
                        else
                            if (Inventory.Currencies.Gems >= 50) then
                                Network.Invoke(GiveKey('SUMMON'),'Standard',1)
                                task.wait(1);
                                return
                            end;
                        end;
                    end;
                    if (getgenv().Configuration['EquipBest']) then
                        Network.Fire(GiveKey('UNIT_EQUIP_BEST'))
                    end;
                end;

                if getgenv().Configuration['Summon The Beast'] then 
                    local getUnit = Main:GetMyUnit('The Beast')
                    if getUnit then 
                        if Main:SlotEquip() > 1 then 
                            Network.Fire(GiveKey('UNIT_UNEQUIP_ALL'));
                            task.wait(0.5)
                        end;

                        if not Main:IsEquipped('The Beast') then 
                            Network.Fire(GiveKey('UNIT_EQUIP_UNEQUIP'),getUnit);
                        end;
                    end;
                end;

                warn('Claiming Quest')

                Main:ClaimAllQuest()

                warn('Checking Challenge')

                -- if getgenv().Configuration['Enabled Challenge'] and Main:GetLegendUnit() then
                --     local Map, Challenge, DisplayPart = Main:GetChallenge()
                --     if Map and Challenge then
                --         LocalPlayer.Character.HumanoidRootPart.CFrame = DisplayPart.CFrame
                --         warn('Starting Challenge: ', Map, Challenge, RemoteKey['START_MATCH'])
                --        -- Action:FireServer(RemoteKey['START_MATCH']);

                --         Network.Fire(GiveKey('START_MATCH'))
                --         task.wait(10)
                --         return
                --     end
                -- end

                -- warn('Checking Story')

                local BestStory, Difficulty = Main:FetchBestStory();

                

                    if (BestStory) then
                        -- local Pods = Main:GetPods();
                        warn('BestStory: ', BestStory, Difficulty)
                        -- warn('Story Pods: ', Pods)
                        for i,v in next, LocalPlayer.PlayerGui.UI.GUIs:GetChildren() do
                            if (v:IsA('SurfaceGui')) then 
                                if (v:FindFirstChild('TextHolder') and v:FindFirstChild('MatchDisplayFrame')) then 
                                    
                                    local TextHolder = v:FindFirstChild('TextHolder');
                                    local MatchDisplayFrame = v:FindFirstChild('MatchDisplayFrame');

                                    if (TextHolder:FindFirstChild('EnterToPlayLabel') and TextHolder.EnterToPlayLabel.Visible
                                    and v.Adornee.Parent.Parent == workspace["SubStuff_DONT_DELETE"].StoryPods) then 
                                        local Pods = v.Adornee.Parent:FindFirstChild('Detector');
                                    
                                        if (Pods) then

                                            warn('Pods','true')

                                            LocalPlayer.Character.HumanoidRootPart.CFrame = Pods.CFrame
                                            LocalPlayer.Character.Humanoid:MoveTo(Pods.Position);
                                            task.wait(1);
                    
                                            if LocalPlayer.PlayerGui.PAGES.MatchPage.Visible then
                    
                                                Network.Fire(GiveKey('CHANGE_MATCH_DATA'),{
                                                    ["Chapter"] = BestStory,
                                                    ["FriendsOnly"] = true,
                                                    ["Difficulty"] = Difficulty;
                                                })
                                            end
                    
                                            task.wait(1);
                    
                                            if LocalPlayer.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.MatchDetailsFrame.Visible then
                                                Network.Fire(GiveKey('START_MATCH'))
                                                task.wait(10)
                                            end
                                        end;
                                    end;
                                end;
                             end;   
                        end;
                    end;
                end);
            if (not Successful) then
                warn('Error: Thread.Rander', Error)
            end;
        end;
    end);
else
    function Main:GetWave()
        local Wave=LocalPlayer.PlayerGui.WaveTopBar.Wave.WaveFrame.TextLabel;
        if (Wave.Text:find('/')) then
            return tonumber(Wave.Text:split('/')[1]);
        else
            return tonumber(Wave.Text) or 0;
        end;

        return 0;
    end;
    local RenderingConnection = RunService.Heartbeat:Connect(function()
        local su,er = pcall(function()
            if (not Ingame or not getgenv().Configuration or type(getgenv().Configuration)~='table') then return end;
        
            if (tick()-Cooldown.Payload2)>5 then
                Cooldown.Payload2=tick()+5;
        
                if (LocalPlayer.PlayerGui.PAGES:FindFirstChild('MatchResultPage') and LocalPlayer.PlayerGui.PAGES.MatchResultPage.Visible) then
                    --getgenv().LeaveDelay=true;
                    
                    if not getgenv().EmergencyHOP then 
                        getgenv().EmergencyHOP=true;
                        task.spawn(function()
                            task.wait(30);
                            Network.Fire(GiveKey('GAME_MODE_SELECTED_CTS'),'NormalLobby')
                        end)
                    end;

                    task.delay(getgenv().Configuration['Leave Delay'],function()
                        warn('GO BLACK...')
                        --Network.Fire(GiveKey('GAME_MODE_SELECTED_CTS'),'NormalLobby');
                        -- Main:PressButton(LocalPlayer.PlayerGui.PAGES.MatchResultPage.Main.Options.BackToLobbyButton);
                        -- task.wait(.5);
                        -- Main:PressButton(LocalPlayer.PlayerGui.PAGES.MatchResultPage.Main.Options.BackToLobbyButton);
                        if Window.IsOpen() then
                            Window:Toggle()
                        end;
                        
        
                        local button = LocalPlayer.PlayerGui.PAGES.MatchResultPage.Main.Options.BackToLobbyButton;
                        local reward = LocalPlayer.PlayerGui.PAGES.MatchResultPage.Main.Rewards;
                        local at = tick();
                        
                        repeat task.wait(0.03)
                            reward.Visible = false
                            button.Size = UDim2.new(200,200,200,200)
                            button.BackgroundTransparency = 1
                            button.Main.Visible = false 
                            button.TextLabel.Visible = false 
                            Main:PressButton(reward);
                        until (not LocalPlayer.PlayerGui.PAGES.MatchResultPage.Visible or tick() - at > 2.5);
        
        
                    --getgenv().LeaveDelay=false;
                end);
            end;
        end;
    
            if (tick()-Cooldown.AutoSell)>0.5 then
                Cooldown.AutoSell=tick()+0.5;
        
                if (Main:GetWave() >= getgenv().Configuration['Leave At Wave']) then
        
                    if (getgenv().Configuration['Leave Method']==1) then
                        for _,v in next, workspace.Units:GetChildren() do
                            if (v:IsA('Model')) then
                                Network.Fire(GiveKey('TOWER_SELL'),tonumber(v:GetAttribute('Entity')))
                            end;
                        end;
        
                    else
                        Network.Fire(GiveKey('GAME_MODE_SELECTED_CTS'),'NormalLobby')
                    end;
                end;
            end;
        end)
    end)

    -- function Main:GetMapInfo()
    --     local info={};
    --     local mathholder = LocalPlayer.PlayerGui.MatchIntroGui.Holder
    --     info['Mode'] = LocalPlayer.PlayerGui.HUD.HolderLeftBottom.ServerInformationFrame.GameModeLabel.Text
    --     info['Map'] = mathholder.Map.TextLabel.Text
    --     return (info)
    -- end;

    -- MapInfo = Main:GetMapInfo();

    local Assets = {};

    local MainCenter = 9
    local FarmCenter = 5

    --warn('MainCenter: ', Main:GetInventory().MaxEquippedUnits < 5 and 9 or 6)

    local Paths = workspace.Paths:Clone();
    Paths.Name = 'A'
    Paths.Parent = workspace;

    local Sensor = Instance.new('Part');
    Sensor.Size = Vector3.new(1,1,1);
    Sensor.Anchored = true;
    Sensor.Transparency = 1;
    Sensor.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,0);

    local Sensor2 = Instance.new('Part');
    Sensor2.Size = Vector3.new(1,1,1);
    Sensor2.Anchored = true;
    Sensor2.Transparency = 1;
    Sensor2.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,0);

    local Sensor3 = Instance.new('Part');
    Sensor3.Size = Vector3.new(1,1,1);
    Sensor3.Anchored = true;
    Sensor3.Transparency = 1;
    Sensor3.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,0);

    local Sensor4 = Instance.new('Part');
    Sensor4.Size = Vector3.new(1,1,1);
    Sensor4.Anchored = true;
    Sensor4.Transparency = 1;
    Sensor4.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,0);


    if not LPH_OBFUSCATED then
        Sensor.Transparency = 0;
        Sensor.Parent = workspace;

        Sensor2.Transparency = 0;
        Sensor2.Parent = workspace;

        Sensor3.Transparency = 0;
        Sensor3.Parent = workspace;

        Sensor4.Transparency = 0;
        Sensor4.Parent = workspace;
    end

    function Main:GetPaths(path)
        return Paths["1"][tostring(path)];
    end;

    function Main:SensorRaycast(sensor)
        if (not sensor) then return end;
        local rayOrigin = sensor.Position
        local rayDirection = Vector3.new(0, -20, 0)
        local Params = RaycastParams.new()
        Params.FilterDescendantsInstances = {LocalPlayer.Character,Paths,workspace.Effects}
        local Result = workspace:Raycast(rayOrigin, rayDirection, Params)
        if (not Result) then return end;
        return Result;
    end;

    -- function Main:ResetSensor()
    --     Sensor.CFrame = center.CFrame * CFrame.new(0,10,0);
    --     Sensor2.CFrame = center.CFrame * CFrame.new(0,10,0);
    --     Sensor3.CFrame = center.CFrame * CFrame.new(0,10,0);
    --     Sensor4.CFrame = center.CFrame * CFrame.new(0,10,0);
    -- end;

    function Main:PlaceUnit(uuid, unitType)

        warn('placing unitType', unitType)

        if unitType == 'Hill' then
            local Hill = Main().HillCFrame[1]
            local hillCalcutate = Hill * CFrame.new(0, 2, 0) * CFrame.Angles(-0, -1.5707963705062866, 0)

            -- local Args = {
            --     [1] = RemoteKey['UNIT_PLACE'],
            --     [2] = uuid,
            --     [3] = hillCalcutate.Position,
            --     [4] = 1
            -- }
            -- Action:FireServer(unpack(Args))

            
            Network.Fire(GiveKey('UNIT_PLACE'),uuid,tostring(hillCalcutate.Position),1)
            table.remove(Main().HillCFrame, 1)

            task.wait(1)
            return
        end

        local center = ((unitType == 'Ground' or unitType == 'Buff') and Main:GetPaths(MainCenter)) or Main:GetPaths(#Paths["1"]:GetChildren() - FarmCenter);

        Sensor.CFrame = center.CFrame * CFrame.new(0, 10, 0)
        Sensor2.CFrame = center.CFrame * CFrame.new(0, 10, 0)
        Sensor3.CFrame = center.CFrame * CFrame.new(0, 10, 0)
        Sensor4.CFrame = center.CFrame * CFrame.new(0, 10, 0)

        if (not center) then return end;

        local NextTo = {
            [1] = 0.05,
            [2] = 0.05,
            [3] = 0.05,
            [4] = 0.05,
        }

        local StepTo = 0.05;
        local LimitDistance = 20

        --local StepTo = 0.05;
        local AssetCount = #Assets
        local SensorCheck = {[1]=false,[2]=false,[3]=false,[4]=false}

        local Placement = RunService.Heartbeat:Connect(function(Time)

            if (tick()-Cooldown.Sensor1)>0.05 then
                Cooldown.Sensor1=tick()+0.05
                local distance = (center.Position - Sensor.Position).magnitude;
                if (distance< LimitDistance) then
                    Sensor.CFrame = Sensor.CFrame * CFrame.new(0,0,NextTo[1]);
                    NextTo[1]+=StepTo

                    local Ray = Main:SensorRaycast(Sensor);
                    if (Ray and Ray.Instance.Name == 'Floor') then
                        cframe = Ray.Position;
                        local placecalcutate = CFrame.new(cframe.X, workspace.PhysicalMap.Floor.CFrame.Position.Y + 2 , cframe.Z) * CFrame.Angles(-0, -1.5707963705062866, 0)

                        -- local Args = {
                        --     [1] = RemoteKey['UNIT_PLACE'],
                        --     [2] = uuid,
                        --     [3] = placecalcutate.Position,
                        --     [4] = 1
                        -- }
                        -- Action:FireServer(unpack(Args))
                        Network.Fire(GiveKey('UNIT_PLACE'),uuid,tostring(placecalcutate.Position),1)
                    end;
                else
                    SensorCheck[1] = true;
                end;
            end;

            if (tick()-Cooldown.Sensor2)>0.05 then
                Cooldown.Sensor2=tick()+0.05
                local distance = (center.Position - Sensor2.Position).magnitude;

                if ( distance< LimitDistance) then
                    Sensor2.CFrame = Sensor2.CFrame * CFrame.new(0,0,-NextTo[2]);
                    NextTo[2]+=StepTo

                    local Ray = Main:SensorRaycast(Sensor2);
                    if (Ray and Ray.Instance.Name == 'Floor') then
                        cframe = Ray.Position;
                        local placecalcutate = CFrame.new(cframe.X, workspace.PhysicalMap.Floor.CFrame.Position.Y + 2 , cframe.Z) * CFrame.Angles(-0, -1.5707963705062866, 0)

                        Network.Fire(GiveKey('UNIT_PLACE'),uuid,tostring(placecalcutate.Position),1)
                    end;
                else
                    SensorCheck[2] = true;
                end;
            end;

            if (tick()-Cooldown.Sensor3)>0.05 then
                Cooldown.Sensor3=tick()+0.05
                local distance = (center.Position - Sensor3.Position).magnitude;
                if (distance< LimitDistance) then
                    Sensor3.CFrame = Sensor3.CFrame * CFrame.new(NextTo[3],0,0);
                    NextTo[3]+=StepTo

                    local Ray = Main:SensorRaycast(Sensor3);
                    if (Ray and Ray.Instance.Name == 'Floor') then
                        cframe = Ray.Position;
                        local placecalcutate = CFrame.new(cframe.X, workspace.PhysicalMap.Floor.CFrame.Position.Y + 2 , cframe.Z) * CFrame.Angles(-0, -1.5707963705062866, 0)

                        Network.Fire(GiveKey('UNIT_PLACE'),uuid,tostring(placecalcutate.Position),1)
                    end;
                else
                    SensorCheck[3] = true;
                end;
            end;

            if (tick()-Cooldown.Sensor4)>0.05 then
                Cooldown.Sensor4=tick()+0.05
                local distance = (center.Position - Sensor4.Position).magnitude;
                if (distance< LimitDistance) then
                    Sensor4.CFrame = Sensor4.CFrame * CFrame.new(-NextTo[4],0,0);
                    NextTo[4]+=StepTo

                    local Ray = Main:SensorRaycast(Sensor4);
                    if (Ray and Ray.Instance.Name == 'Floor') then
                        cframe = Ray.Position;
                        local placecalcutate = CFrame.new(cframe.X, workspace.PhysicalMap.Floor.CFrame.Position.Y + 2 , cframe.Z) * CFrame.Angles(-0, -1.5707963705062866, 0)
                        Network.Fire(GiveKey('UNIT_PLACE'),uuid,tostring(placecalcutate.Position),1)
                    end;
                else
                    SensorCheck[4] = true;
                end;

            end;

            if (SensorCheck[1]==true and SensorCheck[2]==true and SensorCheck[3]==true and SensorCheck[4]==true) then

                if (unitType=='Ground' or unitType == 'Buff') then
                    MainCenter+=1
                else
                    FarmCenter+=1
                end;

                center = self:GetPaths((unitType == 'Ground' or unitType == 'Buff' ) and MainCenter or #Paths["1"]:GetChildren() - FarmCenter);
                Sensor.CFrame = center.CFrame * CFrame.new(0,10,0);
                Sensor2.CFrame = center.CFrame * CFrame.new(0,10,0);
                Sensor3.CFrame = center.CFrame * CFrame.new(0,10,0);
                Sensor4.CFrame = center.CFrame * CFrame.new(0,10,0);
                SensorCheck = {[1]=false,[2]=false,[3]=false,[4]=false};
                NextTo = {[1] = 0.05,[2] = 0.05,[3] = 0.05,[4] = 0.05,};
            end;
        end);

        repeat task.wait() until (#Assets > AssetCount or getgenv().Teleport);
        Placement:Disconnect();
        Placement=nil;
        warn('Sucess: XD')
    end;


    Main.UpgradeMaxCache = {}
    Main.UpgradeDataCache = {}
    Main.UpgradeCapCache = {}
    Main.UnitCache = {}
    Main.UnitCache2 = {}
    Main.InventoryCache = Main:GetInventory()

    function Main:GetEquppedUnits()
        local inventory = Main.InventoryCache or Main:GetInventory()

        if not Main.InventoryCache then
            Main.InventoryCache = inventory
        end

        local units = {}

        for _, item in next, inventory.EquippedUnits do
            table.insert(units, item)
        end

        return units
    end

    function Main:GetUnits()
        local units = {}

        for _, item in next, Main.InventoryCache.Units do
            if item['Type'] then
                units[_] = item.Type;
            end
        end

        return units
    end

    function Main:GetUnits2()
        local units = {}

        for _, item in next, Main.InventoryCache.Units do
            if item['Type'] then
                units[_] = item;
            end
        end

        return units
    end

    Main.Units = Main:GetUnits()
    Main.Units2 = Main:GetUnits2();

    function Main:isUnitEquipped(uuid)
        local units = Main:GetEquppedUnits()

        for _, unit in next, units do
            if unit == uuid then
                return true
            end
        end

        return false
    end

    function Main:GetUnit2(uuid)

        if Main.UnitCache2[uuid] then
            return Main.UnitCache2[uuid]
        end

        for _, unit in next, Main.Units2 do
            if _ == uuid and Main:isUnitEquipped(_) then

                Main.UnitCache2[uuid] = unit
                return unit
            end
        end

        return nil
    end

    function Main:GetUnit(uuid)

        if Main.UnitCache[uuid] then
            return Main.UnitCache[uuid]
        end

        for _, unit in next, Main.Units do
            if _ == uuid and Main:isUnitEquipped(_) then
                Main.UnitCache[uuid] = unit
                return unit
            end
        end

        return nil
    end

    function Main:GetUUID(unit)
        for uuid, item in next, Main.Units do
            if item == unit and Main:isUnitEquipped(uuid) then
                return uuid
            end
        end

        return nil
    end

    function Main:GetUnitCapacity(uuid)
        if Main.UpgradeCapCache[uuid] then
            return Main.UpgradeCapCache[uuid]
        end

        local unit = Main:GetUnit2(uuid)

        if unit then
            local cap = UnitUtils.GetModifiedStats(unit).Cap
            Main.UpgradeCapCache[uuid] = cap
            return cap
        end

        return 0
    end

    function Main:GetUnitMaxUpgrade(uuid)
        local unitName = Main:GetUnit(uuid)
        local unit;
        if unitName then
            unit = UnitUpgradeData[unitName]

            if unit then
                return #unit
            end
        end

        return 0
    end

    function Main:CountUnitPlaced(unitName)
        local count = 0

        for i,v in next, Assets do
            if v:IsA('Model') and v:GetAttribute('TowerName') == unitName then
                count = count + 1
            end
        end

        return count
    end

    function Main:IsUnitFullUpgraded(unit, uuid)

        local unitName = Main:GetUnit(uuid)
        local maxUpgrade = Main.UpgradeMaxCache[unitName] or Main:GetUnitMaxUpgrade(uuid)
        local Upgraded = false

        if not Main.UpgradeMaxCache[unitName] then
            Main.UpgradeMaxCache[unitName] = maxUpgrade
        end

        local TowerName = unit:GetAttribute('TowerName')
        local CurrentUnitUpgradeStand = unit:GetAttribute('CurrentUnitUpgradeStand')

        if CurrentUnitUpgradeStand == maxUpgrade then
            Upgraded = true
        end

        return Upgraded
    end

    function Main:GetUnitUpgradeData(uuid)
        local unitName = Main:GetUnit(uuid)
        local unit;
        if unitName then
            unit = Main.UpgradeDataCache[unitName] or UnitUpgradeData[unitName]

            if not Main.UpgradeDataCache[unitName] then
                Main.UpgradeDataCache[unitName] = unit
            end

            if unit then
                return unit
            end
        end
        return nil
    end

    function Main:ExtractNumber(Str)
        return tonumber(Str:match('%d+'));
    end;

    function Main:GetMoney()
        return Values.YEN:Get()
    end;

    function Main:GetBestUnitToUpgrade()
        local equipped = Main:GetEquppedUnits()
        local unit, highestDamage, upgradeCost = nil, -math.huge, 0

        for i,v in next, Assets do
            if v:IsA('Model') then
                local TowerName = v:GetAttribute('TowerName')
                local CurrentUnitUpgradeStand = v:GetAttribute('CurrentUnitUpgradeStand')
                local uuid, unitId = Main:GetUUID(TowerName), v:GetAttribute('Entity')

                if not Main:IsUnitFullUpgraded(v, uuid) then
                    local unitUpgrade = Main:GetUnitUpgradeData(uuid)
                    local nextCost = unitUpgrade[CurrentUnitUpgradeStand + 1].Cost
                    local nextDamage = unitUpgrade[CurrentUnitUpgradeStand + 1]['Damage'] or 0

                    if nextDamage > highestDamage then
                        highestDamage = nextDamage
                        upgradeCost = nextCost
                        unit = unitId
                    end
                end
            end
        end

        return unit, upgradeCost
    end

    function Main:CalculateDPS(dmg, cd, range)
        local dps = dmg / cd

        return dps * range
    end

    function Main:GetBestUnitToPlace()
        local equipped = Main:GetEquppedUnits();

        local unit, highestDMGCD, cost, unitType = nil, -math.huge, 0, nil

        for _, uuid in next, equipped do
            local unitName = Main:GetUnit(uuid)

            local unitData = UnitData[unitName]

            local UnitType = unitData['unitType'] or unitData['UnitType']

            -- warn('Type: ', UnitType, #Main().HillCFrame)

            if UnitType == 'Hill' and #Main().HillCFrame == 0 then
                continue
            end

            if unitData['Farm'] then
                if unitData['Range'] ~= 0 then
                    UnitType = 'Buff'
                else
                    UnitType = 'Farm'
                end
            end

            local Capacity = Main:GetUnitCapacity(uuid)
            local Count = Main:CountUnitPlaced(uuid)

            local unitUpgrade = Main:GetUnitUpgradeData(uuid)
            local Cost = unitUpgrade[1].Cost

            local unitDamage = unitUpgrade[#unitUpgrade]['Damage'] or 0
            local unitCooldown = unitUpgrade[#unitUpgrade]['Cooldown'] or 0
            local unitRange = unitUpgrade[#unitUpgrade]['Range'] or 0

            local unitDMGCD = Main:CalculateDPS(unitDamage, unitCooldown, unitRange)

            if Count < Capacity then
                if unitDamage > highestDMGCD then

                    unit = uuid
                    highestDMGCD = unitDMGCD
                    cost = Cost
                    unitType = UnitType
                end
            end
        end

        return unit, cost, unitType
    end;

    function Main:IsEquippedHillUnit()
        local equipped = Main:GetEquppedUnits();

        local isHill = false

        for _, uuid in next, equipped do
            local unitName = Main:GetUnit(uuid)

            local unitData = UnitData[unitName]

            local UnitType = unitData['unitType'] or unitData['UnitType']

            if UnitType == 'Hill' then
                isHill = true
                break
            end
        end

        return isHill
    end;


    function Main:GetSettings()
        return Main.InventoryCache.Settings
    end

    if (not Main:GetSettings()['Auto Skip Wave']) then
        local Args = {
            [1] = "Auto Skip Wave",
            [2] = true,
        }
        ReplicatedStorage.Remotes.ChangeSetting:FireServer(unpack(Args))
    end;

    if (not Main:GetSettings()['Low Quality']) then
        local Args = {
            [1] = "Low Quality",
            [2] = true,
        }
        ReplicatedStorage.Remotes.ChangeSetting:FireServer(unpack(Args))
    end

    if (Main:GetSettings()['Skills Enabled']) then
        local Args = {
            [1] = "Skills Enabled",
            [2] = false,
        }
        ReplicatedStorage.Remotes.ChangeSetting:FireServer(unpack(Args))
    end


    function Main:GetUnitStats(data)
        return UnitUtils.GetModifiedStats(data)
    end;

    function Main:GetBestUnit()
        local Inventory = Main:GetInventory();
        local Rarity = {};

        for _,v in next, Inventory['EquippedUnits'] do
            local uData  = Inventory['Units'][v];
            local rarity = UnitData[uData.Type].Rarity;
            local dataT = UnitData[uData.Type]

            if (uData.Type ~= 'Pink Rockstar' and not dataT.Farm) then 

                local typeU = UnitData[uData.Type]['UnitType'];

                if (UnitData[uData.Type]['UnitType'] == 'Hybrid') then 
                    typeU = 'Ground'
                end;

                table.insert(Rarity,{
                    ['Name'] = uData.Type,
                    ['Cost'] = self:GetUnitStats(uData).Cost,
                    ['Cap'] = self:GetUnitStats(uData).Cap,
                    ['Upgrade'] = UnitUpgradeData[uData.Type],
                    ['Rarity'] = rarity,
                    ['Type'] = typeU,
                    ['Level'] = uData.Level,
                    ['uuid'] = v,
                })
            end;
        end;

         table.sort(Rarity,function(a,b)
            return a.Rarity > b.Rarity;
         end);

         local levelShot = {};
         for _,v in next, Rarity do 
            if (v['Name'] ~= Rarity[1]['Name'] and v.Rarity == Rarity[1].Rarity) then 
                table.insert(levelShot,v)
            end;
         end;

         if (#levelShot > 0) then 

             table.sort(levelShot,function(a,b)
                return a.Level > b.Level;
             end);

             return levelShot[1]
         end;

        return Rarity[1]
    end;

    local BestUnitData = Main:GetBestUnit();

    function Main:GetUpgrade()
        local uUpgrade;
        local upgradeKey = {};

        for _,v in next, Assets do
            if (v and v.Parent) then
                local key = v:GetAttribute('Entity');
                local CurrentUpgrade = v:GetAttribute('CurrentUnitUpgradeStand');
                table.insert(upgradeKey,{
                    ['Entity'] = key,
                    ['CurrentUpgrade'] = CurrentUpgrade,
                })
            end;
        end;

        table.sort(upgradeKey,function(a,b)
            return (a.CurrentUpgrade < b.CurrentUpgrade)
        end)

        local uUKey = upgradeKey[1];
        local StepUpgrade = BestUnitData['Upgrade'][uUKey.CurrentUpgrade+1];
        if (StepUpgrade) then
            uUpgrade = {
                ['key'] = uUKey['Entity'],
                ['Cost'] = StepUpgrade.Cost,
            }
        end;

        if uUpgrade then
            return uUpgrade;
        end;
    end;

    Main().Thread.Payload = task.spawn(function()
        while (not getgenv().Teleport or not getgenv().disconnect) do
            local su,er=pcall(function() task.wait(0.05);
                if (not LocalPlayer.PlayerGui.PAGES.MatchResultPage.Visible) then

                    if (Main:GetWave() == 0) then
                       -- Action:FireServer(RemoteKey['GAME_SKIPROUND'])
                        Network.Fire(GiveKey('GAME_SKIPROUND'))
                    end;

                    local Money = Main:GetMoney()
                    local PlaceCap = Main:CountUnitPlaced(BestUnitData['Name'])
                    if (PlaceCap and PlaceCap < BestUnitData['Cap']) then
                        if (Money >= BestUnitData['Cost']) then
                            Main:PlaceUnit(BestUnitData['uuid'], BestUnitData['Type'])
                            return;
                        end;

                       -- warn('Wait money...')
                    else
                        local CanUpgrade = Main:GetUpgrade();
                        if (CanUpgrade and Money >= CanUpgrade['Cost']) then
                            -- local Args = {
                            --     [1] = RemoteKey['UNIT_UPGRADE'],
                            --     [2] = CanUpgrade['key'],
                            -- }
                            -- Action:FireServer(unpack(Args))

                            Network.Fire(GiveKey('UNIT_UPGRADE'),CanUpgrade['key'])
                        else
                            --warn('Wait money...  ugrade...')
                        end;
                    end;
                end
            end);

            -- if (not su) then
            --     warn('Error: ', er)
            -- end;
        end;
    end);

    function Main:isUnitOwned(unit)
        local CurrentUnitStand = unit:FindFirstChild('CurrentUnitStand')
        if not CurrentUnitStand then
            return false
        end

        local Attachment = CurrentUnitStand:FindFirstChild('Attachment')

        if not Attachment then
            return false
        end

        local Glow = Attachment:FindFirstChild('Glow')

        if not Glow then
            return false
        end

        return tostring(Glow.Color) == '0 1 1 1 0 1 1 1 1 0 '
    end

    local UnitConnections = workspace.Units.ChildAdded:Connect(function(object)
        if (not object:IsA('Model')) then return end;
        object:WaitForChild('Humanoid');
        object:WaitForChild('HumanoidRootPart');
        object:WaitForChild('CurrentUnitStand');
        if (not Main:isUnitOwned(object)) then return end;
        warn('Owner');
        Assets[#Assets+1] = object;
    end);

    table.insert(Main().connections, UnitConnections);

    if Main:IsEquippedHillUnit() then
        spawn(function()
            local Sensor = Instance.new('Part');
            local SensorFolder = Instance.new('Folder', not LPH_OBFUSCATED and workspace or nil);
            local Hill = Instance.new('Folder', not LPH_OBFUSCATED and workspace or nil);

            local Floor = workspace.PhysicalMap.Floor;
            local FloorFront = CFrame.new(Floor.Position.X, Floor.Position.Y + 100, Floor.Position.Z + Floor.Size.Z / 2);

            Hill.Name = 'Hill'
            SensorFolder.Name = 'SensorFolder'
            Sensor.CFrame = FloorFront
            Sensor.Anchored = true
            Sensor.Name = 'Main'
            Sensor.Parent = SensorFolder
            Sensor.Size = Vector3.new(1,1,1)
            Sensor.Transparency = 1;

            function Main:GetNearestPaths(Model)
                local closest = nil;
                local shortestDistance = math.huge;
                local Sucessfully,Error = pcall(function()
                    for _,v in pairs(workspace.Paths["1"]:GetChildren()) do
                        if (v:IsA('Part')) then
                                local magnitude = (v.Position - Model:GetModelCFrame().Position).magnitude
                                if (tonumber(magnitude)<shortestDistance) then
                                closest = v;
                                shortestDistance = magnitude;
                            end;
                        end;
                    end;
                end)
                if (not Sucessfully) then
                    warn('Error:GetNearest', Error);
                end;
                return (closest);
            end;

            local count = 1;
            local AllHillModel = {};
            local BuildFolder

            for i,v in next, workspace.PhysicalMap:GetChildren() do
                if v:IsA('Folder') and v.Name ~= 'Trail' and #v:GetChildren() ~= 0 then
                    BuildFolder = v
                    break
                end
            end

            warn(BuildFolder.Name)

            local Building = BuildFolder:FindFirstChild('Build') or BuildFolder

            for i,v in next, Building:GetChildren() do
                if (v:IsA('Model')) then
                    local NearestPaths = Main:GetNearestPaths(v)
                    local ModelCFrame = v:GetModelCFrame()
                    if (ModelCFrame.Position - NearestPaths.Position).magnitude <= 20 then
                        table.insert(AllHillModel,v);
                    end;
                end;
            end;

            for i = 1, 50 do
                local createSensor = Sensor:Clone();
                createSensor.Name = tostring(i);
                createSensor.Parent = SensorFolder;
                local oldsensor;


                if (i < 25) then
                    if (i-1 == 0) then
                        oldsensor=Sensor
                    else
                        oldsensor = SensorFolder[tostring(i-1)]
                    end;

                    createSensor.CFrame = oldsensor.CFrame * CFrame.new(4,0,0)
                else
                    if (i == 25) then
                        oldsensor=Sensor
                    else
                        oldsensor = SensorFolder[tostring(i-1)]
                    end;

                    createSensor.CFrame = oldsensor.CFrame * CFrame.new(-4,0,0)
                end;
            end;

            function Main:SensorRaycastFront(sensor)
                local rayOrigin = sensor.Position
                local rayDirection = Vector3.new(0, -170, 0)
                local Params = RaycastParams.new()
                Params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character,workspace.Paths}
                local Result = workspace:Raycast(rayOrigin, rayDirection, Params)
                if (not Result) then return end;
                return Result;
            end;

            local oldtick = tick();
            repeat task.wait()
                local stepto = -4;
                for _,sensor in next, SensorFolder:GetChildren() do
                    sensor.CFrame = sensor.CFrame * CFrame.new(0,0,stepto)
                    local Result = Main:SensorRaycastFront(sensor);
                    if (Result and Result.Instance:IsA('MeshPart') and Result.Instance.Parent:IsA('Model')
                    and Result.Position.Y > Floor.Position.Y+3) then
                        local PathsHill;
                        if (table.find(AllHillModel,Result.Instance.Parent)) or (Result.Instance.Parent.Parent and table.find(AllHillModel,Result.Instance.Parent.Parent)) then
                            PathsHill = Result.Instance.Parent:FindFirstChildOfClass('Folder')
                            local part = Instance.new('Part')
                            part.Size = Vector3.new(1,1,1)
                            part.Anchored = true
                            part.CFrame = CFrame.new(Result.Position);
                            part.Name = 'Hill'
                            part.Parent = Hill;
                            part.Transparency = 1
                        end;
                    end;
                end;
            until (tick() - oldtick > 5);

            function GetDistanceFromPath(cframe)
                local center = Main:GetPaths(MainCenter)
                return (center.Position - cframe.Position).magnitude
            end

            for i,v in next, Hill:GetChildren() do
                table.insert(Main().HillCFrame,v.CFrame)
            end;

            table.sort(Main().HillCFrame,function(a,b)
                return GetDistanceFromPath(a) < GetDistanceFromPath(b)
            end)
            warn('HII PASS')
        end);
    end
end;


warn('Creating UI...')

local Library, Utility = loadstring(http_request({Url = 'https://androssy.net/files/AnimeDefenderUi.lua'}).Body)();
local Window = Library:Window({
    Title = "Anime Defenders",
    Description = "By Code X & Androssy",
})
getgenv().Window = Window;


local Gem = Window:ImageButton({
    Title = "",
    Image = "rbxassetid://16637242593",
})

local Info = Window:ImageButton({
    Title = "",
    Image = "rbxassetid://17648368283",
})

local PcName = getgenv().Configuration and getgenv().Configuration['PC Name'] or 'Xenon Hub'
local UIParent = get_hidden_gui and get_hidden_gui() or gethui and gethui()

local FluxusUI = nil

table.insert(Main().connections, RenderingConnection)

local seconds = math.floor(workspace.DistributedGameTime)

local PcName = getgenv().Configuration['PC Name'] or 'Xenon Hub'

local ServerResponsed = true

local Sockets = {
    Socket = nil,
}

local WebSocket = isexecutorclosure and WebSocket or syn and syn.websocket or websocket or nil
local WS_URL = "ws://66.118.234.247:3001/api/v1/users/sessions/update"
ws://66.118.234.43:3001/api/v1/users/sessions/update
if not WebSocket then
    warn("Websocket not found")
    return
end
ws://66.118.234.43:3001/api/v1/users/sessions/update
warn(WebSocket.Connect)

local Connect = WebSocket.connect or WebSocket.Connect

local UpdateAccountThread = task.spawn(function()
    while true do
        local Inventory = Main:GetInventory();

        local Currencies = Inventory['Currencies']
        local Items = Inventory['Items']

        local Gems = Currencies['Gems']
        local Gold = Currencies['Gold']
        local Level = Inventory['Level']
        local TraitCrystal = Items['Trait Crystal'] or 0
        local RiskyDice = Items['Risky Dice'] or 0

        Gem:Set({Title = "Gems : "..tostring(Gems).."\nGold : "..tostring(Gold),Image = "rbxassetid://16637242593"})
        Info:Set({Title = "Trait Crystal : "..TraitCrystal.."\nLevel : "..tostring(Level),Image = "rbxassetid://17648368283"})

        if (Ingame) then
            TaskUpdate = 'InGame'
        end;

        seconds = math.floor(workspace.DistributedGameTime)

        if tick() >= Cooldown.RequestWeb and ServerResponsed then
            Cooldown.RequestWeb = tick() + 480

            local StartedAt = tick()

            warn('Updating Account...')

            Sockets.Socket = Sockets.Socket or Connect(WS_URL)

            warn('Connected to Websocket', Sockets.Socket)

            local Data = {
                userQuery = tostring(Main.License),
                pcName = tostring(PcName),
                robloxUsername = tostring(LocalPlayer.Name), -- tostring(LocalPlayer.Name)
                level = tostring(Level),
                gem = tostring(Gems),
                gold = tostring(Gold),
                traits = tostring(TraitCrystal),
                riskyDice = tostring(RiskyDice),
                statusText = tostring(TaskUpdate),
            }

            if Sockets.Socket then
                Sockets.Socket:Send(HttpService:JSONEncode(Data))
            end
        end;

        task.wait(2)
    end
end)



table.insert(Main().Thread, UpdateAccountThread)

local Passed, Statement = pcall(function()
    local Template = LocalPlayer.PlayerGui.TopBar.HolderFrame.Left:FindFirstChildOfClass("ImageButton")

    local ToggleButton = Template:Clone()

    if ToggleButton:FindFirstChild('DropdownFrame') then
        ToggleButton.DropdownFrame:Destroy()
    end

    if ToggleButton:FindFirstChild('SelectedFrame') then
        ToggleButton.SelectedFrame:Destroy()
    end

    ToggleButton.Name = 'Toggle Ui'

    ToggleButton:FindFirstChildOfClass('ImageLabel').Image = 'rbxassetid://17648368283'

    ToggleButton.Parent = Template.Parent

    local ViewportPart = Instance.new('Part')
    ViewportPart.Size = Vector3.new(4, 4, 4)
    ViewportPart.Anchored = true
    ViewportPart.Transparency = 1
    ViewportPart.CanCollide = false
    ViewportPart.Parent = workspace
    ViewportPart.CFrame = CFrame.new(0, 100000, 0)

    workspace.CurrentCamera.CameraSubject = ViewportPart

    ToggleButton.Activated:Connect(function()
        Window:Toggle()
        RunService:Set3dRenderingEnabled(not Window.IsOpen())
        if Window.IsOpen() then
            workspace.CurrentCamera.CameraSubject = ViewportPart
        else
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
        end
    end)
end)

if (not Passed) then
    warn('Error: ', Statement)
end;

local RunService = game:GetService("RunService")
RunService:Set3dRenderingEnabled(false)

