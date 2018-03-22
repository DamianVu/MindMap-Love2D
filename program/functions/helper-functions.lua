
-- Contains many functions that are generic and can be utilized later on.

function contains(table, val)
	if not table then 
		print("Attempted to access invalid table in function contains(table, val)")
		return
	end
	for i=1, #table do
		if table[i] == val then 
			return true 
		end
	end
	return false
end

characters = {}
for i = 48, 90 do
	characters[#characters + 1] = string.char(i)
end
for i = 97, 126 do
	characters[#characters + 1] = string.char(i)
end

-- Yay recursion
function generateID(length)
    if length <= 0 then 
    	return '' 

    end
    -- Possibly overkill to change it every iteration of the recursion?????
    math.randomseed(os.clock()^3) 

    return generateID(length - 1) .. characters[math.random(1, #characters)]
end