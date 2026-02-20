local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", builtin.keymaps, { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", builtin.live_grep, { noremap = true, silent = true })

local actions = require("telescope.actions")

local opts = {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-u>"] = false,
				["<C-y>"] = actions.file_edit,
			},
		},
		path_display = { "smart" },
		prompt_prefix = " ",
		selection_caret = "  ",
	},
}

-- Apply ivy theme to defaults
-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes
local get_ivy_ok, theme_opts = pcall(require("telescope.themes").get_ivy, opts)
if get_ivy_ok then
	opts.defaults = vim.tbl_deep_extend("force", theme_opts, opts)
else
	print("Error loading function: telescope.themes.get_ivy")
end

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	print("Error loading plugin: telescope")
	return
end

telescope.setup(opts)
