local status, hlslens = pcall(require, "hlslens")
if not status then
	print("hlslens is not installed!")
	return
end

local kopts = { noremap = true, silent = true }
hlslens.setup({
	nearest_float_when = "always",
	nearest_only = true,
	calm_down = true,
})

vim.api.nvim_set_keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)

vim.api.nvim_set_keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)

vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

local function nN(char)
	local ok, winid = hlslens.nNPeekWithUFO(char)

	if ok and winid then
		vim.keymap.set("n", "<CR>", function()
			local keyCodes = vim.api.nvim_replace_termcodes("<Tab><CR>", true, false, true)
			vim.api.nvim_feedkeys(keyCodes, "im", false)
		end, { buffer = true })
	end
end

vim.keymap.set({ "n", "x" }, "n", function()
	nN("n")
end)

vim.keymap.set({ "n", "x" }, "N", function()
	nN("N")
end)
