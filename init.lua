-- BASIC
vim.opt.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true  -- copy indent from current line
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- omnicomplete <C-X><C-O>
-- hover <shift-K>
-- window diagnostic <C-wd>

-- KEYMAPS
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Explore" })
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>', { desc = "Yank to Clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>', { desc = "Delete to Clipboard"})

-- Wrap
vim.keymap.set("x", '<leader>"', '<Esc>`>a"<Esc>`<i"', { desc = "Wrap selection in quotes" })
vim.keymap.set("x", '<leader>{', '<Esc>`>a}<Esc>`<i{', { desc = "Wrap selection in brackets" })
vim.keymap.set("x", '<leader>(', '<Esc>`>a)<Esc>`<i(', { desc = "Wrap selection in parentheses" })

-- Functions
vim.keymap.set("n", "<leader>pa", function() -- show file path
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end, { desc = "Copy full file path" })

vim.pack.add({
    -- colorschemes
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/RostislavArts/naysayer.nvim" },
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },

    -- other
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/folke/which-key.nvim" },
})

require("mini.pick").setup()
require("oil").setup()

vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")

