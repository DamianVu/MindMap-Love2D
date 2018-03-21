
local statehandler = {}

function statehandler:init()
	obj = {
		currentstate = LOADING
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

return statehandler