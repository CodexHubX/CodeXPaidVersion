game:GetService('RunService'):Set3dRenderingEnabled(false)

local AutoRejoinThread = task.spawn(function()
   repeat 
        task.wait() 
    until game:IsLoaded();
    task.wait(120);
    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild('Anime Defenders') then 
        game:GetService('TeleportService'):Teleport(17017769292);
   end;
end);
getgenv().Configuration = {
        ['Enabled'] = true,
        ['Enabled Challenge'] = false,
        ['Summon The Beast'] = false,
        ['PC Name'] = 'V4 [1]',
        ['Delay'] = 0,
        ['Leave Delay'] = 0,
        ['EquipBest'] = true,
        ['Leave At Wave'] = 31,
        ['Leave Method'] = 2, -- 1 = Sell,  2 = Leave
        ['TradingMode'] = false,
        ['Main User'] = '',
        ['License'] = 'JameFarmOnTop',
  };
