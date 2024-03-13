local c = "drift-darker"
local custom_config = pcall(require, "simonward.colors." .. c)

if not custom_config then
	vim.cmd("colorscheme " .. c)
end

if c == "gruvbox_material" then
	vim.g.gruvbox_material_palette = "mix"
end
