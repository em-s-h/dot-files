-- luacheck: ignore 113
local api = vim.api
local opt = vim.opt

-- Set cursor to previous location when opening a file. {{{
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
        if "haskell" == file_type then
            opt.softtabstop = 2
            opt.shiftwidth = 2
            opt.tabstop = 2
        end
    end,
})
-- }}}
