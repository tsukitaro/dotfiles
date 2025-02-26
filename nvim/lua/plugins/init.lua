local overrides = require "configs.overrides"
-- local ts-tools = require "configs.typescript-tools"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   ft = {"javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  --   opts = function ()
  --     return require("configs.c_typescript-tools")
  --   end,
  --   config = function (_, opts)
  --     require("typescript-tools").setup(opts)
  --   end,
  --   -- opts = ts-tools,
  --   -- config = function()
  --   --   require("configs.typescript-tools")
  --   --
  --   -- end,
  --   --   require("typescript-tools").setup {
  --   -- --
  --   -- --     on_attach = require "nvchad.configs.lspconfig".on_attach,
  --   -- --     -- filetypes = {
  --   -- --     --
  --   -- --     --   "javascript",
  --   -- --     --   "typescript",
  --   -- --     --   "vue",
  --   -- --     -- },
  --   -- --     settings = {
  --   -- --       single_file_support = false,
  --   -- --       tsserver_plugins = {
  --   -- --         "@vue/typescript-plugin",
  --   -- --       },
  --   -- --     },
  --   -- --   }
  --   -- end,
  -- },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  -- }
}
