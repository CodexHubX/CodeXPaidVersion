getgenv().Configuration = {
        ['Enabled'] = true,
        ['Enabled Challenge'] = false,
        ['Summon The Beast'] = false,
        ['PC Name'] = 'V4 [2]',
        ['Delay'] = 0,
        ['Leave Delay'] = 0,
        ['EquipBest'] = true,
        ['Leave At Wave'] = 31,
        ['Leave Method'] = 1, -- 1 = Sell,  2 = Leave
        ['TradingMode'] = true,
        ['License'] = 'JameFarmOnTop',
  };
spawn(function()
    while true do task.wait(1) 
        pcall(function()
            game:GetService('RunService'):Set3dRenderingEnabled(true)
        end)
    end;
end)
