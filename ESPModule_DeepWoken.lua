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
        enabled = true,
        box = true, 
        boxColor = Color3.fromRGB(255, 255, 255),
        healthbar = true,
        nametag = true,
        nametagColor = Color3.fromRGB(143, 50, 232),
        distance = true,
        distanceColor = Color3.fromRGB(50, 198, 232),
        tracer = false,
        tracerColor = Color3.fromRGB(255, 0, 0),
        healthtext = true,
        showMaxHealth = false,
        healthTextColor = Color3.fromRGB(50, 232, 50),
        power = true,
        powerColor = Color3.fromRGB(220, 223, 38),
        oath = true,
        oathColor = Color3.fromRGB(255, 255, 255),
        guild = false,
        guildColor = Color3.fromRGB(255, 255, 255),
        chams = true,
        chamsColor = Color3.fromRGB(255, 0, 0),
        chamsOutlineColor = Color3.fromRGB(255, 0, 0),
        uselimitDistance = false,
        limitDistance = 20000,
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

        for _,v in next, player.Backpack:GetChildren() do
            if (v:IsA('Folder') and v.Name:find('Talent:Oath')) then
                self.oath = v.Name:split(':Oath: ')[2]
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
        end)

        if (not Successfully) then 
            warn('Error: _destroy',Error);
        end;
    end;

    self.Rander = RunService.Heartbeat:Connect(function(Time)
        self._updater(Time);
    end);

    self._ancestrychanged = self.player.AncestryChanged:Connect(self._destroy);
end;


return CODE_X;
