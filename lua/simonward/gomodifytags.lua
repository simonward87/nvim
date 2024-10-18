local status_ok, gomodifytags = pcall(require, "gomodifytags")
if not status_ok then
	return
end

gomodifytags.setup({
	-- transformation = "snakecase"
})
