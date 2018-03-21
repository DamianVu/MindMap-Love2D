
local debugger = {}

function debugger:init(flags)
	local obj = {

	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function debugger:draw()
	love.graphics.print("Current State: " )
end

function debugger:update(dt)

end

return debugger