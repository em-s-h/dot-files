-- Plugin setup.
require("setup")

-- My configs.
require("onedark").setup({ -- {{{
	ending_tildes = true,
	style = "darker",

	code_style = {
		functions = "italic",
		keywords = "italic",
	},
}) -- }}}
vim.cmd("colorscheme onedark")

require("dev.core.options")
require("dev.core.keymaps")
require("dev.core.scripts")

-- Packet manager.
require("dev.mason")

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

-- LSP.
require("dev.lsp.lspconfig")
require("dev.lsp.lspsaga")
require("dev.lsp.null-ls")
