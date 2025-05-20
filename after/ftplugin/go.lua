-- Kebab-case isn't used in Go - having '-' set as a keyword character causes
-- incoming channel syntax to be considered different to the plain identifier
-- when using builtin substitute. For example, search for 'ctx' would not find
-- the incoming channel identifier:
-- ctx := context.Background() // fine
-- err := <-ctx.Done()         // opaque

vim.opt_local.expandtab = false
vim.opt_local.iskeyword:remove("-")

vim.keymap.set("n", "<leader>st", function()
	require("gomodifytags").GoAddTags("json")
end, { noremap = true, silent = true, buffer = 0 })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("UpdateImports", { clear = true }),
	callback = function()
		vim.cmd('silent exe "!goimports -w %:p"')
	end,
})
