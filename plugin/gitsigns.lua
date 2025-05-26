local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print("Error loading plugin: gitsigns")
	return
end

gitsigns.setup({
	-- culhl = true,
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(_bufnr)
		vim.keymap.set("n", "<leader>ts", gitsigns.toggle_linehl, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { noremap = true, silent = true })
	end,
})
