local dap, dapui, hydra = require "dap", require "dapui", require "hydra"

-- Setup Telescope dap extension
local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
    telescope.load_extension "dap"
end

-- Setup cmp dap
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

-- Set Icons
vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpointCondition", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapStopped", { linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" } }
)

vim.api.nvim_call_function(
 "sign_define",
 { "DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" } }
)

-- Setup DAPUI
dapui.setup({
  icons = { collapsed = "", current_frame = "", expanded = "" },
  layouts = {
    {
 -- "scopes", "watches", "stacks",
      elements = { "breakpoints" },
      size = 40,
      position = "left",
    },
    { elements = { "console", "repl"}, size = 0.25, position = "bottom" },
  },
  render = { indent = 2 },
})
-- dapui.float_element("scopes")



-- Setup Virtual Text
require("nvim-dap-virtual-text").setup {}

-- Added event for open DAUI
dap.listeners.after.event_initialized['dapui_config'] = function()
 dapui.open()

end


-- Menu
local hint = [[
 Nvim DAP
 _d_: Start/Continue  _j_: StepOver _k_: StepOut _l_: StepInto ^
 _bp_: Toggle Breakpoint  _bc_: Conditional Breakpoint ^
 _?_: log point ^
 _c_: Run To Cursor ^
 _h_: Show information of the variable under the cursor ^
 _x_: Stop Debbuging ^
 ^^                                                      _<Esc>_
]]


hydra {
  name = "dap",
  hint = hint,
  mode = "n",
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      border = "rounded",
      position = "bottom",
    },
  },
  body = "<leader>d",
  heads = {
    { "d", dap.continue },
    { "bp", dap.toggle_breakpoint },
    { "l", dap.step_into },
    { "j", dap.step_over },
    { "k", dap.step_out },
    { "h", dapui.eval },
    { "c", dap.run_to_cursor },
    {
      "bc",
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          dap.set_breakpoint(condition)
        end)
      end,
    },
    {
      "?",
      function()
        vim.ui.input({ prompt = "Log: " }, function(log)
          dap.set_breakpoint(nil, nil, log)
        end)
      end,
    },
    {
      "x",
      function()
        dap.terminate()
        dapui.close {}
        dap.clear_breakpoints()
      end,
    },

    { "<Esc>", nil, { exit = true } },
  },
}

-- Setup node-debug2-adapter
require('dap').adapters.node2 = {
 type = "executable",
 command = "node",
 args = {
  require("mason-registry").get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
 },
}

-- Setup firefox-debug-adapter
require('dap').adapters.firefox = {
    type = "executable",
    command = "node",
    args = {
        require("mason-registry").get_package("firefox-debug-adapter"):get_install_path() .. "/dist/adapter.bundle.js",
    },
}

-- Configuration of the adapters for the respective language

for _, language in pairs({ "javascript", "typescript" }) do
 require('dap').configurations[language] = {
  {
   name = "Launch Node against current file",
   type = "node2",
   request = "launch",
   program = "${file}",
   cwd = "${workspaceFolder}",
   sourceMaps = true,
   protocol = "inspector",
   console = "integratedTerminal",
  },
  {
   name = "Launch Node against pick process",
   type = "node2",
   request = "attach",
   processId = require("dap.utils").pick_process,
   console = "integratedTerminal",
  },
  {
   name = "Launch Firefox against localhost",
   request = "launch",
   type = "firefox",
   reAttach = true,
   url = "http://localhost:3000",
   webRoot = "${workspaceFolder}",
   console = "integratedTerminal",
   firefoxExecutable = '/usr/local/bin/firefox-dev'
  },
 }
end

for _, language in pairs({ "javascriptreact", "typescriptreact" }) do
 require('dap').configurations[language] = {
  {
   name = "Launch Firefox against localhost",
   request = "launch",
   type = "firefox",
   reAttach = true,
   url = "http://localhost:3000",
   webRoot = "${workspaceFolder}",
   console = "integratedTerminal",
  },
 }
end

require('dap').configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}

