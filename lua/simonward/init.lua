if vim.loader then
	vim.loader.enable() -- enables experimental module loader
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("simonward.disable")
require("simonward.options")
require("simonward.keymaps")
require("simonward.autocmd")
require("simonward.plugins")
require("simonward.colorscheme")

require("simonward.autopairs")
require("simonward.bufferline")
require("simonward.colorizer")
require("simonward.comment")
require("simonward.gitsigns")
require("simonward.ibl")
require("simonward.nvim-tree")
require("simonward.telescope")
require("simonward.treesitter")
require("simonward.treesitter-ctx")

-- disabled to promote active recall
if vim.loop.os_uname().sysname == "Darwin" then
	require("simonward.cmp")
	require("simonward.lsp")
end
