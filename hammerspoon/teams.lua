-- luacheck: globals hs

local teams = {}

function teams.setup(super_key)
	-- Send the configured shortcut directly to Teams without scanning its UI.
	local function sendTeamsShortcut(key)
		local app = hs.application.get("com.microsoft.teams2")
		if not app then
			return
		end
		-- The app target routes events to Teams rather than the active application.
		hs.eventtap.keyStroke(super_key, key, 0, app)
	end

	-- Fixed macOS keycodes keep these shortcuts independent of the input source.
	hs.hotkey.bind(super_key, 0, function() -- A: microphone
		sendTeamsShortcut(0)
	end)

	hs.hotkey.bind(super_key, 9, function() -- V: camera
		sendTeamsShortcut(9)
	end)

	hs.hotkey.bind(super_key, 4, function() -- H: leave call
		sendTeamsShortcut(4)
	end)

	hs.hotkey.bind(super_key, 40, function() -- K: raise/lower hand
		sendTeamsShortcut(40)
	end)
end

return teams
