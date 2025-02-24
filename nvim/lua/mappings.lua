require "nvchad.mappings"
-- -@type MappingsTable
local M = {}

local map = vim.keymap.set

--formatting
-- map("n", "<leader>fm", function()
--   require("configs.conform").format { lsp_fallback = true }
-- end, { desc = "Format Files" })


--dap
map("n","<leader>db","<cmd> DapToggleBreakpoint <CR>",{ desc = "Add breakpoint line"})
map("n","<leader>dr","<cmd> DapContinue <CR>",{ desc = " Run or continue the debugger"})

-- Exit
map("n",",q",":q <CR>", { desc = "Quit nvim (you must save before)"})
map("n",",Q",":q! <CR>", { desc = "force quit neovim"})

---- Comment
-- map("n", "<leader>/", function()
--  require("Comment.api").toggle.linewise.current()
-- end, { desc = "Comment Toggle" })
-- map(
--  "v",
--  "<leader>/",
--  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--  { desc = "Comment Toggle" }
--)

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end


-- Enter command CMD
map("n", "<leader>cm", "<cmd>Telescope commands<CR>", { desc = "Enter telescope command" })


-- map("n","<leader>cp",":Copilot panel<enter>", { desc = "Copilot panel"})

map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<S-M-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "TmuxNavigateLeft"})
map("n", "<S-M-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "TmuxNavigateDown"})
map("n", "<S-M-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "TmuxNavigateUp"})
map("n", "<S-M-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "TmuxNavigateRight"})
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { desc = "TmuxNavigatePrevious"})
-- keys = {
  --   { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --   { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --   { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --   { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --   { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --


return M
--local map = vim.keymap.set

--map("n","<leader>q",":q <CR>")
--map("n", ";", ":", { desc = "CMD enter command mode" })
--
-- M.general = {
--   n = {
--     [";"] = { ":", "enter command mode", opts = { nowait = true } },
--
--     --  format with conform
--     ["<leader>fm"] = {
--       function()
--         require("conform").format()
--       end,
--       "formatting",
--     },
--     ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "windows left"},
--     ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "windows right" },
--     ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "windows down" },
--     ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "windows up" },
--   },
--   v = {
--     [">"] = { ">gv", "indent"},
--   },
-- }
--
-- -- more keybinds!
-- --
-- M.abc = {
--   n = {
--     ["<leader>q"] = {":q <CR>", "Exit Nvim"}
--   }
-- }
-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {
--       "<cmd> DapToggleBreakpoint <CR>",
--       "Add breakpoint at line"
--     },
--     ["<leader>dr"] = {
--       "<cmd> DapContinue <CR>",
--       "Run or continue the debugger"
--     }
--   },
-- }

