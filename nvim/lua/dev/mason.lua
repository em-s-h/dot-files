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

mason.setup()

-- LSP.
lspconfig.setup({
	ensure_installed = {
		"rust_analyzer",
		"omnisharp",
		"clangd",

		"tsserver",
		"cssls",
		"html",

		"pyright",
		"lua_ls",
	},
	automatic_installation = true,
})
