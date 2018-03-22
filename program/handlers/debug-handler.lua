
local debugger = {}

function debugger:init(flags)
	local obj = {
		enabled = false
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function debugger:draw()
	if self.enabled then
		love.graphics.setColor(255,255,255)
		love.graphics.print("Debug Info", 10, 10)
		love.graphics.print("Current State: "..StateHandler:getCurrentState(), 10, 30)
		love.graphics.print("Node Count: "..NodeScape:size(), 10, 50)
	end
end

function debugger:update(dt)

end

function debugger:toggle()
	self.enabled = not self.enabled
end

return debugger