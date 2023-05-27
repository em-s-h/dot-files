-- luacheck: ignore 113

local keymap = vim.keymap -- More concise.
vim.g.mapleader = " "

-- Center the cursor vertically when moving to the next word during a search.
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- stylua: ignore start

keymap.set("n", "<leader>nh", ":nohl<CR>")  -- Clear search highlights.
keymap.set("n", "<leader>w", ":w<CR>")      -- Easier writting.

keymap.set("n", "zA", ":%foldopen<CR>") -- Open all folders.
keymap.set("n", "zC", "zM")             -- Close all folders.

keymap.set("n", "<c-a>", "ggVG") -- Select all the text in the file.
keymap.set("n", "x", '"_x')      -- Remove character w/o copying into register.
keymap.set("n", "Y", "y$")       -- Yank from cursor to line end.

-- Tab & splits. {{{
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close tab.
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- Open tab.

keymap.set("n", "<leader>sr", ":vsplit<CR>") -- Split vertically.
keymap.set("n", "<leader>sb", ":split<CR>")  -- Split horizontally.

keymap.set("n", "<leader>sx", ":close<CR>") -- Close split
keymap.set("n", "<leader>se", "<C-w>=")     -- Make splits equal width.

keymap.set("n", "<c-right>", "<C-w>>")  -- Increase split width.
keymap.set("n", "<c-up>", "<C-w>+")     -- Increase split height.

keymap.set("n", "<c-left>", "<C-w><")   -- Decrease split width.
keymap.set("n", "<c-down>", "<C-w>-")   -- Decrease split height.

keymap.set("n", "<leader>tp", ":tabp<CR>") -- Next tab.
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Prev tab.

keymap.set("n", "<leader>sh", "<C-w>h") -- Left split.
keymap.set("n", "<leader>sk", "<C-w>k") -- Top split.
keymap.set("n", "<leader>sj", "<C-w>j") -- Bottom split.
keymap.set("n", "<leader>sl", "<C-w>l") -- Right split.

-- stylua: ignore end
-- }}}
