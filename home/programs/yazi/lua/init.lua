-------------------------------------------
-- plugins
-------------------------------------------
require("full-border"):setup({
	type = ui.Border.ROUNDED, -- PLAIN | ROUNDED
})

require("git"):setup()

require("smart-enter"):setup({
	open_multi = true,
})

-------------------------------------------
-- Show username and hostname in header
-------------------------------------------
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end

	if ya.user_name() == "root" then
		return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ": "):fg("red")
	else
		return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ": "):fg("blue")
	end
end, 500, Header.LEFT)

-------------------------------------------
-- Show user/group in status bar
-------------------------------------------
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"):fg("magenta"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	})
end, 500, Status.RIGHT)

-------------------------------------------
-- Show symbolic link target in status bar
-------------------------------------------
function Status:name()
	local h = cx.active.current.hovered
	if not h then
		return ""
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
		return ui.Line(" " .. h.name .. linked):fg("green")
	end

	return ui.Line(" " .. h.name)
end
