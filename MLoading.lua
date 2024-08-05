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
