-- luacheck: ignore 113
require("rose-pine").setup({
	dark_variant = "moon",
	variant = "moon",
})

require("kanagawa").setup({
	functionStyle = { bold = true },
	typeStyle = { italic = true },
})

local themes = {
	[1] = "rose-pine",
	[2] = "kanagawa-wave",
}

local theme = "colorscheme " .. themes[math.random(1, 2)]

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
