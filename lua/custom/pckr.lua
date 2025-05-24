--# selene: allow(mixed_table)

local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.uv.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local pckr_ok, pckr = pcall(require, "pckr")
if not pckr_ok then
	print("Error loading plugin: pckr")
	return
end

vim.keymap.set("n", "<leader>up", function()
	vim.cmd("Pckr sync")
end, { noremap = true, silent = true })

if vim.uv.os_uname().sysname == "Darwin" then
	local plugins = "~/Work/projects/plugins/nvim/"
	pckr.add({
		plugins .. "k.nvim", -- Theme
		plugins .. "unnamed.nvim", -- Theme

		"b0o/SchemaStore.nvim", -- Schemastore catalog access
		{
			"jay-babu/mason-null-ls.nvim", -- Formatters and linters
			requires = {
				"mason-org/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		},
		"mason-org/mason-lspconfig.nvim", -- Package manager
		"mason-org/mason.nvim", -- Package manager
		"neovim/nvim-lspconfig", -- Enable LSP
		"sago35/tinygo.vim", -- Tinygo extension
		"tamago324/nlsp-settings.nvim", -- Json lsp config parser
	})
else
	pckr.add({
		"simonward87/k.nvim", -- Theme
	})
end

pckr.add({
	"JoosepAlviste/nvim-ts-context-commentstring", -- Code commenting
	{
		"L3MON4D3/LuaSnip", -- Snippet engine
		run = "make install_jsregexp",
	},
	"akinsho/bufferline.nvim", -- List buffers along top
	"hrsh7th/cmp-buffer", -- Buffer completions
	"hrsh7th/cmp-cmdline", -- Cmdline completions
	"hrsh7th/cmp-nvim-lsp", -- LSP completions
	"hrsh7th/cmp-nvim-lua", -- Neovim lua completions
	"hrsh7th/cmp-path", -- Path completions
	"hrsh7th/nvim-cmp", -- Completion
	"lewis6991/gitsigns.nvim", -- Sign column git info
	"lukas-reineke/indent-blankline.nvim", -- Indentation guide lines
	"mfussenegger/nvim-dap", -- Debug adapter
	"norcalli/nvim-colorizer.lua", -- Hex code colourizer
	"nvim-lua/popup.nvim", -- Popup API
	{
		"nvim-telescope/telescope.nvim", -- Extendable fuzzy finder
		requires = { "nvim-lua/plenary.nvim" },
	}, -- Fuzzy finder
	{
		"nvim-tree/nvim-tree.lua", -- File explorer tree
		requires = { "nvim-tree/nvim-web-devicons" },
	}, -- File explorer
	{
		"nvim-treesitter/nvim-treesitter", -- Treesitter configurations
		run = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-context", -- Pin code context
	"nvim-treesitter/playground", -- View treesitter info
	"rafamadriz/friendly-snippets", -- Snippet library
	"saadparwaiz1/cmp_luasnip", -- Snippet completions
	{
		"simondrake/gomodifytags", -- Manage field tags in structs
		requires = {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		},
	},
	"tpope/vim-capslock", -- Software capslock
	"tpope/vim-fugitive", -- Git wrapper
	"tpope/vim-surround", -- Streamline surroundings workflow
	"windwp/nvim-autopairs", -- Autopairs with cmp and treesitter integration
	"windwp/nvim-ts-autotag", -- Auto-close & auto-rename html tags
})

pckr.setup({
	autoremove = true,
	autoinstall = true,
})
