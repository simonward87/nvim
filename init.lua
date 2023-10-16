vim.g["loaded_perl_provider"] = 0
vim.g["loaded_netrw"] = 1
vim.g["loaded_netrwPlugin"] = 1

if vim.loop.os_uname().sysname == "Darwin" then
	vim.g["python3_host_prog"] = "/opt/homebrew/bin/python3"
else
	vim.g["python3_host_prog"] = "/usr/bin/python3"
end

require("simonward")
