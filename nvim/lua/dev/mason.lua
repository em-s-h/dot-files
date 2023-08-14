local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("mason is not installed!")
	return
end

local lspconf_status, lspconfig = pcall(require, "mason-lspconfig")
if not lspconf_status then
	print("mason-lspconfig is not installed!")
	return
end

local null_ls_status, null_ls = pcall(require, "mason-null-ls")
if not null_ls_status then
	print("mason-null-ls is not installed!")
	return
end

mason.setup()

-- LSP.
lspconfig.setup({
	ensure_installed = {
		"rust_analyzer",
		"omnisharp",
		"clangd",
		"bashls",
		"texlab",

		"tsserver",
		"cssls",
		"html",

		"pyright",
		"lua_ls",
	},
	automatic_installation = true,
})

-- Linters & formatters.
null_ls.setup({
	ensure_installed = {
		-- Formatters.
		"clang-format",
		"latexindent",
		"stylua",

		-- Linters.
		"eslint_d",
		"semgrep",
	},
	automatic_installation = true,
})
