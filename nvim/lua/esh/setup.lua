-- luacheck: ignore 113

-- Auto install packer if not installed.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer() -- True if packer was just installed.

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved.
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("packer is not installed!")
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Lua functions used by other plugins.
	use("nvim-lua/plenary.nvim")

	-- Auto saving.
	use("Pocco81/auto-save.nvim")

    -- stylua: ignore start
	-- Visuals.
	use("nvim-tree/nvim-web-devicons")  -- Icons.
	use("nvim-lualine/lualine.nvim")    -- Statusline.

	-- Colorschemes.
	use("neanias/everforest-nvim")
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use("catppuccin/nvim")

	-- Useful.
	use("nvim-tree/nvim-tree.lua")  -- File explorer.
	use("numToStr/Comment.nvim")    -- Easier commenting.
	use("tpope/vim-surround")       -- Word surrounding.

	-- Autocompletion.
	use("hrsh7th/cmp-nvim-lsp") -- For lsp servers.
	use("hrsh7th/cmp-buffer")   -- For text in buffer.
	use("hrsh7th/cmp-path")     -- For file system paths
	use("hrsh7th/nvim-cmp")     -- Autocompletion plugin.

	-- Snippets.
	use("rafamadriz/friendly-snippets") -- Useful snippets.
	use("saadparwaiz1/cmp_luasnip")     -- Show snippets in autocomp.
	use("L3MON4D3/LuaSnip")             -- Snippet engine.

	-- fuzzy finding w/ telescope.
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })   -- Better sorting performance.
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })          -- fuzzy finder.

	-- LSP management.
	use("williamboman/mason-lspconfig.nvim")    -- Bridges gap b/w mason & lspconfig.
	use("williamboman/mason.nvim")              -- Manages LSP servers, linters & formatters.

	-- LSP configuration.
	use("neovim/nvim-lspconfig")    -- LSP configuration.
	use("onsails/lspkind.nvim")     -- VS-Code like icons for autocompletion.
	use({
		"glepnir/lspsaga.nvim",     -- Enhanced LSP UIs.
		branch = "main",
		requires = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	-- Formatting & linting.
	use("jose-elias-alvarez/null-ls.nvim")  -- Configure formatters & linters.
	use("jay-babu/mason-null-ls.nvim")      -- Bridges gap b/w mason & null-ls.

	-- Treesitter configuration.
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Autoclosing.
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use("windwp/nvim-autopairs")

	-- Git integration.
	use("lewis6991/gitsigns.nvim") -- Show line modifications.

	-- stylua: ignore end
	if packer_bootstrap then
		require("packer").sync()
	end
end)
