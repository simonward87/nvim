vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true

local function map(mode, lhs, rhs, opts)
	local defaults = { noremap = true, silent = true }
	opts = vim.tbl_extend("force", defaults, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>cb", "viw<esc>bi**<esc>ea**<esc>", { desc = "Format word under cursor in bold" })
map("v", "<leader>cb", "<esc>`>a**<esc>`<<esc>i**<esc>`><esc>ll", { desc = "Format selection in bold" })

map(
	"n",
	"<leader>cL",
	"viw<esc>bi[<esc>ea](<C-r>+)<esc>",
	{ desc = "Format word under cursor as url, and populate from unnamed register" }
)

map(
	"v",
	"<leader>cL",
	"<esc>`>a]<esc>`<<esc>i[<esc>%a(<C-r>+)<esc>",
	{ desc = "Format selection as url, and populate from unnamed register" }
)

map(
	"n",
	"<leader>cl",
	"viw<esc>bi[<esc>ea]()<esc>i",
	{ desc = "Format word under cursor as url, and enter insert mode" }
)

map(
	"v",
	"<leader>cl",
	"<esc>`>a]<esc>`<<esc>i[<esc>%a()<esc>i",
	{ desc = "Format selection as url, and enter insert mode" }
)

map(
	"n",
	"<leader>mh",
	[[:%s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]],
	{ desc = "Convert all bold and code to HTML bold and code" }
)

map(
	"v",
	"<leader>mh",
	[[:s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]],
	{ desc = "Convert selection bold and code to HTML bold and code" }
)
