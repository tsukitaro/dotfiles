local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"



local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- html = {},
  jsonls = {},
  markdown_oxide = {},
  -- emmet_ls = {},
  bashls = {},
  -- volar = {
    -- filetypes = {
    --   "vue",
    --   "html",
    -- },
  -- },
  ts_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  -- jdtls = {},
  gradle_ls = {},
}

-- Setup mason so it can manage external toolingtsserver
require("mason").setup()

-- -- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

-- mason_lspconfig.setup({
--  ensure_installed = vim.tbl_keys(servers),
-- })

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  -- if not excl_servers[server_name] then
  if server_name ~= "jdtls" then
    local config = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
    lspconfig[server_name].setup(config)
  end
  if server_name == "jdtls" then
    vim.notify("jdtls encountered!", vim.log.levels.INFO)
  end
end








-- local bundles = {
--     vim.fn.glob('~/GitClones/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar'),
-- }
-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd"}

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- lspconfig.jdtls.setup {
--
--   init_options = {
--     bundles = bundles
--   },
-- }
--
-- lspconfig.tsserver.setup {
--   init_options = {
--     preferences = {
--       disableSuggestions = true,
--     }
--   }
-- }
--
-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.lua_ls.setup {
    on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] == true,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      }
    }
  }
}
