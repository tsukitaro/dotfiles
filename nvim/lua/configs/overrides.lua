local M = {}

M.nvimtree = {
  git = {
    enable = true
  },

  renderer = {
    root_folder_label = ":~:s?$?/..?",
    highlight_git = true,
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = true,
      },
    },
  },
}

return M
