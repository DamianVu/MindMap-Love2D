-- Initial version.
-- Features: None :)

require "CONSTANTS"
require "states/loading"
require "states/playground"
	
-- Objects
NodeScape = require "handlers/nodescape"

CTRL, ALT, SHIFT = false

function love.load()
	StateHandler = require "handlers/state-handler" -- Will always only need one
	Debugger = require "handlers/debug-handler"

	StateHandler = StateHandler:init()
	Debugger = Debugger:init()

end

function love.draw()
	Debugger:draw()

	StateHandler:drawCurrentState()
end

function love.update(dt)
	StateHandler:updateCurrentState(dt)
end

function love.keypressed(key)
	if key == 'm' then StateHandler:toggleState() end

	print("Key Pressed: "..key)
end