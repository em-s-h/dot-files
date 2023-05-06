local status, auto_save = pcall(require, "auto-save")
if not status then
	print("auto-save is not installed!")
	return
end

auto_save.setup({
	trigger_events = { "FocusLost", "ExitPre", "CursorHold" },
})
