local status_ok, ctx_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
	print("Error loading plugin: ts_context_commentstring")
	return
end

ctx_commentstring.setup({
	enable_autocmd = false,
})

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
local get_option = vim.filetype.get_option

vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end
