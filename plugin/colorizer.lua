local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	print("Error loading plugin: colorizer")
	return
end

colorizer.setup({ "*" }, { names = false })
