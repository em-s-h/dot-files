-- luacheck: ignore 113

math.randomseed(os.time())
local colorschemes = {
	[1] = "colorscheme tokyonight",
	[2] = "colorscheme everforest",
	[3] = "colorscheme catppuccin",
	[4] = "colorscheme kanagawa",
}

-- Settings.
require("everforest").setup({
	background = "hard",
	italics = true,
})

require("catppuccin").setup({
	styles = {
		keywords = { "italic" },
		booleans = { "italic" },
		types = { "italic" },
	},
})

require("kanagawa").setup({
	background = { dark = "wave" },
	typeStyle = { italic = true },
})

local theme = colorschemes[math.random(#colorschemes)]
-- local theme = colorschemes[3]

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
