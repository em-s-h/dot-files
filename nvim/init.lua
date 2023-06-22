-- Plugin setup.
require("setup")

-- My configs.
require("dev.core.colorscheme")
require("dev.core.options")
require("dev.core.keymaps")
require("dev.core.scripts")

-- Plugins.
require("dev.plugins.indent-blankline")
require("dev.plugins.treesitter")
require("dev.plugins.telescope")

require("dev.plugins.autopairs")
require("dev.plugins.nvim-cmp")
require("dev.plugins.lualine")

require("dev.plugins.comment")
require("dev.plugins.hlslens")
require("dev.plugins.ufo")
require("dev.plugins.oil")

-- Packet manager.
require("dev.mason")

-- LSP.
require("dev.lsp.lspconfig")
require("dev.lsp.lspsaga")
require("dev.lsp.null-ls")

-- DAP.

