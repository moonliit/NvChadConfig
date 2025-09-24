-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "nonbinary-dark",

  hl_override = {
    Pmenu = { bg = "black2" },
    -- Pmenu = { bg = "#ffffff" }, this works too
        
    -- lighten or darken base46 theme variable
    -- this will use the black color from base46.theme & lighten it by 2x
    -- negative number will darken it
    Normal = {
      bg = { "black", 2 }
    },

    -- mix colors, mixes black/blue from your theme by 10%
    PmenuSel = {
      bg = { "black", "blue", 10 }
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
