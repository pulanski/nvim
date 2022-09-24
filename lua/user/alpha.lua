local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local icons = require "user.icons"

local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok then
    return
end
-- 
--               R RRRRRRRR R          R   
--  R RR       R RRRRRRRRRRRRR R      RR   
-- rR RRR    R RRRRRRRRRRRRRRRRR R   RRR R 
-- n)
-- RRR RR   RRRRRRRRRRRRRRRRRRRRRRR  RRRRR 
--  RRRRR  RRRRRRRRRRRRRRRRRRRRRRRR  RRRR  
--   RRR RRRRRRRRRRRRRRRRRRRRRRRRRRRR RR   
--     R  RRRRRRRRRR=  RR = RRRRRRRRRRR    
--      RRRRRRRRRRRR=  RR = RRRRRRRRRR     
--       RRRRRRRRRRR   RR   RRRRRRRRRR     
--      RR==RRRRRRRRRRRRRRRRRRRRRR===RR    
--      RR =  ==RRRRRRR  RRRRRR==  = RR    
--       RR =     ===========     = RR     
--        RR                        R      
--         R                       R       
--          R                              



dashboard.section.header.val = {
    -- [[                             ..]],
    -- [[                          .:+:-.]],
    -- [[                        ..::*=:..]],
    -- [[                     ....::####:...]],
    -- [[                  ...-=::\-\-*##=-::::=.]],
    -- [[                ....::##############=.]],
    -- [[          ........::#@#############@:.]],
    -- [[        ..:%::=::::-#################%]],
    -- [[      ....::*#####=##################+]],
    -- [[  ......:==%#########################.]],


    [[:::#:===+##########################-:.]],
    [[   .....:--%#########################:]],
    [[       ...::*#####-##################+]],
    [[         .:=::-::::=#################@]],
    [[          .........:#+#############+:.]],
    [[                ....::############%@+.]],
    [[                   ..:-:::-###=:::..:.]],
    [[                     ....::###%:...]],
    [[                        ...:-=:..]],
    [[                          .:%::.]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button(
    --   "p",
    --   icons.git.Repo .. " Find project",
    --   ":lua require('telescope').extensions.projects.projects()<CR>"
    -- ),
    dashboard.button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", icons.ui.List .. " Live Grep", ":Telescope live_grep <CR>"),
    -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
    dashboard.button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("u", icons.ui.CloudDownload .. " Update", ":PackerSync<CR>"),
    dashboard.button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}
local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    return "pulanski"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
