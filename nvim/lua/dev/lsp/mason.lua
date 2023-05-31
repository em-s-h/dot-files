local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("mason is not installed!")
	return
end

local mason_lspconf_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconf_status then
	print("mason-lspconfig is not installed!")
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("mason_null_ls is not installed!")
	return
end

mason.setup()

-- LSP.
mason_lspconfig.setup({
	ensure_installed = {
		"rust_analyzer",
		"omnisharp",
		"clangd",
		"bashls",

		"tsserver",
		"cssls",
		"html",

		"pyright",
		"lua_ls",
	},
	automatic_installation = true,
})

-- Other.
mason_null_ls.setup({
	ensure_installed = {
		-- Formatters.
		"clang-format",
		"rustfmt",
		"stylua",

		-- Linters.
		"shellcheck",
		"luacheck",

		"eslint_d",
		"semgrep",
	},
	automatic_installation = true,
})
