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
		"markdown_inline",
		"markdown",

		"c_sharp",
		"cpp",
		"c",

		"gdscript",
		"rust",

		"bash",
		"lua",
		"vim",
	},

	-- Auto install above language parsers.
	auto_install = true,
})
