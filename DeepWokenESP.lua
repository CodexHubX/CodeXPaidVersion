
local Library = {}
local InstanceData = {}
local CharacterData = {}
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()


local Settings = {
    Box = true,
    Box_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Thickness = 1,
    HealthBar = true,
    Box_Thickness = 1,
    Tracer_Origin = "Bottom", 
    Tracer_FollowMouse = false,
    Tracers = false
}
local Team_Check = {
    TeamCheck = false, 
    Green = Color3.fromRGB(0, 255, 0),
    Red = Color3.fromRGB(255, 0, 0)
}
local TeamColor = true



-- Library.PlayersESP = true 
-- Library.Box = true 
-- Library.Tracers = false
-- Library.Name = true
-- Library.HealthBar = true
-- Library.HealthText = true
-- Library.Distance = true
-- Library.Skeleton = true
Library.LimitDistanceValue = math.huge

-- Set Color
Library.TracerColor = Color3.fromRGB(248, 241, 241)
Library.BoxColor = Color3.fromRGB(255,255,255)
Library.NameColor = Color3.fromRGB(25, 171, 25)
Library.SkeletonColor = Color3.fromRGB(255, 0, 0)
--

function Library:DrawLine()
    local Line = Drawing.new("Line")
    Line.Visible = false
    Line.From = Vector2.new(0, 0)
    Line.To = Vector2.new(1, 1)
    Line.Color = Color3.fromRGB(255, 0, 0)
    Line.Thickness = 1
    Line.Transparency = 1
    return Line
end

function Library:NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

function Library:NewLine(thickness, color)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color 
    line.Thickness = thickness
    line.Transparency = 1
    return line
end


function Library:NewText(Name,color)
    local Text = Drawing.new("Text")
    Text.Visible = false
    Text.Center = true
    Text.Outline = true
    Text.Font = 2
    Text.Color = color
    Text.Size = 15
    Text.Text = Name
    return Text
end



function Library:Visibility(state, lib)
    for u, x in pairs(lib) do
        x.Visible = state
    end
end

function Library:ToColor3(col) 
    local r = col.r 
    local g = col.g
    local b = col.b 
    return Color3.new(r,g,b);
end

function Library:DestroyESP(lib) 
    for i, v in pairs(lib) do
        v:Remove()
    end
end

local black = Color3.fromRGB(255, 255 ,255)

function MAINESP(plr)
    pcall(function()
        repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil

    local R15 = (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15) and true or false

        local Skeleton = {}

        local libraryesp = {
            blacktracer = Library:NewLine(Settings.Tracer_Thickness*2, Color3.fromRGB(255, 255 ,255)),
            tracer = Library:NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),
            black = Library:NewQuad(Settings.Box_Thickness*2, Color3.fromRGB(255, 255 ,255)),
            box = Library:NewQuad(Settings.Box_Thickness, Settings.Box_Color),
            healthbar = Library:NewLine(3, Color3.fromRGB(255, 255 ,255)),
            greenhealth = Library:NewLine(1.5, Color3.fromRGB(255, 255 ,255)),
            name = Library:NewText(plr.Name,Color3.fromRGB(255, 255 ,255)),
        }
        
        if R15 then 
            Skeleton = {
                -- Spine
                Head_UpperTorso = Library:DrawLine(),
                UpperTorso_LowerTorso = Library:DrawLine(),
                -- Left Arm
                UpperTorso_LeftUpperArm = Library:DrawLine(),
                LeftUpperArm_LeftLowerArm = Library:DrawLine(),
                LeftLowerArm_LeftHand = Library:DrawLine(),
                -- Right Arm
                UpperTorso_RightUpperArm = Library:DrawLine(),
                RightUpperArm_RightLowerArm = Library:DrawLine(),
                RightLowerArm_RightHand = Library:DrawLine(),
                -- Left Leg
                LowerTorso_LeftUpperLeg = Library:DrawLine(),
                LeftUpperLeg_LeftLowerLeg =Library: DrawLine(),
                LeftLowerLeg_LeftFoot = Library:DrawLine(),
                -- Right Leg
                LowerTorso_RightUpperLeg = Library:DrawLine(),
                RightUpperLeg_RightLowerLeg = Library:DrawLine(),
                RightLowerLeg_RightFoot = Library:DrawLine(),
            }
        else
            Skeleton = {
                Head_Spine = Library:DrawLine(),
                Spine = Library:DrawLine(),
                LeftArm = Library:DrawLine(),
                LeftArm_UpperTorso = Library:DrawLine(),
                RightArm = Library:DrawLine(),
                RightArm_UpperTorso = Library:DrawLine(),
                LeftLeg = Library:DrawLine(),
                LeftLeg_LowerTorso = Library:DrawLine(),
                RightLeg = Library:DrawLine(),
                RightLeg_LowerTorso = Library:DrawLine()
            }
        end

        
    function Colorize(color)
        pcall(function()
            for u, x in pairs(libraryesp) do
                if x ~= libraryesp.healthbar and x ~= libraryesp.greenhealth and x ~= libraryesp.blacktracer and x ~= libraryesp.black then
                    x.Color = color
                end
            end
        end)
    end

    function Updater()  
        pcall(function()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local HumPos, OnScreen = CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if OnScreen then

                    local head = CurrentCamera:WorldToViewportPoint(plr.Character.Head.Position)
                    local humanoidrootpart = CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0,-3,0))
                    local tophead = CurrentCamera:WorldToViewportPoint(plr.Character.Head.Position + Vector3.new(0,2,0))


                    local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                    local Studsdistance = (plr.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                    
                    
                    local function Size(item)
                        item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY*2)
                        item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2)
                        item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)
                        item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY*2)
                    end
                    
                    local function Size2(item)
                        item.PointA = Vector2.new(0, 0)
                        item.PointB = Vector2.new(0, 0)
                        item.PointC = Vector2.new(0, 0)
                        item.PointD = Vector2.new(0, 0)
                    end

                    if Library.LimitDistanceValue then 
                        --warn(Studsdistance , Library.LimitDistanceValue)

                        if Studsdistance > Library.LimitDistanceValue or not Library.PlayersESP then 
                            for _,v in pairs(libraryesp)do 
                                v.Visible = false
                            end
                            for _,v in pairs(Skeleton)do 
                                v.Visible = false
                            end
                            return
                        end
                    end
    
                    if Library.Skeleton then 
                        for i,v in pairs(Skeleton)do 
                            v.Color = Library.SkeletonColor
                            v.Visible = true
                        end
                        if R15 then 
                            if Skeleton.Head_UpperTorso.From ~= Vector2.new(head.X, head.Y) then
                                local UT = CurrentCamera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                                local LT = CurrentCamera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                                -- Left Arm
                                local LUA = CurrentCamera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                                local LLA = CurrentCamera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                                local LH = CurrentCamera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                                -- Right Arm
                                local RUA = CurrentCamera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                                local RLA = CurrentCamera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                                local RH = CurrentCamera:WorldToViewportPoint(plr.Character.RightHand.Position)
                                -- Left leg
                                local LUL = CurrentCamera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                                local LLL = CurrentCamera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                                local LF = CurrentCamera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                                -- Right leg
                                local RUL = CurrentCamera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                                local RLL = CurrentCamera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                                local RF = CurrentCamera:WorldToViewportPoint(plr.Character.RightFoot.Position)

                                Skeleton.Head_UpperTorso.From = Vector2.new(head.X, head.Y)
                                Skeleton.Head_UpperTorso.To = Vector2.new(UT.X, UT.Y)
        
                                --Spine
                                Skeleton.UpperTorso_LowerTorso.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.UpperTorso_LowerTorso.To = Vector2.new(LT.X, LT.Y)
        
                                -- Left Arm
                                Skeleton.UpperTorso_LeftUpperArm.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.UpperTorso_LeftUpperArm.To = Vector2.new(LUA.X, LUA.Y)
        
                                Skeleton.LeftUpperArm_LeftLowerArm.From = Vector2.new(LUA.X, LUA.Y)
                                Skeleton.LeftUpperArm_LeftLowerArm.To = Vector2.new(LLA.X, LLA.Y)
        
                                Skeleton.LeftLowerArm_LeftHand.From = Vector2.new(LLA.X, LLA.Y)
                                Skeleton.LeftLowerArm_LeftHand.To = Vector2.new(LH.X, LH.Y)
        
                                -- Right Arm
                                Skeleton.UpperTorso_RightUpperArm.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.UpperTorso_RightUpperArm.To = Vector2.new(RUA.X, RUA.Y)
        
                                Skeleton.RightUpperArm_RightLowerArm.From = Vector2.new(RUA.X, RUA.Y)
                                Skeleton.RightUpperArm_RightLowerArm.To = Vector2.new(RLA.X, RLA.Y)
        
                                Skeleton.RightLowerArm_RightHand.From = Vector2.new(RLA.X, RLA.Y)
                                Skeleton.RightLowerArm_RightHand.To = Vector2.new(RH.X, RH.Y)
        
                                -- Left Leg
                                Skeleton.LowerTorso_LeftUpperLeg.From = Vector2.new(LT.X, LT.Y)
                                Skeleton.LowerTorso_LeftUpperLeg.To = Vector2.new(LUL.X, LUL.Y)
        
                                Skeleton.LeftUpperLeg_LeftLowerLeg.From = Vector2.new(LUL.X, LUL.Y)
                                Skeleton.LeftUpperLeg_LeftLowerLeg.To = Vector2.new(LLL.X, LLL.Y)
        
                                Skeleton.LeftLowerLeg_LeftFoot.From = Vector2.new(LLL.X, LLL.Y)
                                Skeleton.LeftLowerLeg_LeftFoot.To = Vector2.new(LF.X, LF.Y)
        
                                -- Right Leg
                                Skeleton.LowerTorso_RightUpperLeg.From = Vector2.new(LT.X, LT.Y)
                                Skeleton.LowerTorso_RightUpperLeg.To = Vector2.new(RUL.X, RUL.Y)
        
                                Skeleton.RightUpperLeg_RightLowerLeg.From = Vector2.new(RUL.X, RUL.Y)
                                Skeleton.RightUpperLeg_RightLowerLeg.To = Vector2.new(RLL.X, RLL.Y)
        
                                Skeleton.RightLowerLeg_RightFoot.From = Vector2.new(RLL.X, RLL.Y)
                                Skeleton.RightLowerLeg_RightFoot.To = Vector2.new(RF.X, RF.Y)
                            end
                        else
                            if Skeleton.Head_Spine.From ~= Vector2.new(head.X, head.Y) then
                                local T_Height = plr.Character.Torso.Size.Y/2 - 0.2
                                local UT = CurrentCamera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, T_Height, 0)).p)
                                local LT = CurrentCamera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, -T_Height, 0)).p)
        
                                local LA_Height = plr.Character["Left Arm"].Size.Y/2 - 0.2
                                local LUA = CurrentCamera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, LA_Height, 0)).p)
                                local LLA = CurrentCamera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, -LA_Height, 0)).p)
        
                                local RA_Height = plr.Character["Right Arm"].Size.Y/2 - 0.2
                                local RUA = CurrentCamera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, RA_Height, 0)).p)
                                local RLA = CurrentCamera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, -RA_Height, 0)).p)
        
                                local LL_Height = plr.Character["Left Leg"].Size.Y/2 - 0.2
                                local LUL = CurrentCamera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, LL_Height, 0)).p)
                                local LLL = CurrentCamera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, -LL_Height, 0)).p)
        
                                local RL_Height = plr.Character["Right Leg"].Size.Y/2 - 0.2
                                local RUL = CurrentCamera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, RL_Height, 0)).p)
                                local RLL = CurrentCamera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, -RL_Height, 0)).p)

                                -- Head
                                Skeleton.Head_Spine.From = Vector2.new(head.X, head.Y)
                                Skeleton.Head_Spine.To = Vector2.new(UT.X, UT.Y)
        
                                --Spine
                                Skeleton.Spine.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.Spine.To = Vector2.new(LT.X, LT.Y)
        
                                --Left Arm
                                Skeleton.LeftArm.From = Vector2.new(LUA.X, LUA.Y)
                                Skeleton.LeftArm.To = Vector2.new(LLA.X, LLA.Y)
        
                                Skeleton.LeftArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.LeftArm_UpperTorso.To = Vector2.new(LUA.X, LUA.Y)
        
                                --Right Arm
                                Skeleton.RightArm.From = Vector2.new(RUA.X, RUA.Y)
                                Skeleton.RightArm.To = Vector2.new(RLA.X, RLA.Y)
        
                                Skeleton.RightArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                                Skeleton.RightArm_UpperTorso.To = Vector2.new(RUA.X, RUA.Y)
        
                                --Left Leg
                                Skeleton.LeftLeg.From = Vector2.new(LUL.X, LUL.Y)
                                Skeleton.LeftLeg.To = Vector2.new(LLL.X, LLL.Y)
        
                                Skeleton.LeftLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                                Skeleton.LeftLeg_LowerTorso.To = Vector2.new(LUL.X, LUL.Y)
        
                                --Right Leg
                                Skeleton.RightLeg.From = Vector2.new(RUL.X, RUL.Y)
                                Skeleton.RightLeg.To = Vector2.new(RLL.X, RLL.Y)
        
                                Skeleton.RightLeg_LowerTorso.From = Vector2.new(    LT.X, LT.Y)
                                Skeleton.RightLeg_LowerTorso.To = Vector2.new(RUL.X, RUL.Y)
                            end
                        end
                    
                    else
                        for i,v in pairs(Skeleton)do 
                            v.Visible = false
                        end
                    end


                    if Library.Box then 

                        libraryesp.box.Visible = true
                        libraryesp.black.Visible = true
                        Size(libraryesp.box)
                        Size(libraryesp.black)
                        libraryesp.box.Color = Library.BoxColor
                        libraryesp.black.Color = Library.BoxColor
                    else
                        libraryesp.box.Visible = false
                        libraryesp.black.Visible = false
                        Size2(libraryesp.box)
                        Size2(libraryesp.black)
                    end
                    
                    -- local p1 = CFrame.new(plr.Character.HumanoidRootPart.Position, CurrentCamera.CFrame.Position) 
                    -- local p2 = p1 * CFrame.new(0,-4,0) * CFrame.new(0,plr.Character.HumanoidRootPart.Size.Y/2,0)
                    -- local p3, p4 = CurrentCamera:WorldToViewportPoint(p2.Position)
              

                    -- if Library.HealthText then 
                    --     libraryesp.healthtext.Visible = true
                    --     libraryesp.healthtext.Text = '[Health : '..tostring(math.round(plr.Character.Humanoid.Health))..'/'..tostring(math.round(plr.Character.Humanoid.MaxHealth))..']'
                    --     libraryesp.healthtext.Color = Library.HealthTextColor
                    --     libraryesp.healthtext.Position = Vector2.new(p3.X, p3.Y)
                    -- else
                    --     libraryesp.healthtext.Visible = false
                    -- end

                    local p1 = CFrame.new(plr.Character.Head.Position, CurrentCamera.CFrame.Position) 
                    local p2 = p1 * CFrame.new(0,1.5,0) * CFrame.new(0,plr.Character.Head.Size.Y/2,0)
                    local p3, p4 = CurrentCamera:WorldToViewportPoint(p2.Position)
                    


                    if Library.Name or Library.Distance then 
                        libraryesp.name.Visible = true
                        libraryesp.name.Color = Library.NameColor
                        libraryesp.name.Position = Vector2.new(p3.X, p3.Y)

                        if Library.Distance and Library.Name and Library.HealthText then 
                            libraryesp.name.Text = plr.Name..' [Hp '..tostring(math.round(plr.Character.Humanoid.Health))..'/'..tostring(math.round(plr.Character.Humanoid.MaxHealth))..']'..'['..tostring(math.round(Studsdistance))..'m'..']'
                            elseif Library.Distance and Library.Name then 
                            libraryesp.name.Text = plr.Name..' ['..tostring(math.round(Studsdistance))..'m'..']'
                            elseif Library.Name and Library.HealthText then 
                            libraryesp.name.Text = plr.Name..' [Hp '..tostring(math.round(plr.Character.Humanoid.Health))..'/'..tostring(math.round(plr.Character.Humanoid.MaxHealth))..']'
                            elseif Library.Distance and Library.HealthText then 
                            libraryesp.name.Text = '[Hp '..tostring(math.round(plr.Character.Humanoid.Health))..'/'..tostring(math.round(plr.Character.Humanoid.MaxHealth))..']'
                            elseif Library.Distance then 
                            libraryesp.name.Text = '['..tostring(math.round(Studsdistance))..' Studs'..']'
                            else
                            libraryesp.name.Text = plr.Name
                        end
                    else
                        libraryesp.name.Visible = false
                    end

                    --//Tracer 
                    if Library.PlayersESP and Library.Tracers then

                        libraryesp.tracer.Color = Library.TracerColor
                        libraryesp.blacktracer.Color = Library.TracerColor
                        libraryesp.tracer.Visible = true
                        libraryesp.blacktracer.Visible = true

                        if Settings.Tracer_Origin == "Middle" then
                            libraryesp.tracer.From = CurrentCamera.ViewportSize*0.5
                            libraryesp.blacktracer.From = CurrentCamera.ViewportSize*0.5
                        elseif Settings.Tracer_Origin == "Bottom" then
                            libraryesp.tracer.From = Vector2.new(CurrentCamera.ViewportSize.X*0.5, CurrentCamera.ViewportSize.Y) 
                            libraryesp.blacktracer.From = Vector2.new(CurrentCamera.ViewportSize.X*0.5, CurrentCamera.ViewportSize.Y)
                        end
                        if Settings.Tracer_FollowMouse then
                            libraryesp.tracer.From = Vector2.new(Mouse.X, Mouse.Y+36)
                            libraryesp.blacktracer.From = Vector2.new(Mouse.X, Mouse.Y+36)
                        end
                            libraryesp.tracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                            libraryesp.blacktracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                        else 
                        libraryesp.tracer.Visible = false
                        libraryesp.blacktracer.Visible = false
                    end




                    --// Health Bar
                    local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)).magnitude 
                    local healthoffset = plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth * d
                    if Library.PlayersESP and Library.HealthBar then
                        libraryesp.greenhealth.Visible = true
                        libraryesp.healthbar.Visible = true

                        libraryesp.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                        libraryesp.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2 - healthoffset)

                        libraryesp.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                        libraryesp.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY*2)
                    else
                        libraryesp.greenhealth.Visible = false
                        libraryesp.healthbar.Visible = false
                    end
                    local green = Color3.fromRGB(0, 255, 0)
                    local red = Color3.fromRGB(255, 0, 0)

                    libraryesp.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth);

                    -- if Team_Check.TeamCheck then
                    --     if plr.TeamColor == player.TeamColor then
                    --        Colorize(Team_Check.Green)
                    --     else 
                    --         Colorize(Team_Check.Red)
                    --     end
                    -- else 
                    --     libraryesp.tracer.Color = Settings.Tracer_Color
                    --     libraryesp.box.Color = Settings.Box_Color
                    -- end
                    -- if TeamColor == true then
                    --    Colorize(plr.TeamColor.Color)
                    -- end
                    -- Library:Visibility(true, libraryesp)
                    -- Library:Visibility(true, Skeleton)
                    else 
                        Library:Visibility(false, libraryesp)
                        Library:Visibility(false, Skeleton)
                    end
                else 
                Library:Visibility(false, libraryesp)
                    if game.Players:FindFirstChild(plr.Name) == nil or not game.Players:FindFirstChild(plr.Name).Character
                    or not game.Players:FindFirstChild(plr.Name).Character:FindFirstChild('Humanoid') or game.Players:FindFirstChild(plr.Name).Character:FindFirstChild('Humanoid').Health <= 0 then
                        Library:DestroyESP(libraryesp)
                        Library:DestroyESP(Skeleton)
                        connection:Disconnect()
                        --warn('Disconnect')
                            end
                        end
                    end)
                end)
            end)
        end
    coroutine.wrap(Updater)()
    end)
end



function Library:SetTracerColor(Color) pcall(function()
        Library.TracerColor = Color
    end)
end
function Library:SetBoxColor(Color) pcall(function()
        Library.BoxColor = Color
    end)
end
function Library:SetNameColor(Color) 
    pcall(function()
        Library.NameColor = Color
    end)
end
function Library:SetHealthTextColor(Color) 
    pcall(function()
        Library.HealthTextColor = Color
    end)
end
function Library:SetSkeletonColor(Color)
    pcall(function()
        Library.SkeletonColor = Color
    end)
end
function Library:ToggleESP(Bool)
    pcall(function()
        Library.PlayersESP = Bool
    end)
end
function Library:Settings(Value,Bool)
    Library[Value] = Bool 
end
function Library:LimitDistance(Value)
    pcall(function()
        Library.LimitDistanceValue = Value
    end)
end

for i, v in pairs(Players:GetPlayers()) do
    if v.Name ~= LocalPlayer.Name then
        coroutine.wrap(MAINESP)(v)
    end
end

Players.PlayerAdded:Connect(function(newplr)
    pcall(function()
    local Character = newplr.Character or newplr.CharacterAdded:Wait()
    newplr.Character:WaitForChild('Humanoid')
    newplr.Character:WaitForChild('HumanoidRootPart')
        if newplr.Name ~= LocalPlayer.Name then
            coroutine.wrap(MAINESP)(newplr)
        end
    end)
end)


-- function Library:DestroyESP(Group)
--     if not InstanceData[Group] or not Group then 
--         return
--     end
--     if InstanceData[Group]['Item'] then 
--         for i,v in pairs(InstanceData[Group]['Item'])do 
--             v:Remove()
--         end
--     end
-- end




function Library:CreateBillBoard(Int,Name,Color)
    local BillboardGui = Instance.new("BillboardGui")
    pcall(function()
        local TextLabel = Instance.new("TextLabel")
       -- local UIStoke = Instance.new("UIStroke")
        --UIStoke.Thickness = 2
       -- UIStoke.Parent = TextLabel
        TextLabel.Parent = BillboardGui
        TextLabel.TextSize = 8
        TextLabel.Text = Name
        TextLabel.TextColor3 = Color
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, 0,1, 0)
        TextLabel.TextColor3 = Color
        BillboardGui.Size = UDim2.new(1, 500,1, 200)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Parent = Int
        BillboardGui.Enabled = false
    end)
    return BillboardGui;
end

function Library:VisibilityBillBoard(state, lib)
    for u, x in pairs(lib) do
        v.Enabled = state
    end
end





function Library:AddInstance(Instance,Group,Name)
    pcall(function()
    if not Group or not Instance:IsA('BasePart') then 
        return 
    end
    if Instance then 
        --local IndexRandom = math.random(1,99999999)

        if not InstanceData[Group] then 
            InstanceData[Group] = {}
            InstanceData[Group].Enabled = false
            InstanceData[Group].ShowDistance = false
            InstanceData[Group].LimitDistance = math.huge
            InstanceData[Group].Color = Color3.fromRGB(255,255,255)
        end

        if InstanceData[Group] and InstanceData[Group]['Item'] then 
            if InstanceData[Group]['Item'][Instance] then 
                return
            end
        end

        if InstanceData[Group] then 
            if not InstanceData[Group]['Item'] then 
                InstanceData[Group]['Item'] = {}
            end
            if Name then 
                    InstanceData[Group]['Name'] = Name
                    InstanceData[Group]['Item'][Instance] = Library:CreateBillBoard(Instance,Name,Color3.fromRGB(255,255,255))
                else
                InstanceData[Group]['Name'] = Instance.Name
                InstanceData[Group]['Item'][Instance] =Library:CreateBillBoard(Instance,Instance.Name,Color3.fromRGB(255,255,255))
               -- warn(Group..' : '..Instance.Name)
            end
        end
    end
end)
end

local connection = game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
    if  LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
        for i,v in pairs(InstanceData)do 
            if v['Item'] then 
                for x,y in pairs(v['Item'])do
                    if x and x.Parent and y then 
                        local InsPos, OnScreen = CurrentCamera:WorldToViewportPoint(x.Position)
                        local distance = (x.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                        if OnScreen then
                            if v.LimitDistance then 
                                if distance > v.LimitDistance or not v.Enabled then 
                                        Library:VisibilityBillBoard(false, v['Item'])
                                    return
                                end
                            end
                            if v.Enabled then 
                                y.Enabled = true
                                y.TextLabel.TextColor3 = v.Color
                                if v.ShowDistance then 
                                    y.TextLabel.Text = y.TextLabel.Text..' ['..tostring(math.round(distance))..'m'..']'
                                    else
                                    y.TextLabel.Text = y.TextLabel.Text
                                 end
                                 else
                                y.Enabled = false
                            end
                        else
                            y.Enabled = false
                        end
                    else
                        if not x or not x.Parent then   
                                y:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end)
end)


function Library:ToggleInstanceESP(Value,Group)
    pcall(function()
        InstanceData[Group].Enabled = Value
    end)
end

function Library:ShowDistanceInstance(Value,Group)
    pcall(function()
        InstanceData[Group].ShowDistance = Value
    end)
end

function Library:LimitDistanceInstance(Value,Group)
    pcall(function()
        InstanceData[Group].LimitDistance = Value
    end)
end

function Library:SetColorInstance(Value,Group)
    pcall(function()
        InstanceData[Group].Color = Value
    end)
end


return Library;



