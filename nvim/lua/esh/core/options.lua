-- More concise.
local opt = vim.opt

opt.updatetime = 1250

-- 2. Moving around, searching and patterns.
opt.ignorecase = true
opt.smartcase = true

-- stylua: ignore start

-- 4. Displaying text.
opt.siso = 15   -- Minimal number of columns to keep left and right of the cursor.
opt.scr = 10    -- Lines to scroll with Ctrl-u/d.
opt.so = 15     -- Number of screen lines to show around the cursor.
opt.ss = 1      -- Minimal number of columns to scroll horizontally.

-- stylua: ignore end

opt.relativenumber = true
opt.number = true
opt.wrap = false

-- 5. Syntax, highlighting and spelling.
opt.termguicolors = true
opt.cursorline = true

-- 6. Multiple windows.
opt.splitbelow = true
opt.splitright = true

-- 13. Editing text.
opt.backspace = "indent,eol,start"

-- 14. Tabs & indenting.
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.cindent = true

opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4

-- 25. Various.
opt.signcolumn = "yes"
