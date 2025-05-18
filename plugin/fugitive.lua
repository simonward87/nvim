local function map(mode, lhs, rhs, opts)
	local defaults = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts or defaults)
end

map("n", "<leader>gs", function()
	vim.cmd("Git")
end)

map("n", "<leader>gc", function()
	vim.cmd("Git commit -v -q")
end)

map("n", "<leader>gd", function()
	vim.cmd("Git diff")
end)

map("n", "<leader>gl", function()
	vim.cmd("Git log")
end)

map("n", "<leader>gp", function()
	vim.cmd("Git push")
end)
