-- lua, default settings
local options = {
    timeout = vim.o.timeoutlen,
    default_mappings = true,
    mappings = {
        i = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        c = {

            j = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        t = {
            j = {
                k = "<C-\\><C-n>",

            },
        },

        v = {
            j = {
                k = "<Esc>",
            },
        },
        s = {
            j = {

                k = "<Esc>",
            },
        },
    },
}

require("better_escape").setup(options)
