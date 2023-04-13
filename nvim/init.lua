-- Plugin setup.
require("esh.setup")

-- My configs.
require("esh.core.colorscheme")
require("esh.core.options")
require("esh.core.keymaps")

-- Plugins.
require("esh.plugins.treesitter")
require("esh.plugins.nvim-tree")
require("esh.plugins.telescope")

require("esh.plugins.autopairs")
require("esh.plugins.auto-save")

require("esh.plugins.nvim-cmp")
require("esh.plugins.gitsigns")
require("esh.plugins.lualine")
require("esh.plugins.comment")

-- LSP.
require("esh.plugins.lsp.lspconfig")
require("esh.plugins.lsp.lspsaga")
require("esh.plugins.lsp.null-ls")
require("esh.plugins.lsp.mason")
