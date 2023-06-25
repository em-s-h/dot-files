-- luacheck: ignore 212
-- luacheck: ignore 113

local opt = vim.opt -- More concise.

-- 1. Important.
opt.compatible = false

-- 2. Moving around, searching and patterns.
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.magic = true

-- 4. Displaying text.
opt.sidescrolloff = 5
opt.sidescroll = 1
opt.scrolloff = 25
opt.scroll = 15

opt.relativenumber = true
opt.lazyredraw = true
opt.number = true
opt.wrap = false

-- 5. Syntax, highlighting and spelling.
opt.colorcolumn = "95,100"
opt.termguicolors = true
opt.cursorline = true
opt.hlsearch = true

-- 6. Multiple windows.
opt.splitbelow = true
opt.splitright = true

-- 11. Messages and info.
opt.showmode = true
opt.showcmd = true

opt.confirm = true
opt.ruler = true
opt.more = true

-- 12. Clipboard.
opt.clipboard = "unnamedplus"

-- 13. Editing text.
opt.completeopt = "menu,menuone,noinsert,noselect,preview"
opt.backspace = "indent,eol,start"

-- 14. Tabs & indenting.
opt.preserveindent = true
opt.smartindent = true
opt.autoindent = true

opt.expandtab = true
opt.cindent = true

opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4

-- 15. Folding.
opt.foldmethod = "indent"
opt.foldlevelstart = 99

-- 19. The swap file.
opt.updatetime = 250

-- 20. Command line editing.
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- 25. Various.
opt.signcolumn = "yes"

-- Netrw.
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
