vim.opt_local.expandtab = false

vim.keymap.set(
	"n",
	"<leader>st",
	"<cmd>lua require'gomodifytags'.GoAddTags('json')<CR>",
	{ noremap = true, silent = true, buffer = 0 }
)
