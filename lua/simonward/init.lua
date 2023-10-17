vim.loader.enable()

require("simonward.options")
require("simonward.autocommands")
require("simonward.keymaps")
require("simonward.plugins")
require("simonward.colorscheme")

require("simonward.autopairs")
require("simonward.bufferline")
require("simonward.cmp")
require("simonward.colorizer")
require("simonward.comment")
-- require("simonward.fidget")
require("simonward.gitsigns")
require("simonward.gopher")
require("simonward.indent")

if vim.loop.os_uname().sysname == "Darwin" then
	require("simonward.lsp")
end

require("simonward.nvim-tree")
require("simonward.telescope")
require("simonward.treesitter")
require("simonward.treesitter-ctx")
require("simonward.zenmode")
