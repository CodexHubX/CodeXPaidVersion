getgenv().Configuration = {
        ['Enabled'] = true,
        ['Enabled Challenge'] = false,
        ['Summon The Beast'] = false,
        ['PC Name'] = '28/56 - 1',
        ['Delay'] = 0,
        ['Leave Delay'] = 0,
        ['EquipBest'] = true,
        ['Leave At Wave'] = 31,
        ['Leave Method'] = 1, -- 1 = Sell,  2 = Leave
        ['TradingMode'] = true,
        ['License'] = 'JameFarmOnTop',
  };
spawn(function() while task.wait(1) do pcall(function() game:GetService('RunService'):Set3dRenderingEnabled(true) end) end end)
