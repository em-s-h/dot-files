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

-- stylua: ignore start
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Lua functions used by other plugins.
	use("nvim-lua/plenary.nvim")

	-- Visuals.
	use("lukas-reineke/indent-blankline.nvim")  -- Indent line.
    use("navarasu/onedark.nvim")                -- Colorscheme

	use("nvim-lualine/lualine.nvim")    -- Status line.
    use("kevinhwang91/nvim-hlslens")    -- Better word matching.

    use({                       -- Better folding.
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async"
    })

    -- Kitty.
    use("fladson/vim-kitty")

	-- Useful.
	use("numToStr/Comment.nvim")    -- Easier commenting.
	use("windwp/nvim-autopairs")    -- Autoclosing.
	use("tpope/vim-surround")       -- Word surrounding.
    use("stevearc/oil.nvim")        -- File explorer in buffer.

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
	use("williamboman/mason-lspconfig.nvim")    -- Connect lspconfig to mason.
	use("williamboman/mason.nvim")              -- Manages LSP servers, linters, formatters & DAP.

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
	use("jose-elias-alvarez/null-ls.nvim")  -- Linting & formatting.
	use("jay-babu/mason-null-ls.nvim")      -- Connect null-ls to mason.

	-- Treesitter configuration.
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- stylua: ignore end
	if packer_bootstrap then
		require("packer").sync()
	end
end)
