local indent_status, indent = pcall(require, "indent_blankline")
if not indent_status then
	print("indent-blankline is not installed!")
	return
end

local cmd = vim.cmd

cmd([[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]])
cmd([[highlight IndentBlanklineContextStart guisp=#C678DD gui=underline]])

indent.setup({
	filetype_exclude = {
		"markdown",
        "text",
		"bash",
		"lua",
	},
	char = "▎",

	use_treesitter_scope = true,
	show_current_context = true,
	show_current_context_start = true,
	show_current_context_start_on_current_line = false,

	max_indent_increase = 1,
	show_first_indent_level = false,
	show_trailing_blankline_indent = false,
})
