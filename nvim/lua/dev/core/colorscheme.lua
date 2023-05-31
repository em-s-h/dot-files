-- luacheck: ignore 113
require("kanagawa").setup({
	statementStyle = { italic = true },
	typeStyle = { italic = true },
	dimInactive = true,
})

local theme = "colorscheme kanagawa-wave"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
