local function map(mode, lhs, rhs, opts)
	local defaults = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts or defaults)
end

map("n", "<C-n>", ":bn<CR>") -- Move to next buffer
map("n", "<C-p>", ":bp<CR>") -- Move to previous buffer
map("n", "<leader>d", ":bd<CR>") -- Delete current buffer
map("n", "tt", ":tab split<CR>") -- Open current buffer in new tab
map("n", "<leader>nw", ":noa w<CR>") -- Save without autoformat
map("n", "<Esc>", print) -- Clear cmd output

map("x", "J", ":move '>+1<CR>gv-gv") -- Shift block down
map("x", "K", ":move '<-2<CR>gv-gv") -- Shift block up
map("n", "<leader>j", ":move .+1<CR>==") -- Shift line down
map("n", "<leader>k", ":move .-2<CR>==") -- Shift line up

map("i", ",", ",<c-g>u") -- Undo breakpoint ","
map("i", ".", ".<c-g>u") -- Undo breakpoint "."
map("i", "!", "!<c-g>u") -- Undo breakpoint "!"
map("i", "?", "?<c-g>u") -- Undo breakpoint "?"

-- Auto-center buffer navigation
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<leader>cc", function() -- Toggle line length indicator
	vim.cmd([[execute "set cc=" . (&colorcolumn == "" ? "80" : "")]])
end)

-- Treesitter group info
map("n", "<C-e>", vim.show_pos, { noremap = true, silent = false })

-- Lsp
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "<C-k>", vim.lsp.buf.signature_help)
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gl", vim.diagnostic.open_float)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)

-- Hide IncSearch on exiting insert. nohlsearch doesn't work in an autocommand,
-- because the highlighting state is saved and restored when executing
-- autocommands. This map works in tandem with autocmd ResetIncSearchOnEsc.
map("i", "<Esc>", "<Esc>:nohlsearch<bar>set nolazyredraw<CR>")
map("i", "<C-c>", "<C-c>:nohlsearch<bar>set nolazyredraw<CR>")

vim.cmd("iabbrev @@ 39803787+simonward87@users.noreply.github.com")
vim.cmd("iabbrev fucntion function")
vim.cmd("iabbrev reutrn return")
vim.cmd("iabbrev seperate separate")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev dont don't")
