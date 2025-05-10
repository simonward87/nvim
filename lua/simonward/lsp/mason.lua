local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

mason.setup({})

local ensure_installed = {
	"arduino_language_server",
	"astro",
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"denols",
	"docker_compose_language_service",
	"dockerls",
	"gopls",
	"graphql",
	"html",
	"jqls",
	"jsonls",
	"lua_ls",
	"marksman",
	"prismals",
	"pyright",
	"rust_analyzer",
	"svelte",
	"tailwindcss",
	"templ",
	"ts_ls",
}

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	automatic_enable = false,
	automatic_installation = true,
	ensure_installed = ensure_installed,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(ensure_installed) do
	local opts = {
		on_attach = require("simonward.lsp.handlers").on_attach,
		capabilities = require("simonward.lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "simonward.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
