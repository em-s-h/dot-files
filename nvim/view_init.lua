-- luacheck: ignore 212
-- luacheck: ignore 113

-- Options.
require("dev.core.colorscheme")
require("dev.core.options")
require("vim.core.keymaps")

vim.opt.colorcolumn = ""

-- Plugins.
require("dev.plugins.lualine")
