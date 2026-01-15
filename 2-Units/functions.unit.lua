functions = {}

function functions.floor(number)
	roundNumber = number - number % 1
	return roundNumber
end

-- struct in format of { {{0,0,0}, {0,0,0}, ...}, {...}, ... }
function functions.combineWeaponInfo(struct)
	return_info = {}
	combine_step = {}
	locationDict = {}
	for j=1, #struct do
		for i=1, #struct[j] do
			-- flip last three digits of ID to get priority; heavier weaponry will have higher single digit
			index = #return_info + 1
			if locationDict[struct[j][i][1]] == nil then
				return_info[index] = struct[j][i]
				locationDict[struct[j][i][1]] = index
			else
				--already exists, combine counts
				return_info[locationDict[struct[j][i][1]]][2] = return_info[locationDict[struct[j][i][1]]][2] + struct[j][i][2]
			end
		end
	end

	return return_info
end

function functions.averageMultiplier(struct)
	return_info = 0;
	for i=1, #struct do
		return_info = return_info + struct[i]
	end
	return return_info / #struct
end

-- in 22.5 degree steps because I shouldn't need any other values that don't multiply off of that...
function functions.rotateRecursive(posStruct,originStruct,count)
	if count <= 0 then
		return posStruct
	end
	cosVal = 0.92387953251
	sinVal = 0.38268343236
	newPos = functions.rotateRecursive(posStruct,originStruct,count-1)
	offsetPos = {x=newPos.x - originStruct.x,z=newPos.z-originStruct.z}
	return {
		x=(cosVal*offsetPos.x - sinVal*offsetPos.z + originStruct.x),
		z=(sinVal*offsetPos.x + cosVal*offsetPos.z + originStruct.z)
	}
end