-- Initial version.
-- Features: None :)

require "CONSTANTS"

CTRL, ALT, SHIFT = false

function love.load()
	NodeHandler = require "handlers/node-handler"
	StateHandler = require "handlers/state-handler"

	StateHandler = StateHandler:init()
end

function love.draw()

end

function love.update(dt)

end