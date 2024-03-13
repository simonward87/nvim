local status_ok, comment = pcall(require, "ts_context_commentstring")
if not status_ok then
	return
end

comment.setup({
	enable_autocmd = false,
})
