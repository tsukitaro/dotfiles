-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "solarized_osaka",
  integrations = { 'dap', 'hop', 'lsp', 'mason', 'telescope', 'notify'}

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  cmp = {
       lspkind_text = true,
       style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
       format_colors = {
         tailwind = false,
       },
     },
  telescope = { style = "borderless" },
  statusline = {
    theme = "default",
    separator_style = "arrow",
  }
--       tabufline = {
--          lazyload = false
--      }
}

M.lsp = {
  signature = true
}

M.colorify = {
  enabled = true,
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
