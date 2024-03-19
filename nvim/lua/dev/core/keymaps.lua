-- luacheck: ignore 112
-- luacheck: ignore 113

local keymap = vim.keymap
vim.g.mapleader = " "

-- Center vertically during a search
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear search highlights
keymap.set("n", "<leader>w", ":w<CR>")     -- Easier write to file

keymap.set("n", "<leader>]", "<c-a>")      -- Increment number
keymap.set("n", "<leader>[", "<c-x>")      -- Decrement number

keymap.set("n", "<c-a>", "ggVG")           -- Select all
keymap.set("n", "U", "<c-r>")              -- Map 'U' to redo
keymap.set("n", "x", '"_x')                -- Remove character w/o copying into register
keymap.set("n", "Y", "y$")                 -- Yank from cursor to line end

-- "0": Go to start of line ; "^": Go to first character
-- Invert "0" & "^"
keymap.set("n", "0", "^")
keymap.set("n", "^", "0")

-- Tabs {{{
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close tab
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- Open tab

keymap.set("n", "<leader>tp", ":tabp<CR>")     -- Next tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- Prev tab
-- }}}

-- Splits {{{
keymap.set("n", "<leader>ss", ":vsplit<CR>") -- Split to the side
keymap.set("n", "<leader>sb", ":split<CR>")  -- Split bellow

keymap.set("n", "<leader>sx", ":close<CR>")  -- Close split
keymap.set("n", "<leader>se", "<C-w>=")      -- Make splits equal width

keymap.set("n", "<c-right>", "<C-w>>")       -- Increase split width
keymap.set("n", "<c-up>", "<C-w>+")          -- Increase split height

keymap.set("n", "<c-left>", "<C-w><")        -- Decrease split width
keymap.set("n", "<c-down>", "<C-w>-")        -- Decrease split height

keymap.set("n", "<leader>sh", "<C-w>h")      -- Left split
keymap.set("n", "<leader>sk", "<C-w>k")      -- Top split
keymap.set("n", "<leader>sj", "<C-w>j")      -- Bottom split
keymap.set("n", "<leader>sl", "<C-w>l")      -- Right split
-- }}}

-- Plugin keymaps. {{{
-- Telescope.
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files in current directory, respects .gitignore.
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")  -- Find string in current directory.

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")  -- List available help tags.
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")    -- List open buffers in current neovim instance.

-- Telescope git commands.
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer.
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches.
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits.
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview.

-- Restart lsp server.
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

--- }}}
