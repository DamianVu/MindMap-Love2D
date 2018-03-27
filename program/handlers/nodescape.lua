
nodescape = {}

function nodescape:init(filename)
	obj = {
		node_table = {},
		link_table = {},
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
	-- Iterate through and draw all links
	-- Iterate through and draw all nodes

	for i = 1, #self.link_table do
		self.link_table[i]:draw()
	end

	for i = 1, #self.node_table do
		self.node_table[i]:draw()
	end
end

function nodescape:getNumberOfNodes()
	return #self.node_table
end

function nodescape:getNumberOfLinks()
	return #self.link_table
end

-- Use-case
--	User presses button/macro to generate node
--	Check settings for which type of node ot make (in node constructor or here???)
-- 	Generate that node and display it to the screen
function nodescape:addNode(x,y)
	self.node_table[#self.node_table + 1] = Node:new(DEFAULT_NODE_TYPE, DEFAULT_NODE_SIZE, DEFAULT_NODE_TEXT, math.random(100, 1500), math.random(200, 800))
end

function nodescape:save(filename)

end

function nodescape:load(filename)
	
end

function nodescape:isDuplicateLink(n1, n2)

	local id1 = self.node_table[n1]:getID()
	local id2 = self.node_table[n2]:getID()
	for i = 1, #self.link_table do
		local linkID1, linkID2 = self.link_table[i]:getNodeIDs()

		if (id1 == linkID1 and id2 == linkID2) or (id1 == linkID2 and id2 == linkID1) then
			return true
		end
	end
	return false
end

function nodescape:getMaximumNumberOfLinks()
	if #self.node_table < 2 then return 0 end
	count = 1
	for i = 3, #self.node_table do
		count = count + (i - 1)
	end
	return count
end


-- Random functions for testing only

function nodescape:addRandomLink()
	if #self.link_table == self:getMaximumNumberOfLinks() then
		
		return
	end
	local count = #self.node_table
	if count < 2 then return end
	math.randomseed(os.time()^2)

	local n1 = math.random(1,count)
	local n2 = math.random(1,count)
	while n1 == n2 or self:isDuplicateLink(n1,n2) do
		n1 = math.random(1,count)
		n2 = math.random(1,count)
	end

	self.link_table[#self.link_table + 1] = Link:new(self.node_table[n1], self.node_table[n2])
end


return nodescape