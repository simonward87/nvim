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
require("simonward.autotag")
require("simonward.bufferline")
require("simonward.colorizer")
require("simonward.comment")
require("simonward.filetypes")
require("simonward.gitsigns")
require("simonward.gomodifytags")
require("simonward.ibl")
require("simonward.nvim-tree")
require("simonward.telescope")
require("simonward.treesitter")
require("simonward.treesitter-ctx")

if sysname == "Darwin" then -- sysname defined in $NVIM_CONF/init.lua
	require("simonward.cmp")
	require("simonward.lsp")
end
