local cmd = vim.cmd

cmd([[highlight IblScope guifg=#C678DD gui=nocombine]])
-- cmd([[highlight IndentBlanklineContextStart guisp=#C678DD gui=underline]])

require("ibl").setup({
    indent = {
        char = "▎",
    },

    scope = {
        show_end = false
    },

    exclude = {
        filetypes = {
            "markdown",
            "text",
            "bash",
            "lua"
        }
    },

    -- use_treesitter_scope = true,
    -- show_current_context_start_on_current_line = false,
    --
    -- max_indent_increase = 1,
    -- show_first_indent_level = false,
    -- show_trailing_blankline_indent = false,
})
