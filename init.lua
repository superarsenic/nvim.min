-- BASIC
require("keymap")
require("statusline")
require("autocmd")

vim.opt.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true  -- copy indent from current line
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.laststatus = 3
vim.o.cmdheight = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.showmatch = true
vim.opt.showmode = false

vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory


vim.pack.add({
    -- colorschemes
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
    { src = "https://github.com/vague-theme/vague.nvim.git"},
    { src = "https://github.com/alljokecake/naysayer-theme.nvim"},

    -- other
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/folke/which-key.nvim" },
})

require("mini.pick").setup()
require("oil").setup()

vim.cmd("colorscheme vague")

