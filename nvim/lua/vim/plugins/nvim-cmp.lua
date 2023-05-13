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

-- Load friendly snippets.
require("luasnip/loaders/from_vscode").lazy_load()

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

		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window

		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	}),

	-- Autocomp. sources.
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "buffer" }, -- Text within current buffer.
		{ name = "path" }, -- File system paths.
	}),
})
