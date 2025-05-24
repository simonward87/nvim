local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	print("Error loading plugin: null-ls")
	return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local ensure_installed = {
	"buf",
	"checkmake",
	"chrome-debug-adapter",
	"clang_format",
	"cmake_lint",
	"delve",
	"dotenv_linter",
	"firefox-debug-adapter",
	"gitlint",
	"go-debug-adapter",
	"golangci_lint", -- also try revive
	"hadolint",
	"js-debug-adapter",
	"node-debug2-adapter",
	"prettierd",
	"pylint",
	"selene",
	"sqlfluff",
	"staticcheck",
	"yamllint",
	"zsh",
}

-- Manual source setup to prevent overlap between different sources (e.g. two
-- formatters both trying to format on save)
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#options
null_ls.setup({
	sources = {
		diagnostics.buf,
		diagnostics.checkmake,
		diagnostics.dotenv_linter,
		diagnostics.gitlint,
		diagnostics.golangci_lint,
		diagnostics.hadolint,
		diagnostics.pylint,
		diagnostics.selene,
		diagnostics.staticcheck,
		diagnostics.yamllint,
		diagnostics.zsh,
		formatting.buf,
		formatting.clang_format,
		formatting.prettierd.with({ extra_filetypes = { "astro", "svelte" } }),
		formatting.sqlfluff,
		formatting.stylua,
	},
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("FormatBufferOnWrite", { clear = true }),
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	print("Error loading plugin: mason-null-ls")
	return
end

-- Automatic installation for sources is handled by mason_null_ls, but
-- automatic setup is disabled to prevent overlap between sources.
-- https://github.com/jay-babu/mason-null-ls.nvim?tab=readme-ov-file#default-configuration
mason_null_ls.setup({
	automatic_installation = true,
	handlers = {
		-- disables automatic setup of null-ls sources
		function() end,
	},
	ensure_installed = ensure_installed,
})
