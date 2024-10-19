local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("mason is not installed!")
    return
end

local cmp_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status then
    print("cmp-nvim-lsp is not installed!")
    return
end

local lspconf_status, lspconfig = pcall(require, "mason-lspconfig")
if not lspconf_status then
    print("mason-lspconfig is not installed!")
    return
end

local keymap = vim.keymap

mason.setup()

lspconfig.setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true,
})

local on_attach = function(client, bufnr) -- {{{
    -- Keybind options.
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- keybindings.
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show diagnostics for cursor.
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- Show diagnostics for line.

    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)       -- Go to implementation.
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)          -- Go to declaration.

    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)           -- Jump to previous diagnostic in buffer.
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)           -- Jump to next diagnostic in buffer.

    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- See available code actions.
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)                 -- See outline on right hand side.

    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)                -- See definition and make edits in window.
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)                     -- Show definition, references.

    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- Smart rename.
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- Show documentation for what is under cursor.
end
-- }}}

-- Capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}
-- }}}

-- Change the Diagnostic symbols in the sign column (gutter).
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },

            -- Make language server aware of runtime files.
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },

            -- Do not send telemetry data containing a randomized but unique identifier.
            telemetry = { enable = false },
        },
    }
}

-- lsp servers {{{
local servers = {
    "rust_analyzer",
    "omnisharp",
    "gdscript",

    -- tsserver = {},
    -- cssls = {},
    -- html = {},

    "pyright",
    "clangd",
}
-- }}}

for _, server in ipairs(servers) do
    require("lspconfig")[server].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end
