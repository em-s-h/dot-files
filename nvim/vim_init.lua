-- Plugin setup.
require("setup")

-- Colorscheme -- {{{
require("onedark").setup({
    ending_tildes = true,
    style = "darker",

    code_style = {
        functions = "italic",
    },
})
-- }}}

vim.cmd("colorscheme onedark")
require("dev.core.options")
require("vim.core.keymaps")
require("vim.core.scripts")

-- Plugins.
require("dev.plugins.indent-blankline")
require("dev.plugins.treesitter")
require("dev.plugins.autopairs")
require("vim.plugins.nvim-cmp")

require("dev.plugins.lualine")
require("dev.plugins.comment")
require("dev.plugins.oil")
