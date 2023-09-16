-- luacheck: ignore 113
-- More concise.
local api = vim.api
local opt = vim.opt

-- Set cursor to the last location when opening a file. {{{
local augroup = api.nvim_create_augroup("SetCursorLocation", {})
api.nvim_clear_autocmds({ group = augroup })

api.nvim_create_autocmd("BufReadPost", {
	group = augroup,

	callback = function()
		local mark = api.nvim_buf_get_mark(0, '"')
		local lcount = api.nvim_buf_line_count(0)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
-- }}}

-- Set options depending on file type. {{{
augroup = api.nvim_create_augroup("SetFileFolding", {})
api.nvim_clear_autocmds({ group = augroup })

api.nvim_create_autocmd("FileType", {
	group = augroup,

	callback = function()
		local file_type = vim.bo.filetype
		local marker_fold = function()
			opt.foldmarker = "{{{,}}}"
			opt.foldmethod = "marker"
			opt.foldlevel = 0
		end

		local marker_files = {
			[1] = "javascript",
			[2] = "i3config",
			[3] = "markdown",
			[4] = "kitty",
			[5] = "text",
			[6] = "conf",
			[7] = "lua",
			[8] = "sh",
		}

		for _, file in ipairs(marker_files) do
			if file == file_type then
				marker_fold()
			end
		end
	end,
})
-- }}}
