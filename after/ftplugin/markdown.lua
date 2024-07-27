vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true

local function map(mode, l, r, opts)
	local defaults = { noremap = true, silent = true, buffer = 0 }
	opts = opts or defaults
	vim.keymap.set(mode, l, r, opts)
end

-- Format word under cursor as bold
map("n", "<leader>cb", "viw<esc>bi**<esc>ea**<esc>")
-- Format selection as bold
map("v", "<leader>cb", "<esc>`>a**<esc>`<<esc>i**<esc>`><esc>ll")

-- Format word under cursor as url, and populate from unnamed register
map("n", "<leader>cL", "viw<esc>bi[<esc>ea](<C-r>+)<esc>")
-- Format selection as url, and populate from unnamed register
map("v", "<leader>cL", "<esc>`>a]<esc>`<<esc>i[<esc>%a(<C-r>+)<esc>")

-- Format word under cursor as url, and enter INSERT
map("n", "<leader>cl", "viw<esc>bi[<esc>ea]()<esc>i")
-- Format selection as url, and enter INSERT
map("v", "<leader>cl", "<esc>`>a]<esc>`<<esc>i[<esc>%a()<esc>i")

-- Convert all bold and code to HTML bold and code
map("n", "<leader>mh", [[:%s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]])
-- Convert selection bold and code to HTML bold and code
map("v", "<leader>mh", [[:s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]])
