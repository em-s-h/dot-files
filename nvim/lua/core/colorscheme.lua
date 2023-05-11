-- luacheck: ignore 113
require("kanagawa").setup({
	background = { dark = "wave" },
	typeStyle = { italic = true },
})

local theme = "colorscheme kanagawa"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
