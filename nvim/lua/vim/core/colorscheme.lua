-- luacheck: ignore 113
require("dev.core.colorscheme")

local theme = "colorscheme kanagawa-dragon"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
