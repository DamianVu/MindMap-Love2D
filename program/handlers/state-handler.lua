
local statehandler = {}

function statehandler:init()
	obj = {
		currentstate = PLAYGROUND
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function statehandler:getCurrentState()
	return self.currentstate
end

function statehandler:drawCurrentState()
	local s = self.currentstate

	if s == LOADING then
		loadingDraw()
	elseif s == PLAYGROUND then
		playgroundDraw()
	end
end

function statehandler:updateCurrentState(dt)
	local s = self.currentstate

	if s == LOADING then
		loadingUpdate(dt)
	elseif s == PLAYGROUND then
		playgroundUpdate(dt)
	end
end

-- Strictly debug functions

function statehandler:toggleState()
	if self.currentstate == PLAYGROUND then
		self.currentstate = LOADING
	else
		self.currentstate = PLAYGROUND
	end
end

return statehandler