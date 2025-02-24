local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    --    opts = {
    --      ensure_installed = {
    --        "lua-language-server",
    --       "stylua",
    --      "html-lsp",
    --     "css-lsp",
    --    "prettier",
    --   "typescript-language-server",
    --},
    --},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    -- config = function()
    --   require "configs.overrides"
    -- end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  --
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --    dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --     },
  --   },
  --   -- opts = function ()
  --   --   require("nvchad.configs.cmp")
  --   --   require("configs.nvim-cmp")
  --   -- end
  --   opts = {
  --     sources = {
  --       { name = "nvim_lsp", group_index = 2 },
  --       { name = "copilot", group_index = 2 },
  --       { name = "luasnip", group_index = 2 },
  --       { name = "buffer", group_index = 2 },
  --
  --       { name = "nvim_lua", group_index = 2 },
  --
  --       { name = "path", group_index = 2 },
  --     },
  --   },
  -- },

  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- my personal plugins
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "htnsueoaidgcrlypmbkjvx",
      uppercase_labels = true,
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    -- keys = {
    --   { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    --   { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    --   { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    --   { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    --  },
  },
  {
    "simaxme/java.nvim",
    config = function()
      require("java.nvim").setup {
        rename = {
          enable = true, -- enable the functionality for renaming java files
          nvimtree = true, -- enable nvimtree integration
          write_and_close = false, -- automatically write and close modified (previously unopened) files after refactoring a java file
        },
        snippets = {
          enable = true, -- enable the functionality for java snippets
        },
        root_markers = { -- markers for detecting the package path (the package path should start *after* the marker)
          "main/java/",
          "test/java/",
        },
      }
    end,
  },
  {
    "godlygeek/tabular",
    cmd = { "Tabularize" },
  },
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.dp_echo_preview_url = 1
      vim.g.mkdp_browser = "/usr/local/bin/firefox-dev"
    end,
    config = function()
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_echo_preview_url = 1
    end,
    ft = { "markdown" },
  },
  -- markdown footnotes
  {
    "vim-pandoc/vim-markdownfootnotes",
  },

  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   opts = {
  --     	RGB      = true;         -- #RGB hex codes
  --       RRGGBB   = true;         -- #RRGGBB hex codes
  --       names    = true;         -- "Name" codes like Blue
  --       css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --       css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --       -- Available modes: foreground, background
  --       mode     = 'background'; -- Set the display mode.
  --   }
  --
  -- }

  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  -- Aqui van los plugins que instale
  --
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- nvim dap
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      config = function()
        require("mason-nvim-dap").setup { ensure_installed = { "firefox", "node2" } }
      end,
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "anuvyklack/hydra.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/cmp-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<leader>d", desc = "Open Debug menu" },
    },
    cmd = {
      "DapContinue",
      "DapLoadLaunchJSON",
      "DapRestartFrame",
      "DapSetLogLevel",
      "DapShowLog",
      "DapStepInto",
      "DapStepOut",
      "DapStepOver",
      "DapTerminate",
      "DapToggleBreakpoint",
      "DapToggleRepl",
    },
    config = function()
      require "configs.dap"
      local ok_telescope, telescope = pcall(require, "telescope")
      if ok_telescope then
        telescope.load_extension "dap"
      end

      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
          sources = cmp.config.sources({
            { name = "dap" },
          }, {
            { name = "buffer" },
          }),
        })
      end
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  --mason
  -- {
  --   "williamboman/mason.nvim",
  --   cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  --   opts = function()
  --     return require "configs.overrides"
  --   end,
  --   config = function(_, opts)
  --     dofile(vim.g.base46_cache .. "mason")
  --     require("mason").setup(opts)
  --
  --     -- custom nvchad cmd to install all mason binaries listed
  --     vim.api.nvim_create_user_command("MasonInstallAll", function()
  --       if opts.ensure_installed and #opts.ensure_installed > 0 then
  --         vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
  --       end
  --     end, {})
  --
  --     vim.g.mason_binaries_list = opts.ensure_installed
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end, -- Override to set up mason-lspconfig
  -- },

  -- {
  --     "jay-babu/mason-nvim-dap.nvim",
  --     lazy = true,
  --     config = function ()
  --       require "configs.masonnvimdap"
  --     end
  --   },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- ## personal installation a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "configs.better_escape"
      -- require("better_escape").setup {
      --   mappings = { "jk", "jj" },
      --   timeout = vim.o.timeoutlen,
      --   clear_empty_lines = false,
      --   keys = function()
      --     -- code
      --     return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
      --   end,
      -- }
    end,
  },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.diagnostics.trouble" },
    { import = "nvcommunity.tools.telescope-fzf-native" },
  },
  { "echasnovski/mini.icons", version = false },
  -- {
  --   "github/copilot.vim"
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = false,
  --   event = "InsertEnter",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     suggestion = { enabled = false },
  --     panel = { enabled = false },
  --     -- panel = {
  --     -- auto_refresh = true,
  --     --
  --     -- layout = {
  --     --   position = "right",
  --     --   ratio = 0.3,
  --     -- },
  --     -- },
  --     filetypes = {
  --       markdown = true,
  --       help = true,
  --       java = true,
  --       javascript = true,
  --       tyescript = true,
  --       lua = true,
  --     },
  --   },
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  --
  -- {
  --   "stevearc/conform.nvim",
  --   --  for users those who want auto-save conform + lazyloading!
  --   -- event = "BufWritePre"
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  --
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function ()
  --     require "configs.lint"
  --   end
  -- }
  -- Override plugin definition options
  --
  -- {
  --     "rcarriga/nvim-dap-ui",
  --    event ="VeryLazy",
  --    dependencies = "mfussenegger/nvim-dap",
  --    config = function()
  --      local dap = require("dap")
  --      local dapui = require("dapui")
  --      require("dapui").setup()
  --      dap.listeners.after.event_initialized["dapui_config"] = function ()
  --        dapui.open()
  --      end
  --      dap.listeners.before.event_terminated["dapui_config"]  = function ()
  --        dapui.close()
  --      end
  --      dap.listeners.before.event_exited["dapui_config"] = function ()
  --        dapui.close()
  --      end
  --    end
  --  },
  --  {
  --
  --    "mfussenegger/nvim-dap",
  --    config = function ()
  --      require "configs.dap"
  --      require("core.utils").load_mappings("dap")
  --    end
  --  },

  -- {
  --   "folke/neodev.nvim",
  --   config = function ()
  --     require "configs.neodev"
  --   end,
  -- },
  -- override plugin configs
  -- {
  --   "williamboman/mason.nvim",
  --   opts = overrides.mason
  -- },
}
