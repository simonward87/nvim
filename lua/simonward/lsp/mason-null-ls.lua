local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

-- Manual source setup to prevent overlap between different sources
-- (e.g. two formatters both trying to format on save, etc.)
null_ls.setup({
	debug = false,
	sources = {
		diagnostics.buf,
		diagnostics.commitlint,
		diagnostics.dotenv_linter,
		diagnostics.gitlint,
		diagnostics.golangci_lint,
		diagnostics.proselint,
		diagnostics.selene,
		diagnostics.staticcheck,
		diagnostics.vacuum,
		diagnostics.tidy,
		diagnostics.yamllint,
		diagnostics.zsh,

		formatting.buf,
		formatting.clang_format,
		formatting.prettierd.with({
			filetypes = {
				"css",
				"graphql",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"scss",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
			},
			extra_args = { "--jsx-single-quote" },
			extra_filetypes = { "astro", "svelte" },
		}),
		formatting.sqlfluff.with({
			-- args defines the default execution command
			args = {
				"fix",
				"--disable-progress-bar",
				"--nocolor",
				"-",
			},
			-- extra_args defines optional settings
			extra_args = { "--dialect", "postgres" },
		}),
		formatting.stylua,
		formatting.tidy,
	},
	on_attach = function()
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end,
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

-- Automatic installation for sources is handled by mason_null_ls, but
-- automatic setup is disabled to prevent overlap between sources.
-- https://github.com/jay-babu/mason-null-ls.nvim?tab=readme-ov-file#default-configuration
mason_null_ls.setup({
	automatic_installation = true,
	handlers = {
		-- overwrites default handler
		function() end,
	},
	ensure_installed = {
		"buf", -- also try protolint
		"chrome-debug-adapter",
		"clang_format",
		"cmake_lint",
		"commitlint",
		"delve",
		"dotenv_linter",
		"firefox-debug-adapter",
		"gitlint",
		"go-debug-adapter",
		"golangci_lint", -- also try revive
		"js-debug-adapter",
		"node-debug2-adapter",
		"prettierd",
		"proselint",
		"selene",
		"sqlfluff",
		"staticcheck",
		"tidy",
		"vacuum",
		"yamllint",
		"zsh",
	},
})
