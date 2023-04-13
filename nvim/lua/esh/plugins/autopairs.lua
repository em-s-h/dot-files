local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
	print("autopairs is not installed!")
	return
end

local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	print("cmp-autopairs is not installed!")
	return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("cmp is not installed!")
	return
end

-- stylua: ignore start
-- Configure autopairs.
autopairs.setup({
	check_ts = true, -- Enable treesitter.
	ts_config = {
		javascript = { "template_string" }, -- Don't add pairs in javscript template_string treesitter nodes.
		lua = { "string" },                 -- Don't add pairs in lua string treesitter nodes.
		java = false,                       -- Don't check treesitter on java.
	},
})
-- stylua: ignore end

-- Make autopairs and completion work together.
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
