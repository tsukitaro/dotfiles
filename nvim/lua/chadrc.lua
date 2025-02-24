-- -@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "highlights"

M.ui = {
  theme = "solarized_osaka",
  theme_toggle = { "solarized_osaka", "one_light" },
  -- transparency = true,
  statusline = {
    -- theme = ""
  },

  -- hl_override = highlights.override,
  -- hl_add = highlights.add,
  hl_override = {
    Comment = { italic = true },
    ["@Comment"] = { italic = true },
  },

  -- telescope = { style = "borderless" },
  telescope = { style = "bordered" },
  cheatsheet = { theme = "grid" },

  -- hl_add = {
  -- }
}

M.base46 = {
  integrations = {
    "nvimtree",
    "statusline",
    "git",
  },
  hl_override = {
    vim.api.nvim_set_hl(0, "@keyboard", { link = "keyboard" })
  }
}


-- M.base46 = {
--   integrations = {
--     "nvimtree",
--     "statusline",
--   }
-- }
--
-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

  return M
