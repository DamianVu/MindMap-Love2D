
local debugger = {}

function debugger:init(flags)
	local obj = {
		enabled = true
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function debugger:draw()
	if self.enabled then
		love.graphics.print("Current State: "..StateHandler:getCurrentState(), 10, 10)
	end
end

function debugger:update(dt)

end

return debugger