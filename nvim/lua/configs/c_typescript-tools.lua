local nvlsp = require "nvchad.configs.lspconfig"
return {
  on_attach = nvlsp.on_attach,
  -- on_attach = function (client)
  --   client.server_capabilities.documentFormattingProvider = false
  --   client.server_capabilities.documentRangeFormattingProvider = false
  -- end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
  },
  settings = {
    tssever_plugins = {
      "@vue/typescript-plugin",
    },
  },
}
