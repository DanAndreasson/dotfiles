-- App bindings: cmd + number to launch or focus specific apps
local appBindings = {
	["1"] = "Google Chrome",
	["2"] = "Slack",
	["3"] = "Ghostty",
	["4"] = "Superhuman",
	["9"] = "Notion Calendar",
	["8"] = "Figma",
	["§"] = "Linear",
}

for key, appName in pairs(appBindings) do
	hs.hotkey.bind({ "cmd" }, key, function()
		local app = hs.application.get(appName)
		if app then
			app:activate()
			app:unhide()
			app:mainWindow():focus()
		else
			hs.application.launchOrFocus(appName)
		end
	end)
end
