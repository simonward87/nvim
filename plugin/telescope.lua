local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local function map(mode, lhs, rhs, opts)
	local defaults = { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts or defaults)
end

-- Themes: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes
map("n", "<leader>f", function()
	builtin.find_files(themes.get_ivy())
end)

map("n", "<leader>h", function()
	builtin.help_tags(themes.get_ivy())
end)

map("n", "<leader>m", function()
	builtin.keymaps(themes.get_ivy())
end)

map("n", "<c-t>", function()
	builtin.live_grep(themes.get_ivy())
end)

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = "  ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-u>"] = false,
				["<C-y>"] = actions.file_edit,
			},
		},
	},
})
