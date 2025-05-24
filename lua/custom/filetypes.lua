-- Maps custom / niche extensions to their underlying filetype
vim.filetype.add({
	extension = {
		envrc = "sh",
		gohtml = "html",
		mdx = "mdx",
		sqlfluff = "toml",
		sqliterc = "sh",
		templ = "templ",
		tmpl = "html",
	},
	filename = {
		["Caddyfile"] = "caddyfile",
		["clang-format"] = "yaml",
		gitconfig = "gitconfig",
		sqlfluff = "toml",
		sqliterc = "sh",
		zprofile = "zsh",
	},
	pattern = {
		[".env.*"] = "sh",
		["Dockerfile.*"] = "dockerfile",
	},
})
