local status_ok, comment = pcall(require, "ts_context_commentstring")
if not status_ok then
	return
end

comment.setup({
	enable_autocmd = false,
})

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
local get_option = vim.filetype.get_option

vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end
