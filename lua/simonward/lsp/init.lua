local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("simonward.lsp.mason")
require("simonward.lsp.mason-null-ls")
require("simonward.lsp.handlers").setup()
