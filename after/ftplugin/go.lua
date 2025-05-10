vim.opt_local.expandtab = false

vim.keymap.set("n", "<leader>st", function()
	require("gomodifytags").GoAddTags("json")
end, { noremap = true, silent = true, buffer = 0 })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("UpdateImports", { clear = true }),
	callback = function()
		vim.cmd('silent exe "!goimports -w %:p"')
	end,
})
