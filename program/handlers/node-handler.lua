
nodehandler = {}

function nodehandler:init()
	obj = {
		node_table = {},
		currentIndex = 1
	}

	setmetatable(obj, self)
	self.__index = self
	return obj
end

function nodehandler:size()
	return #self.node_table
end

function nodehandler:add_node(node)

end

return nodehandler