-- luacheck: ignore 113
require("rose-pine").setup({
	dark_variant = "moon",
	variant = "moon",
})

local theme = "colorscheme rose-pine"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
