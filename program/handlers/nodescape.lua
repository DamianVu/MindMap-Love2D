
nodescape = {}

function nodescape:init(filename)
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

function nodescape:draw()
	-- Iterate through and draw all nodes
	-- Iterate through and draw all links

	for i = 1, #self.node_table do
		self.node_table[i]:draw()
	end
end

function nodescape:size()
	return #self.node_table
end

-- Use-case
--	User presses button/macro to generate node
--	Check settings for which type of node ot make (in node constructor or here???)
-- 	Generate that node and display it to the screen
function nodescape:addNode(x,y)
	self.node_table[#self.node_table + 1] = Node:new(DEFAULT_NODE_TYPE, DEFAULT_NODE_SIZE, DEFAULT_NODE_TEXT, math.random(300, 1700), math.random(200, 800))
end

function nodescape:save(filename)

end

function nodescape:load(filename)
	
end



return nodescape