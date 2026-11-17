functions = {}

function functions.floor(number)
	local roundNumber = number - number % 1
	if number % 1 < 0 then
		roundNumber = roundNumber - 1
	end
	return roundNumber
end
function functions.ceil(number)
	roundNumber = number - number % 1
	if number % 1 > 0 then
		roundNumber = roundNumber + 1
	end
	return roundNumber
end

-- struct in format of { {{0,0,0}, {0,0,0}, ...}, {...}, ... }
function functions.combineWeaponInfo(struct)
	local return_info = {}
	local combine_step = {}
	local locationDict = {}
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
	local return_info = 0;
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
	local cosVal = 0.92387953251
	local sinVal = 0.38268343236
	local newPos = functions.rotateRecursive(posStruct,originStruct,count-1)
	local offsetPos = {x=newPos.x - originStruct.x,z=newPos.z-originStruct.z}
	return {
		x=(cosVal*offsetPos.x - sinVal*offsetPos.z + originStruct.x),
		z=(sinVal*offsetPos.x + cosVal*offsetPos.z + originStruct.z)
	}
end

-- takes and returns {x,y,z}
-- not actually evenly distributed, but it's much faster for that
function functions.randomPointOnOvaloid(dimensions)
	local unitSpherePoint = functions.randomPointOnUnitSphere();
	return {
		unitSpherePoint[1]*dimensions[1],
		unitSpherePoint[2]*dimensions[2],
		unitSpherePoint[3]*dimensions[3]
	}
end

function functions.randomPointOnUnitSphere()
	local randZ = math.random() * 2 - 1       --[-1, 1]
    local randTheta = math.random() * 2 * math.pi -- [0, 2*pi]
    
    local sqrtOneMinusZ2 = math.sqrt(1 - randZ * randZ)
    local x = sqrtOneMinusZ2 * math.cos(randTheta)
    local y = sqrtOneMinusZ2 * math.sin(randTheta)
    local z = randZ
	return {x,y,z}
end