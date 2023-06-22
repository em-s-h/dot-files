local status, oil = pcall(require, "oil")
if not status then
	print("oil.nvim is not installed!")
	return
end

oil.setup({
	columns = {
		"icon",
		"permissions",
		"size",
	},

	win_options = {
		signcolumn = "yes",
	},

	delete_to_trash = true,
})
