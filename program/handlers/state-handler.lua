
local statehandler = {}

function statehandler:init()
	obj = {
		LOADING = "Loading",
		MAINMENU = "Main Menu",
		OPENMENU = "Open Nodescape",
		LOADMENU = "Loading Nodescape",
		EDITOR = "Editing Nodescape",
		PLAYGROUND = "Damian's Playground",
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function statehandler:default()
	self.currentstate = self.PLAYGROUND
end

function statehandler:getCurrentState()
	return self.currentstate
end

function statehandler:drawCurrentState()
	local s = self.currentstate

	if s == self.LOADING then
		loadingDraw()
	elseif s == self.PLAYGROUND then
		playgroundDraw()
	end
end

function statehandler:updateCurrentState(dt)
	local s = self.currentstate

	if s == self.LOADING then
		loadingUpdate(dt)
	elseif s == self.PLAYGROUND then
		playgroundUpdate(dt)
	end
end

-- Strictly debug functions

function statehandler:toggleState()
	if self.currentstate == self.PLAYGROUND then
		self.currentstate = self.LOADING
	else
		self.currentstate = self.PLAYGROUND
	end
end

return statehandler