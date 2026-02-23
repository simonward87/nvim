local M = {}

local api_status_ok, api = pcall(require, "nvim-tree.api")
if not api_status_ok then
	print("Error loading plugin: nvim-tree.api")
	return
end

local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
	print("Error loading plugin: nvim-tree")
	return
end

function M.on_attach(bufnr)
	local set = vim.keymap.set

	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function nop(message)
		return function()
			print(message)
		end
	end

	-- sets up default mappings (:help nvim-tree-mappings-default)
	api.map.on_attach.default(bufnr)

	set("n", "-", api.tree.close, opts("Close"))
	set("n", "?", api.tree.toggle_help, opts("Help"))
	set("n", "d", nop("Delete with 'D'"), opts("Binding Unset"))
	set("n", "H", api.filter.dotfiles.toggle, opts("Toggle Filter: Dotfiles"))
	set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	set("n", "l", api.node.open.edit, opts("Edit"))
	set("n", "q", nop("Close with '-'"), opts("Binding Unset"))
end

nvim_tree.setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	disable_netrw = true,
	filters = {
		custom = {
			"^.git$",
			"^node_modules$",
		},
	},
	on_attach = M.on_attach,
	renderer = {
		add_trailing = true,
		icons = {
			glyphs = { -- :help nvim_tree.config.renderer.icons.glyphs
				git = {
					deleted = "󰩺", -- default: 
					ignored = "󰜺", -- default: ◌
					renamed = "󰓼", -- default: ➜
					staged = "󰄬", -- default: ✓
					unmerged = "󰃸", -- default: 
					unstaged = "󰃨", -- default: ✗ alt: 󰑐 󰋚 󰀚
					untracked = "󰐕", -- default: ★  alt: 󰽤 󰝵
				},
			},
			diagnostics_placement = "after",
		},
		indent_markers = { enable = true },
		root_folder_label = false,
		special_files = { "README.md", "readme.md" },
	},
	view = {
		number = true,
		relativenumber = true,
		signcolumn = "auto",
		width = 40,
	},
})

-- toggle visibiltiy when tree is closed
vim.keymap.set("n", "-", api.tree.toggle, { noremap = true, silent = true })

-- auto-open when target is a directory
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		local directory = vim.fn.isdirectory(data.file) == 1

		if not directory then
			return
		end

		vim.cmd.cd(data.file)
		api.tree.open()
	end,
})
