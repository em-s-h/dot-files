-- luacheck: ignore 113

require("vim.core.scripts")

local api = vim.api

-- Auto indent current line. {{{
vim.keymap.set("n", "i", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })
-- }}}

-- Format file after saving. {{{
local augroup = api.nvim_create_augroup("LspFormatting", {})
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
