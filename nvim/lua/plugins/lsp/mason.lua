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

		"tsserver",
		"cssls",
		"html",

		"lua_ls",
		"bashls",
	},
	automatic_installation = true,
})

-- Other.
mason_null_ls.setup({
	ensure_installed = {
		-- Formatters.
		"clang-format",
		"beautysh",
		"stylua",

		-- Linters.
		"shellcheck",
		"luacheck",

		"cpplint",
		"semgrep",

		-- Both.
		"eslint_d",
	},
	automatic_installation = true,
})
