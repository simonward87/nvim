-- Maps custom / niche extensions to their underlying filetype
vim.filetype.add({
	extension = {
		envrc = "sh",
		gohtml = "html",
		sqlfluff = "toml",
		sqliterc = "sh",
		templ = "templ",
		tmpl = "html",
	},
	filename = {
		["Caddyfile"] = "caddyfile",
		["gitconfig"] = "gitconfig",
		["sqliterc"] = "sh",
		["zprofile"] = "zsh",
	},
	pattern = {
		[".env.*"] = "sh",
		["Dockerfile.*"] = "dockerfile",
	},
})
