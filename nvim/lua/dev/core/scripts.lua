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

-- Auto indent current line.
vim.keymap.set("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })

-- Set options depending on file type.
api.nvim_create_autocmd("FileType", {
	group = 2,

	callback = function()
		local file_type = vim.bo.filetype

		if file_type == "python" then
			opt.foldmethod = "indent"
		--
		else
			opt.foldmarker = "{{{,}}}"
			opt.foldmethod = "marker"
		end
	end,
})
