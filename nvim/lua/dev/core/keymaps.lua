-- luacheck: ignore 112
-- luacheck: ignore 113

local keymap = vim.keymap -- More concise.
vim.g.mapleader = " "

require("vim.core.keymaps") -- General keymaps.

-- Plugin keymaps. {{{
-- Telescope.
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files in current directory, respects .gitignore.
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current directory.

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- List available help tags.
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- List open buffers in current neovim instance.

-- Telescope git commands.
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer.
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches.
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits.
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview.

-- Restart lsp server.
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

--- }}}
