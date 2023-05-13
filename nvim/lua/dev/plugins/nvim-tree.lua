-- luacheck: ignore 113
-- luacheck: ignore 112

local status, nvimtree = pcall(require, "nvim-tree")

if not status then
	print("nvim-tree is not installed!")
	return
end

-- Change color for arrows in tree to light blue.
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- Recommended settings from nvim-tree documentation.
vim.g.loaded_netrwPlugin = 1
vim.g.loaded = 1

nvimtree.setup({
	-- Change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},

	-- Disable window_picker for explorer to
	--   work well with window splits.
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
