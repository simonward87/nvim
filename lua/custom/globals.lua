vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python3_host_prog = vim.fn.expand("~/.local/venvs/neovim/bin/python")
vim.g.ruby_host_prog = "/usr/bin/ruby"

if vim.uv.os_uname().sysname == "Darwin" then
	vim.g.node_host_prog = vim.fn.expand("$N_PREFIX/lib/node_modules/neovim")
	vim.g.perl_host_prog = vim.fn.expand("$HOMEBREW_PREFIX/bin/perl")
elseif vim.uv.os_uname().sysname == "Linux" then
	vim.g.node_host_prog = "/usr/local/lib/node_modules/neovim/bin/cli.js"
	vim.g.perl_host_prog = "/usr/bin/perl"
end
