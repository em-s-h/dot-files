-- luacheck: ignore 113

local keymap = vim.keymap
local api = vim.api
local opt = vim.opt

-- Set cursor to the previous location when opening a file. {{{
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

-- Auto indent current line. {{{
keymap.set("n", "i", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })

keymap.set("n", "a", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "a"
    end
end, { expr = true })
-- }}}

-- Format file after saving. {{{
augroup = api.nvim_create_augroup("LspFormatting", {})
api.nvim_clear_autocmds({ group = augroup })

api.nvim_create_autocmd("BufWritePre", {
    group = augroup,

    callback = function()
        vim.lsp.buf.format()
        vim.cmd("silent! %foldclose")
        vim.cmd("silent! foldopen")
    end,
})
-- }}}
