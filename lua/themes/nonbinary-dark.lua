-- lua/custom/themes/nonbinary-dark.lua
-- Base46-compatible theme augmented with Base16 semantics mapping.
---@type Base46Table
local M = {}

-- canonical base_30 keys (your palette)
M.base_30 = {
  white            = "#ebebeb",
  black            = "#2f1f31", -- base background
  darker_black     = "#15151a", -- tree background
  black2           = "#352433", -- statusbar bg color
  one_bg           = "#2f1f31", -- highlight in tree
  one_bg2          = "#352433", -- statusbar bg color ?
  one_bg3          = "#3a2738", -- tree file colors
  grey             = "#6e6e76",
  grey_fg          = "#15f371", -- maps to @comment by default
  grey_fg2         = "#7aaeb0",
  light_grey       = "#9fd6d8",
  line             = "#262629", -- separators / indent guides
  selection        = "#2f4f73",
  selection_strong = "#355b87",
  comment          = "#15f371",
  nvim_tree_bg     = "#19161b",
  red              = "#ff6b6b",
  baby_pink        = "#c97fcf", -- numbers
  pink             = "#b25db0", -- keywords
  line_bg          = "#1b1620",
  green            = "#33caa0", -- types / operators 
  vibrant_green    = "#4ea1e6", -- constants / info (bluish)
  blue             = "#4ea1e6", 
  nord_blue        = "#3fe2d4", -- namespace / teal
  yellow           = "#f0bf00", -- functions
  sun              = "#e07a4a", -- strings / orange
  purple           = "#8a4bbf", -- statusline
  dark_purple      = "#6b3b9a",
  teal             = "#3fe2d4",
  orange           = "#e07a4a",
  cyan             = "#3fe2d4", 
  statusline_bg    = "#8a4bbf",
  lightbg          = "#352433",
  pmenu_bg         = "#19161b",
  folder_bg        = "#9fd6d8", --"#3a2738",
}

-- base_16 mapping that follows the semantic table you pasted.
-- Each base0X is mapped to a color from base_30 that matches meaning.
M.base_16 = {
  -- base00 - Default Background
  base00 = M.base_30.black,
  -- base01 - Lighter Background (status bars, linenr, fold)
  base01 = M.base_30.one_bg2,
  -- base02 - Selection Background
  base02 = M.base_30.selection,
  -- base03 - Comments, Invisibles, Line Highlighting
  base03 = M.base_30.comment,
  -- base04 - Dark Foreground (status bars)
  base04 = M.base_30.grey,
  -- base05 - Default Foreground, Caret, Delimiters, Operators
  base05 = M.base_30.light_grey,
  -- base06 - Light Foreground (Not often used)
  base06 = "#cfeff1",
  -- base07 - Light Background (Not often used)
  base07 = "#ffffff",
  -- base08 - Variables, XML Tags, Lists, Diff Deleted (use var color)
  base08 = M.base_30.light_grey,
  -- base09 - Integers, Boolean, Constants, XML Attributes (numbers/const)
  base09 = M.base_30.baby_pink,
  -- base0A - Classes, Markup Bold, Search (classes/types)
  base0A = M.base_30.green,
  -- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
  base0B = M.base_30.sun,
  -- base0C - Support, Regex, Escape Characters
  base0C = M.base_30.teal,
  -- base0D - Functions, Methods, Headings
  base0D = M.base_30.yellow,
  -- base0E - Keywords, Storage, Selector, Markup Italic
  base0E = M.base_30.pink,
  -- base0F - Deprecated, Embedded tags
  base0F = M.base_30.baby_pink,
}

M.type = "dark"

-- polish_hl: tree-sitter and simple group overrides
M.polish_hl = {
  defaults = {
    Comment = { fg = M.base_30.comment, italic = true },
    CursorLineNr = { fg = M.base_30.white },
    -- Make normal text visible
    Normal = { fg = M.base_30.light_grey, bg = M.base_30.black },
  },

  treesitter = {
    -- Common TS groups -> pick colors aligned with Base16 semantics:
    ["@comment"]           = { fg = M.base_30.comment, italic = true }, -- base03
    ["@string"]            = { fg = M.base_30.sun },                   -- base0B
    ["@string.regex"]      = { fg = M.base_30.sun },
    ["@number"]            = { fg = M.base_30.baby_pink },             -- base09
    ["@boolean"]           = { fg = M.base_30.vibrant_green },         -- base09/const
    ["@constant"]          = { fg = M.base_30.vibrant_green },         -- base09
    ["@constant.builtin"]  = { fg = M.base_30.vibrant_green },
    ["@identifier"]        = { fg = M.base_30.light_grey },            -- base05
    ["@function"]          = { fg = M.base_30.yellow },               -- base0D
    ["@function.call"]     = { fg = M.base_30.yellow },
    ["@method"]            = { fg = M.base_30.yellow },
    ["@constructor"]       = { fg = M.base_30.cyan }, -- todo: why is mpi this
    ["@keyword"]           = { fg = M.base_30.pink },                 -- base0E
    ["@conditional"]       = { fg = M.base_30.pink },
    ["@keyword.repeat"]    = { fg = M.base_30.pink },
    ["@repeat"]            = { fg = M.base_30.pink },
    ["@type"]              = { fg = M.base_30.green },                -- base0A
    ["@type.builtin"]      = { fg = M.base_30.blue },
    ["@namespace"]         = { fg = M.base_30.nord_blue },            -- base0C / teal-like
    ["@module"]            = { fg = M.base_30.green },
    ["@parameter"]         = { fg = M.base_30.light_grey },
    ["@property"]          = { fg = M.base_30.light_grey },
    ["@field"]             = { fg = M.base_30.light_grey },
    ["@tag"]               = { fg = M.base_30.pink },
    ["@operator"]          = { fg = M.base_30.green },

    -- Extra / C++ style token groups you mentioned
    ["@keyword.storage"]   = { fg = M.base_30.pink },
    ["@keyword.type.cpp"]  = { fg = M.base_30.blue },
    ["@macro"]             = { fg = M.base_30.vibrant_green },
    ["@symbol"]            = { fg = M.base_30.vibrant_green },
    ["@enum"]              = { fg = M.base_30.vibrant_green },
    ["@enum.member"]       = { fg = M.base_30.vibrant_green },
    ["@enum.variant"]      = { fg = M.base_30.vibrant_green },

    -- Defensive: some grammars produce lowercase names or other variants
    ["Include"]            = { fg = M.base_30.pink },
    ["token"]              = { fg = M.base_30.vibrant_green }, -- fallback
  },
}

-- polish: API-level adjustments (undercurl, signs, UI tweaks)
M.polish = function()
  local hl = vim.api.nvim_set_hl
  local c = M.base_30

  -- UI tweaks
  hl(0, "CursorLine", { bg = c.black2 })
  hl(0, "SignColumn", { bg = c.black })
  hl(0, "StatusLine", { bg = c.statusline_bg, fg = c.white })
  hl(0, "Pmenu", { bg = c.pmenu_bg, fg = c.light_grey })
  hl(0, "PmenuSel", { bg = c.selection_strong, fg = c.white })
  hl(0, "TabLine", { bg = c.line_bg, fg = c.grey_fg2 })
  hl(0, "TabLineSel", { bg = c.statusline_bg, fg = c.white })

  -- diagnostics: undercurl coloring
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
  hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.sun })
  hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
  hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.nord_blue })

  -- diagnostic signs in gutter
  hl(0, "DiagnosticSignError", { fg = c.red })
  hl(0, "DiagnosticSignWarn",  { fg = c.sun })
  hl(0, "DiagnosticSignInfo",  { fg = c.blue })
  hl(0, "DiagnosticSignHint",  { fg = c.nord_blue })

  -- gitsigns (also handle lines & numbers)
  hl(0, "GitSignsAdd",    { fg = c.vibrant_green })
  hl(0, "GitSignsChange", { fg = c.green })
  hl(0, "GitSignsDelete", { fg = c.red })
  hl(0, "GitSignsAddNr",    { fg = c.vibrant_green })
  hl(0, "GitSignsChangeNr", { fg = c.green })
  hl(0, "GitSignsDeleteNr", { fg = c.red })

  -- fallback links for anything else
  vim.cmd("hi link @variable Identifier")
  vim.cmd("hi link @function Function")
  vim.cmd("hi link @keyword Keyword")
  vim.cmd("hi link @string String")
  vim.cmd("hi link @number Number")
  vim.cmd("hi link @comment Comment")
  vim.cmd("hi link @type Type")

  -- Defensive fallback: link a raw "Token" group to Constant in case some highlighter emits that
  pcall(vim.api.nvim_set_hl, 0, "Token", { fg = c.vibrant_green })
  pcall(vim.cmd, "hi link token Constant")
end

-- finalize theme via base46 helper (allows user overrides)
M = require("base46").override_theme(M, "nonbinary-dark")

return M

