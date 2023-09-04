-- luacheck: ignore 113

local theme = "colorscheme onedark"

local status, _ = pcall(vim.cmd, theme)
if not status then
	print("Colorscheme not found!")
	return
end
