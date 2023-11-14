-- luacheck: ignore 113
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
-- augroup = api.nvim_create_augroup("SetFileFolding", {})
-- api.nvim_clear_autocmds({ group = augroup })
--
-- api.nvim_create_autocmd("FileType", {
-- 	group = augroup,
--
-- 	callback = function()
-- 		local file_type = vim.bo.filetype
-- 		local indent_fold = function()
-- 			opt.foldmethod = "indent"
--             opt.foldlevelstart = 99
-- 			opt.foldlevel = 99
-- 		end
--
-- 		local indent_files = {
--             [1] = "csharp",
-- 			[2] = "rust",
-- 		}
--
-- 		for _, file in ipairs(indent_files) do
-- 			if file == file_type then
-- 				indent_fold()
-- 			end
-- 		end
-- 	end,
-- })
-- }}}
