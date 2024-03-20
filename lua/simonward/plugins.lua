-- Auto-install
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

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
	if vim.loop.os_uname().sysname == "Darwin" then
		use("~/Work/projects/plugins/nvim/drift.nvim")
		use("~/Work/projects/plugins/nvim/nameless.nvim")
		use("~/Work/projects/plugins/nvim/monoLemon.nvim")

		use("b0o/SchemaStore.nvim") -- Schemastore catalog access
		use({
			"jay-babu/mason-null-ls.nvim", -- Formatters and linters
			requires = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		})
		use("neovim/nvim-lspconfig") -- Enable LSP
		use("sago35/tinygo.vim") -- Tinygo extension
		use("tamago324/nlsp-settings.nvim") -- Json lsp config parser
		use("williamboman/mason.nvim") -- Package manager
		use("williamboman/mason-lspconfig.nvim") -- Package manager
	else
		use("simonward87/drift.nvim")
	end

	use("JoosepAlviste/nvim-ts-context-commentstring") -- Code commenting
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("akinsho/bufferline.nvim") -- List buffers along top
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-cmdline") -- Cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- Neovim lua completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/nvim-cmp") -- Completion
	use("lewis6991/gitsigns.nvim") -- Sign column git info
	use("lukas-reineke/indent-blankline.nvim") -- Indentation guide lines
	use("mfussenegger/nvim-dap") -- Debug adapter
	use("norcalli/nvim-colorizer.lua") -- Hex code colourizer
	use("nvim-lua/popup.nvim") -- Popup API
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}) -- Fuzzy finder
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	}) -- File explorer
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context") -- Pin code context (current block)
	use("nvim-treesitter/playground") -- View treesitter info
	use("rafamadriz/friendly-snippets") -- Snippet library
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions
	use("tpope/vim-capslock") -- Software capslock
	use("tpope/vim-commentary") -- Comment stuff out
	use("tpope/vim-fugitive") -- Git wrapper
	use("tpope/vim-surround") -- Streamline surroundings workflow
	use("wbthomason/packer.nvim") -- Let packer manage itself
	use("windwp/nvim-autopairs") -- Autopairs with cmp and treesitter integration
	use("windwp/nvim-ts-autotag") -- Auto-close & auto-rename html tags

	-- Automatically set up configuration after cloning packer
	-- NOTE: must run after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
