-- Plugin setup.
require("setup")

-- My configs.
require("core.colorscheme")
require("core.options")
require("core.keymaps")

-- Plugins.
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.autopairs")

require("plugins.nvim-cmp")
require("plugins.lualine")
require("plugins.comment")

-- LSP.
require("lsp.lspconfig")
require("lsp.lspsaga")
require("lsp.null-ls")
require("lsp.mason")
