-- luacheck: ignore 113
-- More concise.
local api = vim.api
local opt = vim.opt

-- Go to last location when opening a file.
api.nvim_create_autocmd("BufReadPost", {
	group = 1,

	callback = function()
		local mark = api.nvim_buf_get_mark(0, '"')
		local lcount = api.nvim_buf_line_count(0)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Set options depending on file type.
api.nvim_create_autocmd("FileType", {
	group = 2,

	callback = function()
		local file_type = vim.bo.filetype

		if file_type == "markdown" then
			opt.colorcolumn = "100"

			opt.preserveindent = false
			opt.smartindent = false
			opt.autoindent = false
			opt.shiftwidth = 0

			opt.foldmarker = "{{{,}}}"
			opt.foldmethod = "marker"
			opt.foldlevel = 0
		--
		elseif file_type == "rust" then
			opt.colorcolumn = "100"
		end
	end,
})
