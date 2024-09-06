game:GetService('RunService'):Set3dRenderingEnabled(false)

--local AutoRejoinThread = task.spawn(function()
--    repeat 
--        task.wait() 
--    until game:IsLoaded();
--   task.wait(120);
--    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild('Anime Defenders') then 
--        game:GetService('TeleportService'):Teleport(17017769292);
--     end;
--end);

getgenv().Configuration = {
        ['Enabled'] = true,
        ['Enabled Challenge'] = false,
        ['Summon The Beast'] = false,
        ['PC Name'] = 'I7 [1]',
        ['Delay'] = 0,
        ['Leave Delay'] = 0,
        ['EquipBest'] = true,
        ['Leave At Wave'] = 31,
        ['Leave Method'] = 2, -- 1 = Sell,  2 = Leave
        ['TradingMode'] = true,
        ['Main User'] = 'HareFroglet',
        ['License'] = 'JameFarmOnTop',
        ['Roll Mythic'] = true,
        ['Roll Method'] = 2,
        ['Auto Feed Mythic'] = true,
        ['Reroll Farm Pro Max'] = true,
         ['Roll Ticket'] = false,
         ['Use Auto Sell'] = false,
         ['Sell Config'] = {
             ['Rare'] = true,
             ['Epic'] = true,
             ['Legendary'] = true,
             ['Rare Shiny'] = true,
             ['Epic Shiny'] = true,
             ['Legendary Shiny'] = true,
         },
         ['Placement Distance'] = 25,
  };

spawn(function() while task.wait(1) do pcall(function() game:GetService('RunService'):Set3dRenderingEnabled(true) end) end end)
