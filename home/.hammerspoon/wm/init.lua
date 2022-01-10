local spaces = require("hs._asm.undocumented.spaces")
local hhtwm = require("hhtwm")
local cache = { hhtwm = hhtwm }
local module = { cache = cache }

hs.ipc.cliInstall()

-- grabs screen with active window, unless it's Finder's desktop
-- then we use mouse position
local activeScreen = function()
	local activeWindow = hs.window.focusedWindow()

	if activeWindow and activeWindow:role() ~= "AXScrollArea" then
		return activeWindow:screen()
	else
		return hs.mouse.getCurrentScreen()
	end
end

local screenWatcher = function(_, _, _, prevScreenCount, screenCount)
	if prevScreenCount ~= nil and prevScreenCount ~= screenCount then
		hhtwm.displayLayouts = calculateDisplayLayouts()
		hhtwm.resetLayouts()
		hhtwm.tile()
	end
end

local calculateDisplayLayouts = function()
	local leftScreen = nil
	local rightScreen = nil

	for screen, position in pairs(hs.screen.screenPositions()) do
		if position.x == -1 then
			leftScreen = screen
		end
		if position.x == 0 then
			rightScreen = screen
		end
	end

	local displayLayouts = { ["Color LCD"] = "cards" }

	if leftScreen then
		displayLayouts[leftScreen:id()] = "equal-right"
	end
	if rightScreen then
		displayLayouts[rightScreen:id()] = "equal-left"
	end

	return displayLayouts
end

local calcResizeStep = function(screen)
	return 1 / hs.grid.getGrid(screen).w
end

module.setLayout = function(layout)
	hhtwm.setLayout(layout)
	hhtwm.resizeLayout()

	hs.alert.show("Switching to: " .. layout)
end

module.cycleLayout = function()
	local screen = activeScreen()

	local layouts = hhtwm.enabledLayouts

	local currentLayout = hhtwm.getLayout()
	local currentLayoutIndex = hs.fnutils.indexOf(layouts, currentLayout) or 0

	local nextLayoutIndex = (currentLayoutIndex % #layouts) + 1
	local nextLayout = layouts[nextLayoutIndex]

	module.setLayout(nextLayout)
end

module.start = function()
	local axuiWindowElement = require("hs.axuielement").windowElement
	local spaces = require("hs._asm.undocumented.spaces")

	local filters = {
		{ app = "AppCleaner", tile = false },
		{ app = "Application Loader", tile = true },
		{ app = "Activity Monitor", tile = false },
		{ app = "Archive Utility", tile = false },
		{ app = "DiskImages UI Agent", tile = false },
		{ app = "FaceTime", tile = false },
		{ app = "Finder", title = "Copy", tile = false },
		{ app = "Finder", title = "Move", tile = false },
		{ app = "Hammerspoon", title = "Hammerspoon Console", tile = true },
		{ app = "Photo Booth", tile = false },
		{ app = "QuickTime Player", tile = false },
		{ app = "Reminders", tile = false },
		{ app = "Simulator", tile = false },
		{ app = "System Preferences", tile = false },
		{ title = "Quick Look", tile = false },
	}

	hhtwm.margin = 12
	hhtwm.screenMargin = { top = 40, bottom = 8, left = 8, right = 8 }
	hhtwm.filters = filters
	hhtwm.calcResizeStep = calcResizeStep
	hhtwm.defaultLayout = "monocle"
	hhtwm.enabledLayouts = { "floating", "monocle", "main-left", "main-right", "main-center", "tabbed-left", "tabbed-right" }
	hhtwm.start()
end

module.stop = function()
	cache.watcher:release()
	hhtwm.stop()
end

return module
