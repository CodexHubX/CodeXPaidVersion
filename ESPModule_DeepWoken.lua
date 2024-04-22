local Service = {};
local mt_service = setmetatable(Service,{
    __index = function(self,key)
        return game:GetService(tostring(key));
    end;
});
local LocalPlayer = game.Players.LocalPlayer;
local PlaceId = game.PlaceId;
local RunService = Service['RunService'];
local Players = Service['Players'];
local CurrentCamera = workspace.CurrentCamera;

local CODE_X = {
    Settigs = {
        enabled = false,
        box = false, 
        boxColor = Color3.fromRGB(255, 255, 255),
        healthbar = false,
        nametag = false,
        nametagColor = Color3.fromRGB(143, 50, 232),
        distance = false,
        distanceColor = Color3.fromRGB(50, 198, 232),
        tracer = false,
        tracerColor = Color3.fromRGB(255, 0, 0),
        healthtext = false,
        showMaxHealth = false,
        healthTextColor = Color3.fromRGB(50, 232, 50),
        power = false,
        powerColor = Color3.fromRGB(220, 223, 38),
        oath = false,
        oathColor = Color3.fromRGB(255, 255, 255),
        guild = false,
        guildColor = Color3.fromRGB(255, 255, 255),
        chams = false,
        chamsColor = Color3.fromRGB(255, 0, 0),
        chamsOutlineColor = Color3.fromRGB(255, 0, 0),
        uselimitDistance = false,
        limitDistance = 15000,
        entity_enabled = false,
        entity_ShowHealth = false,
        entity_ShowDistance = false,
        entity_Chams = false,
        entity_TextColor  = Color3.fromRGB(255, 255, 255),
        entity_ChamsColor = Color3.fromRGB(175,25, 235),
        entity_limitDistance = 15000,
    },
    

    _asset = {_module = { 
    __newquad = function(color ,thickness)
        local quad = Drawing.new("Quad")
        quad.Color = color
        quad.Filled = false
        quad.Visible = false
        quad.Thickness = thickness
        quad.Transparency = 1
        return quad
    end,
    __newline = function(color , thickness)
        local line = Drawing.new("Line")
        line.Visible = false
        line.Color = color 
        line.Thickness = thickness
        line.Transparency = 1
        return line
    end,
    __newtext = function(text, color , size)
        local Text = Drawing.new("Text")
        Text.Visible = false
        Text.Center = true
        Text.Outline = true
        Text.Font = 2
        Text.Color = color
        Text.Size = size
        Text.Text = tostring(text)
        return Text
    end,

    __setquadpoint = function(Quad,root_pos,height)
        Quad.PointA = Vector2.new(root_pos.X + height, root_pos.Y - height*2);
        Quad.PointB = Vector2.new(root_pos.X - height, root_pos.Y - height*2);
        Quad.PointC = Vector2.new(root_pos.X - height, root_pos.Y + height*2);
        Quad.PointD = Vector2.new(root_pos.X + height, root_pos.Y + height*2);
    end,
        },
    },
};


local Settigs = CODE_X.Settigs;

function CODE_X:AddPlayer(player)
    local self = setmetatable({},self._asset);
    local _module = getrawmetatable(self)._module;
    
    self._class = 'Player';
    self._drawing = {};
    self.player = player;
    self.name = player.Name;
    self.id = player.UserId;

    self._drawing.box = _module.__newquad(Color3.fromRGB(255, 0, 0),1);
    self._drawing.black = _module.__newquad(Color3.fromRGB(255, 0, 0),1);

    self._drawing._healthbar = _module.__newline(Color3.fromRGB(255, 255, 255),1);
    self._drawing._greenhealth = _module.__newline(Color3.fromRGB(255, 255, 255),1);

    self._drawing.helath_label = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);
    self._drawing.name_label  = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);
    self._drawing.distance_label  = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);
    self._drawing.line = _module.__newline(Color3.fromRGB(255, 255, 255),1);
    self._drawing.blackline = _module.__newline(Color3.fromRGB(255, 255, 255),2);

    self._drawing.power_label = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);
    self._drawing.oath_label = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);
    self._drawing.guild_label = _module.__newtext('',Color3.fromRGB(255, 255, 255),12);

    self.highlight = Instance.new("Highlight");

        if (player:FindFirstChild('Backpack')) then 
            for _,v in next, player:FindFirstChild('Backpack'):GetChildren() do
                if (v:IsA('Folder') and v.Name:find('Talent:Oath')) then
                    self.oath = v.Name:split(':Oath: ')[2]
                end;
            end;
        end;

        self._visible = function(Stage)
            local Successfully, Error = pcall(function()
                if (not Stage) then 
                    for _,drawing in next, self._drawing do 
                        drawing.Visible = false;
                    end;
                    return;
                end;

                self._drawing.box.Visible = Settigs.box;
                self._drawing.black.Visible = Settigs.box;

                self._drawing._healthbar.Visible = Settigs.healthbar;
                self._drawing._greenhealth.Visible = Settigs.healthbar;
            
                self._drawing.helath_label.Visible = Settigs.healthtext;
                self._drawing.name_label.Visible = Settigs.nametag;
                self._drawing.distance_label.Visible = Settigs.distance;
                self._drawing.line.Visible = Settigs.tracer;
                self._drawing.blackline.Visible = Settigs.tracer;

                self._drawing.power_label.Visible = Settigs.power;
                self._drawing.oath_label.Visible = Settigs.oath;
                self._drawing.guild_label.Visible = Settigs.guild;

                self.highlight.Enabled = Settigs.chams;
            end)

            if (not Successfully) then 
                warn('Error esplib _visible func: ',Error)
            end;
        end;

        self._updater = function()
            local Successfully, Error = pcall(function()
      
                if (not player or not player.Character or not Settigs.enabled) then 
                    return self._visible(false); 
                end;

                local humanoid = player.Character:FindFirstChildOfClass('Humanoid');
                if (not humanoid) then 
                    return self._visible(false);
                end;

                local root_pos,onscreen;
                local distance_check;
                local head_pos;
                local height;

                if (not humanoid.rootPart) then 

                    local map_pos = player.Character:GetAttribute('MapPos')

                    if (not map_pos) then 
                        return self._visible(false); 
                    end;

                    root_pos,onscreen = CurrentCamera:WorldToViewportPoint(Vector3.new(map_pos.X,LocalPlayer.Character.HumanoidRootPart.Position.Y,map_pos.Z));
                    distance_check = Vector3.new(map_pos.X,LocalPlayer.Character.HumanoidRootPart.Position.Y,map_pos.Z);
                    head_pos = CurrentCamera:WorldToViewportPoint(Vector3.new(map_pos.X,LocalPlayer.Character.Head.Position.Y,map_pos.Z));
                    height = math.clamp((Vector2.new(head_pos.X, head_pos.Y) - Vector2.new(root_pos.X, root_pos.Y)).magnitude, 2, math.huge);
                else 
                    root_pos,onscreen = CurrentCamera:WorldToViewportPoint(humanoid.rootPart.Position);
                    distance_check = humanoid.rootPart.Position;
                    head_pos = CurrentCamera:WorldToViewportPoint(player.Character.Head.Position);
                    height = math.clamp((Vector2.new(head_pos.X, head_pos.Y) - Vector2.new(root_pos.X, root_pos.Y)).magnitude, 2, math.huge)
                end;

                if (onscreen) then 

                    local distance = LocalPlayer:DistanceFromCharacter(distance_check);
                    
                    if (Settigs.uselimitDistance and distance > Settigs.limitDistance) then 
                        self._visible(false);
                        return;
                    end;

                    self._visible(true);

                    _module.__setquadpoint(self._drawing.box,root_pos,height);
                    _module.__setquadpoint(self._drawing.black,root_pos,height);

                    self._drawing.box.Color = Settigs.boxColor;
                    self._drawing.black.Color = Settigs.boxColor;

                    self.highlight.Parent = player.Character;
                    self.highlight.FillColor = Settigs.chamsColor;
                    self.highlight.OutlineColor = Settigs.chamsOutlineColor;

                    local bar = (Vector2.new(root_pos.X - height, root_pos.Y - height*2) - Vector2.new(root_pos.X - height, root_pos.Y + height*2)).magnitude;
                    local healthoffset = humanoid.Health/humanoid.MaxHealth * bar;

                    -- // Health Bar
            
                    self._drawing._greenhealth.From = Vector2.new(root_pos.X - height - 4, root_pos.Y + height*2);
                    self._drawing._greenhealth.To = Vector2.new(root_pos.X - height - 4, root_pos.Y + height*2 - healthoffset);

                    self._drawing._healthbar.From = Vector2.new(root_pos.X - height - 4, root_pos.Y + height*2);
                    self._drawing._healthbar.To = Vector2.new(root_pos.X - height - 4, root_pos.Y - height*2);
                    self._drawing._greenhealth.Color = Color3.fromRGB(255, 0, 0):lerp(Color3.fromRGB(0, 255, 0), humanoid.Health/humanoid.MaxHealth);

                    -- // Name Tag 
                    local vector_convert_name = Vector2.new((self._drawing.box.PointA.X + self._drawing.box.PointB.X) / 2,(self._drawing.box.PointA.Y + self._drawing.box.PointB.Y) / 2);

                    self._drawing.name_label.Text = self.name;
                    self._drawing.name_label.Position = Vector2.new(vector_convert_name.X,vector_convert_name.Y - 15); 
                    self._drawing.name_label.Color = Settigs.nametagColor;

                    -- // Health & MaxHealth Text

                    self._drawing.helath_label.Text = tostring(humanoid.Health):split('.')[1]..' hp';
                    self._drawing.helath_label.Position = self._drawing._greenhealth.To + Vector2.new(-20,0)
                    self._drawing.helath_label.Color = Settigs.healthTextColor;

                    -- // Distance Text
                    local vector_convert_distance = Vector2.new((self._drawing.box.PointC.X + self._drawing.box.PointD.X) / 2,(self._drawing.box.PointC.Y + self._drawing.box.PointD.Y) / 2)

                    self._drawing.distance_label.Text = tostring(distance):split('.')[1]..' away';
                    self._drawing.distance_label.Position = Vector2.new(vector_convert_distance.X,vector_convert_distance.Y + 5);
                    self._drawing.distance_label.Color = Settigs.distanceColor;

                    -- // Tracer
                    self._drawing.line.From  = Vector2.new(CurrentCamera.ViewportSize.X*0.5, CurrentCamera.ViewportSize.Y);
                    self._drawing.blackline.From = Vector2.new(CurrentCamera.ViewportSize.X*0.5, CurrentCamera.ViewportSize.Y);

                    self._drawing.line.To = Vector2.new(root_pos.X, root_pos.Y + height*2);
                    self._drawing.blackline.To = Vector2.new(root_pos.X, root_pos.Y + height*2);
                    self._drawing.line.Color = Settigs.tracerColor;
                    self._drawing.blackline.Color = Settigs.tracerColor;

                    -- // Power
                    self._drawing.power_label.Text = 'Power: '..tostring(player.Character:GetAttribute('Level'));                  
                    self._drawing.power_label.Color = Settigs.powerColor;
                    if (Settigs.nametag) then 
                        self._drawing.power_label.Position = self._drawing.name_label.Position + Vector2.new(0,-13) 
                    else 
                        self._drawing.power_label.Position = Vector2.new(vector_convert_name.X,vector_convert_name.Y - 15); 
                    end;

                    -- // Guild
                    local guild = player.Character:GetAttribute('Guild');
                    if (not guild or guild == '') then
                        guild = 'None'
                    end;

                    self._drawing.guild_label.Text = 'Guid: '..tostring(guild);             
                    self._drawing.guild_label.Color = Settigs.guildColor;

                    if (Settigs.distance) then 
                        self._drawing.guild_label.Position = self._drawing.distance_label.Position + Vector2.new(0,13);
                    else 
                        self._drawing.guild_label.Position = Vector2.new(vector_convert_distance.X,vector_convert_distance.Y + 5);
                    end;

                    if (self.oath) then 
                        self._drawing.oath_label.Text = 'Oath: '..self.oath;
                    else 
                        self._drawing.oath_label.Text = 'Oath: None';
                    end;
                     
                    if (Settigs.guild and Settigs.distance) then 
                        self._drawing.oath_label.Position = self._drawing.guild_label.Position + Vector2.new(0,13)
                    elseif (Settigs.distance and not Settigs.guild) then 
                        self._drawing.oath_label.Position = self._drawing.distance_label.Position + Vector2.new(0,13);
                    elseif (not Settigs.distance and Settigs.guild) then 
                        self._drawing.oath_label.Position = self._drawing.guild_label.Position + Vector2.new(0,13)
                    else 
                        self._drawing.oath_label.Position = Vector2.new(vector_convert_distance.X,vector_convert_distance.Y + 5);
                    end;

                    self._drawing.oath_label.Color = Settigs.oathColor;

                    return;
                end;

                self._visible(false);
            end)

            if (not Successfully) then 
                warn('Error esplib _updater func: ',Error)
            end;
        end;
    

    self.Rander = RunService.Heartbeat:Connect(function(Time)
        self._updater(Time);
    end);

    self._destroy = function()
        local Successfully, Error = pcall(function()
            self.Rander:Disconnect()
            self.Rander = nil;

            self._ancestrychanged:Disconnect();
            self._ancestrychanged = nil;
            self.highlight:Destroy();

            for _,drawing in next, self._drawing do 
                drawing:Remove();
                drawing = nil;
            end;

            print('Sucessfully Destroy Object: ', self.name);
        end)

        if (not Successfully) then 
            warn('Error: _destroy',Error);
        end;
    end;

    self._ancestrychanged = self.player.AncestryChanged:Connect(self._destroy);
end;


function CODE_X:AddEntity(character,name)
    local self = setmetatable({},self._asset);
    local _module = getrawmetatable(self)._module;

    self._class = 'Entity';
    self._instance = character;
    self._connection = nil;
    self._name = name or character.Name;
    self._drawing  = _module.__newtext('',Color3.fromRGB(255, 255, 255),14);
    self.highlight = Instance.new("Highlight");

    self._updater = function()
        local Successfully, Error = pcall(function()

            if (not self._instance:FindFirstChild('HumanoidRootPart')) then 
                if (self._connection) then 
                    self._connection:Disconnect();
                    self._connection = nil;
                    self._drawing.Visible = false;
                    self.highlight.Enabled = false;
                end;
                return;
            end;
            
            local instance_pos,onscreen = CurrentCamera:WorldToViewportPoint(self._instance.HumanoidRootPart.Position);
            if (onscreen) then 

                local distance = LocalPlayer:DistanceFromCharacter(self._instance.HumanoidRootPart.Position);

                if (distance > Settigs.entity_limitDistance or not Settigs.entity_enabled) then 
                    self._drawing.Visible = false;
                    self.highlight.Enabled = false;
                    return;
                end;

                local humanoid = self._instance:FindFirstChildOfClass('Humanoid');
                if (not humanoid) then return end;

                if (Settigs.entity_Chams) then 
                    self.highlight.Enabled = Settigs.entity_Chams;
                    self.highlight.Parent = self._instance;
                    self.highlight.FillColor = Settigs.entity_ChamsColor;    
                    self.highlight.OutlineColor = Settigs.entity_ChamsColor;    
                end;

                self._drawing.Visible = true;
                self._drawing.Color = Settigs.entity_TextColor;
                self._drawing.Position = Vector2.new(instance_pos.X,instance_pos.Y);

                if (Settigs.entity_ShowHealth and Settigs.entity_ShowDistance) then 
                    self._drawing.Text = string.format("%s\n%s away\nHealth: %s/%s", self._name, math.floor(distance), math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
                elseif (Settigs.entity_ShowHealth) then 
                    self._drawing.Text = string.format("%s\n%s away", self._name, math.floor(distance))
                elseif (Settigs.entity_ShowDistance)  then 
                    self._drawing.Text = string.format("%s\nHealth: %s/%s", self._name, math.floor(humanoid.Health), math.floor(humanoid.MaxHealth))
                else 
                    self._drawing.Text = self._name;
                end;
            else 
                self._drawing.Visible =  false;
                self.highlight.Enabled = false;
            end;
        end)
        if (not Successfully) then 
            warn('Error: Entity _updater', Error);
        end;
    end;        

    self._Rander = function(Stage)
        self._connection = RunService.Heartbeat:Connect(function(Time)
            self._updater(Time);
        end);
    end;

    if (character:FindFirstChild('HumanoidRootPart')) then 
        self._Rander();
    end;

    self._child_added = character.ChildAdded:Connect(function(child)
        if (child.Name == 'HumanoidRootPart') then 
            self._Rander();
        end;
    end);

    self._destroy = function()
        if (self._connection) then 
            self._connection:Disconnect();
            self._connection = nil;
        end;

        if (self._child_added) then 
            self._child_added:Disconnect();
            self._child_added = nil;
        end;

        if (self._ancestrychanged) then 
            self._ancestrychanged:Disconnect();
            self._ancestrychanged = nil;
        end;

        self._drawing:Remove();
    end;

    self._ancestrychanged = self._instance.AncestryChanged:Connect(function(_,parent)
        if (not parent) then 
            self._destroy()
        end;
    end);
end;    

function CODE_X:AddInstance(instance,name)
    local self = setmetatable({},self._asset);
    local _module = getrawmetatable(self)._module;

    self._class = 'Instance';
    self.ShowDistance = false;
    self.TextColor = Color3.fromRGB(255, 255, 255);

    self._instance = instance;
    self._connection = nil;
    self._name = name or instance.Name;
    self._limitDistance = 15000;
    self._drawing  = _module.__newtext('',Color3.fromRGB(255, 255, 255),14);

    self._updater = function()
        local Successfully, Error = pcall(function()
            local instance_pos,onscreen = CurrentCamera:WorldToViewportPoint(self._instance.Position);
            if (onscreen) then 
                local distance = LocalPlayer:DistanceFromCharacter(self._instance.Position);
                if (distance > self._limitDistance) then 
                    self._drawing.Visible = false;
                    return;
                end;

                self._drawing.Visible = true;
                self._drawing.Color = self.TextColor;

                if (self.ShowDistance) then 
                    self._drawing.Text = '['..self._name..']'..'['..tostring(distance):split('.')[1]..' away]';
                else 
                    self._drawing.Text = '['..self._name..']';
                end;
                self._drawing.Position = Vector2.new(instance_pos.X,instance_pos.Y);
            else 
                self._drawing.Visible = false;
            end;
        end)

        if (not Successfully) then 
            warn('Error: _updater', Error);
        end;
    end;

    self._enabled = function(Stage)
        if (not Stage) then 
            if (self._connection) then 
                self._connection:Disconnect();
                self._connection = nil;  
            end;
            self._drawing.Visible = false;
            return;
        end;

        if (self._connection) then return end;

        self._connection = RunService.Heartbeat:Connect(function(Time)
            self._updater(Time);
        end);
    end;    

    self._destroy = function()
        
        pcall(function()
            self._connection:Disconnect();
            self._connection = nil;
        end);

        pcall(function()
            self._ancestrychanged:Disconnect();
            self._ancestrychanged = nil;
        end);

        self._drawing:Remove();
        self._enabled = function() 
            return 
        end;
    end;

    self._ancestrychanged = self._instance.AncestryChanged:Connect(function(_,parent)
        if (not parent) then 
            self._destroy()
        end;
    end);
    return self;
end;



function CODE_X:Load()

    for _,player in next, Players:GetPlayers() do 
        if (player ~= LocalPlayer) then 
            CODE_X:AddPlayer(player);
        end;
    end;

    getgenv().ESPUpdate = Players.ChildAdded:Connect(function(player)
        CODE_X:AddPlayer(player);
    end);
end;

return CODE_X;


