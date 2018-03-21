-- Initial version.
-- Features: None :)

require "CONSTANTS"
require "functions/helperFunctions"
require "functions/debugFunctions"
require "states/loading"
require "states/playground"

ActionHandler = require "handlers/action-handler"
StateHandler = require "handlers/state-handler"
Debugger = require "handlers/debug-handler"
MacroHandler = require "handlers/macro-handler"
	
-- Objects
NodeScape = require "handlers/nodescape"

function love.load()
	-- ORDER MATTERS
	StateHandler = StateHandler:init()
	Debugger = Debugger:init()
	MacroHandler = MacroHandler:init()
end

function love.draw()
	Debugger:draw()

	StateHandler:drawCurrentState()
end

function love.update(dt)
	StateHandler:updateCurrentState(dt)
end

function love.keypressed(key)
	-- if key == 'm' then StateHandler:toggleState() end
	if not contains(badKeys,key) then 
		MacroHandler:executeAction(key)
	end
end