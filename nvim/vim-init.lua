-- Plugin setup.
require("setup")

-- My configs.
require("dev.core.colorscheme")
require("dev.core.options")
require("vim.core.keymaps")
require("dev.core.scripts")

-- Plugins.
require("dev.plugins.autopairs")
require("vim.plugins.nvim-cmp")
require("dev.plugins.lualine")
require("dev.plugins.comment")
