-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local vue_typescript_path = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

local lspconfig = require "lspconfig"
local mason_registry = require "mason-registry"
-- local vue_language_server = mason_registry.get_package("vue_language_server"):get_install_path() .. "/node_modules/@vue/language-server"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "volar" }
local nvlsp = require "nvchad.configs.lspconfig"

local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ts_ls.setup {
  -- capabilities = nvlsp.capabilities,
  -- on_attach = nvlsp.on_attach,
  -- on_init  = nvlsp.on_init,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        -- location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        -- location =  mason_registry.get_package('vue-language-server'):get_install_path() .. 'node_modules/@vue/language-server/node_modules/@vue/typescript-plugin',
        -- location = vue_language_server,
        -- location = "/usr/local/lib/node_modules/typescript-language-server",
        location = vue_typescript_path,
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreach", "vue" },
}
lspconfig.volar.setup = {
  on_attach = nvlsp.on_attach,
  filetypes = { "javascript", "typescript", "vue"},
  init_options = {
      tsdk = '/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js'
  }
}
--
-- lspconfig.volar.setup = {
--   init_options = {
--     typescript = {
--       tsdk = '/usr/local/lib/node_modules/typescript/lib/typescript.js'
--     }
--   },
-- print(vue_language_server),
-- }

--}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
