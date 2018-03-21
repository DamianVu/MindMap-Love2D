
local node = {}

function node:new()
	obj = {
		id = Node_Handler:getNewID()
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function node:setPosition()

end

return node