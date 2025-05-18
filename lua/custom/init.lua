require("custom.globals")
require("custom.options")
require("custom.filetypes")
require("custom.keymaps")
require("custom.autocmd")
require("custom.pckr")

vim.cmd("colorscheme k-dark")

if vim.uv.os_uname().sysname == "Darwin" then
	require("custom.lsp")
end
