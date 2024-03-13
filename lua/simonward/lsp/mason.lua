local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

mason.setup({})

local servers = {
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
	"tsserver",
	"yamlls",
}

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
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
