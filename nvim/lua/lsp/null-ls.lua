-- luacheck: ignore 113

local status, null_ls = pcall(require, "null-ls")

if not status then
	print("null-ls is not installed!")
	return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.clang_format,
		formatting.rustfmt,
		formatting.stylua,

		diagnostics.luacheck,
		diagnostics.cpplint,
		diagnostics.semgrep,

		diagnostics.eslint_d,
	},

	-- Configure format on save. {{{
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,

				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- Only use null-ls for formatting instead of lsp server.
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
	-- }}}
})
