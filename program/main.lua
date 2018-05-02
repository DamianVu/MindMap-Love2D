-- Progress for Release 1
-- Goals: Basic Node Creation, Basic link creation, saving and loading with positions

require "data/CONSTANTS"
require "data/default-settings"
require "functions/helper-functions"
require "functions/debug-functions"
require "functions/action-functions"
require "states/loading"
require "states/playground"

-- Handlers
ActionHandler = require "handlers/action-handler"
StateHandler = require "handlers/state-handler"
Debugger = require "handlers/debug-handler"
MacroHandler = require "handlers/macro-handler"
NodeScape = require "handlers/nodescape"
	
-- Objects
Node = require "objects/node"
Link = require "objects/link"

function love.load()
	-- ORDER MATTERS
	StateHandler = StateHandler:init()
	StateHandler:default()
	Debugger = Debugger:init()
	MacroHandler = MacroHandler:init()

	NodeScape = NodeScape:init()

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