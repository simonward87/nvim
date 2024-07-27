-- Maps custom / niche extensions to their underlying filetype
vim.filetype.add({
	extension = {
		gohtml = "html",
		templ = "templ",
		tmpl = "html",
	},
	filename = {
		[".envrc"] = "sh",
		[".sqlfluff"] = "toml",
		["Caddyfile"] = "caddyfile",
		["gitconfig"] = "gitconfig",
		["go.mod"] = "gomod",
		["zprofile"] = "zsh",
	},
	pattern = {
		["Dockerfile.*"] = "dockerfile",
	},
})
