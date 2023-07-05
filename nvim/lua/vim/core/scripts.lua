-- luacheck: ignore 113
-- More concise.
local api = vim.api
local opt = vim.opt

-- Go to last location when opening a file. {{{
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
-- }}}

-- Set options depending on file type. {{{
api.nvim_create_autocmd("FileType", {
	group = 2,

	callback = function()
		local file_type = vim.bo.filetype
		local marker_fold = function()
			opt.foldmarker = "{{{,}}}"
			opt.foldmethod = "marker"
			opt.foldlevel = 0
		end

		local marker_files = {
			[1] = "i3config",
			[2] = "markdown",
			[3] = "kitty",
			[4] = "text",
			[5] = "lua",
		}

		for _, file in ipairs(marker_files) do
			if file == file_type then
				marker_fold()
			end
		end
	end,
})
-- }}}

-- Change theme based on time of day. {{{
-- local hr = tonumber(os.date("%H", os.time()))
--
-- -- Day between 6am and 6pm
-- if hr > 6 and hr < 18 then
-- 	opt.background = "light"
-- --
-- else
-- 	opt.background = "dark"
-- end
--
-- }}}
