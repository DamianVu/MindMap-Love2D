
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