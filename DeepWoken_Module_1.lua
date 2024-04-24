
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


return Settigs;
