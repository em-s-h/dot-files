-- luacheck: ignore 113
require("onedark").setup({ -- {{{
	ending_tildes = true,
	style = "darker",

	code_style = {
		functions = "italic",
		keywords = "italic",
	},
}) -- }}}

local theme = "colorscheme onedark"
-- local theme = "colorscheme purple"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
