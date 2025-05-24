local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	print("Error loading plugin: mason")
	return
end

vim.keymap.set("n", "<leader>um", function()
	vim.cmd("Mason")
end, { noremap = true, silent = true })

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "",
			package_uninstalled = "✗",
		},
	},
})

-- Config list
-- :h lspconfig-all
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls

local ensure_installed = {
	"arduino_language_server",
	"astro",
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
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

for _, server in ipairs(ensure_installed) do
	local opts = {}

	local handlers_ok, handlers = pcall(require, "custom.lsp.handlers")
	if handlers_ok then
		opts = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
		}
	else
		print("Error loading config: custom/lsp/handlers.lua")
	end

	server = vim.split(server, "@")[1]

	local settings_ok, settings = pcall(require, "custom.lsp.settings." .. server)
	if settings_ok then
		opts = vim.tbl_deep_extend("force", settings, opts)
	end

	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	print("Error loading plugin: mason-lspconfig")
	return
end

-- All setups are handled manually via mason, mason_lspconfig is being used
-- only to automate server installation
-- https://github.com/mason-org/mason-lspconfig.nvim?tab=readme-ov-file#table-of-contents
mason_lspconfig.setup({
	automatic_enable = false,
	ensure_installed = ensure_installed,
})
