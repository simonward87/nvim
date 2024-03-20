local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Auto-install
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Reload on file change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Use popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "solid" })
		end,
		prompt_border = "solid",
	},
})

return packer.startup(function(use)
	use("akinsho/bufferline.nvim") -- bufferline along top of window
	use("JoosepAlviste/nvim-ts-context-commentstring") -- simple code commenting
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }) -- file explorer
	use("lewis6991/gitsigns.nvim") -- git info in sign column
	use("lukas-reineke/indent-blankline.nvim") -- add guide rules to indentation
	use("mfussenegger/nvim-dap") -- debug adapter
	use("norcalli/nvim-colorizer.lua") -- hex code colourizer
	use("nvim-lua/plenary.nvim") -- lua function library (dependency for other plugs)
	use("nvim-lua/popup.nvim") -- An implementation of vim Popup API
	use("nvim-telescope/telescope.nvim") -- fuzzy finder
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context") -- pin code context (current block)
	use("nvim-treesitter/playground") -- view treesitter info
	use("tpope/vim-capslock") -- software capslock
	use("tpope/vim-commentary") -- comment stuff out
	use("tpope/vim-fugitive") -- git wrapper
	use("tpope/vim-surround") -- streamline surroundings workflow
	use("wbthomason/packer.nvim") -- Let packer manage itself
	use("windwp/nvim-ts-autotag") -- auto-close & auto-rename html tags
	use("windwp/nvim-autopairs") -- autopairs with cmp and treesitter integration

	-- Colorschemes
	use("axvr/photon.vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("cocopon/iceberg.vim")
	use("comfysage/twilight-moon")
	use("gosukiwi/vim-atom-dark")
	use("habamax/vim-habaurora")
	use("jacoborus/tender.vim")
	use("nelstrom/vim-mac-classic-theme")
	use("olivercederborg/poimandres.nvim")
	use("projekt0n/github-nvim-theme")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/gruvbox-material")

	-- Completion
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- complete neovim lua
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- snippet library
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- LSP
	if vim.loop.os_uname().sysname == "Darwin" then
		use("~/Work/projects/plugins/nvim/drift.nvim") -- simonward87/drift.nvim
		use("~/Work/projects/plugins/nvim/nameless.nvim")
		use("~/Work/projects/plugins/nvim/monoLemon.nvim")

		use("b0o/SchemaStore.nvim") -- schemastore catalog access
		use({
			"jay-babu/mason-null-ls.nvim", -- for formatters and linters
			requires = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		})
		use("neovim/nvim-lspconfig") -- enable LSP
		use("sago35/tinygo.vim") -- tinygo extension
		use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
		use("williamboman/mason.nvim") -- package manager
		use("williamboman/mason-lspconfig.nvim") -- package manager
	elseif vim.loop.os_uname().sysname == "Linux" then
		use("simonward87/drift.nvim")
	end


	-- Automatically set up configuration after cloning packer
	-- NOTE: must run after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
