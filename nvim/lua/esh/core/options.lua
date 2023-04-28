local opt = vim.opt -- More concise.

-- 1. Important.
opt.compatible = false

-- 2. Moving around, searching and patterns.
opt.ignorecase = true
opt.smartcase = true

-- 4. Displaying text.
opt.sidescrolloff = 15
opt.sidescroll = 1
opt.scrolloff = 15
opt.scroll = 10

opt.relativenumber = true
opt.number = true
opt.wrap = false

-- 5. Syntax, highlighting and spelling.
opt.cursorline = true

-- 6. Multiple windows.
opt.splitbelow = true
opt.splitright = true

-- 11. Messages and info.
opt.more = true

-- 12. Clipboard.
opt.clipboard = "unnamedplus"

-- 13. Editing text.
opt.backspace = "indent,eol,start"
opt.undoreload = 1000
opt.undofile = true

-- 14. Tabs & indenting.
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.cindent = true

opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4

-- 15. Folding.
opt.foldmethod = "marker"

-- 19. The swap file
opt.updatetime = 1225

-- 20. Command line editing.
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.import"

-- 25. Various.
opt.signcolumn = "yes"
