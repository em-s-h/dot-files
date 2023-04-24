-- More concise.
local keymap = vim.keymap

vim.g.mapleader = " "

-- General keymaps.
keymap.set("n", "<leader>lf", ":luafile %<CR>") -- Reload the init.lua file.
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear highlights.

-- Window & tab keymaps.
keymap.set("n", "<leader>sl", "<C-w>l") -- Move to right split.
keymap.set("n", "<leader>sh", "<C-w>h") -- Move to left split.

keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window.
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically.
keymap.set("n", "<leader>se", "<C-w>=") -- Make windows equal width.

keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab.
keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab.
keymap.set("n", "<leader>tp", ":tabp<CR>") -- Previous tab.
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Next tab.

-- Plugin keymaps.
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Togge file explorer.
keymap.set("n", "<leader>as", ":ASToggle<CR>", {}) -- Toggle auto-save.

-- Telescope.
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- Find string under cursor in current working directory.
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files within current working directory, respects .gitignore.
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current working directory as you type.

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- List available help tags.
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- List open buffers in current neovim instance.

-- Telescope git commands.
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer.
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches.
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits.
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview.

-- Restart lsp server.
keymap.set("n", "<leader>rs", ":LspRestart<CR>")
