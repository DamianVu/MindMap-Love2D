
local link = {}

function link:new(node1, node2, type, shapeData)
	obj = {
		node1 = node1,
		node2 = node2,
		linkType = type,
		shape = shapeData
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end

function link:draw()
	love.graphics.setColor(255,255,255)
	local x1, y1 = self.node1:getPosition()
	local x2, y2 = self.node2:getPosition()
	love.graphics.line(x1, y1, x2, y2)
end

function link:getNodeIDs()
	return self.node1:getID(), self.node2:getID()
end

return link