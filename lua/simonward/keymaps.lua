local function map(mode, l, r, opts)
	local defaults = { noremap = true, silent = true }
	opts = opts or defaults
	vim.keymap.set(mode, l, r, opts)
end

-- Navigation
map("n", "<Left>", "<C-w>h") -- Moves to left window
map("n", "<Right>", "<C-w>l") -- Moves to right window
map("n", "<Down>", "<C-w>j") -- Moves to window below
map("n", "<Up>", "<C-w>k") -- Moves to window above
map("n", "<C-n>", ":bn<CR>") -- Moves to next buffer
map("n", "<C-p>", ":bp<CR>") -- Moves to previous buffer
map("n", "<leader>d", ":bd<CR>") -- Deletes current buffer
map("n", "tt", ":tab split<CR>") -- Opens current buffer in new tab
map("n", "<leader>nw", ":noa w<CR>") -- Saves without formatting

-- Shift text blocks vertically
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("n", "<leader>j", ":move .+1<CR>==")
map("n", "<leader>k", ":move .-2<CR>==")

-- Undo breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Auto-centering
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Toggle ColorColumn
map("n", "<leader>cc", [[:execute "set cc=" . (&colorcolumn == "" ? "74" : "")<CR>]])

-- Git
map("n", "<leader>gs", ":G<CR>")
map("n", "<leader>gc", ":G commit -v -q<CR>")
map("n", "<leader>gd", ":G diff<CR>")
map("n", "<leader>gl", ":G log<CR>")
map("n", "<leader>gp", ":G push<CR>")

-- Telescope
map(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>"
)
map("n", "<c-t>", "<cmd>Telescope live_grep<CR>")

-- Nvim-tree
map("n", "-", ":NvimTreeToggle<CR>")

-- Packages
map("n", "<leader>um", ":Mason<CR>")
map("n", "<leader>up", ":PackerSync<CR>")

-- Commands
map("n", "<leader>ll", ":!gls -Fho --group-directories-first<CR>")
map("n", "<leader>la", ":!gls -AFho --group-directories-first<CR>")

-- Under cursor TS capture group
map("n", "<C-e>", ":TSHighlightCapturesUnderCursor<CR>")

-- Markdown convenience maps
map("n", "<leader>cl", "viw<esc>bi[<esc>ea]()<esc>i") -- Markdown format word under cursor as url, and enter INSERT
map("v", "<leader>cl", "<esc>`>a]<esc>`<<esc>i[<esc>%a()<esc>i") -- Markdown format selection as url, and enter INSERT
map("n", "<leader>cL", "viw<esc>bi[<esc>ea](<C-r>+)<esc>") -- Markdown format word under cursor as url, and populate from unnamed register
map("v", "<leader>cL", "<esc>`>a]<esc>`<<esc>i[<esc>%a(<C-r>+)<esc>") -- Markdown format selection as url, and populate from unnamed register
map("n", "<leader>cb", "viw<esc>bi**<esc>ea**<esc>") -- Markdown format word under cursor as bold
map("v", "<leader>cb", "<esc>`>a**<esc>`<<esc>i**<esc>`><esc>ll") -- Markdown format selection as bold
map("n", "<leader>mh", [[:%s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]]) -- Convert all markdown bold and code to HTML bold and code
map("v", "<leader>mh", [[:s/\v\`([^`]+)\`/<code>\1<\/code>/g<CR>gv:s/\v\*{2}([^*]+)\*{2}/<strong>\1<\/strong>/g<CR>]]) -- Convert selection markdown bold and code to HTML bold and code

-- Go convenience maps
map("n", "<leader>t", 'vi}:norm A `json:""`<CR>vi}:lua vim.lsp.buf.format()<CR>`<$hi') -- Add empty json struct tags to all fields inside struct under cursor, and enter INSERT

-- Convenience abbreviations
vim.cmd("iabbrev @@ 39803787+simonward87@users.noreply.github.com")

-- Spell abbreviations
vim.cmd("iabbrev fucntion function")
vim.cmd("iabbrev reutrn return")
vim.cmd("iabbrev seperate separate")
vim.cmd("iabbrev teh the")

-- Hide IncSearch on entering INSERT (Paired autocmds: PCLoFRvAUuTj)
map("i", "<Esc>", "<Esc>:nohlsearch<bar>set nolazyredraw<CR>")
map("i", "<C-c>", "<C-c>:nohlsearch<bar>set nolazyredraw<CR>")

-- Clear cmd output
map("n", "<Esc>", [[:echo " "<CR>]])
