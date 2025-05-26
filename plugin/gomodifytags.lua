local status_ok, gomodifytags = pcall(require, "gomodifytags")
if not status_ok then
	print("Error loading plugin: gomodifytags")
	return
end

gomodifytags.setup()
