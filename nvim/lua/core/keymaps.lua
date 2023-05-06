-- luacheck: ignore 113

-- More concise.
local keymap = vim.keymap
vim.g.mapleader = " "

-- General keymaps. {{{

-- Clear search highlights.
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Delete single characters w/o copying into register.
keymap.set("n", "x", '"_x')

-- Open & close all folders.
keymap.set("n", "zO", ":%foldopen<CR>")
keymap.set("n", "zC", "zM")

-- Center the cursor vertically when moving to the next word during a search.
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Yank from cursor to the end of line.
keymap.set("n", "Y", "y$")

-- Tab & splits creation.
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>to", ":tabnew<CR>")

keymap.set("n", "<leader>sr", ":vsplit<CR>")
keymap.set("n", "<leader>sb", ":split<CR>")

keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>se", "<C-w>=")

-- Increase split width & height.
keymap.set("n", "<c-right>", "<C-w>>")
keymap.set("n", "<c-up>", "<C-w>+")

-- Decrease split width & height.
keymap.set("n", "<c-left>", "<C-w><")
keymap.set("n", "<c-down>", "<C-w>-")

-- Tab & splits movement.
keymap.set("n", "<leader>sh", "<C-w>h")
keymap.set("n", "<leader>sk", "<C-w>k")
keymap.set("n", "<leader>sj", "<C-w>j")
keymap.set("n", "<leader>sl", "<C-w>l")

keymap.set("n", "<leader>tp", ":tabp<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")

-- }}}

-- Plugin keymaps. {{{
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Togge file explorer.
keymap.set("n", "<leader>as", ":ASToggle<CR>", {}) -- Toggle auto-save.

-- Telescope.
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files in current directory, respects .gitignore.
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current directory.

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- List available help tags.
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- List open buffers in current neovim instance.

-- Telescope git commands.
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer.
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches.
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits.
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview.

-- Restart lsp server.
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

--- }}}
