-- :H <topic> for full-screen help
vim.cmd("command! -nargs=1 -complete=help H h <args> | only")

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local two_space_indented_filetypes = {
	"astro",
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"json",
	"less",
	"markdown",
	"prisma",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	"vue",
	"yaml",
}

for _, filetype in ipairs(two_space_indented_filetypes) do
	create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			vim.opt_local.shiftwidth = 2
			vim.opt_local.softtabstop = 2
			vim.opt_local.tabstop = 2
		end,
	})
end

create_autocmd("TextYankPost", {
	group = create_augroup("HighlightSelectionOnYank", { clear = true }),
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 320,
		})
	end,
})

create_autocmd("InsertEnter", {
	group = create_augroup("HideIncSearchOnInsert", { clear = true }),
	callback = function()
		print("")
		vim.opt_local.hlsearch = false
	end,
})

create_autocmd("InsertLeave", {
	group = create_augroup("ResetIncSearchOnEsc", { clear = true }),
	callback = function()
		vim.opt_local.hlsearch = true
		vim.opt_local.lazyredraw = true
	end,
})

create_autocmd("CursorHold", {
	group = create_augroup("ClearCmdOutputAfterTimeout", { clear = true }),
	callback = function()
		print("")
	end,
})
