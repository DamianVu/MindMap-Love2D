
local node = {}

function node:new(type, nodeSize, text, x_pos, y_pos)
	math.randomseed(os.time()^2)
	obj = {
		id = generateID(NODE_ID_LENGTH),
		nodeType = type,
		size = nodeSize,
		mainText = text,
		bgColor = {math.random(255),math.random(255),math.random(255)},
		borderColor = {math.random(255),math.random(255),math.random(255)},
		x = x_pos,
		y = y_pos
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function node:setPosition(x,y)

end

function node:getPosition()
	return self.x, self.y
end

function node:getID()
	return self.id
end

function node:draw()
	-- Draw Node background
	love.graphics.setColor(self.bgColor)
	love.graphics.circle("fill", self.x - self.size/2, self.y - self.size/2, self.size)

	-- Draw Node border
	love.graphics.setColor(self.borderColor)
	love.graphics.circle("line", self.x - self.size/2, self.y - self.size/2, self.size)

	-- Draw Centerpoint in WHITE
	love.graphics.setColor(255,255,255)
	--love.graphics.circle("fill", self.x - self.size/2, self.y - self.size/2, 1)

	love.graphics.print(self.id, self.x - 50, self.y + self.size/2)

end

return node