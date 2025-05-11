local M = {}

local float_opts = {
	border = "solid",
	max_width = 68,
	source = "always",
	style = "minimal",
}

M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = float_opts,
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover(float_opts)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help(float_opts)
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		local lsp_document_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = 0,
			group = lsp_document_highlight,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = 0,
			group = lsp_document_highlight,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
		})
	end
end

local function lsp_keymaps(bufnr)
	local opts = {
		buffer = bufnr,
		noremap = true,
		silent = true
	}

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	client.server_capabilities.document_formatting = false
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("Error loading cmp_nvim_lsp")
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
