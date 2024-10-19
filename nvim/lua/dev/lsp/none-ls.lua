local status, null_ls = pcall(require, "null-ls")

if not status then
	print("null-ls is not installed!")
	return
end

local formatting = null_ls.builtins.formatting

local lsp_format = function(bufnr)
    vim.lsp.buf.format {
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls_on_attach = function(client, bufnr)
    if not client.supports_method("textDocument/formatting") then
        return
    end

    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            lsp_format(bufnr)
        end,
    })
end

null_ls.setup {
    debug = true,
    on_attach = null_ls_on_attach,
    sources = {
		formatting.clang_format,
		formatting.stylua,
    },
}
