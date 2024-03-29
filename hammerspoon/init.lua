-- luacheck: globals hs

-- Generated by ChatGPT

-- Move the mouse to the center of the currently focused window
hs.hotkey.bind({ "cmd", "ctrl", "alt" }, "D", function()
	-- Get the currently focused window
	local win = hs.window.focusedWindow()

	-- If there is a focused window then proceed
	if win then
		-- Get the frame details of the window
		local f = win:frame()

		-- Calculate the center point of the window
		local center = { x = f.x + f.w / 2, y = f.y + f.h / 2 }

		-- Move the mouse to the center of the window
		hs.mouse.absolutePosition(center)
	end
end)

-- Move the mouse cursor between monitors.
-- Keep track of the current screen index
local currentScreenIndex = 1
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "N", function()
	-- Get all screens
	local screens = hs.screen.allScreens()

	-- Get the current screen
	local currentScreen = screens[currentScreenIndex]

	-- Get the center of the current screen
	local center = currentScreen:fullFrame().center

	-- Move the mouse to the center of the current screen
	hs.mouse.absolutePosition(center)

	-- Increment the screen index
	currentScreenIndex = currentScreenIndex + 1

	-- If we've gone past the end of the list, wrap around to the beginning
	if currentScreenIndex > #screens then
		currentScreenIndex = 1
	end
end)

-- Move the mouse to the center of the focused window, switch to the next space, and return the mouse to its initial position
hs.hotkey.bind({}, "F17", function()
	local win = hs.window.focusedWindow()
	if win then
		local initialPos = hs.mouse.absolutePosition()
		local screen = win:screen()
		if not hs.geometry.isPointInRect(initialPos, screen:fullFrame()) then
			hs.mouse.absolutePosition(screen:frame().center)
		end
		hs.timer.doAfter(0.02, function()
			hs.mouse.absolutePosition(initialPos)
		end)
	end
end)
