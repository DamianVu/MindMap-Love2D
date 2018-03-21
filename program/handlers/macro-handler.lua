
macrohandler = {}

function macrohandler:init()
	-- Load user settings if they exist. If not use defaults.
	obj = {
		macros = require "data/default-macros",
		ActionHandler = ActionHandler:init()
	}
	setmetatable(obj, self)
	self.__index = self

	print(obj.macros)
	return obj
end

function macrohandler:executeAction(key)
	command = ""
	if love.keyboard.isDown("lctrl", "rctrl") then command = command.."CTRL+" end
	if love.keyboard.isDown("lalt", "ralt") then command = command.."ALT+" end
	if love.keyboard.isDown("lshift", "rshift") then command = command.."SHIFT+" end
	command = command..key
	if self:containsMacro(command) then
		self.ActionHandler:execute(self.macros[command])
	end
end

function macrohandler:containsMacro(macro)
	for i,_ in pairs(self.macros) do
		if i == macro then return true end
	end
	return false
end

function macrohandler:test()
	print("test??")
end



return macrohandler