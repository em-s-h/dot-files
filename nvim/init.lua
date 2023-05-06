-- Plugin setup.
require("setup")

-- My configs.
require("core.colorscheme")
require("core.options")
require("core.keymaps")

-- Plugins.
require("plugins.treesitter")
require("plugins.nvim-tree")
require("plugins.telescope")

require("plugins.autopairs")
require("plugins.auto-save")

require("plugins.nvim-cmp")
require("plugins.lualine")
require("plugins.comment")

-- LSP.
require("plugins.lsp.lspconfig")
require("plugins.lsp.lspsaga")
require("plugins.lsp.null-ls")
require("plugins.lsp.mason")
