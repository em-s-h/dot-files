-- luacheck: ignore 113

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        -- Lua functions used by other plugins
        "nvim-lua/plenary.nvim",

        -- Visuals {{{
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
        },
        "nvim-lualine/lualine.nvim", -- Status line
        "navarasu/onedark.nvim",     -- Colorscheme
        -- }}}

        -- Kitty
        "fladson/vim-kitty",

        -- Useful {{{
        "numToStr/Comment.nvim", -- Easier commenting
        "windwp/nvim-autopairs", -- Autoclosing
        "tpope/vim-surround",    -- Word surrounding
        "stevearc/oil.nvim",     -- File explorer in buffer
        -- }}}

        -- Autocompletion {{{
        "hrsh7th/cmp-nvim-lsp", -- For lsp servers
        "hrsh7th/cmp-buffer",   -- For text in buffer
        "hrsh7th/cmp-path",     -- For file system paths
        "hrsh7th/nvim-cmp",     -- Autocompletion plugin
        -- }}}

        -- Snippets
        "rafamadriz/friendly-snippets", -- Useful snippets
        "saadparwaiz1/cmp_luasnip",     -- Show snippets in autocomp
        "L3MON4D3/LuaSnip",             -- Snippet engine

        -- Telescope (Unused) {{{
        -- {
        --     "nvim-telescope/telescope.nvim",
        --     branch = "0.1.x",
        -- },
        --
        -- -- Better sorting performance for Telescope
        -- {
        --     'nvim-telescope/telescope-fzf-native.nvim',
        --     build =
        --     'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        -- },
        -- }}}

        -- LSP management
        "williamboman/mason-lspconfig.nvim", -- Connect lspconfig to mason
        "williamboman/mason.nvim",           -- Manages LSP servers, linters, formatters & DAP

        -- LSP configuration
        "neovim/nvim-lspconfig",    -- LSP configuration
        "onsails/lspkind.nvim",     -- Icons for autocompletion window
        {
            "nvimdev/lspsaga.nvim", -- Enhanced LSP UIs
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            },
        },

        -- Treesitter configuration
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
        },
    })
