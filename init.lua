-- BASIC
vim.opt.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line
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
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set({"n", "v", "x"}, "<leader>y", '"+y<CR>')
vim.keymap.set({"n", "v", "x"}, "<leader>d", '"+d<CR>')

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
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("mini.pick").setup()
require("oil").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"ols",
		"svelte",
		"tinymist",
		"clangd",
		"gopls",
		"ts_ls",
		"basedpyright",
	},
	automatic_enable = false,
})

vim.lsp.enable({
	"lua_ls",
	"rust-analyzer",
	"ols",
	"svelte",
	"tinymist",
	"clangd",
	"gopls",
	"ts_ls",
	"basedpyright",
})

vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")


-- AUTOCMDs

-- completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")
