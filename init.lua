vim.g["loaded_netrw"] = 1
vim.g["loaded_netrwPlugin"] = 1
vim.g["skip_ts_context_commentstring_module"] = true

if vim.loop.os_uname().sysname == "Darwin" then
	vim.g["loaded_python3_provider"] = 0 -- disabled as not functional

	vim.g["perl_host_prog"] = vim.fn.expand("$HOMEBREW_PREFIX/bin/perl")
	vim.g["ruby_host_prog"] = "/usr/bin/ruby"
	vim.g["node_host_prog"] = vim.fn.expand("$N_PREFIX/lib/node_modules/neovim")
elseif vim.loop.os_uname().sysname == "Linux" then
	vim.g["perl_host_prog"] = "/usr/bin/perl"
	vim.g["python3_host_prog"] = "/usr/bin/python3"
	vim.g["ruby_host_prog"] = "/usr/bin/ruby"
	vim.g["node_host_prog"] =  "/usr/local/lib/node_modules/neovim"
end

require("simonward")
