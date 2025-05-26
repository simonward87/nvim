local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	print("Error loading plugin: nvim-ts-autotag")
	return
end

autotag.setup({
	opts = {
		-- Defaults: https://github.com/windwp/nvim-ts-autotag#setup
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})
