-- Custom file types
local function fileTypeLink(matchPattern, filetype)
    vim.cmd("autocmd BufRead,BufNewFile " .. matchPattern .. " setfiletype " .. filetype)
end

fileTypeLink("*.gohtml", "html")
fileTypeLink("*.templ", "templ")
fileTypeLink("*.tmpl", "html")
fileTypeLink("Caddyfile", "caddyfile")
fileTypeLink("Dockerfile.*", "dockerfile")
fileTypeLink("go.mod", "gomod")
fileTypeLink("zprofile", "zsh")

-- File type options
local function fileTypeOpts(filetype, opts)
    vim.cmd("autocmd FileType " .. filetype .. " setlocal " .. opts)
end

fileTypeOpts("caddyfile", "noexpandtab softtabstop=0 shiftwidth=4 tabstop=4")
fileTypeOpts("gitcommit", "wrap spell textwidth=72")
fileTypeOpts("go", "noexpandtab")
fileTypeOpts("lua", "noexpandtab")
fileTypeOpts("make", "noexpandtab softtabstop=0 shiftwidth=8 tabstop=8")
fileTypeOpts("markdown", "wrap linebreak spell")
fileTypeOpts("prisma", "cindent")

-- 2-space indentation
local filetypes = {
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

for i = 1, #filetypes do
    fileTypeOpts(filetypes[i], "softtabstop=2 shiftwidth=2 tabstop=2")
end

-- :H <topic> for full-screen help
vim.cmd("command! -nargs=1 -complete=help H h <args> | only")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight selection on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Hide IncSearch on entering INSERT
autocmd("InsertEnter", {
	group = augroup("IncSearchHideOnInsert", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("setlocal nohlsearch")
	end,
})
autocmd("InsertLeave", {
	group = augroup("IncSearchShowOnEsc", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("setlocal hlsearch lazyredraw")
	end,
})

-- Tidy imports on .go file save
autocmd("BufWritePost", {
	group = augroup("TidyGoImports", { clear = true }),
	pattern = "*.go",
	callback = function()
		vim.cmd('silent exe "!goimports -w %:p"')
	end,
})

-- Clear command line output after CursorHold timeout
autocmd("CursorHold", {
	group = augroup("ClearCmdAfterTimeout", { clear = true }),
	pattern = "*",
	callback = function()
		print(" ")
	end,
})
