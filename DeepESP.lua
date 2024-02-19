




































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




function Library:CreateBillBoard(Int,Name,Color,IsCharacter)
    local BillboardGui = Instance.new("BillboardGui")
    pcall(function()
        local TextLabel = Instance.new("TextLabel")
        if IsCharacter then 
            local value = Instance.new("IntValue")
            value.Name = 'IsCharacter'
            value.Parent = BillboardGui
        end
        local TextLabel2 = Instance.new("TextLabel")
        TextLabel2.Name = 'Key'
        TextLabel2.Parent = BillboardGui 
        TextLabel2.Text = Name
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
        x.Enabled = state
    end
end





function Library:AddInstance(Instance,Group,Name,IsCharacter)
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
            InstanceData[Group].ShowHealth = false
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

                    if IsCharacter then 
                        InstanceData[Group]['Name'] = Name
                        InstanceData[Group]['Item'][Instance] = Library:CreateBillBoard(Instance,Name,Color3.fromRGB(255,255,255),true)
                        return
                    end
                    InstanceData[Group]['Name'] = Name
                    InstanceData[Group]['Item'][Instance] = Library:CreateBillBoard(Instance,Name,Color3.fromRGB(255,255,255))
                else

                    if IsCharacter then 
                        InstanceData[Group]['Name'] = Instance.Name
                        InstanceData[Group]['Item'][Instance] =Library:CreateBillBoard(Instance,Instance.Name,Color3.fromRGB(255,255,255),true)
                        return
                    end

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
                                if distance > v.LimitDistance then 
                                        Library:VisibilityBillBoard(false, v['Item'])
                                         y.Enabled = false 
                                    return
                                end
                            end

                            if v.Enabled then 
                                y.Enabled = true
                                y.TextLabel.TextColor3 = v.Color
                                
                                if y:FindFirstChild('IsCharacter') then 

                                    if v.ShowHealth and v.ShowDistance  then
                                        y.TextLabel.Text = '[Player]\n'..y['Key'].Text..'\n'..tostring(math.round(distance))..' studs\nHealth: '..tostring(math.round(x.Parent.Humanoid.Health))..'/'..tostring(math.round(x.Parent.Humanoid.MaxHealth))
                                        elseif v.ShowHealth then 
                                        y.TextLabel.Text = '[Player]\n'..y['Key'].Text..'\nHealth: '..tostring(math.round(x.Parent.Humanoid.Health))..'/'..tostring(math.round(x.Parent.Humanoid.MaxHealth))
                                        elseif v.ShowDistance then 
                                        y.TextLabel.Text = '[Player]\n'..y['Key'].Text..'\n'..tostring(math.round(distance))..' studs'
                                        else
                                        y.TextLabel.Text = '[Player]\n'..y['Key'].Text
                                    end

                                    
                                    
                                    else
                                        if v.ShowDistance then  
                                            y.TextLabel.Text = y['Key'].Text..' ['..tostring(math.round(distance))..' studs]'
                                            else
                                            y.TextLabel.Text = y['Key'].Text
                                        end

                                    

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

function Library:ShowHealthInstance(Value,Group)
    pcall(function()
        InstanceData[Group].ShowHealth = Value
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
