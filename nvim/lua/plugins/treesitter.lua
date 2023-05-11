local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	print("treesitter is not installed!")
	return
end

-- Configure treesitter
treesitter.setup({
	highlight = {
		enable = true,
	},

	autotag = { enable = true },
	indent = { enable = true },

	-- Ensure these language parsers are installed.
	ensure_installed = {
		"gdscript",
		"c_sharp",
		"rust",

		"cpp",
		"c",

		"markdown_inline",
		"markdown",
		"toml",

		"python",
		"bash",
		"lua",
		"vim",
	},

	-- Auto install above language parsers.
	auto_install = true,
})
