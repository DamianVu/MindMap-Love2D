
actionhandler = {}

function actionhandler:init()
	obj = {
		actions = require "data/default-actions"
	}
	setmetatable(obj, self)
	self.__index = self

	return obj
end

function actionhandler:execute(action)
	-- Ideally, we should never reach this if an action does not exist!
	self.actions[action]()
end

return actionhandler