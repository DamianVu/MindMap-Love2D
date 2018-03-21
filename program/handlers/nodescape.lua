
nodehandler = {}

function nodehandler:init(filename)
	obj = {
		node_table = {},
		currentIndex = 1
	}

	setmetatable(obj, self)
	self.__index = self

	if filename then
		self:load()
	end
	

	
	return obj
end

function nodehandler:size()
	return #self.node_table
end

function nodehandler:add_node(node)

end

function nodehandler:save(filename)

end

function nodehandler:load(filename)
	
end

return nodehandler