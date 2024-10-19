local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("cmp not installed!")
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	print("luasnip not installed!")
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	print("lspkind is not installed!")
	return
end

-- Load friendly snippets.
require("luasnip/loaders/from_vscode").lazy_load()
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- Keymaps.
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

		["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(),            -- close completion window

		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	}),

	-- Autocomp. sources.
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP servers.
		{ name = "luasnip" },
		{ name = "buffer" }, -- Text within current buffer.
		{ name = "path" }, -- File system paths.
	}),

	-- VS-Code like icons.
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
