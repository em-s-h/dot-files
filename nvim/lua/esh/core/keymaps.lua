-- luacheck: ignore 113

-- More concise.
local keymap = vim.keymap
vim.g.mapleader = " "

-- General keymaps. {{{
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear highlights.
keymap.set("n", "Y", "y$") -- Yank from cursor to end of line.

keymap.set("n", "zO", ":%foldopen<CR>") -- Open all folders in file.
keymap.set("n", "zC", "zM") -- Close all folders in file.

-- Center cursor vertically when moving to the next word during a search.
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- }}}

-- Splits & tab keymaps. {{{
-- stylua: ignore start

keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- Close current tab.
keymap.set("n", "<leader>to", ":tabnew<CR>")    -- Open new tab.
keymap.set("n", "<leader>tp", ":tabp<CR>")      -- Previous tab.
keymap.set("n", "<leader>tn", ":tabn<CR>")      -- Next tab.

keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window.
keymap.set("n", "<leader>sv", "<C-w>v")     -- Split window vertically.
keymap.set("n", "<leader>se", "<C-w>=")     -- Make splits equal width.

keymap.set("n", "<c-left>", "<C-w><")   -- Increase split width.
keymap.set("n", "<c-up>", "<C-w>+")     -- Increase split height.

keymap.set("n", "<c-right>", "<C-w>>")  -- Decrease split width.
keymap.set("n", "<c-down>", "<C-w>-")   -- Decrease split height.

keymap.set("n", "<leader>sh", "<C-w>h") -- Move to left split.
keymap.set("n", "<leader>sj", "<C-w>j") -- Move to bottom split.
keymap.set("n", "<leader>sk", "<C-w>k") -- Move to top split.
keymap.set("n", "<leader>sl", "<C-w>l") -- Move to right split.

-- stylua: ignore end
--- }}}

-- Plugin keymaps. {{{
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

--- }}}
