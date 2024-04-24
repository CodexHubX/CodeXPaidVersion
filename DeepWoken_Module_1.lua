local LocalPlayer = game.Players.LocalPlayer;
local RunService = game:GetService('RunService');
local Connection;
local rate = 0;

local Settigs = {
    _nofall = false,
    _noacid = false,
}

local _mt;
_mt = hookmetamethod(game,'__namecall',function(self,...)
    local args = {...}
    local method = getnamecallmethod();
    if (method == 'FireServer' and type(args[1]) == 'number' and args[2] == false and not checkcaller() and Settigs._nofall) then 
        return;
    elseif (method == 'FireServer' and self.Name == 'AcidCheck' and not checkcaller() and Settigs._noacid) then 
        return;
    end;
    return _mt(self,...)
end)

function Rander()
    local Sucessfully,Error = pcall(function()
        if (not LocalPlayer or not LocalPlayer.Character) then return end;
        for _,v in next, LocalPlayer.Character:GetChildren() do 
            if (v:IsA('BasePart')) then 
                warn(v)
                v.CanCollide = false;
            end;
        end;
    end)

    if (not Sucessfully) then 
        warn('Error:NRander',Error)
    end;
end;


function Settigs:Noclip(Stage)
    local Sucessfully,Error = pcall(function()
        if (not Stage) then 
            if (Connection) then 
                Connection:Disconnect();
                Connection = nil;
            end;
            if (not LocalPlayer and or LocalPlayer.Character) then return end;
            for _,v in next, LocalPlayer.Character:GetChildren() do 
                if (v:IsA('BasePart')) then 
                    v.CanCollide = true;
                end;
            end;
            return;
        end;

        Connection = RunService.Heartbeat:Connect(function(Rate)
            Rander(Rate);
        end);
    end)
end;

return Settigs;

